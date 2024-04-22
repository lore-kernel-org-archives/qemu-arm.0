Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4351752ejd;
        Mon, 22 Apr 2024 08:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWz0mWwPfmzxfOD5HbZpda6JtLQeAKom4V2T3eKy8Eyo0GOzeHKlQ17ShZuXhaEwbRZmaPnux8C7YpT1J7ipjbjcmVc3jmO
X-Google-Smtp-Source: AGHT+IEgj8cpPh7pkcEK10tL7PdDGDJt8O+ETPRUtSf15j/EvxIMwQen11A6nIaRVJc5LzW1z+aG
X-Received: by 2002:ac8:4ccd:0:b0:437:c4cb:ea09 with SMTP id l13-20020ac84ccd000000b00437c4cbea09mr8311825qtv.49.1713799620497;
        Mon, 22 Apr 2024 08:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713799620; cv=none;
        d=google.com; s=arc-20160816;
        b=vrhonGQCVlyoD59Im5bFj85fLW+dGo+BKmZt6ZDJk5qV5jH7DNrnCldV0ACYTPb3U4
         JHa/zZBIZ9sEETDobk8qDfVnTg+1BNn6wqvuq4VsARMcoE0dZOXjiGcxWw4ZMUyVwlQB
         NFclRABreLEp2xqrKwhfxz+X/Jf56WRTBgoslXm/ovCSIxlM7Fsl6DqLENqLxfz13FP/
         UQx8SCaUQFUo1/dHoJm/okWdxcPIJC79pHkuQk/RrWE+Q0QR5BRdIfZ0vVuQDoyAMgAG
         e2EbURtOC9EmjXrHlDxqrS8GlJaGMKtGBtyBAjf2L1hEdBKBpwCz5QJ1m2eOAYDjfZ4d
         /EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=U2gdhxX09aD3aiJ5geHa1wVmVIQRH9b8n/G/i79oRUk=;
        fh=Os5eDRCS73/x8puqrLVj3c7NuOJ6iKrEyWhZenAZx0k=;
        b=uCW6h26sL5F99K55LQCUdjSP36o2DGOVI+e1RJbfTBGZs35VwxBP1mWSduM6tOnhHK
         wPz44OLhmxBSKmHD5QcittWYwHuMxIKypQIzNPKmei+xyHuvLBZN9NR71eNR95aaLvCw
         rmJ9P2bbiTO5kcYAoTbrK/qnqZTQpI492a3JLiuzgeqvqPd2Ve4pDPkQItLuZsQ9Nq9j
         yVMmriPtUQf3497RKCSNaoetXW5mWGOgmoB/IQv2ealzsaEI6BMw8Yyml6AQ2ufOIAiv
         KWgHR1x40DSuA+Gx89QSuNhhk+JmtsVsqSnzJpXO6bLLl1SBcKe9b49Wn/7C/5iP5aF3
         Fq8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=DKguKkNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020ac85813000000b0043538d98260si10986571qtg.344.2024.04.22.08.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 08:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=DKguKkNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ryvZ2-0007Q0-9B; Mon, 22 Apr 2024 11:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ryvYy-0007Pb-Tp
 for qemu-devel@nongnu.org; Mon, 22 Apr 2024 11:26:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ryvYv-0002xC-8q
 for qemu-devel@nongnu.org; Mon, 22 Apr 2024 11:26:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso3123854a12.2
 for <qemu-devel@nongnu.org>; Mon, 22 Apr 2024 08:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1713799585; x=1714404385; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2gdhxX09aD3aiJ5geHa1wVmVIQRH9b8n/G/i79oRUk=;
 b=DKguKkNf+ruYKY2tlCiZ7FcP11sclr2mXruu36m37G/11PIuuuURieU7TrKw8TrBET
 7EaSC6LJ5XPfjQTIfdbAiyWiGCV2fpAyE2SUItepghPOLzmoeb8QjMEKJjceVpFfL5he
 CIHNmAy7hrHJeBjzh0TQO/2rtshFri4BcFkkDGTgTC55mXXZnq+PTE2jODDuOZeyPrp1
 zU+NlLIHhjxCBa3otAYGKI7woUD7LADLYUvjEz3eUw99Qok+NViWekNklp2u3Hvkhzz8
 cKzSujB+09rDyuTZ36PUb90FkTbOUzHEMgjOMQnmneratmLX0j8Z5vDpWINxjw3etrl0
 pCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713799585; x=1714404385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2gdhxX09aD3aiJ5geHa1wVmVIQRH9b8n/G/i79oRUk=;
 b=Pn4G9HaAOpOwW785YkKdRsEbTKmChFauVrsbRFxa464O/JBsZHhka9qbFl96zOxJhs
 18JnW3Mrgk3fsu1g7MA0QwCI0opibVAvvF73XZ3l1+07HaAaoJWeIHwCFAlCqpOGAtcD
 f2jwI5Dt3IB6gwBw8QSumneq2QOEnaWl5My4vlhQy42sVG8N3iLULvtCPkXOi1mJzt/5
 QVa86UUPb09gYuSmGMhjEolTGQyAmEI3tZBGUmxeHal0YmHY54CcchUeapCymCZvABah
 6mufKYHTHi+nT6kibvWTOA4XQ7tZ33ygZLnoofs2NfciSv2d+aoi8M6GYwdu/Mag7Qz7
 ZTSQ==
