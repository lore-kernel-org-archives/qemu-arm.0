Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E10ACD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 11:24:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWY5W-0000ho-4d; Mon, 08 Jun 2026 07:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWY5U-0000gv-Jo
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 07:24:12 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWY5S-0007nD-Cb
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 07:24:12 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-660e9ff0587so1671564d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 04:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780917849; cv=none;
 d=google.com; s=arc-20240605;
 b=R/vGKa0lwknV/7j8rxSwBep85bgf29YFZUni4iF+9ozNLfEABR414zmTE/MbyuGWPE
 dJkoIuJZO3n6CKi4CzILKcbaK9tJHRMFLR29dYg2bsGTQETccBGRpZIEMV1ecgrRLcvf
 t0WwgB3RXqLeKKY6a1e904XC+SAHvN2wypyd2VFMHVn2BYjqjzJg4Sp4pdtCZIeTPU4g
 zIbowaeL2MGERhDnfBJHUSkgYhvzmCIxU1Q5b1EgfN7RibRoEfYjK0CUhh1lGZQgaVVy
 LJnfxmrpmoRZ9NR/n3mNbmwZCPiiiV/f2D1dYJMSbhT0PWvJ4Vy5nGL/khV/VgQNN8/M
 qrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=c8O2L2fUkVgHrAoxPRr1mVmkz2Nr7Q7MrmLIszm84pU=;
 fh=oG+53MsbmDmhmmXFFz1mQNyImwWicRcBuUgrcYPHlSg=;
 b=QE1G76TnJDaWm6V4XEnbvKlhWw11+jj1dcUkQ0U6B5OM5h07/uR+PevdX7RbcWeX+F
 jq5CGkUf0YucSmBW+h+HTYrMK3RqG7VDQASrytZy8ri5Juc1/XwnrNRbTm5QDpsMLLqu
 MikuNJzGt62THwSzZTeF9pDdjcE/llsQwtYhyEISY+HUjTfdMUzKALSlczjYbXJxROYU
 8WugWcKXtG/f+pnr1HYCWJ0hWW4lbqCO6Crr/swHj1q5B7B5GMUWxOSnA0G34+vCuhS3
 0wCIzzGSi/F5ryyTv7PLow/uvA7x67t2UHR+Gn0qKqvCvvauSXvMXu+Vw80zUjeX+EAY
 KRmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780917849; x=1781522649; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c8O2L2fUkVgHrAoxPRr1mVmkz2Nr7Q7MrmLIszm84pU=;
 b=qsQH+zIiOYohHmiX27IXlKPQRy0LEI3YDB0fi2JqaeYlZCVXlF0LPO8pzbdUM5bu41
 T9sMtY9uZ5sAma+LSbBeOTB/GePGLd6ipvMftDPdOmvppHbOR5x3meCfsZXyitZ0Kvau
 EqJtylF+YCKm547wugpwUKdNP6knjd6EUB8Fr9xSyPt1WK8/qRZG+44VL3Foz0Uo5YZ9
 02+XZ8bN6HedUvxReQVesO+Zk0wGfijcY1nNSfq0dtlnt1Db6o0k2V3g8+A5HpSFN7IV
 +oWEVzTjxp7SBkznbTd8Z7yJN+lAOOeB3uiIf75ohyFmSJSLpPvARDecTQ+73P901+Db
 Va1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780917849; x=1781522649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8O2L2fUkVgHrAoxPRr1mVmkz2Nr7Q7MrmLIszm84pU=;
 b=luLgTimeUnOGk+OLquzcNdG0HGK4D1Jpmxdf/adTIv3EA9HcgbMJSGsXVs78IsPUhk
 vlvtOFKcxfBwc2o5VNfbusoqVTpc205NjKFHvudxKIln7YIcm8um1nYrdPFkUyeZk6C3
 CmdjIKbVFcy2+cF47/Hr+5DH1mIzaXbLpvOtgBxA741e3FNmrRTc1fyFgHKnGXpEI9zE
 ZMoBO8mXYHxm0Srkgl20yByBiEsPXVnI5X8BL//s4MIwMF5Gm+AU9zh4vzoNcvVkCOhR
 tNWDBGxI/STHniIKPFythwBZKlz/ifX7LqXAEstoyEfnHJJOKd/qjZPPOBoLP3ULecMA
 Kg3A==
X-Gm-Message-State: AOJu0Yw6WYIUkXn7wgioY2IH88VpRz+AB8SZJvvJJd7LFoca51O5X63j
 yoc4rPUoTth7xZHuG4n62g/kcOQ4jbd14s+9v/793/rtsaWWYqtl1TVFkh3+EbkLIbuJ9OsPl0z
 pSljBsswrD8LHgdfT0h4SUmV2WEtYXMVMGnYgXHEFwQ==
X-Gm-Gg: Acq92OGu6cWP0/iKc20fpjZw6VgHjAQlfW5LNKPv8wxPoyyRBmcgV2KyG177Kmpg0Et
 SptBZOSFpRvf8IghwCKNhcvN1e+cUqsElXTinpYP6Bm6Vcn4LKinMi5JtR+/AlhKRnO3ClUySG+
 v6RTF299JC7aeE5mlpUbxoO4kcgWOdOYRMrmY2Ri7auYGyNzzOqQ7dNYilx8VLyTZ0//H6I89vS
 0XdfEVe6rax4/J4uI2EQApZpxNoK9IZTDZdtws1zqBdYjynWL07yBPFxNz5SWwVNDNFZKZlb46K
 y/5fcwg/ijz4gaHbvE54iX1tFVSZ5ks0kz+QIdLN/uBshtn/AQ2BaTbW6ouHiXUTq8jsamyfc2H
 p8w==
