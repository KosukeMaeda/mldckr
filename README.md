# mldckr
機械学習用のdockerコンテナ


## こんな人むけ
 - すでにある機械学習用のコンテナはpythonのバージョンが固定されていて使いにくい！
 - cudaとかcudnnとかのバージョンが複雑でどれを選べばいいかわからん！


## get started
### コマンドラインから実行したい
```bash
docker pull mariimo/mldckr
nvidia-docker run -it --rm -v ${マウントしたいディレクトリのフルパス}:/projects mariimo/mldckr bash
```

### jupyterを使いたい
```bash
docker pull mariimo/mldckr
nvidia-docker run -d -it --rm -v -p 8931:8888 ${マウントしたいディレクトリのフルパス}:/projects mariimo/mldckr jupyter notebook
```
http://${hostname}:8931 にアクセスすればjupyterが開く

8931の部分は自分の好きなポート番号を指定するべし。

コンテナを停止させるのは
```bash
docker stop ${container id}
```
container idは`docker ps -a`で探す

#### tips
tensorflowやkerasを使っている人ならこんな使い方ができる
->https://github.com/lspvic/jupyter_tensorboard#usage


## required
- docker
- nvidia-docker https://github.com/NVIDIA/nvidia-docker
- cuda9.0以上対応のgpu
