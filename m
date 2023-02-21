Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp2754738dll;
        Tue, 21 Feb 2023 09:26:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8XrlH/QHbysh0/Mz5HsTazh4A4yg9bp2n42Bh+IVxAxv9rcyFKNsaGCghyZIUqmDK9CNJd
X-Received: by 2002:ac8:5cd5:0:b0:3b9:e3fc:5689 with SMTP id s21-20020ac85cd5000000b003b9e3fc5689mr22848471qta.58.1677000392772;
        Tue, 21 Feb 2023 09:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677000392; cv=none;
        d=google.com; s=arc-20160816;
        b=wfqrhGNhC37bzihLKRhTNlFGMYpiZrWJ0QWwSNnV2rjqnUG1WZko9eLVGSJOpxNaJk
         UBeWqOxdHO8o8G3sOIAlBCtX3iN9FZp89UK089hsTOpFwPDe90cmcXjC4U9FCt5rah9L
         DHJuMhEP25hF74Ic0UHxbSIXtMVJgr/Ps0IP4wr+K2lIOe1L8P2sew8Nyy05VeU4YnS8
         1EmZdWx7k6k59pBnGQRoiys1lsoHB7peMw+kPrvFCCVldtNzpi38QbtUiHJyLj3y5K1r
         8j8kLv6DJn+j5m7/0HbPk/M4prTOsZlFeP3kSDrM3htobG73e4epQSyCdsi/MER7ATbM
         bSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MJC/NE6Sdq2vQ3Pt4HPxp2Xn0sEI9GRgJASE3NV66A0=;
        b=Du1gx2HOsqJ4USlgg/g2QOSrwzQiyUjrMsytEU4HX4vbJtviC8X4jsDb4mWGAHiPFE
         +PdaCqzGEwQlA9/5/axW2e3p4wBMrrWf833zQ4T+FnhaRTQyj3Q/7h1lrDpBOc9L5ddO
         hykXbrSgH5PE8jBhoNoR4V/844wBNmtSCq+iv0bi/iWTq1KkGp4CmEMVrsF5/LJrRsXZ
         xJRBNB54ZprhZN94Q5F9iKdHzIEGkFKDrXIHfvmxb0o/zSSFycjnHCbz3M2KZS77326n
         DBGd786/o7MkI0yf0HZG9untNkKIj7yMq6UMrF3aANIpZq1UWfJawuZx8Ki9whRnNRgk
         NAmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJt62hCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85948000000b003ba1a343c31si3689990qtz.95.2023.02.21.09.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:26:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJt62hCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUWOy-00078p-Mq; Tue, 21 Feb 2023 12:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWOv-000788-KI
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:26:02 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWOt-0000bN-Ua
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:26:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e5so6882610plg.8
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 09:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MJC/NE6Sdq2vQ3Pt4HPxp2Xn0sEI9GRgJASE3NV66A0=;
 b=bJt62hCesSeym65YmHbmnE8dcXCf9WKJPjetgNGDKjnhRmS7LbrsOK5xuxeRh91Nni
 43kda8Xi+fvYXrwqr2LkMntzIThbiMiydHU4kwrEQ0Zx5HAsVMTaMvfK/0HVND27Exu2
 VCO8cbWbGiPETTBhNCwz5w2s5rKB7ZJPhNEuxW3Xb1EjtfAyHweSl8X23WCsgchjkhzg
 FWx9ti5cX2MISiPGIfGmQ0PbhdSrCh/uMKgjJeI7tsBrGpG7Ug/E2vc2PFxnwR8Vdsfq
 5cVhnD8ZZZby563DTpqi7aB2RRn0PtAIshibiQ9BfvGko7mULjGBRK/lqMGi4VJsdW+K
 boMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJC/NE6Sdq2vQ3Pt4HPxp2Xn0sEI9GRgJASE3NV66A0=;
 b=YammoJxpRO64U8a63uyNE0Tq//g9sX92bVjGD6LngSIqBOFe+mW30TRDJz/tjhEGtd
 tkUJv+qAM9pPG6p43PXz/6WnzXHYJajrUCDSqZgvNmOzTOgZtBL5mqMbiDnToTfb+P/W
 q3ifV+u0FU/rL8IbcEtAriSYDNlxA6XMfG/W/RcKJUTQBb0NM49N3JcK0XByW8IcSJr0
 0jVyh34cvXE8Zgg9yC9eg/rBevS3phSRfy0So7gYzyqvoDDEa01q2b2Bvg1NyjdaqKgu
 tQcT3ckslDsTx+YRyXvxclqj35MVxwy/5/8YQB+AyxebZA6fFqMm1ZjkNpq5Q2u3iwPJ
 qTag==
X-Gm-Message-State: AO0yUKUXTmA04en+DSAbM2Eaufiw6mPmJjtsPUzqNVvyVeyiJiFli/lt
 h3wcUxtrQ5uCUn22Zp7aAKFd60Bp7Ck8pmmfLQ/UFQ==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1925894pjb.92.1677000358370; Tue, 21
 Feb 2023 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
