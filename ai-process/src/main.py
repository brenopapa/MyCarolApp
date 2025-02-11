from pycarol import Carol, Tasks
import os, time

carol = Carol()

task = Tasks(carol).get_task(os.environ["LONGTASKID"])

# Tempo total (10 minutos) em segundos
tempo_total = 10 * 60

# Intervalo de 10 segundos
intervalo = 10

# Loop que executa durante 10 minutos, com intervalo de 10 segundos
inicio = time.time()
while time.time() - inicio < tempo_total:
    task.add_log(log_message=f"TASK EXECUTANDO!!! ... {time.time()}", log_level="INFO")
    time.sleep(intervalo)  # Espera 10 segundos antes de repetir


