FROM python:alpine

# Add source code in the container
COPY requirements.txt /
COPY main.py ./main.py
RUN pip install -r requirements.txt

# Define container entry point (could also work with CMD python main.py)
ENTRYPOINT ["python", "main.py"]
