FROM python:2.7
ADD . /myapp
WORKDIR /myapp
RUN pip install -r requirements.txt
CMD python app.py
