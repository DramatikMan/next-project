from application import create_app


async def test_root(aiohttp_client, loop):
    client = await aiohttp_client(create_app)
    response = await client.get('/')
    assert response.status == 200
    text = await response.text()
    assert 'Hello' in text
