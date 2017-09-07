Received: by 10.223.172.38 with SMTP id v35csp734461wrc;
        Thu, 7 Sep 2017 14:38:48 -0700 (PDT)
X-Received: by 10.200.55.110 with SMTP id p43mr1127220qtb.90.1504820328039;
        Thu, 07 Sep 2017 14:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504820328; cv=none;
        d=google.com; s=arc-20160816;
        b=aP6SmldcwagJUr26lVKVVAZZAV+/AvupkMlXfoWBbkDgerY6npA2FX0MgFOXfeybdF
         edaeWEUtmZ705ze9BmuXJh/PEUS7rPjgAgZV1LwGPIiDbOCUC1I7pVE9dJmnZY4DLyNP
         5kOm/yxOGDm7iuDbOA1bJVerE6NZ6KMnJlwfYECLyZWWvDyxVMSAi/wuGs5nZscCm5HE
         WkbF5LBNUjdVhQX7Hd5SI0J4JsdJ+Qsys8g4P+1V/uxlITwHn3vBTO4CthUC/zkMyQSq
         47mBa/89lwdxgMSXVvl8Mu1lNHq3HzUbrqhd2QQbApCpazs+D0YNAsSdCrnOcbKU3zue
         7lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=yfT2oSTPsBGYoDXQpsEfA93ANpvURpZ15OP0mjgZjx8=;
        b=KY2dz4sGIivsVFuBKNvGHEq+wyPChtZ0Gc5r45Wcco08fNLihauWCjk6dXQU2nh1mL
         V6pfYsF0p76kAQnUFZxkOHxjF/7fXwdBFQ0iFbbfM0sD4LJDD8bAyWjP2M6ioGbUaZkX
         LVPSjAgnYkEU5xsLc6ujzGJe+3L+gh+HNJg3UcjKN+nC+sFhrlIY9XkMMDrfFNGU+xG+
         A6xYmwbPQze2K0xl//TR3mnZsHpSDb8Ql2g3G+S04yzVYykvUxaawQuG4LgGmq7IiJ9C
         SVfo/0uEUUBCjAuQ2YtY6B5LW1/ySOUIdv9XexCfHf2gJThB7TH7cPGjIoIAdOlC1uMS
         z12Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkqcX8U9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i60si345641qtd.471.2017.09.07.14.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 14:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkqcX8U9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq4VZ-0003mF-M0
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 17:38:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4VP-0003iN-3v
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4VJ-0003bi-Hx
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:38:35 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4VJ-0003bL-CR; Thu, 07 Sep 2017 17:38:29 -0400
Received: by mail-qk0-x243.google.com with SMTP id g128so551092qke.0;
	Thu, 07 Sep 2017 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yfT2oSTPsBGYoDXQpsEfA93ANpvURpZ15OP0mjgZjx8=;
	b=lkqcX8U9Gnw5RO4FSWgHLwCpalWQ3InvMl410pyQNF3iyHq/ktbjKVRxdMGIv41p4m
	OkMP1dQrWcirvMm5yTiYfqG8s+3/qIogAXaIm6Z9a1f6zpuThUeBCJAj+Ri89eP868J6
	UBQ3VUcgo5wZRpgoS/DvkHpynDTktuFgsi88nwoFVrxyOeywUhY5eSpjRRjwQaqqmzxG
	wNdLG+tTTYstztvqXdI91BREx4aePBLjLx7BMTbezP7CoCoap45Mw2HLxwweNIQaQ5fS
	rOWePwzHJbWfG5TuD7lyxW9yHuhnc0vtEeNGgtWTKDjbOC+RYqmYNRF7RcNhiQDjzjdx
	i8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yfT2oSTPsBGYoDXQpsEfA93ANpvURpZ15OP0mjgZjx8=;
	b=jPdYgOuZXut84GdZLbGNBuUzUO/XN+2asq0PeCu/ufhbu2fpWP9OwGoT2cuscSyRbw
	XRdxTcXXM3Fxzey7cTbzYvStzw4LgKvh0XY9aNVhcB1Ap4e+JytTl5C8LJjN2HbwLq81
	OiN2yM7pRko8+Pv1itwLOVw1o38fEfaxyckybFsQ3HEtCTEdB8Mp0iPQHQVg4f7QwRKw
	YC7gSuSXq17epwMcyLNkYKooLlqNlJCtOJX5uMJzg68cZbLtpU8ZwPbFMTnr87Zelx7N
	cendpopf3V/rMnYHm8ktOVKi4m1Q/0/UDN16XOGabSLU/Fg/PwtHymR6nWL4cogY15qC
	v3gQ==