X-Received: by 2002:a05:690e:bc8:b0:661:1307:3d48 with SMTP id
 956f58d0204a3-661130740c1mr10639258d50.23.1780917848457; Mon, 08 Jun 2026
 04:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260605035012.2876664-1-kylefoxaustin.github@gmail.com>
In-Reply-To: <20260605035012.2876664-1-kylefoxaustin.github@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 12:23:57 +0100
X-Gm-Features: AVVi8Cf1YcfRehQFXbdyBu7dAdzHEoCPFxNgwnUWRXjKhCAxpUoC7Fe1mwSc-ck
Message-ID: <CAFEAcA_JpBaHDucOfvc9NYkQhQBu0Py9hULTNcXajUo9gW6VGw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honour CCR.BFHFNMIGN for probed data BusFaults
To: Kyle Fox <kylefoxaustin.github@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 5 Jun 2026 at 04:50, Kyle Fox <kylefoxaustin.github@gmail.com> wrote:
>
> M-profile CCR.BFHFNMIGN lets software executing at a negative execution
> priority (in HardFault/NMI, or with FAULTMASK set) suppress precise data
> BusFaults caused by load/store instructions: the access completes
> returning UNKNOWN data, the fault status is recorded in BFSR/BFAR, but no
> BusFault exception is taken. Software uses this to probe for the presence
> of a device.
>
> QEMU stored CCR.BFHFNMIGN but never consumed it: arm_cpu_do_transaction_
> failed() always raised the external abort, which arm_v7m_cpu_do_interrupt()
> pended as a BusFault and then escalated to a HardFault it could not take at
> priority -1, aborting the VM with "Lockup: can't escalate 3 to HardFault".
>
> Honour the bit in arm_cpu_do_transaction_failed(): when the access is a
> data access from M-profile code at negative priority with BFHFNMIGN set,
> record PRECISERR/BFARVALID and BFAR and return without raising, so the
> faulting instruction completes instead of re-faulting forever. Instruction
> fetches are unaffected, since BFHFNMIGN applies only to data accesses.
>
> This surfaced running the real NXP i.MX 95 System Manager firmware on the
> emulated Cortex-M33: its SystemMemoryProbe() (set BFHFNMIGN + FAULTMASK,
> do the access, test CFSR.BFARVALID) locked up the VM. With this change the
> SM's debug-monitor memory-probe commands run and recover correctly.
>
> Signed-off-by: Kyle Fox <kylefoxaustin.github@gmail.com>
> ---
> Found while bringing up an out-of-tree i.MX 95 machine running the real NXP
> System Manager firmware on the emulated Cortex-M33; the change is generic to
> any ARMv7-M guest that probes for devices via BusFault suppression. It is
> independent of (and posted alongside) a separate PMSAv7 MPU align-down fix
> from the same bring-up.
>
> The new path only runs for an M-profile data access at negative priority with
> CCR.BFHFNMIGN set - the previously-broken case that aborted the VM. Normal
> BusFaults (no BFHFNMIGN, or at non-negative priority) and instruction fetches
> are unchanged.
>
> Tested on master: qemu-system-arm builds clean, and the ARMv7-M / MPS2 qtests
> pass with no regression -- boot-serial (incl. stm32vldiscovery, Cortex-M3),
> the stm32l4x5 suite (Cortex-M4: exti/gpio/rcc/syscfg/usart), microbit,
> sse-timer and cmsdk-apb-watchdog.
>
>  target/arm/tcg/tlb_helper.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> index f90765cb59..cbef9cb03e 100644
> --- a/target/arm/tcg/tlb_helper.c
> +++ b/target/arm/tcg/tlb_helper.c
> @@ -10,6 +10,7 @@
>  #include "helper.h"
>  #include "internals.h"
>  #include "cpu-features.h"
> +#include "hw/intc/armv7m_nvic.h"
>
>  /*
>   * Returns true if the stage 1 translation regime is using LPAE format page
> @@ -318,8 +319,31 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                     MemTxResult response, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
>      ARMMMUFaultInfo fi = {};
>
> +    /*
> +     * For M-profile, CCR.BFHFNMIGN lets software executing at a negative
> +     * priority (in HardFault/NMI, or with FAULTMASK set) suppress precise
> +     * data BusFaults from load/store instructions: the access completes
> +     * returning UNKNOWN data (the store is dropped), the fault status is
> +     * recorded in BFSR/BFAR, but no BusFault exception is taken. This is
> +     * the mechanism software uses to probe for the presence of a device
> +     * (e.g. the NXP System Manager's SystemMemoryProbe). Honour it by
> +     * recording the status and returning without raising, so the faulting
> +     * instruction completes rather than re-faulting forever. BFHFNMIGN
> +     * applies only to data accesses, so instruction fetches are unaffected.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_M) &&
> +        access_type != MMU_INST_FETCH &&
> +        (env->v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK) &&
> +        armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
> +        env->v7m.cfsr[M_REG_NS] |=
> +            (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
> +        env->v7m.bfar = addr;
> +        return;
> +    }

Thanks for this patch. This looks good, but it misses a very
obscure corner case, which is the load of the word from the stack
performed by the SG instruction. In the pseudocode that is an
AccType_NORMAL access, so it should honour BFHFNMIGN. In QEMU
we (for complicated reasons) implement that load manually in
v7m_read_sg_stack_word(), so it doesn't go through the TCG TLB
and this transaction_failed hook. So v7m_read_sg_stack_word()
should check BFHFNMIGN to see if it should pend the ARMV7M_EXCP_BUS.

The other places where we manually pend EXCP_BUS are all ones
which should not or are not required to honour BFHFNMIGN
(vector table loads, stacking and unstacking, which are
AccType_VECTABLE, AccType_STACK, AccType_UNSTACK).

thanks
-- PMM

