# Usa a imagem Python slim-buster
FROM python:3.9-slim-buster

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia todos os arquivos da pasta src para a pasta /app dentro do contêiner
COPY src/ /app/

# Faz a instalação de dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Define o comando para rodar o script main.py
CMD ["python", "main.py"]
