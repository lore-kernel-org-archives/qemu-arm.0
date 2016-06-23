Received: by 10.25.21.96 with SMTP id l93csp666306lfi;
        Thu, 23 Jun 2016 11:44:08 -0700 (PDT)
X-Received: by 10.55.204.3 with SMTP id r3mr15213qki.45.1466707448680;
        Thu, 23 Jun 2016 11:44:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j53si1481755qtj.9.2016.06.23.11.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9bj-0002Dl-TU
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9be-00025Y-Jz
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9bb-00035k-MK
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:44:01 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9bb-00035N-Gk
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:43:59 -0400
Received: by mail-vk0-x22a.google.com with SMTP id u64so119262547vkf.3
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/6HrWUAHRe2UkAFtGktgvexLWPmXk4U0HecHLLedIJI=;
	b=M0tL0cmDtlBaHjQ3ExtURIXlf+qz6W+4w6ig7W4+3+FeBILY5eJomGo6u6BiluGHy7
	1ZhlitMy22JmwZ+mAUBEr2RuRaQYmWlsoKG5SaQbh2vmtH78hHFolp48dfFykXXvhXFe
	9W+Fq+jsWwfGWro18jXO+S0ahrIsr3mD72lfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/6HrWUAHRe2UkAFtGktgvexLWPmXk4U0HecHLLedIJI=;
	b=gCWUWQS6zVxD2u1eSLC94oTQGn10tV8E1WYVvxAQLdTmAyrdhWm7L9oOY94vEP9+TY
	F7x2iTO/oKYkxTHexe81te/G41STKmZ2iU1E6YLwXo52wRVfoxRf+Smx0sNync6F9G/M
	YzxxC69kdX+Mo3YVgmKrdwv+wFR3zzcrorQ7LTSL/arYXJcwiDLbVzlsDE1VxT2BT1WA
	pKWNC4Va+oeYI6DP2/1Uv35l5TTHaVe+/Ydn7LcvJP2WFPu/1mx+hyWMVrDOwnhjK/oK
	njVApNwSEqdHJtjN7IHGhUpgN9MCox51LgqVPMBidveaFXOS+p2/339XULYA1NqEXyeL
	iQaw==
X-Gm-Message-State: ALyK8tLV8EC6qocs6Wg5buiiRhL90qEqlxlg9e6H0lG40kPkUw7jIFIjK9GlYbSho86D7x2ae4EWRg+3KpdU73Jv
X-Received: by 10.31.109.197 with SMTP id i188mr16284437vkc.157.1466707437841; 
	Thu, 23 Jun 2016 11:43:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 11:43:38 -0700 (PDT)
In-Reply-To: <1466699607-30406-3-git-send-email-clg@kaod.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-3-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 19:43:38 +0100
Message-ID: <CAFEAcA_xQags2hs-5EyG4q3zwQjegvY1Ac=LjZ+kRStz75HzOw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-TUID: v+fCFLWiDMMz

