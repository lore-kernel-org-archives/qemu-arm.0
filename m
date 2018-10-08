Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3447127wrt;
        Mon, 8 Oct 2018 06:19:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60oGmG2vIlWtJ/yDN290Bdbsubr5OWgTZxUG51GTa4YvNydTg1JZ78U+2bCqqc4ESLrljDI
X-Received: by 2002:ac8:2932:: with SMTP id y47-v6mr10900215qty.42.1539004793448;
        Mon, 08 Oct 2018 06:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539004793; cv=none;
        d=google.com; s=arc-20160816;
        b=yV49JwA3oukBzOMT5DX5ic3oVgvC8RnTI+T6yURRemOFTxTcuOrphDsfyM3NsiO5GQ
         Nbpvc419HAfT3ZNj/OJgecvB+g8DzUFbE2XxmCNrX4KyL8kCTHN/MdcTUPKfafpx9X3g
         z3Ly6sGpOxXc0Ow3rgcyKFDR+6xxeJvLxIvSDxDjar/finy6X+jSSNspddDML+FHE94o
         QvAmuo3FM0YEAV6eqI561TmfKr/GqWqUyFadPS/wFB73+e8XSrZtZ2fqVLiuJBfurXtp
         v4H7KGx4ajEfl946O692Qm2Cvrxh+hGksWy1AOrY454TpY4z+EpZ5Vbcf8tW7IxDZFRh
         HN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=z2ALlQRvxDaax41a0gNoG+ZIEV72j/Y1NK9x1XKlmDc=;
        b=Py/hXLFdTsu3hf4Nw2PHFQYj9wXjKRWsKn9os/qd5YuFJpLiV4KC/C95E98ona7WW/
         O0fp3bZAyhkSrV490pYubiUAdnZXaDBLRDYNEf6pjTvUBM76/bGUnyJkMscFXkXTqsNz
         XgPsWqHPiPVyPFxoArm+KGUz07/loOlAZmz+hB+44qM6adbTJ+bsifeV4NgJzJbjcj64
         svx5N3D44/zNq28EwHrZTwLHfk/raxjv8mcLQnVItBpWZwEd4dKSZk60NHAn3Xz43BX6
         EGAIXuUjTh+tchsQzR/NtI7uZsPAKQHrjafzb3V6ADbUU7taxJbLDHg+jN05WZnpahth
         U4wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EcAWB7I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si5967988qtn.103.2018.10.08.06.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 06:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EcAWB7I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9VRw-00088u-RZ
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 09:19:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9VRh-00087B-K5
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9VRb-00031u-IZ
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:19:37 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9VRb-00030D-14
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:19:31 -0400
Received: by mail-ot1-x341.google.com with SMTP id h26-v6so19578869otl.9
	for <qemu-arm@nongnu.org>; Mon, 08 Oct 2018 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z2ALlQRvxDaax41a0gNoG+ZIEV72j/Y1NK9x1XKlmDc=;
	b=EcAWB7I+kZ4bYfNp/xNTn1WFOzRLFArpLgckLWT9Px7H2VvaAUNzO3F6+9QvtD8tdO
	UfqNmUpqRUiRDtDEJXAVU9cfnIM8bqawle2jEryiBWvl0h6TwrSHPIADfZrdoQptMNwm
	w1wRMXRQZPw+3k2LF3INaqMvJefJO70qhCZOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z2ALlQRvxDaax41a0gNoG+ZIEV72j/Y1NK9x1XKlmDc=;
	b=EZeTUyKBlEnZvHlo64LjvkJ/s/F4ANDP8JyId01jpoLne3P53oXEV0uCKJTrpUF3P1
	ku0LGBlIYSnkxlX0sMf+tH1pM3tsum/xbHJzoyzSk4piGEwubMBPY22xMz49fD67TAQT
	ru1NVmfaM7NG0eJLOA9gtu9AdYASQ9X4VxVYaVxZXur/vakjbQZkA2veAUMbN9cL08RI
	1dDDQo0B2cUFYRgS/KbTJvBwZDQ+yT/Y5z1xpypdDesjH0FNfIprEc9GtoZ9UuaHn1so
	zY1Scj4raNcrTD7C3K+KMMSxl+jrWAReDF7MgPGBq0bHQgmq11cJlyyYZUtuWr6gZQYr
	AxhA==
X-Gm-Message-State: ABuFfohxEvTk+LETZnvyAp8ph33ElQa6L/Ur6mipH2fzYSRhdlcRqBoq
	JagJZJxfNv6ivN8byGTEGVOovzavrRAcOYwqKju7Hw==
X-Received: by 2002:a9d:554a:: with SMTP id
	h10-v6mr12566498oti.151.1539004769570; 
	Mon, 08 Oct 2018 06:19:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 06:19:09 -0700 (PDT)
