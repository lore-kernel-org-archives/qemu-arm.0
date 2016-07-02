Received: by 10.25.21.96 with SMTP id l93csp818150lfi;
        Sat, 2 Jul 2016 10:01:40 -0700 (PDT)
X-Received: by 10.200.45.28 with SMTP id n28mr6448055qta.79.1467478900522;
        Sat, 02 Jul 2016 10:01:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d198si2802221qka.153.2016.07.02.10.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jul 2016 10:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJOIV-0000sG-Ua
	for alex.bennee@linaro.org; Sat, 02 Jul 2016 13:01:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJOHS-0007l8-8j
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 13:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJOHN-00015f-8B
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 13:00:34 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bJOHM-00015T-MP; Sat, 02 Jul 2016 13:00:29 -0400
Received: by mail-lf0-x244.google.com with SMTP id w130so13911493lfd.2;
	Sat, 02 Jul 2016 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=InD4hz2LKRE+L0vr8LMX48ltk4bzFC8JkU8dWbD4D8c=;
	b=vloz+RBxDavZNI19PzFhA8pGl/vPddjd0yBjQPT+I7YRpIsKk9RcNvtS8I2eUa8cT5
	V46fQgx1gcMzaouRdotBryffx4IeiqXBTJhfUYtZqhGZTjuBqpEA3I2zAZIM71vcF0k4
	jDpN5SJMWI1Q7uuZwldPTz9MfXZD8sOjXYP3B7LMQSCc+Z9xbbmkDcj3zoGD9vu9hE44
	7t93t7toJ8dy6l3zTp/IU1hba7wnjAmFQ+c1bA9B6Bv2y8jgSIIgFvxsIHE8b5B+p323
	8fJ65yUzE0d/BksBBulAQEavB45lYLhxiOWoDsYOjuXF3u9jQKldIJfazU26g52ZOiVY
	uRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=InD4hz2LKRE+L0vr8LMX48ltk4bzFC8JkU8dWbD4D8c=;
	b=ECUScgTm3RbA48aBCn+WKwHTW5L/d8jXH/Fvi7abnUM7NXUT/0yyZFEzaF8S+V2nMF
	QXqqtiDOMbSeuH4acjmV9XSGHb8WJqy0UdL11gtWssjqZmmw5N3y9bF43Oz41kIU1bK6
	EHcmCsZPcyaavrZ6pSHDycIJJkrlJkIgARHNM4uujWIFakSz7mfWQVbD66CE+wWV1UW/
	Tt16AOSLAbd4R7R26phoWLgSScApyR4HJQ/h2z3/4mz8mend8wUpPbK2Kuqv1L2O6LYJ
	OQyjTSLURibvup3LB0TlbNbudZNpwfPfc2rfrXOL2FQZ4OUkXE403VKFMp6gwbl19+fh
	aj+Q==
X-Gm-Message-State: ALyK8tLt0YxAySvpZajBPK6lkz1ET6ydT04MyvxKmlyskvmWQ+Y1RTbqB3zBQBYasKmZsQ==
X-Received: by 10.25.4.202 with SMTP id 193mr1007075lfe.204.1467478825983;
	Sat, 02 Jul 2016 10:00:25 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4])
	by smtp.gmail.com with ESMTPSA id 12sm3269354ljf.17.2016.07.02.10.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jul 2016 10:00:25 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-7-git-send-email-clg@kaod.org>
	<77433c2c-364a-a329-dd7b-1b80ea0f6c63@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <5777F327.7050606@gmail.com>
Date: Sat, 2 Jul 2016 19:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <77433c2c-364a-a329-dd7b-1b80ea0f6c63@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-devel] [PATCH v5 6/9] ast2400: add SMC controllers (FMC
 and SPI)
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /sjXQ14oraS8



