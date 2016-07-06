Received: by 10.25.21.96 with SMTP id l93csp647150lfi;
        Tue, 5 Jul 2016 21:35:18 -0700 (PDT)
X-Received: by 10.55.140.69 with SMTP id o66mr28456778qkd.143.1467779718017;
        Tue, 05 Jul 2016 21:35:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z205si2270059qka.224.2016.07.05.21.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jul 2016 21:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKeYP-000371-9N
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 00:35:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bKeYK-00035k-Q4
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 00:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bKeYE-00022W-TJ
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 00:35:11 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bKeYB-0001vJ-Uz; Wed, 06 Jul 2016 00:35:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id BC7D5B9B;
	Wed,  6 Jul 2016 00:34:49 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 06 Jul 2016 00:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=c5uNQ
	HtH6OCXdgDH0FRNqxW0VcI=; b=dtVJnpk+NScCid2LrwzR5oHqSE64UT9KSl8pa
	NaCuM4eBXvK46xUKYdle+NLUJg1KF9pCmhhWeE27KAYjXEibl0Emeh1TeoXlZxUz
	puPhW1OxGrn914GTnc4EQkgH9eEzWYjTfn6vFCgTFbJOq/iv5z9Qk+4XkNk6Uywa
	ZgZ9HM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=c5uNQHtH6OCXdgDH0FRNqxW0VcI=; b=lh7Nm
	6d/mbyRQdAvOBdsvxqE/webLQ9DylbOZpuaiDB7dcekokqaEMWF7qVy1xXZ1jmUk
	1ckV3nQld2gVb/sh4/UhYxoetxAsQKcXfSuAiBi5Jn49PrNHo7veeFIN2ABZxUSG
	CmAIpRw6nEammgb+I4/4jsJmD5C2pa3f2xSBkQ=
X-Sasl-enc: f4WSVUNy4Yoo9V3M+m4fPgSS0bWqoS3PIJ41N/WAafuZ 1467779688
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2D866F29FA;
	Wed,  6 Jul 2016 00:34:45 -0400 (EDT)
Message-ID: <1467779679.3344.19.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 06 Jul 2016 14:04:39 +0930
In-Reply-To: <1467634738-28642-8-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-8-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OXlQvAnAY9y8Axeqwzqy"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 7/7] ast2400: add a memory controller device
 model
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mar.krzeminski@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVMeEuTofsSZ


--=-OXlQvAnAY9y8Axeqwzqy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-07-04 at 14:18 +0200, C=C3=A9dric Le Goater wrote:
> The uboot in the previous release of the SDK was using a hardcoded
> value for memory size. This is not true anymore, the value is now
> retrieved from the memory controller.
>=20
> Below is a model for this device, only supporting unlock and
> configuration. Without it, we endup running a guest with 64MB, which
> is a bit low for Linux nowdays.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/ast2400.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A013 +++++
> =C2=A0hw/misc/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> =C2=A0hw/misc/aspeed_sdmc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 126 ++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/hw/arm/ast2400.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A01 +
> =C2=A0include/hw/misc/aspeed_sdmc.h |=C2=A0=C2=A049 ++++++++++++++++
> =C2=A05 files changed, 190 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 hw/misc/aspeed_sdmc.c
> =C2=A0create mode 100644 include/hw/misc/aspeed_sdmc.h
>=20
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 9c30b45f87a9..fb0156ba8bc1 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -27,6 +27,7 @@
> =C2=A0#define AST2400_FMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00X1E620000
> =C2=A0#define AST2400_SPI_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00X1E630000
> =C2=A0#define AST2400_VIC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E6C0000
> +#define AST2400_SDMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E6E0000
> =C2=A0#define AST2400_SCU_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E6E2000
> =C2=A0#define AST2400_TIMER_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E782000
> =C2=A0#define AST2400_I2C_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E78A000
> @@ -99,6 +100,10 @@ static void ast2400_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->spi, sizeof(s->spi), =
"aspeed.smc.spi");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "spi", OBJEC=
T(&s->spi), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->spi), sysbus=
_get_default());
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->sdmc, sizeof(s->sdmc), TYP=
E_ASPEED_SDMC);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "sdmc", OBJECT(&s=
->sdmc), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get=
_default());
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_realize(DeviceState *dev, Error **errp)
> @@ -184,6 +189,14 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0,=
 AST2400_SPI_BASE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1,=
 AST2400_SPI_FLASH_BASE);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* SDMC - SDRAM Memory Controller */
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->sdmc), true,=
 "realized", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST=
