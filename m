Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2779877wro;
        Mon, 5 Nov 2018 08:24:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5e9bMDFGfOEoDD5R2tJiO8IJkt/sttSLsxP+X0//K2DpSYegZwl5YNR2euMBHk6uvd9mS/f
X-Received: by 2002:a37:1b46:: with SMTP id b67mr21362546qkb.144.1541435048499;
        Mon, 05 Nov 2018 08:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541435048; cv=none;
        d=google.com; s=arc-20160816;
        b=hOG9YiEuZ5wlVlpAghnYvvi57tJ9mrZ3l82GJeaxcaBVRGOmI4WU1Ux117iAtEyBQP
         y6HadYuM2VNjrt6ZwtiT7H/nKBg/d7cqp0PpU0oiMX7puv8Lt/RweqRSkEoU967Ypr17
         Pl+eXdaBNSZ/PBEPJIwlFYvkebKlhmvqJHrxH3RHIvqSb8ITzokjtv+Li/FkdNGmKOEe
         T9lJAQ6b3exer6EBT1/LqScGtqPjlDRENj/HulFycrw4g4U6u2iUUWBcp84Pi+4vS9NG
         MVBH2/8Fo5XFxRB5AFsP5MpwTAWgthE/lm8iJ3KWokwCvjgdn+TmISYEXRBQApQsSgPw
         wVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=FyuQuHr0mj+dUtHMObw/i1B5BPVQf20beM0N09bxwzE=;
        b=gevJQh+GUKp0eaiXNTlGo6JmjkGPeGQuHn0HzB6SCwSh4Scs/oGcjn8SBtE5gj14/T
         9ubiyOtn3w9ETI5wnpfpoxTJLu4NrHBsBvBZPThzrQcSbMFC3lzxYqqKNZnIvDpNDMlC
         L6q3dz36RmySEFH+rEog8dAyP1RyC/XHhYSVa2LD0nnSNexi6kORejK/XoJOmpyMOXiA
         ubBXsgKtNZcKV9STiVDsRpRm00OUGHE5UGuFFduMfGYyV2rFEBzPTUb0thyY8BYqPuHk
         Bs5ZjlZel3PI5PLR8teQUDM4s2pRg2XodF2eOwsxoUveTc92Jo7zA/otnQokNKheZNU7
         JkOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UXEh18xS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r37si422022qtb.257.2018.11.05.08.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 08:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UXEh18xS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJhfb-0001C5-Mz
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 11:24:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhb3-0004ho-HR
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhKx-0002Sp-0O
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:02:48 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJhKw-0002R1-LR
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:02:46 -0500
Received: by mail-oi1-x244.google.com with SMTP id k19-v6so7868813oic.11
	for <qemu-devel@nongnu.org>; Mon, 05 Nov 2018 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FyuQuHr0mj+dUtHMObw/i1B5BPVQf20beM0N09bxwzE=;
	b=UXEh18xSoqINVOjtVp9LUY+ZBzHWRxqa9gSHHQJbn6DPLTXDy7oUFhwqFLVD/HgAfg
	chIO8JVn2iC2KRX6FhIuD3I+aI/CC3Kt6WYSOvLkYqn7lzhOuzlWlYYpEOiWf1ZOKtuU
	K7FnOwbaSNnn5hr/spWZ1LaLhMueXAZun7+7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FyuQuHr0mj+dUtHMObw/i1B5BPVQf20beM0N09bxwzE=;
	b=Z4KZ7Sirwj7InZvAxtI6fY5QleEDCvk3PTQU/Doq4d7qo1Uzr9MCrMssp9WfQbSWYc
	oRKqU9t2+e9ZJoz490ijpLZvNBRQ2Gvmk0dB9q7dUBY9SkcBTLAehcrr57wfsObg/aw6
	ForheLrpxP5P2c/LVvWgnOdypmoFDKeccSbmBkZUPzroMncvrv+y4Pg++Fp0prOJ+SXL
	Nu1VZ65FYW3Jw6m2hH+5sxTncLKeDuWUnxV7QMvOw6wDwr0XwPjG/bG5x5/sl+WvLrwj
	kbASbzdf5wd6E4yl1VGpf9Dlo2mlZNaKz3fl13ADFZF9vJoSwxQL/i2pC/uUN28XNs33
	pWeA==
