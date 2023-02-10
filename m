Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1897560ejb;
        Fri, 10 Feb 2023 06:18:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9LTWo3puyWkomH1p6XaLggAyfL5gBh5eFI7y1T/US2HvPb7eeuqmYcK+R8qwVaD41H8+L7
X-Received: by 2002:a05:6102:23db:b0:406:c865:7571 with SMTP id x27-20020a05610223db00b00406c8657571mr10991757vsr.35.1676038718714;
        Fri, 10 Feb 2023 06:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676038718; cv=none;
        d=google.com; s=arc-20160816;
        b=MHF2hA6ObLRRBg35oiELA7mrXBT3fNHRaW+oLteV4vYX+BVu7potlje7KxiYmlQvJl
         +sGy3Mns1aEb9LuFLcpWcUupP7JUEthtcNeC04YXP8890YoNDnCVfQgfYhWsc1g6TpPl
         AfFuvstC89zLCRFhQap/udSrP7Ivo0/+qdO8biKECwCrWGnH/diXQHmNQkdDtYPLqcoh
         PYy3fYuq99ArsWe/Mm1X37wqMlmFV7q8kB6WWQEnKyHaevuwAjpjie/uP4lpznutxMHc
         cz8uF8sUaZPrYkGN45B74+UG6YYzF3EvgkVQoyyLbqs8YoXLBf8VKEjW/wsLLA6trBl0
         ciOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qMHoy+w6xtzknnqout1UYWDXl0kMszxmrVrYwvWekyc=;
        b=Z2ElePiT9p3A55NRQ9C4TumXLyh/ACqCYmYGj15ggBDX8EfRH9dPdP3Id+iHzUudLz
         TdSL8YCx0C+4G8v5NkQNg3WUd8Jb/DxsXbP4Vdu2hK+LalFqsGa87Ogbl8xrDlyvS6hM
         +ppNqanPZdivd91eZfra7E25Grd1eVczQDV/yxJsyud3Gu51EBLbbWbNCdSFC3dKUkeQ
         BT7whETu8yFF2zLNPKWDJgc89rWHfGqpO3jKUg1q+ylAFOGYptK3kv7yJ4m3G3Cxgxpi
         47MfAzN8nHo+xhEpfvraxJMJy/PFuog1ys9LkCtZP29Pi6bqDa5CxIWNT6CxxVDFWsWk
         TVVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVeo06o4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd41-20020a05610241a900b003d09bb80245si2280572vsb.190.2023.02.10.06.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 06:18:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVeo06o4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQUEF-0003fh-Nr; Fri, 10 Feb 2023 09:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUEE-0003aq-7X
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 09:18:18 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUEC-0006mu-DG
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 09:18:17 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u9so6615522plf.3
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 06:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qMHoy+w6xtzknnqout1UYWDXl0kMszxmrVrYwvWekyc=;
 b=nVeo06o4lXAWE8yxCY+O8Bw0EjMXfdkTzCkjkmKsxfA3A3P58fzeCug3xoqdoBXBVN
 6G5xEQuXB/+Aq4lJzor97apRpUmKry8ieG+TY1LSBa892eVob4T+6LQsAe5NQ6UlRlp1
 hJ/wnlrP9L5PLnrOArliIgc/sPmsJF+TyWvJJYoYRCaiTM+xmhK5nP/6EN5nTTAh7omr
 VbkvZPIlS7JaWgJVn3SHci5AYa2KfUJSE1hO8Wg6Fo0JvrWiijyrhJHTCJJAQEw6B8du
 6US7F9P2zOmYd9roKd9gRJus9j71k0scSU3pfFmEUx/0IMLEPwHC54KLSpKNJi6rBRKL
 WOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qMHoy+w6xtzknnqout1UYWDXl0kMszxmrVrYwvWekyc=;
 b=H+fRBwEW/uZPmvvh2RUT3fabTscj4i3wg48XTVJsc6TU8/4IVpACpLTTxo7ujC5MrL
 S8NlyC6ZFkaXLhFNtXw5l/yVKSC85EFVqWOS40sbbJumyulr5/BfpG/0WotllETv32eY
 qQr+8cjqK0wKF4V4NIs2cu24Ztgff9ivPK24heIqfShDpEIhSNYKfTEH4b8TVAZ5AgRl
 RPdfruCa3dIiRlFjZpms3OW5Sgl3shfmVrC/AGtlVK9bw6XjT0dSu3DL6jHAjPU1UdOd
 khw3klYEqUhAegSSNee1bDTsYUyG/A7lxLIFtmu24NDOggxBvqm8eR4bEf6wXCe5KQpO
 UZrw==
