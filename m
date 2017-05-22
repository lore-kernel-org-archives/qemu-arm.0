Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y3sm7023699wrd.23.2017.05.22.06.59.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2017 06:59:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F1DD83E00CD;
	Mon, 22 May 2017 14:59:31 +0100 (BST)
References: <20170521032956.27446-1-f4bug@amsat.org> <20170521032956.27446-10-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 09/24] docker: use eatmydata in debian armhf image
In-reply-to: <20170521032956.27446-10-f4bug@amsat.org>
Date: Mon, 22 May 2017 14:59:31 +0100
Message-ID: <878tlp3scc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: T9CIYcbgFuhg


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/debian-armhf-cross.docker | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
> index 668d60aeb3..ba8d5a5167 100644
> --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
> @@ -8,8 +8,11 @@ FROM qemu:debian
>  # Add the foreign architecture we want and install dependencies
>  RUN dpkg --add-architecture armhf
>  RUN apt update
> -RUN apt install -yy crossbuild-essential-armhf
> -RUN apt-get build-dep -yy -a armhf qemu
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get install -y --no-install-recommends \
> +        crossbuild-essential-armhf
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get build-dep -yy -a armhf qemu
>
>  # Specify the cross prefix for this image (see tests/docker/common.rc)
>  ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-


--
Alex Bennée
