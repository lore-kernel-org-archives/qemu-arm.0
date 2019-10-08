Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n8sm5878693wma.7.2019.10.08.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 07:52:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 80D901FF87;
	Tue,  8 Oct 2019 15:52:22 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-11-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti <bztemail@gmail.com>, Laurent Bonnans
 <laurent.bonnans@here.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <f4bug@amsat.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, BALATON
 Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 10/19] hw/timer/bcm2835: Add the BCM2835 SYS_timer
In-reply-to: <20190926173428.10713-11-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 15:52:22 +0100
Message-ID: <87tv8ji921.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: G2SItvtTXiVt


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Add the 64-bit free running timer. Do not model the COMPARE register
> (no IRQ generated).
> This timer is used by U-Boot and recent Linux kernels:
> https://github.com/u-boot/u-boot/blob/v2019.07/include/configs/rpi.h#L19
>
> Datasheet used:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.p=
df
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Since which kernels? 4.19 seems to use it.
>
> checkpatch warning:
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> This is OK because the regex are:
>
>   F: hw/*/bcm283*
>   F: include/hw/*/bcm283*
> ---
>  hw/timer/Makefile.objs            |   1 +
>  hw/timer/bcm2835_systmr.c         | 100 ++++++++++++++++++++++++++++++
>  hw/timer/trace-events             |   4 ++
>  include/hw/timer/bcm2835_systmr.h |  30 +++++++++
>  4 files changed, 135 insertions(+)
>  create mode 100644 hw/timer/bcm2835_systmr.c
>  create mode 100644 include/hw/timer/bcm2835_systmr.h
>
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 123d92c969..696cda5905 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -47,3 +47,4 @@ common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
>  common-obj-$(CONFIG_CMSDK_APB_TIMER) +=3D cmsdk-apb-timer.o
>  common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) +=3D cmsdk-apb-dualtimer.o
>  common-obj-$(CONFIG_MSF2) +=3D mss-timer.o
> +common-obj-$(CONFIG_RASPI) +=3D bcm2835_systmr.o
> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
> new file mode 100644
> index 0000000000..c4d2b488bd
> --- /dev/null
> +++ b/hw/timer/bcm2835_systmr.c
> @@ -0,0 +1,100 @@
> +/*
> + * BCM2835 SYS timer emulation
> + *
> + * Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or
> + * (at your option) any later version.
> + *
> + * Datasheet: BCM2835 ARM Peripherals (C6357-M-1398)
> + * https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Periphera=
ls.pdf
> + *
> + * Only the free running 64-bit counter is implemented.
> + * The 4 COMPARE registers and the interruption are not implemented.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/log.h"
> +#include "hw/registerfields.h"
> +#include "hw/timer/bcm2835_systmr.h"
> +#include "trace.h"
> +
> +REG32(CTRL_STATUS,  0x00)
> +REG32(COUNTER_LOW,  0x04)
> +REG32(COUNTER_HIGH, 0x08)
> +REG32(COMPARE0,     0x0c)
> +REG32(COMPARE1,     0x10)
> +REG32(COMPARE2,     0x14)
> +REG32(COMPARE3,     0x18)
> +
> +static uint64_t bcm2835_sys_timer_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    uint64_t r =3D 0;
> +
> +    switch (offset) {
> +    case A_CTRL_STATUS:
> +    case A_COMPARE0 ... A_COMPARE3:

Probably worth a LOG_UNIMP in here if we are not going to do it.

> +        break;
> +    case A_COUNTER_LOW:
> +    case A_COUNTER_HIGH:
> +        /* Free running counter at 1MHz */
> +        r =3D qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
> +        r >>=3D 8 * (offset - A_COUNTER_LOW);
> +        r &=3D UINT32_MAX;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad offset 0x%" HWADDR_PRIx =
"\n",
> +                      __func__, offset);
> +        break;
> +    }
> +    trace_bcm2835_sys_timer_read(offset, r);
> +
> +    return r;
> +}
> +
> +static void bcm2835_sys_timer_write(void *opaque, hwaddr offset,
> +                                    uint64_t value, unsigned size)
> +{
> +    trace_bcm2835_sys_timer_write(offset, value);
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: bad offset 0x%" HWADDR_PRIx "\n",
> +                  __func__, offset);
> +}
> +
> +static const MemoryRegionOps bcm2835_sys_timer_ops =3D {
> +    .read =3D bcm2835_sys_timer_read,
> +    .write =3D bcm2835_sys_timer_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static void bcm2835_sys_timer_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    BCM2835SysTimerState *s =3D BCM2835_SYSTIMER(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_sys_timer_ops,
> +                          s, "bcm2835-sys-timer", 0x20);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static const TypeInfo bcm2835_sys_timer_info =3D {
> +    .name =3D TYPE_BCM2835_SYSTIMER,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(BCM2835SysTimerState),
> +    .instance_init =3D bcm2835_sys_timer_init,
> +};
> +
> +static void bcm2835_sys_timer_register_types(void)
> +{
> +    type_register_static(&bcm2835_sys_timer_info);
> +}
> +
> +type_init(bcm2835_sys_timer_register_types);
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index db02a9142c..81967a1a19 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -87,3 +87,7 @@ pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
>  pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>  pl031_alarm_raised(void) "alarm raised"
>  pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
> +
> +# bcm2835_systmr.c
> +bcm2835_sys_timer_read(uint64_t offset, uint64_t data) "timer read: offs=
et 0x%" PRIx64 " data 0x%" PRIx64
> +bcm2835_sys_timer_write(uint64_t offset, uint64_t data) "timer write: of=
fset 0x%" PRIx64 " data 0x%" PRIx64
> diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835=
_systmr.h
> new file mode 100644
> index 0000000000..6ac7f8ec5a
> --- /dev/null
> +++ b/include/hw/timer/bcm2835_systmr.h
> @@ -0,0 +1,30 @@
> +/*
> + * BCM2835 SYS timer emulation
> + *
> + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#ifndef BCM2835_SYSTIMER_H
> +#define BCM2835_SYSTIMER_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +
> +#define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
> +#define BCM2835_SYSTIMER(obj) \
> +    OBJECT_CHECK(BCM2835SysTimerState, (obj), TYPE_BCM2835_SYSTIMER)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +} BCM2835SysTimerState;
> +
> +#endif


--
Alex Benn=C3=A9e
