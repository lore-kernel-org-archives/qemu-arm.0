Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r29sm9599781wrc.25.2017.05.22.07.03.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2017 07:03:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E769D3E00CD;
	Mon, 22 May 2017 15:03:55 +0100 (BST)
References: <20170521032956.27446-1-f4bug@amsat.org> <20170521032956.27446-12-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 11/24] docker: add extra libs to armhf target to extend codebase coverage
In-reply-to: <20170521032956.27446-12-f4bug@amsat.org>
Date: Mon, 22 May 2017 15:03:55 +0100
Message-ID: <8760gt3s50.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: GbwyfH1vtMuO


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/debian-armhf-cross.docker | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
> index ba8d5a5167..e67dfdccc5 100644
> --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
> @@ -16,3 +16,14 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>
>  # Specify the cross prefix for this image (see tests/docker/common.rc)
>  ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
> +
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get install -y --no-install-recommends \
> +        glusterfs-common:armhf \
> +        libbz2-dev:armhf \
> +        liblzo2-dev:armhf \
> +        libncursesw5-dev:armhf \
> +        libnfs-dev:armhf \
> +        librdmacm-dev:armhf \
> +        libsnappy-dev:armhf \
> +        libxen-dev:armhf


--
Alex Bennée
