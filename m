Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp77101ejc;
        Wed, 22 Feb 2023 14:14:42 -0800 (PST)
X-Received: by 2002:a17:902:cece:b0:19a:973b:b615 with SMTP id d14-20020a170902cece00b0019a973bb615mr14757787plg.36.1677104082585;
        Wed, 22 Feb 2023 14:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677104082; cv=none;
        d=google.com; s=arc-20160816;
        b=JH4YPxiHs2qivDz9lM/IaYvzgY71qrUTk8VHfQ+m1Jhi0VqPQFgdOw4bmX3P9vkj4+
         YOJ7RiwRn5RJ0Q+3+VZ3yNEJogoOpaGu7JodKvaNVlche74yk54gImfi9bgopnfMUrMJ
         JMTy30Zwokof2kIQZQ5xuWAk5prmpbdihH4b02yR1Xx7u3L2RveKUiKqKlNPkIH3Kztn
         rA+ILJMWXm69ZNAOlF9yo5NtXO0JUvERX4DNTEitWKbK1ja+qOScVxnGwSAEEbSIxovM
         w5xrtuCP6A+jNqxHDav8YOp5NCGtsRHvNh9d5aqmIhLxRGGrA15595Me4bbER9dMQL3A
         VpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ixxLxJ0Xfd0Bhj6NjchLM61v85VOUc/tIPHDgotylVQ=;
        b=pD5EB2Iz29Lc7YUZWWenWubgFKs+JvueD5Nz6+oVmvEEJsipb7BJH/ll5Sz1OuyYQk
         EtdsNYLa7aPPFWdB651/WieT+xpyLNE6Lxu+5bkAVdFvYGEWQyA5bud951MBwluD2Ag2
         u7p9jlhkY8Jvzc1U9PmrhSVW62S6zsTpO+EpoSIe9nberT37+0U8yvUcKYnznF3ugN9p
         QRIeboa4T/v01Uz4SyGq/+5pPt/5E4sGTPlyUvQfKVZj3AEeWMDyqjjWy2kXQRymtj5r
         vSRyK89H7n6P8L4VLoct0rrwrxgA6mGayaR4Gv7jO7/rA+JfbHq8n4K+FmTgqT5eDMod
         X6jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuunxppQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z8-20020a1709027e8800b00198e0ec8e40sor4793247pla.122.2023.02.22.14.14.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 14:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuunxppQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixxLxJ0Xfd0Bhj6NjchLM61v85VOUc/tIPHDgotylVQ=;
        b=uuunxppQfNOcVaoG6QwxB+r7ZWZZw7AG3QIcS0wOJ+6IJkEjTqIBQHBtx4cFSJMVHI
         4luD4FRXLSd+zrZMdyxcKY5rKlHLJPZhdAApY+T+bmPtYvF1iYIzcJcAl5w85Xo4y6pk
         5GZat8ZG3BTI0z0nj2cmmdLR6FsHoK4LMMCJUjkle41JxMrYwP/QnvpspwGghvpFoWJt
         pqWpfRL9ag0fImWdk5xbbVOctRVWbwXlpOLaKGWJZBxu31MoKjStWeWk6o/IiuVoA2gS
         JV6yhPLc2lKWT+U/m/pcdjUbaufKKWGIxYRsj3KdoGcij86jXgO3iD0jI6aO/ThlY05O
         tnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixxLxJ0Xfd0Bhj6NjchLM61v85VOUc/tIPHDgotylVQ=;
        b=WO6jPoByGbGQgOvdwMnaxzHtC/ODnUPh70GHgEyyCkGCabFX7rgtSr7Ip702oYPXv2
         XwQ0tkHXkOlw8qKkH+OxoRIWEmmYVtNYqNCM8dbahg995lMhX8/HE24UrPX4nb89a364
         lCda4SWBeBXmNkfpTw/Nna7z/dz6hdiMGvtgecWkDdtC32IwA8x2ObJueettLYl24mG+
         53YjpfOsVQemQM1/hB6XxCeaX+Km+pItEJYVQmNUEuwqz8q/RawfItnqfJ9lBjRLsZY8
         BoH4lH8r+4xNlkNhJ2A1d88aVpzsFsgirGntwqRn1JbUrEU46a3tS+vYqX2O7GYI0VeL
         ZSSQ==
