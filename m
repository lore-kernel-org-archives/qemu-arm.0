Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u1sm2563635wmc.38.2019.10.08.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 04:36:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DD94C1FF87;
	Tue,  8 Oct 2019 12:36:23 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-9-f4bug@amsat.org>
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
Subject: Re: [PATCH 08/19] hw/misc/bcm2835_thermal: Add a dummy BCM2835
 thermal sensor
In-reply-to: <20190926173428.10713-9-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 12:36:23 +0100
Message-ID: <87v9szii4o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uiReKfgl9unf


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We will soon implement the SYS_timer. This timer is used by Linux
> in the thermal subsystem, so once available, the subsystem will be
> enabled and poll the temperature sensors. We need to provide the
> minimum required to keep Linux booting.
>
> Add a dummy thermal sensor returning ~25=C2=B0C based on:
> https://github.com/raspberrypi/linux/blob/rpi-5.3.y/drivers/thermal/broad=
com/bcm2835_thermal.c
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> checkpatch warning:
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> This is OK because the regex are:
>
>   F: hw/*/bcm283*
>   F: include/hw/*/bcm283*
> ---
>  hw/misc/Makefile.objs             |   1 +
>  hw/misc/bcm2835_thermal.c         | 109 ++++++++++++++++++++++++++++++
>  include/hw/misc/bcm2835_thermal.h |  27 ++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 hw/misc/bcm2835_thermal.c
>  create mode 100644 include/hw/misc/bcm2835_thermal.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index a150680966..c89f3816a5 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -53,6 +53,7 @@ common-obj-$(CONFIG_OMAP) +=3D omap_tap.o
>  common-obj-$(CONFIG_RASPI) +=3D bcm2835_mbox.o
>  common-obj-$(CONFIG_RASPI) +=3D bcm2835_property.o
>  common-obj-$(CONFIG_RASPI) +=3D bcm2835_rng.o
> +common-obj-$(CONFIG_RASPI) +=3D bcm2835_thermal.o
>  common-obj-$(CONFIG_SLAVIO) +=3D slavio_misc.o
>  common-obj-$(CONFIG_ZYNQ) +=3D zynq_slcr.o
>  common-obj-$(CONFIG_ZYNQ) +=3D zynq-xadc.o
> diff --git a/hw/misc/bcm2835_thermal.c b/hw/misc/bcm2835_thermal.c
> new file mode 100644
> index 0000000000..bac23f21ea
> --- /dev/null
> +++ b/hw/misc/bcm2835_thermal.c
> @@ -0,0 +1,109 @@
> +/*
> + * BCM2835 dummy thermal sensor
> + *
> + * Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/misc/bcm2835_thermal.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/registerfields.h"
> +
> +REG32(CTL, 0)
> +FIELD(CTL, POWER_DOWN, 0, 1)
> +FIELD(CTL, RESET, 1, 1)
> +FIELD(CTL, BANDGAP_CTRL, 2, 3)
> +FIELD(CTL, INTERRUPT_ENABLE, 5, 1)
> +FIELD(CTL, DIRECT, 6, 1)
> +FIELD(CTL, INTERRUPT_CLEAR, 7, 1)
> +FIELD(CTL, HOLD, 8, 10)
> +FIELD(CTL, RESET_DELAY, 18, 8)
> +FIELD(CTL, REGULATOR_ENABLE, 26, 1)
> +
> +REG32(STAT, 4)
> +FIELD(STAT, DATA, 0, 10)
> +FIELD(STAT, VALID, 10, 1)
> +FIELD(STAT, INTERRUPT, 11, 1)
> +
> +#define THERMAL_OFFSET_C 412
> +#define THERMAL_COEFF  (-0.538f)
> +
> +static uint16_t bcm2835_thermal_temp2adc(int temp_C)
> +{
> +    return (temp_C - THERMAL_OFFSET_C) / THERMAL_COEFF;
> +}
> +
> +static uint64_t bcm2835_thermal_read(void *opaque, hwaddr addr, unsigned=
 size)
> +{
> +    Bcm2835ThermalState *s =3D BCM2835_THERMAL(opaque);
> +    uint32_t val =3D 0;
> +
> +    switch (addr) {
> +    case A_CTL:
> +        val =3D s->ctl;
> +        break;
> +    case A_STAT:
> +        val =3D FIELD_DP32(bcm2835_thermal_temp2adc(25), STAT, VALID, tr=
ue);
> +        break;
> +    default:
> +        g_assert_not_reached();

Will a unaligned read already have faulted and delivered an exception to
the guest? As this access it controlled by the guest it could
potentially take down QEMU. Perhaps it should be a LOG_GUEST_ERROR as
bellow?


> +    }
> +    return val;
> +}
> +
> +static void bcm2835_thermal_write(void *opaque, hwaddr addr,
> +                                  uint64_t value, unsigned size)
> +{
> +    Bcm2835ThermalState *s =3D BCM2835_THERMAL(opaque);
> +
> +    switch (addr) {
> +    case A_CTL:
> +        s->ctl =3D value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: write 0x%" PRIx64
> +                                       " to 0x%" HWADDR_PRIx "\n",
> +                       __func__, value, addr);
> +    }
> +}
> +
> +static const MemoryRegionOps bcm2835_thermal_ops =3D {
> +    .read =3D bcm2835_thermal_read,
> +    .write =3D bcm2835_thermal_write,
> +    .impl.max_access_size =3D 4,
> +    .valid.min_access_size =3D 4,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void bcm2835_thermal_realize(DeviceState *dev, Error **errp)
> +{
> +    Bcm2835ThermalState *s =3D BCM2835_THERMAL(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_thermal_ops,
> +                          s, TYPE_BCM2835_THERMAL, 8);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}
> +
> +static void bcm2835_thermal_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D bcm2835_thermal_realize;
> +}
> +
> +static const TypeInfo bcm2835_thermal_info =3D {
> +    .name =3D TYPE_BCM2835_THERMAL,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(Bcm2835ThermalState),
> +    .class_init =3D bcm2835_thermal_class_init,
> +};
> +
> +static void bcm2835_thermal_register_types(void)
> +{
> +    type_register_static(&bcm2835_thermal_info);
> +}
> +
> +type_init(bcm2835_thermal_register_types)
> diff --git a/include/hw/misc/bcm2835_thermal.h b/include/hw/misc/bcm2835_=
thermal.h
> new file mode 100644
> index 0000000000..f85cce7214
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_thermal.h
> @@ -0,0 +1,27 @@
> +/*
> + * BCM2835 dummy thermal sensor
> + *
> + * Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_MISC_BCM2835_THERMAL_H
> +#define HW_MISC_BCM2835_THERMAL_H
> +
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +
> +#define TYPE_BCM2835_THERMAL "bcm2835-thermal"
> +
> +#define BCM2835_THERMAL(obj) \
> +    OBJECT_CHECK(Bcm2835ThermalState, (obj), TYPE_BCM2835_THERMAL)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    uint32_t ctl;
> +} Bcm2835ThermalState;
> +
> +#endif

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e
