# rails-review-apps
The project is currently under development.
rails apps + docker + registrator + consul + consul template + nginx = review apps

## Get started
- Generate ssh key
- Add your public key to GitHub Deploy keys
- Set ruby version in `app_server/Dockerfile:9`
- Build images `docker build -t app app && docker build -t web web`

## Copyright
Roman Krasavtsev. 2017
