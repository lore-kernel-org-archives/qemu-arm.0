Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1244299njf;
        Mon, 2 Sep 2024 15:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFFBX90zR0aUsl0APj8MbMG2et1qXLbEkad2GcZeZ+xeXHwLDTENGr/lQrANceq3DWdtZd5l82wR4UEg==@linaro.org
X-Received: by 2002:adf:e602:0:b0:371:9377:975f with SMTP id ffacd0b85a97d-374bf05d1d8mr5809961f8f.25.1725315067358;
        Mon, 02 Sep 2024 15:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725315067; cv=none;
        d=google.com; s=arc-20160816;
        b=cUDklwguLJ6THoL5sLPtDGdc62PwdqFUHSkPa2O1SY1Gzo33W3x7PcDcOKbhSdm+7Q
         HE+nDE6H9inKprfGZe4FD658e3Tl9p6S6/Mc2vezJk6EfLJttQXFSLFkn7aVNIrpMD7y
         ve5q3SN1UlXwyEPxpbH3UlrqF9U3ENL3bNMydxhcUz1yRhvFfX/6cZvH8azfhsUzkU9H
         +RlltRb44BgGF+j/M3G7r4ceFH0C7YY+n6clFemQovpBpW4IzYQ9bceFGwVOuaXAo5vy
         qAhLngJg7OnedWyNXn21IMczgCAgPx5cuwVPK5CnYIJfhWzijfy2NYKKI4i++6fHBKW7
         iwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JskBgnUrR0VM/2FuE+LPG6LX2p1Q6bCk3Pxxj8l6LeU=;
        fh=+zEV1H7uS0m2NlHvwydB2v9VVq+U/XJ4EDo8cvM6IVQ=;
        b=wQMUPWyNJO4XwjWxxtfIebQc2bHsS2zdBfXfYx0HmutXnQQckQvecYUv02FODtCbAI
         mOzrpgsf81VY7nGToxJct8WpaHuut5HBJPkY6s0fyByoCUQXttBaVnMyThch/52d00EX
         i9gjDEG9eNgQlaLDdsHJdUavwMOYBZji5bFZZLG/SCK+D0Yfqu5jAGZmejzzV9gIxFO8
         mm/uq0WWchJQZg7kf7xmdR0ZxrRqoGn+AMk+mfLXKlGAtYsp45/umAbcsqwFP53xQEOi
         8GSU2GJQxNomcwLcYi13JiKOCiSA3r5scIw2VjvhDdv/+lhMJ8OiW7LkjxPPmrLXEwo4
         az/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3Ry2wzi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-374b5bc8edcsor1681010f8f.0.2024.09.02.15.11.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Sep 2024 15:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3Ry2wzi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725315067; x=1725919867; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JskBgnUrR0VM/2FuE+LPG6LX2p1Q6bCk3Pxxj8l6LeU=;
        b=S3Ry2wzi33YqaCP3baYCFFf+3XhzXbvggcA5KFIhXao0mzBsUzkpXWn3v8tyYC/NZ6
         y7+JxdpLMP/nswto4lSoFvdrFEooOH7wce6LCb9U1w9SFz8TWJB9qFCKuxtQsDEX0dts
         e7Ccd1EkeqhMogeXmsa76iBzCustb18coX2vE9WIWpSEKYQE6sHttnSgzpe9ahn/CkUP
         Dq5E7d+H8ckNhbz+DVvlWE/GybeI4DnuSnIfie/bLv2h+qlTMdljXZpXjIOeK6qceEyK
         gQq8TutBG/NqNlt/4kt8tq4aNINfsP+v73QW2VzNjKHBGcz2ANApVrhtEFGHFdsPrCfR
         zWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725315067; x=1725919867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JskBgnUrR0VM/2FuE+LPG6LX2p1Q6bCk3Pxxj8l6LeU=;
        b=lUjV0GbVt7n5lpD9LnoxPPWet41B08LhhotkyX7Yqqzuf2cf8Gm50eqncJLGSXuMP+
         bctLz8C8PHDtsceU2OO0eWzUphvkJOfBCDwM/IqVA1b/MgIluQ8GLp/ZBr8eSUPyvGlI
         dnIn5HIssTIx7R64b1gDCAmTfvV39EKVxpTz4mFWCt/D1ngpVY/DNgjfdU81MOcxLWNi
         FtyD6nRQBMg5Bc8JeGSXrEhKDM8n2By8gxreTb4ZH8yBCnuckH68i33qedzMOeP7eSZA
         TUOK/YgTuJn9ewdJgWxOz311O2hjZat1FN2cunnlElGUmSYg/qfd75ZwmQsuZEnqWEYf
         2dvA==
