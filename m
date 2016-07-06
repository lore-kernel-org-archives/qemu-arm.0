Received: by 10.25.21.96 with SMTP id l93csp691422lfi;
        Tue, 5 Jul 2016 23:52:55 -0700 (PDT)
X-Received: by 10.200.51.76 with SMTP id u12mr33315023qta.55.1467787975286;
        Tue, 05 Jul 2016 23:52:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e23si1592399qta.137.2016.07.05.23.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jul 2016 23:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKgha-0007q7-MF
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 02:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bKggJ-0006jp-T3
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 02:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bKggE-0001PV-SN
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 02:51:34 -0400
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:56583)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bKggE-0001PQ-EJ
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 02:51:30 -0400
Received: from player794.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 6B47810006C5
	for <qemu-devel@nongnu.org>; Wed,  6 Jul 2016 08:51:29 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player794.ha.ovh.net (Postfix) with ESMTPSA id 74B8E140094;
	Wed,  6 Jul 2016 08:51:23 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-8-git-send-email-clg@kaod.org>
	<1467779679.3344.19.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1ddf2e38-5bc2-a6eb-dee1-85c43ca7fbac@kaod.org>
Date: Wed, 6 Jul 2016 08:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467779679.3344.19.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12281597662116416268
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvdehgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.47.167
Subject: Re: [Qemu-devel] [PATCH 7/7] ast2400: add a memory controller
 device model
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mar.krzeminski@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9dxLIw2UC9+c

