FROM python:3.10-alpine
ARG TARGETOS
ARG TARGETARCH
RUN OSARCH="$TARGETOS-$TARGETARCH"; if [[ "$OSARCH" = "linux-386" || "$OSARCH" = "linux-arm" ]]; then apk --no-cache add build-base python3 python3-dev python3-tkinter openssl bash git meson py3-pip sudo freetype-dev fribidi-dev harfbuzz-dev jpeg-dev lcms2-dev libimagequant-dev openjpeg-dev tcl-dev tiff-dev tk-dev zlib-dev poetry; fi
WORKDIR /app
COPY pyproject.toml poetry.lock ./
RUN pip install poetry 
RUN poetry install
COPY . .
ENV DRPP_IS_IN_CONTAINER=true
ENV DRPP_NO_PIP_INSTALL=true
CMD ["poetry", "run", "python", "main.py"]