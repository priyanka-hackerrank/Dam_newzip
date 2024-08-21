from django.urls import reverse
import pytest


@pytest.mark.django_db
def test_health_check(client):
    print("Running the health check test...")
    response = client.get(reverse("health-check"))
    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}