X-Gm-Message-State: AOJu0Ywt7JAoryhHSK59l8WMi1ELzwZX5ON47/dRWoqdBk9+tnl6GocJ
 gvCN+DPr6emjbdBePBKZTV/S6FCS1OJrEfSKyBPoieyFWsA0t7SRA71NIq6CQuoZrhO+nQtufNr
 UEV3+VsRZu9a9pnl7dcXd9pC3e1eGo4QNJhav
X-Received: by 2002:a17:90a:df92:b0:2a5:24ab:1a94 with SMTP id
 p18-20020a17090adf9200b002a524ab1a94mr7687246pjv.49.1713799584984; Mon, 22
 Apr 2024 08:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240301204110.656742-1-richard.henderson@linaro.org>
 <20240301204110.656742-6-richard.henderson@linaro.org>
In-Reply-To: <20240301204110.656742-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Mon, 22 Apr 2024 17:26:13 +0200
Message-ID: <CAJ307Egu6951WwbdoTERUVff9cr=2qBK70FWgk3Ck-1DCpDtHA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] target/arm: Do memory type alignment check when
 translation disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Idan Horowitz <idan.horowitz@gmail.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=chigot@adacore.com; helo=mail-pg1-x533.google.com
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
X-TUID: yf9dhCz3umX+

Hi Richard,

While testing the future V9, I've some regressions on a custom board
using cortex-R5 CPUs.
Unaligned data accesses are no longer allowed because of that patch.

I've dug into the various documentation and it seems that R-profile
CPUs don't have the same default memory type as A-profile. It depends
on a default memory map provided in the R-Profile RM in C1.3 [1], even
when PMU is disabled.

> Each PMSAv8-32 MPU has an associated default memory map which is used whe=
n the MPU is not enabled.
> ...
> Table C1-4 and Table C1-5 describe the default memory map defined for the=
 EL1 MPU.

For our case, Table C1-5 can be simplified as:
 |  0x00000000 =E2=80=93 0x7FFFFFFF Normal
 |  0x80000000 =E2=80=93 0xBFFFFFFF Device-nGnRE
 |  0xC0000000 =E2=80=93 0xFFFFFFFF Device-nGnRnE

Therefore, we can't blindly enable strict alignment checking solely on
SCTLR bits. We should make it depend on the address targeted. But is
it possible to know that address in `aprofile_require_alignment` ?
with `mmu_idx` ?

By the way, are R-Profile CPUs the same as those having the `PMSA`
feature ? That could mean we can use the `ARM_FEATURE_PMSA` to deal
with that, instead of create a new `ARM_FEATURE_R`

Note that the RM I've linked is for ARMv8. But this other link [2]
seems to show a similar behavior for arm-v7.

cc Jonathan and Ard, though not sure this is the same bug you've
reported earlier.

Thanks,
Cl=C3=A9ment
[1] https://developer.arm.com/documentation/ddi0568/a-c/?lang=3Den
[2] https://developer.arm.com/documentation/ddi0406/cb/System-Level-Archite=
cture/Protected-Memory-System-Architecture--PMSA-/About-the-PMSA/Enabling-a=
nd-disabling-the-MPU?lang=3Den#BEIJEFCJ

On Fri, Mar 1, 2024 at 9:43=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If translation is disabled, the default memory type is Device, which
> requires alignment checking.  This is more optimally done early via
> the MemOp given to the TCG memory operation.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/hflags.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> index 8e5d35d922..5da1b0fc1d 100644
> --- a/target/arm/tcg/hflags.c
> +++ b/target/arm/tcg/hflags.c
> @@ -26,6 +26,35 @@ static inline bool fgt_svc(CPUARMState *env, int el)
>          FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL=
1);
>  }
>
> +/* Return true if memory alignment should be enforced. */
> +static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_=
t sctlr)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    /* Check the alignment enable bit. */
> +    if (sctlr & SCTLR_A) {
> +        return true;
> +    }
> +
> +    /*
> +     * If translation is disabled, then the default memory type is
> +     * Device(-nGnRnE) instead of Normal, which requires that alignment
> +     * be enforced.  Since this affects all ram, it is most efficient
> +     * to handle this during translation.
> +     */
> +    if (sctlr & SCTLR_M) {
> +        /* Translation enabled: memory type in PTE via MAIR_ELx. */
> +        return false;
> +    }
> +    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
> +        /* Stage 2 translation enabled: memory type in PTE. */
> +        return false;
> +    }
> +    return true;
> +#endif
> +}
> +
>  static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
>                                             ARMMMUIdx mmu_idx,
>                                             CPUARMTBFlags flags)
> @@ -121,8 +150,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *=
env, int fp_el,
>  {
>      CPUARMTBFlags flags =3D {};
>      int el =3D arm_current_el(env);
> +    uint64_t sctlr =3D arm_sctlr(env, el);
>
> -    if (arm_sctlr(env, el) & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
>
> @@ -223,7 +253,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *=
env, int el, int fp_el,
>
>      sctlr =3D regime_sctlr(env, stage1);
>
> -    if (sctlr & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
>
> --
> 2.34.1
>
>
