FROM python:3.9-buster

WORKDIR /tww-rando-bot

ENV QT_QPA_PLATFORM=offscreen

RUN apt-get update && apt-get install -y \
  libegl1 \
  libgl1-mesa-glx \
  libxkbcommon-x11-0 \
  libdbus-1-3

COPY . .

RUN pip install --upgrade pip

RUN cd wwrando && python -m venv /venv/wwrando --upgrade-deps && /venv/wwrando/bin/pip install --no-cache-dir -r requirements.txt

RUN cd wwrando-dev-tanjo3 && python -m venv /venv/wwrando-dev-tanjo3 --upgrade-deps && /venv/wwrando-dev-tanjo3/bin/pip install --no-cache-dir -r requirements.txt

RUN cd wwrando-s5-tournament && python -m venv /venv/wwrando-s5-tournament --upgrade-deps && /venv/wwrando-s5-tournament/bin/pip install --no-cache-dir -r requirements.txt

RUN cd wwrando-random-settings && python -m venv /venv/wwrando-random-settings --upgrade-deps && /venv/wwrando-random-settings/bin/pip install --no-cache-dir -r requirements.txt

RUN pip install -e .
