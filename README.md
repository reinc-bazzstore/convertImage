# convertImage

## コンテナ作成方法</br>

```
git clone "https://github.com/reinc-bazzstore/convertImage"
cd convertImage
docker-compose up --build -d
```

## 使い方

画像ファイルを用意

ファイル名は`input.jpg`であること

```
python3 (実行したいpythonファイル)
```

# 概要と各項目説明

## アプリケーション名

convertImage

## アプリケーション概要

- convert_image.py

  画像の白抜き

- remove_background.py

  画像の背景透過

## Dockerfile

`workspace`にファイルをコピー

`requirements.txt`からライブラリをインポート

## docker-compose.yml

- `stdin_open: true`

  ホストマシンの標準入力とコンテナを繋ぐオプションで、true にするとホストマシンでの入力がコンテナに伝えることができるようになる。

- `tty: true`

  ホストマシンの標準出力とコンテナを繋ぐオプションで、true にするとコンテナの出力をホストマシンで確認できるようになる。

上記を記述することでコンテナを起動させ続けることができる。
