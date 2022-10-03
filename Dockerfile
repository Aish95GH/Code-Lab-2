
#as of sep29th 2022
FROM python:3.10.7

RUN apt-get update && apt-get install wget
RUN pip3 install jupyter

ENV JUPYTER_USER our_user

RUN useradd -m $JUPYTER_USER

RUN mkdir /home/$JUPYTER_USER/notebooks

RUN wget https://raw.githubusercontent.com/mschermann/forensic_accounting/master/Introduction.ipynb -P ./home/$JUPYTER_USER/notebooks/
RUN wget https://raw.githubusercontent.com/Aish95GH/Code-Lab-2/main/requirements.txt -P ./home/$JUPYTER_USER/notebooks/

RUN pip3 install -r ./home/$JUPYTER_USER/notebooks/requirements.txt

WORKDIR /home/${JUPYTER_USER}/notebooks/

EXPOSE 8888

USER ${JUPYTER_USER}

CMD jupyter notebook --ip=0.0.0.0 --port 8888 --allow root
