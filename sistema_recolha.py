import csv
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="root",
    database="belostransportes"
)

cursor = db.cursor()

csv_files = ["viagem.csv", "motorista.csv", "passageiro.csv", "percurso.csv",
             "paragem.csv", "percursoparagem.csv", "passemensal.csv", "autocarro.csv"]


def inserir_dados_viagem(data, duracao, distancia, custo, percurso, passageiro, motorista, paragem_inicial, paragem_final):
    query = "INSERT INTO Viagem (DataHora, Duracao, Distancia, Custo, fk_Percurso, fk_Passageiro, fk_Motorista, fk_ParagemInicial, fk_ParagemFinal)VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
    values = (data, duracao, distancia, custo, percurso,
              passageiro, motorista, paragem_inicial, paragem_final)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_motorista(nome, nif, rua, localidade, cidade, codPostal, salario, iban):
    query = "INSERT INTO Motorista (Nome, NIF, Rua, Localidade, Cidade, CodigoPostal, Salario, IBAN) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    values = (nome, nif, rua, localidade, cidade, codPostal, salario, iban)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_passageiro(nome, nif, rua, codPostal, localidade, cidade, contacto):
    query = "INSERT INTO Passageiro (Nome, NIF, Rua, CodPostal, Localidade, Cidade, Contacto) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    values = (nome, nif, rua, codPostal, localidade, cidade, contacto)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_percurso(duracao, tipo):
    query = "INSERT INTO Percurso (Duracao, Tipo) VALUES (%s, %s)"
    values = (duracao, tipo)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_paragem(nome, rua, localidade, cidade, codPostal, latitude, longitude):
    query = "INSERT INTO Paragem (Nome, Rua, Localidade, Cidade, CodigoPostal, Latitude, Longitude) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    values = (nome, rua, localidade, cidade, codPostal, latitude, longitude)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_percursoparagem(paragem, percurso, hora):
    query = "INSERT INTO PercursoParagem (fk_Paragem, fk_Percurso, Hora) VALUES (%s, %s, %s)"
    values = (paragem, percurso, hora)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_passemensal(tipo, custo, passageiro):
    query = "INSERT INTO PasseMensal (Tipo, Custo, fk_Passageiro) VALUES (%s, %s, %s)"
    values = (tipo, custo, passageiro)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


def inserir_dados_inserir_autocarro(marca, matricula, capacidade, modelo, motorista):
    query = "INSERT INTO Autocarro (Marca, Matricula, Capacidade, Modelo, fk_Motorista) VALUES (%s, %s, %s, %s, %s)"
    values = (marca, matricula, capacidade, modelo, motorista)
    cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    cursor.execute(query, values)
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")


try:
    for file_name in csv_files:
        with open(file_name, 'r') as arquivo_csv:
            leitor_csv = csv.reader(arquivo_csv)
            next(leitor_csv)
            if file_name == "viagem.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    data = linha[0]
                    duracao = linha[1]
                    distancia = linha[2]
                    custo = linha[3]
                    percurso = linha[4]
                    passageiro = linha[5]
                    motorista = linha[6]
                    paragem_inicial = linha[7]
                    paragem_final = linha[8]
                    inserir_dados_viagem(data, duracao, distancia, custo, percurso,
                                         passageiro, motorista, paragem_inicial, paragem_final)
                    db.commit()

            elif file_name == "motorista.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    nome = linha[0]
                    nif = linha[1]
                    rua = linha[2]
                    localidade = linha[3]
                    cidade = linha[4]
                    codPostal = linha[5]
                    salario = linha[6]
                    iban = linha[7]
                    inserir_dados_motorista(
                        nome, nif, rua, localidade, cidade, codPostal, salario, iban)
                    db.commit()

            elif file_name == "passageiro.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    nome = linha[0]
                    nif = linha[1]
                    rua = linha[2]
                    codPostal = linha[3]
                    localidade = linha[4]
                    cidade = linha[5]
                    contacto = linha[6]
                    inserir_dados_passageiro(
                        nome, nif, rua, codPostal, localidade, cidade, contacto)
                    db.commit()

            elif file_name == "percurso.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    duracao = linha[0]
                    tipo = linha[1]
                    inserir_dados_percurso(duracao, tipo)
                    db.commit()

            elif file_name == "paragem.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    nome = linha[0]
                    rua = linha[1]
                    localidade = linha[2]
                    cidade = linha[3]
                    codPostal = linha[4]
                    latitude = linha[5]
                    longitude = linha[6]
                    inserir_dados_paragem(
                        nome, rua, localidade, cidade, codPostal, latitude, longitude)
                    db.commit()

            elif file_name == "percursoparagem.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    paragem = linha[0]
                    percurso = linha[1]
                    hora = linha[2]
                    inserir_dados_percursoparagem(paragem, percurso, hora)
                    db.commit()

            elif file_name == "passemensal.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    tipo = linha[0]
                    custo = linha[1]
                    passageiro = linha[2]
                    inserir_dados_passemensal(tipo, custo, passageiro)
                    db.commit()

            elif file_name == "autocarro.csv":
                for linha in leitor_csv:
                    # Obtém os valores das colunas
                    marca = linha[0]
                    matricula = linha[1]
                    capacidade = linha[2]
                    modelo = linha[3]
                    motorista = linha[4]
                    inserir_dados_inserir_autocarro(
                        marca, matricula, capacidade, modelo, motorista)
                    db.commit()

    print("Dados inseridos com sucesso!")

except FileNotFoundError:
    print(f"File '{file_name}' not found.")

except mysql.connector.Error as erro:
    print(f"Erro ao inserir dados no banco de dados: {erro}")

finally:
    cursor.close()
    db.close()
