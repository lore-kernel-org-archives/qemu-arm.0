Received: by 10.25.77.65 with SMTP id a62csp2206628lfb;
        Tue, 7 Feb 2017 06:52:04 -0800 (PST)
X-Received: by 10.55.207.197 with SMTP id v66mr14629043qkl.116.1486479124293;
        Tue, 07 Feb 2017 06:52:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si3109890qkc.130.2017.02.07.06.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 06:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cb77h-00067P-JH
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 09:52:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb75o-000574-CN
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:50:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb75n-0002WQ-BE
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:50:04 -0500
Received: from mail-wj0-x232.google.com ([2a00:1450:400c:c01::232]:34829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cb75n-0002Vr-3H
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:50:03 -0500
Received: by mail-wj0-x232.google.com with SMTP id b20so4673227wjs.2
	for <qemu-devel@nongnu.org>; Tue, 07 Feb 2017 06:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T59gFePC4+mRQV9LRgGhBiMTlCUX9mfVgc4ZAU+WxBI=;
	b=KZ9ZH8crxopg/5I3f+B+4wYIian+KTgdSvyByaD7rSTL4ZFcXr6zGGQU8/1kwxyKaU
	ZFGgBQCBi9m64lflpdl7GcGuxEMr94Qrmk79eh5nphloB8XA5h/ZUhvLvNzUX44T7WQS
	MvusiIFKToROr6rsbkfN+SoOMNhF1g+lE/TTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T59gFePC4+mRQV9LRgGhBiMTlCUX9mfVgc4ZAU+WxBI=;
	b=oCPH+IPdv+cn5zfk10WJzzbyiLupifNlGoDc8ICMgugvOgVKUhYLmszB/f35V7rp1O
	0IyHbNioVIZv7d7dtGDYbLNUF09wRZwEFnPjROE4SJj51X502gvq1FIE3ZSP/Krwdpe/
	kndE5uctwqPKd5dGi1r4XtCVSyLC/HgTAMtX+o8GXDfPwkJRtSTEUgyO2wFgxIuFvAyy
	UdW6Q5KJw8XlAG8Y4LfjXl4ZO+WwbC6cs+2glllltFRmS2Df8wCU2CEp9o3y+TJiFe5B
	kZi0SOru3I3h8s5a2rv5We5f0zfIyTTbK1VAtU0rlwlG/V3NQ+x7isk42KXuxY0gUMht
	gRxg==
X-Gm-Message-State: AIkVDXIntD1Up4OP+IoFM95w1Mq2hLv3eEolW1qD4vCQ7HpbMmle6/1G6S9yf/YPjn4uOMOrLnMXVjal2NdrcWTP
X-Received: by 10.223.136.152 with SMTP id f24mr13968646wrf.187.1486479001845; 
	Tue, 07 Feb 2017 06:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 06:49:41 -0800 (PST)
In-Reply-To: <1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 14:49:41 +0000
Message-ID: <CAFEAcA-7PE_T7BsV=vSCEkQDeekB9KnX33Ou5NiUec4XeUu+zw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::232
Subject: Re: [Qemu-devel] [PATCH v7 RESEND 5/5] hw/intc/arm_gicv3_kvm: Reset
 GICv3 cpu interface registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A//micp/+W1D

On 31 January 2017 at 16:23,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Reset CPU interface registers of GICv3 when CPU is reset.
> For this, ARMCPRegInfo struct is registered with one ICC
> register whose resetfn is called when cpu is reset.
>
> All the ICC registers are reset under one single register
> reset function instead of calling resetfn for each ICC
> register.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index f91e0ac..c3f38aa 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -604,6 +604,39 @@ static void kvm_arm_gicv3_get(GICv3State *s)
>      }
>  }
>
> +static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    ARMCPU *cpu;
> +    GICv3State *s;
> +    GICv3CPUState *c;
> +
> +    c = (GICv3CPUState *)env->gicv3state;
> +    if (!c || !c->cpu || !c->gic) {

We should assert this kind of thing, not just silently do nothing.
Or just assume it's true, because if it's not then we'll segfault
immediately below which is just as clear an indication of where
the bug is as asserting.

> +        return;
> +    }
> +
> +    s = c->gic;
> +    if (!s) {

You've already checked this once.

> +        return;
> +    }
> +
> +    cpu = ARM_CPU(c->cpu);
> +    /* Initialize to actual HW supported configuration */
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
> +                      &c->icc_ctlr_el1[GICV3_NS], false);
> +
> +    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
> +    c->icc_pmr_el1 = 0;
> +    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
> +    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
> +    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
> +
> +    c->icc_sre_el1 = 0x7;
> +    memset(c->icc_apr, 0, sizeof(c->icc_apr));
> +    memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
> +}
> +
>  static void kvm_arm_gicv3_reset(DeviceState *dev)
>  {
>      GICv3State *s = ARM_GICV3_COMMON(dev);
> @@ -621,6 +654,41 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
>      kvm_arm_gicv3_put(s);
>  }
>
> +static uint64_t icc_cp_reg_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return 0;
> +}
> +
> +static void icc_cp_reg_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    return;
> +}

If you want to do nothing in a read/write function there are
already arm_cp_read_zero and arm_cp_write_ignore functions for
this. But using the ARM_CP_NOP flag is better still.

> +
> +/*
> + * CPU interface registers of GIC needs to be reset on CPU reset.
> + * For the calling arm_gicv3_icc_reset() on CPU reset, we register
> + * below ARMCPRegInfo. As we reset the whole cpu interface under single
> + * register reset, we define only one register of CPU interface instead
> + * of defining all the registers.
> + */
> +static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
> +    { .name = "ICC_CTLR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 4,
> +      .type = ARM_CP_NO_RAW,
> +      .access = PL1_RW,
> +      .readfn = icc_cp_reg_read,
> +      .writefn = icc_cp_reg_write,
> +      /*
> +       * We hang the whole cpu interface reset routine off here
> +       * rather than parcelling it out into one little function
> +       * per register
> +       */
> +      .resetfn = arm_gicv3_icc_reset,
> +    },
> +    REGINFO_SENTINEL
> +};
> +
>  static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = KVM_ARM_GICV3(dev);
> @@ -650,6 +718,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>
>          /* Store GICv3CPUState in CPUARMState gicv3state pointer */
>          env->gicv3state = (void *)&s->cpu[i];
> +        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
>      }
>
>      /* Try to create the device via the device control API */
> --
> 1.9.1
>

thanks
-- PMM
