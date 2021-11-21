FROM nvcr.io/nvidia/pytorch:19.10-py3

RUN pip install --no-cache-dir runx==0.0.6
RUN pip install --no-cache-dir numpy
RUN pip install --no-cache-dir sklearn
RUN pip install --no-cache-dir h5py
RUN pip install --no-cache-dir jupyter
RUN pip install --no-cache-dir scikit-image
RUN pip install --no-cache-dir pillow
RUN pip install --no-cache-dir piexif
RUN pip install --no-cache-dir cffi
RUN pip install --no-cache-dir tqdm
RUN pip install --no-cache-dir dominate
RUN pip install --no-cache-dir opencv-python
RUN pip install --no-cache-dir nose
RUN pip install --no-cache-dir ninja

RUN apt-get update && apt-get install libgtk2.0-dev -y && rm -rf /var/lib/apt/lists/*

# Install Apex
WORKDIR /home/runner
RUN cd /home/runner && git clone https://gitee.com/hyuyao/apex.git apex && cd apex && git checkout f3a960f80244cf9e80558ab30f7f7e8cbf03c0a0 && python setup.py install --cuda_ext --cpp_ext
