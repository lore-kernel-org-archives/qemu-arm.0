Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp65599lfk;
        Thu, 27 Jan 2022 19:12:11 -0800 (PST)
X-Received: by 2002:a17:902:9a02:: with SMTP id v2mr6716741plp.138.1643339531204;
        Thu, 27 Jan 2022 19:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339531; cv=none;
        d=google.com; s=arc-20160816;
        b=a/XflqZmHjIO7HXg24jNkYU9yXS05Fq3KmYzQT0YXB9zl1K6W1d8aIyKSN1KAKI9uY
         gz9gAnxJHhlVc4PBUSCYyd/EkDPqavp2kxYsog5mH7GmSPU0BVC6emiN/0D/hu1mp2Z6
         FotzacHnaRClPVzmosxFJc7wfq7BZ3vNvcA4vmDWkP+pzH5jC3XZoY9t1rxd7dyAnq8o
         Jz3vhcHmlanGQlA+1wEaMG1DLgkwuJbZaI5nGAAQV/uW41JWa2uxnuLGlFS6xeQDuYx6
         OFjLR4AGg2Z0u6IoYoEl/wKXuoVS24tRExj5I5eylC3fpChZfDjNbC5iIdfffTjvJRNJ
         hqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q75phySsGtxd9QnzfTnWdDBiB9wfLlzN3qw40EZsVto=;
        b=vnug+qEYcxkUAhxWT7z+opnXcdqu+D+I0a0JtZOHZUmzOPs4qq2sCjfQm3dlcZexPn
         zokUx3BBkGuHI6dlq7aartbUOa9M4r+j1V0bOnxORVNJ8r+t9JceEoP4RRZ3kiu+O2Oq
         2noqTUrNtwjUAprQqv/z42bMGy6YqWHWF/ciY5xsoBMkbiYejB2BnK2vEGtdGFdrVmVG
         0cSpHR3IvVgSY8araQhmAq8Ulk9mqy5al0jJ8vTeadrWE4pJWB0KfUvAb5IHwDLYk+Zl
         L3AUqnRJ0EcQ8JrUbIeL9Cmy3MM8smP89+BJGEKbpcgXevIazuSyaJ+iLo+2PIgwz4YJ
         mePw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxy94r5L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id md15sor494068pjb.34.2022.01.27.19.12.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:12:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxy94r5L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q75phySsGtxd9QnzfTnWdDBiB9wfLlzN3qw40EZsVto=;
        b=yxy94r5LYqr4TKCmTaJ9s72InXt0Ld3FTkp0Ux/lDZNnVWm4/6hV2q1sbreoziPosu
         afCCXr7X5rPomo9TVQqc7BI4781tpgtUUCBqG+aUxM9IuJwLBCPrqKxtsfTuUFmAtl8F
         JJcniPe3gcee0IFv7wM03Gaaj1lwsFDskn/5LZdFWfdnds/jpyKNtcjEQUFVB7XTOI/n
         6AEEQwAfm0gr/VnHl2tn1bSRLsgX14gbPr+Xgs3IPsqa+ZPcqtV8VMgFlafbv5ePVex/
         csi5rau1bb+bK4FVvxKkrwLsDhs2KLkUXBmXa4VhmZWCVxAxm6hNGyjGcrva/MVsXfKq
         hfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q75phySsGtxd9QnzfTnWdDBiB9wfLlzN3qw40EZsVto=;
        b=wZTpHMn8/rbMw8uIIppYgoxMBYpksMx85YsQF/wRDsXCbjDN4W7g3IMv4P8F0vg8JB
         kVLxAnpRbE8RSb/BsfCd8IbX7Oxwm+5sPNwQuJA/lQFUSKQbC48quapDyELEMU/rqn1z
         20moVib2o6wmWKTRVxVuLJ3rbkNZPIheXnLXbz2HxOMTSPRmWss6nESbLPoNbO7Q7rmC
         EQXcjBi80BpVajK2aKO82mvHYeIPyGGzR7ZdkQT4lOV3PBkgZrr33p9B3Q/joqpbTR1f
         3rKZdyodB3ThPUU01iwVrzkx8M1UTJZs4w+o/r9MsrsEkRZsJiwsMQX27Pd7ig3HBVEO
         rXYw==
X-Gm-Message-State: AOAM532UbjnkhBIR9QOXO+Q5WVU3CtUdRZvDhxaxXqSOorgaAEAZFrTQ
	L+Izd9OKY77+BTAGGuD8EO4WoHJ6
X-Google-Smtp-Source: ABdhPJwAHzO8dzLgy7/bFSH/SkwJLb9SwpuA4JDKagjq9gwTnhdsc3AKCa9RUQ8utsMMcdUJgCk2zQ==
X-Received: by 2002:a17:90b:2281:: with SMTP id kx1mr7596563pjb.60.1643339530767;
        Thu, 27 Jan 2022 19:12:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id z13sm3938486pfh.45.2022.01.27.19.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:12:10 -0800 (PST)
Message-ID: <540229ae-75ca-d492-a045-cc20ddfe49fb@linaro.org>
Date: Fri, 28 Jan 2022 14:12:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/14] hw/intc/arm_gicv3: Initialise dma_as in GIC, not
 ITS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 46vy3U78FV0j

On 1/23/22 05:24, Peter Maydell wrote:
> In our implementation, all ITSes connected to a GIC share a single
> AddressSpace, which we keep in the GICv3State::dma_as field and
> initialized based on the GIC's 'sysmem' property. The right place
> to set it up by calling address_space_init() is therefore in the
> GIC's realize method, not the ITS's realize.
> 
> This fixes a theoretical bug where QEMU hangs on startup if the board
> model creates two ITSes connected to the same GIC -- we would call
> address_space_init() twice on the same AddressSpace*, which creates
> an infinite loop in the QTAILQ that softmmu/memory.c uses to store
> its list of AddressSpaces and causes any subsequent attempt to
> iterate through that list to loop forever.  There aren't any board
> models like that in the tree at the moment, though.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 5 +++++
>   hw/intc/arm_gicv3_its.c    | 3 ---
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
