FROM python:3.13.5-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file and install them
# This is done in a separate step to leverage Docker's layer caching.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application source code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
