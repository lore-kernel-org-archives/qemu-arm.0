Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3406085lfk;
        Sun, 12 Dec 2021 10:41:00 -0800 (PST)
X-Received: by 2002:a63:6907:: with SMTP id e7mr48447358pgc.481.1639334459997;
        Sun, 12 Dec 2021 10:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639334459; cv=none;
        d=google.com; s=arc-20160816;
        b=FrXZ1Xkd7j6nER89Zhz9GpUNrvkm117FySf44xMav5dsqDkxx7BYb1JqgBzVQjQ0g+
         /0PoxfH7pFt8hnKKhK7y207Zf5+peYp+Wle5yoYymeHgXlfF/J6MtBcJw/LMdtc/s+EM
         EwZJAZ6crY21/PM8kAzNMZSfoQetOGPriqLspbagydoiuiMWZEyt53XQvjmmJrUF3O8p
         4LahNe47n1SY/OL5TIhagrh7XuDn5rSWmGTqZE0g3P/a0CIwdEHe7Zk3G1v356XvDc4y
         F+irOeMJkjnuDNrw+Q9QESwU1/cp58+l0kCukmzNy8z1pqnzhUtqck81DspBN5+qoS9P
         bqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CrXfzSUW24qLsRryQEUuHDcqLFeAuK3a8SD9wIXDpd4=;
        b=kU3cNqZOdYvPSOCQkmmXLWelxSWAd1gRvJFNQNX/I7Uv5b6y2A8YqXfNeiaGX6hHpD
         ghkHVDHlVweJR+RWzzmwjHzI2xn41mv7ZzMTKCwSDY/boLX5kEeYYaoX8JMjR9obNs0t
         eK5MKk6RTEMVWa4oHJ+y7FQ7IVJOU3x+2hT9sFLPuHtEOgoDGZwjgEa5uuHIEvdyMmYH
         RkpMjqODQ0rCIAmi/UWJvgje3DJuc9T6+cAFE927GXqWZfHSa1JzhzwYafuPamayoG5M
         Ywgz/vvgUqQu78lwQc7TzQ9daL/KyA2bzSx7r/NN0eRbMEwgL0VbugbeqeEflSAfRGpZ
         tU8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KV1kWzc0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g62sor760491pgc.72.2021.12.12.10.40.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 10:40:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KV1kWzc0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CrXfzSUW24qLsRryQEUuHDcqLFeAuK3a8SD9wIXDpd4=;
        b=KV1kWzc0fVnZ3hrvE4U4OibHaXvn+BlT/zdcz396eCQwRNZCRVSqLne0LZo/fuSEMi
         mCNawiblksOH0fvKGKXcmqoIg/mKUsevlUusLdCV3XppqdkNVq1U7YtE4tZq0jUuCfpv
         xAd59SQd/ZLkspwJw36PIqNyZxciaiRI7+wP6LORZCJErRFKD1c09uRa/Bi7zfSSwmFj
         SUP5SsQxiktfmIE4BeGYGnTWwReocCCPSiHpGnMP5ViBZUx691ZhYYWN20LEJ0IQuRqQ
         NqhuBsXFP0j8sRp16YBVaezef6z787W2PgtfghJ+UeHOv9KXMLdv0kA21sxFI84kcn+x
         TIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CrXfzSUW24qLsRryQEUuHDcqLFeAuK3a8SD9wIXDpd4=;
        b=XCHGY2eohmP1/2V/0UeVNTjkQhM7pwULYfR0AbWAOgYO2hL0If51TLFh+MRLa1BO8V
         rvNdl46q9Y3O/I5q8UGlAELqKZbv113XDvMP8/poZZMWM5dfn3R7hZLcyZLGEWKJ6TOF
         KjQ/p1OCKJ8NhXIvSTvTQceq6s2FL8HsrECaxo6c7Wp9Cw+BySHtcGqSfUaAiXj9TjnO
         R0O9/73F3W5AJ2kWe3CRusDVUL8+4NPBA9Z7jwgENxg38kqAgDA2v26q187xsvTML1Bu
         sOnKv/mVjrNYSGB/VY7RLHWjHOXN2sXhbYMXCSEYhuuZEvmpXGQpjfCui/w5kkTAhyn3
         NkCw==
X-Gm-Message-State: AOAM531iE5JtOtrbiqCh8QNimkUGQGJ+25WIN2g4xHFsaBHWFvxhOa4t
	YoobHmpEhymAUz2RTA+UuWzjdp8Ywr4fvLim
X-Google-Smtp-Source: ABdhPJy80cTEwticOOHR8YhshWvXfTURpK3gKc6ES+EL+9p5IGKL+/RLiDry0j5Ml6ztL+EkVK1Ixw==
X-Received: by 2002:a65:4381:: with SMTP id m1mr4185807pgp.375.1639334459465;
        Sun, 12 Dec 2021 10:40:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id t191sm2525331pgd.3.2021.12.12.10.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:40:58 -0800 (PST)
Subject: Re: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse
 GITS_TYPE_PHYSICAL define
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f878f8b5-f439-d410-06a8-386b1d93cbd9@linaro.org>
Date: Sun, 12 Dec 2021 10:40:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: MPTCjZAnvLla

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The GITS_TYPE_PHYSICAL define is the value we set the
> GITS_TYPER.Physical field to -- this is 1 to indicate that we support
> physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
> field.) We also use this define as the *value* that we write into an
> interrupt translation table entry's INTTYPE field, which should be 1
> for a physical interrupt and 0 for a virtual interrupt.  Finally, we
> use it as a *mask* when we read the interrupt translation table entry
> INTTYPE field.
> 
> Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
> ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
> field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
> use of the FIELD() macro to define the fields of an ITE and the
> FIELD_EX64() and FIELD_DP64() macros to read and write them.
> We use ITE in the new setup, rather than ITE_ENTRY, because
> ITE stands for "Interrupt translation entry" and so the extra
> "entry" would be redundant.
> 
> We take the opportunity to correct the name of the field that holds
> the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
> GICv3, which is why we were calling it the 'spurious' field).
> 
> The GITS_TYPE_PHYSICAL define is then used in only one place, where
> we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
> essentially a boolean, hiding the '1' value behind a macro is more
> confusing than helpful, so expand out the macro there and remove the
> define entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 26 ++++++++++++++------------
>   hw/intc/arm_gicv3_its.c  | 30 +++++++++++++-----------------
>   2 files changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