X-Forwarded-Encrypted: i=1; AJvYcCXzB93sggCwyEtwAqMk7iAFv2F1ukZqybZ+THC25DAJ8ty1S3qdEEB2u5bx5YmPlAa/bt3WkZKS4UJ8MQ==@linaro.org
X-Gm-Message-State: AOJu0YxS7hLkZ8gB3krgHyl3Dan0w3oHCH9TEZM2IUFugtPoOXCXBErV
	jm7zkyWGc/KqQRKE5JxMAUW733sdbZXdU2RKCQl9RnAnZj2eDpPMLJ+isAQwVna64A==
X-Google-Smtp-Source: AGHT+IF9sZoxNMZkOxT+oweOAiua6Eq1hljv3YCwFUBJFfg12ei9d+cTNnqgiHLf/HyoI8veUcnKFA==
X-Received: by 2002:a5d:6b91:0:b0:367:991d:8b76 with SMTP id ffacd0b85a97d-374bf04f7b7mr4674524f8f.15.1725315066499;
        Mon, 02 Sep 2024 15:11:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm149588255e9.19.2024.09.02.15.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 15:11:05 -0700 (PDT)
Message-ID: <f4cd3718-5775-4d88-92f4-48427895d4f2@linaro.org>
Date: Tue, 3 Sep 2024 00:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/arm/tcg: refine cache descriptions with a
 wrapper
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: linuxarm@huawei.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com,
 Jonathan.Cameron@Huawei.com, alex.bennee@linaro.org, jiangkunkun@huawei.com
References: <20240902203211.270-1-alireza.sanaee@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240902203211.270-1-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ld+bNxdeyTwY

Hi Alireza,

On 2/9/24 22:32, Alireza Sanaee wrote:
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

---

[cut]

> Changes from v2 [3] -> v3:
> 
> 1) add only one function instead of ccsidr32 and ccsidr64
> 2) use deposit32 and deposit64 in ccsidr function
> 
---

> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
> https://developer.arm.com/documentation/ddi0487/latest/

---

[cut]

> [3] https://lore.kernel.org/qemu-devel/20240830184713.224-1-alireza.sanaee@huawei.com/
> 

---

> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   target/arm/cpu-features.h |  50 ++++++++++++++++++
>   target/arm/cpu64.c        |  19 ++++---
>   target/arm/tcg/cpu64.c    | 108 +++++++++++++++++++-------------------
>   3 files changed, 117 insertions(+), 60 deletions(-)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index c59ca104fe..ef40b0dfdc 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1022,6 +1022,56 @@ static inline bool isar_feature_any_evt(const ARMISARegisters *id)
>       return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
>   }
>   
> +typedef enum {
> +    CCSIDR_FORMAT_LEGACY,
> +    CCSIDR_FORMAT_CCIDX,
> +} CCSIDRFormat;
> +
> +static inline uint64_t make_ccsidr(CCSIDRFormat format, unsigned assoc,
> +                                   unsigned linesize, unsigned cachesize,
> +                                   uint8_t flags)
> +{
> +    unsigned lg_linesize = ctz32(linesize);
> +    unsigned sets;
> +    uint32_t ccsidr32 = 0;
> +    uint64_t ccsidr64 = 0;

deposit32() works with unsigned so you can use 'uint64_t ccsidr' for
both cases and return once.

> +
> +    assert(assoc != 0);
> +    assert(is_power_of_2(linesize));

As mentioned in v2, if you insist in using an inlined method, you have
to include "qemu/host-utils.h" to get is_power_of_2() declaration.

If the inlining is proven problematic later we can still un-inline
it, so as this is an useful cleanup (preferably with one 'ccsidr'
variable and the include):

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    assert(lg_linesize >= 4 && lg_linesize <= 7 + 4);
> +
> +    /* sets * associativity * linesize == cachesize. */
> +    sets = cachesize / (assoc * linesize);
> +    assert(cachesize % (assoc * linesize) == 0);
> +
> +    if (format == CCSIDR_FORMAT_LEGACY) {
> +        /*
> +         * The 32-bit CCSIDR format is:
> +         *   [27:13] number of sets - 1
> +         *   [12:3]  associativity - 1
> +         *   [2:0]   log2(linesize) - 4
> +         *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
> +         */
> +        ccsidr32 = deposit32(ccsidr32, 28,  4, flags);
> +        ccsidr32 = deposit32(ccsidr32, 13, 15, sets - 1);
> +        ccsidr32 = deposit32(ccsidr32,  3, 10, assoc - 1);
> +        ccsidr32 = deposit32(ccsidr32,  0,  3, lg_linesize - 4);
> +        return (uint64_t)ccsidr32;
> +    } else {
> +        /*
> +         * The 64-bit CCSIDR_EL1 format is:
> +         *   [55:32] number of sets - 1
> +         *   [23:3]  associativity - 1
> +         *   [2:0]   log2(linesize) - 4
> +         *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
> +         */
> +        ccsidr64 = deposit64(ccsidr64, 32, 24, sets - 1);
> +        ccsidr64 = deposit64(ccsidr64,  3, 21, assoc - 1);
> +        ccsidr64 = deposit64(ccsidr64,  0,  3, lg_linesize - 4);
> +        return ccsidr64;
> +    }
> +}
