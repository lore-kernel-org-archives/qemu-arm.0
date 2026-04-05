Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E164CE9D820
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Apr 2026 21:46:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9VIT-0001hL-8Q; Sun, 05 Apr 2026 17:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9VIQ-0001h2-TD
 for qemu-arm@nongnu.org; Sun, 05 Apr 2026 17:46:20 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9VIN-0006Zl-A3
 for qemu-arm@nongnu.org; Sun, 05 Apr 2026 17:46:16 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82cebbdab08so2457829b3a.2
 for <qemu-arm@nongnu.org>; Sun, 05 Apr 2026 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775425573; x=1776030373; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LnwBYYH9Il0dGXbrZmpVTL65kvhw+6RgGJ2d+c7LBGU=;
 b=kdgA0NRdHAGWdLkNZIIQSvJ5Cw9BAPCPVCucbx+cFQ/BIv28QbiMmAmGC04cCTZ4h5
 DJAD6TbnjYKKyIrTUsedHA+ZiOAMJsyGr9dLK8ri2C8x/6IprBZGpK2r2LAWfpgYe93/
 ol9kl3BlMdVK7Uk6GYx2jMekm0yywxh7zBvoM6gvouUjxlq33BQy0s0msafevYWu+U/c
 fdZ7/o0UGWRbi028IwKDO/8eny1GQIhWZdz4m87LlxvrdUIpt+0lR/557UWFSSEOb1N5
 XwQy9aOZ3P/Iv/Ht0xG7RZ9oYpmgBi1yacEU3Ntx28pPdlQINjm0I7syyvMUdzJ6cCof
 R0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775425573; x=1776030373;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LnwBYYH9Il0dGXbrZmpVTL65kvhw+6RgGJ2d+c7LBGU=;
 b=FOQx7B2EFnzYAfG1V5rAgvZqTJoT5w0tqHsvPqVZM1xA7o76+HbWQg+/ycWyHuEQ5I
 UxBwNTXjI2+yHjbna24g1985zA7BEIbwvTSyYXpS5mzsMPureXC2bq/su6tVvSTVxJwd
 aT0P+AYVJVQwA7RdoN95dR8zr25Njvmxz2gq1o8YcQsNnutXf6H+LV51MiZhPqhjObyf
 gVPPChPrxuhaI7zANxc6CXFCQ177Dzasi76d96FklmcgXv1iibgOrOm0PUnfacLBSjKW
 XH/6Tzb60rQSSKyojQNkW/cjEcRTfBFbLj3T0DfM9a4Skuimt9T93EelzGCcGiF0CAh5
 KdGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+nbc2vQTRm+m0S/Tz2Khsr5a1va06tTpzouuhihXw3IJPvMA3T7li1Rr2HByxlk93YdOVbI1epQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEVCJXWDXl7t99Wn4oFJ1ayO6/cvZTqxzR0U9aXazWePI3Ml2y
 LuQTgFLHjjwpm9db1G1+EIIgHyrtlpqCUN1EDldTnGeJa3AlLp60H/fiSLA7lNQ6fvU=
X-Gm-Gg: AeBDiesWSF3u7jmzVaWoJdb7IeJIfEhDkoQ1Ubweqh2heGqoONwu+KCvzWRw0RL9hLK
 jbmUWxRev41P4sq8mnccVfOQE5xt/PpJ3SvEjSI/ZfKPX3jcqIwdX/VtFvl7n3OjPWJDOzNcZN0
 Cm8mAWXYVZ0yPdcwhAi97JqCQmZMMxlhPhUdbkiOhODxO1KNayp1XHpNNxN/mLjMY1Z753SAq/7
 sNbJ5t9Fj5C4afej8JRULgjjMYrDgYXpj36F6hu2m3xWz0j4oWsUkqyZ71YZzLgnbEueZ70kMLX
 hChpSOAZWaaKLaYmbErqqUTYXhmQfV2VGCkEVEqgbu6sFlB3c/MFIKUMTvoGvOfxibkXIHXOfv/
 ECj5h679G8nfoOzaLCPBXaShctbWgfuf9lU+zvCXj9sQo+I96NL3lDuCO7nrsi30lBENSatx/nG
 qAr9cTs74fWXHroEf1Y5iiFVSugbFg0bLyKbhxMiG1d8r1KxAbXFycvdQafzYN5bGJAcw=
