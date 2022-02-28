Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1635304lfq;
        Mon, 28 Feb 2022 01:20:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvO129xmRf9K5CESNUG1oo8ZAwW+N9bN6fCqTO6zyNMxg9IjkAi6TGj1fZL8Ih4cbLiDlo
X-Received: by 2002:ac8:5c53:0:b0:2de:4d85:9d49 with SMTP id j19-20020ac85c53000000b002de4d859d49mr15578711qtj.263.1646040041453;
        Mon, 28 Feb 2022 01:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646040041; cv=none;
        d=google.com; s=arc-20160816;
        b=QPUhHCUX+/07kvVqeKsXbbPlvI0jA1+n3KgiXzJiQYOrtL9w2axmwFqT7xsX2ogSkD
         1XRKiKpdFoS8WklA638ym+zpybXBXlG1m3SWgyfh/u/p6Jb6I1dQWMDrd7zteChsrQqJ
         6/H+/H6b9rjNaVfV3d4ysZK3RGWMuA3JAebaaCsDtKunoAJ1OpFVfyUUP4xkbF4YbQMP
         Sw7kqyQGk0PCLOGvWtHXsRu+OW2TW3inahRFQTrgjQ0MrnzYdnbyk05+8SMepyqOjdsq
         x+lMy9RVsuYzS4vPPPm3WpkuBUAWukwQJ88TRZBQFY7BVGlUrsXRPVLAUD50xSSFoYZC
         49xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=mV00cQFeAzEdf1MAOS8mMi+Z50cMsM1e1rQywXdIkwo=;
        b=hALe5L4tlyhBJRIoIsJKpoPdF1kBHlBF597lpvdY21MTJo9Mc+Ca6Ef6gCpTPniPIf
         F1FAnMoocq+OGTwpLT8qe6o8xjnyCaQ71jAiW0jqKtGwAcZBMccHRSWXNyDeJofzljeg
         CoNRKady9sN/6vIAJAkqmd/ciLVXFCFxJYtJXvDebv/g+XSOg+9YTchlDuZzuXTYbjjo
         nQVrANpKlEUSYa+IkCPZVo5msJF8rYSNGmdaFcdrJfz6j6VkTx+/Z6eKDBqV+I4XExIR
         GZKUXsP9FAZB0EfSBL8yqlMspW4lrxcFU5jRBWL/Fc/TeTtYHHKJILkN0klkHs1rQLcH
         QNXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBvkiMov;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n4-20020a0cbe84000000b0042bf4348f6dsi3263744qvi.147.2022.02.28.01.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBvkiMov;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646040041;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mV00cQFeAzEdf1MAOS8mMi+Z50cMsM1e1rQywXdIkwo=;
	b=KBvkiMovLk1e4vgvLlEGTbZwJit5yQX7zZ6sFt+5jk5yGzz54JlcTktsXa9VJjdhi3TJRo
	78nuV5ilRrOm3+2tWfKVOHTCfbwYSY7CSmSz03MyW2nUoeh1yzBALMP4wLtUM5Wt0IM12b
	FXd9qMpxz/t1a7m6MXOX9r1Q5fM8iyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-hKpaEPh7PaWP6OFwy1nYqg-1; Mon, 28 Feb 2022 04:20:35 -0500
X-MC-Unique: hKpaEPh7PaWP6OFwy1nYqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932251854E2A;
	Mon, 28 Feb 2022 09:20:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAEF7AB7D;
	Mon, 28 Feb 2022 09:20:20 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:20:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
	aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
	crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
	sw@weilnetz.de, Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Message-ID: <YhyT0aOAF34FtEFR@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: GZwwbTajCGmi

