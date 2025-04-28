Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6192304njd;
        Mon, 28 Apr 2025 12:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhzgwFWSnEFXu2sxXcuaH3r/mCIVHyfQ/smss9qvihrC9VdIVrh15Co9qtCkPbRF/0akldnMld9Necfg==@linaro.org
X-Received: by 2002:a17:903:24e:b0:220:e023:8fa6 with SMTP id d9443c01a7336-22dc6a87a3bmr133557415ad.50.1745868862864;
        Mon, 28 Apr 2025 12:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745868862; cv=none;
        d=google.com; s=arc-20240605;
        b=KLnLKqfIcpPJpHPNlAdy64g/WY58r7iM8MyU8GqyLTIrnb9FGFbgnikM0dGO8BJSdi
         mpIwNw+M2h7vNhXXNrCk0+2m/PPkl5s3FdJpjYpatjMFzzfqYrwUM1oXXiPyybEdp614
         cZV/htmiDi4UXSd6t3Pycu4Q5hGD27BuNJsxtfYxMT/gJQTN1lrMz3pU8jyht1aE46DT
         knLaNaB+omtlnNPC0EJKFJUpDOHhge3rD+is5Crk9VUgJMEu/xZ+KU5ITH/qzkCZqDmX
         9FfZgPeEKS2jxkZ3XIZhEQu6LEhXqb3fldNSspwDbDJzdRyPx3z3dHZRNhq+RW+LiL4k
         JRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kjkhy3ikd8CXT2fFKdXcFGxLzOU+pRXCSrkDx2UIFXs=;
        fh=2KfNT/ssVbrYJYxQzfLMlflFfh5fWBFsX6k8hBH7gnQ=;
        b=dsrs5VQtXHuPqHmm6wCImdLFjAzWyZ65XU35pyjnw6RPc5M9SDKuIcpvaLNrSbCrsy
         lAYSob5/2a7naevOOTeEm/WrHPg0DLIHYPLGG+QLvFSUvxAv4cFrONdcRJw26grTdioU
         DVDde/MmUsVk27Kv/meplMXP9xnmswSeUq+5rS6Zhq+GNlBEW3qwcrPE/LmDvPvIS+yJ
         SDDkt8jBZ2O6eigpd8BrlcEaC54Ai+26bA41i3dmQWeNW8b3XthwPlHpcyD1/a5QlVJH
         CI0mW9ldoYBMGcdhPTliIfo4Mnej055UisWEnfRMGRtIvF0bH2aAeJokPcdPx0OKM5tX
         IeLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSP1Dn4i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b15f4d011e8sor7426795a12.0.2025.04.28.12.34.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 12:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSP1Dn4i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745868862; x=1746473662; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjkhy3ikd8CXT2fFKdXcFGxLzOU+pRXCSrkDx2UIFXs=;
        b=ZSP1Dn4iC5R/4ZsWsAf5QyFkZKciXhMStVFzoHKJajsest1Sfjebcv9juRPpcgaHy3
         nkexdYt7i7vaucVedEdyJ+F4RmulvUg/4PDEVSi9Q0ocWUqWVBQ3Hft0H2P0OJ2u9zb5
         YsAOzIbfGDeKf46eYAZssxVaWpT8fuhxxDtcwusWqrU12aHTk10U3hZBH6ymzBFukHje
         y/sYFmEa3ySU+vio7N3I4Gq/giMaxqvpYGzwIYvNQMZ284iisRBkXHE5fXrkYcOFnowE
         +H/MYnIzPYNGVxyZHBvJlme2/MUbKAEIJ0J8ICb7XigWza8olaMfDJOT/sjjM7wsFWhn
         62mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868862; x=1746473662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjkhy3ikd8CXT2fFKdXcFGxLzOU+pRXCSrkDx2UIFXs=;
        b=H51cWJPv6vXQw1eoU/Lz6ggMis/OOMuMJXJJ7GFV+ycYyESzPdHWkkRatJ5mk448s6
         51AGJngCm6VjrQ/LvFBk3XZ2G8peiRLGyllTjI+QabWFeLMqKoSaLgVxUoCfHWJDVxxj
         CXmhyFJOuAmnTvEKNo4u5yFc1nlxoX5iTEzc1BwW0y81ON3XY49owTcAU6YQhnq0MjOX
         gGpGgK9PgLB4kQ/2nI1jLqJyTi7ZxliFTVWKpOVLM6hUK4QnDP7haFq1mdEEeK29EaaA
         Tb0Klvbf2nxIS0hjoYHK+DVr9iIA+K9OKkJSH3lvwuzUw1ZT5DuSYvvtguYdb+DUmfod
         3Vvw==
