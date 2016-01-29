Received: by 10.25.159.19 with SMTP id i19csp740956lfe;
        Thu, 28 Jan 2016 20:38:02 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr8163790qka.58.1454042282556;
        Thu, 28 Jan 2016 20:38:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m46si15790731qgd.105.2016.01.28.20.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 20:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP0os-0004Eb-2u
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 23:38:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP0op-0004A7-DR
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP0om-0003RA-Jg
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:37:58 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aP0oj-0003MD-2Z; Thu, 28 Jan 2016 23:37:53 -0500
Received: by mail-wm0-x22e.google.com with SMTP id r129so52361729wmr.0;
	Thu, 28 Jan 2016 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Hyb5MiLR30UiJ4VlcSkvqDDt34sZ3xSjD76yMw1kQ+A=;
	b=ZbvMbXJxGUtvLgMdWjD/YSW+WXdTDG0cUne1Qfl+M0WrF2dhdmA13JlZUNbrghWF0v
	mjaUAnxvJn3PaQUxd5/1px8Ci6/QZh5QYz+r264TANjEKN0mobyJ1Wal2hu7t3wairvv
	GNgya3md5feCICAissPlcXbLEyBuHAX3rApmVnVescBbxsAq7/H69wGqcL2HdoucQ5Gb
	69sPFO+acS+Va6VOvDTKenG22REm3/GlZiYox17Ln8aw0X5SdEbv43KIey5gWch+Qkrt
	arWr1yJxqph4ZqAgvjAru9OCIHThvjVlM9dVECgo7VxC0OZmQQjuLl5uPqUhIORXaaM+
	s/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Hyb5MiLR30UiJ4VlcSkvqDDt34sZ3xSjD76yMw1kQ+A=;
	b=QLxcKLxubBiPyAiFqEvLA3InOgXR3iFR+VVhqLNodcykALlJhUfRO+YG/eAf2gWhYE
	AR9WqJbRRoUGuLYm41phG1fnaxO/4ZXPWDNGUwTh5gYkWOoAe3aXXdWhbTNIEH3sAVhq
	xJn/gskdkefjBMWI0gu3Sdv6QVQQG5z6GxLXjEr4I0RoQekMFgVLbgccwkErwHD+7Sn0
	tWfGJjKqMzc9wARps1LGI3KgJOZ8fomfNcpT9+3xnqcbxbyYu7P7J+CvsMPha2fOcSxZ
	QfxRRVlX/wlVKunJvpHW85vB/wME3T3inxQD3p6WRDNU8/NG90M5sG0TrsBsqZss8A8C
	MHyg==
X-Gm-Message-State: AG10YOTp7hpqL3UNH8GQ2V2rEW93jb4xJ8Nmua63nvJ/5CQ1ccLabWHJeMrzXmII/VThMgdGeEnSnx6yUMle2Q==
MIME-Version: 1.0
X-Received: by 10.28.4.134 with SMTP id 128mr1895499wme.96.1454042272070; Thu,
	28 Jan 2016 20:37:52 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 28 Jan 2016 20:37:52 -0800 (PST)
