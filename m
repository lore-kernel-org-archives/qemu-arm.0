Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3215123njd;
        Tue, 1 Apr 2025 21:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEp9DAdRMOXOMkUUBrzCL1bSiq6V83fxiORauHIh8u2rwupVntn6nQtiZVDO3oGE38VnnbrpRVhw4SWw==@linaro.org
X-Received: by 2002:a05:6000:2406:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-39c1424288amr11706472f8f.15.1743567142793;
        Tue, 01 Apr 2025 21:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743567142; cv=none;
        d=google.com; s=arc-20240605;
        b=YsCNF9FqzCSzT0bab7wiYTmitknQriM80lyPPZYFI7vBqZypIj8sDX95UY2MQOGkJa
         lhB2bGvxnqTDNUZyY8pAyv+lY8jTJ5uzvVqyURa94AFdtrftcb4wQxlhgNL/fFfFBKBg
         7Zvm4o2hfphOYQPR0sdYZGZXuUUTD+5AuP2y3YojgN6K9olKbaRcKkS30UOhUBJ6QcFg
         kZVvJCgZWUBitsweWIiiLXRYp59FoaRCd3SC8y488blljysB094/7v2QmU8FNG/2iv7a
         3cGHnvL1USLcI5pnl3uMs4mHxQwoqX1skjmBF05bPat8qD+9vSHtSDQSYdz5jueJFzPP
         raUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UmfAKa47SZL4PKMK/dmI8//uTNLj7jfJ1CyM1dfSs1Q=;
        fh=rY7mvt7Oka431l+NDRsFPaP7kbmcTx3cAt6oLi5eZTk=;
        b=jiUcWP/anv6UfZ7HADZ2s6Y2F0ft7MrTx67d6CsoGOy/7RDFciIBNQWraOfUbrGcBN
         JQcZULUoC/aUKCCF9gNfODwvoMAQpX93TA9N87Vo1n5Yl8SHPNsemJ6Iu6/AosULWRTN
         jgn6RJvjWXucL2btIjje83O5DUImp82iejGDITUn3GN1n5qjl1QIwEDMUGn6R1nBEO3G
         HWFprnOTFHvmT1SFxs1da/JoBmt9Vzfc9NPJggSmnt7seHPVLWa4Wo6XRXtTauRQOs3x
         M5joIuO6OQWt0IGjtKH2P7cGeX2MTkeNlaYCdZujpPvlCpHP6twEpkemsE+SlSNA4d/r
         YUMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6uzM5NN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43eae868ad3sor7746735e9.7.2025.04.01.21.12.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Apr 2025 21:12:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6uzM5NN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743567142; x=1744171942; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmfAKa47SZL4PKMK/dmI8//uTNLj7jfJ1CyM1dfSs1Q=;
        b=t6uzM5NNqw4U/UGSMrEj37vu6dLgHSuNOAaFjfntJo8Kd3CPWHYu50Jho5J6LG7RrD
         95BX6cUgy7JpAqkhDQS1p0zTIT6ZNGe6Tbr+TWwRPFH6hvx1/VMXEC+rOwdcAmhxYGNd
         arZQ1cjKVW1VODc1vybfyuz/xxdQQWGuF2WS4P36+Ie/b8Y7ZX8tf7sE8Lyuv1kwCb2x
         iLQcDXSIdMmibCRCavjv6BYtgjN1ge570vCvKToGmysdoQvLH8tgKOb5gbKtDUjBo9ol
         HxgMle0a0riuzAwheK5kTi8Mjor6NcNX1ruRkXHxudWLFHmQcbKE64pT2qXiZH/OfMtK
         r7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743567142; x=1744171942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmfAKa47SZL4PKMK/dmI8//uTNLj7jfJ1CyM1dfSs1Q=;
        b=esthTkWsqkq+qkNKnIyH6+P4dW0E+0jWT2u93PG4AhZ9UNxuSwuwaywp3OCPUdLcAR
         xFw00+5ERdQzwqSwmY1sTxmtjld1QPELx9qt6ji3TWRBboeHCXxfZ+xAtG/XJW0KGG0/
         YL2mvNvzIF6ktnfCUB9OLru8REeLvBNxVTmz5pSvUDmTj7Ngbnf5aGt7Z480LGnpRqNx
         tnOqWKs7IxK9N3lBEUX3o2O5YLhk4/xxEo5eyknKE/Bi3sERE43+IAD+Fr9MsJpUbkNM
         yPMkOi79SVOwYV5auhJ/Jg8USq8zugsL6flOlTXnbaLY4qMi2MCjCe0dBG+UIDCN7V5s
         Mqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVS0dV5Xw/Lik26GSnZdhTt7WMaB4GYj1L78QqaK6M9ytn9DrDDFJX17a6LEOJAi+H7Ki+JMz/u/1beVg==@linaro.org
