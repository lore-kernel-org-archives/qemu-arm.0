Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp749647ejb;
        Thu, 16 Feb 2023 10:15:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+ojmSdNbpwianmuCpJpRam10d9NjLdaUdYAoNcbsS2UUijomw/lLlffPiP4UK85riLNiva
X-Received: by 2002:a0d:e6d1:0:b0:533:a231:2cf with SMTP id p200-20020a0de6d1000000b00533a23102cfmr1037339ywe.4.1676571344507;
        Thu, 16 Feb 2023 10:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676571344; cv=none;
        d=google.com; s=arc-20160816;
        b=vp4cOn9m6CJlzeSKstagFuXO5H6NqJXYdYKt36Y8VNhxXBM+zqqSEXApJuCnFl+qDr
         ba+K228MzNwc2wgZ4uWS4pyNBOQ8P2QuY8hKNE/Wn5YYY8/PtH7D8mGV50Ka16qVYoIz
         WLqcEqVkm57OJOmw0dpOhxiNTy9Vm6cR4KKOPKF940ceYk7Lz3YHiPjQ62cFFHDB9R+f
         SETEDoiGI9+rNtli6OKhr2xPu5P1hwgzt6839AKdUMiDgNK6QRpiFwGW+7xttcNTnGQ2
         BsTH6RAnYNfmS2BhE8zafq8a28dMTgm/Y28urX/bK+cKp7rD8hRkc9jIlORuirbyiykF
         qJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xjJwynRfvNz7g9of3OCkXWEXMKlAcX5hWWmY2P+c+DE=;
        b=pK4ik8VO+rH8ujSTVq3g6RdsCkKcGYvsrkbhnr9RvrlgBZnJjGwTwYxLxYUw+PZ3YJ
         m/4zhMU7W3wHBK4dMNq22p7G3L1dmeN/Z2wQcMcjbL/fz0TtZ4ScBb+qvjqiEBpCvDsA
         ztIr5u8yPGkcTksUHioFSca4fPR/l0MhgHvSGJq5S4lZV5FqxkNvvSP1nX4K3vKysFcu
         rJT80zSt5nTOu2Cpm30BE/acgHbZp31pjv1T5McuTaUtBA8WlNMy40dWftTxm9lzJtdF
         2ErbqA5T1Lu4X3I71ZSk2PY5mgz1ZDapJsBnKOYuX9qKvfkS9iASHk7gWGHUmERtLqbF
         Ihzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLgjmmCF;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o8-20020a817308000000b0052bfe6f2970si2616786ywc.10.2023.02.16.10.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 10:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLgjmmCF;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676571344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjJwynRfvNz7g9of3OCkXWEXMKlAcX5hWWmY2P+c+DE=;
	b=BLgjmmCFunVRVP3UcO6TRV1mK4nMP+ZRYlJeVwU8ggQYmyoTMq8mgdW5nQEpjIhEHd5tQb
	YD9gr1HCsoOiRU+nDF6XfmCu+zv8Fhahk0il9nhDCmQZN2IFJB6YcnHmEx0khmFLnKEuxO
	CNKGbkrSzdtNjVTnmtcGDKJmL23JNtI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-dkqzIZ4COYeDiz9lT6Sotg-1; Thu, 16 Feb 2023 13:15:43 -0500
X-MC-Unique: dkqzIZ4COYeDiz9lT6Sotg-1
Received: by mail-pl1-f198.google.com with SMTP id i3-20020a170902cf0300b00198bc9ba4edso1438967plg.21
        for <alex.bennee@linaro.org>; Thu, 16 Feb 2023 10:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjJwynRfvNz7g9of3OCkXWEXMKlAcX5hWWmY2P+c+DE=;
        b=1tKdZOvOTi+QLsBcMCG/hBsWq+6o0YvXgYOeEAqcNHCTGN9TyQeXjru2mQntf3gf1e
         rXt8kgTxoInJpwY0txyKLQc2dmOLSNq0jM784nvPsjnYOC5W7QxW8IQYnZi8mIfmLrZ/
         LbFtUJHP1RKVWm9K3hiesG8cvPK1vcqN14jwDeTJFfKqadJxyHhqmdplCv6/lB8qSOnE
         4dV6AT3GevpvwRDdjmolLU5WWKguYI24+rhQKP0DIlgj/4701aTo9yJtdJYBCoKbTv53
         Sm60XE2ALp2ZWeFoj827/gpUMrl8gE1TbjIKl1AxYufmtsfDVft+qSV2Ujdx5/w65GDT
         K5hA==
