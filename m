Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2097858njk;
        Sun, 26 Jan 2025 13:35:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVytcKWhj+ZxlB65NEVwQifHwaiJYgEi7f8qDXpZVbm9LOsMtTdwEsUq00V3JvyaLPDjWr50FfN503Aqw==@linaro.org
X-Received: by 2002:a17:903:2284:b0:215:ac55:fd72 with SMTP id d9443c01a7336-21c355e3500mr520253015ad.37.1737927333106;
        Sun, 26 Jan 2025 13:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737927333; cv=none;
        d=google.com; s=arc-20240605;
        b=GmJRMocbWavQdJ2APwLj/CeVMTY9uqI3Ihyur3RJNdBdXXxkX/ncEPld2DdHsRSNNC
         8dK4LDy4LFXtPav/h0W1KnLxgmeFbmN0VuxPhFmATgP3phG8wzQjkBxvzQ/p2TXMWJmq
         6WcPeYvHSO993jHITEenmn/sGhSvDjPuZS/d0JdQbFab640CTpxtwoZx+vpE56MZo2+2
         rph9Qgi/tMG+Gaj4b0PgRT4yhVVwt5F/J8xTubhhzFYU+/fEnqNzlXXZ4d3b4mTMXPnD
         OPXs+Cm2sSvxPYhcJ4t38e8j24MtXcKlHxIB+GFrhxShmIj4NsHYFrU2vCx5I6C3Zsio
         KA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u0m5yL8s0TWSEEfxviVLYoEbDIw5bajMGnLn0okjgqc=;
        fh=LvvR9cA6bayWB2MZ/jgm6sZF5NXZX8Pj8tneuJ0M5HI=;
        b=HPjg3IiG8fjBRlNKcdJuTWS+LcrOcOEJHYASGVlgLjaOWtB30JvRC3bPlNwtm9xZI9
         g38t0/+JGgVi+wwXGhz/SQRiVhktQY+TYTtwxApZigIm2FQwM1lo/OYpzFvwAAC9rpPE
         GLRswBhmn+3+cDWfx96LETqv9jvkqlN8ntAMzBJWEpuVxloAvEN9TNeYgyqc9d+4lzcd
         fv9VuiI/d4/T5yuMWPHXl1pMr2PVMsqroy4tL7t9CJ+q7UF2f8sY/MF8QjQeoh2lj1Oo
         WIu9uZ8qiKBrEcay3z9vuLT8y3zPaHoGkoyV0bKrhrUO2mHtrXwYICto8Eab+nOe9mxH
         MNVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtyeNIHg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3da4547sor41244545ad.3.2025.01.26.13.35.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtyeNIHg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737927332; x=1738532132; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0m5yL8s0TWSEEfxviVLYoEbDIw5bajMGnLn0okjgqc=;
        b=JtyeNIHgcttezTJyvmsSQkZODThERp/SA+UzSSMZbqbb1tpsnC6OIWUhljtxJjJMS4
         JqcW//ezyQB+hZmCqtkr8mtXcRWefmXbzIHH0ghGmqU3PJXITYJDL9k53xViTcyO8DYc
         VFdVtP4z3medJVY0j1U6uXVgNOhMTwJ7ciLJGT3wez1CM591hUVez2F9Wi9xFHby0S4/
         a9/LKkLoCLgd1tP7fAgtuLQhOWTfMVLsR4yLQeM/tJZJtA7o6D0rlZPgBVJxm1+506bb
         fGKJxCF/YPBOcyd7/NBk09XdNf8rq/bXwmhOy7TOa5n5PaSzsvX2vD705jacqAd3MPA2
         d0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737927332; x=1738532132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0m5yL8s0TWSEEfxviVLYoEbDIw5bajMGnLn0okjgqc=;
        b=YtgdAdY0YHNBZxmONePmhD0F1tJCCzYjNcEmo/MRkiBdJMATcktGTrNnj3Wikmv2vE
         e3mpIHeoT2pkOwnziLlvmLKCem/qp0GyeknQ6eOVwK5QOnc8r+q+/ZvtxKMhW2WLiN+g
         X+69LM7fN08ynNa+PZ/zIHWPEtzR+LqkKPU8AR1ZE6XlUvTKstKgGSZazX7xJwGIhKgQ
         trKuYFtc2QOcZ2lw0mSpXTW0NT0Qn/JmhlPB6A430hvSvs7etj1JHJNSj3C/O0IKhZSw
         07jS9aUfC88ol/ysYa81e6U5hyWTyiTe5EtmmTVurWt8DsgDYexDRzkfOxUVi33GxJBm
         TcMw==
