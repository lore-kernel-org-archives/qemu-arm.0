Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1056488wrh;
        Thu, 9 May 2019 10:41:40 -0700 (PDT)
X-Received: by 2002:adf:f686:: with SMTP id v6mr4341558wrp.246.1557423700733;
        Thu, 09 May 2019 10:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557423700; cv=none;
        d=google.com; s=arc-20160816;
        b=XNG0q88aMgLst0WUjSBCI3aQUzeWmoVNpzBfoBv/d1hIUKCSLKtR5kqESbL3hhSAUZ
         tUoDN7AR+zDUAxvHQz7DxqFuYSk/oXPcr87vQp1lj8LJSd1i7cBmrH7M7eiyiUARYq98
         aEbY//7HBB0uR7JYW1ZCvhuFScuMrv850rB1v4hQzTqUeQpXXnZGHPwwy8xFcFITtom6
         5BmfD6OzB0fGq82H46It5QwHPmoU22EkPZ44JdwwyFQ4v+NPhVpOmSdeBfOFl7PupzUD
         q4OHkvlKu6F/dFYCflo3OkvE/qs5/D84zKrgjL3IzX+BFq6P/+mPtxYpx5Fy3aBxOKoJ
         B08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=yBWqIVlYzQPBJGo2C/fDVtzjo9zv+2KOatBDLPbG498=;
        b=fP9IRSef4E+kRKnEPS2jby8EcAHu0ZtExojifLhvRGWl5D9/MDm8QDHdu05wVHlTHZ
         Fa+Q45Pg1hWRwGmSLltx4DB8SlQMaUQfr+/onib3OeLlhl3wUWDBR8hal4pBDP9EifTy
         HM8hX5Yw9Lu9a4IA1DEfMBrQ3d2IcWYrVCK4VKF3xUnagIa1cKhP7HMunvJaGqL0Cp8Z
         Bhomr4QaQi62i9yP4NeAtnB9sCAUATlXs/FT66ciYh+REV4XglaPycztxdVXdJhsJxxX
         Px3GegZoeTSR83b8yQkUvfR8EYFgupw6ZnzyJAhIxy7TQ6uLT/Wo76VjGgTFTEExFlf8
         lFnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q26sor1784385wmf.1.2019.05.09.10.41.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 10:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yBWqIVlYzQPBJGo2C/fDVtzjo9zv+2KOatBDLPbG498=;
        b=cbW3/sWJuqjGhB8TW/roTwjrnPpjeAt1+vzHkZBs1MUDBdFPCiefgTamtHZXEMav/1
         GKq3dMF7xtbibswIh97x944S7BkGeQhaIkGU8/L6ViBonGzCkdZAhIY8L8jHMVYWiE7N
         UDmNvdBjcO7mm7zubO+LhS79Bse3b0Kn5ZcTy4YwHBphr1UNOovGyoKIzf1EPU4NCHpL
         6/OrWFIp/AJlo0gJuaWem81zM0dbbsNa2pdTntib2n1901ehSESHInMEdf+05PkFrN7G
         lx/33IlfQHi5plynpLuDoI5VU5caV1P2BQlsB38aV2R2+VtKVW7z19uMTyKA9RvY7zrE
         L5Zw==
X-Gm-Message-State: APjAAAUD8TaKlgnAzyk4oYvxjvdjcvOziojsLA4Rd0msVL7YbNwTwVwn
	z1WdaGMQhZ440uimBxynTiVI1w==
X-Google-Smtp-Source: APXvYqxgqOYxuQT1Wd1mIbBcZdP8Uu97209LlfieXlZXkhSccxuGuqaFpBeg8VUD//bONAUjGZB13w==
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr3817090wmb.85.1557423700509;
        Thu, 09 May 2019 10:41:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id y6sm1877103wrw.60.2019.05.09.10.41.39
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 10:41:39 -0700 (PDT)
Subject: Re: [PATCH v1 01/23] tests/docker: add ubuntu 18.04
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <90a1309d-7e93-1023-773f-ef23db0c7438@redhat.com>
Date: Thu, 9 May 2019 19:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +O2PSpBAU+fp

On 5/9/19 6:58 PM, Alex Bennée wrote:
> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> Based on the ubuntu.docker file.
> Used to reproduce the build failure Peter was seeing.
> Others might find this useful too ;)
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Message-Id: <20190503070241.24786-1-kraxel@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/ubuntu1804.docker | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
> 
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> new file mode 100644
> index 00000000000..2e2900150b0
> --- /dev/null
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -0,0 +1,57 @@
> +FROM ubuntu:18.04
> +ENV PACKAGES flex bison \
> +    ccache \
> +    clang \
> +    gcc \
> +    gettext \
> +    git \
> +    glusterfs-common \
> +    libaio-dev \
> +    libattr1-dev \
> +    libbluetooth-dev \
> +    libbrlapi-dev \
> +    libbz2-dev \
> +    libcacard-dev \
> +    libcap-dev \
> +    libcap-ng-dev \
> +    libcurl4-gnutls-dev \
> +    libdrm-dev \
> +    libepoxy-dev \
> +    libfdt-dev \
> +    libgbm-dev \
> +    libgtk-3-dev \
> +    libibverbs-dev \
> +    libiscsi-dev \
> +    libjemalloc-dev \
> +    libjpeg-turbo8-dev \
> +    liblzo2-dev \
> +    libncurses5-dev \
> +    libncursesw5-dev \
> +    libnfs-dev \
> +    libnss3-dev \
> +    libnuma-dev \
> +    libpixman-1-dev \
> +    librados-dev \
> +    librbd-dev \
> +    librdmacm-dev \
> +    libsasl2-dev \
> +    libsdl2-dev \
> +    libseccomp-dev \
> +    libsnappy-dev \
> +    libspice-protocol-dev \
> +    libspice-server-dev \
> +    libssh2-1-dev \
> +    libusb-1.0-0-dev \
> +    libusbredirhost-dev \
> +    libvdeplug-dev \
> +    libvte-2.91-dev \
> +    libxen-dev \
> +    make \
> +    python-yaml \
> +    sparse \
> +    texinfo \
> +    xfslibs-dev
> +RUN apt-get update && \
> +    apt-get -y install $PACKAGES
> +RUN dpkg -l $PACKAGES | sort > /packages.txt
> +ENV FEATURES clang pyyaml sdl2
> 
