Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1482932njf;
        Tue, 3 Sep 2024 08:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhI9Ddog3mjTBFv2qKV01cBM3lBDsrEyQiP8VQ78HE6/qu/cfXDYY1v/5UZtR6y+N162b1W7R8ljkHpQ==@linaro.org
X-Received: by 2002:a5d:6892:0:b0:371:86bc:6c05 with SMTP id ffacd0b85a97d-374c945549amr5214581f8f.10.1725377031525;
        Tue, 03 Sep 2024 08:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725377031; cv=none;
        d=google.com; s=arc-20160816;
        b=CR1apC7o+zc7AlUNyP6NcPG3t21KRt54cExZdT2VUSxXkNNscxAr/JY4fLCKPCnq46
         9pXNeqZzBFYduSq039a/ztbOfpqiz2xV4xHexQTvCezczc7yWllWSmwmoQjCOWH1EQoA
         ze0xTPniFhEnMdkPZcU61an6xucm88LAn6xt7b3Kccm/lEQzFYmTThAPlypc5nBrhV9a
         j3xHBz1lqdIJvVR7ootvWRVVV1ofAdiEWUfRlWhFUGpEG5QvdbKfKAHtcZDGLeek4h4t
         iyBF4XxrUg0t7XRo5ruUHigtMYx9fQWd6l5zTCHPpn8igIXz/T1ismo7+J/Bd9eOL7Tm
         jZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iT5pBN8PxBTkq82fOMKVzoFYg8GWHcdkhNz9qrdMkRU=;
        fh=0iIUJS4VncrclAK57SATElfrbemBZSP/hcyllXRY8os=;
        b=EzvAKuPWZE43uK7EhJC9QCIfN799N+D3/PDWJ6fIqKNvLhwa3yrLtSj+XUZ3Mv1KQ3
         iaeHvfCr6ihzNdvVrgGDggs/62iWrxRYA2effA7yOekowC/iXQ1voMqlbWFA7izLYRfL
         hQUKMwoZL8jRz5hp0tfw352b+5gBOMwRJfFajjIu794IkjSNoZNUhhCr1592z+OtdkN4
         XPMr1uOurVsaLGV9gofA8eMCDcc0bWvEFSSfvBmu3veIScI4HxUPUmWLpg6QdcqmUgsD
         8rDcvKdgN3gyWHbGLaL/uJLtaaG0dcYtb5VMpocuIavpOe2dSP7M6nWFprPbQ/IXt+RD
         SO0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/Fs7F+G";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-374c57e223asor1219879f8f.3.2024.09.03.08.23.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Sep 2024 08:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/Fs7F+G";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725377031; x=1725981831; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iT5pBN8PxBTkq82fOMKVzoFYg8GWHcdkhNz9qrdMkRU=;
        b=x/Fs7F+GDT4Rxdy5CyRoir3on6oQyEZl3mWz4XrgKJ1c200aQ49Zb+xEfYBW+E4BeE
         CEQf51z4bhcmPCVPC9BbEe6MafvvZqaENwiYWW7QQZH6QnTsmGXDJByboe7LHA4ypykT
         QO85HGoRrPT+r159kwswdYY/o/GqFQlnVT9L6xV1iKItgpsED+ik46Xh96vmGTZGk+n2
         YGj75RnVwbpEC9EPCK4JfJ6iN2A1+1HIDT/QqhGJlNA6DyCGkkze09LCg/2wyayDs/bB
         lARDaUXWgzF9SQ8fvaudxbvoy2NB9i1/5QtL/631G28gf9r2wKSg4LqDeIMNmGMezDYG
         KI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377031; x=1725981831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT5pBN8PxBTkq82fOMKVzoFYg8GWHcdkhNz9qrdMkRU=;
        b=HsjJ/2rLgo8I0osvBXyW+xObTKJpFvWf0sxtlAZ5RK6aHBlmSDnajJBj5BvUKloyS9
         VnzpHyCijh9rdBmj6+GhrWGbGfxHL1UQAwD0osWFKY2cQHz5mA3eXPnp92Nmx5yVjIz+
         X5nCIGpnr0Mk47ZbOips+i5V9Z9IlsTyJXurfU6jNtwQpEmS6KmcO7Kjd1Ya3G+Zow5B
         sRqTt23Zi9MrRXCPh+msp3clLp8k5H9N4tziYnn8a10LlTAHkzyi5mizoPKGSCq5JXPh
         m81MMZiUmidNrtQy/a5FxLpPR8Q9/FvH6VF5cl6rV/Fb13MEfhEX4vGtuDOzzcCS3S50
         Lw+g==
X-Forwarded-Encrypted: i=1; AJvYcCXntZ30GYURxdVsyKa7DEB6gwmwRauCSI/uf2FelsoN3wxuL60ZE5kJhq5IUtoz7lT05eo1mDKHZewCHA==@linaro.org
X-Gm-Message-State: AOJu0Yw5rqWVEEJinGPVuE21eaMxS+zrWrmCUkrIkQxYi76dQ3UE5ixQ
	YOods4cGjrFMjxJSThwnPpclBuBFIwWffc6In+QJqEW2l5iMsLr6CRsDTTc2TElwbw==
X-Google-Smtp-Source: AGHT+IEMsfaZ7ob0Ym1L9PXiOpsYdgs2mYgQj5vYY9SsyfvXMu4jQ2YQ72ytU39m2gw6MhwTIWhtdg==
X-Received: by 2002:a5d:5184:0:b0:374:b960:f847 with SMTP id ffacd0b85a97d-374c947189amr4199068f8f.41.1725377030793;
        Tue, 03 Sep 2024 08:23:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e2737dsm174239655e9.29.2024.09.03.08.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:23:50 -0700 (PDT)
Message-ID: <c07957a1-fb5c-4973-aa7d-220ad06a0889@linaro.org>
Date: Tue, 3 Sep 2024 17:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] target/arm/tcg: refine cache descriptions with a
 wrapper
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: linuxarm@huawei.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com,
 Jonathan.Cameron@Huawei.com, alex.bennee@linaro.org, jiangkunkun@huawei.com
References: <20240903144550.280-1-alireza.sanaee@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903144550.280-1-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pxkPoaASjpAc

On 3/9/24 16:45, Alireza Sanaee wrote:
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
> 
> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
> https://developer.arm.com/documentation/ddi0487/latest/
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   target/arm/cpu-features.h |  50 ++++++++++++++++++
>   target/arm/cpu64.c        |  19 ++++---
>   target/arm/tcg/cpu64.c    | 108 +++++++++++++++++++-------------------
>   3 files changed, 117 insertions(+), 60 deletions(-)

For minor / doc changes it helps reviewer to carry their tag ;)
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#proper-use-of-reviewed-by-tags-can-aid-review

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