X-Gm-Message-State: AHPjjUiPKAQdUnDxKG/Bxpp3/gAEya6BrsV5Vk96EWaRPz5TspD6XMBH
	333R9WqO4K8W9Q==
X-Google-Smtp-Source: AOwi7QD3enhEHVcqQeTeA1ssmG0Mp/Sdq+SbTFMSkmrtB7cifjtMeXgWOpBXN0nxkDc3o5Qr/or/Qw==
X-Received: by 10.55.122.67 with SMTP id v64mr952128qkc.21.1504820308581;
	Thu, 07 Sep 2017 14:38:28 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id u1sm216571qtu.96.2017.09.07.14.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 14:38:28 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26693abe-07a2-1744-1a8d-4d08941837c5@amsat.org>
Date: Thu, 7 Sep 2017 18:38:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fv31jMePTdaR

On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
> Smartfusion2 SoC has hardened Microcontroller subsystem
> and flash based FPGA fabric. This patch adds support for
> Microcontroller subsystem in the SoC.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   hw/arm/Makefile.objs            |   1 +
>   hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>   4 files changed, 286 insertions(+)
>   create mode 100644 hw/arm/msf2-soc.c
>   create mode 100644 include/hw/arm/msf2-soc.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index bbdd3c1..5059d13 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -129,3 +129,4 @@ CONFIG_ACPI=y
>   CONFIG_SMBIOS=y
>   CONFIG_ASPEED_SOC=y
>   CONFIG_GPIO_KEY=y
> +CONFIG_MSF2=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index a2e56ec..df36a03 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>   obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>   obj-$(CONFIG_MPS2) += mps2.o
> +obj-$(CONFIG_MSF2) += msf2-soc.o
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> new file mode 100644
> index 0000000..47fffa4
> --- /dev/null
> +++ b/hw/arm/msf2-soc.c
> @@ -0,0 +1,218 @@
> +/*
> + * SmartFusion2 SoC emulation.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +#include "hw/char/serial.h"
> +#include "hw/boards.h"
> +#include "sysemu/block-backend.h"
> +#include "qemu/cutils.h"
> +#include "hw/arm/msf2-soc.h"
> +
> +#define MSF2_TIMER_BASE       0x40004000
> +#define MSF2_SYSREG_BASE      0x40038000
> +
> +#define ENVM_BASE_ADDRESS     0x60000000
> +
> +#define SRAM_BASE_ADDRESS     0x20000000
> +
> +#define MSF2_ENVM_MAX_SIZE        (512 * K_BYTE)
> +
> +/*
> + * eSRAM max size is 80k without SECDED(Single error correction and
> + * dual error detection) feature and 64k with SECDED.
> + * We do not support SECDED now.
> + */
> +#define MSF2_ESRAM_MAX_SIZE       (80 * K_BYTE)
> +
> +static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 , 0x40011000 };
> +static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
> +
> +static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
> +static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
> +static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
> +
> +static void m2sxxx_soc_initfn(Object *obj)
> +{
> +    MSF2State *s = MSF2_SOC(obj);
> +    int i;
> +
> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
> +
> +    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
> +    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
> +
> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
> +
> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> +                          TYPE_MSS_SPI);
> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +    }
> +}
> +
> +static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    MSF2State *s = MSF2_SOC(dev_soc);
> +    DeviceState *dev, *armv7m;
> +    SysBusDevice *busdev;
> +    Error *err = NULL;
> +    int i;
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *nvm = g_new(MemoryRegion, 1);
> +    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_rom(nvm, NULL, "MSF2.eNVM", s->envm_size,
> +                           &error_fatal);
> +    /*
> +     * On power-on, the eNVM region 0x60000000 is automatically
> +     * remapped to the Cortex-M3 processor executable region
> +     * start address (0x0). We do not support remapping other eNVM,
> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
> +     */
> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",