In-Reply-To: <20230221021951.453601-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:25:46 +0000
Message-ID: <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: mIYscoPIDwN4

On Tue, 21 Feb 2023 at 02:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
> go ahead and implement the other system registers as well.
>
> Since there is significant overlap between the two, implement
> them with common code.  The only exception is the systemreg
> view of CONTROL, which merges the banked bits as per MRS.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Substatial rewrite using enumerator and shared code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     |   2 +
>  target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 196 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 059fe62eaa..6e97a256fb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -869,6 +869,8 @@ struct ArchCPU {
>
>      DynamicGDBXMLInfo dyn_sysreg_xml;
>      DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> +    DynamicGDBXMLInfo dyn_m_secextreg_xml;
>
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 062c8d447a..fef53e4ef5 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -322,6 +322,180 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
>      return cpu->dyn_sysreg_xml.num;
>  }
>
> +typedef enum {
> +    M_SYSREG_MSP,
> +    M_SYSREG_PSP,
> +    M_SYSREG_PRIMASK,
> +    M_SYSREG_CONTROL,
> +    M_SYSREG_BASEPRI,
> +    M_SYSREG_FAULTMASK,
> +    M_SYSREG_MSPLIM,
> +    M_SYSREG_PSPLIM,
> +} MProfileSysreg;
> +
> +static const struct {
> +    const char *name;
> +    int feature;
> +} m_sysreg_def[] = {
> +    [M_SYSREG_MSP] = { "msp", ARM_FEATURE_M },
> +    [M_SYSREG_PSP] = { "psp", ARM_FEATURE_M },
> +    [M_SYSREG_PRIMASK] = { "primask", ARM_FEATURE_M },
> +    [M_SYSREG_CONTROL] = { "control", ARM_FEATURE_M },
> +    [M_SYSREG_BASEPRI] = { "basepri", ARM_FEATURE_M_MAIN },
> +    [M_SYSREG_FAULTMASK] = { "faultmask", ARM_FEATURE_M_MAIN },
> +    [M_SYSREG_MSPLIM] = { "msplim", ARM_FEATURE_V8 },
> +    [M_SYSREG_PSPLIM] = { "psplim", ARM_FEATURE_V8 },
> +};
> +
> +static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
> +{
> +    uint32_t *ptr;
> +
> +    switch (reg) {
> +    case M_SYSREG_MSP:
> +        ptr = arm_v7m_get_sp_ptr(env, sec, false, true);
> +        break;
> +    case M_SYSREG_PSP:
> +        ptr = arm_v7m_get_sp_ptr(env, sec, true, true);
> +        break;
> +    case M_SYSREG_MSPLIM:
> +        ptr = &env->v7m.msplim[sec];
> +        break;
> +    case M_SYSREG_PSPLIM:
> +        ptr = &env->v7m.psplim[sec];
> +        break;
> +    case M_SYSREG_PRIMASK:
> +        ptr = &env->v7m.primask[sec];
> +        break;
> +    case M_SYSREG_BASEPRI:
> +        ptr = &env->v7m.basepri[sec];
> +        break;
> +    case M_SYSREG_FAULTMASK:
> +        ptr = &env->v7m.faultmask[sec];
> +        break;
> +    case M_SYSREG_CONTROL:
> +        ptr = &env->v7m.control[sec];
> +        break;
> +    default:
> +        return NULL;
> +    }
> +    return arm_feature(env, m_sysreg_def[reg].feature) ? ptr : NULL;
> +}
> +
> +static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
> +                        MProfileSysreg reg, bool secure)
> +{
> +    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
> +
> +    if (ptr == NULL) {
> +        return 0;
> +    }
> +    return gdb_get_reg32(buf, *ptr);
> +}
> +
> +static int m_sysreg_set(CPUARMState *env, uint8_t *buf,
> +                        MProfileSysreg reg, bool secure)
> +{
> +    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
> +
> +    if (ptr == NULL) {
> +        return 0;
> +    }
> +    *ptr = ldl_p(buf);
> +    return 4;
> +}
> +
> +static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    /*
> +     * Here, we emulate MRS instruction, where CONTROL has a mix of
> +     * banked and non-banked bits.
> +     */
> +    if (reg == M_SYSREG_CONTROL) {
> +        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
> +    }
> +    return m_sysreg_get(env, buf, reg, env->v7m.secure);
> +}
> +
> +static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    /* Control is a mix of banked and non-banked bits -- disallow write. */
> +    if (reg == M_SYSREG_CONTROL) {
> +        return 0;
> +    }

You also want to enforce the RES0 bits on registers like
PSPLIM, MSPLIM, FAULTMASK, PSP, MSP, if you're going to
implement writes. Effectively you really end up wanting to
get helper_v7m_msr to do the work for you.

> +    return m_sysreg_set(env, buf, reg, env->v7m.secure);
> +}

-- PMM
