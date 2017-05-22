Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u76sm11298481wrb.27.2017.05.22.06.59.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2017 06:59:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A2F1D3E00CD;
	Mon, 22 May 2017 14:59:44 +0100 (BST)
References: <20170521032956.27446-1-f4bug@amsat.org> <20170521032956.27446-11-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 10/24] docker: use eatmydata in debian arm64 image
In-reply-to: <20170521032956.27446-11-f4bug@amsat.org>
Date: Mon, 22 May 2017 14:59:44 +0100
Message-ID: <877f193sbz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: iHj71EIqMg5Z


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/debian-arm64-cross.docker | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> index 592b5d7055..f3db7f4f55 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -8,8 +8,11 @@ FROM qemu:debian
>  # Add the foreign architecture we want and install dependencies
>  RUN dpkg --add-architecture arm64
>  RUN apt update
> -RUN apt install -yy crossbuild-essential-arm64
> -RUN apt-get build-dep -yy -a arm64 qemu
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get install -y --no-install-recommends \
> +        crossbuild-essential-arm64
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt-get build-dep -yy -a arm64 qemu
>
>  # Specify the cross prefix for this image (see tests/docker/common.rc)
>  ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-


--
Alex Bennée
