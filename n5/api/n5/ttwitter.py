from pprint import pprint
from twitter import Twitter, OAuth
ACCESS_TOKEN = '930613682643628032-zqYRZ40wqRT0PmiHRsWQYztrGrkPYpg'
ACCESS_SECRET = '5ccZsudoMm2sWxNIj5wSQtnNvVbTH3xhk59qQVJIq8JeI'
CONSUMER_KEY = '0Ump2HtR3UCrjysY7aWYa4sog'
CONSUMER_SECRET = 'gMHmmHVivPDhP4rANJULS5DpoeGuJE81bABMqD98I7YLPNfv9M'

oauth = OAuth(ACCESS_TOKEN, ACCESS_SECRET, CONSUMER_KEY, CONSUMER_SECRET)
t = Twitter(auth=oauth)
response = t.search.tweets(q="#VadiviaCL")['statuses']
a=1
for i in response:
    pprint(i['user']['name'])
    pprint(i['user']['screen_name'])