W dniu 29.06.2016 o 09:58, Cédric Le Goater pisze:
> On 06/28/2016 08:24 PM, Cédric Le Goater wrote:
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
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   Changes since v3:
>>
>>   - Fixed typos on CTRL
>>   - Fixed multiple error handling when setting properties in
>>     ast2400_realize()
> Peter,
>
> I missed one ... See below.
>
>>   - Added error messages when max_slaves is exceeded
>>   - Added definitions for R_INTR_CTRL register bits
>>   - Added definitions for R_DMA_* registers
>>   - Constantified a couple of routine arguments
>>   - Sorted out what was need for migration (registers only apriori)
>>
>>   Changes since v2:
>>
>>   - Switched to a realize ops to be able to handle errors.
>>
>>   hw/arm/ast2400.c            |  34 ++++-
>>   hw/ssi/Makefile.objs        |   1 +
>>   hw/ssi/aspeed_smc.c         | 326 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/arm/ast2400.h    |   3 +
>>   include/hw/ssi/aspeed_smc.h |  79 +++++++++++
>>   5 files changed, 442 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/ssi/aspeed_smc.c
>>   create mode 100644 include/hw/ssi/aspeed_smc.h
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index b14a82fcdef1..b16ba2d0c516 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -23,6 +23,9 @@
>>   #define AST2400_UART_5_BASE      0x00184000
>>   #define AST2400_IOMEM_SIZE       0x00200000
>>   #define AST2400_IOMEM_BASE       0x1E600000
>> +#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
>> +#define AST2400_FMC_BASE         0X1E620000
>> +#define AST2400_SPI_BASE         0X1E630000
>>   #define AST2400_VIC_BASE         0x1E6C0000
>>   #define AST2400_SCU_BASE         0x1E6E2000
>>   #define AST2400_TIMER_BASE       0x1E782000
>> @@ -85,13 +88,21 @@ static void ast2400_init(Object *obj)
>>                                 "hw-strap1", &error_abort);
>>       object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>>                                 "hw-strap2", &error_abort);
>> +
>> +    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
>> +    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
>> +
>> +    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
>> +    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
>>   }
>>   
>>   static void ast2400_realize(DeviceState *dev, Error **errp)
>>   {
>>       int i;
>>       AST2400State *s = AST2400(dev);
>> -    Error *err = NULL;
>> +    Error *err = NULL, *local_err = NULL;
>>   
>>       /* IO space */
>>       memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
>> @@ -147,6 +158,27 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
>>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>>                          qdev_get_gpio_in(DEVICE(&s->vic), 12));
>> +
>> +    /* SMC */
>> +    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
>> +    object_property_set_bool(OBJECT(&s->smc), true, "realized", &err);
>                                                                      
> It should be a '&local_err' above and it is missing a :
>
>         error_propagate(&err, local_err);
>
> Please tell me if you want a resend.
>
> Thanks,
>
> C.
>
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
>> +
>> +    /* SPI */
>> +    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
>> +    object_property_set_bool(OBJECT(&s->spi), true, "realized", &local_err);
>> +    error_propagate(&err, local_err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>>   }
>>   
>>   static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
>> index fcbb79ef0185..c79a8dcd86a9 100644
>> --- a/hw/ssi/Makefile.objs
>> +++ b/hw/ssi/Makefile.objs
>> @@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL022) += pl022.o
>>   common-obj-$(CONFIG_SSI) += ssi.o
>>   common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
>>   common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
>> +common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
>>   
>>   obj-$(CONFIG_OMAP) += omap_spi.o
>>   obj-$(CONFIG_IMX) += imx_spi.o
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> new file mode 100644
>> index 000000000000..537635e18d64
>> --- /dev/null
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -0,0 +1,326 @@
>> +/*
>> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
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
>> +#define   CTRL_EXTENDED4       4  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED3       3  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED2       2  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED1       1  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED0       0  /* 32 bit addressing for SPI */
Hi

Above comments does not say anything.

