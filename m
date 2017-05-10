Received: by 10.25.0.6 with SMTP id 6csp246703lfa;
        Wed, 10 May 2017 04:50:33 -0700 (PDT)
X-Received: by 10.55.110.70 with SMTP id j67mr4638855qkc.145.1494417033725;
        Wed, 10 May 2017 04:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494417033; cv=none;
        d=google.com; s=arc-20160816;
        b=TLTF6vt5qpUcTX/AIrlLaJUGe/SVYA8ISyvViGKAotyjMFpuOkqdF96VYUdcF2NYsG
         MTXhy0ZKMKAhlMgzHvMS/hE/6Hi0lw1wkorE64JraLzyy78DzyBfRvLTDptfqtFTvB1E
         ZcT5k2lLYXJ9NU8yFeurMIngXYlUatMvztcCq+T/o4BiAIigUU43ovUjMqgDsf5MRDD9
         BW9lCGwUoLILGhphKlrSkMrQFwy/f6V6uFNAxjjz2RitzLZ0avPa/CE78+l0+ASNziZO
         7u44CXjPGtJIBGHvHq4R9HYarPD+8BG6HnzMlY07r/1fMbcScQjTRO7WMxopR2ou+Ofw
         Fvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=G0hHcS0V8GR5u9yukDzMcst7ugE3XBixsrh2kGAnm+8=;
        b=Q9X/FJKSIi0mnlAnnflmqtoyj7cjeGyWsOz/WuyBkTh5m+zPoAqqVm8yk/kn9xWN+6
         IQl/keBkjSg7F1f71Yn8uKVGeLf1ylTsxNHk1g48b080qK9JT8InYUHzQYiK3iNfjTUD
         cqvzsfa7l2GiUnT2oEtue2Y362DRJlgDf3YkDawFquu/4L5ZdEeWwv0CQQ8IoQ+y1Ckd
         4X7vUu5m9o4YLoZMfXDDO/G9BchaZOMt4tUEStCxkwPjYfFE+zHjFUQEVSGSovY6Uzur
         qGmP9QF7DqpRIHWiQmlqVXHEa5BXFlitc2X5j/U2fLkt/xGPPxowmqnt3/HbIvKTM3fq
         w6iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si2991735qkd.110.2017.05.10.04.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Q8X-0007TF-5f
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Q8R-0007Sz-06
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Q8M-0000dw-0t
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:50:27 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Q8L-0000dd-SH; Wed, 10 May 2017 07:50:21 -0400
Received: by mail-qt0-x244.google.com with SMTP id l39so3783407qtb.1;
	Wed, 10 May 2017 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=G0hHcS0V8GR5u9yukDzMcst7ugE3XBixsrh2kGAnm+8=;
	b=VJGXRAmmQS9Rr9MSuEc2+WSjDsFXj8rQMV+o9o7se5fx7mUYEtvTQz2O6qFLpjV1YP
	68zyLwjHyTuq4yUabMq5iGkDvDqMRMNV79gG72Rz6kS4iEPi27hA15vRKNji3hZ+Q6Oz
	tRgq2FlC8Fj04geBLrnIqqp3M0p8kdWPYy+4aWcSDTLxrFqRYjXLoo7kCynjf1qaL8FC
	6NNaWzrRB3r6u4S8v+d19XXbC4+dUIzcbQtDIpAtMa+DRlNU/uOn+njeMfBj4WHdyAYk
	XYwELrhgewVQRKQDG6OxdSgoQYTvBqulM/dWLA/HikHpe6aJIjHviqeqeIXjX81zQLDB
	j75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=G0hHcS0V8GR5u9yukDzMcst7ugE3XBixsrh2kGAnm+8=;
	b=HCHzZRbZOclOeUOpOogK58YVifVtcPxVaQu08aOfMMyOLL0apChIgRWTE/n3RpufP+
	ixBG3AjUcTAew7usGjzdUJ3T6dQSSRfu/dZ2hIxXDsb7uuZljKKvV639SZKfbagt0nj2
	p/XdB3bantPEr1Xp/+oKBqdMqSahU/V+e8n9LQsyJ6m7cUEJzDwYundlwTnLwxjhI1ml
	/ElUrrXqBMUVt4mR/T77xL1AgV2ZKhgFd+366oNw52PVMPTZ+OR+7upKkK3+/alvGGqd
	lcCi1GXa6KDfARlJ2jOaqZPq6KJF6pWjEeY63rh2oS/DVW/scUcbkdI23ebHI67MLHN9
	ngcA==
X-Gm-Message-State: AODbwcDYiom95TKNy6peVZkdGy5L80TJ7JFc0O+n0JDsULajia4jjas/
	XMlyVCghFrQp3g==
X-Received: by 10.200.53.200 with SMTP id l8mr5437690qtb.7.1494417021098;
	Wed, 10 May 2017 04:50:21 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	w69sm1989007qkb.19.2017.05.10.04.50.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 04:50:20 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-5-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b913e666-8df3-714f-3ff9-e8f4ff9e7098@amsat.org>
Date: Wed, 10 May 2017 08:50:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494348286-10253-5-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel PATCH 4/5] msf2: Add
 Smartfusion2 SoC.
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
X-TUID: 3so4D1ZXO7Jf

Hi Subbaraya,

