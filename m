Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e15sm21735113wrt.94.2019.10.08.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 03:40:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1ED4F1FF87;
	Tue,  8 Oct 2019 11:40:47 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-5-f4bug@amsat.org>
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
Subject: Re: [PATCH 04/19] hw/arm/bcm2835: Rename some definitions
In-reply-to: <20190926173428.10713-5-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 11:40:47 +0100
Message-ID: <871rvnjz9s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WS+waeyTv3Fv


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The UART1 is part of the AUX peripheral,
> the PCM_CLOCK (yet unimplemented) is part of the CPRMAN.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I dunno if this is OK to do that since the header has:
>
>  * These definitions are derived from those in Raspbian Linux at
>  * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
>  * where they carry the following notice:

FWIW these seem to have moved about. I couldn't find stuff in the
upstream Linux tree but in the raspbian kernel tree there is stuff in:

  include/linux/platform_data

but I couldn't find the exact place for these definitions. However I
wouldn't worry too much if they did come from a distributed kernel they
should be GPLv2.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>  *
>  * Copyright (C) 2010 Broadcom
> ---
>  hw/arm/bcm2835_peripherals.c    |  7 ++++---
>  hw/arm/bcm2836.c                |  2 +-
>  include/hw/arm/raspi_platform.h | 16 +++++++---------
>  3 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 8984e2e91f..1bd2ff41d5 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -165,7 +165,8 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart0), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart0), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> -                               INTERRUPT_UART));
> +                               INTERRUPT_UART0));
> +
>      /* AUX / UART1 */
>      qdev_prop_set_chr(DEVICE(&s->aux), "chardev", serial_hd(1));
>
> @@ -175,7 +176,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
>
> -    memory_region_add_subregion(&s->peri_mr, UART1_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, AUX_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> @@ -268,7 +269,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
>
> -    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, EMMC1_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 493a913f89..723aef6bf5 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -126,7 +126,7 @@ static void bcm2836_realize(DeviceState *dev, Error *=
*errp)
>
>          /* set periphbase/CBAR value for CPU-local registers */
>          object_property_set_int(OBJECT(&s->cpus[n]),
> -                                BCM2836_PERI_BASE + MCORE_OFFSET,
> +                                BCM2836_PERI_BASE + MSYNC_OFFSET,
>                                  "reset-cbar", &err);
>          if (err) {
>              error_propagate(errp, err);
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platf=
orm.h
> index 10083d33df..66969fac5d 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -25,8 +25,7 @@
>  #ifndef HW_ARM_RASPI_PLATFORM_H
>  #define HW_ARM_RASPI_PLATFORM_H
>
> -#define MCORE_OFFSET            0x0000   /* Fake frame buffer device
> -                                          * (the multicore sync block) */
> +#define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
>  #define IC0_OFFSET              0x2000
>  #define ST_OFFSET               0x3000   /* System Timer */
>  #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host =
Intf. */
> @@ -37,9 +36,8 @@
>  #define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
>  #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Sem=
aphores
>                                                        * Doorbells & Mail=
boxes */
> -#define PM_OFFSET               0x100000 /* Power Management, Reset cont=
roller
> -                                          * and Watchdog registers */
> -#define PCM_CLOCK_OFFSET        0x101098
> +#define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog */
> +#define CM_OFFSET               0x101000 /* Clock Management */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
>  #define UART0_OFFSET            0x201000
> @@ -47,11 +45,11 @@
>  #define I2S_OFFSET              0x203000
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> -#define UART1_OFFSET            0x215000
> -#define EMMC_OFFSET             0x300000
> +#define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
> +#define EMMC1_OFFSET            0x300000
>  #define SMI_OFFSET              0x600000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> -#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
> +#define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
>
>  /* GPU interrupts */
> @@ -112,7 +110,7 @@
>  #define INTERRUPT_SPI                  54
>  #define INTERRUPT_I2SPCM               55
>  #define INTERRUPT_SDIO                 56
> -#define INTERRUPT_UART                 57
> +#define INTERRUPT_UART0                57
>  #define INTERRUPT_SLIMBUS              58
>  #define INTERRUPT_VEC                  59
>  #define INTERRUPT_CPG                  60


--
Alex Benn=C3=A9e
