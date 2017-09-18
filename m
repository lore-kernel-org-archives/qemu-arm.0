Received: by 10.223.172.38 with SMTP id v35csp4248010wrc;
        Mon, 18 Sep 2017 15:04:55 -0700 (PDT)
X-Received: by 10.200.34.167 with SMTP id f36mr40780739qta.173.1505772295042;
        Mon, 18 Sep 2017 15:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505772295; cv=none;
        d=google.com; s=arc-20160816;
        b=mIAKFyZ0oQwIyeEAWV/dgLEeWxsCJ7KMJ9DbQPlyXRiWRGWuQGwgpUXNP3d6qBVaj2
         mpPL39XRXVMIQU24FStL8pxfExf3kA+7e2HDuV2D7xgNYRVFd2y5F4mjcBWMJIaRa4Wc
         oCR0pHhuWyIAbfiUSgGEOAtHXmN+yjNgEDGlW6XbslQ/pjA8//Faf05eBJ8HO8xR/kW4
         /oegY3IN8qwkoEPIEyIxqgOc3B4TNKcwZnnYfpB6rycb4zMqK8XzxojKjV3Yo8brYVvX
         MWErQ5Fmm3GZGrmH1XkcPKziqFIJPDeVEt5Xzu8jve8mks7J4z16j4rbXNhhA+BrS7HB
         eZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=6XCHNdh+RINuKcIPnD6VdAVJnfJcewfdwz7rd6lfDek=;
        b=MDXuusz9hG6evCudwxRRU9HUBN6tTIGQXfxNTfdFEpjT3nPiAy2aAWiN8NBfDTnuDv
         nybFhdUVCrGne6PQT55YrpnfguJjUUC92FzAEv041grzQdSBWYElRnbt1HksSlQoQdOb
         D2L+LvH6GPUKLL1YEPFeWSSspGQz4xEm1mRrL+qXbNAoDeT47OaOPehvin1aU8D5Tp3N
         Y6MvrPXLvsyjZpIf+1Yp2LP45+GDF4817qModAY2DpApL5SPFqZXdGrIqURV5j6NTcJ+
         uQe8ifDmD1PbyQurba6ze89Tpzu94kl8qVWq4PlK6wppxiL6Stsoomm2+dk5Iyp3DKUe
         14BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UDXozkif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si3374214qtc.446.2017.09.18.15.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 15:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UDXozkif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du49s-0005HU-No
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 18:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du49k-0005H1-O4
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 18:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du49h-0002jN-6L
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 18:04:44 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du49h-0002ii-10; Mon, 18 Sep 2017 18:04:41 -0400
Received: by mail-qt0-x243.google.com with SMTP id l25so1248482qtf.2;
	Mon, 18 Sep 2017 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6XCHNdh+RINuKcIPnD6VdAVJnfJcewfdwz7rd6lfDek=;
	b=UDXozkifNV/zVIn6pFzX/P7ZzJ/q0FHwYs+UI+FPdcLEpXOaNtRCqcBVY4N5U1H1tj
	SZnVun+bfl0wKc/y58SaKnhlapDq03tuvIji7Wsn+BG9ZiXtKYZCKwUBoSS5beZGm3+k
	Tofk3V9asJdw1fy5CF8/sgQsevbpfb17R59Gbf7v2CofGSPDYNhhVv/EAeC90bSGMddC
	v0KtrcTsbzCy8ATlu4EuQTcDJP+PYKuZLlUfMMaaXpaYYNFU7+ENWWBAEdm0Qg/rBaqg
	3ifw2lvdmD/NM3oRt/YQ5GGPGOB/SBj5UQqQZlAebVIiDFROyFxX2e+f1G9utaf7N8/v
	ThLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6XCHNdh+RINuKcIPnD6VdAVJnfJcewfdwz7rd6lfDek=;
	b=lBEFK43Yee9HwXddVuxEx7cZx9mk+66/+qjJm+Z1sBtINW5XQmcu359iZTeTaSubKS
	jY5r55VW5TRwi9nuvowVwXmfAWUC3OeqGZQKhtOsyFJJqeYJzLeKXQkgk6+fTXp+bW4D
	f6js/FwwzRJVt6CKCRqWP5/HudLxcfTr4nkoHs0EsgV30doFcOY32n22pg/b9Ax7IwrI
	2dX20Xu1tLlKodCDRcmoehHyrshUg4p0lKvI3giXjJmaZw/x4hN4GrtzAtxCbk2RwDs1
	sC5r1bu6B039TR3DGeA4GBjHGeuLEKjis6rGAMl2RtiN3IdBAUzZM/bryENnT0KTd3p1
	15fg==
