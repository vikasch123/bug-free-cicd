import pytest
import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from app import app  # Now it should correctly find app.py

@pytest.fixture
def client():
    app.config["TESTING"] = True
    app.config["WTF_CSRF_ENABLED"] = False
    with app.test_client() as client:
        with app.app_context():
            yield client

def test_home_page(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"Todo List" in response.data
