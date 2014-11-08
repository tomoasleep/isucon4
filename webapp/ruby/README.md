# 起動
bundle install
foreman start

# Capistrano
## ベンチマーク
bundle exec cap production bench
## デプロイ
bundle exec cap production deploy
