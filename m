Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 30sm9401541wrp.6.2017.05.22.07.04.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2017 07:04:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id AA6903E00CD;
	Mon, 22 May 2017 15:04:22 +0100 (BST)
References: <20170521032956.27446-1-f4bug@amsat.org> <20170521032956.27446-13-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 12/24] docker: add extra libs to arm64 target to extend codebase coverage
In-reply-to: <20170521032956.27446-13-f4bug@amsat.org>
Date: Mon, 22 May 2017 15:04:22 +0100
Message-ID: <874lwd3s49.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: To6Zqc8QpLxI


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/debian-arm64-cross.docker | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> index f3db7f4f55..45b891d57a 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -16,3 +16,14 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>
>  # Specify the cross prefix for this image (see tests/docker/common.rc)
>  ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> +
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get install -y --no-install-recommends \
> +        glusterfs-common:arm64 \
> +        libbz2-dev:arm64 \
> +        liblzo2-dev:arm64 \
> +        libncursesw5-dev:arm64 \
> +        libnfs-dev:arm64 \
> +        librdmacm-dev:arm64 \
> +        libsnappy-dev:arm64 \
> +        libxen-dev:arm64


--
Alex Bennée
