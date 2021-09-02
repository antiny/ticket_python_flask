import os

db_host = os.environ.get('DB_HOST', 'db')
db_port = os.environ.get('DB_PORT', '5432')
db_name = os.environ.get('DB_NAME', 'postgres')
db_username = os.environ.get('DB_USERNAME', 'postgres')
db_password = os.environ.get('DB_PASSWORD', 'password')

SQLALCHEMY_DATABASE_URI = f"postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}"
