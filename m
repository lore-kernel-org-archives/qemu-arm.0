Received: by 10.25.77.65 with SMTP id a62csp178399lfb;
        Fri, 17 Feb 2017 05:41:12 -0800 (PST)
X-Received: by 10.55.100.11 with SMTP id y11mr8451896qkb.62.1487338872569;
        Fri, 17 Feb 2017 05:41:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m65si7491847qtd.323.2017.02.17.05.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 05:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceime-0003ra-2k
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 08:41:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceimX-0003pi-SJ
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceimW-0006GL-P0
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:41:05 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:35786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceimW-0006Fh-IH
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:41:04 -0500
Received: by mail-wm0-x236.google.com with SMTP id v186so15401256wmd.0
	for <qemu-arm@nongnu.org>; Fri, 17 Feb 2017 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a6Y4ZNo/VdUJNunxjzG+XdY4nlMNVyrkEx+sSkzhQbo=;
	b=H5YpdjmAp0L6h8K3TudTZGIGDM+m5JMAcgy2eM+seoIawQatA2FIbpRgnzigYml8Po
	naaA5ZRwZbibWZix84zZyxuwM+O4hjC+aYAYlldteK0UKk0Yo5qR1RcqrD+jT/uZsMrw
	lso4fIy6m+/YJaD0tjOhUiyern4/JQw7PDdtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a6Y4ZNo/VdUJNunxjzG+XdY4nlMNVyrkEx+sSkzhQbo=;
	b=TLG6IVXngw4KAZ6JnFLthU1E+iMw0MNShQ9y5Lc9S3VFhuToRYmdd/NePlEfXP8rxy
	fYxUcuRncZ40wjoVUrn5VPcYrllxWcJeSmA7r3Y2tBTT+mIwWd7GODrf0ua4r+Rv3l3t
	jOFOaOaDRVPzgzQfBYPMR3+D3nN6K2qcNdYu0xDgE6EYrNiBzZiJN/bEijXPc79L7nmK
	NCOKgFRT9RQldkArK6G74A3+qylbNUd7uct0z8gWnjbL+JJmkOvedgu9IUz5OL/OA5bU
	3V31/C+QR15RtrYHsjjoDcqPxEq/MFSQY3qNh7uXiFGzMj4jE8WRwqULT+5fi32CcAiO
	/zng==
X-Gm-Message-State: AMke39mQdQnq1q19x5VJzItfJb3Cok87QLzcibxPAWj9GPIHfto59fHoe5CrZBr93AkfriQ3mmsJz8VtBJ8Yp5ID
X-Received: by 10.28.16.70 with SMTP id 67mr2217090wmq.142.1487338863392; Fri,
	17 Feb 2017 05:41:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:40:42 -0800 (PST)
In-Reply-To: <1487313115-9510-6-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-6-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:40:42 +0000
Message-ID: <CAFEAcA8Fn0DUOx-htiJPQsRUhc+QG0oZ0vYpBees=OaKbu7s0Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH v8 5/5] hw/intc/arm_gicv3_kvm: Reset GICv3
 cpu interface registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LKm5d+7CUikl

On 17 February 2017 at 06:31,  <vijay.kilari@gmail.com> wrote:
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
>  hw/intc/arm_gicv3_kvm.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index cda1af4..6377dc3 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -604,6 +604,34 @@ static void kvm_arm_gicv3_get(GICv3State *s)
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
> +    assert(!(!c || !c->cpu || !c->gic));

I thought I'd made a comment about these asserts on a previous
version of this code... they're pretty unnecessary since if
any of them are untrue we'll just segfault in this function.

The aim of an assert is to turn a hard-to-debug failure that
only becomes visible late into an easy-to-debug failure that
happens earlier. Assertions which don't move the failure
significantly forward in time or turn an obscure problem into a
clear one aren't really worth having.

> +    s = c->gic;
> +    cpu = ARM_CPU(c->cpu);
> +
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
> @@ -621,6 +649,30 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
>      kvm_arm_gicv3_put(s);
>  }
>
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
> +      .readfn = arm_cp_read_zero,
> +      .writefn = arm_cp_write_ignore,
> +      /*
> +       * We hang the whole cpu interface reset routine off here
> +       * rather than parcelling it out into one little function
> +       * per register
> +       */
> +      .resetfn = arm_gicv3_icc_reset,
> +    },
> +    REGINFO_SENTINEL

I asked for a comment saying why we can't use ARM_CP_NOP...

thanks
-- PMM
