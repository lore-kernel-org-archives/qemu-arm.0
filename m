Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4060320ejv;
        Tue, 2 Apr 2024 09:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVMOFESOqc/UPk7U4hUPhznUCpSXW6ONBeULUc98CEHDAe4MXIVIHUe9v62Itss+xJZTC8vGILOSc/1alT25jQD6/K5OPJ
X-Google-Smtp-Source: AGHT+IGuM1mjMoI8JNLF0X7OZXMHVv54ce5kNIKq59S5LHrZlfspDx+BOZaVzlf0iMAfkHSbcEFa
X-Received: by 2002:a05:6214:584a:b0:699:211f:91b0 with SMTP id ml10-20020a056214584a00b00699211f91b0mr156184qvb.23.1712074393817;
        Tue, 02 Apr 2024 09:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074393; cv=none;
        d=google.com; s=arc-20160816;
        b=IBrWFKUfs1LTislUSd03/lLI5rArY6vp96J4ODKbzp6+upX5aEmYSdnxF9D8s6lzOG
         HoIfEIJXa9fnUi/6fBdGtJ6Y0yYE09W0glLG6K4bFXJo4mwabmaeGCmcFf2ubzs/hI9A
         BcF0aDzRV4V1izjUT0PhOx5tamlfT+vp0JZ/7UWI+Cs+X92mJ3KqF73s4MWiFnLTI3fY
         lwxMixMgsZ2k8F6JR0/tNgh4IYGHwYPsjxxkpG6b6Kp2e+5XII7aSfMFUQkdYDPnRcN/
         Vc4UPpKThh4Eo52VKMwLJWL0fQA9iWGQ6+/jR1Qfb+7DGf02+yUr9DxkvgYGvJvG2aMB
         HzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mR1V0/zEsySgAaqO9ZlwAJcYsqYfWiHjKNHYQBPhS7I=;
        fh=MFDsK94Wvl5TAcmCU0o7UzTLmjlVsS5fUDVtnBh1E+g=;
        b=Z0zg8cuR9yFTWwbpaDsSEcdW1BZH2pZ9cEIpJCnX8/QXy1sYAfQ538OCPbgkSyDfg3
         P+2Q0Z4fsew32uzb/H8MAZD90WrIlIl87cxbQA3muqYELjTyCtLcABnqc6yrmpOUGtSR
         +99CUbdBmV0XKxyK/ue4mVcHoqoS++/sGUobxS92oh7X/uqzoSQ1fAqiDw8eiF+ag6mD
         shYSRgWb9Oeb7lgdTCgelTzCF8ilFQBHOBpgMd1SUC9LsEyAVvDb9fH61v3URMva5rPg
         An6GGpExKLs+J0dQGfwWeA65O2M+cmXGfoEA98MfjjszNTOoMKI/Muhh+aMUUrX3JjTL
         Oa7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HbH/mDQQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020ad44d41000000b006967ff1677dsi12402275qvm.448.2024.04.02.09.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HbH/mDQQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrgky-0002ie-FJ; Tue, 02 Apr 2024 12:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgkr-0002Xv-OQ
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:12:59 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgkp-00006e-HE
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:12:57 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso6576870a12.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074373; x=1712679173; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mR1V0/zEsySgAaqO9ZlwAJcYsqYfWiHjKNHYQBPhS7I=;
 b=HbH/mDQQD2Bj+e8fHO5NbosDzmpQiHkddsWoQnayiJtW3MsUrOPyUQG6RGJUDb3viG
 MrHmyJUVocZT4Xd8IlkubBlnIjphHVJDjDzJe4ZsA2SwYRC2wAFoq9o+2Nh4gqaAKLsW
 +CxK6KxCAAPls9aQ18JrFM6BUIsVGQ9rMrZPdmHdtJBzhKAXPTIZo8r8yTCYLNqKFOH2
 3uPJ91IRpcN7y/i3B3MV7GNuQm+Ucoz9FmBxI3oLkIc3CQghqNT3O23rL7vAEktud5UE
 QhEtV30XiFiF2pfnNimR7pzp4ZMtMFLl4Lyw7MPZnO7HqsCeZVGYZCJwVU+UIftX+obG
 k2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074373; x=1712679173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mR1V0/zEsySgAaqO9ZlwAJcYsqYfWiHjKNHYQBPhS7I=;
 b=JWPfiXaXM+L4uaD4WYZNGQoZP45LZHC0knRdH7+OseGi+RCyjHc3NEkmh1t1d/j10C
 IeUwxyBDeUD3Mplcpk5yA7tSxDFGc8VttZwpVzo/TpbhS51+6JmuNPezapEc3H3e/fKa
 kdqbD/guMlcc/ePIVAJb0wjID+jqNmv5CU9bwuFSscg7NMzLoKCn7pIlUgTc7Lkxv+x7
 HEFir3Wrs538fItkHvkfM/S1ynitA8/V4oy/cHtQGajrTFpGq1URPpk3CnCXnxeN4VrA
 b5EG9SgtwyfeZTWgphHjzb9XlDRiPSDnPf1zydyOfdY9mJnx0mPW32Lhb+/R1jTSm5zz
 9tPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu1M4FhRlYN+UR8g1UeNg7oCvo5SMyu6rBS4SrttB4Qznsd3TPTm1L/LhXoaWq4BE7Pvnhb7yR5sbrahpNWVF3cNdN
