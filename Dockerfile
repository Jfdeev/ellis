# Use uma imagem oficial do Python como imagem base.
# python:3.10-slim é uma boa escolha por ser leve e corresponder aos pré-requisitos do projeto.
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto.
# --no-cache-dir: Desabilita o cache do pip para manter a imagem menor.
# --upgrade pip: Garante que estamos usando a versão mais recente do pip.
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta em que a aplicação será executada.
EXPOSE 8000

# Define o comando para executar a aplicação quando o contêiner iniciar.
# Usamos --host 0.0.0.0 para tornar a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]