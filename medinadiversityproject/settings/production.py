from .base import *

DEBUG = False

ALLOWED_HOSTS = [
        '.medinadiversityproject.org'
        ]

with open('/usr/local/secret/medinadiveristyproject/secretkey.txt') as f:
    SECRET_KEY = f.read().strip()

try:
    from .local import *
except ImportError:
    pass

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/www/webapps/medinadiversityproject/log/django/debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
