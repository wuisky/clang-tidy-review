FROM osrf/ros:noetic-desktop-full

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends\
    build-essential cmake git \
    tzdata \
    clang-tidy \
    clang-tidy-10 \
    clang-tidy-11 \
    clang-tidy-12 \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/

COPY . /clang_tidy_review/

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install chardet && \
    python3 -m pip install /clang_tidy_review/post/clang_tidy_review

ENTRYPOINT ["review"]
