Received: by 10.25.44.15 with SMTP id s15csp1346322lfs;
        Wed, 5 Jul 2017 16:53:01 -0700 (PDT)
X-Received: by 10.28.13.138 with SMTP id 132mr34393254wmn.23.1499298781633;
        Wed, 05 Jul 2017 16:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499298781; cv=none;
        d=google.com; s=arc-20160816;
        b=KhonTdpu6Xedl0KHVshvX6G1tV3+35/Ye8GiMrbfIkfraMmB3O6BuZ1Ujg5BPmW4RF
         3krzQ3dkW4nPgsTQpQTpSh2/tZV22hsYiWaMihxMA4/86G/mV30ThUwtSxAdcC7vJ+0s
         iQhUc31FOPo9ihP7c3GctnAOmXdEMSUx+ghv+S/GcWAc72m8uTRBNkTqktC/kQXfsMWS
         /YKwg0a3ouuZLnUH+2jDbTiVSa5dRnv02xUzIo8Lg7ZOahmuLjVgQ+lwuaZRtwSPwuTL
         8F7hQP/G3u+RoS3MvBcT+jZkYc0uDtL4Xf2ku5tm/Uphi7WSmX88i6dOnMbh8FSJE8rt
         FHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ecXxrgUqE7xZujzLZ3kOB9H80R5T1xEeoCzZsBVtNBM=;
        b=ZFTwxWLAjRH0ZmOHMJMHaplx8Gpso1y/3wdkyo4RpVfADb8vEdCq0bIlsod/fAq1Jo
         ewD1JLyizkCv1k1aRZmSThNOWA7bgMBUgk9kSlF2JUkz6/8FCi9ETEhMYLhltCN3jB+f
         b5g4zK/jUubADApjzKN/hSi0d2xJy5yWW21hm+UUKT8e2z++elccmU9YJQthwsoHCCwR
         +hnzVrkbvkGQtB5TCuEor/7duvUab/WqmvYM2UkNoOrxfEFWezWtgKxJ5DFco+QxCyOo
         X7LHgxf69P86XgWmt9S+DsThzDm8PyN1Xp0j1ikon0mDkfWyUOZjGi4jjx2jLhibamMp
         sRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QJweeXw2;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com. [2a00:1450:400c:c0c::241])
        by mx.google.com with ESMTPS id x5si273578wrd.8.2017.07.05.16.53.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jul 2017 16:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) client-ip=2a00:1450:400c:c0c::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QJweeXw2;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-wr0-x241.google.com with SMTP id z45so1042200wrb.2;
        Wed, 05 Jul 2017 16:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ecXxrgUqE7xZujzLZ3kOB9H80R5T1xEeoCzZsBVtNBM=;
        b=QJweeXw2HnJ3IglxRuCEa84Z1ChMxscvPTI/mlndrklJBI1Si0DBeo0Fbx2LxmPSIJ
         Oo0rA+jUX1SvESnPavxTEIZlrdxT70wvBAOnuCgSk9sC+8G+z+22DCAERKaL6YtfSak0
         qOux9pf73iqU4IO+h8eMCzKe/Alc6CtL/tFUME9kjWZKY5GSqNQ5XbV2MXo1njTdItH3
         HQgU4/hLOQxdhqlZ1iBr6hcTmlhE4dlJn2SDkoiQDOXdOAoEy5RI7r/TuMSizrUdtFw0
         cEA0xD5dFYhy3+xIV5eIhc94w/My4lmfAlKFODhkdZsUvOHWpDROhSp7QQawpjd649w6
         NIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ecXxrgUqE7xZujzLZ3kOB9H80R5T1xEeoCzZsBVtNBM=;
        b=Yju8HkBRISjVvNyI7q2UgG4rOZrUGADy/hiYkeVISyFI8/CPyb+SLrtdl1GNeotjGZ
         0MT0gW3XkTUXaBEQDqQSzWeZQjtz9OI3PciNVN/XjgGgzdAxuAkLJxFcDldGkBphdCZd
         eIF67BGvQBk2xMeblvqC9qMsaMEOpvFreHUnrB8HeYMdSgIKXGov2sm97DX36r7HSznP
         A6k+RlXhbIxWjiASRJwjDDJU1zifybKhOAO5L5QKAPM9DkywwIsPqbjJnc5Pk/dSooES
         Mlj2RPqNRMperaBz4U3rMmsF0SVW0AIpU9Eqlcp5gYO6AN7FMBWfE8kSMGJ5WZozjPmb
         GyZA==