On 07/06/2016 06:34 AM, Andrew Jeffery wrote:
> On Mon, 2016-07-04 at 14:18 +0200, C=C3=A9dric Le Goater wrote:
>> The uboot in the previous release of the SDK was using a hardcoded
>> value for memory size. This is not true anymore, the value is now
>> retrieved from the memory controller.
>>
>> Below is a model for this device, only supporting unlock and
>> configuration. Without it, we endup running a guest with 64MB, which
>> is a bit low for Linux nowdays.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/ast2400.c              |  13 +++++
>>  hw/misc/Makefile.objs         |   2 +-
>>  hw/misc/aspeed_sdmc.c         | 126 +++++++++++++++++++++++++++++++++=
+++++++++
>>  include/hw/arm/ast2400.h      |   1 +
>>  include/hw/misc/aspeed_sdmc.h |  49 ++++++++++++++++
>>  5 files changed, 190 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/misc/aspeed_sdmc.c
>>  create mode 100644 include/hw/misc/aspeed_sdmc.h
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index 9c30b45f87a9..fb0156ba8bc1 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -27,6 +27,7 @@
>>  #define AST2400_FMC_BASE         0X1E620000
>>  #define AST2400_SPI_BASE         0X1E630000
>>  #define AST2400_VIC_BASE         0x1E6C0000
>> +#define AST2400_SDMC_BASE        0x1E6E0000
>>  #define AST2400_SCU_BASE         0x1E6E2000
>>  #define AST2400_TIMER_BASE       0x1E782000
>>  #define AST2400_I2C_BASE         0x1E78A000
>> @@ -99,6 +100,10 @@ static void ast2400_init(Object *obj)
>>      object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
>>      object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
>> +
>> +    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
>> +    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
>>  }
>> =20
>>  static void ast2400_realize(DeviceState *dev, Error **errp)
>> @@ -184,6 +189,14 @@ static void ast2400_realize(DeviceState *dev, Err=
or **errp)
>>      }
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BAS=
E);
>> +
>> +    /* SDMC - SDRAM Memory Controller */
>> +    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err=
);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
>>  }
>> =20
>>  static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 54020aa06c00..d488b748c789 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -52,4 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
>>  obj-$(CONFIG_EDU) +=3D edu.o
>>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>  obj-$(CONFIG_AUX) +=3D aux.o
>> -obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
>> +obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
>> new file mode 100644
>> index 000000000000..52b6393b3f0b
>> --- /dev/null
>> +++ b/hw/misc/aspeed_sdmc.c
>> @@ -0,0 +1,126 @@
>> +/*
>> + * ASPEED SDRAM Memory Controller
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This code is licensed under the GPL version 2 or later.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/misc/aspeed_sdmc.h"
>> +#include "hw/qdev-properties.h"
>> +#include "qapi/error.h"
>> +#include "trace.h"
>=20
> We need to #include "qemu/log.h" here to avoid build failures when
> alternative tracing backends are enabled. I have forgotten it a couple
> of times recently.

yes. Thanks.

>> +
>> +/* Protection Key Register */
>> +#define R_PROT            (0x00 / 4)
>> +#define   PROT_KEY_UNLOCK     0xFC600309
>> +
>> +/* Configuration Register */
>> +#define R_CONF            (0x04 / 4)
>> +
>> +static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned =
size)
>> +{
>> +    AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
>> +
>> +    addr >>=3D 2;
>> +
>> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_P=
RIx "\n",
>> +                      __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    return s->regs[addr];
>> +}
>> +
>> +static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t dat=
a,
>> +                             unsigned int size)
>> +{
>> +    AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
>> +
>> +    addr >>=3D 2;
>> +
>> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_=
PRIx "\n",
>> +                      __func__, addr);
>> +        return;
>> +    }
>> +
>> +    if (addr !=3D R_PROT && s->regs[R_PROT] !=3D PROT_KEY_UNLOCK) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __fun=
c__);
>> +        return;
>> +    }
>> +
>> +    s->regs[addr] =3D data;
>> +}
>> +
>> +static const MemoryRegionOps aspeed_sdmc_ops =3D {
>> +    .read =3D aspeed_sdmc_read,
>> +    .write =3D aspeed_sdmc_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid.min_access_size =3D 4,
>> +    .valid.max_access_size =3D 4,
>> +    .valid.unaligned =3D false,
>> +};
>> +
>> +static void aspeed_sdmc_reset(DeviceState *dev)
>> +{
>> +    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
>> +
>> +    memset(s->regs, 0, sizeof(s->regs));
>> +    s->regs[R_CONF] =3D s->config;
>> +}
>> +
>> +static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>> +    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
>> +                          TYPE_ASPEED_SDMC, 0x1000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +}
>> +
>> +static const VMStateDescription vmstate_aspeed_sdmc =3D {
>> +    .name =3D "aspeed.sdmc",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, AspeedSDMCState, ASPEED_SDMC_NR_RE=
GS),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static Property aspeed_sdmc_properties[] =3D {
>> +    DEFINE_PROP_UINT32("configuration", AspeedSDMCState, config,
>> +                       ASPEED_SDMC_256MB),
>=20
> The datasheet's default value for configuration is 0x40, which
> configures a read-only, backwards-compatible 16-bit VGA mode bit.
> Should we also set this bit? Do we care?

I think we should add the definitions of all the bits of the=20
registers we use. I will add the 16-bit VGA mode bit in the=20
next version.

>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +    dc->realize =3D aspeed_sdmc_realize;
>> +    dc->reset =3D aspeed_sdmc_reset;
>> +    dc->desc =3D "ASPEED SDRAM Memory Controller";
>> +    dc->vmsd =3D &vmstate_aspeed_sdmc;
>> +    dc->props =3D aspeed_sdmc_properties;
>> +}
>> +
>> +static const TypeInfo aspeed_sdmc_info =3D {
>> +    .name =3D TYPE_ASPEED_SDMC,
>> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(AspeedSDMCState),
>> +    .class_init =3D aspeed_sdmc_class_init,
>> +};
>> +
>> +static void aspeed_sdmc_register_types(void)
>> +{
>> +    type_register_static(&aspeed_sdmc_info);
>> +}
>> +
>> +type_init(aspeed_sdmc_register_types);
>> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
>> index 7833bc716cd8..d549cceb121c 100644
>> --- a/include/hw/arm/ast2400.h
>> +++ b/include/hw/arm/ast2400.h
>> @@ -32,6 +32,7 @@ typedef struct AST2400State {
>>      AspeedSCUState scu;
>>      AspeedSMCState smc;
>>      AspeedSMCState spi;
>> +    AspeedSDMCState sdmc;
>=20
> You need to #include "hw/misc/aspeed_sdmc.h" for the AspeedSDMCState
> type.

yes ... that was a bad refresh of the patch before sending.

>>  } AST2400State;
>> =20
>>  #define TYPE_AST2400 "ast2400"
>> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sd=
mc.h
>> new file mode 100644
>> index 000000000000..65fefebdb2cd
>> --- /dev/null
>> +++ b/include/hw/misc/aspeed_sdmc.h
>> @@ -0,0 +1,49 @@
>> +/*
>> + * ASPEED SDRAM Memory Controller
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This code is licensed under the GPL version 2 or later.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +#ifndef ASPEED_SDMC_H
>> +#define ASPEED_SDMC_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_ASPEED_SDMC "aspeed.sdmc"
>> +#define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_AS=
PEED_SDMC)
>> +
>> +#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
>> +
>> +typedef struct AspeedSDMCState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t regs[ASPEED_SDMC_NR_REGS];
>> +    uint32_t config;
>> +
>> +} AspeedSDMCState;
>> +
>> +/*
>> + * For Aspeed AST2400 SOC
>> + */
>> +#define ASPEED_SDMC_64MB    0x0
>> +#define ASPEED_SDMC_128MB   0x1
>> +#define ASPEED_SDMC_256MB   0x2
>> +#define ASPEED_SDMC_512MB   0x3
>> +
>> +/*
>> + * For Aspeed AST2500 SOC and higher revision number
>> + */
>=20
> It might be worth noting somewhere in a comment that the AST2500
> datasheet explicitly states the DRAM controller for the AST2500 is not
> backwards compatible with the AST2400, but given the current
> implementation it doesn't matter.=20

yes. I will add that.

> If we start caring about the values
> in any of the registers MCR10-MCR24, MCR34, MCR38, MCR54, MCR5C-MCR6C,
> MCR80-MCR8C, then we need to be careful, i.e. test DRAM Controller
> Hardware Version field in R_CONF (MCR04) to dispatch. That check needs
> care as well, as the version field is 4 bits but only 2 values are
> defined in the AST2500 datasheet.
>=20
>> +#define ASPEED_SDMC_NEW_VERSION  (1 << 28)
>> +
>> +#define ASPEED_SDMC_NEW_128MB   (0x0 | ASPEED_SDMC_NEW_VERSION)
>> +#define ASPEED_SDMC_NEW_256MB   (0x1 | ASPEED_SDMC_NEW_VERSION)
>> +#define ASPEED_SDMC_NEW_512MB   (0x2 | ASPEED_SDMC_NEW_VERSION)
>> +#define ASPEED_SDMC_NEW_1024MB  (0x3 | ASPEED_SDMC_NEW_VERSION)
>> +
>> +#endif /* ASPEED_SDMC_H */
>=20
> Cheers,

Thanks for the review, this patch needs another spin.

C.=20