On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
> Smartfusion2 SoC has hardened Microcontroller subsystem
> and flash based FPGA fabric. This patch adds support for
> Microcontroller subsystem in the SoC.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   2 +-
>  hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/msf2-soc.h       |  60 +++++++++++++
>  4 files changed, 250 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/msf2-soc.c
>  create mode 100644 include/hw/arm/msf2-soc.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 78d7af0..7062512 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -122,3 +122,4 @@ CONFIG_ACPI=y
>  CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_GPIO_KEY=y
> +CONFIG_MSF2=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 4c5c4ee..ae5e4a3 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,7 +1,7 @@
>  obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>  obj-$(CONFIG_DIGIC) += digic_boards.o
>  obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
> +obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-soc.o

Not a big deal, but since you added CONFIG_MSF2 why not using it here 
and the Makefiles you touched (misc/ssi/timer)?

obj-$(CONFIG_MSF2) += msf2-soc.o

>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-y += netduino2.o
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> new file mode 100644
> index 0000000..d6341a2
> --- /dev/null
> +++ b/hw/arm/msf2-soc.c
> @@ -0,0 +1,188 @@
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
> +#include "hw/arm/msf2-soc.h"
> +
> +#define MSF2_TIMER_BASE       0x40004000
> +#define MSF2_SYSREG_BASE      0x40038000
> +
> +#define MSF2_TIMER_IRQ0       14
> +#define MSF2_TIMER_IRQ1       15
> +
> +static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 , 0x40011000 };
> +static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
> +
> +static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
> +static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
> +
> +static void msf2_soc_initfn(Object *obj)
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
> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSF2_TIMER);
> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
> +
> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> +                          TYPE_MSF2_SPI);
> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +    }
> +}
> +
> +static void msf2_soc_realize(DeviceState *dev_soc, Error **errp)
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
> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
> +                           &error_fatal);

Maybe you can name it "eNVM" to match the documentation.

Also envm_size should be a per-model property.

> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
> +                             nvm, 0, ENVM_SIZE);

Hmmm well this would be the "Cache Matrix Remap" which happens to be 
mapped by default to eNVM on cold reset.
Naming it "MSF2.flash.alias" is pretty confusing.

> +    vmstate_register_ram_global(nvm);
> +
> +    memory_region_set_readonly(nvm, true);
> +    memory_region_set_readonly(nvm_alias, true);
> +
> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
> +
> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
> +                           &error_fatal);

Wrong, there is no DDR on this SoC.

> +    vmstate_register_ram_global(ddr);
> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
> +
> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
> +                           &error_fatal);

I'd rather like to see it named "eSRAM" somehow, so there is no 
confusion possible with external SRAM a SoM/board can map at 0x60000000.

Same comment than envm_size, sram_size should be a per-model property.

> +    vmstate_register_ram_global(sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);

Can you point me to your datasheet? I thought the SF2 had 240 IRQs.

> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> +                                     "memory", &error_abort);
> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
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
> +    qdev_prop_set_uint32(dev, "clock-frequency", MSF2_TIMER_FREQ);
> +    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
> +    sysbus_connect_irq(busdev, 0,
> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));
> +    sysbus_connect_irq(busdev, 1,
> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));
> +
> +    dev = DEVICE(&s->sysreg);
> +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
> +
> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> +        gchar *bus_name = g_strdup_printf("spi%d", i);
> +
> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
> +        if (err != NULL) {
> +            g_free(bus_name);
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
> +
> +        /* Alias controller SPI bus to the SoC itself */
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->spi[i]), "spi0",
> +                                  &error_abort);
> +        g_free(bus_name);
> +    }
> +}
> +
> +static void msf2_soc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = msf2_soc_realize;
> +}
> +
> +static const TypeInfo msf2_soc_info = {
> +    .name          = TYPE_MSF2_SOC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MSF2State),
> +    .instance_init = msf2_soc_initfn,
> +    .class_init    = msf2_soc_class_init,
> +};
> +
> +static void msf2_soc_types(void)
> +{
> +    type_register_static(&msf2_soc_info);
> +}
> +
> +type_init(msf2_soc_types)
> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
> new file mode 100644
> index 0000000..29a8ff8
> --- /dev/null
> +++ b/include/hw/arm/msf2-soc.h
> @@ -0,0 +1,60 @@
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
> +#include "hw/misc/msf2-sysreg.h"
> +#include "hw/timer/msf2-timer.h"
> +#include "hw/ssi/msf2-spi.h"
> +#include "hw/arm/armv7m.h"
> +
> +#define TYPE_MSF2_SOC     "msf2-soc"
> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
> +
> +#define MSF2_NUM_SPIS         2
> +#define MSF2_NUM_UARTS        2
> +
> +#define ENVM_BASE_ADDRESS     0x60000000
> +#define ENVM_SIZE             (128 * 1024)

The SoC design ENVM_SIZE is 1MB, 128K seems your particular model.

> +
> +#define DDR_BASE_ADDRESS      0xA0000000
> +#define DDR_SIZE              (64 * 1024 * 1024)

This belongs to the SoM.

> +
> +#define SRAM_BASE_ADDRESS     0x20000000
> +#define SRAM_SIZE             (64 * 1024)

Indeed this SoC is designed to have up to 64K of SRAM.
Luckily your model provides 64K.

> +
> +typedef struct MSF2State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    ARMv7MState armv7m;
> +
> +    MSF2SysregState sysreg;
> +    MSF2TimerState timer;
> +    MSF2SpiState spi[MSF2_NUM_SPIS];
> +} MSF2State;
> +
> +#endif
>
