FROM python:2.7
ADD . /myapp
WORKDIR /myapp
RUN pip install -r app/requirements.txt
CMD python app/app.py
