# tdocker

A starter Docker project with automatic image publishing through GitHub Actions.

## Run locally

```sh
docker build -t tdocker .
docker run --rm tdocker
```

The starter container prints this README and exits. Replace the Dockerfile's
copy and command instructions when application code is added.

## Automatic publishing

The workflow in `.github/workflows/docker-publish.yml` builds and runs the
container on pull requests. Pushes to `main` also publish these image tags:

- `ghcr.io/masoudi00/tdocker:latest`
- `ghcr.io/masoudi00/tdocker:<commit-sha>`
- `docker.io/<dockerhub-username>/tdocker:latest`
- `docker.io/<dockerhub-username>/tdocker:<commit-sha>`

You can also run the workflow manually from the repository's Actions tab.

Docker Hub publishing requires two repository Actions secrets:

- `DOCKERHUB_USERNAME`: your Docker Hub username.
- `DOCKERHUB_TOKEN`: a Docker Hub personal access token with Read & Write permission.

The workflow reads the username from the secret to choose your Docker Hub
repository. Missing secrets or invalid credentials cause the publishing step
to fail. No credentials are committed to the repository.

GitHub automatically supplies `${{ secrets.GITHUB_TOKEN }}` for each run.
The workflow grants it `packages: write` permission to publish to GitHub
Container Registry. No personal token or token file is needed. Keep any future
credentials in **Settings > Secrets and variables > Actions**, never in source
files or the Docker image.

To run the published image:

```sh
docker run --rm ghcr.io/masoudi00/tdocker:latest
```

New packages may be private. For anonymous pulls, change the package visibility
to public in its GitHub package settings; otherwise authenticate to GHCR first.
