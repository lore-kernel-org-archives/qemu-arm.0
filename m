Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l10sm2491151wrb.3.2017.02.28.06.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 06:04:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E96EA3E0092;
	Tue, 28 Feb 2017 14:04:02 +0000 (GMT)
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-7-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Alistair Francis <alistair23@gmail.com>, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 06/11] armv7m: Make NVIC expose a memory region rather than mapping itself
In-reply-to: <1487604965-23220-7-git-send-email-peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 14:04:02 +0000
Message-ID: <87efyi2yzx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: WFVw2qHjtjY6


Peter Maydell <peter.maydell@linaro.org> writes:

> Make the NVIC device expose a memory region for its users
> to map, rather than mapping itself into the system memory
> space on realize, and get the one user (the ARMv7M object)
> to do this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/arm/armv7m.c       | 7 ++++++-
>  hw/intc/armv7m_nvic.c | 7 ++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 638c597..fb21f74 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -172,6 +172,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>  {
>      /* here realize our children */
>      ARMv7MState *s = ARMV7M(dev);
> +    SysBusDevice *sbd;
>      Error *err = NULL;
>      int i;
>      char **cpustr;
> @@ -233,10 +234,14 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
>
>      /* Wire the NVIC up to the CPU */
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nvic), 0,
> +    sbd = SYS_BUS_DEVICE(&s->nvic);
> +    sysbus_connect_irq(sbd, 0,
>                         qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
>      s->cpu->env.nvic = &s->nvic;
>
> +    memory_region_add_subregion(&s->container, 0xe000e000,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>          Object *obj = OBJECT(&s->bitband[i]);
>          SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index f2ada39..c814e16 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -19,7 +19,6 @@
>  #include "hw/arm/arm.h"
>  #include "hw/arm/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/log.h"
>  #include "trace.h"
>
> @@ -1043,10 +1042,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>                            "nvic_sysregs", 0x1000);
>      memory_region_add_subregion(&s->container, 0, &s->sysregmem);
>
> -    /* Map the whole thing into system memory at the location required
> -     * by the v7M architecture.
> -     */
> -    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> +
>      s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
>  }


--
Alex Bennée