X-Gm-Message-State: AGRZ1gI6KM2E4rkB/33FkZroK2rVk/HDUHT41+/WfiKBDka+2IFDaKea
	sWGb46MUggakm8peu/IidcnlOD5/xu3elrZq2DQxfA==
X-Received: by 2002:aca:1c6:: with SMTP id
	189-v6mr13851873oib.325.1541433765411; 
	Mon, 05 Nov 2018 08:02:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:02:24 -0800 (PST)
In-Reply-To: <20181102001303.32640-7-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:02:24 +0000
Message-ID: <CAFEAcA_C05O__SG-pLT6XRAKY6Bz5Q2CXeypvJJEkvN1aevB+w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH for 3.2 v2 6/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HsOSsrXZWBgu

On 2 November 2018 at 00:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Add basic support for BCM283x CPRMAN. Provide support for reading and
> writing CPRMAN registers and initialize registers with sensible default
> values. During runtime retain any written values.
>
> Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
> and raspi3 systems.
>
> Without this change, recent Linux kernels fail to boot on raspi2 and
> raspi3. raspi2 images experience with various divide by 0 errors and
> hang. raspi3 images fail to initialize the console (ttyS1).
>
> Register addresses and fields taken from the "BCM2835 ARM Peripherals"
> datasheet from February 06 2012:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.p=
df
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c         |  16 +-
>  hw/misc/Makefile.objs                |   1 +
>  hw/misc/bcm2835_cprman.c             | 277 +++++++++++++++++++++++++++
>  hw/misc/trace-events                 |   8 +
>  include/hw/arm/bcm2835_peripherals.h |   3 +-
>  include/hw/misc/bcm2835_cprman.h     |  28 +++
>  6 files changed, 331 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/bcm2835_cprman.c
>  create mode 100644 include/hw/misc/bcm2835_cprman.h
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 108c058d17..11fb098063 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -99,6 +99,11 @@ static void bcm2835_peripherals_init(Object *obj)
>      object_property_add_const_link(OBJECT(&s->property), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abort)=
;
>
> +    /* Clock subsystem */
> +    object_initialize(&s->cprman, sizeof(s->cprman), TYPE_BCM2835_CPRMAN=
);
> +    object_property_add_child(obj, "cprman", OBJECT(&s->cprman), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->cprman), sysbus_get_default());

Rather than this set of 3 calls we can use one call:
    sysbus_init_child_obj(obj, "cprman", &s->cprman, sizeof(s->cprman),
                          TYPE_BCM2835_CPRMAN)

This is shorter and also avoids a refcount leak that means the
child object isn't correctly unlinked from the parent bus if the
parent device is destroyed.

(As separate cleanup, we could fix the existing cases of this pattern
in this file.)