X-Forwarded-Encrypted: i=1; AJvYcCX53SgDoXKoX7oiVk+ZuPUAcqmShgWQYOUCLqKWfBivEdUicsX0TfeDQQbObPjgOLiRLK795VaTvMZYyw==@linaro.org
X-Gm-Message-State: AOJu0Yz9H0JL9qmECojb1JYMKKf1o/EY5bqj4a1Ksjp1rTE8Mpgux0z7
	ivEMkGDayWdGfYXf0IFWaF6teM0s1y3jb9HLglPFX/LfUXj7DkK7qEAShDEjeyc9Yw==
X-Gm-Gg: ASbGncs6v4rg9M18sybAe8glQMdyvGUiYRjQwIugXTi9YWGVhJ58M7Vd7V18Mtce/0n
	jgJ9d1wQZmNn2p5PavMhwkVlsito0tnPyTqz9cRBp3TIavwoSXCN4Z7cg1mrska5Wg/dnFS5XUB
	ZvkmeURrugKuy7FSOgmIl5Ao33GPv5O91r1y5qJhOcoiGWW2W0CnRQbsny1mhe/H3W8WcqxcJ8R
	L2LSm8OYHa8fX6YtxIQDKh0GzbgkYaCiZy5xxdBWyCzlKz6n+yP96bx/r67wzBUAgMSFjg+HTt+
	M1IPMswqj2EJJpoPEt+wH4YWhSRA0q/Ufda/KCJD/1GFFAI=
X-Google-Smtp-Source: AGHT+IF/uxXXMxK7HfifMI4lK/bjNl3NXv2LfDusZSj5Oq6BRtJb3xCpVAH5ppeGMpTK7NLB5Z4iRQ==
X-Received: by 2002:a17:903:191:b0:216:3466:7414 with SMTP id d9443c01a7336-21c355f6a9cmr669165345ad.44.1737927327477;
        Sun, 26 Jan 2025 13:35:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c552sm50455215ad.18.2025.01.26.13.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:35:27 -0800 (PST)
Message-ID: <4de30644-618d-4914-a1c6-008992c7edff@linaro.org>
Date: Sun, 26 Jan 2025 13:35:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] cpus: Register VMState per user / system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: j8XRs+8hGkxH

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Simplify cpu-target.c by extracting mixed vmstate code
> into the cpu_vmstate_register() / cpu_vmstate_unregister()
> helpers, implemented in cpu-user.c and cpu-system.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> XXX: tlb_flush() temporary declared manually.
> 
> Only 2 more CONFIG_USER_ONLY to go.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/hw/core/cpu-system.c
> +++ b/hw/core/cpu-system.c
> @@ -22,10 +22,21 @@
>   #include "qapi/error.h"
>   #include "exec/address-spaces.h"
>   #include "exec/memory.h"
> +#include "exec/tb-flush.h"
>   #include "exec/tswap.h"
>   #include "hw/qdev-core.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/core/sysemu-cpu-ops.h"
> +#include "migration/vmstate.h"
> +#include "system/tcg.h"
> +
> +/*
> + * XXX this series plan is to be applied on top on my exec/cputlb rework series,
> + * then tlb_flush() won't be declared target-specific in exec-all.h.
> + * Meanwhile, declare locally.
> + * XXX
> + */
> +void tlb_flush(CPUState *cs);

Ack.


r~