X-Gm-Message-State: AO0yUKXS+r1MNmvOUgbmxsEOnZc7oAYuIGZWFVazePbhbcNnPEFSFb12
	f5iazncPZMILVOGk8vXqRNPkX5O3iY/JcEljm6u36xPp4WCouNiWtsgKQ+zUk0/0yTmNE1uv8i9
	2GmIeS7HS0Ux/9JB675J0OZ4uvdTyWRCVWkQqEg==
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id ob6-20020a17090b390600b002342592efbemr702131pjb.131.1676571341804;
        Thu, 16 Feb 2023 10:15:41 -0800 (PST)
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr702122pjb.131.1676571341490; Thu, 16
 Feb 2023 10:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20230215192530.299263-1-alex.bennee@linaro.org> <20230215192530.299263-8-alex.bennee@linaro.org>
In-Reply-To: <20230215192530.299263-8-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Feb 2023 13:15:30 -0500
Message-ID: <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
	Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Darren Kenny <darren.kenny@oracle.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Yonggang Luo <luoyonggang@gmail.com>, 
	Li-Wen Hsu <lwhsu@freebsd.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: B2lI0+W2+MmX

On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.

We still support Ubuntu 20.04 until 2024 though, don't we? Is it safe
to not test this platform?

I've long been uncertain about what our policy actually is for docker
tests, if we want to test every platform we support or only some of
them; and if it's only some of them, when do we choose the older and
when do we choose the newer?