> +
>      /* Random Number Generator */
>      object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
>      object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
> @@ -258,6 +263,13 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
>                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PRO=
PERTY));
>
> +    /* Clock subsystem */
> +    object_property_set_bool(OBJECT(&s->cprman), true, "realized", &err)=
;
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      /* Random Number Generator */
>      object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
>      if (err) {
> @@ -265,6 +277,9 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
>
> +    memory_region_add_subregion(&s->peri_mr, CPRMAN_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cprman), 0));
> +
>      memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
>
> @@ -350,7 +365,6 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>      }
>
>      create_unimp(s, &s->pm, "bcm2835-pm", PM_OFFSET, 0x1000);
> -    create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000)=
;
>      create_unimp(s, &s->a2w, "bcm2835-a2w", 0x102000, 0x1000);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>      create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 680350b3c3..93c11a2d4d 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -53,6 +53,7 @@ obj-$(CONFIG_OMAP) +=3D omap_tap.o
>  obj-$(CONFIG_RASPI) +=3D bcm2835_mbox.o
>  obj-$(CONFIG_RASPI) +=3D bcm2835_property.o
>  obj-$(CONFIG_RASPI) +=3D bcm2835_rng.o
> +obj-$(CONFIG_RASPI) +=3D bcm2835_cprman.o
>  obj-$(CONFIG_SLAVIO) +=3D slavio_misc.o
>  obj-$(CONFIG_ZYNQ) +=3D zynq_slcr.o
>  obj-$(CONFIG_ZYNQ) +=3D zynq-xadc.o
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> new file mode 100644
> index 0000000000..df7e92e77f
> --- /dev/null
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -0,0 +1,277 @@
> +/*
> + * BCM2835 Clock subsystem (poor man's version)

Rather than saying this we should have a comment that says
that this is missing functionality and giving a summary
of what it does and does not implement.

> + * https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Periphera=
ls.pdf
> + *
> + * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
> + * Copyright (C) 2018 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

We don't use SPDX tags in QEMU at the moment, but I guess it's
clear enough what this means.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/misc/bcm2835_cprman.h"
> +#include "hw/register.h"
> +#include "trace.h"
> +
> +FIELD(CM,     PASSWD,   24, 8)
> +
> +FIELD(CM_CTL, SRC,       0, 4)
> +FIELD(CM_CTL, ENABLE,    4, 1)
> +FIELD(CM_CTL, KILL,      5, 1)
> +FIELD(CM_CTL, GATE,      6, 1)
> +FIELD(CM_CTL, BUSY,      7, 1)
> +FIELD(CM_CTL, BUSYD,     8, 1)
> +FIELD(CM_CTL, FRAC,      9, 1)
> +
> +FIELD(CM_DIV, FRAC,      0, 12)
> +FIELD(CM_DIV, INTEGER,  12, 12)
> +
> +enum cprman_clock_source {
> +    SRC_GND =3D 0,
> +    SRC_OSC =3D 1,
> +    SRC_TEST_DBG0 =3D 2,
> +    SRC_TEST_DBG1 =3D 3,
> +    SRC_PLLA_CORE =3D 4,
> +    SRC_PLLC_CORE0 =3D 5,
> +    SRC_PLLD_CORE =3D 6,
> +    SRC_PLLH_AUX =3D 7,
> +    SRC_PLLC_CORE1 =3D 8,
> +    SRC_PLLC_CORE2 =3D 9
> +};
> +
> +static const char *src_name(int src)
> +{
> +    static const char *src_names[16] =3D {
> +        [SRC_GND] =3D "GND",
> +        [SRC_OSC] =3D "OSC",
> +        [SRC_TEST_DBG0] =3D "TEST_DBG0",
> +        [SRC_TEST_DBG1] =3D "TEST_DBG1",
> +        [SRC_PLLA_CORE] =3D "PLLA_CORE",
> +        [SRC_PLLC_CORE0] =3D "PLLC_CORE0",
> +        [SRC_PLLD_CORE] =3D "PLLD_CORE",
> +        [SRC_PLLH_AUX] =3D "PLLH_AUX",
> +        [SRC_PLLC_CORE1] =3D "PLLC_CORE1",
> +        [SRC_PLLC_CORE2] =3D "PLLC_CORE2",
> +    };
> +    return src_names[src] ? src_names[src] : "UNKN";

I suspect it's not possible to get here with an array
index that's out of range, but I think it's easier to
review and to be sure the code isn't going to walk off the
end of the array if there's an explicit bounds check here.
Similarly for the regs[] array and others below.

thanks
-- PMM