X-Gm-Message-State: AO0yUKV1ZaMSwiDnT5jIqlo0yzJv5Ax6D1iltk3Xea8UoEURWrHaforv
 x4pzd2ftLF6C9ECkWDhAvHiAs9b18XKMGTIwjU24cw==
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1632785pjn.89.1676038694823; Fri, 10 Feb
 2023 06:18:14 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-21-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:18:03 +0000
Message-ID: <CAFEAcA-e5pPzRQebLXHwmDg+CAKiQTbyBgXB-Rnqk+VA4+H0jw@mail.gmail.com>
Subject: Re: [PATCH 20/22] target/arm: Implement the granule protection check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W2tX0tVTbh6z

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place the check at the end of get_phys_addr_with_struct,
> so that we check all physical results.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 253 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 234 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3205339957..8249d93326 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -32,11 +32,18 @@ typedef struct S1Translate {
>      void *out_host;
>  } S1Translate;
>
> -static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> -                                      target_ulong address,
> -                                      MMUAccessType access_type,
> -                                      GetPhysAddrResult *result,
> -                                      ARMMMUFaultInfo *fi)
> +static bool get_phys_addr_inner(CPUARMState *env, S1Translate *ptw,
> +                                target_ulong address,
> +                                MMUAccessType access_type,
> +                                GetPhysAddrResult *result,
> +                                ARMMMUFaultInfo *fi)
> +    __attribute__((nonnull));
> +
> +static bool get_phys_addr_outer(CPUARMState *env, S1Translate *ptw,
> +                                target_ulong address,
> +                                MMUAccessType access_type,
> +                                GetPhysAddrResult *result,
> +                                ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));

I find these function names confusing, and the spec doesn't seem
to use the inner/outer terminology. Maybe there are clearer names?
Failing that, we should have a comment explaining the difference.

>  /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> @@ -193,6 +200,197 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
>  }
>
> +static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
> +                                     ARMSecuritySpace pspace,
> +                                     ARMMMUFaultInfo *fi)
> +{
> +    MemTxAttrs attrs = {
> +        .secure = true,
> +        .space = ARMSS_Root,
> +    };
> +    ARMCPU *cpu = env_archcpu(env);
> +    uint64_t gpccr = env->cp15.gpccr_el3;
> +    unsigned pps, pgs, l0gptsz, level = 0;
> +    uint64_t tableaddr, pps_mask, align, entry, index;
> +    AddressSpace *as;
> +    MemTxResult result;
> +    int gpi;
> +
> +    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
> +        return true;
> +    }
> +
> +    /*
> +     * GPC Priority 1 (R_GMGRR):
> +     * R_JWCSM: If the configuration of GPCCR_EL3 is invalid,
> +     * the access fails as GPT walk fault at level 0.
> +     */
> +
> +    /*
> +     * Configuration of PPS to a value exceeding the implemented
> +     * physical address size is invalid.
> +     */
> +    pps = FIELD_EX64(gpccr, GPCCR, PPS);
> +    if (pps > FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE)) {
> +        goto fault_walk;
> +    }
> +    pps = pamax_map[pps];
> +    pps_mask = MAKE_64BIT_MASK(0, pps);
> +
> +    switch (FIELD_EX64(gpccr, GPCCR, SH)) {
> +    case 0b10: /* outer sharable */
> +        break;
> +    case 0b00: /* non-sharable */
> +    case 0b11: /* inner sharable */
> +        /* Inner and Outer non-cacheable requires Outer sharable. */

"Shareable" with an 'e' in all these comments.

> +        if (FIELD_EX64(gpccr, GPCCR, ORGN) == 0 &&
> +            FIELD_EX64(gpccr, GPCCR, IRGN) == 0) {
> +            goto fault_walk;
> +        }
> +        break;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