X-Received: by 2002:a05:6a00:2293:b0:827:3d52:5d1a with SMTP id
 d2e1a72fcca58-82d0d7525abmr10047342b3a.0.1775425573016; 
 Sun, 05 Apr 2026 14:46:13 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9b2714dsm14802935b3a.1.2026.04.05.14.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2026 14:46:12 -0700 (PDT)
Message-ID: <7be8b426-8f0d-4759-afdd-4de882748d2b@linaro.org>
Date: Mon, 6 Apr 2026 07:46:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] target/arm: add canonical tag check logic
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
 <20260309-feat-mte4-v4-6-daaf0375620d@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260309-feat-mte4-v4-6-daaf0375620d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/10/26 08:59, Gabriel Brookman wrote:
> This feature causes tag checks to compare logical address tags against
> their canonical form rather than against allocation tags, when the check
> happens in a canonically tagged memory region. Described in the ARM ARM
> section "Logical Address Tagging".
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/cpu-features.h      |  5 +++++
>   target/arm/cpu.h               |  1 +
>   target/arm/internals.h         | 31 ++++++++++++++++++++++++++++++-
>   target/arm/tcg/hflags.c        |  4 ++++
>   target/arm/tcg/mte_helper.c    | 21 +++++++++++++++++++++
>   target/arm/tcg/translate-a64.c |  7 +++++++
>   target/arm/tcg/translate.h     |  1 +
>   7 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 38fc56b52e..5e3dc5256f 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1154,6 +1154,11 @@ static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
>       return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
>   }
>   
> +static inline bool isar_feature_aa64_mte_mtx(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTEX) == 1;
> +}

!= 0.

> +/* Return true if Canonical Tagging is enabled. */
> +static inline bool canonical_tagging_enabled(CPUARMState *env, bool selector)
> +{
> +    int mmu_idx;
> +    uint64_t tcr, mtx_bit;
> +
> +    /* If mte4 is not implemented, then mtx is by definition not enabled */
> +    if (!cpu_isar_feature(aa64_mte_mtx, env_archcpu(env))) {
> +        return false;
> +    }
> +
> +    mmu_idx = arm_mmu_idx_el(env, arm_current_el(env));
> +    tcr = regime_tcr(env, mmu_idx);
> +
> +    /*
> +     * In two-range regimes, mtx is governed by bit 60 or 61 of TCR, and in
> +     * one-range regimes, bit 33 is used.
> +     */
> +    mtx_bit = regime_has_2_ranges(mmu_idx) ? 60 + selector : 33;
> +
> +    return extract64(tcr, mtx_bit, 1);
> +}

Unused?

> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index 1484087a19..b54fbd11c0 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -854,6 +854,13 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
>           mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
>                                     MMU_DATA_LOAD, ra);
>           if (!mem1) {
> +            /*
> +             * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
> +             * otherwise it is Untagged. See AArch64.CheckTag.

CheckTag is not where this is decided, but S1DecodeMemAttrs (and similarly in 
S1DisabledOutput).

> @@ -867,6 +874,12 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
>                                     ptr_last - next_page + 1,
>                                     MMU_DATA_LOAD, ra);
>   
> +        /* If either region is canonically tagged, do a canonical tag check */
> +        if (mtx_check(desc, bit55) && (!mem1 || !mem2)
> +            && (!tag_is_canonical(ptr_tag, bit55))) {
> +            return 0;
> +        }
> +

This fails to set *fault correctly for the second page.
You need to split checks into the separate !mem1 and !mem2 tests below.

> @@ -974,6 +987,7 @@ uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
>           goto done;
>       }
>   
> +
>       /*

Watch the spurrious changes.

The whole patch could be split into smaller parts.


r~

