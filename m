Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 9sm20451956wmh.17.2017.05.22.07.12.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2017 07:12:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 341473E00CD;
	Mon, 22 May 2017 15:12:50 +0100 (BST)
References: <20170521032956.27446-1-f4bug@amsat.org> <20170521032956.27446-21-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 20/24] shippable: add armeb-linux-user target
In-reply-to: <20170521032956.27446-21-f4bug@amsat.org>
Date: Mon, 22 May 2017 15:12:50 +0100
Message-ID: <87tw4d2d5p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: jZH7SAZznTno


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  .shippable.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.shippable.yml b/.shippable.yml
> index fe360f85cb..2070c4d827 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -6,7 +6,7 @@ env:
>      - LC_ALL=C
>    matrix:
>      - IMAGE=debian-armhf-cross
> -      TARGET_LIST=arm-softmmu,arm-linux-user
> +      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
>      - IMAGE=debian-arm64-cross
>        TARGET_LIST=aarch64-softmmu,aarch64-linux-user
>      - IMAGE=debian-s390x-cross


--
Alex Bennée
