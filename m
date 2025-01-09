Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1458275njb;
        Thu, 9 Jan 2025 03:18:51 -0800 (PST)
X-Received: by 2002:a05:6000:1fa2:b0:38a:1b94:ecc1 with SMTP id ffacd0b85a97d-38a8730afbcmr4686257f8f.25.1736421530970;
        Thu, 09 Jan 2025 03:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736421530; cv=none;
        d=google.com; s=arc-20240605;
        b=bdpwlMXY2LHsoPieFKAxJsnDJ7Tt1WM1bNkaOUpwhVRGHwt27jEwV7k/FnJwSSQqIr
         WbMZ7JIv3YRPp3ZzuPMYVdWuKL3oxeCmY9JZgT3H2EX9tSMsGQmGu6MAORy+SO2nOPbz
         HreDRZ9q4rz8EpI0+sIbdERDXotH48WF+N9A1Gnlu5A505LR8DktPj6XIbYCwo3Je9Rv
         dR/SkSkX1ToyH7uVNRpEKjAtD55HfAmo4i8E9K/5k8MMYuhpA9ZCkKBpo9iGsy/bvxhN
         zGM8pAiX4+FyOt+twUJbCSXaiusXbEoVLH3kEYy3yluVgYCVGjSWCUkokhORbSH0uHe7
         DJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ME0+3AFyXLGdqFXUo3zVv+IGspfWxTahIBFqoUfx1Ns=;
        fh=BMLrDyEOVLWFL4sT/h0e4u+RJco0zBvl6jmVrRgS8bQ=;
        b=Ak/Osi9XlK6vVv3ZXVXYWSxilTbtPEkTOsdeNNUkg6LJHWs7/4SYwpj406mezOKaet
         dirVLcXRX9u7RBftjtfz0EV7/LbDFOVQhsF4Z0vRhQ6pjGVIOkhGALceviUAqHwSPVME
         5qGMe5d+EGoX23EN2haTDlXuP8R8psfq7oDebDKh/5oHZ9qQ5DvPs3eqdF3OyPSK0Z11
         Qri8Vb7yjmNKN7x6iPm7u5VOrYgytzDBLEIafee+5UK7K5aldtns9YIgHoPqy/YwxDnO
         TytjZrRv2+cx4GTKyd0hbLEVMddyzZ6LL74Sy6tx8f0Q68iuoZqptRb3zunFBbNfvdA0
         +B6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dI3bUuA0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a8e37ac28sor531107f8f.1.2025.01.09.03.18.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Jan 2025 03:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dI3bUuA0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736421530; x=1737026330; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME0+3AFyXLGdqFXUo3zVv+IGspfWxTahIBFqoUfx1Ns=;
        b=dI3bUuA0ZCQLRK+X6vt58OoNlptlQYovQ2CD3K3S8kvfFdF+FhQVGC0gl05f0XMZj8
         RtF0i0rqCtvkdJnf8KpUp1GOrB9m9yYOTr6Ro9kMlCJWEdMQYLqz0BjQOE//FKkmEluV
         6Qrr4f0qcV1mc/KXK92aijauEcFP6LwzN70Va+QBh0srVEWWYpMSB0J61xSOra+3bMSF
         iPAwDQRq1dX2Bm+x4okdDVg09ZCQRLaBU2Hy5S2OWH52vl8TPtCaJnEZb5EXMNmrFUon
         bZoVkDqsG++69IVuO91oHsTqQMmfkHdhm7ph6K/6fb9iXnvndwA+GgNn899TZXpyWAAI
         x5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421530; x=1737026330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ME0+3AFyXLGdqFXUo3zVv+IGspfWxTahIBFqoUfx1Ns=;
        b=d/Jxd0kVdzw9is6XLALRcYrCkjvqM2iK0Xkr/1g2N4eQ85TOO1oXN50HYw83+c+dit
         qQ57plgVVWQxJFiJfVu5g+G+c1xqeDBJbkt4eNRjllwGZngW2njpOM23ZmNBJTS0oQnY
         RZ0AU1MB9hnOWFSLTuuD+6OLX4ukkxSGFQoycrDqY8+9kke5negRwtWTtw0VpXruHTU3
         IrreIGCVUfLKiMSFDVbn/FJBB1Z0KOWJu0AEFJpuXc9wSw3x5+QVM1J7Krzx3rrBAMw/
         e7XuVlzMPuipyJOc1A9RL3wI5bn+NhazUes3mTgjn7gBfnoPGhmZY9fkqNy/HilWp2nM
         PgIA==
