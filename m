Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090640c500b006ce06d9b4f3sm4441876ejk.73.2022.02.28.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 07:35:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF5811FFB7;
	Mon, 28 Feb 2022 15:35:53 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <YhyVvAv0M8WwiK2A@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 sw@weilnetz.de, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Date: Mon, 28 Feb 2022 14:39:17 +0000
In-reply-to: <YhyVvAv0M8WwiK2A@redhat.com>
Message-ID: <87r17nm2au.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /iJR4tBM/Vmj


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> $SUBJECT  =3D~ s/lci-tool/lcitool/
>
> On Fri, Feb 25, 2022 at 05:20:07PM +0000, Alex Benn=C3=A9e wrote:
>> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
>
> Likewise
>
>> As a result we can drop debian-arm64-test-cross just for building
>> tests.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.d/container-cross.yml              |  10 +-
>>  tests/docker/Makefile.include                 |   3 -
>>  .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
>>  .../debian-arm64-test-cross.docker            |  13 --
>>  tests/lcitool/refresh                         |  11 ++
>>  tests/tcg/configure.sh                        |   2 +-
>>  6 files changed, 173 insertions(+), 52 deletions(-)
>>  delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.doc=
ker
>>=20
>
>
>
>> +RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>> +    apt-get update && \
>> +    apt-get install -y eatmydata && \
>> +    eatmydata apt-get dist-upgrade -y && \
>> +    eatmydata apt-get install --no-install-recommends -y \
>> +            bash \
>
>     ...snip native packages...
>
>> +            texinfo && \
>> +    eatmydata apt-get autoremove -y && \
>> +    eatmydata apt-get autoclean -y && \
>> +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>> +    dpkg-reconfigure locales
>>=20=20
>> -RUN apt update && \
>> -    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>> -    apt install -y --no-install-recommends \
>> -        libbz2-dev:arm64 \
>> -        liblzo2-dev:arm64 \
>> -        librdmacm-dev:arm64 \
>> -        libsnappy-dev:arm64 \
>> -        libxen-dev:arm64
>> +ENV LANG "en_US.UTF-8"
>> +ENV MAKE "/usr/bin/make"
>> +ENV NINJA "/usr/bin/ninja"
>> +ENV PYTHON "/usr/bin/python3"
>> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>>=20=20
>> -# nettle
>> -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
>> +RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>> +    dpkg --add-architecture arm64 && \
>> +    eatmydata apt-get update && \
>> +    eatmydata apt-get dist-upgrade -y && \
>> +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
>> +    eatmydata apt-get install --no-install-recommends -y \
>> +            g++-aarch64-linux-gnu \
>
>   ...snip cross packages...
>
>> +            zlib1g-dev:arm64 && \
>> +    eatmydata apt-get autoremove -y && \
>> +    eatmydata apt-get autoclean -y && \
>> +    mkdir -p /usr/local/share/meson/cross && \
>> +    echo "[binaries]\n\
>> +c =3D '/usr/bin/aarch64-linux-gnu-gcc'\n\
>> +ar =3D '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
>> +strip =3D '/usr/bin/aarch64-linux-gnu-strip'\n\
>> +pkgconfig =3D '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
>> +\n\
>> +[host_machine]\n\
>> +system =3D 'linux'\n\
>> +cpu_family =3D 'aarch64'\n\
>> +cpu =3D 'aarch64'\n\
>> +endian =3D 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu &=
& \
>> +    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' -=
-show > /packages.txt && \
>> +    mkdir -p /usr/libexec/ccache-wrappers && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-c++ && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-cc && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-g++ && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-gcc
>> +
>> +ENV ABI "aarch64-linux-gnu"
>> +ENV MESON_OPTS "--cross-file=3Daarch64-linux-gnu"
>> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Daarch64-linux-gnu-
>> +ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
>
> This cross dockerfile is a fully self-contained image.
>
> Traditionally QEMU has had a split image for Debian cross targets,
> where there is a base with common native packages, and then a
> layer for the cross packages.
>
> lcitool is capable of generating the image in this split format
> using the arg
>
>    --layers {all,native,foreign}
>
> Personally I think it is simpler to just use the fully self
> contained image, as it would simplify our gitlab pipeline
> to only need 1 build stage for containers.  The cost is that
> we'll not be sharing layers for native packages and more wall
> clock time building since we're installing the same native
> packages over & over.
>
> I'm not saying to change your patch, I just wanted to point
> out the possibility in case someone cares strongly about
> keeping a split layer model for cross containers.

My thinking on our layered approach has evolved over the years. One of
the problems is when the two layers get out of sync and you run into
build issues due to different states of cached layers.

I think now for full cross-builds I'm fine with just going for the full
single recipe. For cross-test building there may be more argument for
having a base layer (although in the end we also ended up with
all-test-cross because we can't have containers running containers in
GitLab).

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e