In-Reply-To: <1452902337-13844-6-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-6-git-send-email-Andrew.Baumann@microsoft.com>
Date: Thu, 28 Jan 2016 20:37:52 -0800
Message-ID: <CAPokK=rmcqq4Vzi_JVUYXJ=sAdepTwYmME4BKveQXytMfTqi2w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 5/8] bcm2836_control: add bcm2836 ARM
	control logic
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ia1zygmcyFkL

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This module is specific to the bcm2836 (Pi2). It implements the top
> level interrupt controller, and mailboxes used for inter-processor
> synchronisation.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v4:
>     * delete unused defs
>     * s/localirqs/timerirqs/
>     * factor out deliver_local() from bcm2836_control_update
>     * use deposit32 in place of bit manipulation in set_local_irq
>     * introduced register offset defs, and reduced comments in read/write handlers
>     * delete commented code
>     * s/_/-/ rename GPIOs
>
>     v3:
>      * uint8 localirqs
>      * style tweaks
>      * add MR access size limits
>
>  hw/intc/Makefile.objs             |   2 +-
>  hw/intc/bcm2836_control.c         | 303 ++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/bcm2836_control.h |  51 +++++++
>  3 files changed, 355 insertions(+), 1 deletion(-)
>  create mode 100644 hw/intc/bcm2836_control.c
>  create mode 100644 include/hw/intc/bcm2836_control.h
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 2ad1204..6a13a39 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -24,7 +24,7 @@ obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>  obj-$(CONFIG_IOAPIC) += ioapic.o
>  obj-$(CONFIG_OMAP) += omap_intc.o
>  obj-$(CONFIG_OPENPIC_KVM) += openpic_kvm.o
> -obj-$(CONFIG_RASPI) += bcm2835_ic.o
> +obj-$(CONFIG_RASPI) += bcm2835_ic.o bcm2836_control.o
>  obj-$(CONFIG_SH4) += sh_intc.o
>  obj-$(CONFIG_XICS) += xics.o
>  obj-$(CONFIG_XICS_KVM) += xics_kvm.o
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> new file mode 100644
> index 0000000..f0b7b0a
> --- /dev/null
> +++ b/hw/intc/bcm2836_control.c
> @@ -0,0 +1,303 @@
> +/*
> + * Rasperry Pi 2 emulation ARM control logic module.
> + * Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + *
> + * Based on bcm2835_ic.c (Raspberry Pi emulation) (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + *
> + * At present, only implements interrupt routing, and mailboxes (i.e.,
> + * not local timer, PMU interrupt, or AXI counters).
> + *
> + * Ref:
> + * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
> + */
> +
> +#include "hw/intc/bcm2836_control.h"
> +
> +#define REG_GPU_ROUTE           0x0c
> +#define REG_TIMERCONTROL        0x40
> +#define REG_MBOXCONTROL         0x50
> +#define REG_IRQSRC              0x60
> +#define REG_FIQSRC              0x70
> +#define REG_MBOX0_WR            0x80
> +#define REG_MBOX0_RDCLR         0xc0
> +#define REG_LIMIT              0x100
> +
> +#define IRQ_BIT(cntrl, num) (((cntrl) & (1 << (num))) != 0)
> +#define FIQ_BIT(cntrl, num) (((cntrl) & (1 << ((num) + 4))) != 0)
> +
> +#define IRQ_CNTPSIRQ    0
> +#define IRQ_CNTPNSIRQ   1
> +#define IRQ_CNTHPIRQ    2
> +#define IRQ_CNTVIRQ     3
> +#define IRQ_MAILBOX0    4
> +#define IRQ_MAILBOX1    5
> +#define IRQ_MAILBOX2    6
> +#define IRQ_MAILBOX3    7
> +#define IRQ_GPU         8
> +#define IRQ_PMU         9
> +#define IRQ_AXI         10
> +#define IRQ_TIMER       11
> +#define IRQ_MAX         IRQ_TIMER
> +
> +static void deliver_local(BCM2836ControlState *s, uint8_t core, uint8_t irq,
> +                          uint32_t controlreg, uint8_t controlidx)
> +{
> +    if (FIQ_BIT(controlreg, controlidx)) {
> +        /* deliver a FIQ */
> +        s->fiqsrc[core] |= (uint32_t)1 << irq;
> +    } else if (IRQ_BIT(controlreg, controlidx)) {
> +        /* deliver an IRQ */
> +        s->irqsrc[core] |= (uint32_t)1 << irq;
> +    } else {
> +        /* the interrupt is masked */
> +    }
> +}
> +
> +/* Update interrupts.  */
> +static void bcm2836_control_update(BCM2836ControlState *s)
> +{
> +    int i, j;
> +
> +    /* reset pending IRQs/FIQs */
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        s->irqsrc[i] = s->fiqsrc[i] = 0;
> +    }
> +
> +    /* apply routing logic, update status regs */
> +    if (s->gpu_irq) {
> +        assert(s->route_gpu_irq < BCM2836_NCORES);
> +        s->irqsrc[s->route_gpu_irq] |= (uint32_t)1 << IRQ_GPU;
> +    }
> +
> +    if (s->gpu_fiq) {
> +        assert(s->route_gpu_fiq < BCM2836_NCORES);
> +        s->fiqsrc[s->route_gpu_fiq] |= (uint32_t)1 << IRQ_GPU;
> +    }
> +
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        /* handle local timer interrupts for this core */
> +        if (s->timerirqs[i]) {
> +            assert(s->timerirqs[i] < (1 << IRQ_MAILBOX0)); /* sanity check */
> +            for (j = 0; j < IRQ_MAILBOX0; j++) {

I think <= IRQ_CNTVIRQ is cleaner, as it keeps "MAILBOX" out of the timer code.

> +                if ((s->timerirqs[i] & (1 << j)) != 0) {
> +                    /* local interrupt j is set */
> +                    deliver_local(s, i, j, s->timercontrol[i], j);
> +                }
> +            }
> +        }
> +
> +        /* handle mailboxes for this core */
> +        for (j = 0; j < BCM2836_MBPERCORE; j++) {
> +            if (s->mailboxes[i * BCM2836_MBPERCORE + j] != 0) {
> +                /* mailbox j is set */
> +                deliver_local(s, i, j + IRQ_MAILBOX0, s->mailboxcontrol[i], j);
> +            }
> +        }
> +    }
> +
> +    /* call set_irq appropriately for each output */
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        qemu_set_irq(s->irq[i], s->irqsrc[i] != 0);
> +        qemu_set_irq(s->fiq[i], s->fiqsrc[i] != 0);
> +    }
> +}
> +
> +static void bcm2836_control_set_local_irq(void *opaque, int core, int local_irq,
> +                                          int level)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    assert(core >= 0 && core < BCM2836_NCORES);
> +    assert(local_irq >= 0 && local_irq <= IRQ_CNTVIRQ);

