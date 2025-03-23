Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1557085njc;
        Sun, 23 Mar 2025 12:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRoPNeO6TOvqyGzpY5ViS5eAaUFq5Efi7c37fgSz35y9Uhn2oDdhV+Oz4Ky6hVFt1suBbeYuLWGFALjA==@linaro.org
X-Received: by 2002:a17:903:41cf:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22780e0a90cmr162581715ad.32.1742758151411;
        Sun, 23 Mar 2025 12:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758151; cv=none;
        d=google.com; s=arc-20240605;
        b=e7Sy71ZBklYtQAXFgjuIsl0wT9s/Wi58C4VYH81DHv+2v85pl8EeGK5P8J6W1TyeWH
         fRdz6LeF8PEcVGSfkGynTk2/dRol7+WBWs9vPVBSmWceLgc8DIJy5HgQzrP+iSi8WSc4
         N6MOC8oHOBh8Z6U/5Dw1R2MtfoyiFsDR+pG4IY9OxH5Ikyj6/JVG4eFlx2yf8GfWsD/S
         7lZ86mC+CgGYWhlE7wDuy50+RngqRmTEowBEPBWUafUr2atEcxNdjK4fFCXWX1egE1va
         qwWvNrWLF27kXKzm5+Q2/HOuRh/8hwy2MmIE71U/ywgMy9xJtQzqUeObh0JPxFVPc+GV
         xPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PnAmtE3n3/paQ0lzVCvVubbi6PO9bdEfhffrgZLoMMY=;
        fh=4zcHyB65A4qRjv9/T+xqo/yNHg8oewBtc95P3roJlY4=;
        b=WxtSCiN//NZlbq+WaksAxNJ716v8rryNPNlww+Mr7ddw63xqPtg/yinhO2HeYk90wa
         3cwzeHOoPWiLgb5K/DpOu+4lT2JYc1WlXDQs4lzq8tCc635WIExr6LRQTa1yCq+4H5L5
         Bqe4xaj3fRIGgOFzAV0ChLydLbbIvzc7QwhhUcUab7Epv2GDBYusAtj3w8gO7bkLHTP6
         zytbhZ0quc/3R9iQhXVXCTmb3SeNS7ZVKPYZIChYhYCtHEIFicL0R+4Hhwu/eySutdpt
         0NLkrFo/jmB9ZWu9VU+MMYurWiQQx3QiddC7ToTOI+ziYAP903H74Z7iTDaXuVAEHYvu
         PRQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZyAcMXu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2278121efcdsor37082565ad.14.2025.03.23.12.29.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZyAcMXu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758151; x=1743362951; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnAmtE3n3/paQ0lzVCvVubbi6PO9bdEfhffrgZLoMMY=;
        b=GZyAcMXuv6Qp3xNXYGg1/BjpMVmaTTUliRl+Dm4HS9OVFR5VVxzV1geIwyiEEP4s8n
         6vmNlVza3h6wS3rkDfJ31Dsn3yRlFWPAiJX9ekGUGL4KhKoo1V/4N1jtIMxNGTQCvmvM
         AI4eRdMCRtnBfBUBTtQLjATYYu/u9JY9C5bEyTTLN27y2xSB1Z8FfiP2v0h8wb79T+Fr
         hwFTyIQk3Cg0wIvP9ns4sKOJsB+bbszOM6fVN82Ll0mIQKskQjJCUNiUx0bA76LuKQak
         a30Ph8R7ifV99Disy8ehhoaamD4d1UuStTzdkC6GJaorRjZ1ptuikqAiqXRjLOvsfJkm
         NS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758151; x=1743362951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnAmtE3n3/paQ0lzVCvVubbi6PO9bdEfhffrgZLoMMY=;
        b=AT5ii/L61ak1Xawqk0LywBcd3qeW9fY5kZrR1z2Mf0SLHOVgchoJ3lTMz44ddMXtAq
         Avi/C+OprvOT8B5bmN8lTIJmqkRcMB1PCWoHRrljQ7qHblFccN0SXGMWbuM/l4e5BzIN
         awko6St8yg0Kll+P7jFERQe9uAaap/SKvlP2MS39FYCPdZmwfdIXJ16fvGHtAnbUAVZW
         8IFrmoARJt4+YgGh70QB1p04NV40lEW32k2kkQIjfC0qdmP0VKw5MCFeKmBu9oAjE85x
         luaj5VxeN2izunVKyqb2Q+L7ciPN+w1hxZRIUb1RRsVIho5z4aIIcL6uqojWmZat63tm
         BxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5rBWJ4X5WOvWFj0uzAI1X5ESYI+6kr1BCzSenviiT+gjlzweE1UVRqUzFLOhabNrhRlEzxEjFDaPhqw==@linaro.org
X-Gm-Message-State: AOJu0YxIEsF+WdK8Y3X8dvV/eHXQBpW0LPuu/7qsKvtANJxHC7Apxju7
	OXfuibdDmFUdb6rPxfAYPqiY5zkL2gXrWIO+xrptfgbn8v9WLSnb5+g7ZyhdHFe4ag==