In-Reply-To: <1538579266-8389-12-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-12-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 14:19:09 +0100
Message-ID: <CAFEAcA8xARoCTPMWs_XA06gRgzZL+RGS8XwwKNmS45b9C7mmzA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v1 11/12] hw/arm: versal: Add a model of
 Xilinx Versal SoC
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4exv4UW20N2

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of Xilinx Versal SoC.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  default-configs/aarch64-softmmu.mak |   1 +
>  hw/arm/Makefile.objs                |   1 +
>  hw/arm/xlnx-versal.c                | 339 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h        | 122 +++++++++++++
>  4 files changed, 463 insertions(+)
>  create mode 100644 hw/arm/xlnx-versal.c
>  create mode 100644 include/hw/arm/xlnx-versal.h
>


> +#define XLNX_VERSAL_ACPU_TYPE "cortex-a72" "-" TYPE_ARM_CPU

ARM_CPU_TYPE_NAME("cortex-a72") is preferable to hand-assembling
the type name like this.

> +#define GEM_REVISION        0x40070106
> +

> +    for (i = 0; i < nr_apu_cpus; i++) {
> +        DeviceState *cpudev = DEVICE(s->fpd.apu.cpu[i]);
> +        int ppibase = XLNX_VERSAL_NR_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> +        qemu_irq maint_irq;
> +        int ti;
> +        /* Mapping from the output timer irq lines from the CPU to the
> +         * GIC PPI inputs we use for the virt board.
> +         */

This isn't the virt board :-) -- cut-n-pasted comment ?

> +        const int timer_irq[] = {
> +            [GTIMER_PHYS] = VERSAL_TIMER_NS_EL1_IRQ,
> +            [GTIMER_VIRT] = VERSAL_TIMER_VIRT_IRQ,
> +            [GTIMER_HYP]  = VERSAL_TIMER_NS_EL2_IRQ,
> +            [GTIMER_SEC]  = VERSAL_TIMER_S_EL1_IRQ,
> +        };
> +
> +        for (ti = 0; ti < ARRAY_SIZE(timer_irq); ti++) {
> +            qdev_connect_gpio_out(cpudev, ti,
> +                                  qdev_get_gpio_in(gicdev,
> +                                                   ppibase + timer_irq[ti]));
> +        }
> +        maint_irq = qdev_get_gpio_in(gicdev,
> +                                        ppibase + VERSAL_GIC_MAINT_IRQ);
> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
> +                                    0, maint_irq);
> +        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(gicbusdev, i + nr_apu_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(gicbusdev, i + 2 * nr_apu_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(gicbusdev, i + 3 * nr_apu_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +    }
> +
> +    for (i = 0; i < XLNX_VERSAL_NR_IRQS; i++) {
> +        pic[i] = qdev_get_gpio_in(gicdev, i);
> +    }

> +/* This takes the board allocated linear DDR memory and creates aliases
> + * for each split DDR range/apperture on the Versal address map.

"aperture"



> +static void versal_realize(DeviceState *dev, Error **errp)
> +{
> +    Versal *s = XLNX_VERSAL(dev);
> +    qemu_irq pic[XLNX_VERSAL_NR_IRQS];
> +
> +    versal_create_apu_cpus(s, errp);
> +    versal_create_apu_gic(s, pic, errp);
> +    versal_create_uarts(s, pic);
> +    versal_create_gems(s, pic);
> +    versal_map_ddr(s);
> +    versal_unimp(s);
> +
> +    /* Create the OCM.  */
> +    memory_region_init_ram(&s->lpd.mr_ocm, OBJECT(s), "ocm",
> +                           MM_OCM_SIZE, &error_fatal);

What's an OCM? Is it really memory, or is this a stub for something?

> +
> +    memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
> +    memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
> +}
> +
> +static void versal_init(Object *obj)
> +{
> +    Versal *s = XLNX_VERSAL(obj);
> +
> +    memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
> +    memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
> +}
> +
> +static const VMStateDescription versal_vmstate = {
> +    .name = "xlnx-ve",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        /* FIXME.  */

Stray FIXME comment -- I think the answer may be "the
SoC object has no state of its own so needs neither a
vmsd nor a reset method" ? (If so and if you drop them,
do put a comment in the class init about why they're not
provided. Some day we may have a mechanism for a device
to explicitly say "I need no vmstate" so we can assert if
none is provided.)

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property versal_properties[] = {
> +    DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void versal_reset(DeviceState *dev)
> +{
> +}
> +
> +static void versal_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = versal_realize;
> +    dc->vmsd = &versal_vmstate;
> +    dc->props = versal_properties;
> +    dc->reset = versal_reset;
> +}

Looks good otherwise.

thanks
-- PMM
