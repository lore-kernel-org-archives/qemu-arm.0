Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4087531lfk;
        Mon, 13 Dec 2021 05:03:59 -0800 (PST)
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr38589533wmj.29.1639400639119;
        Mon, 13 Dec 2021 05:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639400639; cv=none;
        d=google.com; s=arc-20160816;
        b=A/XKRMysTUG4kYb0feBTs2fNbejATDaN1ckKvxM4wTUczHJyT9dA6ANLQyRxGR7rvU
         ZdX0KjWxL8nl0Ymnjm1PNAIT+V/ZGhjkc7eYN6FQJrfFjU+9QpbhpQ8OVTPGgugpaGS8
         ZURv7YOhSRG0bRArwcyPZA/5BeUN8bIIJ7crMvaxwWgXEwdpl3ahL+ETXUrgm6nJ9MgL
         HMKCPXAVLSrKTbzhIV4bblGmc6jBQ/QfEDEy40Vf8WQJd0OZ4gGsV4usPtwjBoogU8dY
         pK39NIKfLG+Sz4OzDrj5gYraOS0iIg3wHEy49TKG+v2aduoYO5gaHO/uBIFAk15nuUpI
         pajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=udyZOmfkY52ckwFmaJ4bNi3wiYs1JewWnVaW66jodVQ=;
        b=qXT7sAJAZhPuu5ZNUjxxwsJNBBnLSnYIAn0aHjOHFxxGWeRNycPlVeYwarV1LCqP3L
         GD0C15O0M0GmLbRqSrHjK4V9KihbwoOTlPAlJQ2HcCqmvCMMwBrG4Aep0QtlgrgXpdwU
         B/dAAL7P5bUtVcqO8fXhxYVEI3AbQg1y6/WJXZLVYbr1NQklnHZrL8z0iUJc6UZo4bkz
         ihsFd8s5hWluZG6WuyrGiUSfLfWMEXleTOrLJ4lG7Y3YtYUDE2GK9nk1b4UuMnIU+wPr
         1VR4CtO6rcY0NOinSNHBsB0OezxvqHsqJpUwsU+leWzMM5EsLXlx7pxu11X9BgMab1Ko
         LXSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E86ODDtC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m32sor3268318wms.14.2021.12.13.05.03.58
        (Google Transport Security);
        Mon, 13 Dec 2021 05:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E86ODDtC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=udyZOmfkY52ckwFmaJ4bNi3wiYs1JewWnVaW66jodVQ=;
        b=E86ODDtCFDp9QnOVNljOKw5XNesCCpBi6BWuYzF5URd13hwm+sctzYaSnSB69FHbXz
         xr5NLmsytmC+t4fPPOfwS8rkl8T/yjqfcbIGkM3wzOaNQ5coaZLeMFKJoDj3bDwYNtDN
         oecIJr/Ta9L+a2voCLiFjoTkPwTiNnXT3LtzAXo2UbaAHSYPKBmsjeI/QO07fblAHnBY
         vBy7RXb/sL+v7mvt+jXfM77a07gEweEyCy02liudSio6AZ58XDV/mnrU0Tsae0hlz1MJ
         MOqlKA0iaxxLBDizc+QqoAs/t1ht5SFa5QvlX3yDgcjTA6umgd3Hd9F6vQF+oh5hGC6h
         ez5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=udyZOmfkY52ckwFmaJ4bNi3wiYs1JewWnVaW66jodVQ=;
        b=WGH686WLJNgrWy9CjQOC/AHzZq5nQCqwL4fkHiSBCwthgBUUv1NjSrDIPLvNPJBRCI
         tucTPlrToelXgd8ljGho5IUj6VbFDufdh7FRPKapk5LVm/McvmaMymov/Kr6L8N56ffK
         WzcfX5jJGQVMwmLKEdxRUsdFEzVbk/4cTm52RA0S3a1YvyhW8+HnYa9PrKc7xJrKv3Lu
         3MJdPlPoevBh0erjItwvWZSqHiJG4XkHzDhxddVX6BqbKXbX2akbjb4LvqSCXaewntRx
         R/6qcuKZo4UVrMl7vGjWSj1GAp6mS8BUDtxhQXbeniJC+QLsrYiZZObx3/065k2C4CiE
         OqDw==
X-Gm-Message-State: AOAM530gMDz3PDNe6QBgZsbdFOpBVSioCCnyJwp1kryqaPyex46nDQMB
	/EyL4bnEgfRiY/Xsp9kfSaFJdbYUG8y8XQ==
X-Google-Smtp-Source: ABdhPJys/ZzswMdACcWIfZlBVduKxLYGO4B7pExzWcArXTCnGh3bWPGHNlozQ3LmPe0laBjSWcMiKQ==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr13814517wmj.35.1639400638510;
        Mon, 13 Dec 2021 05:03:58 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net. [188.86.27.180])
        by smtp.gmail.com with ESMTPSA id l3sm7380562wmq.46.2021.12.13.05.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:03:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <26e8be2c-10da-3ea2-0624-1253d85fb1bd@amsat.org>
Date: Mon, 13 Dec 2021 14:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LA209KTyIc05

On 12/11/21 20:11, Peter Maydell wrote:
> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
> 
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
> 
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index f3eba92946d..59dd564d91c 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -45,6 +45,23 @@ typedef struct {
>      uint64_t itel;
>  } IteEntry;
>  
> +/*
> + * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
> + * if a command parameter is not correct. These include both "stall
> + * processing of the command queue" and "ignore this command, and
> + * keep processing the queue". In our implementation we choose that
> + * memory transaction errors reading the command packet provoke a
> + * stall, but errors in parameters cause us to ignore the command
> + * and continue processing.
> + * The process_* functions which handle invididual ITS commands all

Typo "individual".

> + * return an ItsCmdResult which tells process_cmdq() whether it should
> + * stall or keep going.
> + */
> +typedef enum ItsCmdResult {
> +    CMD_STALL = 0,
> +    CMD_CONTINUE = 1,
> +} ItsCmdResult;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
