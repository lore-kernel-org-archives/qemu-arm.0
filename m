Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1613797lfq;
        Mon, 28 Feb 2022 00:39:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMd1vWKSpBe4elmGQmo5A+maR9e5HdhSqy5FLRDj5sALIJeMPkFpvF0a6xgZFAKVyDdkMA
X-Received: by 2002:a17:906:5f89:b0:6d0:226c:628d with SMTP id a9-20020a1709065f8900b006d0226c628dmr14268805eju.646.1646037577332;
        Mon, 28 Feb 2022 00:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646037577; cv=none;
        d=google.com; s=arc-20160816;
        b=dKQfULAqasegBjz/Qu1wmqkuRqJcdoR+2eJiuO0biIP6gq+FE0B8go2twGrHk4g1fU
         gwQttUxydKo4+iikxxNZI2KadKunMz+Fc+SfTGHoZn5PoiAA6sDi15G1hma44IlYRqv3
         QQr0S4uoZSA2EJ3ehpiLWkhhJviHbzo3hB4rEUEOHgmM3wLjhVr/iQyBmVIxGsBv3dpY
         eclA8CA6Ncnd5PKCwA2fNio1utUbBBfSlk/bEP8zxCRiA2aF+52KTqwatb0aAV9FL1qb
         X0nEbG/+LvsyRpLMMcw3Z66Kzd7MhJLWww6KuB36PPyQPKi+wdzM3FAvUEJA+UOFQg2p
         M/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=px12nRZc1W+gffWFl+sH54IvysCFad3DulaOdh+nro4=;
        b=rPKUw8+r0FrQK8/KI4worFicr7Z9fN6u5JzM+oliYBqrus/hDzoJGADIfUxBd+9ubu
         O/aDrry5NmiXo/8c623kw80jMqFEdX5DYyMOKVCgOFVWUCPEUCEK9dSkDg3C5fTDrQzL
         W2wYQaLpKob/IdLLcwCKN2vVPdQSXbn30iL0ZO1RRf9HbZBAXgD5dZSBKoFi1lrcUXB/
         b0Eg/J81hPy3maWJ/AS+osGuTNaE2KkrKdvRE5BojE6ZXVi9GBC8LiLEz5Wrj85SROvz
         6iTFAq28B3kWiWpw8yaX1x2Z0sBlc0yNs1NyYm9UBEVwpWv53RRIicPRsbJvmQpNScPN
         Llkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qy4Qey/a";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dm28-20020a05640222dc00b004109b9fa7ddsi6406471edb.306.2022.02.28.00.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 00:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qy4Qey/a";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646037576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=px12nRZc1W+gffWFl+sH54IvysCFad3DulaOdh+nro4=;
	b=Qy4Qey/aB0FsXEPRY0wSx8ZQaesNCaFfZlLjtibYgy/l5ut2qjTU1sBKIDNzPi6AdSKvTP
	vMRNCs9VvGXnB0Siy2AJ5/zlVT/16FinFQi2A01xYuQtAyzDdXKdLkcO7HHXuy0kuLkB2R
	dugdI6T+Y75hGuvnaRfJStmVh8TFSoo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-8PKi-VPRN-iDXqCx4uBbSA-1; Mon, 28 Feb 2022 03:39:32 -0500
X-MC-Unique: 8PKi-VPRN-iDXqCx4uBbSA-1
Received: by mail-wr1-f72.google.com with SMTP id e26-20020adfa45a000000b001ea860cd35cso1767360wra.4
        for <alex.bennee@linaro.org>; Mon, 28 Feb 2022 00:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=px12nRZc1W+gffWFl+sH54IvysCFad3DulaOdh+nro4=;
        b=B+uzo235swbP+d9G66NkzVrxSkQSukhKFxFDZ/ZV2qK41SDGiOkD847DiQmlu1vK4H
         oUb9b4HCaTI3gDZtPKmzIahnSPD0cZhSh7cv3HFbVZ1SDctlCFRLC9NxKf1CigtUgl5S
         j1oVriYXsSxRaqV6MxoifKgfzvJUtKA1Z2PzW/CL6uAcBtYBeJLBMcQwK1Lnq8kq4rij
         FruoYRnTthfyqLXWiB/ejqB9/n1rpzfpDoPLTwn1cUR2rjCkUWdx01pEJfrSP02u/NfK
         zWJjLIqE2s+vHMJyfaerB22Ylr6Uji5aAtHMBqZ/v9j6DQYSAlLG/uy8aMAthtTS/mq+
         Pa7A==
