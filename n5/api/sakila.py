import flask
import json
from flask import request,jsonify
import mysql.connector

app=flask.Flask(__name__)
conn = mysql.connector.connect(user="root",host="localhost",password="DaVS7a18*")
cursor = conn.cursor()
cursor.execute('USE sakila')
@app.route('/',methods=['GET'])
def home():
    return "<h1>API sakila</h1>"

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found</p>",404

@app.route('/api_sakila/v1/resources/films/all',methods=['GET'])
def api_all():
    result = cursor.execute('SELECT film_id,title,description,release_year,language_id FROM film;')
    all_films = cursor.fetchall()
    row_headers=[x[0] for x in cursor.description]

    json_data=[]
    for result in all_films:
        json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)




@app.route('/api_sakila/v1/resources/films', methods=['GET'])
def api_filter():
    ## Definir parametros posibles
    query_parameters = request.args

    release_year = query_parameters.get('release_year')
    language_id = query_parameters.get('language_id')
    film_id=query_parameters.get('film_id')
    ##Construir la consulta SQL según parametros
    query = "SELECT film_id,title,description,release_year,language_id FROM film WHERE"
    to_filter = []

    if release_year:
        query += ' release_year=%s AND'
        to_filter.append(release_year)
    if language_id:
        query+= ' language_id=%s AND'
        to_filter.append(language_id)
    if film_id:
        query+= ' film_id=%s AND'
        to_filter.append(film_id)
    ##if not (release_year):
    ##    return page_not_found(404)
    #print("aqui esta antes del -4 "+query)
    query = query[:-4] + ';'

	print(query)
    print(to_filter)

        ## Consultar
    results=cursor.execute(query,to_filter)
    some_films =cursor.fetchall()
    #print(some_films[0])
    ## Conservar el nombre de los atributos
    p=cursor.description[1]
    row_headers=[x[0] for x in cursor.description]
    #print(row_headers)
    ## Transformar resultados en datos JSON
    json_data=[]
    for result in some_films:
        json_data.append(dict(zip(row_headers,result)))
    #print(json_data[0])
    return jsonify(json_data)
app.run(debug=False,port=1234)