On Mon, Feb 28, 2022 at 09:39:29AM +0100, Thomas Huth wrote:
> On 25/02/2022 18.20, Alex Bennée wrote:
> > Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> > As a result we can drop debian-arm64-test-cross just for building
> > tests.
> 
> Good idea!
> 
> One comment below...
> 
> [...]
> > diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > index 166e24df13..589510a7be 100644
> > --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > @@ -1,32 +1,166 @@
> > +# THIS FILE WAS AUTO-GENERATED
> >   #
> > -# Docker arm64 cross-compiler target
> > +#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
> >   #
> > -# This docker target builds on the debian Buster base image.
> > -#
> > -FROM qemu/debian10
> > +# https://gitlab.com/libvirt/libvirt-ci
> > -# Add the foreign architecture we want and install dependencies
> > -RUN dpkg --add-architecture arm64
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt install -y --no-install-recommends \
> > -        crossbuild-essential-arm64
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt build-dep -yy -a arm64 --arch-only qemu
> > +FROM docker.io/library/debian:11-slim
> > -# Specify the cross prefix for this image (see tests/docker/common.rc)
> > -ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> > -ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
> > +RUN export DEBIAN_FRONTEND=noninteractive && \
> > +    apt-get update && \
> > +    apt-get install -y eatmydata && \
> > +    eatmydata apt-get dist-upgrade -y && \
> > +    eatmydata apt-get install --no-install-recommends -y \
> > +            bash \
> > +            bc \
> > +            bsdextrautils \
> > +            bzip2 \
> > +            ca-certificates \
> > +            ccache \
> > +            dbus \
> > +            debianutils \
> > +            diffutils \
> > +            exuberant-ctags \
> > +            findutils \
> > +            gcovr \
> > +            genisoimage \
> > +            gettext \
> > +            git \
> > +            hostname \
> > +            libpcre2-dev \
> > +            libspice-protocol-dev \
> > +            libtest-harness-perl \
> > +            llvm \
> > +            locales \
> > +            make \
> > +            meson \
> > +            ncat \
> > +            ninja-build \
> > +            openssh-client \
> > +            perl-base \
> > +            pkgconf \
> > +            python3 \
> > +            python3-numpy \
> > +            python3-opencv \
> > +            python3-pillow \
> > +            python3-pip \
> > +            python3-sphinx \
> > +            python3-sphinx-rtd-theme \
> > +            python3-venv \
> > +            python3-yaml \
> > +            rpm2cpio \
> > +            sed \
> > +            sparse \
> > +            tar \
> > +            tesseract-ocr \
> > +            tesseract-ocr-eng \
> > +            texinfo && \
> > +    eatmydata apt-get autoremove -y && \
> > +    eatmydata apt-get autoclean -y && \
> > +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > +    dpkg-reconfigure locales
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt install -y --no-install-recommends \
> > -        libbz2-dev:arm64 \
> > -        liblzo2-dev:arm64 \
> > -        librdmacm-dev:arm64 \
> > -        libsnappy-dev:arm64 \
> > -        libxen-dev:arm64
> > +ENV LANG "en_US.UTF-8"
> > +ENV MAKE "/usr/bin/make"
> > +ENV NINJA "/usr/bin/ninja"
> > +ENV PYTHON "/usr/bin/python3"
> > +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
> > -# nettle
> > -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
> > +RUN export DEBIAN_FRONTEND=noninteractive && \
> > +    dpkg --add-architecture arm64 && \
> > +    eatmydata apt-get update && \
> > +    eatmydata apt-get dist-upgrade -y && \
> > +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
> > +    eatmydata apt-get install --no-install-recommends -y \
> > +            g++-aarch64-linux-gnu \
> > +            gcc-aarch64-linux-gnu \
> > +            libaio-dev:arm64 \
> > +            libasan5:arm64 \
> > +            libasound2-dev:arm64 \
> > +            libattr1-dev:arm64 \
> > +            libbpf-dev:arm64 \
> > +            libbrlapi-dev:arm64 \
> > +            libbz2-dev:arm64 \
> > +            libc6-dev:arm64 \
> > +            libcacard-dev:arm64 \
> > +            libcap-ng-dev:arm64 \
> > +            libcapstone-dev:arm64 \
> > +            libcurl4-gnutls-dev:arm64 \
> > +            libdaxctl-dev:arm64 \
> > +            libdrm-dev:arm64 \
> > +            libepoxy-dev:arm64 \
> > +            libfdt-dev:arm64 \
> > +            libffi-dev:arm64 \
> > +            libfuse3-dev:arm64 \
> > +            libgbm-dev:arm64 \
> > +            libgcrypt20-dev:arm64 \
> > +            libglib2.0-dev:arm64 \
> > +            libglusterfs-dev:arm64 \
> > +            libgnutls28-dev:arm64 \
> > +            libgtk-3-dev:arm64 \
> > +            libibumad-dev:arm64 \
> > +            libibverbs-dev:arm64 \
> > +            libiscsi-dev:arm64 \
> > +            libjemalloc-dev:arm64 \
> > +            libjpeg62-turbo-dev:arm64 \
> > +            liblttng-ust-dev:arm64 \
> > +            liblzo2-dev:arm64 \
> > +            libncursesw5-dev:arm64 \
> > +            libnfs-dev:arm64 \
> > +            libnuma-dev:arm64 \
> > +            libpam0g-dev:arm64 \
> > +            libpixman-1-dev:arm64 \
> > +            libpng-dev:arm64 \
> > +            libpulse-dev:arm64 \
> > +            librbd-dev:arm64 \
> > +            librdmacm-dev:arm64 \
> > +            libsasl2-dev:arm64 \
> > +            libsdl2-dev:arm64 \
> > +            libsdl2-image-dev:arm64 \
> > +            libseccomp-dev:arm64 \
> > +            libselinux1-dev:arm64 \
> > +            libslirp-dev:arm64 \
> > +            libsnappy-dev:arm64 \
> > +            libspice-server-dev:arm64 \
> > +            libssh-gcrypt-dev:arm64 \
> > +            libsystemd-dev:arm64 \
> > +            libtasn1-6-dev:arm64 \
> > +            libubsan1:arm64 \
> > +            libudev-dev:arm64 \
> > +            liburing-dev:arm64 \
> > +            libusb-1.0-0-dev:arm64 \
> > +            libusbredirhost-dev:arm64 \
> > +            libvdeplug-dev:arm64 \
> > +            libvirglrenderer-dev:arm64 \
> > +            libvte-2.91-dev:arm64 \
> > +            libxen-dev:arm64 \
> > +            libzstd-dev:arm64 \
> > +            nettle-dev:arm64 \
> > +            systemtap-sdt-dev:arm64 \
> > +            xfslibs-dev:arm64 \
> > +            zlib1g-dev:arm64 && \
> > +    eatmydata apt-get autoremove -y && \
> > +    eatmydata apt-get autoclean -y && \
> > +    mkdir -p /usr/local/share/meson/cross && \
> > +    echo "[binaries]\n\
> > +c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
> 
> Is it really just "c =" or should this be "cc =" ?

I believe this really does want to be 'c', as in this is the path
for the 'c' programming language  in Meson.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
