Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2082415ejt;
        Tue, 28 Nov 2023 10:07:28 -0800 (PST)
X-Received: by 2002:a05:651c:21b:b0:2c5:1490:1687 with SMTP id y27-20020a05651c021b00b002c514901687mr7769139ljn.33.1701194848284;
        Tue, 28 Nov 2023 10:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701194848; cv=none;
        d=google.com; s=arc-20160816;
        b=ZU8RL8mZdACVJd9CZJzB+8OYfFtULlrVOjomdsmY6QfDv1jmj37Tu0qtuAQxiPQEvY
         EVMyY9swycbd/Di+F5IblSWlfWBE2kH3qDmDtf1VqgYneYrZEjU5Ej5DQjJFF75Wmcym
         C0EyJ+QIQ/3G+QKZc2Q0EAfiQii+HrpFTCgVEj3U9OJcc/fJYVy4bkuHhJ4kz14xaWU1
         apjfyWQDuDgT749WzPk5e9tbbfwGIpAykKvSdbhEnsdA8lnGp36GtvhASQS8SWpNkuo9
         T2DlVCDr/yYkZuP9mI8ench4pzNImOu/XFXeVk3Ktim85TBQaGTBvZCEt/13g/boWb5i
         U33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lFGN14zvp60qAt3NInvly2tP8Yf34w7cJxhjep4yuTo=;
        fh=3iSKU7bWGRsorBhKQPZUIb4H4LFZN/q/w3OccN7CQLw=;
        b=mMlE4voT2tzYAvMMY/CvA1CPOtkQSl0Im8GhkKctUoKMAm8uIJz1WCO6EIN2CkBgfT
         dQITRaKhY6ZmNFqONQO6t3nyT3nHwmKBk7WDkg9jQUcz18/2zgO8F0gMH3zkaCDeBdVx
         X4PawyTD0WLGzE2IGWv72l3IJgdtgsgoKHdPGY9mxQvXleTjpzfs+fsb3D5hiPAa9ytg
         BNsWe5lKjUmkM0s6eEir99sxbH2HVKc81dH4lhg8o0suVWbWV95a4MkQ787K6NdapIVJ
         rpVjul0KjhAxDMLDKmWHU92/ZvRNQMBj68GNDFcjzGyDnYn1raE7y5iTk4Rzu9vpuZib
         O6Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrkINUux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g32-20020a05651c07a000b002c16cf92770sor3120093lje.1.2023.11.28.10.07.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 10:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrkINUux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701194848; x=1701799648; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFGN14zvp60qAt3NInvly2tP8Yf34w7cJxhjep4yuTo=;
        b=rrkINUuxP1R/gVW85H4NpLKooBnzaV4sCbBX1Uuqqc0mESTdiNzJB7BlPjfV3ghUj9
         zIeAGOH4wCE/tkOy8I77z3AwRMthJkXW9gOFFIw0ncQzNpydEf+O/EsXOSfXlhei9pc4
         S14ou0HzA5WIne2pFwLbF4teAt+RFeGBmk2etJd1T/LUEy9CdYUZLguy0xpMguouLe4F
         hsU8n0Z9si5PDiT75E45r8S/AXAC2xPmbIkcTRKSdtk+5R01TjNSBHtBtzOJ91DpQYMw
         Gx8qCJ25jeXgac3ZDDIQfhcv41Yim3O2vQ2oDDvydTM/y5/fS7hJD6WIz+IhlR1FKzBv
         BFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701194848; x=1701799648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFGN14zvp60qAt3NInvly2tP8Yf34w7cJxhjep4yuTo=;
        b=Z0e5VwVjVPbZXjm5lkXgDptM6rgy+MjhjtxDg1ZZqdypUzT5JwB0zuOPCY0HmfFagN
         su6cG3XxFaIyIR6nqQ5M6Zw2562qsXSnBm74msk0i+Mo9TNwR1Q1Tzmt6Cec+p4RrXkl
         TyNB9SR1BOqYwTbjgaG9W6GNZro9drAO1ckM2zJ8A/PnkRACN5pVMa7mrq+Z48k5zHqF
         mG1HrfilYI1G7kD3V+wecQMinjpwU3UsF75RitvTj90bpxYgAucx9YFgU2vR3BKSSqOy
         AUgqi2IAPWu5rk2ZNJOXlhJCdj0f530vHxYW48zXl6LXVR3EnEyI5I3ZVT548zv2aTKl
         U66w==
X-Gm-Message-State: AOJu0YyJ17hVZVB5eBb2vCVAawIaNOSVz3Y8U0gLrjq7+v0dJsQp13PP
	fbxFsierxuH0nwr+uT1ZmFEft6Ey8mNsq3mpdNbl9AVqfAY=
X-Google-Smtp-Source: AGHT+IH2eY5Uc7bh0yNCWV+ofgHFyFFjx+VuN5v0tdMwLqIDIRj7KeG7ri5MwjqHHMmEJS4vkeiwoQ==
X-Received: by 2002:a2e:541c:0:b0:2c9:a22b:dff5 with SMTP id i28-20020a2e541c000000b002c9a22bdff5mr5468075ljb.22.1701194847729;
        Tue, 28 Nov 2023 10:07:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.174.227] ([91.223.100.55])
        by smtp.gmail.com with ESMTPSA id a27-20020a2ebe9b000000b002bcdbfe36a1sm1760596ljr.84.2023.11.28.10.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 10:07:27 -0800 (PST)
Message-ID: <fd6f4fa5-8122-4ac3-87c1-0521baefdf4d@linaro.org>
Date: Tue, 28 Nov 2023 12:07:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, quintela@redhat.com, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-5-beata.michalska@linaro.org>
 <95cc7c22-939f-4ce0-aecd-d0ff7b0e7c9c@linaro.org>
 <CAFEAcA-G7hbnRv52btWkpDs-1rgFqyVGgRVx-hG40i7zgsykaQ@mail.gmail.com>
 <2830159e-3d6d-430b-aed7-43b1b4fce56e@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2830159e-3d6d-430b-aed7-43b1b4fce56e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: KLgJmvp7poEH

On 11/28/23 05:44, Philippe Mathieu-Daudé wrote:
> Thank you Peter. In this case I'm compiling HVF, but this is the
> same reasoning. I'll add #ifdef'ry similar to ats_write() (commit
> 9fb005b02d "target/arm: Restrict the Address Translate write operation
> to TCG accel"):
> 
> -- >8 --
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 99c7da9ca4..a05e613e10 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7629,6 +7629,7 @@ static const ARMCPRegInfo rndr_reginfo[] = {
>   static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>                             uint64_t value)
>   {
> +#ifdef CONFIG_TCG
>       ARMCPU *cpu = env_archcpu(env);
>       /* CTR_EL0 System register -> DminLine, bits [19:16] */
>       uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
> @@ -7653,6 +7654,10 @@ static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo 
> *opaque,
>           }
>   #endif /*CONFIG_USER_ONLY*/
>       }
> +#else
> +    /* Handled by hardware accelerator. */
> +    g_assert_not_reached();
> +#endif /* CONFIG_TCG */
>   }

Yep.

r~
