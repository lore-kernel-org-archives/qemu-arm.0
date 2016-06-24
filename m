Received: by 10.25.21.96 with SMTP id l93csp1051921lfi;
        Fri, 24 Jun 2016 06:39:32 -0700 (PDT)
X-Received: by 10.55.41.167 with SMTP id p39mr898291qkp.119.1466775572371;
        Fri, 24 Jun 2016 06:39:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si4908416qkh.228.2016.06.24.06.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 06:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGRKV-0005lQ-P7
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 09:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRBl-0003uQ-S7
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRBa-00014o-TS
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:30:28 -0400
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:39364)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGRBa-00014D-Gm
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:30:18 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 3B42DFF937D
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 15:30:17 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 2CF602C00DA;
	Fri, 24 Jun 2016 15:30:10 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-3-git-send-email-clg@kaod.org>
	<CAFEAcA_xQags2hs-5EyG4q3zwQjegvY1Ac=LjZ+kRStz75HzOw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e5e183ce-c422-34ee-e97a-0234a791e336@kaod.org>
Date: Fri, 24 Jun 2016 15:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xQags2hs-5EyG4q3zwQjegvY1Ac=LjZ+kRStz75HzOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3884636153814813611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.108.172
Subject: Re: [Qemu-arm] [PATCH v3 2/5] ast2400: add SMC controllers (FMC and
 SPI)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P32+0qmSIydo

On 06/23/2016 08:43 PM, Peter Maydell wrote:
> On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The Aspeed AST2400 soc includes a static memory controller for the BMC
>> which supports NOR, NAND and SPI flash memory modules. This controller
>> has two modes : the SMC for the legacy interface which supports only
>> one module and the FMC for the new interface which supports up to five
>> modules. The AST2400 also includes a SPI only controller used for the
>> host firmware, commonly called BIOS on Intel. It can be used in three
>> mode : a SPI master, SPI slave and SPI pass-through
>>
>> Below is the initial framework for the SMC controller (FMC mode only)
>> and the SPI controller: the sysbus object, MMIO for registers
>> configuration and controls. Each controller has a SPI bus and a
>> configurable number of CS lines for SPI flash slaves.
>>
>> The differences between the controllers are small, so they are
>> abstracted using indirections on the register numbers.
>>
>> Only SPI flash modules are supported.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>
>>  Changes since v2:
>>
>>  - switched to a realize ops to handle errors.
>>
>>  hw/arm/ast2400.c            |  31 +++++
>>  hw/ssi/Makefile.objs        |   1 +
>>  hw/ssi/aspeed_smc.c         | 298 +++++++++++++++++++++++++++++++++++=
+++++++++
>>  include/hw/arm/ast2400.h    |   3 +
>>  include/hw/ssi/aspeed_smc.h |  79 ++++++++++++
>>  5 files changed, 412 insertions(+)
>>  create mode 100644 hw/ssi/aspeed_smc.c
>>  create mode 100644 include/hw/ssi/aspeed_smc.h
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index 1a26d74e695c..c2665c0c6ead 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -23,6 +23,9 @@
>>  #define AST2400_UART_5_BASE      0x00184000
>>  #define AST2400_IOMEM_SIZE       0x00200000
>>  #define AST2400_IOMEM_BASE       0x1E600000
>> +#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
>> +#define AST2400_FMC_BASE         0X1E620000
>> +#define AST2400_SPI_BASE         0X1E630000
>>  #define AST2400_VIC_BASE         0x1E6C0000
>>  #define AST2400_SCU_BASE         0x1E6E2000
>>  #define AST2400_TIMER_BASE       0x1E782000
>> @@ -81,6 +84,14 @@ static void ast2400_init(Object *obj)
>>                                "hw-strap1", &error_abort);
>>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>>                                "hw-strap2", &error_abort);
>> +
>> +    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
>> +    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
>> +
>> +    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
>> +    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
>>  }
>>
>>  static void ast2400_realize(DeviceState *dev, Error **errp)
>> @@ -143,6 +154,26 @@ static void ast2400_realize(DeviceState *dev, Err=
or **errp)
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
>>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>> +
>> +    /* SMC */
>> +    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
>> +    object_property_set_bool(OBJECT(&s->smc), true, "realized", &err)=
;
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>=20
> You can't pass the same err to two functions in a row
> without checking it like this. See the comments on usage in
> include/qapi/error.h.

