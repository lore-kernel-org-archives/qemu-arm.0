Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1433296njf;
        Tue, 3 Sep 2024 06:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8U2p2DYiRcqbO6gurHatFMrej9lIZ0xeA7n/kT4JdiLfx+1S8DFvl8s1JdCbCLDaUfhu63jW13cRc4A==@linaro.org
X-Received: by 2002:a5d:5586:0:b0:371:844f:e0c with SMTP id ffacd0b85a97d-374bce97a99mr7919781f8f.10.1725369523436;
        Tue, 03 Sep 2024 06:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725369523; cv=none;
        d=google.com; s=arc-20160816;
        b=qfL0SVh8p4VME/oPRJBw3SlvSvyJtF7xwmKboTMMzw9tcROCGa+UETA6yu1Mr4oT4y
         B8KVLXuBPcjfI8Q8D0RRvDlYFG2YIgAv+5aDX0LYYbokNyAVelCX/Ybl7TpA+P7+jW5h
         zz/0xyP3NTQyRMR6zi67iRj097TWoburmGsSYAjdzjhPizWEb+FyTny5rPP9mDXrkyFR
         7EHCDX+/Z8IbMVJIfZ24IHxr0xCAFrAC+UEWaiTz7v7q4XqT9c623BuJIKkc0kIcHyXQ
         BYrpXTCbIDFMv+CYS73VrHWXD/3aw3smBaJqJDatOGHTy2dJvpe4lpuCeBHuHFxF7B5Z
         J59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NKCLUNEmRz23/+dRcGIxS6GdAtfM6ay5Pf5/UaZssMo=;
        fh=y5UsI3eCfhVpLTF8Vpgu8s52j88Zc8VvqStf8O0zp1U=;
        b=H8qIeO/VLgtoii9okjGb/QPfXPz3k+JvJoCKT9iAOXH74ydtPBcCPT0Y4FhOcZcAt0
         AzUpOk3Z907YpPtQ8CSN+YTE0zajPkx13I8vU5brG57asIHaGzg5OMnml7PZ5oK5m/Ds
         DX2KHEB9oWBnApuPNq92eCJ7M5V8YWT9wWqddKkS3AYCoM2tebx3OIB7tZgd4pdU+4SW
         G1kHikDA1VB5tKcFkJXJxTHpTAGKyezX2qFKKa/1dBVNgg3id1jwmrl+kEVx1tzfv4dj
         8MUKPy3CYasun1x9COkJ/P1YUWnEKqtIEDTXrKPlQBNNJJvxDWf31oneP9Q2ifd5k0Mr
         ItAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMYyJTIx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42c878efbcbsor10575555e9.2.2024.09.03.06.18.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Sep 2024 06:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMYyJTIx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725369523; x=1725974323; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKCLUNEmRz23/+dRcGIxS6GdAtfM6ay5Pf5/UaZssMo=;
        b=YMYyJTIxE32EfDP0gWovD2TBEZJdcUVPQUniguR3ovUu0BnSL8ffUZwG1C5yGHgxSQ
         6h5xbGqG19sqXMkYJjaGpmadvc904l7S6t7xxXDjpqbfq3JEVwk+ODWLBPN/kQsikEjZ
         7SyMzuwsC94W6VOtwKQn5WH1C2mj5DijSQf0R6JXFC0a7MLVL6LQX0GUDOXA5y7nxitN
         XythP81+mlnFgzbpdlz82yOEyDMj77L000CRBHH74VeuGQfhZaUXWYA0yb61Kz7alouF
         /V1gMyGVwG/TD+PO6hDrTdXgsATTn+45qojkaKOyEPUvplhbayCSLYIrorHhMwv/lU4+
         t45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725369523; x=1725974323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKCLUNEmRz23/+dRcGIxS6GdAtfM6ay5Pf5/UaZssMo=;
        b=CqvuAuxtFrDq6MKBnCt347sgvBkUxzABq9UphhzV6lKWc5Ys9qip7bPsk3eY84Sv+2
         kEAiOf7QcsqWRaICBnZ4NuZvqPJv4cS0vFUUHNSnmM2Mz0F9aC1+0jmc8kcUjiXB8kHS
         epLF4GNhW3PfgO/FPJn5XWhNzMR46hFfDy3R0ty/T06ikm+YKQepdchefZsDP2Q0srR0
         vVC3I6WWSE4hmpon8CD34EAK6Wrwywg2LLYp8dBMJ1iO+aWiRKYu9gVo6pfTpbOgLEcj
         DkrFOJRFro6isDWlL7zllIkNWetf/3wxbkNKHuC1Yy05i9ROsRvsFODwvdJvI3jSMY63
         O6cA==