X-Gm-Message-State: AO0yUKUYLt8Q+0PoflI5IrMgXNiVA3he+BUG304UM7J8A1dc5SeGJFAc
	gDuZvLfFO50HG1Cv+5n2Gr+Lm8J3vIFOq9OaDD9Bgw==
X-Google-Smtp-Source: AK7set9tjLrhoACxG9nzOceNq7Wjoq9NGt/1bLOwGjJRSgfc4zU1wn+Rvz1SmlRB0zjBKM7Nv/KJKg==
X-Received: by 2002:a17:902:ce8e:b0:19a:de35:aeaf with SMTP id f14-20020a170902ce8e00b0019ade35aeafmr12373843plg.40.1677104082039;
        Wed, 22 Feb 2023 14:14:42 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902ed0200b0019c919bccf8sm3944866pld.86.2023.02.22.14.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 14:14:41 -0800 (PST)
Message-ID: <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
Date: Wed, 22 Feb 2023 12:14:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-8-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iEEIK5qhlNNY

On 2/22/23 09:35, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>   target/arm/cpu.h   |  5 +++
>   target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
>   2 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9c3cbc9a29..40b4631f11 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1039,6 +1039,11 @@ struct ArchCPU {
>        */
>       bool prop_pauth;
>       bool prop_pauth_impdef;
> +    bool prop_pauth_qarma3;
> +    bool prop_pauth_epac;
> +    bool prop_pauth2; // also known as EnhancedPAC2/EPAC2

No c++ comments.

> +    if (cpu->prop_pauth_epac &&
> +            (cpu->prop_pauth2 ||
> +             cpu->prop_pauth_fpac ||
> +             cpu->prop_pauth_fpac_combine)) {

Indentation.

> +        if (address_auth == 0)
> +            address_auth = 0b0001;

Missing braces.

> +static Property arm_cpu_pauth2_property =
> +    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
> +static Property arm_cpu_pauth_fpac_property =
> +    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
> +static Property arm_cpu_pauth_fpac_combine_property =
> +    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);

For -cpu max, I would expect these to default on.
Or perhaps not expose these or epac as properties at all.

> @@ -646,6 +694,11 @@ static void aarch64_add_pauth_properties(Object *obj)
>           cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
>       } else {
>           qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_epac_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth2_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_combine_property);

I think the *only* property that makes sense for KVM is pauth=on/off, which controls if 
KVM exposes the key registers at all (and if off, APA/GPA/etc all get zeroed). There is 
certainly no way to adjust the algorithm exposed by the hardware.

The primary reason we have a property for pauth at all is speed of emulation.  When we 
first enabled qarma5, we saw a major slowdown, with pauth_computepac consuming nearly 50% 
of the entire runtime.  Later we added impdef, as a way of doing *some* testing of pauth 
without the extreme overhead of qarma5.

I see that qarma3 does about half the work of qarma5, so it would be interesting to 
measure the relative speed of the 3 implementations on a boot of kernel + selftests.

You may want to look a the code generated and play with flatten and noinline attributes 
around pauth_computepac and subroutines.  E.g.

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_qarma5(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return pauth_computepac_architected(data, modifier, key, false);
}

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_qarma3(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return pauth_computepac_architected(data, modifier, key, true);
}

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_impdef(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return qemu_xxhash64_4(data, modifier, key.lo, key.hi);
}

static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
{
     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
         return pauth_computepac_qarma5(data, modifier, key);
     } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
         return pauth_computepac_qarma3(data, modifier, key);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
}


r~
