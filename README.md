python-web-base
===============

Base dockerfile for python web applications requiring a database.

# Usage

Write a dockerfile that extends this image:
```
FROM quay.io/dukegcb/python-web-base:2.7-onbuild

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

```

Build it:

```
docker build -t myapp .
```

App source code will be placed in `/app`