ah yes. this a copy paste without thinking ...
=20
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
>> +
>> +    /* SPI */
>> +    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
>> +    object_property_set_bool(OBJECT(&s->spi), true, "realized", &err)=
;
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>>  }
>>
>>  static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
>> index fcbb79ef0185..c79a8dcd86a9 100644
>> --- a/hw/ssi/Makefile.objs
>> +++ b/hw/ssi/Makefile.objs
>> @@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL022) +=3D pl022.o
>>  common-obj-$(CONFIG_SSI) +=3D ssi.o
>>  common-obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
>>  common-obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
>> +common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_smc.o
>>
>>  obj-$(CONFIG_OMAP) +=3D omap_spi.o
>>  obj-$(CONFIG_IMX) +=3D imx_spi.o
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> new file mode 100644
>> index 000000000000..6b52123a67bb
>> --- /dev/null
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -0,0 +1,298 @@
>> +/*
>> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>> + * of this software and associated documentation files (the "Software=
"), to deal
>> + * in the Software without restriction, including without limitation =
the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell
>> + * copies of the Software, and to permit persons to whom the Software=
 is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inc=
luded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +#include "include/qemu/error-report.h"
>> +#include "exec/address-spaces.h"
>> +
>> +#include "hw/ssi/aspeed_smc.h"
>> +
>> +/* CE Type Setting Register */
>> +#define R_CONF            (0x00 / 4)
>> +#define   CONF_LEGACY_DISABLE  (1 << 31)
>> +#define   CONF_ENABLE_W4       20
>> +#define   CONF_ENABLE_W3       19
>> +#define   CONF_ENABLE_W2       18
>> +#define   CONF_ENABLE_W1       17
>> +#define   CONF_ENABLE_W0       16
>> +#define   CONF_FLASH_TYPE4     9
>> +#define   CONF_FLASH_TYPE3     7
>> +#define   CONF_FLASH_TYPE2     5
>> +#define   CONF_FLASH_TYPE1     3
>> +#define   CONF_FLASH_TYPE0     1
>> +
>> +/* CE Control Register */
>> +#define R_CE_CTRL            (0x04 / 4)
>> +#define   CRTL_EXTENDED4       4  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED3       3  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED2       2  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED1       1  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
>=20
> Presumably these should be CTRL, not CRTL.

CTRL.

>> +
>> +/* Interrupt Control and Status Register */
>> +#define R_INTR_CTRL       (0x08 / 4)
>> +
>> +/* CEx Control Register */
>> +#define R_CTRL0           (0x10 / 4)
>> +#define   CTRL_CMD_SHIFT           16
>> +#define   CTRL_CMD_MASK            0xff
>> +#define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>> +#define   CTRL_CMD_MODE_MASK       0x3
>> +#define     CTRL_READMODE          0x0
>> +#define     CTRL_FREADMODE         0x1
>> +#define     CTRL_WRITEMODE         0x2
>> +#define     CTRL_USERMODE          0x3
>> +#define R_CTRL1           (0x14 / 4)
>> +#define R_CTRL2           (0x18 / 4)
>> +#define R_CTRL3           (0x1C / 4)
>> +#define R_CTRL4           (0x20 / 4)
>> +
>> +/* CEx Segment Address Register */
>> +#define R_SEG_ADDR0       (0x30 / 4)
>> +#define   SEG_SIZE_SHIFT       24   /* 8MB units */
>> +#define   SEG_SIZE_MASK        0x7f
>> +#define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
>> +#define   SEG_START_MASK       0x7f
>> +#define R_SEG_ADDR1       (0x34 / 4)
>> +#define R_SEG_ADDR2       (0x38 / 4)
>> +#define R_SEG_ADDR3       (0x3C / 4)
>> +#define R_SEG_ADDR4       (0x40 / 4)
>> +
>> +/* Misc Control Register #1 */
>> +#define R_MISC_CRTL1      (0x50 / 4)
>=20
> Is this really spelt CRTL and not CTRL ?

This is really a CTRL :) I will fix that.=20

