Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2290606ejn;
        Mon, 17 Oct 2022 03:46:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65gPImAqgqfXULXj6ZRa5m519TMCmm1IW8BTGeBHLbw+ulMSdHQHDJS8yamUZj0Ip92diK
X-Received: by 2002:a05:622a:118c:b0:39c:32a5:d285 with SMTP id m12-20020a05622a118c00b0039c32a5d285mr8048651qtk.414.1666003597707;
        Mon, 17 Oct 2022 03:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666003597; cv=none;
        d=google.com; s=arc-20160816;
        b=VYAy9uD+/ExFMD7S6fqbzoW0JKTrGVWbgQi4hjLXa4I2YlyyY5HmmT3CxIPu+HSSzY
         RIsQlUeCZGE9yvmm9AZmCRnpPEownq/pi34jH9NKRdrVPWfvIyhpGK2MlUK05ijGAqpW
         LnTG91W8xRAR451HgURTRhte+MHRnemgYpdOUlJsim0/PFijO+Antrjq83iB14AaLuRN
         UbwAtp3iJE8HgZfkoKUHwUscdi+F24TZojdm49birR+/4VCX2ye5AuIvClJi1RtkcLAF
         S6LkdPZrqEMkugQ5lKbAISHfxihL/qQSmBun2xQB8kelFMDhO9C2MrZMHawpbmfo30ur
         ckgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=biMw6sWfA6b/ZtPufOL5PIMCY1EpUrn44B15EUjsWX8=;
        b=YPFCsZfK9+mDci5/qhWvs4HLA+6AZ1eSnjHobbHlpRz+rrlqkEp1nS67v1YxPX6SJf
         ryhRn8c190qr+LaPNgaEH3nk0ZHjWTHc1xve9vR8tJPL5SArzBurbq3WxH4wRi+eMuoV
         6fPOvV1kqAkI93CAYiUL5AYNqhSu94DRjUwDEOgEwV7NVqeUgkh7d3lAexmWJyF7ToAY
         8YA2g3WrBdq7vrJhRv+R6GgyIhhnl2lgUvCw3vaulRs1eVK4FW4HXPQnb9maoSdly6vF
         0XMbYxMnQwkbkd29ZSNn5J85ZrP71oNVu9x+ZpYyORowOcUTnXZ4BlItMK3VRS81LoX/
         6+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HLLBP7k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a379807000000b006e5f692c433si4800691qke.86.2022.10.17.03.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 03:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HLLBP7k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okNdl-0003JS-1L
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 06:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNd8-0003JH-OX
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 06:45:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNd5-0006eZ-IQ
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 06:45:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gf8so10593024pjb.5
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=biMw6sWfA6b/ZtPufOL5PIMCY1EpUrn44B15EUjsWX8=;
 b=HLLBP7k/G6MIhdnHa4Dg/PaOIq8ayHXQ+O2q8UA4/VVgQax0+oFcUWKrW6NQTUwqLS
 p2itg0bSmdqQQBlqNYO5wNSR5I9Cj1tfmeEJBR5TcZAIN1kPINBTNdmGtGIhs3660r0j
 o3jno+zqY0Cet+Ahr1Lj4vhmxK3HdYUizBrPZHCvdtnoSaVcx/F0GK7BGYYzloEocEE+
 6QaUKVK0xYFbFPqWffECTa6U3BblogRTjBXxjUr7rKZlnqlh4WM03vBbBvYFs5TddPln
 L/o43cx1XyM+O9hcuSs3q2ckV/ubtoJi7dalEK1XyVdbCwszF8UGKG79Z6ZG578oidyJ
 evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biMw6sWfA6b/ZtPufOL5PIMCY1EpUrn44B15EUjsWX8=;
 b=wDNWSaoxTNqZ4xgJBG8HCZYgAbsbhU6J+nM7OUQZxoryKMc7VbFT0jmtaAm4gHzzpY
 LWktYxXKmRayfQlUqsWrYmX+ND+4ui+YqIX+uBWvjasC61/xGIBr4gLCpsI1Rz5NW/Dv
 1A17rGaI9bqXwoecMcUwrNKQlZFGoQu9hnRNgWzIVu1qPEXfMmQjuZtOrc28QEr8onQO
 gs//JKPNrVEpEQsd10kUYYOiuFsJODlnrmb0Xmi3IGnb4fEhGv7SOmDunGvurLKHuibq
 DfOVo/iorTgnwbVSvS7h1LHkP7oEu2RG3F8S4gANcIf5n10pVMKLymi1gSOK41r7oDPy
 +Eaw==
X-Gm-Message-State: ACrzQf3yJ+1hA8RDOkV7k0ZsIk2mrVOY1M5ioNn5CVs+Ve8ou+M+bJmO
 oeOZCw52I+Db2OBPXAakpKX+y2kYyRJg9mkYb5XgTg==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr13116273pjb.19.1666003553942; Mon, 17
 Oct 2022 03:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-23-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 11:45:42 +0100
