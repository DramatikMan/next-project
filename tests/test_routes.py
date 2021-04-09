from application.factory import create_app


async def test_root(aiohttp_client):
    app = create_app()
    client = await aiohttp_client(app)
    response = await client.get('/')
    assert response.status == 200
    text = await response.text()
    assert 'Hello' in text
