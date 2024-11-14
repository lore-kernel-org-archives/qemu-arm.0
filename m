Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp502896njc;
        Thu, 14 Nov 2024 11:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbq4rmePlg7kpQ9bMr40k3wgrTuvIUolIrXjzsvuvDRa/h+q/TRzbYFugW7fZwcmg/T526dNp46nV5OA==@linaro.org
X-Received: by 2002:a17:90b:314b:b0:2d3:d063:bdb6 with SMTP id 98e67ed59e1d1-2ea154cd126mr106523a91.4.1731612633822;
        Thu, 14 Nov 2024 11:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731612633; cv=none;
        d=google.com; s=arc-20240605;
        b=M7TPzYVD/Q3dmD/UEpb1FGS97hpR/sRT8WymScPmn3BJA2wGvoC9QYyZkOuzwGV9DS
         ChLVhqGiGZgZQdjcc95Q8zbFwuUdeMTFO4zhKGEWIn66SBGGuYXN2tXqbfCv5N1C1+Nd
         cOEO6/Ks/LdxnRjHxVI3HXf49PCqQh1oftEVsWxLjkeeXV5FJiO7PEwKNqNo94Mwnf4v
         NUZUC3rF0fD8Yi4EpVVUatVeskPE8dVnLv8pBuj1vY3oMyHeV9ZaiDxX8hCekrhDPlyv
         sQv6p3Q/uR0Umxrjz65UjnHEbMh6D2tOdRWfgpkWxGeHI0s3d/2scOj65ZpDHSRKIgeW
         C34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gClJSDryqyzGW/CDAAQbDzZTo3HzI26hzPRY0qf4Mv0=;
        fh=x5dpB/qQ3uSGFqQ7iR+Wj7d1XilLDHFrn7Yq+XERaDY=;
        b=Y2JsOyj2O2N36JO7Tbs88TRHK7phnrEM3miaWzDLRhTxr/N0yjc05kC48fV5W1g2xU
         YxKg1POJN+uwaKS7o4nqE2TX5MqHTVkOL/xnRc1g2cR8Xeu8SXYaQFbg1pK2SZO4b7pd
         aehsMdm+dqkDnCi3G5hZXw1OMghSkT6dIs9hVa2fSW/pSKEl5rbbvYycuGmgg6b9Cy78
         mqE+aXmcbYOB1OYNQU7spFDBMyasVfjv36W4BCUvAKlNYk1NsmoBKMVbI7JxGQNoFCgj
         wpw+J9Prld2KoMqceWUxsHn3OJra78Sf1yd0QNCMOlH/pP6OI6kAj+fDs8deN2BfPPni
         UEWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDFJxfzd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea07fe980csor1318017a91.4.2024.11.14.11.30.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:30:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDFJxfzd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731612633; x=1732217433; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gClJSDryqyzGW/CDAAQbDzZTo3HzI26hzPRY0qf4Mv0=;
        b=KDFJxfzdMwbsBUjmxm7wQvVoSL5xFHvovsVTOc5llbfNIFABqzp1wvM8uurmgXjzL2
         M5GXFfhCfAdqZbA/K/UJMES+ats/iLksQLEMsaEg3Lyqjmghqs8yaj4/e4KQX+CRAlBT
         YkDJRdQY7x9rzS3KjrNlKyuXbDQw+ycTJzSfGw8HPD1j6bSb3dxdkb9lr3d9V7IFre55
         QY6ZIsI7BaO7JW0/SaTKD68cD/M6tg+ZDRkQft20nOuo/1m/T7EC+uiY+YnDMRtGf+k4
         ktEVNH945lNy5s7Xdj4Ht1m72b4qSu6vhAvwGc8RbqLMh459I1uA8BlgDQnH5iG7IZhf
         HCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612633; x=1732217433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gClJSDryqyzGW/CDAAQbDzZTo3HzI26hzPRY0qf4Mv0=;
        b=JfHLQalLuiN4VUf3pOb4FE8PJDP3Nj5YPsFvDgMGIO5WRkCDvCV9tiHEaT6nzHfWec
         boM89/iHsOTiQuZa+LEt7I2cG94wfNr5iu1WLnYGeK8G/A+9EABdSO+uIl5Ip2BbnZ2Y
         66VMVKoVEIZPYVD3438RpnfogcdGCw7mdxtsOUN8HzPxC+eUOYBFG0j5q5rUAnnLHD/X
         HyKyowWSnUEEnBbg4EdxfbVWpN6aLA8umQo1VCTi0XHrWQ2fqzcFkwajedMd3PNAcbaG
         zWbYsHKDwzDtaQhiXPFwj51ocK5HC6ai9pYf3Gr6fElXoff0On9JUINjgwby2QUh6OmV
         /QIA==
