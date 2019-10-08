Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a14sm3004727wmm.44.2019.10.08.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:22:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2375F1FF87;
	Tue,  8 Oct 2019 16:22:58 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-12-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti
 <bztemail@gmail.com>, Laurent Bonnans <laurent.bonnans@here.com>, Esteban
 Bosse <estebanbosse@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 11/19] hw/arm/bcm2835_peripherals: Use the SYS_timer
In-reply-to: <20190926173428.10713-12-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 16:22:58 +0100
Message-ID: <87sgo3i7n1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rBhOyUWDHrUT


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Connect the recently added SYS_timer.
> Now U-Boot does not hang anymore polling a free running counter
> stuck at 0.
> This timer is also used by the Linux kernel thermal subsystem.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c         | 21 ++++++++++++++++++++-
>  include/hw/arm/bcm2835_peripherals.h |  3 ++-
>  2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 70bf927a02..965f4c1f3d 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
>      /* Interrupt Controller */
>      sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835=
_IC);
>
> +    /* SYS Timer */
> +    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr),
> +                          TYPE_BCM2835_SYSTIMER);
> +
>      /* UART0 */
>      sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
>                            TYPE_PL011);
> @@ -171,6 +175,22 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>
> +    /* Sys Timer */
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

This looks like an extra check because err is checked above and hasn't
been messed with since.

> +    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> +                               INTERRUPT_ARM_TIMER));
> +
>      /* UART0 */
>      qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
>      object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
> @@ -352,7 +372,6 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>      }
>
>      create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET=
, 0x40);
> -    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
>      create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
>      create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index be7ad9b499..5b9fc89453 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -24,6 +24,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> +#include "hw/timer/bcm2835_systmr.h"
>  #include "hw/misc/unimp.h"
>
>  #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
> @@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>
> -    UnimplementedDeviceState systmr;
> +    BCM2835SysTimerState systmr;
>      UnimplementedDeviceState armtmr;
>      UnimplementedDeviceState cprman;
>      UnimplementedDeviceState a2w;


--
Alex Benn=C3=A9e