Continuing above, this is inconsistent with the above where you use <
IRQ_MAILBOX0 instead for the same check.

> +
> +    s->timerirqs[core] = deposit32(s->timerirqs[core], local_irq, 1, !!level);
> +
> +    bcm2836_control_update(s);
> +}
> +
> +/* XXX: the following wrapper functions are a kludgy workaround,
> + * needed because I can't seem to pass useful information in the "irq"
> + * parameter when using named interrupts. Feel free to clean this up!
> + */
> +
> +static void bcm2836_control_set_local_irq0(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 0, level);
> +}
> +
> +static void bcm2836_control_set_local_irq1(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 1, level);
> +}
> +
> +static void bcm2836_control_set_local_irq2(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 2, level);
> +}
> +
> +static void bcm2836_control_set_local_irq3(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 3, level);
> +}
> +

> +    OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
> +
> +typedef struct BCM2836ControlState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +    MemoryRegion iomem;
> +

> +    /* interrupt status registers (not directly visible to user) */
> +    bool gpu_irq, gpu_fiq;
> +    uint8_t timerirqs[BCM2836_NCORES];
> +

This ...

> +    /* mailboxes */
> +    uint32_t mailboxes[BCM2836_NCORES * BCM2836_MBPERCORE];
> +
> +    /* interrupt routing/control registers */
> +    uint8_t route_gpu_irq, route_gpu_fiq;
> +    uint32_t timercontrol[BCM2836_NCORES];
> +    uint32_t mailboxcontrol[BCM2836_NCORES];
> +

> +    /* interrupt source registers, post-routing (visible) */
> +    uint32_t irqsrc[BCM2836_NCORES];
> +    uint32_t fiqsrc[BCM2836_NCORES];
> +

And this are absent from the VMSD, but after some thought they don't
need to be as they are pure functions of the input pin state that is
always refreshable from other state no? I would these together with a
brief comment as to the above, and keep the migratable state (genuine
device state) all together.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +    /* outputs to CPU cores */
> +    qemu_irq irq[BCM2836_NCORES];
> +    qemu_irq fiq[BCM2836_NCORES];
> +} BCM2836ControlState;
> +
> +#endif
> --
> 2.5.3
>