X-Gm-Message-State: AOJu0Ywu4qIvgJBtA+M/da9Ug9ZH9VRWRgmKgJK1S5fGQiQradTR43dW
 Z7+8KeJCCSuzpB4XNZrNqVi19YbxSyqGD2Z77pkUHxB3MZ8H2CddVPujB1lkH6FRHCwpQuDs21C
 vgMZz8rhKP3SxKHfD9wvuMCTlZ2DQsTsJn/4mQg==
X-Received: by 2002:a50:9b1b:0:b0:56d:b7d6:d659 with SMTP id
 o27-20020a509b1b000000b0056db7d6d659mr7128958edi.6.1712074373461; Tue, 02 Apr
 2024 09:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-19-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-19-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:12:42 +0100
Message-ID: <CAFEAcA_WY04voee07n6Ph606xqy=QvTkYdMyqYf5LMHUS5GcDw@mail.gmail.com>
Subject: Re: [PATCH v11 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: SEM3s+eCkp+U

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Implement icv_nmiar1_read() for icc_nmiar1_read(), so add definition for
> ICH_LR_EL2.NMI and ICH_AP1R_EL2.NMI bit.
>
> If FEAT_GICv3_NMI is supported, ich_ap_write() should consider ICV_AP1R_EL1.NMI
> bit. In icv_activate_irq() and icv_eoir_write(), the ICV_AP1R_EL1.NMI bit
> should be set or clear according to the Non-maskable property. And the RPR
> priority should also update the NMI bit according to the APR priority NMI bit.
>
> By the way, add gicv3_icv_nmiar1_read trace event.
>
> If the hpp irq is a NMI, the icv iar read should return 1022 and trap for
> NMI again
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v11:
> - Deal with NMI in the callers instead of ich_highest_active_virt_prio().
> - Set either NMI or a group-priority bit, not both.
> - Only set AP NMI bits in the 0 reg.
> - Handle NMI in hppvi_index(), icv_hppi_can_preempt() and icv_eoir_write().
> v10:
> - Rename ICH_AP1R_EL2_NMI to ICV_AP1R_EL1_NMI.
> - Add ICV_RPR_EL1_NMI definition.
> - Set ICV_RPR_EL1.NMI according to the ICV_AP1R<n>_EL1.NMI in
>   ich_highest_active_virt_prio().
> v9:
> - Correct the INTID_NMI logic.
> v8:
> - Fix an unexpected interrupt bug when sending VNMI by running qemu VM.
> v7:
> - Add Reviewed-by.
> v6:
> - Implement icv_nmiar1_read().
> ---
>  hw/intc/arm_gicv3_cpuif.c | 97 ++++++++++++++++++++++++++++++++++-----
>  hw/intc/gicv3_internal.h  |  4 ++
>  hw/intc/trace-events      |  1 +
>  3 files changed, 91 insertions(+), 11 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index f99f2570a6..a7bc44b30c 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -157,6 +157,10 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
>      int i;
>      int aprmax = ich_num_aprs(cs);
>
> +    if (cs->gic->nmi_support && cs->ich_apr[GICV3_G1NS][0] & ICV_AP1R_EL1_NMI) {
> +        return 0x80;

This should be 0, not 0x80 -- see the register description for
ICH_LR<n>_EL2 Priority field: when NMI is 1, the virtual interrupt's
priority is treated as 0x0.

> +    }
> +
>      for (i = 0; i < aprmax; i++) {
>          uint32_t apr = cs->ich_apr[GICV3_G0][i] |
>              cs->ich_apr[GICV3_G1NS][i];
> @@ -191,6 +195,7 @@ static int hppvi_index(GICv3CPUState *cs)
>       * correct behaviour.
>       */
>      int prio = 0xff;
> +    bool nmi = false;
>
>      if (!(cs->ich_vmcr_el2 & (ICH_VMCR_EL2_VENG0 | ICH_VMCR_EL2_VENG1))) {
>          /* Both groups disabled, definitely nothing to do */
> @@ -200,6 +205,11 @@ static int hppvi_index(GICv3CPUState *cs)
>      for (i = 0; i < cs->num_list_regs; i++) {
>          uint64_t lr = cs->ich_lr_el2[i];
>          int thisprio;
> +        bool thisnmi = false;
> +
> +        if (cs->gic->nmi_support) {
> +            thisnmi = lr & ICH_LR_EL2_NMI;
> +        }

You could write this a little more concisely as
      bool thisnmi = cs->gic_nmi_support && (lr & ICH_LR_EL2_NMI);

>          if (ich_lr_state(lr) != ICH_LR_EL2_STATE_PENDING) {
>              /* Not Pending */
> @@ -219,9 +229,13 @@ static int hppvi_index(GICv3CPUState *cs)
>
>          thisprio = ich_lr_prio(lr);
>
> -        if (thisprio < prio) {
> +        if ((thisprio < prio) || ((thisprio == prio) && (thisnmi & (!nmi)))) {
>              prio = thisprio;
>              idx = i;
> +
> +            if (cs->gic->nmi_support) {
> +                nmi = thisnmi;
> +            }

You don't need to check nmi_support here because if nmi_support
is false then thisnmi will also be false, and so we will never
set nmi to anything other than false.

>          }
>      }
>
> @@ -326,6 +340,12 @@ static bool icv_hppi_can_preempt(GICv3CPUState *cs, uint64_t lr)
>          return true;
>      }
>
> +    if ((prio & mask) == (rprio & mask) &&
> +        cs->gic->nmi_support && (lr & ICH_LR_EL2_NMI) &&
> +        (!(cs->ich_apr[GICV3_G1NS][0] & ICV_AP1R_EL1_NMI))) {
> +        return true;
> +    }
> +
>      return false;
>  }

This isn't the only change needed to icv_hppi_can_preempt():
virtual NMIs are never masked by the MPR, so that check also
must be changed. If we pull out a variable:

    bool is_nmi = cs->gic->nmi_support && (lr & ICH_LR_EL2_NMI);

we can use that both to gate the vpmr check:

    if (!is_nmi && prio >= vpmr) {

and also in the priority check you have here.

> @@ -736,13 +765,19 @@ static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp)
>       */
>      uint32_t mask = icv_gprio_mask(cs, grp);
>      int prio = ich_lr_prio(cs->ich_lr_el2[idx]) & mask;
> +    bool nmi = cs->ich_lr_el2[idx] & ICH_LR_EL2_NMI;
>      int aprbit = prio >> (8 - cs->vprebits);
>      int regno = aprbit / 32;
>      int regbit = aprbit % 32;
>
>      cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
>      cs->ich_lr_el2[idx] |= ICH_LR_EL2_STATE_ACTIVE_BIT;
> -    cs->ich_apr[grp][regno] |= (1 << regbit);
> +
> +    if (cs->gic->nmi_support && nmi) {
> +        cs->ich_apr[grp][regno] |= ICV_AP1R_EL1_NMI;
> +    } else {
> +        cs->ich_apr[grp][regno] |= (1 << regbit);
> +    }
>  }
>
>  static void icv_activate_vlpi(GICv3CPUState *cs)
> @@ -776,7 +811,11 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
>              intid = ich_lr_vintid(lr);
>              if (!gicv3_intid_is_special(intid)) {
> -                icv_activate_irq(cs, idx, grp);
> +                if (!(lr & ICH_LR_EL2_NMI)) {

This is missing checks on both whether the GIC has NMI support and
on whether the SCTLR NMI bit is set (compare pseudocode
VirtualReadIAR1()). I suggest defining a

        bool nmi = cs->gic->nmi_support &&
            (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_NMI) &&
            (lr & ICH_LR_EL2_NMI);

and then you can check "if (!nmi)" here.

> +                    icv_activate_irq(cs, idx, grp);
> +                } else {
> +                    intid = INTID_NMI;
> +                }
>              } else {
>                  /* Interrupt goes from Pending to Invalid */
>                  cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
> @@ -797,8 +836,32 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>
>  static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> -    /* todo */
> +    GICv3CPUState *cs = icc_cs_from_env(env);
> +    int idx = hppvi_index(cs);
>      uint64_t intid = INTID_SPURIOUS;
> +
> +    if (idx >= 0 && idx != HPPVI_INDEX_VLPI) {
> +        uint64_t lr = cs->ich_lr_el2[idx];
> +        int thisgrp = (lr & ICH_LR_EL2_GROUP) ? GICV3_G1NS : GICV3_G0;
> +
> +        if ((thisgrp == GICV3_G1NS) && (lr & ICH_LR_EL2_NMI)) {
> +            intid = ich_lr_vintid(lr);
> +            if (!gicv3_intid_is_special(intid)) {
> +                icv_activate_irq(cs, idx, GICV3_G1NS);
> +            } else {
> +                /* Interrupt goes from Pending to Invalid */
> +                cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
> +                /* We will now return the (bogus) ID from the list register,
> +                 * as per the pseudocode.
> +                 */

QEMU's coding style wants the /* on a line of its own for a
multiline comment.

> +            }
> +        }
> +    }
> +
> +    trace_gicv3_icv_nmiar1_read(gicv3_redist_affid(cs), intid);
> +
> +    gicv3_cpuif_virt_update(cs);
> +
>      return intid;
>  }

> @@ -1504,6 +1573,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      int irq = value & 0xffffff;
>      int grp = ri->crm == 8 ? GICV3_G0 : GICV3_G1NS;
>      int idx, dropprio;
> +    bool nmi = false;
>
>      trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
> @@ -1516,8 +1586,8 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       * error checks" (because that lets us avoid scanning the AP
>       * registers twice).
>       */
> -    dropprio = icv_drop_prio(cs);
> -    if (dropprio == 0xff) {
> +    dropprio = icv_drop_prio(cs, &nmi);
> +    if (dropprio == 0xff && !nmi) {
>          /* No active interrupt. It is CONSTRAINED UNPREDICTABLE
>           * whether the list registers are checked in this
>           * situation; we choose not to.
> @@ -1539,8 +1609,9 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          uint64_t lr = cs->ich_lr_el2[idx];
>          int thisgrp = (lr & ICH_LR_EL2_GROUP) ? GICV3_G1NS : GICV3_G0;
>          int lr_gprio = ich_lr_prio(lr) & icv_gprio_mask(cs, grp);
> +        int thisnmi = lr & ICH_LR_EL2_NMI;

This variable should be "bool". An "int" is 32 bits, so because
ICH_LR_EL2_NMI is bit 59, the value of "lr & ICH_LR_EL2_NMI" when
cast to int is always zero. Using bool avoids this bug and also
is consistent with the type we used for the 'nmi' variable we're
about to compare it with.

> -        if (thisgrp == grp && lr_gprio == dropprio) {
> +        if (thisgrp == grp && (lr_gprio == dropprio || thisnmi == nmi)) {
>              if (!icv_eoi_split(env, cs) || irq >= GICV3_LPI_INTID_START) {
>                  /*
>                   * Priority drop and deactivate not split: deactivate irq now.
> @@ -2626,7 +2697,11 @@ static void ich_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
>
>      trace_gicv3_ich_ap_write(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
>
> -    cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
> +    if (cs->gic->nmi_support) {
> +        cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICV_AP1R_EL1_NMI);
> +    } else {
> +        cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
> +    }
>      gicv3_cpuif_virt_irq_fiq_update(cs);
>  }

thanks
-- PMM
