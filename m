Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2103548wrv;
        Sat, 13 Jul 2019 07:56:54 -0700 (PDT)
X-Received: by 2002:a1c:f519:: with SMTP id t25mr15289525wmh.58.1563029813956;
        Sat, 13 Jul 2019 07:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563029813; cv=none;
        d=google.com; s=arc-20160816;
        b=obf7cGo1BWHVOgNs+9P0gajZu8SMkFR0W8hEsBkF78W4EK3OPHe2KvQw+8e+AbcPiB
         d5942AnjbjC0FZ2GzQh5XH/doN6pJaEKuUyeIns2aOrabmgC4SeMhHydvtbtPCkrXLlD
         dBrX6KQmCW45KBLsyK+wbT3HSQmmjGVJTK0Aim41mFFrPgEigoA5waVPELHtRZaTNqSK
         pzhTaoSvGDZVQInA8i29KdfFd5+mjlduXlr9s8beUtYcbMSC4EvSi1l1T/PX7aB4zTcc
         IQk8xNVlHrqKEgyuyEvrK+4Bipks2kV/swEY+SG2uecCKzGOOFtmXrHi4pXNcczJc/6P
         DbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=RqJLY8lpsDPDZvp0h+DmOIWrKUuAgzNMrfP+VYR/8X4=;
        b=uwATjWuBB2WYUyTDLgoLUg2JxpG1PHw+uIUvv+BD50Y4pH5S1S3PmpcZ3ezS6+YIX1
         sDsBgQvOKSKb8u/Uhq4mcaPfU1PEUhSwsmnL+bsx1ILPzD84EdzPLXe8G8vQfmpLV8/J
         7TEH1wQ/7VUybQ9Y/KTTfTm8ko2eak2jgJXceGBKjnlgvXdQY0Xd+xjAw4+9JaFmCC37
         uTzDzGtCG9Taknc2HBFqzYKfW17DtKfI1S/yZXkvSlC/rXtLPWAR8A0V6aA06H78Yz7a
         XuvrOUxdn3f91MRQbZgNgUO5EKKytlluXOVBsOIJbNo7mvfy5egyUnlDEzbUwgtQ9WyA
         q0yA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m1sor6900188wmm.2.2019.07.13.07.56.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jul 2019 07:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RqJLY8lpsDPDZvp0h+DmOIWrKUuAgzNMrfP+VYR/8X4=;
        b=CIEnAS/9bJ7mpVypMsBgBauVajciVo5aVUJahB8UhqRcrQMMhkmN+kpmzXMAnNKCIK
         XqYTHVRh9BXDDpyEQY6w1BTnjqdFiULiKwg8djbaQVHfEoGc1rAcy8P/LR23ZUSi7AYj
         T8yvpIvrgayUZlSElQm/87akvDVH+YMGfM2N2fumGrEsGTKJuwny5YWchhR54qClIwHk
         Lf9itZtDq59lme6l0EbGRL+m5IRexhfSJf/G9cqLa12McOEMtNr27mxi7QFWORIJ7Stk
         NckvhR419lOcxLhPiUoMp0yfuxpoF7BlAQUwlsWRvME5qKewOhF85y/s0i5toAwW6vUQ
         VI9A==
X-Gm-Message-State: APjAAAU4meRpClic3A8HydiwTgsDQKDJDifpPN8H/qL+creMCW8crPuy
	NdWmhQVmCQek6wezqFpJihIzXQ==
X-Google-Smtp-Source: APXvYqzGhnVDZlvuzK0sebFCqHsNtin9YtlaJhAuyyNSekj1AGJtxbVoG8N7+1tWQF9kErrYoMrXnw==
X-Received: by 2002:a1c:407:: with SMTP id 7mr15926633wme.113.1563029813516;
        Sat, 13 Jul 2019 07:56:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net. [83.42.61.62])
        by smtp.gmail.com with ESMTPSA id r11sm15655848wre.14.2019.07.13.07.56.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 07:56:53 -0700 (PDT)
Subject: Re: [PATCH v1 6/7] tests/dockerfiles: update the win cross builds to
 stretch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c9409240-3afe-e9ca-0910-8c8ed48ef7af@redhat.com>
Date: Sat, 13 Jul 2019 16:56:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712111849.9006-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: y6TrVRItx0G2

