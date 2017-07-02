# rails-review-apps

rails app + docker + registrator + consul + nginx = review apps

## Get started
- Generate ssh key
- Add your public key to GitHub Deploy keys
- Copy .env_sample to .env
- Set variables in .env
- Set ruby version in `app_server/Dockerfile:9`
- Copy your private key to app_server directory
- Build an image `docker build -t app_server .`
- Add staging section to your `config/database.yml` according to `database_sample.yml`
