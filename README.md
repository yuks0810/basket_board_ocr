# basket_board_ocr

## 環境構築
```
$ git clone <git url>
$ docker-compose up --build
```

http://127.0.0.0:3000/ にアクセスでページが表示される

## generate command

### controller作成
dockerのコンテナ内に入ってコマンドを実行しても作成されるが、`docker-compose run`コマンドで外から実行の方が効率が良い。

### Dockerコンテナの外から実行

```
$ docker-compose run web bin/rails g controller <controller name>
```

### Dockerコンテナ内に入って実行

#### コンテナに入る

```
$ docker exec -it web bash
```

#### generate 実行

```
$ bin/rails g controller <controller name>
```

## System Dependencies
### Ruby version
`ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin20]`

### Database
`mysql  Ver 8.0.22 for osx10.15 on x86_64 (Homebrew)`

### Docker
```
$ docker -v
Docker version 20.10.2, build 2291f61
```

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## フロントエンド
- jQuery

## バックエンド
- Rails

## テスト
- Rspec