2400_SDMC_BASE);
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 54020aa06c00..d488b748c789 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -52,4 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
> =C2=A0obj-$(CONFIG_EDU) +=3D edu.o
> =C2=A0obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
> =C2=A0obj-$(CONFIG_AUX) +=3D aux.o
> -obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
> +obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> new file mode 100644
> index 000000000000..52b6393b3f0b
> --- /dev/null
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -0,0 +1,126 @@
> +/*
> + * ASPEED SDRAM Memory Controller
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.=C2=A0=C2=A0Se=
e
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/aspeed_sdmc.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "trace.h"

We need to #include "qemu/log.h" here to avoid build failures when
alternative tracing backends are enabled. I have forgotten it a couple
of times recently.

> +
> +/* Protection Key Register */
> +#define R_PROT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(0x00 / 4)
> +#define=C2=A0=C2=A0=C2=A0PROT_KEY_UNLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x=
FC600309
> +
> +/* Configuration Register */
> +#define R_CONF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(0x04 / 4)
> +
> +static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned siz=
e)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0addr >>=3D 2;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (addr >=3D ARRAY_SIZE(s->regs)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(LOG_GUEST_=
ERROR,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"%s: Out-of-bou=
nds read at offset 0x%" HWADDR_PRIx "\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__func__, addr)=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[addr];
> +}
> +
> +static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0addr >>=3D 2;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (addr >=3D ARRAY_SIZE(s->regs)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(LOG_GUEST_=
ERROR,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"%s: Out-of-bou=
nds write at offset 0x%" HWADDR_PRIx "\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__func__, addr)=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (addr !=3D R_PROT && s->regs[R_PROT] !=3D PRO=
T_KEY_UNLOCK) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(LOG_GUEST_=
ERROR, "%s: SDMC is locked!\n", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0s->regs[addr] =3D data;
> +}
> +
> +static const MemoryRegionOps aspeed_sdmc_ops =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.read =3D aspeed_sdmc_read,
> +=C2=A0=C2=A0=C2=A0=C2=A0.write =3D aspeed_sdmc_write,
> +=C2=A0=C2=A0=C2=A0=C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
> +=C2=A0=C2=A0=C2=A0=C2=A0.valid.min_access_size =3D 4,
> +=C2=A0=C2=A0=C2=A0=C2=A0.valid.max_access_size =3D 4,
> +=C2=A0=C2=A0=C2=A0=C2=A0.valid.unaligned =3D false,
> +};
> +
> +static void aspeed_sdmc_reset(DeviceState *dev)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState *s =3D ASPEED_SDMC(dev);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0memset(s->regs, 0, sizeof(s->regs));
> +=C2=A0=C2=A0=C2=A0=C2=A0s->regs[R_CONF] =3D s->config;
> +}
> +
> +static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState *s =3D ASPEED_SDMC(dev);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->iomem, OBJECT(s), &asp=
eed_sdmc_ops, s,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0TYPE_ASPEED_SDMC, 0x1000);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static const VMStateDescription vmstate_aspeed_sdmc =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "aspeed.sdmc",
> +=C2=A0=C2=A0=C2=A0=C2=A0.version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.minimum_version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.fields =3D (VMStateField[]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_UINT32_ARRAY(reg=
s, AspeedSDMCState, ASPEED_SDMC_NR_REGS),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_END_OF_LIST()
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +};
> +
> +static Property aspeed_sdmc_properties[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT32("configuration", AspeedSDMCSt=
ate, config,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SD=
MC_256MB),

The datasheet's default value for configuration is 0x40, which
configures a read-only, backwards-compatible 16-bit VGA mode bit.
Should we also set this bit? Do we care?

> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->realize =3D aspeed_sdmc_realize;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->reset =3D aspeed_sdmc_reset;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->desc =3D "ASPEED SDRAM Memory Controller";
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->vmsd =3D &vmstate_aspeed_sdmc;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->props =3D aspeed_sdmc_properties;
> +}
> +
> +static const TypeInfo aspeed_sdmc_info =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D TYPE_ASPEED_SDMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent =3D TYPE_SYS_BUS_DEVICE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.instance_size =3D sizeof(AspeedSDMCState),
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D aspeed_sdmc_class_init,
> +};
> +
> +static void aspeed_sdmc_register_types(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&aspeed_sdmc_info);
> +}
> +
> +type_init(aspeed_sdmc_register_types);
> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
> index 7833bc716cd8..d549cceb121c 100644
> --- a/include/hw/arm/ast2400.h
> +++ b/include/hw/arm/ast2400.h
> @@ -32,6 +32,7 @@ typedef struct AST2400State {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSCUState scu;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState smc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState sdmc;

You need to #include "hw/misc/aspeed_sdmc.h" for the AspeedSDMCState
type.

> =C2=A0} AST2400State;
> =C2=A0
> =C2=A0#define TYPE_AST2400 "ast2400"
> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.=
h
> new file mode 100644
> index 000000000000..65fefebdb2cd
> --- /dev/null
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -0,0 +1,49 @@
> +/*
> + * ASPEED SDRAM Memory Controller
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.=C2=A0=C2=A0Se=
e
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef ASPEED_SDMC_H
> +#define ASPEED_SDMC_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_SDMC "aspeed.sdmc"
> +#define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEE=
D_SDMC)
> +
> +#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
> +
> +typedef struct AspeedSDMCState {
> +=C2=A0=C2=A0=C2=A0=C2=A0/*< private >*/
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice parent_obj;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/*< public >*/
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion iomem;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t regs[ASPEED_SDMC_NR_REGS];
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t config;
> +
> +} AspeedSDMCState;
> +
> +/*
> + * For Aspeed AST2400 SOC
> + */
> +#define ASPEED_SDMC_64MB=C2=A0=C2=A0=C2=A0=C2=A00x0
> +#define ASPEED_SDMC_128MB=C2=A0=C2=A0=C2=A00x1
> +#define ASPEED_SDMC_256MB=C2=A0=C2=A0=C2=A00x2
> +#define ASPEED_SDMC_512MB=C2=A0=C2=A0=C2=A00x3
> +
> +/*
> + * For Aspeed AST2500 SOC and higher revision number
> + */