On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The Aspeed AST2400 soc includes a static memory controller for the BMC
> which supports NOR, NAND and SPI flash memory modules. This controller
> has two modes : the SMC for the legacy interface which supports only
> one module and the FMC for the new interface which supports up to five
> modules. The AST2400 also includes a SPI only controller used for the
> host firmware, commonly called BIOS on Intel. It can be used in three
> mode : a SPI master, SPI slave and SPI pass-through
>
> Below is the initial framework for the SMC controller (FMC mode only)
> and the SPI controller: the sysbus object, MMIO for registers
> configuration and controls. Each controller has a SPI bus and a
> configurable number of CS lines for SPI flash slaves.
>
> The differences between the controllers are small, so they are
> abstracted using indirections on the register numbers.
>
> Only SPI flash modules are supported.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v2:
>
>  - switched to a realize ops to handle errors.
>
>  hw/arm/ast2400.c            |  31 +++++
>  hw/ssi/Makefile.objs        |   1 +
>  hw/ssi/aspeed_smc.c         | 298 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/arm/ast2400.h    |   3 +
>  include/hw/ssi/aspeed_smc.h |  79 ++++++++++++
>  5 files changed, 412 insertions(+)
>  create mode 100644 hw/ssi/aspeed_smc.c
>  create mode 100644 include/hw/ssi/aspeed_smc.h
>
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 1a26d74e695c..c2665c0c6ead 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -23,6 +23,9 @@
>  #define AST2400_UART_5_BASE      0x00184000
>  #define AST2400_IOMEM_SIZE       0x00200000
>  #define AST2400_IOMEM_BASE       0x1E600000
> +#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
> +#define AST2400_FMC_BASE         0X1E620000
> +#define AST2400_SPI_BASE         0X1E630000
>  #define AST2400_VIC_BASE         0x1E6C0000
>  #define AST2400_SCU_BASE         0x1E6E2000
>  #define AST2400_TIMER_BASE       0x1E782000
> @@ -81,6 +84,14 @@ static void ast2400_init(Object *obj)
>                                "hw-strap1", &error_abort);
>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>                                "hw-strap2", &error_abort);
> +
> +    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
> +    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
> +
> +    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
> +    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
>  }
>
>  static void ast2400_realize(DeviceState *dev, Error **errp)
> @@ -143,6 +154,26 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
> +
> +    /* SMC */
> +    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
> +    object_property_set_bool(OBJECT(&s->smc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

You can't pass the same err to two functions in a row
without checking it like this. See the comments on usage in
include/qapi/error.h.

> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
> +
> +    /* SPI */
> +    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
> +    object_property_set_bool(OBJECT(&s->spi), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>  }
>
>  static void ast2400_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
> index fcbb79ef0185..c79a8dcd86a9 100644
> --- a/hw/ssi/Makefile.objs
> +++ b/hw/ssi/Makefile.objs
> @@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL022) +=3D pl022.o
>  common-obj-$(CONFIG_SSI) +=3D ssi.o
>  common-obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
>  common-obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
> +common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_smc.o
>
>  obj-$(CONFIG_OMAP) +=3D omap_spi.o
>  obj-$(CONFIG_IMX) +=3D imx_spi.o
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> new file mode 100644
> index 000000000000..6b52123a67bb
> --- /dev/null
> +++ b/hw/ssi/aspeed_smc.c
> @@ -0,0 +1,298 @@
> +/*
> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
> + *
> + * Copyright (C) 2016 IBM Corp.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "include/qemu/error-report.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/ssi/aspeed_smc.h"
> +
> +/* CE Type Setting Register */
> +#define R_CONF            (0x00 / 4)
> +#define   CONF_LEGACY_DISABLE  (1 << 31)
> +#define   CONF_ENABLE_W4       20
> +#define   CONF_ENABLE_W3       19
> +#define   CONF_ENABLE_W2       18
> +#define   CONF_ENABLE_W1       17
> +#define   CONF_ENABLE_W0       16
> +#define   CONF_FLASH_TYPE4     9
> +#define   CONF_FLASH_TYPE3     7
> +#define   CONF_FLASH_TYPE2     5
> +#define   CONF_FLASH_TYPE1     3
> +#define   CONF_FLASH_TYPE0     1
> +
> +/* CE Control Register */
> +#define R_CE_CTRL            (0x04 / 4)
> +#define   CRTL_EXTENDED4       4  /* 32 bit addressing for SPI */
> +#define   CRTL_EXTENDED3       3  /* 32 bit addressing for SPI */
> +#define   CRTL_EXTENDED2       2  /* 32 bit addressing for SPI */
> +#define   CRTL_EXTENDED1       1  /* 32 bit addressing for SPI */
> +#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */

Presumably these should be CTRL, not CRTL.

> +
> +/* Interrupt Control and Status Register */
> +#define R_INTR_CTRL       (0x08 / 4)
> +
> +/* CEx Control Register */
> +#define R_CTRL0           (0x10 / 4)
> +#define   CTRL_CMD_SHIFT           16
> +#define   CTRL_CMD_MASK            0xff
> +#define   CTRL_CE_STOP_ACTIVE      (1 << 2)
> +#define   CTRL_CMD_MODE_MASK       0x3
> +#define     CTRL_READMODE          0x0
> +#define     CTRL_FREADMODE         0x1
> +#define     CTRL_WRITEMODE         0x2
> +#define     CTRL_USERMODE          0x3
> +#define R_CTRL1           (0x14 / 4)
> +#define R_CTRL2           (0x18 / 4)
> +#define R_CTRL3           (0x1C / 4)
> +#define R_CTRL4           (0x20 / 4)
> +
> +/* CEx Segment Address Register */
> +#define R_SEG_ADDR0       (0x30 / 4)
> +#define   SEG_SIZE_SHIFT       24   /* 8MB units */
> +#define   SEG_SIZE_MASK        0x7f
> +#define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
> +#define   SEG_START_MASK       0x7f
> +#define R_SEG_ADDR1       (0x34 / 4)
> +#define R_SEG_ADDR2       (0x38 / 4)
> +#define R_SEG_ADDR3       (0x3C / 4)
> +#define R_SEG_ADDR4       (0x40 / 4)
> +
> +/* Misc Control Register #1 */
> +#define R_MISC_CRTL1      (0x50 / 4)

Is this really spelt CRTL and not CTRL ?


> +
> +/* Misc Control Register #2 */
> +#define R_MISC_CRTL2      (0x54 / 4)
> +
> +/* Misc Control Register #2 */
> +#define R_TIMINGS         (0x94 / 4)
> +
> +/* SPI controller registers and bits */
> +#define R_SPI_CONF        (0x00 / 4)
> +#define   SPI_CONF_ENABLE_W0   0
> +#define R_SPI_CTRL0       (0x4 / 4)
> +#define R_SPI_MISC_CRTL   (0x10 / 4)
> +#define R_SPI_TIMINGS     (0x14 / 4)
> +
> +static const AspeedSMCController controllers[] =3D {
> +    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> +      CONF_ENABLE_W0, 5 },
> +    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> +      CONF_ENABLE_W0, 5 },
> +    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
> +      SPI_CONF_ENABLE_W0, 1 },
> +};
> +
> +static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
> +{
> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
> +}
> +
> +static void aspeed_smc_update_cs(AspeedSMCState *s)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < s->num_cs; ++i) {
> +        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i))=
;
> +    }
> +}
> +
> +static void aspeed_smc_reset(DeviceState *d)
> +{
> +    AspeedSMCState *s =3D ASPEED_SMC(d);
> +    int i;
> +
> +    memset(s->regs, 0, sizeof s->regs);
> +
> +    /* Unselect all slaves */
> +    for (i =3D 0; i < s->num_cs; ++i) {
> +        s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
> +    }
> +
> +    aspeed_smc_update_cs(s);
> +}
> +
> +static bool aspeed_smc_is_implemented(AspeedSMCState *s, hwaddr addr)
> +{
> +    return (addr =3D=3D s->r_conf || addr =3D=3D s->r_timings || addr =
=3D=3D s->r_ce_ctrl ||
> +            (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs));
> +}

