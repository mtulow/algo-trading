import pytest
import requests

def test_app():
    assert True
    assert not False

def test_response():
    response = requests.get('https://localhost:8000')
    assert response.status_code == 200
    assert response.text == 'Hello, World!'


    