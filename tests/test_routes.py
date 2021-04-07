from application import create_app


async def test_root(aiohttp_client, loop):
    app = await create_app(loop)
    client = await aiohttp_client(app)
    response = await client.get('/')
    assert response.status == 200
    text = await response.text()
    assert 'Hello' in text
