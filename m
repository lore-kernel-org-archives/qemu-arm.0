Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp429913ocs;
        Wed, 28 Sep 2022 09:57:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17cf:b0:202:95a2:e310 with SMTP id me15-20020a17090b17cf00b0020295a2e310mr11967218pjb.76.1664384253580;
        Wed, 28 Sep 2022 09:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664384253; cv=none;
        d=google.com; s=arc-20160816;
        b=MOeKPzAEhwFkEa4Csuo0365uZ/2HWpEU6PYZ55vsHID/lul8KQmKrfGlVaIXdujPxj
         xzs81H0bjW/gQt4jgvKS7jV8alD/iB0vT11PSWeWWEV0o+67vCtth1IOhEjXYgTmdmX5
         04M/rCsPxON43wKEb2+z0IGx7UNLCS3zjDdiGhgIxbA2Rj1f1eU+Hw/LmQwgTBQ6AAV0
         9h7ySyGp80g3ky4LdC48e4zPFFWnGjZOUi2HNNhSHJr6OM9S3veybU/Sl+IMM3n8AbyR
         YmwqTnJjcR4sNR7266+p49auohfPjJP+XogYyxD1rYsEwQU4rEKvYlfS0QZzV9W49Q7I
         GJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y12cOkq5R8jLp/uWtco0suDCBLICFaZHPewkEbXD1uM=;
        b=ykoqWdiYSPFGki6VWRqi9db4zOneww9hIWyv8YnUqRjD1v7Dw84tcN/4YEX8oXQHU6
         g3Wb5xGQFliUlwzDsIu4CAC1ZLMYGI0sQ8xgsp1pB2C2HDmKTCRoSXtdQ+l+xll+Ubdu
         XEkOwPiVr2Dc/Q98Fz7NtOFQHl+Y53Z+QuDpEi2po0oGQ6lakjBYPe0pWB0hUanQk41j
         VsDas44XuKLQuA073+4+tQxAIRtoxb4K8lGhu6pEXWNiyVdas4h+RFWqayEZuwdgrtdf
         2ua2dGuhl2WA6IsMsqJmY1x9vpR3vTwjY2z5JuLzpS02xQCJdMt6cWCXrjp92Wdy+nQ/
         FS4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/kt9TO5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n10-20020a170902d2ca00b001767be4a35bsor2521982plc.46.2022.09.28.09.57.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/kt9TO5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Y12cOkq5R8jLp/uWtco0suDCBLICFaZHPewkEbXD1uM=;
        b=d/kt9TO5gdDZdhocMADgmyYovEBUkTB2vVgmI2spbYmSZA0d8O2HXVsXEYP/oKitAa
         oC4ZdngGNxPEwJVLJQtnDBUVv71ezfDzNKBy+7I/xaLSv9S226P5BLoSdGNRv/mFxNCI
         s0tXZ2GfV47Q0oyDq472y1bY0ICPSCrMuCcL1qDj6I3gdk2j4Og0KKdV+b3S/XsYzvmI
         aQDK5fQspZXXfPQxtbcXjXSyCRNu7clnicGNYxRoNeyn8f2uhRRj9yzDMkdnTd8e8sMa
         BlFZp6KyNKKIHEBELU0XCvSobyjtr03M1Us8NIHF5B3uI40MhtHGLSmjtC7zqZFMRRaT
         nClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Y12cOkq5R8jLp/uWtco0suDCBLICFaZHPewkEbXD1uM=;
        b=G+loGNpkF5srqSbPo6gTfuOV9/uxhuLu2NuUn7UjvjoatuiRkqFhlxWeqw8cDpPHxM
         oY7thpX+CTgWwut08xHT8CjWKc2qzHJ8uq+/FfSODhMLEMI8ie43vwaILVx4mfnE/Mcp
         IgxZSnT/GuUQ0yYunwV4ke4PiwuSGev6lFvR2FQwzCq6PqlQzIrFWO8+HH6ZFeUmndzX
         swLadfZIe4luAKALrP4dvUbTkg6N0drYTvbZbU1QA9prsMsfcn3WRMDlr3QF1nM2FxC5
         Eim+W2N/k3jLx1pEiZgST0wQZh9Xw3+EECfGlz890dp8a69BmwMBu2jfq9NFq5hzw2Qp
         riUA==
X-Gm-Message-State: ACrzQf3tzId0P9qC45p2odlzoUagX+48YiPdmaATNxs0egyyC5QAfNZ4
	mW19IOWdb1DtYyC6kAt4aTWNHogDUYH0xBmP
X-Google-Smtp-Source: AMsMyM4o+zkfsuHDi/QxpXLgCULwe1qF4HZ3cAujckadSyK/O4lwKZtNiBh8eoB+1gal+k1Hf37yag==
X-Received: by 2002:a17:903:234c:b0:178:1a7c:28a5 with SMTP id c12-20020a170903234c00b001781a7c28a5mr745084plh.32.1664384253215;
        Wed, 28 Sep 2022 09:57:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090341c600b00174fa8cbf31sm3963859ple.303.2022.09.28.09.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:57:32 -0700 (PDT)
Message-ID: <2cee7eb4-3b5b-d8a9-3cf6-a53e739e4705@linaro.org>
Date: Wed, 28 Sep 2022 09:57:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/15] target/arm: ensure m-profile helpers set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H15s+/x+u9rt

On 9/27/22 07:14, Alex Bennée wrote:
> There are a number of helpers for M-profile that deal with CPU
> initiated access to the vector and stack areas. While it is unlikely
> these coincided with memory mapped IO devices it is not inconceivable.
> Embedded targets tend to attract all sorts of interesting code and for
> completeness we should tag the transaction appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/m_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 5ee4ee15b3..d244e9c1c5 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>       CPUState *cs = CPU(cpu);
>       CPUARMState *env = &cpu->env;
>       MemTxResult txres;
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
>       ARMMMUFaultInfo fi = {};
>       bool secure = mmu_idx & ARM_MMU_IDX_M_S;
>       int exc;

Surely this is redundant with the initialization by get_phys_page()?


r~
