import pymongo
from pymongo import MongoClient
from pprint import pprint
import requests
import pandas as pd
endpoint ="https://api.openaq.org/v1/measurements"
parameters=""
URL = endpoint + parameters
client = MongoClient('localhost',27017)

db = client['notebook5_db']

collection = db['personas']
"""
aDocument = {"Nombre":"Juan", "Edad":23, "Asignaturas":["INFO261", "INFO267", "INFO268"] }
otherDocument = {"Nombre":"Maria", "Edad":24, "Asignaturas":["INFO261", "INFO267", "INFO268", "INFO331"] }
collection.insert_many([aDocument,otherDocument])
print(collection.count_documents({"Edad":23}))
for doc in collection.find({"Edad":23}):
    pprint(doc)
"""
r = requests.get(url=URL)
data = r.json();


chile_df = pd.DataFrame(data['results'])
valdivia = chile_df[(chile_df.city=='Valdivia')]
print(valdivia)