X-Forwarded-Encrypted: i=1; AJvYcCVQlpywwwSF7vX5saKCn2ibmye4Oe1z9peWyQTIjlTYkbpAYgzNbQdao6alc+APWLplVK+u1Et104+JeQ==@linaro.org
X-Gm-Message-State: AOJu0YyRgInOxSNO9f/6XaiuVoVUVKX8YynQWrrMPxSKF18WxN9mgmxD
	FWnFNz4Jj+F6D99oV0IYjCXpUSQNQznXS4g78WNP8mVOlYVcJoRsBuwQdcu41Z24qg==
X-Google-Smtp-Source: AGHT+IFXOq4Fs2Vb27gOMb9nqZAFEqOhXZCuLw/R1GnhNPWqeMnpifKuJCSvkvUXl6pvZwUjRkT4yQ==
X-Received: by 2002:a17:90b:350e:b0:2ea:14c4:7b8c with SMTP id 98e67ed59e1d1-2ea154cd16amr116831a91.5.1731612633174;
        Thu, 14 Nov 2024 11:30:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c677sm1684783a91.36.2024.11.14.11.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:30:32 -0800 (PST)
Message-ID: <cb884943-6d0d-46a4-9d6a-f18dda3d7835@linaro.org>
Date: Thu, 14 Nov 2024 11:30:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] exec: Declare tlb_flush*() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qrs4i3qDiYwf

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h                | 187 +++++++++++++++++++++++++++
>   include/exec/exec-all.h              | 183 --------------------------
>   accel/tcg/tcg-accel-ops.c            |   1 +
>   cpu-target.c                         |   1 +
>   hw/intc/armv7m_nvic.c                |   2 +-
>   hw/ppc/spapr_nested.c                |   1 +
>   hw/sh4/sh7750.c                      |   1 +
>   system/watchpoint.c                  |   2 +-
>   target/alpha/helper.c                |   2 +-
>   target/alpha/sys_helper.c            |   2 +-
>   target/arm/helper.c                  |   1 +
>   target/avr/helper.c                  |   2 +-
>   target/hppa/mem_helper.c             |   1 +
>   target/i386/helper.c                 |   1 +
>   target/i386/machine.c                |   2 +-
>   target/i386/tcg/fpu_helper.c         |   2 +-
>   target/i386/tcg/misc_helper.c        |   2 +-
>   target/i386/tcg/sysemu/misc_helper.c |   2 +-
>   target/i386/tcg/sysemu/svm_helper.c  |   2 +-
>   target/loongarch/tcg/csr_helper.c    |   2 +-
>   target/loongarch/tcg/tlb_helper.c    |   2 +-
>   target/m68k/helper.c                 |   2 +-
>   target/microblaze/mmu.c              |   2 +-
>   target/mips/sysemu/cp0.c             |   2 +-
>   target/mips/tcg/sysemu/cp0_helper.c  |   2 +-
>   target/mips/tcg/sysemu/tlb_helper.c  |   2 +-
>   target/openrisc/mmu.c                |   2 +-
>   target/openrisc/sys_helper.c         |   1 +
>   target/ppc/helper_regs.c             |   2 +-
>   target/ppc/misc_helper.c             |   1 +
>   target/ppc/mmu_helper.c              |   1 +
>   target/riscv/cpu_helper.c            |   2 +-
>   target/riscv/csr.c                   |   1 +
>   target/riscv/op_helper.c             |   1 +
>   target/riscv/pmp.c                   |   2 +-
>   target/rx/cpu.c                      |   2 +-
>   target/s390x/gdbstub.c               |   2 +-
>   target/s390x/sigp.c                  |   2 +-
>   target/s390x/tcg/excp_helper.c       |   1 +
>   target/s390x/tcg/mem_helper.c        |   1 +
>   target/s390x/tcg/misc_helper.c       |   1 +
>   target/sh4/helper.c                  |   2 +-
>   target/sparc/ldst_helper.c           |   1 +
>   target/tricore/helper.c              |   2 +-
>   target/xtensa/helper.c               |   2 +-
>   target/xtensa/mmu_helper.c           |   1 +
>   46 files changed, 231 insertions(+), 210 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
