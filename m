Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp26808lfk;
        Thu, 27 Jan 2022 17:35:44 -0800 (PST)
X-Received: by 2002:a17:902:d2d1:: with SMTP id n17mr5990699plc.91.1643333744569;
        Thu, 27 Jan 2022 17:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643333744; cv=none;
        d=google.com; s=arc-20160816;
        b=VLUtPgEESu2srczLlmQdlCX/Asq3YlcWPceLTnv5kD5/ZT/fwm9Qkr9HFSfymZXx7f
         9ICrebwPSQMS6/YVKaX/hrWDAIUYjPfeoastLSAHsYgNsXZueFmB4EFiJptFokW9O9c1
         W/Hfj9D/YcckToaQ+bWteImhDbHYBYZ3GSgFIOq2xixb+1e8hIJJ0gGTlIel1/qITu6e
         ReLXHkrC5lOMWFA3kyFfgJ+90igDWHFjdNKGkVKy7tmEHbFcvvuc4pWPbE80il1zV15d
         sK8Ou1/5j7uOyHRPpvpyCGPo2rM+eairO9qXQJEndF/soDkGkG9o5HyRZQl63a9Tz5Vz
         ma7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T0exQrDNBqAXPUuHt+45xensyDiDusqRYP/IEcSo0AY=;
        b=t0xQpIFv39XJEUR5GUYBvAq5W6+I+a9kpW0H3giNk5KeKLQes0rpQuMKttGLbodDnY
         T8poMqSqSNy2gek7fxVncFRTZl8d4oIMCLYsTho2X5LiFYhORX5Pb/T4D6YMb4keWSo+
         9MxUKairwUtkhyohr7P5OwDoEVoekZBuoFGFI1eoPsb9XRLwCRNdehm1U2VTUq6YouhW
         RIaxjMVbd/wlMO+AIT8a8kTlDWTf6NwbLdHflRw9rOioXbhqHUDLw7vzoQCcRNAuUzTh
         g+BhbCWg5/rGV30iNKmGDJxoQmUB8cbdNJksHPHChAzosGuuRO1bIBBQ3kfs7oOfUkkO
         h5/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kMjc2s/4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b5sor1873325pls.43.2022.01.27.17.35.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 17:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kMjc2s/4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T0exQrDNBqAXPUuHt+45xensyDiDusqRYP/IEcSo0AY=;
        b=kMjc2s/4VTsT5fKeoaCdsj1qC9IzXuinBeENS3Jfv1SPLmGNSCD3WwFYri2tGe6c8A
         y+etl7F+X8OygxoEQ9hkiBmptLdAkxSNjAbADc6H+cKlGmTrbJZmfImaoPc6Hp5YJJ49
         aRFmYNwlw7WLvmYg9eTID7H6sfuE9DLsSYr3u06p6ii1X7PLVv/H69FomV28/cx/vxmE
         OLRr8QD0JYUKSCNf0Cat+M8wIfi35yu5bTAL+SJhf4X67t/gkKbZa0kSD3jtHKQR0MDE
         kVmcuewlINwg+cLlTYc9eP8JfGIRdt3Jt7yKiTrTDkrS6ZhKfKCQqoWpmMaGvl4jdvAq
         ER4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T0exQrDNBqAXPUuHt+45xensyDiDusqRYP/IEcSo0AY=;
        b=icPriLLiYFc4ndTiEoC4JAdp6LgVAyrTS8CcZ+51xQknaM4B942ZECE6k636V/UQJa
         PdaYeABjgUQvdyKtmGuEZ3pbFtpNZ8RuPRHu+y2m1+Azu5TpsJF3ZCCmx22eQU+DyPCR
         YvZcvWngkAbzasrl80qNe69t7bRUFU6PtQRk3+45+fYdgQ5LEL5lT8uZ2LPUNEXyyDuP
         8WvND/zPhA5taAkV6QrXnVaXAubhzi6ml4ycP5/cu47B5OLtJz0XKyeJ2ZoCK8LiA6zp
         0fzm5LNKVG+SST8b+ZfuKE7xmABYgHaFOk+zw3ZV631pFVGGMzm+EU0ucG6Wk+7jBOvh
         y/kQ==
X-Gm-Message-State: AOAM532GCio+oBHVpx8ZkBscFh3LR6dIbFGHkQ7fqaqXtNjkwMqR+neN
	iCpDTaCMg8yRWBPvtTR+NzXJL/RW
X-Google-Smtp-Source: ABdhPJwXdT1kt+RmE4C0yTGp93dQid1fgf1b+3GLynIavAKFxUltACRQB9s24sqHEnVpdaO9gLb2hA==
X-Received: by 2002:a17:903:18b:: with SMTP id z11mr6121702plg.71.1643333744107;
        Thu, 27 Jan 2022 17:35:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id c6sm7113260pfl.200.2022.01.27.17.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 17:35:43 -0800 (PST)
Message-ID: <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
Date: Fri, 28 Jan 2022 12:35:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vDLlc8sF3rMn

On 1/12/22 04:10, Peter Maydell wrote:
> The bounds check on the number of interrupt IDs is correct, but
> doesn't match our convention; change the variable name, initialize it
> to the 2^n value rather than (2^n)-1, and use >= instead of > in the
> comparison.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 6d11fa02040..5919b1a3b7f 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
>       uint32_t devid, eventid;
>       uint32_t pIntid = 0;
>       uint64_t num_eventids;
> -    uint32_t max_Intid;
> +    uint32_t num_intids;

Does this now need to be uint64_t, like num_eventids?

If not,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