X-Gm-Message-State: AOJu0Yz3qxy2uR2scyZm4i/eW7QxVRKrdLDNF5mHqKas338jwIOUu5dJ
	VJYbkMyvR/9/v/kFNATdCPishJKOf+EgBafK+GAeR0uwopmjIijhFASKePsQS6pgI5NENB7ItYy
	wgBU=
X-Gm-Gg: ASbGncu7F4r4EH0bSqgqPZKzbgLuZVvESAwMHd1HYYd83Er+2sgzwTqMRudZj0lmIcX
	xHxrw1UM9fbKMSsAM8Gsz59bEHXIQlu2cuOGd5NKYGelqpiSPD5RRdlcjv/5S+mBxOI9U3JaMNG
	0VjWaymYmz+Gm5oQVYk4OastUazlmv4I5nWq7h2sx/YPcAssHVZWT3QVFuJRet0o007j5WQ4SWw
	nkFAmRWM7RXLxpNZoQmCOH76dJs3LE0Fsf0dZAH6MkdhviD2LcKA7SugaKKqwMjf58pTdM65DRT
	I2TlZqNveAp6ae+G+7nd4LAXBxSAtIm45+UpQbogWUjSJ1a9XdAmkt5o9MYfZBzoJTJ8Yvd+pcF
	f8g93jr7agoGT
X-Google-Smtp-Source: AGHT+IE6LYT+T4wnlmzBzA8+CQk4NYVAKV0kC/lC7aDY+wixcQCKbwWMQUS8OlxPd8iwvZoLCkzsSQ==
X-Received: by 2002:a05:600c:3150:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-43db8526be1mr122886025e9.29.1743567142310;
        Tue, 01 Apr 2025 21:12:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60eb01dsm8042185e9.25.2025.04.01.21.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 21:12:21 -0700 (PDT)
Message-ID: <333d9e55-fc5e-43ef-a932-c1b8fd97b6b3@linaro.org>
Date: Wed, 2 Apr 2025 06:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] hw/arm/fsl-imx: Correct GPIO/GPT index in QOM tree
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-14-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20230110164406.94366-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F+cOYEb0x0Ht

On 10/1/23 17:44, Philippe Mathieu-Daudé wrote:
> GPT and GPIO are numbered from #1.
> 
> Fixes: 757282ada8 ("i.MX: Add i.MX7 SOC.")
> Fixes: 31cbf933f0 ("i.MX: Add i.MX6UL SOC")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/fsl-imx6ul.c | 4 ++--
>   hw/arm/fsl-imx7.c   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index d88d6cc1c5..568317117c 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -72,7 +72,7 @@ static void fsl_imx6ul_init(Object *obj)
>        * GPIOs 1 to 5

FWIW it is even  ^^^^^^ commented.

>        */
>       for (i = 0; i < FSL_IMX6UL_NUM_GPIOS; i++) {
> -        snprintf(name, NAME_SIZE, "gpio%d", i);
> +        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
>           object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
>       }
>   
> @@ -80,7 +80,7 @@ static void fsl_imx6ul_init(Object *obj)
>        * GPT 1, 2

                ^^^^

>        */
>       for (i = 0; i < FSL_IMX6UL_NUM_GPTS; i++) {
> -        snprintf(name, NAME_SIZE, "gpt%d", i);
> +        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
>           object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX6UL_GPT);
>       }
>   
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index afc7480799..6115677d43 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -52,7 +52,7 @@ static void fsl_imx7_init(Object *obj)
>        * GPIOs 1 to 7

                  ^^^^^^

>        */
>       for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
> -        snprintf(name, NAME_SIZE, "gpio%d", i);
> +        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
>           object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
>       }
>   
> @@ -60,7 +60,7 @@ static void fsl_imx7_init(Object *obj)
>        * GPT1, 2, 3, 4

               ^^^^^^^^^^

>        */
>       for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
> -        snprintf(name, NAME_SIZE, "gpt%d", i);
> +        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
>           object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX7_GPT);
>       }
>   
