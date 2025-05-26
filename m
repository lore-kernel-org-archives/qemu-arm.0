Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4376130njc;
        Mon, 26 May 2025 11:21:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPIZwAbNUbY6niUYa5nsGv2oelq+0HyXQGcP7g50i5n0uA1rrR8XDLpRqHxkr5hsVArrWgosMMQMg1UA==@linaro.org
X-Google-Smtp-Source: AGHT+IF03OocGe0/5dRssbCkJSL3FPnfLsdy4Mu8lqXhw2ukNZrBnFVvDVEAd0vl/34YEUJLdd2d
X-Received: by 2002:ac8:5c8d:0:b0:476:a03b:96ec with SMTP id d75a77b69052e-49f4781f61fmr171078371cf.32.1748283719468;
        Mon, 26 May 2025 11:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748283719; cv=none;
        d=google.com; s=arc-20240605;
        b=lJYv2kj+8F3Qcn+HBN8hBVstevyoTFI1ao1JWeVldXRRjCo5Mo+BmeQrPFmUL+QNXK
         5CU21xeHx7W60jx5SsAOYYlKeJUoEER0TWstUaEjTbbv29UyT5+A4W23npLV3xuilurn
         E+4WivYXgeqcZb6KCYU3Fq6k3Or9/q6b+sdy18ihmxy+szPCNlkMhAXbVf1ZVNDuBpVo
         ZBA7x3VUKguoDVlATr4BndzWOgzyg7wPp4UtrEx3qQnE+nevh/lPLC0m2Yo3MVCQzWUT
         via9rFIHPNbaASjucJ+6azT8LBk23TzZoT9xqDy342922NvSBmKmn2XdIY5PVaBbm/jC
         qJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5T8zMVE0T4iwzMnWdlzH/Z8MI00+Ju1r6ZZBAvZtpVI=;
        fh=tCI+fGpLJ81cPz9/j+r7XMScn+wEFdaz+D8UfbzV/rY=;
        b=O+P9QW3InnDPVNwYtzDpLjaUEb6p3ODC/GTilQQ8FJiBZNEJ3PbOfxBLEL1KE5NBTx
         PBHCUnX+urGVjo8Y5fHnTukztdFfSI5R4Gp1YHNUxeRQT3g3q7q3f5y4YZZyUJMfT4yz
         ILEHBfVPNh8ZP0dyhysCaOotvq4AARs/W+Y/D5k0Y+XKkNoGOxWRqRUKaFHUN138OY++
         sEtx2WmwFqb8kH3VhQsMdvyz39XF38Ic6/ytwoAgTIDSngHkKgsRR7XdsjDSG1cLASib
         8UQtpvMsZAjKUVAQFJ7HeFsw5mm5tPte1G0sD90Z0Xj+ry1KXWrl5iEFvepjwlsgA7Oo
         vo3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNcU0++L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae438948si252905771cf.164.2025.05.26.11.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 11:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNcU0++L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJcSC-0002FV-8N; Mon, 26 May 2025 14:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJcS8-0002CJ-Bn
 for qemu-devel@nongnu.org; Mon, 26 May 2025 14:21:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJcS6-0007le-Js
 for qemu-devel@nongnu.org; Mon, 26 May 2025 14:21:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so35615835e9.3
 for <qemu-devel@nongnu.org>; Mon, 26 May 2025 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748283693; x=1748888493; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5T8zMVE0T4iwzMnWdlzH/Z8MI00+Ju1r6ZZBAvZtpVI=;
 b=rNcU0++L0kWr4tfXag7hGvqiYu6B2MNO8mCw3vvx61Wi568shcH7hRMQ8/hdYFNOEr
 NZOkLQFeRwlTjT6AmZtfZFTzqLqkObDlnHFHg8SPgUUW4U9G2mjRgStDxBoLMd8yPQOg
 Lu4wn5Zx6D0yRQzrfllO9YfYDunyMH3hOM9RVSBV5RMcy9A3+5c9KY+jOd82oSlsNtE1
 iSi2puVsSviAE3zvA4UVtPbDBe9ERjaeBiwO3exkWZrMMRvzTDsWMIqJtTJxUKXH8V8D
 OoWetB5yMA5/okKJoOEttqgW5P4/YPEx0Nxt7kwrvSrn5etyFEr8yc8+OID7fnXpGE95
 ot2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748283693; x=1748888493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5T8zMVE0T4iwzMnWdlzH/Z8MI00+Ju1r6ZZBAvZtpVI=;
 b=kENU6XEFKHDkFRNBU6dG5c0ZFiwFcC/7cMg/B7u35wpGZXJA9/j4T6TQt3SuMPKsNh
 JKGS+g1cOzWZRbMPKogcxzqjf2dtvZ/YHYQ8QfhfrzGNKjYyESQ5mDkjSWbuMah6kHLz
 SUH6TStkrgRpEprKzvlIA0k17JgTq5A+xST0P9Cje5SC8QTycU6YYQ0DD8lg4sQ6l1nE
 b5oulvYKqnF7PsE/z5CjoGU1QoerKFyN0+9wsVQRNTmaoqjzGhz7b8whojEdEgAcVasC
 a17MXNU2p59G4NSKY4tY/uEjSE4YNEiDHM+oNUWe5Tbf5xUn5fGkojwRtwB1xzkH77Sc
 8vNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWppSFkwpGsYNWEooW8UphlDBgQh2Q2AYgXCygRurBpFpdxrjB+Kv/TNGViKlqS2B24ERRPzIhH6E1d@nongnu.org