On 7/12/19 1:18 PM, Alex Bennée wrote:
> While fixing up pkg.mxe.cc they move the URLs around a bit and dropped
> Jessie support in favour of Stretch. We also need to update the keys
> used to verify the packages.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include                         |  6 +++---
>  tests/docker/dockerfiles/debian-win32-cross.docker    |  4 ++--
>  tests/docker/dockerfiles/debian-win64-cross.docker    |  4 ++--
>  .../{debian8-mxe.docker => debian9-mxe.docker}        | 11 +++++++----
>  4 files changed, 14 insertions(+), 11 deletions(-)
>  rename tests/docker/dockerfiles/{debian8-mxe.docker => debian9-mxe.docker} (56%)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index aaf5396b85d..dbd58e548c1 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -85,7 +85,7 @@ endif
>  
>  # Enforce dependencies for composite images
>  docker-image-debian: docker-image-debian9
> -docker-image-debian8-mxe: docker-image-debian8
> +docker-image-debian9-mxe: docker-image-debian9
>  docker-image-debian-amd64: docker-image-debian9
>  docker-image-debian-armel-cross: docker-image-debian9
>  docker-image-debian-armhf-cross: docker-image-debian9
> @@ -96,8 +96,8 @@ docker-image-debian-mipsel-cross: docker-image-debian9
>  docker-image-debian-mips64el-cross: docker-image-debian9
>  docker-image-debian-ppc64el-cross: docker-image-debian9
>  docker-image-debian-s390x-cross: docker-image-debian9
> -docker-image-debian-win32-cross: docker-image-debian8-mxe
> -docker-image-debian-win64-cross: docker-image-debian8-mxe
> +docker-image-debian-win32-cross: docker-image-debian9-mxe
> +docker-image-debian-win64-cross: docker-image-debian9-mxe
>  
>  docker-image-debian-alpha-cross: docker-image-debian-sid
>  docker-image-debian-hppa-cross: docker-image-debian-sid
> diff --git a/tests/docker/dockerfiles/debian-win32-cross.docker b/tests/docker/dockerfiles/debian-win32-cross.docker
> index 0a4970c0683..c787e432454 100644
> --- a/tests/docker/dockerfiles/debian-win32-cross.docker
> +++ b/tests/docker/dockerfiles/debian-win32-cross.docker
> @@ -1,9 +1,9 @@
>  #
>  # Docker mingw32 cross-compiler target
>  #
> -# This docker target builds on the debian Jessie MXE base image.
> +# This docker target builds on the debian Stretch MXE base image.
>  #
> -FROM qemu:debian8-mxe
> +FROM qemu:debian9-mxe
>  
>  MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>  
> diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/docker/dockerfiles/debian-win64-cross.docker
> index b27985b1b1f..a7068ed6ac6 100644
> --- a/tests/docker/dockerfiles/debian-win64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-win64-cross.docker
> @@ -1,9 +1,9 @@
>  #
>  # Docker mingw64 cross-compiler target
>  #
> -# This docker target builds on the debian Jessie MXE base image.
> +# This docker target builds on the debian Stretch MXE base image.
>  #
> -FROM qemu:debian8-mxe
> +FROM qemu:debian9-mxe
>  
>  MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>  
> diff --git a/tests/docker/dockerfiles/debian8-mxe.docker b/tests/docker/dockerfiles/debian9-mxe.docker
> similarity index 56%
> rename from tests/docker/dockerfiles/debian8-mxe.docker
> rename to tests/docker/dockerfiles/debian9-mxe.docker
> index 2df4cc8c5c9..5bc8a6d5c36 100644
> --- a/tests/docker/dockerfiles/debian8-mxe.docker
> +++ b/tests/docker/dockerfiles/debian9-mxe.docker
> @@ -1,15 +1,18 @@
>  #
>  # Docker mingw cross-compiler target
>  #
> -# This docker target builds on the debian Jessie base image.
> +# This docker target builds on the debian Stretch base image.
>  #
> -FROM qemu:debian8
> +FROM qemu:debian9
>  
>  MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>  
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> +    apt install -y --no-install-recommends gnupg dirmngr
> +
>  # Add the foreign architecture we want and install dependencies
> -RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB && \
> -    echo "deb http://pkg.mxe.cc/repos/apt/debian jessie main" > /etc/apt/sources.list.d/mxeapt.list
> +RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C6BF758A33A3A276 && \
> +    echo "deb http://pkg.mxe.cc/repos/apt stretch main" > /etc/apt/sources.list.d/mxeapt.list
>  RUN apt-get update
>  RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>      apt-get install -y --no-install-recommends \
> 

Thank you Alex!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