>> +
>> +/* Misc Control Register #2 */
>> +#define R_MISC_CRTL2      (0x54 / 4)
>> +
>> +/* Misc Control Register #2 */
>> +#define R_TIMINGS         (0x94 / 4)
>> +
>> +/* SPI controller registers and bits */
>> +#define R_SPI_CONF        (0x00 / 4)
>> +#define   SPI_CONF_ENABLE_W0   0
>> +#define R_SPI_CTRL0       (0x4 / 4)
>> +#define R_SPI_MISC_CRTL   (0x10 / 4)
>> +#define R_SPI_TIMINGS     (0x14 / 4)
>> +
>> +static const AspeedSMCController controllers[] =3D {
>> +    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> +      CONF_ENABLE_W0, 5 },
>> +    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> +      CONF_ENABLE_W0, 5 },
>> +    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
>> +      SPI_CONF_ENABLE_W0, 1 },
>> +};
>> +
>> +static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
>> +}
>> +
>> +static void aspeed_smc_update_cs(AspeedSMCState *s)
>> +{
>> +    int i;
>> +
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, =
i));
>> +    }
>> +}
>> +
>> +static void aspeed_smc_reset(DeviceState *d)
>> +{
>> +    AspeedSMCState *s =3D ASPEED_SMC(d);
>> +    int i;
>> +
>> +    memset(s->regs, 0, sizeof s->regs);
>> +
>> +    /* Unselect all slaves */
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
>> +    }
>> +
>> +    aspeed_smc_update_cs(s);
>> +}
>> +
>> +static bool aspeed_smc_is_implemented(AspeedSMCState *s, hwaddr addr)
>> +{
>> +    return (addr =3D=3D s->r_conf || addr =3D=3D s->r_timings || addr=
 =3D=3D s->r_ce_ctrl ||
>> +            (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs));
>> +}
>=20
> This is one of those borderline cases which is "this is an
> odd way to do this but not so odd that I'm going to ask you
> to change it" :-)

yes ... I am not that happy with it either :)

I don't think I will stand adding anything else to it without
finding another solution. As U-Boot is using some extra features,=20
it might not survive very long in that state.


>> +
>> +static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned i=
nt size)
>> +{
>> +    AspeedSMCState *s =3D ASPEED_SMC(opaque);
>> +
>> +    addr >>=3D 2;
>> +
>> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n=
",
>> +                      __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    if (!aspeed_smc_is_implemented(s, addr)) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PR=
Ix "\n",
>> +                __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    return s->regs[addr];
>> +}
>> +
>> +static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data=
,
>> +                             unsigned int size)
>> +{
>> +    AspeedSMCState *s =3D ASPEED_SMC(opaque);
>> +    uint32_t value =3D data;
>> +
>> +    addr >>=3D 2;
>> +
>> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\=
n",
>> +                      __func__, addr);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_is_implemented(s, addr)) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PR=
Ix "\n",
>> +                      __func__, addr);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Not much to do apart from storing the value and set the cs
>> +     * lines if the register is a controlling one.
>> +     */
>> +    s->regs[addr] =3D value;
>> +    if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
>> +        aspeed_smc_update_cs(s);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_ops =3D {
>> +    .read =3D aspeed_smc_read,
>> +    .write =3D aspeed_smc_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid.unaligned =3D true,
>> +};
>> +
>> +static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>> +    AspeedSMCState *s =3D ASPEED_SMC(dev);
>> +    AspeedSMCClass *mc =3D ASPEED_SMC_GET_CLASS(s);
>> +    int i;
>> +
>> +    s->ctrl =3D mc->ctrl;
>> +
>> +    /* keep a copy under AspeedSMCState to speed up accesses */
>> +    s->r_conf =3D s->ctrl->r_conf;
>> +    s->r_ce_ctrl =3D s->ctrl->r_ce_ctrl;
>> +    s->r_ctrl0 =3D s->ctrl->r_ctrl0;
>> +    s->r_timings =3D s->ctrl->r_timings;
>> +    s->conf_enable_w0 =3D s->ctrl->conf_enable_w0;
>> +
>> +    /* Enforce some real HW limits */
>> +    if (s->num_cs > s->ctrl->max_slaves) {
>> +        s->num_cs =3D s->ctrl->max_slaves;
>=20
> Should this be a "fail the realize" instead? (I don't know the
> hardware, so genuine question.)

The FMC controller supports up to 5, the SPI only one, but there
should be more on the ast2500 for the SPI and I would like to reuse=20
that code.

I added the 'num_cs' property to not create uselessly slaves and fit
how a platform is used in "real". For example, one flash module for=20
the BMC, one for the host or two flash modules for the BMC, the extra=20
being a gold image and one for the host.=20

I don't think it should fail but I could log some message if we are
going beyond the limits.

Thanks,

C.

>> +    }
>> +
>> +    s->spi =3D ssi_create_bus(dev, "spi");
>> +
>> +    /* Setup cs_lines for slaves */
>> +    sysbus_init_irq(sbd, &s->irq);
>> +    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
>> +    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
>> +
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        sysbus_init_irq(sbd, &s->cs_lines[i]);
>> +    }
>> +
>> +    aspeed_smc_reset(dev);
>> +
>> +    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>> +                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>> +    sysbus_init_mmio(sbd, &s->mmio);
>> +}
>=20
> thanks
> -- PMM
>=20