you can drop the ".alias", this function already prepends "alias "

> +                             nvm, 0, s->envm_size);
> +
> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
> +
> +    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 81);
> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> +                                     "memory", &error_abort);
> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    system_clock_scale = NANOSECONDS_PER_SECOND / s->m3clk;
> +
> +    for (i = 0; i < MSF2_NUM_UARTS; i++) {
> +        if (serial_hds[i]) {
> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
> +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
> +        }
> +    }
> +
> +    dev = DEVICE(&s->timer);
> +    /* APB0 clock is the timer input clock */
> +    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk / s->apb0div);
> +    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
> +    sysbus_connect_irq(busdev, 0,
> +                           qdev_get_gpio_in(armv7m, timer_irq[0]));
> +    sysbus_connect_irq(busdev, 1,
> +                           qdev_get_gpio_in(armv7m, timer_irq[1]));
> +
> +    dev = DEVICE(&s->sysreg);
> +    qdev_prop_set_uint32(dev, "apb0divisor", s->apb0div);
> +    qdev_prop_set_uint32(dev, "apb1divisor", s->apb1div);
> +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
> +
> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> +        gchar *bus_name;
> +
> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
> +
> +        /* Alias controller SPI bus to the SoC itself */
> +        bus_name = g_strdup_printf("spi%d", i);
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->spi[i]), "spi",
> +                                  &error_abort);
> +        g_free(bus_name);
> +    }
> +}
> +
> +static Property m2sxxx_soc_properties[] = {
> +    /*
> +     * part name specifies the type of SmartFusion2 device variant(this
> +     * property is for information purpose only.
> +     */
> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_MAX_SIZE),
> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
> +                        MSF2_ESRAM_MAX_SIZE),
> +    /* Libero GUI shows 100Mhz as default for clocks */
> +    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
> +    /* default divisors in Libero GUI */
> +    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
> +    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = m2sxxx_soc_realize;
> +    dc->props = m2sxxx_soc_properties;
> +}
> +
> +static const TypeInfo m2sxxx_soc_info = {
> +    .name          = TYPE_MSF2_SOC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MSF2State),
> +    .instance_init = m2sxxx_soc_initfn,
> +    .class_init    = m2sxxx_soc_class_init,
> +};
> +
> +static void m2sxxx_soc_types(void)
> +{
> +    type_register_static(&m2sxxx_soc_info);
> +}
> +
> +type_init(m2sxxx_soc_types)
> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
> new file mode 100644
> index 0000000..eb239fa
> --- /dev/null
> +++ b/include/hw/arm/msf2-soc.h
> @@ -0,0 +1,66 @@
> +/*
> + * Microsemi Smartfusion2 SoC
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_ARM_MSF2_SOC_H
> +#define HW_ARM_MSF2_SOC_H
> +
> +#include "hw/arm/armv7m.h"
> +#include "hw/timer/mss-timer.h"
> +#include "hw/misc/msf2-sysreg.h"
> +#include "hw/ssi/mss-spi.h"
> +
> +#define TYPE_MSF2_SOC     "msf2-soc"
> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
> +
> +#define MSF2_NUM_SPIS         2
> +#define MSF2_NUM_UARTS        2
> +
> +/*
> + * System timer consists of two programmable 32-bit
> + * decrementing counters that generate individual interrupts to
> + * the Cortex-M3 processor
> + */
> +#define MSF2_NUM_TIMERS       2
> +
> +typedef struct MSF2State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    ARMv7MState armv7m;
> +
> +    char *part_name;
> +    uint64_t envm_size;
> +    uint64_t esram_size;
> +
> +    uint32_t m3clk;
> +    uint32_t apb0div;
> +    uint32_t apb1div;
> +
> +    MSF2SysregState sysreg;
> +    MSSTimerState timer;
> +    MSSSpiState spi[MSF2_NUM_SPIS];
> +} MSF2State;
> +
> +#endif
> 