X-Gm-Message-State: AHPjjUidKOkZyiUsvB2HxjKcrpo0F1xieF9w9dLzKXeUOAJ3tUkBm+Pp
	o/5nmA4TONEMku92yTxM4Q==
X-Google-Smtp-Source: AOwi7QCKaqT/qXm1cGQsm/blcZ3DP1KrCbvG7t0j2l2Ms/hRpz5NQdDYX4n0D71eU6FOck4klqioHw==
X-Received: by 10.237.39.7 with SMTP id n7mr50722221qtd.124.1505772280302;
	Mon, 18 Sep 2017 15:04:40 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id x4sm5278395qkl.74.2017.09.18.15.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 15:04:39 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, peter.maydell@linaro.org
References: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
	<1505762601-27143-5-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <484784df-69d0-5349-4416-03a03884d323@amsat.org>
Date: Mon, 18 Sep 2017 19:04:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505762601-27143-5-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu devel v10 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v2cScMxbjwF5

On 09/18/2017 04:23 PM, Subbaraya Sundeep wrote:
> Smartfusion2 SoC has hardened Microcontroller subsystem
> and flash based FPGA fabric. This patch adds support for
> Microcontroller subsystem in the SoC.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   hw/arm/Makefile.objs            |   1 +
>   hw/arm/msf2-soc.c               | 232 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>   4 files changed, 300 insertions(+)
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
> index 5ee6f7d..a6cf24f 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>   obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>   obj-$(CONFIG_MPS2) += mps2.o
> +obj-$(CONFIG_MSF2) += msf2-soc.o
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> new file mode 100644
> index 0000000..313da5d
> --- /dev/null
> +++ b/hw/arm/msf2-soc.c
> @@ -0,0 +1,232 @@
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
> +#include "hw/misc/unimp.h"
> +
> +#define MSF2_TIMER_BASE       0x40004000
> +#define MSF2_SYSREG_BASE      0x40038000
> +
> +#define ENVM_BASE_ADDRESS     0x60000000
> +
> +#define SRAM_BASE_ADDRESS     0x20000000
> +
> +#define MSF2_ENVM_MAX_SIZE    (512 * K_BYTE)
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
> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM",
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

Here we missed:

     if (!s->m3clk) {
         error_setg(errp, "Invalid m3clk value");
         error_append_hint(errp, "m3clk can not be zero\n");
         return;
     }

Except this fix, this series looks ready to get applied.
Maybe Peter can add this piece of code directly.

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
> +
> +    /* Below devices are not modelled yet. */
> +    create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
> +    create_unimplemented_device("dma", 0x40003000, 0x1000);
> +    create_unimplemented_device("watchdog", 0x40005000, 0x1000);
> +    create_unimplemented_device("i2c_1", 0x40012000, 0x1000);
> +    create_unimplemented_device("gpio", 0x40013000, 0x1000);
> +    create_unimplemented_device("hs-dma", 0x40014000, 0x1000);
> +    create_unimplemented_device("can", 0x40015000, 0x1000);
> +    create_unimplemented_device("rtc", 0x40017000, 0x1000);
> +    create_unimplemented_device("apb_config", 0x40020000, 0x10000);
> +    create_unimplemented_device("emac", 0x40041000, 0x1000);
> +    create_unimplemented_device("usb", 0x40043000, 0x1000);
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
> +    DEFINE_PROP_UINT8("apb0div", MSF2State, apb0div, 2),
> +    DEFINE_PROP_UINT8("apb1div", MSF2State, apb1div, 2),
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
> index 0000000..afea23d
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
> +    uint8_t apb0div;
> +    uint8_t apb1div;
> +
> +    MSF2SysregState sysreg;
> +    MSSTimerState timer;
> +    MSSSpiState spi[MSF2_NUM_SPIS];
> +} MSF2State;
> +
> +#endif
> 
