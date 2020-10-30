Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1601399lfa;
        Fri, 30 Oct 2020 07:45:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSxwNhcujkf4ltvXidty44r+oQTJbtxLTUPpShVCzj1MPy7ZQklvuNYXS0nWCZoPqNsG5C
X-Received: by 2002:a67:ed48:: with SMTP id m8mr7698890vsp.47.1604069118695;
        Fri, 30 Oct 2020 07:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604069118; cv=none;
        d=google.com; s=arc-20160816;
        b=TcPRBH1B7TjaspkSJY45A8ODg61j/6HfXBijFDgE8DPPE5rPAHDIQciMYrwQcOhWvh
         +PrlOv1AP1nK0VXd0dgSE10mB+qTZSFbEJudfaeiRczIaAMFDuwea10e2j5BXVRELkvZ
         z/v4B5ojCTSzAsYE+5EEwDw//bxSErh3oMJ7nSC4vkVKbBn2uCka99GpKgVR8DzsEznq
         zS3cL376gDGDW0wptWaj1s19J9OSRatSUrNQN9px3DBauTDgemoWMu2Yz4aUZt1zR3wp
         zZ/lAe6w9paYI/vhwVgnd62YgfsAJOuL6HVRkwEqvTdJvrz2YM8jRpMHMpVx+Ohd1Onu
         4pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivI4Ncp5Qg6ZNoGJ1oMnyqt4jaqTVo68mwPVvnV0TSk=;
        b=pyjlXP5m5FgCBcZgTHp+5uDrfJKTpv7jIFdIBpUykG8f+wVnBVb0S3eyeitjskJG0l
         XKb6jTs6YCJD54IyXOLWR0Ban1gz3lEqK5zPbdiXQns8c2Y8TSsemHb8TE9Nk4QRaY2z
         Uhg6mf+bc5wahRDuOVuKC3pjzGZlvj9gO6FXMudWvYoFlUa7TgYSJqJ9CgCrSrj/HQpo
         JglU4EQFHWZULjr9NPyhX5oOYRcGcMvGvxyMhx+0sCcBLVaw6ianqWQpo5acFxisxfXS
         ZSxCVGYmFdlwutTbetAOu1Fps+8+mQ9GhqwGmU9CJgM/dGgL1as4z/RQVoPWpYL1j0T3
         fwNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lKJSVKy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 76si247992uae.244.2020.10.30.07.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lKJSVKy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVeX-0000Ry-La
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVdt-0000Rl-Ii
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:44:38 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVdr-00037q-7c
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:44:37 -0400
Received: by mail-pg1-x543.google.com with SMTP id o3so5370444pgr.11
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivI4Ncp5Qg6ZNoGJ1oMnyqt4jaqTVo68mwPVvnV0TSk=;
 b=lKJSVKy/xse1T3X28X1pj4zxjrFvSwpBEb7/o4lXErGCLg793xFmAEwKtR65O7vK5A
 8qM3+NLpqt6iN9vjc457nEMwrB4F7du6IbyEn54fnyeZYJKONcYp3wESHoF8AM95EiQm
 G1sxZy5FuqlC/rBGyToS+NRgMOR2bBXGG3ep6XAQ6YeICtWiwv4ngftdkilBqHjcKNoc
 PLAslERG042V2tv6yEJX05qF/tf6NYsJbwN1UYkOSTTg4SCfIXYPPM3bUNU3KQYGNX9x
 IG/BgquYa2u4Z1YKB7xvBKDMKSnLgTeVbahZtcxvX/iwi711pQFaNUWRBHkqlBkTI6jp
 n4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivI4Ncp5Qg6ZNoGJ1oMnyqt4jaqTVo68mwPVvnV0TSk=;
 b=tw1XVlZjF/Ra7XR31YYsKbr62mCSp9BdDmR3pZjlSCBJCl8xpSoq3wFRlEESmFhppZ
 cmYG8DKgO/e2xXYVFHEguiqn+rqipMcKCRb2Wur8CG1WOEFKctwHsEF6Zi9JZhGjKOIC
 5F8YEjJkgx21y+i0CzdIZVN0ags/ksWT77joJDNuNqqUGAcD6V2OdlvJ+nZN3VPG31GV
 qEwSz/eB6G7Qf94JoGqqkURtacO6l7X+e4ZivuWc67tKxrlJ5pMQwgHWppNlbLW56x1D
 PXwh3n79d6GXg7Mzketw6QSQDRPp98plPkxoWxtUSjMl+KefmNgFRoBBsJNhHmVmepUB
 kldw==