X-Gm-Message-State: AOJu0Yz6U2OR0j144gAc85WW9Y86dKsnZsHDV2qAX8+uTaSHweYQSKW9
	LDAABitCKKBBQvKLPkA+BFL88/DvZojPrp28Xh+4nl2vBnz84MZvcdKn/xSU1OlfE7va/bcb2VL
	E2NYPXA==
X-Gm-Gg: ASbGncsl0W5qgJglV/sWjMQ7fHSnSpygCpfMu+U7A9jhDWZF1IxPQL+JvXo13+dgkQE
	cY/oecdGIywbOKAwd1ErFWcQvJY6e5eBCBzjOfQ+yDN1U0F/AXNYpEB+XSyiqvbvJmMt+1KElLN
	v1a7A4WwwlFfLsuIHEU6E48ptd5h5n+SUBfXVIevgCE7aU3DhCQ7RDhntRkqw98PgXaws/bPSoZ
	caqdgJC9OMdt7SbBjGIfxz0fRfBkioPPm2RF56fVmcXABnfOx6QwmecSKOFJQqjOSg5H4naM/7Q
	vPUQjdB5e5teB8UVy+VP7TFw
X-Google-Smtp-Source: AGHT+IHxltDmN8R2Exw0WE83WeQQVgR4NuppXtMw+Va+iaxJ0DlHZ5eXIb6MJb4IqtyMUFDEgri9wg==
X-Received: by 2002:a5d:5986:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38a8733a214mr5702120f8f.52.1736421529927;
        Thu, 09 Jan 2025 03:18:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d2dfsm1529283f8f.7.2025.01.09.03.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 03:18:49 -0800 (PST)
Message-ID: <718a0ab6-cc07-4721-9560-7745ed1c04a6@linaro.org>
Date: Thu, 9 Jan 2025 12:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] target/arm: implement SEL2 physical and virtual
 timers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org, Andrei Homescu <ahomescu@google.com>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@google.com>,
 =?UTF-8?Q?R=C3=A9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
 <20241218181511.3575613-4-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218181511.3575613-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ca1i23Qf7YSw

On 18/12/24 19:15, Alex Bennée wrote:
> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> shows up when building the latest Hafnium with SPMC_AT_EL=2. The
> actual implementation utilises the same logic as the rest of the
> timers so all we need to do is:
> 
>    - define the timers and their access functions
>    - conditionally add the correct system registers
>    - create a new accessfn as the rules are subtly different to the
>      existing secure timer
> 
> Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> Cc: Andrei Homescu <ahomescu@google.com>
> Cc: Arve Hjønnevåg <arve@google.com>
> Cc: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> ---
> v1
>    - add better comments to GTIMER descriptions
>    - also define new timers for sbsa-ref
>    - don't conditionally gate qemu_timer creation on the feature
>    - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[read|write]
> v2
>    - rename IRQ to ARCH_TIMER_S_EL2_VIRT_IRQ
>    - split machine enablement into separate patches
>    - return CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
> ---
>   include/hw/arm/bsa.h |   2 +
>   target/arm/cpu.h     |   2 +
>   target/arm/gtimer.h  |   4 +-
>   target/arm/cpu.c     |   4 ++
>   target/arm/helper.c  | 158 +++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 169 insertions(+), 1 deletion(-)


> diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
> index de016e6da3..f8f7425a5f 100644
> --- a/target/arm/gtimer.h
> +++ b/target/arm/gtimer.h
> @@ -15,7 +15,9 @@ enum {
>       GTIMER_HYP      = 2, /* EL2 physical timer */
>       GTIMER_SEC      = 3, /* EL3 physical timer */

Should we rename as GTIMER_SEC_PEL3 for consistency?

>       GTIMER_HYPVIRT  = 4, /* EL2 virtual timer */

Also GTIMER_HYP     -> GTIMER_PEL2,
      GTIMER_HYPVIRT -> GTIMER_VEL2?

> -#define NUM_GTIMERS   5
> +    GTIMER_SEC_PEL2 = 5, /* Secure EL2 physical timer */
> +    GTIMER_SEC_VEL2 = 6, /* Secure EL2 virtual timer */
> +#define NUM_GTIMERS   7
>   };
>   
>   #endif|
