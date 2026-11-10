# Python runtime

Minimal Debian runtime with Python 3.14 free-threaded. uv 0.11.6 is used
only in the builder stage and is not included in the final image.
Python tracks the latest 3.14t patch available to this uv release.

Build locally:

```sh
docker build -t python-runtime:3.14t .
docker run --rm python-runtime:3.14t python --version
```

Both `python` and `python3` use this interpreter. Virtual environments work
with `python -m venv`.

Suggested release tag: `python-3.14t`.
A Git tag must point to the commit containing this Dockerfile. Publishing an
image from that tag requires a configured registry build or CI workflow.
