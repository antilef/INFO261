import flask
import json
from flask import request,jsonify
import mysql.connector

app = flask.Flask(__name__)
con = mysql.connector.connect(user="root",host="localhost",password="DaVS7a18*")
cursor = con.cursor()
cursor.execute('USE smartparking')
@app.route('/',methods=['GET'])
def home():
    return "<h1>Hello to smartparking API</h1>"

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found</p>",404

@app.route('/v1/resources/cities/all',methods=['GET'])
def cities_all():
    result = cursor.execute('SELECT * from cities')
    all_cities = cursor.fetchall()
    row_headers = [x[0] for x in cursor.description]

    json_response=[]
    for result in all_cities:
        json_response.append(dict(zip(row_headers,result)))
    return jsonify(json_response)

@app.route('/v1/resources/streets/all',methods=['GET'])
def streets_all():
    result = cursor.execute('SELECT * from streets')
    all_streets = cursor.fetchall()
    row_headers = [x[0] for x in cursor.description]

    json_response=[]
    for result in all_streets:
        json_response.append(dict(zip(row_headers,result)))
    return jsonify(json_response)

@app.route('/v1/resources/parkings/all')
def parkings_all():
    result = cursor.execute('SELECT * from parkings')
    all_parkings = cursor.fetchall()
    row_headers = [x[0] for x in cursor.description]

    json_response=[]
    for result in all_parkings:
        json_response.append(dict(zip(row_headers,result)))
    return jsonify(json_response)
@app.route('/v1/resources/parkings',methods=['GET'])
def parkings():
    query_parameters = request.args

    query = 'SELECT * from parkings WHERE '
    available = query_parameters.get('available')
    to_filter=[]

    if available :
        query += ' available = %s'
        to_filter.append(available)
    else:
        return page_not_found(404)

    results = cursor.execute(query,to_filter)
    some_parkings= cursor.fetchall()

    row_headers = [x[0] for x in cursor.description]
    json_response =[]

    for result in some_parkings:
        json_response.append(dict(zip(row_headers,result)))
    return jsonify(json_response)
@app.route('/v1/resources/streets',methods=['GET'])
def streets():
    query_parameters = request.args
    id_parking = query_parameters.get('parkings')
    id_street = query_parameters.get('street')
    if(id_parking and id_street):
        query='SELECT * from streets as t1 INNER JOIN parkings as t2 ON %s=%s'
        to_filter =[id_street,id_parking]
        results = cursor.execute(query,to_filter)
        some_parkings= cursor.fetchall()

        row_headers = [x[0] for x in cursor.description]
        json_response =[]

        for result in some_parkings:
            json_response.append(dict(zip(row_headers,result)))
        return jsonify(json_response)

    else:
        return page_not_found(404)
app.run(debug=True,port=3000)