It might be worth noting somewhere in a comment that the AST2500
datasheet explicitly states the DRAM controller for the AST2500 is not
backwards compatible with the AST2400, but given the current
implementation it doesn't matter. If we start caring about the values
in any of the registers MCR10-MCR24, MCR34, MCR38, MCR54, MCR5C-MCR6C,
MCR80-MCR8C, then we need to be careful, i.e. test DRAM Controller
Hardware Version field in R_CONF (MCR04) to dispatch. That check needs
care as well, as the version field is 4 bits but only 2 values are
defined in the AST2500 datasheet.

> +#define ASPEED_SDMC_NEW_VERSION=C2=A0=C2=A0(1 << 28)
> +
> +#define ASPEED_SDMC_NEW_128MB=C2=A0=C2=A0=C2=A0(0x0 | ASPEED_SDMC_NEW_VE=
RSION)
> +#define ASPEED_SDMC_NEW_256MB=C2=A0=C2=A0=C2=A0(0x1 | ASPEED_SDMC_NEW_VE=
RSION)
> +#define ASPEED_SDMC_NEW_512MB=C2=A0=C2=A0=C2=A0(0x2 | ASPEED_SDMC_NEW_VE=
RSION)
> +#define ASPEED_SDMC_NEW_1024MB=C2=A0=C2=A0(0x3 | ASPEED_SDMC_NEW_VERSION=
)
> +
> +#endif /* ASPEED_SDMC_H */

Cheers,

Andrew
--=-OXlQvAnAY9y8Axeqwzqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXfIpfAAoJEJ0dnzgO5LT5vngP/icB2v8uCclnx3Z1BSOLwiq5
teIaqZtL69kwxFo3rWTHlt+YaZtz8SDQmAVOPku519BgsbL3mDJrI/iqlkmHLuTy
pJeeE7BcFsoKp3q+EB4hfsThFlA3rDrItJOgzt1hrdIpne8Ex8CmnphH074dxAnx
8ASDthUk4JMiq5xLCNBXwnBhV8Utsc9I008BqHo4fP4TbAxUMN5SDFU7vQV2RSKL
Wo3JfbK/r5fGpP6lWyXYH0zZnkmGfUsi8ibAwvwRtTiZLdJqctfxqgE8gLkAmLLt
GB+q34FRH8m25BmQQxSJSHx6ozqLqn99H1VG41zgEGSFrEYtIjuO4DyP2N1qg8fV
xeT6Q/Ybcz4Y7XsBrQtKmqYpHLvN+yUklEx38SabandZ5xrWYXYcJUljq8jn5+gd
mSLBJmO55FnB2R2wfW4RP6wgE/C8DsFVJuNcFXO85rxRCoQLH1lvbwZ5GhjJRWBG
+aMhXQ2LfFLO+79tsPYKCNX3j+hIC5RA5mrZObwDEaDFcpwRClbd/yv8Wf5N67kA
hkYSeUEUPLnsH0CA9hNLC3pLv7Rar8LccQmlgNc7CpnKL+mDP6GL7UDvAwRCzT94
kZ/3EWi/3ChSXyrdsA4fL0uNxjaBLmimGwcZha5MKgtzDCzjTuWvxv563zUoZoyE
2ZWgYNZiWfk3jkuR0oQv
=83Px
-----END PGP SIGNATURE-----

--=-OXlQvAnAY9y8Axeqwzqy--