Regards,
Marcin
>> +
>> +/* Interrupt Control and Status Register */
>> +#define R_INTR_CTRL       (0x08 / 4)
>> +#define   INTR_CTRL_DMA_STATUS            (1 << 11)
>> +#define   INTR_CTRL_CMD_ABORT_STATUS      (1 << 10)
>> +#define   INTR_CTRL_WRITE_PROTECT_STATUS  (1 << 9)
>> +#define   INTR_CTRL_DMA_EN                (1 << 3)
>> +#define   INTR_CTRL_CMD_ABORT_EN          (1 << 2)
>> +#define   INTR_CTRL_WRITE_PROTECT_EN      (1 << 1)
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
>> +#define R_MISC_CTRL1      (0x50 / 4)
>> +
>> +/* Misc Control Register #2 */
>> +#define R_MISC_CTRL2      (0x54 / 4)
>> +
>> +/* DMA Control/Status Register */
>> +#define R_DMA_CTRL        (0x80 / 4)
>> +#define   DMA_CTRL_DELAY_MASK   0xf
>> +#define   DMA_CTRL_DELAY_SHIFT  8
>> +#define   DMA_CTRL_FREQ_MASK    0xf
>> +#define   DMA_CTRL_FREQ_SHIFT   4
>> +#define   DMA_CTRL_MODE         (1 << 3)
>> +#define   DMA_CTRL_CKSUM        (1 << 2)
>> +#define   DMA_CTRL_DIR          (1 << 1)
>> +#define   DMA_CTRL_EN           (1 << 0)
>> +
>> +/* DMA Flash Side Address */
>> +#define R_DMA_FLASH_ADDR  (0x84 / 4)
>> +
>> +/* DMA DRAM Side Address */
>> +#define R_DMA_DRAM_ADDR   (0x88 / 4)
>> +
>> +/* DMA Length Register */
>> +#define R_DMA_LEN         (0x8C / 4)
>> +
>> +/* Checksum Calculation Result */
>> +#define R_DMA_CHECKSUM    (0x90 / 4)
>> +
>> +/* Misc Control Register #2 */
>> +#define R_TIMINGS         (0x94 / 4)
>> +
>> +/* SPI controller registers and bits */
>> +#define R_SPI_CONF        (0x00 / 4)
>> +#define   SPI_CONF_ENABLE_W0   0
>> +#define R_SPI_CTRL0       (0x4 / 4)
>> +#define R_SPI_MISC_CTRL   (0x10 / 4)
>> +#define R_SPI_TIMINGS     (0x14 / 4)
>> +
>> +static const AspeedSMCController controllers[] = {
>> +    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> +      CONF_ENABLE_W0, 5 },
>> +    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> +      CONF_ENABLE_W0, 5 },
>> +    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
>> +      SPI_CONF_ENABLE_W0, 1 },
>> +};
>> +
>> +static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
>> +}
>> +
>> +static void aspeed_smc_update_cs(const AspeedSMCState *s)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i));
>> +    }
>> +}
>> +
>> +static void aspeed_smc_reset(DeviceState *d)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(d);
>> +    int i;
>> +
>> +    memset(s->regs, 0, sizeof s->regs);
>> +
>> +    /* Unselect all slaves */
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
>> +    }
>> +
>> +    aspeed_smc_update_cs(s);
>> +}
>> +
>> +static bool aspeed_smc_is_implemented(AspeedSMCState *s, hwaddr addr)
>> +{
>> +    return (addr == s->r_conf || addr == s->r_timings || addr == s->r_ce_ctrl ||
>> +            (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs));
>> +}
>> +
>> +static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(opaque);
>> +
>> +    addr >>= 2;
>> +
>> +    if (addr >= ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
>> +                      __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    if (!aspeed_smc_is_implemented(s, addr)) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>> +                __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    return s->regs[addr];
>> +}
>> +
>> +static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>> +                             unsigned int size)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(opaque);
>> +    uint32_t value = data;
>> +
>> +    addr >>= 2;
>> +
>> +    if (addr >= ARRAY_SIZE(s->regs)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
>> +                      __func__, addr);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_is_implemented(s, addr)) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>> +                      __func__, addr);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Not much to do apart from storing the value and set the cs
>> +     * lines if the register is a controlling one.
>> +     */
>> +    s->regs[addr] = value;
>> +    if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
>> +        aspeed_smc_update_cs(s);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_ops = {
>> +    .read = aspeed_smc_read,
>> +    .write = aspeed_smc_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .valid.unaligned = true,
>> +};
>> +
>> +static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +    AspeedSMCState *s = ASPEED_SMC(dev);
>> +    AspeedSMCClass *mc = ASPEED_SMC_GET_CLASS(s);
>> +    int i;
>> +
>> +    s->ctrl = mc->ctrl;
>> +
>> +    /* keep a copy under AspeedSMCState to speed up accesses */
>> +    s->r_conf = s->ctrl->r_conf;
>> +    s->r_ce_ctrl = s->ctrl->r_ce_ctrl;
>> +    s->r_ctrl0 = s->ctrl->r_ctrl0;
>> +    s->r_timings = s->ctrl->r_timings;
>> +    s->conf_enable_w0 = s->ctrl->conf_enable_w0;
>> +
>> +    /* Enforce some real HW limits */
>> +    if (s->num_cs > s->ctrl->max_slaves) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
>> +                      __func__, s->ctrl->max_slaves);
>> +        s->num_cs = s->ctrl->max_slaves;
>> +    }
>> +
>> +    s->spi = ssi_create_bus(dev, "spi");
>> +
>> +    /* Setup cs_lines for slaves */
>> +    sysbus_init_irq(sbd, &s->irq);
>> +    s->cs_lines = g_new0(qemu_irq, s->num_cs);
>> +    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        sysbus_init_irq(sbd, &s->cs_lines[i]);
>> +    }
>> +
>> +    aspeed_smc_reset(dev);
>> +
>> +    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>> +                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>> +    sysbus_init_mmio(sbd, &s->mmio);
>> +}
>> +
>> +static const VMStateDescription vmstate_aspeed_smc = {
>> +    .name = "aspeed.smc",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static Property aspeed_smc_properties[] = {
>> +    DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void aspeed_smc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    AspeedSMCClass *mc = ASPEED_SMC_CLASS(klass);
>> +
>> +    dc->realize = aspeed_smc_realize;
>> +    dc->reset = aspeed_smc_reset;
>> +    dc->props = aspeed_smc_properties;
>> +    dc->vmsd = &vmstate_aspeed_smc;
>> +    mc->ctrl = data;
>> +}
>> +
>> +static const TypeInfo aspeed_smc_info = {
>> +    .name           = TYPE_ASPEED_SMC,
>> +    .parent         = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size  = sizeof(AspeedSMCState),
>> +    .class_size     = sizeof(AspeedSMCClass),
>> +    .abstract       = true,
>> +};
>> +
>> +static void aspeed_smc_register_types(void)
>> +{
>> +    int i;
>> +
>> +    type_register_static(&aspeed_smc_info);
>> +    for (i = 0; i < ARRAY_SIZE(controllers); ++i) {
>> +        TypeInfo ti = {
>> +            .name       = controllers[i].name,
>> +            .parent     = TYPE_ASPEED_SMC,
>> +            .class_init = aspeed_smc_class_init,
>> +            .class_data = (void *)&controllers[i],
>> +        };
>> +        type_register(&ti);
>> +    }
>> +}
>> +
>> +type_init(aspeed_smc_register_types)
>> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
>> index f1a64fd3893d..7833bc716cd8 100644
>> --- a/include/hw/arm/ast2400.h
>> +++ b/include/hw/arm/ast2400.h
>> @@ -17,6 +17,7 @@
>>   #include "hw/misc/aspeed_scu.h"
>>   #include "hw/timer/aspeed_timer.h"
>>   #include "hw/i2c/aspeed_i2c.h"
>> +#include "hw/ssi/aspeed_smc.h"
>>   
>>   typedef struct AST2400State {
>>       /*< private >*/
>> @@ -29,6 +30,8 @@ typedef struct AST2400State {
>>       AspeedTimerCtrlState timerctrl;
>>       AspeedI2CState i2c;
>>       AspeedSCUState scu;
>> +    AspeedSMCState smc;
>> +    AspeedSMCState spi;
>>   } AST2400State;
>>   
>>   #define TYPE_AST2400 "ast2400"
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> new file mode 100644
>> index 000000000000..c4a4960cd880
>> --- /dev/null
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -0,0 +1,79 @@
>> +/*
>> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef ASPEED_SMC_H
>> +#define ASPEED_SMC_H
>> +
>> +#include "hw/ssi/ssi.h"
>> +
>> +typedef struct AspeedSMCController {
>> +    const char *name;
>> +    uint8_t r_conf;
>> +    uint8_t r_ce_ctrl;
>> +    uint8_t r_ctrl0;
>> +    uint8_t r_timings;
>> +    uint8_t conf_enable_w0;
>> +    uint8_t max_slaves;
>> +} AspeedSMCController;
>> +
>> +#define TYPE_ASPEED_SMC "aspeed.smc"
>> +#define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_SMC)
>> +#define ASPEED_SMC_CLASS(klass) \
>> +     OBJECT_CLASS_CHECK(AspeedSMCClass, (klass), TYPE_ASPEED_SMC)
>> +#define ASPEED_SMC_GET_CLASS(obj) \
>> +     OBJECT_GET_CLASS(AspeedSMCClass, (obj), TYPE_ASPEED_SMC)
>> +
>> +typedef struct  AspeedSMCClass {
>> +    SysBusDevice parent_obj;
>> +    const AspeedSMCController *ctrl;
>> +}  AspeedSMCClass;
>> +
>> +#define ASPEED_SMC_R_MAX        (0x100 / 4)
>> +
>> +typedef struct AspeedSMCState {
>> +    SysBusDevice parent_obj;
>> +
>> +    const AspeedSMCController *ctrl;
>> +
>> +    MemoryRegion mmio;
>> +
>> +    qemu_irq irq;
>> +    int irqline;
>> +
>> +    uint32_t num_cs;
>> +    qemu_irq *cs_lines;
>> +
>> +    SSIBus *spi;
>> +
>> +    uint32_t regs[ASPEED_SMC_R_MAX];
>> +
>> +    /* depends on the controller type */
>> +    uint8_t r_conf;
>> +    uint8_t r_ce_ctrl;
>> +    uint8_t r_ctrl0;
>> +    uint8_t r_timings;
>> +    uint8_t conf_enable_w0;
>> +} AspeedSMCState;
>> +
>> +#endif /* ASPEED_SMC_H */
>>
>
>