X-Gm-Message-State: AOAM5320spTUN9uomt8Z3i6Hp5ss2sxqz5SSe/qX2NVbjBmlPiTT3fa0
	G6HsAb0XQ5GPzm/I5b9Y3jrixtrEN0pUeBnF1bwR5vHIgpx2mBXBw2g5RGjfCjHQVF2aPk/ZcUs
	TNpc6l8x7jGXa6JOQBWsBRgYy34xAmNqP0SpT4RyBIipsiAMJ4FwH8SC1qJCzv09F
X-Received: by 2002:a5d:5302:0:b0:1ed:e1d2:f0fd with SMTP id e2-20020a5d5302000000b001ede1d2f0fdmr15207361wrv.585.1646037571355;
        Mon, 28 Feb 2022 00:39:31 -0800 (PST)
X-Received: by 2002:a5d:5302:0:b0:1ed:e1d2:f0fd with SMTP id e2-20020a5d5302000000b001ede1d2f0fdmr15207334wrv.585.1646037571082;
        Mon, 28 Feb 2022 00:39:31 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c4fcf00b00381614e5b60sm3618086wmq.34.2022.02.28.00.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 00:39:30 -0800 (PST)
Message-ID: <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
Date: Mon, 28 Feb 2022 09:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: fam@euphon.net, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 qemu-arm@nongnu.org, richard.henderson@linaro.org, sw@weilnetz.de,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Hildenbrand <dhildenb@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225172021.3493923-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Z9EQsXfaVuFK

On 25/02/2022 18.20, Alex Bennée wrote:
> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> As a result we can drop debian-arm64-test-cross just for building
> tests.

Good idea!

One comment below...

