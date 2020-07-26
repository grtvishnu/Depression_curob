import requests
from bs4 import BeautifulSoup
import os

result = requests.get("http://127.0.0.1:8080/face2")
soup = BeautifulSoup(result.text, "html.parser")

links = []

x = soup.find('div', class_='imgz')
print(x)
