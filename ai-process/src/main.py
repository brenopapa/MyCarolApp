import os, time, requests

task = os.environ["LONGTASKID"]
token = os.environ["CAROLAPPOAUTH"]
connector = os.environ["CAROLCONNECTORID"]
env_domain = os.environ["ENV_DOMAIN"]
carol_tenant = os.environ["CAROLTENANT"]
carol_domain = os.environ["CAROLDOMAIN"]
api_subdomain = os.environ["API_SUBDOMAIN"]

# Tempo total (10 minutos) em segundos
tempo_total = 60 * 60

# Intervalo de 10 segundos
intervalo = 10

# Loop que executa durante 10 minutos, com intervalo de 10 segundos
inicio = time.time()
while time.time() - inicio < tempo_total:
    
    log = [{
            "mdmTaskId": task,
            "mdmLogMessage": f"TASK EXECUTANDO!!! ... {time.time()}",
            "mdmLogLevel": "INFO"
        }]
    
    url = f"https://{api_subdomain}.{carol_domain}/api/v3/tasks/{task}/logs"

    print("Enviando log:", log)
    print("Para o endpoint:", url)

    requests.post(
        url,
        headers={
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Auth-Key': token,
            'X-Auth-ConnectorId': connector,
        },
        data=log)
    
    time.sleep(intervalo)  # Espera 10 segundos antes de repetir