X-Forwarded-Encrypted: i=1; AJvYcCVx/n1lDuOIhGJQeT6N3ZNJ+2i1Y2sxJpyXnvD8UUjjXyVFV88ibvRkcymXsKKB/MS2Smy9AjPpWFsOeA==@linaro.org
X-Gm-Message-State: AOJu0YzVmDgPE2IzICJPt1zc4rTMw0Fa5Hw3cnbnnkwgDVp2yWKvVvfa
	k2h6eoESDRJ/6wQa9reduQprqQV27WVXhNzYzHgvvJ0xHUO1kzl5RP9DghcsihfQ+A==
X-Google-Smtp-Source: AGHT+IGILYaDUbIE03G7aTho502+vRVy2GX2F5LCnL6nHSHaX4rsDujyzv//R6HTG/DFgVv1xaXPgA==
X-Received: by 2002:a05:600c:3c8b:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-42bdc64e46dmr68489655e9.26.1725369522570;
        Tue, 03 Sep 2024 06:18:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df936dsm170731555e9.28.2024.09.03.06.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 06:18:41 -0700 (PDT)
Message-ID: <7fda2f7c-091f-4b8b-bd61-5f8fcbbcf8ba@linaro.org>
Date: Tue, 3 Sep 2024 15:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] target/arm/tcg: refine cache descriptions with a
 wrapper
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: linuxarm@huawei.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com,
 Jonathan.Cameron@Huawei.com, alex.bennee@linaro.org, jiangkunkun@huawei.com
References: <20240903083520.209-1-alireza.sanaee@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903083520.209-1-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aY5qMmvCNj3b

On 3/9/24 10:35, Alireza Sanaee wrote:
> This patch allows for easier manipulation of the cache description
> register, CCSIDR. Which is helpful for testing as well. Currently,
> numbers get hard-coded and might be prone to errors.
> 
> Therefore, this patch adds a wrapper for different types of CPUs
> available in tcg to decribe caches. One function `make_ccsidr` supports
> two cases by carrying a parameter as FORMAT that can be LEGACY and
> CCIDX which determines the specification of the register.
> 
> For CCSIDR register, 32 bit version follows specification [1].
> Conversely, 64 bit version follows specification [2].

This is the commit description,

---

this part is not relevant in the git history and can go
(hopefully the maintainer can do that for you),

> 
> Changes from v2 [3] -> v3:
> 
> 1) add only one function instead of ccsidr32 and ccsidr64
> 2) use deposit32 and deposit64 in ccsidr function
> 
> Chnages from v3 [4] -> v4:
> 1) Use only one variable in the make_ccsidr function.
> 2) Include qemu/host-utils.h to get is_power_of_2() declaration.
> 
---

keeping these references,

> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
> https://developer.arm.com/documentation/ddi0487/latest/

---

and dropping these ones.

> [3] https://lore.kernel.org/qemu-devel/20240830184713.224-1-alireza.sanaee@huawei.com/
> [4] https://lore.kernel.org/qemu-devel/20240902203211.270-1-alireza.sanaee@huawei.com/
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   target/arm/cpu-features.h |  50 ++++++++++++++++++
>   target/arm/cpu64.c        |  19 ++++---
>   target/arm/tcg/cpu64.c    | 108 +++++++++++++++++++-------------------
>   3 files changed, 117 insertions(+), 60 deletions(-)

Thanks for the iterations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