Message-ID: <CAFEAcA-shXQ34YdphS5ro+jQuSi93xiFa=3QTueQq46R+JV+tQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] target/arm: Implement FEAT_HAFDBS,
 access flag portion
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7R0I4DBqX+Cq

On Tue, 11 Oct 2022 at 04:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the atomic update for hardware management of the access flag.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Raise permission fault if pte read-only and atomic update reqd.
>     Split out dirty bit portion.
>     Prepare for a single update for AF + DB.

> +static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
> +                             uint64_t new_val, S1Translate *ptw,
> +                             ARMMMUFaultInfo *fi)
> +{
> +    uint64_t cur_val;
> +    void *host = ptw->out_host;
> +
> +    if (unlikely(!host)) {
> +        fi->type = ARMFault_UnsuppAtomicUpdate;
> +        fi->s1ptw = true;
> +        return 0;
> +    }
> +
> +    /*
> +     * Raising a stage2 Protection fault for an atomic update to a read-only
> +     * page is delayed until it is certain that there is a change to make.
> +     */
> +    if (unlikely(!ptw->out_rw)) {
> +        int flags;
> +        void *discard;
> +
> +        env->tlb_fi = fi;
> +        flags = probe_access_flags(env, ptw->out_virt, MMU_DATA_STORE,
> +                                   arm_to_core_mmu_idx(ptw->in_ptw_idx),
> +                                   true, &discard, 0);
> +        env->tlb_fi = NULL;
> +
> +        if (unlikely(flags & TLB_INVALID_MASK)) {
> +            assert(fi->type != ARMFault_None);
> +            fi->s2addr = ptw->out_virt;
> +            fi->stage2 = true;
> +            fi->s1ptw = true;
> +            fi->s1ns = ptw->in_secure;

Shouldn't there be a ! here ? LHS is true-for-NS and RHS is true-for-S, I think.

> +            return 0;
> +        }
> +
> +        /* In case CAS mismatches and we loop, remember writability. */
> +        ptw->out_rw = true;
> +    }
> +
> +#ifdef CONFIG_ATOMIC64
> +    if (ptw->out_be) {
> +        old_val = cpu_to_be64(old_val);
> +        new_val = cpu_to_be64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
> +        cur_val = be64_to_cpu(cur_val);
> +    } else {
> +        old_val = cpu_to_le64(old_val);
> +        new_val = cpu_to_le64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
> +        cur_val = le64_to_cpu(cur_val);
> +    }
> +#else
> +    /*
> +     * We can't support the full 64-bit atomic cmpxchg on the host.
> +     * Because this is only used for FEAT_HAFDBS, which is only for AA64,
> +     * we know that TCG_OVERSIZED_GUEST is set, which means that we are
> +     * running in round-robin mode and could only race with dma i/o.
> +     */
> +#ifndef TCG_OVERSIZED_GUEST
> +# error "Unexpected configuration"
> +#endif
> +    bool locked = qemu_mutex_iothread_locked();
> +    if (!locked) {
> +       qemu_mutex_lock_iothread();
> +    }
> +    if (ptw->out_be) {
> +        cur_val = ldq_be_p(host);
> +        if (cur_val == old_val) {
> +            stq_be_p(host, new_val);
> +        }
> +    } else {
> +        cur_val = ldq_le_p(host);
> +        if (cur_val == old_val) {
> +            stq_le_p(host, new_val);
> +        }
> +    }
> +    if (!locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +#endif
> +
> +    return cur_val;
> +}

> @@ -1286,7 +1389,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      if (fi->type != ARMFault_None) {
>          goto do_fault;
>      }
> +    new_descriptor = descriptor;
>
> + restart_atomic_update:
>      if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
>          /* Invalid, or the Reserved level 3 encoding */
>          goto do_translation_fault;
> @@ -1362,10 +1467,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>       * Here descaddr is the final physical address, and attributes
>       * are all in attrs.
>       */
> -    if ((attrs & (1 << 10)) == 0) {
> -        /* Access flag */
> -        fi->type = ARMFault_AccessFlag;
> -        goto do_fault;
> +    if (!(attrs & (1 << 10)) && !ptw->in_debug) {
> +        /*
> +         * Access flag.
> +         * If HA is enabled, prepare to update the descriptor below.
> +         * Otherwise, pass the access fault on to software.
> +         */
> +        if (param.ha) {
> +            new_descriptor |= 1 << 10; /* AF */
> +        } else {
> +            fi->type = ARMFault_AccessFlag;
> +            goto do_fault;
> +        }
>      }
>
>      ap = extract32(attrs, 6, 2);
> @@ -1381,6 +1494,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
>      }
>
> +    /* If FEAT_HAFDBS has made changes, update the PTE. */
> +    if (new_descriptor != descriptor) {
> +        new_descriptor = arm_casq_ptw(env, descriptor, new_descriptor, ptw, fi);
> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
> +        if (new_descriptor != descriptor) {

I think we could probably usefully add a comment here:

/*
 * I_YZSVV says that if the in-memory descriptor has changed, then we
 * must use the information in that new value (which might include a
 * different output address, different attributes, or generate a fault),
 * Restart the handling of the descriptor value from scratch.
 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