This is one of those borderline cases which is "this is an
odd way to do this but not so odd that I'm going to ask you
to change it" :-)

> +
> +static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
> +{
> +    AspeedSMCState *s =3D ASPEED_SMC(opaque);
> +
> +    addr >>=3D 2;
> +
> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    if (!aspeed_smc_is_implemented(s, addr)) {
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
> +                __func__, addr);
> +        return 0;
> +    }
> +
> +    return s->regs[addr];
> +}
> +
> +static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
> +                             unsigned int size)
> +{
> +    AspeedSMCState *s =3D ASPEED_SMC(opaque);
> +    uint32_t value =3D data;
> +
> +    addr >>=3D 2;
> +
> +    if (addr >=3D ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return;
> +    }
> +
> +    if (!aspeed_smc_is_implemented(s, addr)) {
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
> +                      __func__, addr);
> +        return;
> +    }
> +
> +    /*
> +     * Not much to do apart from storing the value and set the cs
> +     * lines if the register is a controlling one.
> +     */
> +    s->regs[addr] =3D value;
> +    if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
> +        aspeed_smc_update_cs(s);
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_smc_ops =3D {
> +    .read =3D aspeed_smc_read,
> +    .write =3D aspeed_smc_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid.unaligned =3D true,
> +};
> +
> +static void aspeed_smc_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    AspeedSMCState *s =3D ASPEED_SMC(dev);
> +    AspeedSMCClass *mc =3D ASPEED_SMC_GET_CLASS(s);
> +    int i;
> +
> +    s->ctrl =3D mc->ctrl;
> +
> +    /* keep a copy under AspeedSMCState to speed up accesses */
> +    s->r_conf =3D s->ctrl->r_conf;
> +    s->r_ce_ctrl =3D s->ctrl->r_ce_ctrl;
> +    s->r_ctrl0 =3D s->ctrl->r_ctrl0;
> +    s->r_timings =3D s->ctrl->r_timings;
> +    s->conf_enable_w0 =3D s->ctrl->conf_enable_w0;
> +
> +    /* Enforce some real HW limits */
> +    if (s->num_cs > s->ctrl->max_slaves) {
> +        s->num_cs =3D s->ctrl->max_slaves;

Should this be a "fail the realize" instead? (I don't know the
hardware, so genuine question.)

> +    }
> +
> +    s->spi =3D ssi_create_bus(dev, "spi");
> +
> +    /* Setup cs_lines for slaves */
> +    sysbus_init_irq(sbd, &s->irq);
> +    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
> +    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
> +
> +    for (i =3D 0; i < s->num_cs; ++i) {
> +        sysbus_init_irq(sbd, &s->cs_lines[i]);
> +    }
> +
> +    aspeed_smc_reset(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
> +                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +}

thanks
-- PMM
