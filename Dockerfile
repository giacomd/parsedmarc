FROM gitlab-registry.cern.ch/linuxsupport/alma9-base

WORKDIR /app
COPY parsedmarc/ parsedmarc/
COPY README.md pyproject.toml ./

RUN dnf -y install pip python3-gobject gobject-introspection libsecret
RUN pip install -U pip
RUN pip install hatch
RUN hatch build
RUN pip install dist/*.whl

ENTRYPOINT ["parsedmarc"]