X-Gm-Message-State: AOJu0Yy9XBzyoxy+fUKTLhfQOjADuYuInrRlJqWfzH1FhwmIspdFrGqL
 0TF6WnAOIqZTxWLlucmEgfPBNvFWKrLDY8yhDRYVW9uEgdAouHEct5T1r92XPHnCmYQ=
X-Gm-Gg: ASbGncsMCPVCzzGspAakszRE2kh6+iah87pOQ4Jv8reGyXa1m/KwQbM+2UFtV9yRx/q
 CcD2ykQ9DumWLRQ0HeSTowhDswW11cah4BrKgpRNUyZ7i5szBXHeMAfPSaNrZghvfBcLQyrwT9T
 L15mqXjx53wtN3fDV53ipvTXwMv8QS7mmtz5CmEY6KE6Kt7jhc9wGZ3xvhbEpCl4XUy1z2IOSLU
 xBQBAD7M7/9MxpC4pyhk7Xe4vnM+iz3KgrIi7vwu1ZTvDaKwT7GY/0Lcs23hEOrFcQzcbkqJIBI
 i+TY0/aw3vMeHH2ZLUtwm3lMpeNqz3sjDJ0PxasqDF6xStNr8JJHI/lN4BHsBSNXoXVDpcpvuzQ
 CdcfX4Mg4Gor7eDFxbsP9yDgJ
X-Received: by 2002:a05:600c:468a:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-44c8ee86125mr97515785e9.0.1748283692995; 
 Mon, 26 May 2025 11:21:32 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44fcbe5c4edsm2431795e9.2.2025.05.26.11.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 11:21:32 -0700 (PDT)
Message-ID: <e8176be8-dbe9-4cf4-a23c-a6100d530c0b@linaro.org>
Date: Mon, 26 May 2025 20:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] target/arm: Fill in TCGCPUOps.pointer_wrap
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: foss@percivaleng.com, qemu-arm@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20250504205714.3432096-1-richard.henderson@linaro.org>
 <20250504205714.3432096-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250504205714.3432096-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BWU8pcNTtNYb

+Gustavo

On 4/5/25 22:57, Richard Henderson wrote:
> For a-profile, check A32 vs A64 state.
> For m-profile, use cpu_pointer_wrap_uint32.
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c         | 24 ++++++++++++++++++++++++
>   target/arm/tcg/cpu-v7m.c |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 45cb6fd7ee..18edcf49c6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2710,6 +2710,29 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>   #endif
>   
>   #ifdef CONFIG_TCG
> +#ifndef CONFIG_USER_ONLY
> +static vaddr aprofile_pointer_wrap(CPUState *cs, int mmu_idx,
> +                                   vaddr result, vaddr base)
> +{
> +    /*
> +     * The Stage2 and Phys indexes are only used for ptw on arm32,
> +     * and all pte's are aligned, so we never produce a wrap for these.
> +     * Double check that we're not truncating a 40-bit physical address.
> +     */
> +    assert((unsigned)mmu_idx < (ARMMMUIdx_Stage2_S & ARM_MMU_IDX_COREIDX_MASK));
> +
> +    if (!is_a64(cpu_env(cs))) {
> +        return (uint32_t)result;
> +    }
> +
> +    /*
> +     * TODO: For FEAT_CPA2, decide how to we want to resolve
> +     * Unpredictable_CPACHECK in AddressIncrement.
> +     */
> +    return result;
> +}
> +#endif /* !CONFIG_USER_ONLY */
> +
>   static const TCGCPUOps arm_tcg_ops = {
>       .mttcg_supported = true,
>       /* ARM processors have a weak memory model */
> @@ -2729,6 +2752,7 @@ static const TCGCPUOps arm_tcg_ops = {
>       .untagged_addr = aarch64_untagged_addr,
>   #else
>       .tlb_fill_align = arm_cpu_tlb_fill_align,
> +    .pointer_wrap = aprofile_pointer_wrap,

IIUC this is also used by non A-profiles (R-profiles and
non Cortex cores).

Patch LGTM but I'd rather someone else to look at it.

>       .cpu_exec_interrupt = arm_cpu_exec_interrupt,
>       .cpu_exec_halt = arm_cpu_exec_halt,
>       .cpu_exec_reset = cpu_reset,
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index 95b23d9b55..8e1a083b91 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -249,6 +249,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
>       .record_sigbus = arm_cpu_record_sigbus,
>   #else
>       .tlb_fill_align = arm_cpu_tlb_fill_align,
> +    .pointer_wrap = cpu_pointer_wrap_uint32,
>       .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
>       .cpu_exec_halt = arm_cpu_exec_halt,
>       .cpu_exec_reset = cpu_reset,