[...]
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> index 166e24df13..589510a7be 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -1,32 +1,166 @@
> +# THIS FILE WAS AUTO-GENERATED
>   #
> -# Docker arm64 cross-compiler target
> +#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
>   #
> -# This docker target builds on the debian Buster base image.
> -#
> -FROM qemu/debian10
> +# https://gitlab.com/libvirt/libvirt-ci
>   
> -# Add the foreign architecture we want and install dependencies
> -RUN dpkg --add-architecture arm64
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> -        crossbuild-essential-arm64
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt build-dep -yy -a arm64 --arch-only qemu
> +FROM docker.io/library/debian:11-slim
>   
> -# Specify the cross prefix for this image (see tests/docker/common.rc)
> -ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> -ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            bash \
> +            bc \
> +            bsdextrautils \
> +            bzip2 \
> +            ca-certificates \
> +            ccache \
> +            dbus \
> +            debianutils \
> +            diffutils \
> +            exuberant-ctags \
> +            findutils \
> +            gcovr \
> +            genisoimage \
> +            gettext \
> +            git \
> +            hostname \
> +            libpcre2-dev \
> +            libspice-protocol-dev \
> +            libtest-harness-perl \
> +            llvm \
> +            locales \
> +            make \
> +            meson \
> +            ncat \
> +            ninja-build \
> +            openssh-client \
> +            perl-base \
> +            pkgconf \
> +            python3 \
> +            python3-numpy \
> +            python3-opencv \
> +            python3-pillow \
> +            python3-pip \
> +            python3-sphinx \
> +            python3-sphinx-rtd-theme \
> +            python3-venv \
> +            python3-yaml \
> +            rpm2cpio \
> +            sed \
> +            sparse \
> +            tar \
> +            tesseract-ocr \
> +            tesseract-ocr-eng \
> +            texinfo && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> +    dpkg-reconfigure locales
>   
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> -        libbz2-dev:arm64 \
> -        liblzo2-dev:arm64 \
> -        librdmacm-dev:arm64 \
> -        libsnappy-dev:arm64 \
> -        libxen-dev:arm64
> +ENV LANG "en_US.UTF-8"
> +ENV MAKE "/usr/bin/make"
> +ENV NINJA "/usr/bin/ninja"
> +ENV PYTHON "/usr/bin/python3"
> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>   
> -# nettle
> -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    dpkg --add-architecture arm64 && \
> +    eatmydata apt-get update && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            g++-aarch64-linux-gnu \
> +            gcc-aarch64-linux-gnu \
> +            libaio-dev:arm64 \
> +            libasan5:arm64 \
> +            libasound2-dev:arm64 \
> +            libattr1-dev:arm64 \
> +            libbpf-dev:arm64 \
> +            libbrlapi-dev:arm64 \
> +            libbz2-dev:arm64 \
> +            libc6-dev:arm64 \
> +            libcacard-dev:arm64 \
> +            libcap-ng-dev:arm64 \
> +            libcapstone-dev:arm64 \
> +            libcurl4-gnutls-dev:arm64 \
> +            libdaxctl-dev:arm64 \
> +            libdrm-dev:arm64 \
> +            libepoxy-dev:arm64 \
> +            libfdt-dev:arm64 \
> +            libffi-dev:arm64 \
> +            libfuse3-dev:arm64 \
> +            libgbm-dev:arm64 \
> +            libgcrypt20-dev:arm64 \
> +            libglib2.0-dev:arm64 \
> +            libglusterfs-dev:arm64 \
> +            libgnutls28-dev:arm64 \
> +            libgtk-3-dev:arm64 \
> +            libibumad-dev:arm64 \
> +            libibverbs-dev:arm64 \
> +            libiscsi-dev:arm64 \
> +            libjemalloc-dev:arm64 \
> +            libjpeg62-turbo-dev:arm64 \
> +            liblttng-ust-dev:arm64 \
> +            liblzo2-dev:arm64 \
> +            libncursesw5-dev:arm64 \
> +            libnfs-dev:arm64 \
> +            libnuma-dev:arm64 \
> +            libpam0g-dev:arm64 \
> +            libpixman-1-dev:arm64 \
> +            libpng-dev:arm64 \
> +            libpulse-dev:arm64 \
> +            librbd-dev:arm64 \
> +            librdmacm-dev:arm64 \
> +            libsasl2-dev:arm64 \
> +            libsdl2-dev:arm64 \
> +            libsdl2-image-dev:arm64 \
> +            libseccomp-dev:arm64 \
> +            libselinux1-dev:arm64 \
> +            libslirp-dev:arm64 \
> +            libsnappy-dev:arm64 \
> +            libspice-server-dev:arm64 \
> +            libssh-gcrypt-dev:arm64 \
> +            libsystemd-dev:arm64 \
> +            libtasn1-6-dev:arm64 \
> +            libubsan1:arm64 \
> +            libudev-dev:arm64 \
> +            liburing-dev:arm64 \
> +            libusb-1.0-0-dev:arm64 \
> +            libusbredirhost-dev:arm64 \
> +            libvdeplug-dev:arm64 \
> +            libvirglrenderer-dev:arm64 \
> +            libvte-2.91-dev:arm64 \
> +            libxen-dev:arm64 \
> +            libzstd-dev:arm64 \
> +            nettle-dev:arm64 \
> +            systemtap-sdt-dev:arm64 \
> +            xfslibs-dev:arm64 \
> +            zlib1g-dev:arm64 && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    mkdir -p /usr/local/share/meson/cross && \
> +    echo "[binaries]\n\
> +c = '/usr/bin/aarch64-linux-gnu-gcc'\n\

Is it really just "c =" or should this be "cc =" ?

> +ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
> +strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
> +pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
> +\n\
> +[host_machine]\n\
> +system = 'linux'\n\
> +cpu_family = 'aarch64'\n\
> +cpu = 'aarch64'\n\
> +endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
> +    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
> +    mkdir -p /usr/libexec/ccache-wrappers && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-cc && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-g++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-gcc
> +
> +ENV ABI "aarch64-linux-gnu"
> +ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> +ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user

  Thomas

