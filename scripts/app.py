import sys
from pathlib import Path
import argparse

from aiohttp import web

sys.path.append(str(Path().resolve().parent))
from application.factory import create_app


parser = argparse.ArgumentParser()
parser.add_argument('--path')
parser.add_argument('--port')


if __name__ == '__main__':
    app = create_app()
    args = parser.parse_args()
    web.run_app(app, path=args.path, port=args.port)