>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/testing.rst                        |  4 ++--
>  .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
>  .gitlab-ci.d/containers.yml                   |  4 ++--
>  .../{ubuntu2004.docker =3D> ubuntu2204.docker}  | 16 +++++---------
>  tests/docker/test-tsan                        |  2 +-
>  tests/lcitool/refresh                         | 10 +--------
>  6 files changed, 23 insertions(+), 35 deletions(-)
>  rename tests/docker/dockerfiles/{ubuntu2004.docker =3D> ubuntu2204.docke=
r} (91%)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index e10c47b5a7..309a575abe 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -574,13 +574,13 @@ https://github.com/google/sanitizers/wiki/ThreadSan=
itizerCppManual
>
>  Thread Sanitizer in Docker
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> -TSan is currently supported in the ubuntu2004 docker.
> +TSan is currently supported in the ubuntu2204 docker.
>
>  The test-tsan test will build using TSan and then run make check.
>
>  .. code::
>
> -  make docker-test-tsan@ubuntu2004
> +  make docker-test-tsan@ubuntu2204
>
>  TSan warnings under docker are placed in files located at build/tsan/.
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 8f332fc36f..be319ab2d0 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -38,9 +38,9 @@ avocado-system-alpine:
>  build-system-ubuntu:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --enable-docs --enable-fdt=3Dsystem --enable-capston=
e
>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>        microblazeel-softmmu mips64el-softmmu
> @@ -56,7 +56,7 @@ check-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      MAKE_CHECK_ARGS: check
>
>  avocado-system-ubuntu:
> @@ -65,7 +65,7 @@ avocado-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      MAKE_CHECK_ARGS: check-avocado
>
>  build-system-debian:
> @@ -459,10 +459,10 @@ avocado-cfi-x86_64:
>  tsan-build:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang-10 --cxx=3Dclang++-10
> +    IMAGE: ubuntu2204
> +    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang --cxx=3Dclang++
>            --enable-trace-backends=3Dust --enable-fdt=3Dsystem --disable-=
slirp
>      TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-u=
ser
>      MAKE_CHECK_ARGS: bench V=3D1
> @@ -471,10 +471,10 @@ tsan-build:
>  gcov:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    timeout: 80m
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --enable-gcov
>      TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
>      MAKE_CHECK_ARGS: check
> @@ -539,9 +539,9 @@ build-tci:
>  build-coroutine-sigaltstack:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --with-coroutine=3Dsigaltstack --disable-tcg
>                      --enable-trace-backends=3Dftrace
>      MAKE_CHECK_ARGS: check-unit
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 96d2a3b58b..8637a13d86 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -13,10 +13,10 @@ amd64-debian-container:
>    variables:
>      NAME: debian-amd64
>
> -amd64-ubuntu2004-container:
> +amd64-ubuntu2204-container:
>    extends: .container_job_template
>    variables:
> -    NAME: ubuntu2004
> +    NAME: ubuntu2204
>
>  amd64-opensuse-leap-container:
>    extends: .container_job_template
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/do=
ckerfiles/ubuntu2204.docker
> similarity index 91%
> rename from tests/docker/dockerfiles/ubuntu2004.docker
> rename to tests/docker/dockerfiles/ubuntu2204.docker
> index f34d88d33d..30b9e56793 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2204.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
> +#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>
> -FROM docker.io/library/ubuntu:20.04
> +FROM docker.io/library/ubuntu:22.04
>
>  RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>      apt-get update && \
> @@ -14,7 +14,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        bash \
>                        bc \
>                        bison \
> -                      bsdmainutils \
> +                      bsdextrautils \
>                        bzip2 \
>                        ca-certificates \
>                        ccache \
> @@ -36,6 +36,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        libasan5 \
>                        libasound2-dev \
>                        libattr1-dev \
> +                      libbpf-dev \
>                        libbrlapi-dev \
>                        libbz2-dev \
>                        libc6-dev \
> @@ -90,6 +91,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        libtasn1-6-dev \
>                        libubsan1 \
>                        libudev-dev \
> +                      liburing-dev \
>                        libusb-1.0-0-dev \
>                        libusbredirhost-dev \
>                        libvdeplug-dev \
> @@ -100,6 +102,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        llvm \
>                        locales \
>                        make \
> +                      meson \
>                        multipath-tools \
>                        ncat \
>                        nettle-dev \
> @@ -111,11 +114,9 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        python3-opencv \
>                        python3-pillow \
>                        python3-pip \
> -                      python3-setuptools \
>                        python3-sphinx \
>                        python3-sphinx-rtd-theme \
>                        python3-venv \
> -                      python3-wheel \
>                        python3-yaml \
>                        rpm2cpio \
>                        sed \
> @@ -139,13 +140,8 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>
> -RUN /usr/bin/pip3 install meson=3D=3D0.56.0
> -
>  ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>  ENV LANG "en_US.UTF-8"
>  ENV MAKE "/usr/bin/make"
>  ENV NINJA "/usr/bin/ninja"
>  ENV PYTHON "/usr/bin/python3"
> -# Apply patch https://reviews.llvm.org/D75820
> -# This is required for TSan in clang-10 to compile with QEMU.
> -RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/i=
nclude/sanitizer/tsan_interface.h
> diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
> index 53d90d2f79..f6d6590e39 100755
> --- a/tests/docker/test-tsan
> +++ b/tests/docker/test-tsan
> @@ -21,7 +21,7 @@ setup_tsan()
>      tsan_log_dir=3D"/tmp/qemu-test/build/tsan"
>      mkdir -p $tsan_log_dir > /dev/null || true
>      EXTRA_CONFIGURE_OPTS=3D"${EXTRA_CONFIGURE_OPTS} --enable-tsan \
> -                          --cc=3Dclang-10 --cxx=3Dclang++-10 \
> +                          --cc=3Dclang --cxx=3Dclang++ \
>                            --disable-werror --extra-cflags=3D-O0"
>      # detect deadlocks is false currently simply because
>      # TSan crashes immediately with deadlock detector enabled.
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index a5ea0efc3b..eeee9a7b34 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -69,13 +69,6 @@ def generate_cirrus(target, trailer=3DNone):
>      generate(filename, cmd, trailer)
>
>
> -ubuntu2004_tsanhack =3D [
> -    "# Apply patch https://reviews.llvm.org/D75820\n",
> -    "# This is required for TSan in clang-10 to compile with QEMU.\n",
> -    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.=
0.0/include/sanitizer/tsan_interface.h\n"
> -]
> -
> -
>  # Netmap still needs to be manually built as it is yet to be packaged
>  # into a distro. We also add cscope and gtags which are used in the CI
>  # test
> @@ -113,8 +106,7 @@ try:
>                          trailer=3D"".join(debian11_extras))
>      generate_dockerfile("fedora", "fedora-37")
>      generate_dockerfile("opensuse-leap", "opensuse-leap-153")
> -    generate_dockerfile("ubuntu2004", "ubuntu-2004",
> -                        trailer=3D"".join(ubuntu2004_tsanhack))
> +    generate_dockerfile("ubuntu2204", "ubuntu-2204")
>
>      #
>      # Cross compiling builds
> --
> 2.39.1
>
