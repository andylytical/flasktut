accesslog = '-'
loglevel = 'debug'
bind = '0.0.0.0:8000'
# bind = ':8000'

# from https://pythonspeed.com/articles/gunicorn-in-docker/
worker_tmp_dir = "/dev/shm"
workers = 2
