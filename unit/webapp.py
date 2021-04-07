from pathlib import Path
import sys
import asyncio


activate = Path() / '.venv/bin/activate_this.py'
with open(activate.resolve()) as file_:
    exec(file_.read(), dict(__file__=activate.resolve()))


sys.path.append(str(Path().resolve()))
from application import create_app


app = asyncio.run(create_app(lambda: asyncio.new_event_loop()))
