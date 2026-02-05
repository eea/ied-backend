FROM eeacms/plone-backend:6.1.3-11

# Custom plone.volto version fixes for:
# https://taskman.eionet.europa.eu/issues/284346#note-8
COPY requirements.txt constraints.txt /app/
COPY ./etc/zodbpack.conf /app/etc/zodbpack.conf

RUN ./bin/pip install -r requirements.txt -c constraints.txt \
 && ./bin/pip install -f https://eggrepo.eea.europa.eu/simple/ plone.volto==4.4.5.dev1 \
 && ./bin/pip install git+https://github.com/eea/pas.plugins.eea@fix-installation \
 && find /app -not -user plone -exec chown plone:plone {} \+