X-Gm-Message-State: AKS2vOyu7RosaRRfPTBmcXdkftyaXLeEM9NgOu3bxhvZ84xEV3nKONrI
	J/aXGecESK2MVwKZHfdSf0kdHqiP9g==
X-Received: by 10.28.213.205 with SMTP id m196mr34663502wmg.61.1499298781205;
 Wed, 05 Jul 2017 16:53:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Wed, 5 Jul 2017 16:52:30 -0700 (PDT)
In-Reply-To: <1498830302-19274-2-git-send-email-edgar.iglesias@gmail.com>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com> <1498830302-19274-2-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jul 2017 16:52:30 -0700
Message-ID: <CAKmqyKNwa9UNxMJ0yQjiUa374bD6MY3hO63gSCk7cP_21RFGmg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target-arm: Move the regime_xxx helpers
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vsIwBUetH8MO

On Fri, Jun 30, 2017 at 6:45 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Move the regime_xxx helpers in preparation for future code
> that will reuse them.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/helper.c | 404 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 202 insertions(+), 202 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2594faa..fd1027e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -35,6 +35,208 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>  #define PMCRD   0x8
>  #define PMCRC   0x4
>  #define PMCRE   0x1
> +
> +/* Return the exception level which controls this address translation regime */
> +static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S2NS:
> +    case ARMMMUIdx_S1E2:
> +        return 2;
> +    case ARMMMUIdx_S1E3:
> +        return 3;
> +    case ARMMMUIdx_S1SE0:
> +        return arm_el_is_aa64(env, 3) ? 1 : 3;
> +    case ARMMMUIdx_S1SE1:
> +    case ARMMMUIdx_S1NSE0:
> +    case ARMMMUIdx_S1NSE1:
> +    case ARMMMUIdx_MPriv:
> +    case ARMMMUIdx_MNegPri:
> +    case ARMMMUIdx_MUser:
> +        return 1;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +/* Return true if this address translation regime is secure */
> +static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S12NSE0:
> +    case ARMMMUIdx_S12NSE1:
> +    case ARMMMUIdx_S1NSE0:
> +    case ARMMMUIdx_S1NSE1:
> +    case ARMMMUIdx_S1E2:
> +    case ARMMMUIdx_S2NS:
> +    case ARMMMUIdx_MPriv:
> +    case ARMMMUIdx_MNegPri:
> +    case ARMMMUIdx_MUser:
> +        return false;
> +    case ARMMMUIdx_S1E3:
> +    case ARMMMUIdx_S1SE0:
> +    case ARMMMUIdx_S1SE1:
> +        return true;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +/* Return the SCTLR value which controls this address translation regime */
> +static inline uint32_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
> +}
> +
> +/* Return true if the specified stage of address translation is disabled */
> +static inline bool regime_translation_disabled(CPUARMState *env,
> +                                               ARMMMUIdx mmu_idx)
> +{
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        switch (env->v7m.mpu_ctrl &
> +                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
> +        case R_V7M_MPU_CTRL_ENABLE_MASK:
> +            /* Enabled, but not for HardFault and NMI */
> +            return mmu_idx == ARMMMUIdx_MNegPri;
> +        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
> +            /* Enabled for all cases */
> +            return false;
> +        case 0:
> +        default:
> +            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
> +             * we warned about that in armv7m_nvic.c when the guest set it.
> +             */
> +            return true;
> +        }
> +    }
> +
> +    if (mmu_idx == ARMMMUIdx_S2NS) {
> +        return (env->cp15.hcr_el2 & HCR_VM) == 0;
> +    }
> +    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
> +}
> +
> +static inline bool regime_translation_big_endian(CPUARMState *env,
> +                                                 ARMMMUIdx mmu_idx)
> +{
> +    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
> +}
> +
> +/* Return the TCR controlling this translation regime */
> +static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    if (mmu_idx == ARMMMUIdx_S2NS) {
> +        return &env->cp15.vtcr_el2;
> +    }
> +    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
> +}
> +
> +/* Convert a possible stage1+2 MMU index into the appropriate
> + * stage 1 MMU index
> + */
> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
> +{
> +    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> +        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_S12NSE0);
> +    }
> +    return mmu_idx;
> +}
> +
> +/* Returns TBI0 value for current regime el */
> +uint32_t arm_regime_tbi0(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    TCR *tcr;
> +    uint32_t el;
> +
> +    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
> +     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
> +     */
> +    mmu_idx = stage_1_mmu_idx(mmu_idx);
> +
> +    tcr = regime_tcr(env, mmu_idx);
> +    el = regime_el(env, mmu_idx);
> +
> +    if (el > 1) {
> +        return extract64(tcr->raw_tcr, 20, 1);
> +    } else {
> +        return extract64(tcr->raw_tcr, 37, 1);
> +    }
> +}
> +
> +/* Returns TBI1 value for current regime el */
> +uint32_t arm_regime_tbi1(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    TCR *tcr;
> +    uint32_t el;
> +
> +    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
> +     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
> +     */
> +    mmu_idx = stage_1_mmu_idx(mmu_idx);
> +
> +    tcr = regime_tcr(env, mmu_idx);
> +    el = regime_el(env, mmu_idx);
> +
> +    if (el > 1) {
> +        return 0;
> +    } else {
> +        return extract64(tcr->raw_tcr, 38, 1);
> +    }
> +}
> +
> +/* Return the TTBR associated with this translation regime */
> +static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                                   int ttbrn)
> +{
> +    if (mmu_idx == ARMMMUIdx_S2NS) {
> +        return env->cp15.vttbr_el2;
> +    }
> +    if (ttbrn == 0) {
> +        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
> +    } else {
> +        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
> +    }
> +}
> +
> +/* Return true if the translation regime is using LPAE format page tables */
> +static bool regime_using_lpae_format(CPUARMState *env,
> +                                     ARMMMUIdx mmu_idx)
> +{
> +    int el = regime_el(env, mmu_idx);
> +    if (el == 2 || arm_el_is_aa64(env, el)) {
> +        return true;
> +    }
> +    if (arm_feature(env, ARM_FEATURE_LPAE)
> +        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
> +/* Returns true if the stage 1 translation regime is using LPAE format page
> + * tables. Used when raising alignment exceptions, whose FSR changes depending
> + * on whether the long or short descriptor format is in use. */
> +bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    mmu_idx = stage_1_mmu_idx(mmu_idx);
> +
> +    return regime_using_lpae_format(env, mmu_idx);
> +}
> +
> +static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S1SE0:
> +    case ARMMMUIdx_S1NSE0:
> +    case ARMMMUIdx_MUser:
> +        return true;
> +    default:
> +        return false;
> +    case ARMMMUIdx_S12NSE0:
> +    case ARMMMUIdx_S12NSE1:
> +        g_assert_not_reached();
> +    }
> +}
>  #endif
>
>  static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> @@ -7022,208 +7224,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      }
>  }
>
> -/* Return the exception level which controls this address translation regime */
> -static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    switch (mmu_idx) {
> -    case ARMMMUIdx_S2NS:
> -    case ARMMMUIdx_S1E2:
> -        return 2;
> -    case ARMMMUIdx_S1E3:
> -        return 3;
> -    case ARMMMUIdx_S1SE0:
> -        return arm_el_is_aa64(env, 3) ? 1 : 3;
> -    case ARMMMUIdx_S1SE1:
> -    case ARMMMUIdx_S1NSE0:
> -    case ARMMMUIdx_S1NSE1:
> -    case ARMMMUIdx_MPriv:
> -    case ARMMMUIdx_MNegPri:
> -    case ARMMMUIdx_MUser:
> -        return 1;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
> -/* Return true if this address translation regime is secure */
> -static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    switch (mmu_idx) {
> -    case ARMMMUIdx_S12NSE0:
> -    case ARMMMUIdx_S12NSE1:
> -    case ARMMMUIdx_S1NSE0:
> -    case ARMMMUIdx_S1NSE1:
> -    case ARMMMUIdx_S1E2:
> -    case ARMMMUIdx_S2NS:
> -    case ARMMMUIdx_MPriv:
> -    case ARMMMUIdx_MNegPri:
> -    case ARMMMUIdx_MUser:
> -        return false;
> -    case ARMMMUIdx_S1E3:
> -    case ARMMMUIdx_S1SE0:
> -    case ARMMMUIdx_S1SE1:
> -        return true;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
> -/* Return the SCTLR value which controls this address translation regime */
> -static inline uint32_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
> -}
> -
> -/* Return true if the specified stage of address translation is disabled */
> -static inline bool regime_translation_disabled(CPUARMState *env,
> -                                               ARMMMUIdx mmu_idx)
> -{
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        switch (env->v7m.mpu_ctrl &
> -                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
> -        case R_V7M_MPU_CTRL_ENABLE_MASK:
> -            /* Enabled, but not for HardFault and NMI */
> -            return mmu_idx == ARMMMUIdx_MNegPri;
> -        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
> -            /* Enabled for all cases */
> -            return false;
> -        case 0:
> -        default:
> -            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
> -             * we warned about that in armv7m_nvic.c when the guest set it.
> -             */
> -            return true;
> -        }
> -    }
> -
> -    if (mmu_idx == ARMMMUIdx_S2NS) {
> -        return (env->cp15.hcr_el2 & HCR_VM) == 0;
> -    }
> -    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
> -}
> -
> -static inline bool regime_translation_big_endian(CPUARMState *env,
> -                                                 ARMMMUIdx mmu_idx)
> -{
> -    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
> -}
> -
> -/* Return the TCR controlling this translation regime */
> -static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    if (mmu_idx == ARMMMUIdx_S2NS) {
> -        return &env->cp15.vtcr_el2;
> -    }
> -    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
> -}
> -
> -/* Convert a possible stage1+2 MMU index into the appropriate
> - * stage 1 MMU index
> - */
> -static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
> -{
> -    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> -        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_S12NSE0);
> -    }
> -    return mmu_idx;
> -}
> -
> -/* Returns TBI0 value for current regime el */
> -uint32_t arm_regime_tbi0(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    TCR *tcr;
> -    uint32_t el;
> -
> -    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
> -     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
> -     */
> -    mmu_idx = stage_1_mmu_idx(mmu_idx);
> -
> -    tcr = regime_tcr(env, mmu_idx);
> -    el = regime_el(env, mmu_idx);
> -
> -    if (el > 1) {
> -        return extract64(tcr->raw_tcr, 20, 1);
> -    } else {
> -        return extract64(tcr->raw_tcr, 37, 1);
> -    }
> -}
> -
> -/* Returns TBI1 value for current regime el */
> -uint32_t arm_regime_tbi1(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    TCR *tcr;
> -    uint32_t el;
> -
> -    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
> -     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
> -     */
> -    mmu_idx = stage_1_mmu_idx(mmu_idx);
> -
> -    tcr = regime_tcr(env, mmu_idx);
> -    el = regime_el(env, mmu_idx);
> -
> -    if (el > 1) {
> -        return 0;
> -    } else {
> -        return extract64(tcr->raw_tcr, 38, 1);
> -    }
> -}
> -
> -/* Return the TTBR associated with this translation regime */
> -static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
> -                                   int ttbrn)
> -{
> -    if (mmu_idx == ARMMMUIdx_S2NS) {
> -        return env->cp15.vttbr_el2;
> -    }
> -    if (ttbrn == 0) {
> -        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
> -    } else {
> -        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
> -    }
> -}
> -
> -/* Return true if the translation regime is using LPAE format page tables */
> -static inline bool regime_using_lpae_format(CPUARMState *env,
> -                                            ARMMMUIdx mmu_idx)
> -{
> -    int el = regime_el(env, mmu_idx);
> -    if (el == 2 || arm_el_is_aa64(env, el)) {
> -        return true;
> -    }
> -    if (arm_feature(env, ARM_FEATURE_LPAE)
> -        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
> -        return true;
> -    }
> -    return false;
> -}
> -
> -/* Returns true if the stage 1 translation regime is using LPAE format page
> - * tables. Used when raising alignment exceptions, whose FSR changes depending
> - * on whether the long or short descriptor format is in use. */
> -bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    mmu_idx = stage_1_mmu_idx(mmu_idx);
> -
> -    return regime_using_lpae_format(env, mmu_idx);
> -}
> -
> -static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    switch (mmu_idx) {
> -    case ARMMMUIdx_S1SE0:
> -    case ARMMMUIdx_S1NSE0:
> -    case ARMMMUIdx_MUser:
> -        return true;
> -    default:
> -        return false;
> -    case ARMMMUIdx_S12NSE0:
> -    case ARMMMUIdx_S12NSE1:
> -        g_assert_not_reached();
> -    }
> -}
> -
>  /* Translate section/page access permissions to page
>   * R/W protection flags
>   *
> --
> 2.7.4
>
>
