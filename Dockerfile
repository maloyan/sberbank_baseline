FROM kaggle/python

RUN pip install tqdm pymystem3
RUN pip install dawg https://github.com/kmike/pymorphy2/archive/master.zip pymorphy2-dicts-ru
RUN pip install -U pymorphy2-dicts-ru
RUN curl -sL https://github.com/dangerink/udpipe/archive/load_binary.zip -o /tmp/udpipe.zip &&     cd /tmp &&     unzip -qo /tmp/udpipe.zip  &&     cd /tmp/udpipe-load_binary/releases/pypi &&     ./gen.sh 1.2.0.1.0 &&     cd ufal.udpipe &&     python setup.py install &&     cd /tmp &&     rm -rf /tmp/udpipe*

RUN python -c "import pymystem3.mystem ; pymystem3.mystem.autoinstall()"

RUN pip install jellyfish