X-Forwarded-Encrypted: i=1; AJvYcCVJSoq1kRA6xDs0NGVWxfZRahD3Q39CWr3wjaC4WPhFaaYVtK+VfSj8AGPoTl13gEUuucSwGfYsB1s7iQ==@linaro.org
X-Gm-Message-State: AOJu0Yx0cviJfWoxNB23CsOAJqEXNL1/Q5OrVsmMGnVQAdCtfSZrAQQ/
	z7JCJlKpn3tVYZGlvyAS1rUBBOyaK6gtkg7nGjHaG1KSRJlQUj6QkJPZ8xExU/OJVg==
X-Gm-Gg: ASbGncvc3QPJGjCveM40Vvrr2wcIjSooMEw+hLpHGYhJ4IxRrA57FxbDcYOW7af9LHC
	ICEdaGna6bEqW8aflhuRHu+GZKt2zVkvfnNndSUXWZ49AXms61o+hs5PXb9lXUg3EJCnJGmJ8Qm
	rteJydpeJeakU4Me8KmVIGUsi+4X8UH8ALJs32LDZqwqZly2m+OrvOCi5T7YIVbWZUmSKteQOJO
	sb8ObFchfSH7fXH8qMR0GK4GgGqB+7BaxqJTKd2kpTFNzrtZv6qf5LHlPNBHm7muGLx0j0Iwrs2
	uBLXSC80k48WbKYmZeIMhb4NU4/zNcO+GE/n3W7dXHktXjQNY+Q9HQ==
X-Google-Smtp-Source: AGHT+IEJWR+Uz3DVZt9KYdu/mdHKD/zYJTerY5PAWb7H6QufO5JSs9PaYWwSKLe04QZ0UQGibGtN4A==
X-Received: by 2002:a05:6a20:c90d:b0:1f5:5b2a:f629 with SMTP id adf61e73a8af0-2046a6930a2mr15102046637.30.1745868862413;
        Mon, 28 Apr 2025 12:34:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25914238sm8435744b3a.7.2025.04.28.12.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:34:21 -0700 (PDT)
Message-ID: <21843e8d-cdbc-4f84-a652-01ee467f2dc7@linaro.org>
Date: Mon, 28 Apr 2025 12:34:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Yannis Bolliger <yannis.bolliger@protonmail.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aWMkxq4TPOhd

On 4/14/25 8:30 AM, Pierrick Bouvier wrote:
> It was reported that QEMU monitor command gva2gpa was reporting unmapped
> memory for a valid access (qemu-system-aarch64), during a copy from
> kernel to user space (__arch_copy_to_user symbol in Linux) [1].
> This was affecting cpu_memory_rw_debug also, which
> is used in numerous places in our codebase. After investigating, the
> problem was specific to arm_cpu_get_phys_page_attrs_debug.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-discuss/2025-04/msg00013.html
> 
> When performing user access from a privileged space, we need to do a
> second lookup for user mmu idx, following what get_a64_user_mem_index is
> doing at translation time.
> 
> This series first extract some functions, and then perform the second lookup
> expected using extracted functions.
> 
> Besides running all QEMU tests, it was explicitely checked that during a linux
> boot sequence, accesses now report a valid physical address inconditionnally
> using this (non sent) patch:
> 
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -997,9 +997,7 @@ static inline void tlb_set_compare(CPUTLBEntryFull *full, CPUTLBEntry *ent,
>       if (enable) {
>           address |= flags & TLB_FLAGS_MASK;
>           flags &= TLB_SLOW_FLAGS_MASK;
> -        if (flags) {
>               address |= TLB_FORCE_SLOW;
> -        }
>       } else {
>           address = -1;
>           flags = 0;
> @@ -1658,6 +1656,10 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
>           tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
>       }
> 
> +    vaddr page = addr & TARGET_PAGE_MASK;
> +    hwaddr physaddr = cpu_get_phys_page_debug(cpu, page);
> +    g_assert(physaddr != -1);
> +
>       full = &cpu->neg.tlb.d[mmu_idx].fulltlb[index];
>       flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
>       flags |= full->slow_flags[access_type];
> 
> v2:
> - fix style in first commit (philmd)
> 
> Pierrick Bouvier (4):
>    target/arm/ptw: extract arm_mmu_idx_to_security_space
>    target/arm/ptw: get current security_space for current mmu_idx
>    target/arm/ptw: extract arm_cpu_get_phys_page
>    target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug
> 
>   target/arm/ptw.c | 65 +++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 48 insertions(+), 17 deletions(-)
> 

Gentle ping on this series.
Any plan to queue it to tcg-next @Richard?

Regards,
Pierrick