X-Gm-Gg: ASbGncsV+0s02igQjSUYuyX/shf/cqZs2iSWITzcxwBNmW4szbhEk6pBL7J7Qyjs65J
	ru0UvnbnKYi1rRhIvXKl9jvCW/iGAruGgLOyE4lSN6ij0ceOB/Ch6M2Ct488P6z/hu3CDkt4rCN
	zs4AjU8kWXx4vREB5T8nmSzLy10eNCB41ij30iprZiaOvvgqv/Iu6UI5huvyyflLLtMa9nJQwN/
	iceFLOYKsJzBm1O974YjwdyoCUCqDBlXQmD/R/eaFloTYHaEUDhk+LX+9ffh+ZoTZViT0QNJL9w
	AaTRSZ3zq6Ri9QFywUy+3gizNScj2YyiPmhdTtjRVeRe0vRhBMAjSC9F0IdM0plApBDHkURz8r5
	xuLIjejA6
X-Google-Smtp-Source: AGHT+IHhpB3aRRBvUNs1iJcgRmDfGzmnOHPpyNLwpQfZOeU+obhVJxFhxXQ0Gu/SEvcE09tL6vTwmA==
X-Received: by 2002:a17:902:ebc9:b0:220:c63b:d93c with SMTP id d9443c01a7336-22780e234c5mr155026135ad.44.1742758150853;
        Sun, 23 Mar 2025 12:29:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8c2sm6366198b3a.107.2025.03.23.12.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:29:10 -0700 (PDT)
Message-ID: <587270a8-6758-4c24-9d1b-911d754ce1e3@linaro.org>
Date: Sun, 23 Mar 2025 12:29:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/30] exec/cpu-all: remove exec/target_page include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-11-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /CCGfQ3Qq8Ty

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   hw/s390x/ipl.h                      | 1 +
>   include/exec/cpu-all.h              | 3 ---
>   include/exec/exec-all.h             | 1 +
>   include/exec/tlb-flags.h            | 1 +
>   linux-user/sparc/target_syscall.h   | 2 ++
>   hw/alpha/dp264.c                    | 1 +
>   hw/arm/boot.c                       | 1 +
>   hw/arm/smmuv3.c                     | 1 +
>   hw/hppa/machine.c                   | 1 +
>   hw/i386/multiboot.c                 | 1 +
>   hw/i386/pc.c                        | 1 +
>   hw/i386/pc_sysfw_ovmf.c             | 1 +
>   hw/i386/vapic.c                     | 1 +
>   hw/loongarch/virt.c                 | 1 +
>   hw/m68k/q800.c                      | 1 +
>   hw/m68k/virt.c                      | 1 +
>   hw/openrisc/boot.c                  | 1 +
>   hw/pci-host/astro.c                 | 1 +
>   hw/ppc/e500.c                       | 1 +
>   hw/ppc/mac_newworld.c               | 1 +
>   hw/ppc/mac_oldworld.c               | 1 +
>   hw/ppc/ppc_booke.c                  | 1 +
>   hw/ppc/prep.c                       | 1 +
>   hw/ppc/spapr_hcall.c                | 1 +
>   hw/riscv/riscv-iommu-pci.c          | 1 +
>   hw/riscv/riscv-iommu.c              | 1 +
>   hw/s390x/s390-pci-bus.c             | 1 +
>   hw/s390x/s390-pci-inst.c            | 1 +
>   hw/s390x/s390-skeys.c               | 1 +
>   hw/sparc/sun4m.c                    | 1 +
>   hw/sparc64/sun4u.c                  | 1 +
>   monitor/hmp-cmds-target.c           | 1 +
>   target/alpha/helper.c               | 1 +
>   target/arm/gdbstub64.c              | 1 +
>   target/arm/tcg/tlb-insns.c          | 1 +
>   target/avr/helper.c                 | 1 +
>   target/hexagon/translate.c          | 1 +
>   target/i386/helper.c                | 1 +
>   target/i386/hvf/hvf.c               | 1 +
>   target/i386/kvm/hyperv.c            | 1 +
>   target/i386/kvm/kvm.c               | 1 +
>   target/i386/kvm/xen-emu.c           | 1 +
>   target/i386/sev.c                   | 1 +
>   target/loongarch/cpu_helper.c       | 1 +
>   target/loongarch/tcg/translate.c    | 1 +
>   target/microblaze/helper.c          | 1 +
>   target/microblaze/mmu.c             | 1 +
>   target/mips/tcg/system/cp0_helper.c | 1 +
>   target/mips/tcg/translate.c         | 1 +
>   target/openrisc/mmu.c               | 1 +
>   target/riscv/pmp.c                  | 1 +
>   target/rx/cpu.c                     | 1 +
>   target/s390x/helper.c               | 1 +
>   target/s390x/ioinst.c               | 1 +
>   target/tricore/helper.c             | 1 +
>   target/xtensa/helper.c              | 1 +
>   target/xtensa/xtensa-semi.c         | 1 +
>   57 files changed, 57 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
