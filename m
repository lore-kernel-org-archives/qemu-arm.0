Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n15sm4505321wrw.47.2019.10.08.04.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 04:09:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BDB771FF87;
	Tue,  8 Oct 2019 12:09:39 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-6-f4bug@amsat.org>
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
Subject: Re: [PATCH 05/19] hw/arm/bcm2835: Add various unimplemented
 peripherals
In-reply-to: <20190926173428.10713-6-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 12:09:39 +0100
Message-ID: <87zhibijd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ALBHUggPtAel


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Base addresses and sizes taken from the "BCM2835 ARM Peripherals"
> datasheet from February 06 2012:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.p=
df
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/bcm2835_peripherals.c         | 31 ++++++++++++++++++++++++++++
>  include/hw/arm/bcm2835_peripherals.h | 15 ++++++++++++++
>  include/hw/arm/raspi_platform.h      |  8 +++++++
>  3 files changed, 54 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 1bd2ff41d5..fdcf616c56 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -22,6 +22,20 @@
>  /* Capabilities for SD controller: no DMA, high-speed, default clocks et=
c. */
>  #define BCM2835_SDHC_CAPAREG 0x52134b4
>
> +static void create_unimp(BCM2835PeripheralState *ps,
> +                         UnimplementedDeviceState *uds,
> +                         const char *name, hwaddr ofs, hwaddr size)
> +{
> +    sysbus_init_child_obj(OBJECT(ps), name, uds,
> +                          sizeof(UnimplementedDeviceState),
> +                          TYPE_UNIMPLEMENTED_DEVICE);
> +    qdev_prop_set_string(DEVICE(uds), "name", name);
> +    qdev_prop_set_uint64(DEVICE(uds), "size", size);
> +    object_property_set_bool(OBJECT(uds), true, "realized", &error_fatal=
);
> +    memory_region_add_subregion_overlap(&ps->peri_mr, ofs,
> +                    sysbus_mmio_get_region(SYS_BUS_DEVICE(uds), 0), -100=
0);
> +}
> +
>  static void bcm2835_peripherals_init(Object *obj)
>  {
>      BCM2835PeripheralState *s =3D BCM2835_PERIPHERALS(obj);
> @@ -323,6 +337,23 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>          error_propagate(errp, err);
>          return;
>      }
> +
> +    create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET=
, 0x40);
> +    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
> +    create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
> +    create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
> +    create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
> +    create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
> +    create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
> +    create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
> +    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
> +    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
> +    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
> +    create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
> +    create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
> +    create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
> +    create_unimp(s, &s->dwc2, "dwc-usb2", USB_OTG_OFFSET, 0x1000);
> +    create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
>  }
>
>  static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index 6b17f6a382..62a4c7b559 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -23,6 +23,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> +#include "hw/misc/unimp.h"
>
>  #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
>  #define BCM2835_PERIPHERALS(obj) \
> @@ -37,6 +38,10 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>
> +    UnimplementedDeviceState systmr;
> +    UnimplementedDeviceState armtmr;
> +    UnimplementedDeviceState cprman;
> +    UnimplementedDeviceState a2w;
>      PL011State uart0;
>      BCM2835AuxState aux;
>      BCM2835FBState fb;
> @@ -48,6 +53,16 @@ typedef struct BCM2835PeripheralState {
>      SDHCIState sdhci;
>      BCM2835SDHostState sdhost;
>      BCM2835GpioState gpio;
> +    UnimplementedDeviceState i2s;
> +    UnimplementedDeviceState spi[1];
> +    UnimplementedDeviceState i2c[3];
> +    UnimplementedDeviceState otp;
> +    UnimplementedDeviceState dbus;
> +    UnimplementedDeviceState ave0;
> +    UnimplementedDeviceState bscsl;
> +    UnimplementedDeviceState smi;
> +    UnimplementedDeviceState dwc2;
> +    UnimplementedDeviceState sdramc;
>  } BCM2835PeripheralState;
>
>  #endif /* BCM2835_PERIPHERALS_H */
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platf=
orm.h
> index 66969fac5d..cdcbca943f 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -38,6 +38,8 @@
>                                                        * Doorbells & Mail=
boxes */
>  #define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog */
>  #define CM_OFFSET               0x101000 /* Clock Management */
> +#define A2W_OFFSET              0x102000 /* Reset controller */
> +#define AVS_OFFSET              0x103000 /* Audio Video Standard */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
>  #define UART0_OFFSET            0x201000
> @@ -45,11 +47,17 @@
>  #define I2S_OFFSET              0x203000
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define OTP_OFFSET              0x20f000
> +#define BSC_SL_OFFSET           0x214000 /* SPI slave */
>  #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
>  #define EMMC1_OFFSET            0x300000
>  #define SMI_OFFSET              0x600000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> +#define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
> +#define DBUS_OFFSET             0x900000
> +#define AVE0_OFFSET             0x910000
>  #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
> +#define SDRAMC_OFFSET           0xe00000
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
>
>  /* GPU interrupts */


--
Alex Benn=C3=A9e
