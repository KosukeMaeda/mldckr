FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        libbz2-dev \
        libffi-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        # libssl1.0-dev \
        libssl-dev \
        llvm \
        make \
        netbase \
        pkg-config \
        tk-dev \
        wget \
        xz-utils \
        zlib1g-dev \
        emacs \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone git://github.com/yyuu/pyenv.git .pyenv
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

ENV HOME  /
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pyenv install 3.6.4 && pyenv global 3.6.4

RUN pip install numpy tensorflow-gpu keras scikit-learn jupyter opencv-python opencv-contrib-python jupyter-tensorboard pipenv
RUN jupyter notebook --generate-config \
 && echo "c.NotebookApp.ip = '0.0.0.0'" >> /.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.token = ''" >> /.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.allow_root = True" >> /.jupyter/jupyter_notebook_config.py
