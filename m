Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2453678ejb;
        Tue, 30 May 2023 14:30:33 -0700 (PDT)
X-Received: by 2002:a05:6000:371:b0:307:9d2a:fd35 with SMTP id f17-20020a056000037100b003079d2afd35mr2669530wrf.53.1685482233483;
        Tue, 30 May 2023 14:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685482233; cv=none;
        d=google.com; s=arc-20160816;
        b=izoot9ovDhblchJWBOO+ziFiW/8il7gJlw9wiImbet5x8UzRnQA1NKJIBbcQGRmjgC
         SEIm/un/lB7jvr6cDmes9f090QnPbp4Z3+COtjcIDz1rDVRuttFtYt+QCMc/rpaSqiY/
         FJXyfJz5YSVPmWUFJbdFqfCBaQzq67QywiUUTLaLbulyqVxigkFvD7MWfGDpHbjIOy+p
         MrMDloYAFOWHaxhd6YJeVb5if2FiWqowoClmp7XAdFuPJOr67GbGoLELvcE2fRE/Vid+
         NCWf8KifN0WpB73MVaH/Mbj8k50ex67PtwwbLJC+zMq25KQxQfJ1GmtT9U/PPMCld3IR
         jQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6ImSubkbjbUjNZwF69C2rLByaMdghdLHpgc9tkxHRmc=;
        b=u8NN9+AHgMEuDZk5kU0Z8PEpuxx0VUd1DcGotuu0f6/v5iGMmA/tQlZrxGQY8YE86a
         vBfKleYjSmpb0Vn/gjnkAnz8+Voj3Bx16b4n6VgeCcUJ+F6AfdvMQQ7u08o77x2y/Uko
         0ooJdGoO2dVWKXtj9N2vV2bDDOLdKcmBg6EZBk5mOnayparY1HOotuU42E2eQjX/r5Od
         jPYb2rVL2hYRiCgg/gugStIBnNmlEmZ1my5PfSlhmsr665adop0oYnWEz7dFV05AvmuS
         FdDXTMiNYpqHFn+e3Zm0Ko3jxxwtPRRVBytdZW9+Dvq5o9FMibnyYhjAiYZOvRThGs8e
         L8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaMmFTRR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e10-20020adfef0a000000b0030ae648a56csor1258408wro.6.2023.05.30.14.30.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 14:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaMmFTRR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685482233; x=1688074233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ImSubkbjbUjNZwF69C2rLByaMdghdLHpgc9tkxHRmc=;
        b=RaMmFTRRCIJ2kdIefaOIxrMB0Kn0KWTHL86uFej1S5OT9S3xrRbtdk6OwLtC3C57RL
         uKth3pDID2OFbjLUNhgjZeG6AZCKReeOrXn7j60GTIDp0GXlBFtSrF9O8/UnfJmOnnlU
         KY6XJLwhxKvmTj0w6GYUmyWfCZVrYtQCxjHLmmu2e0qJb6kvp2zjZZlz2zmIFrEXDEFq
         LbZJdbjnBOqT/9mE9TzdG1clnqeE2oSXyb8JWXC2MFOxExozgZJmIivXAF5RI3Iu8lOC
         et80wgsZaSYndKIDwdm252HkAgQ4PiadE6+Y45XFtzHPaLp5Qq8OZHFPgrGGGhsayXYE
         RDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685482233; x=1688074233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ImSubkbjbUjNZwF69C2rLByaMdghdLHpgc9tkxHRmc=;
        b=KoqwSTEzYSWmxJrgfTD6QVMagX6pivoIsuMXZNvh5YMtH1QvzwPmaWuYmZf8WC4K74
         BuOvPpu8yX6ObCrhUQGQtColawUyUGMYKro8BZU/ZIOsxV3hIJDISmzhpsNK6dAmhL/B
         rLg16Zwzasvc8ih8tfGDpEr+J0EB1OOJamI/QU1ss/JVrGwOARIc4UdkaXVGg7LSWOMC
         I2+KJfZo8ZHxqn+J1w75dUcV6g+2+5C14TyRJN9LGlCAWhM8B/kLiggeqwj2Bus8LN9P
         CVvho/jow3t+/gt9vuEtb1Cw14SvSETNiNC8t6eWlWAPmp8/vR4fAYdhNt5DIDZiGMoy
         mMow==
X-Gm-Message-State: AC+VfDyeWezIXwVoPRjh7V9cv1VjSgc2cVIC6tqi2memA+NWLQN5WoUD
	vbBnw2JCxtMRhPsUAwsig9+kvKWY
X-Google-Smtp-Source: ACHHUZ6Q6oXBqbNcPrJz6Is318zgTHrJJfNvzs9a+YrOpSAfPdV/KJrImY6rnmHSMJmcZ/sS5csanQ==
X-Received: by 2002:a5d:610e:0:b0:306:28fa:16a7 with SMTP id v14-20020a5d610e000000b0030628fa16a7mr2643895wrt.43.1685482233172;
        Tue, 30 May 2023 14:30:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.180.1])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002fae7408544sm4388866wro.108.2023.05.30.14.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 14:30:32 -0700 (PDT)
Message-ID: <515e97c8-eb14-9d74-8942-10808bdad4af@linaro.org>
Date: Tue, 30 May 2023 23:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 01/12] aspeed/hace: Initialize g_autofree pointer
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-stable <qemu-stable@nongnu.org>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SXd8f4+JixRD

On 8/5/23 09:58, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>    otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>

Cc: qemu-stable@nongnu.org

> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230421131547.2177449-1-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_hace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                 bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;
>       size_t digest_len = 0;
>       int niov = 0;
>       int i;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
