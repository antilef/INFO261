import requests
import pandas as pd
#from pandas.io.json import json_normalize
import matplotlib.pyplot as plt
endpoint = "https://api.openaq.org/v1/cities"
parameters = "?country=CL"
URL = endpoint+parameters


r = requests.get(url = URL)
data = r.json()
chile_df = pd.DataFrame(data['results'])
chile_df = chile_df[["city","count"]]
chile_df = chile_df.sort_values(['count'])
#chile_df[1:10]

plt.figure(figsize=(15,6))
x = chile_df['city']
y = chile_df['count']
plt.xlabel('city')
plt.ylabel('Cantidad')
plt.title('Ciudad vs cantidad de mediciones')
plt.xticks(rotation=90)
plt.bar(x,y)
