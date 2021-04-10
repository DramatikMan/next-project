pip install supervisor
echo_supervisord_conf > /etc/supervisord.conf

echo $'
[program:aiohttp]
directory=/project
numprocs=4
numprocs_start=1
process_name=aiohttp_%(process_num)s
command=pipenv run python app.py --path=/tmp/aiohttp/%(process_num)s.sock
autostart=true
autorestart=true' >> /etc/supervisord.conf

supervisord \
--configuration=/etc/supervisord.conf \
--nodaemon