X-Gm-Message-State: AOAM531E2EwwbpcTYp7O8uZoUsZYrCQAKXl6I7wKTLRYgBgV+uO3NmR2
 tTTHQVnpenH81gvd6EeivriZttNI4+1mNxdMHTwiuSAmSRY=
X-Received: by 2002:a63:e453:: with SMTP id i19mr2306203pgk.397.1604069072140; 
 Fri, 30 Oct 2020 07:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201009153904.28529-1-peter.maydell@linaro.org>
In-Reply-To: <20201009153904.28529-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:44:20 +0000
Message-ID: <CAFEAcA_LBy7kx2uP_uRzyv8jbob3uR5RVDMTtPAYwwdAKuDx7Q@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Make GIC maintenance interrupts
 work
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jose Martins <josemartins90@gmail.com>, Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S+VQstIyPbT2

Ping for code review, please?

thanks
-- PMM

On Fri, 9 Oct 2020 at 16:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In gicv3_init_cpuif() we copy the ARMCPU gicv3_maintenance_interrupt
> into the GICv3CPUState struct's maintenance_irq field.  This will
> only work if the board happens to have already wired up the CPU
> maintenance IRQ before the GIC was realized.  Unfortunately this is
> not the case for the 'virt' board, and so the value that gets copied
> is NULL (since a qemu_irq is really a pointer to an IRQState struct
> under the hood).  The effect is that the CPU interface code never
> actually raises the maintenance interrupt line.
>
> Instead, since the GICv3CPUState has a pointer to the CPUState, make
> the dereference at the point where we want to raise the interrupt, to
> avoid an implicit requirement on board code to wire things up in a
> particular order.
>
> Reported-by: Jose Martins <josemartins90@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>
> QEMU's implementation here is a bit odd because we've put all the
> logic into the "GIC" device where in real hardware it's split between
> a GIC device and the CPU interface part in the CPU.  If we had
> arranged it in that way then we wouldn't have this odd bit of code
> where the GIC device needs to raise an IRQ line that belongs to the
> CPU.
>
> Not sure why we've never noticed this bug previously with KVM as a
> guest, you'd think we'd have spotted "maintenance interrupts just
> don't work"...
> ---
>  include/hw/intc/arm_gicv3_common.h | 1 -
>  hw/intc/arm_gicv3_cpuif.c          | 5 ++---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 0331b0ffdb8..91491a2f664 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -153,7 +153,6 @@ struct GICv3CPUState {
>      qemu_irq parent_fiq;
>      qemu_irq parent_virq;
>      qemu_irq parent_vfiq;
> -    qemu_irq maintenance_irq;
>
>      /* Redistributor */
>      uint32_t level;                  /* Current IRQ level */
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 08e000e33c6..43ef1d7a840 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -399,6 +399,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
>      int irqlevel = 0;
>      int fiqlevel = 0;
>      int maintlevel = 0;
> +    ARMCPU *cpu = ARM_CPU(cs->cpu);
>
>      idx = hppvi_index(cs);
>      trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
> @@ -424,7 +425,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
>
>      qemu_set_irq(cs->parent_vfiq, fiqlevel);
>      qemu_set_irq(cs->parent_virq, irqlevel);
> -    qemu_set_irq(cs->maintenance_irq, maintlevel);
> +    qemu_set_irq(cpu->gicv3_maintenance_interrupt, maintlevel);
>  }
>
>  static uint64_t icv_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
> @@ -2624,8 +2625,6 @@ void gicv3_init_cpuif(GICv3State *s)
>              && cpu->gic_num_lrs) {
>              int j;
>
> -            cs->maintenance_irq = cpu->gicv3_maintenance_interrupt;
> -
>              cs->num_list_regs = cpu->gic_num_lrs;
>              cs->vpribits = cpu->gic_vpribits;
>              cs->vprebits = cpu->gic_vprebits;
> --
> 2.20.1
>
