Received: by 10.25.0.198 with SMTP id 189csp423548lfa;
        Fri, 5 May 2017 16:54:46 -0700 (PDT)
X-Received: by 10.55.156.198 with SMTP id f189mr14769848qke.61.1494028486602;
        Fri, 05 May 2017 16:54:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o50si6209234qtf.76.2017.05.05.16.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 16:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6n3b-0003nE-NW
	for alex.bennee@linaro.org; Fri, 05 May 2017 19:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d6n3U-0003lh-0q
	for qemu-arm@nongnu.org; Fri, 05 May 2017 19:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d6n3S-0000jZ-8L
	for qemu-arm@nongnu.org; Fri, 05 May 2017 19:54:36 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34203)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1d6n3N-0000iS-WD; Fri, 05 May 2017 19:54:30 -0400
Received: by mail-oi0-x242.google.com with SMTP id w10so579226oif.1;
	Fri, 05 May 2017 16:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kcOnLhsVqhXfygAcwYVoE4oy9EOXSrU7m1cim3TWzJI=;
	b=A63R44WteDt7wcDe3votvr74E9lTWu3CJVouk64159HsSAACbum3ad5MD2bdXyGAxA
	pipGwxzW/sidN3+HTe8hrmicWKLk6pD/ShNxL50Mp93TSxDsZ3ziJslkhQ7Wh9e1Qu5t
	X0tWLRBQySpQny4uJCwANUYczjoPNvLclOiSy+7IYG6nBbdSHhuvleTbeqlA/WbSHUfr
	G5g5FI+T8JTnOXs8TiFZ/YH/SSY9TMzyN2YathSSt8zBh59hNlIvHxadjeRvxsuQisdp
	+s04qb51AYgPF85l6gPqZjMQPw7LfRiqpGFf1JRybUtVDfkGNO/b5DTJyTAhpOTrN6kk
	aS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kcOnLhsVqhXfygAcwYVoE4oy9EOXSrU7m1cim3TWzJI=;
	b=ILr9XaRx9cZ8+A4Lu7QqKOE/RnvTYcHvdHmxQEOQ5WdlB+frmlqFVMqT+Zw/H2rD5R
	f4N+rghcUuBO2SgSCioln40AmDXPAmN5xKPZX26SFfCNR3sdbomwyIYOprtFig9TjIfo
	Xp0CmsuBFBMCl0SgNctjAlkxXMffMrlPAfMDquy+L25oKnkjgvmav854RGrngzbY6wMA
	ySN1kooDqfNHReEQyf0cb30TCnUxUU6as54AVg2SLUkQZRFBsLPpF8BRCTH9HCWj5Mnj
	OQQVgFGUniafkjNCG5p/YAdfXneVrJ5MaQg0b44Aim35x+lPg/9p6ieH3oBRKmpuKCyW
	+BvA==
X-Gm-Message-State: AN3rC/4jPYKzEUmvkfuoxY2KujyzxJG8i9xhziS95gsWkd/kUG5SsjJk
	olSQmmNF5CxfffgEsgAxtDclOrPggA==
X-Received: by 10.157.82.87 with SMTP id q23mr16572855otg.52.1494028469007;
	Fri, 05 May 2017 16:54:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.16.163 with HTTP; Fri, 5 May 2017 16:53:58 -0700 (PDT)
In-Reply-To: <CALHRZupOf4KWYnVUSAJPW-MZQBj8LJct_km5Lsn+ci5_FgmNXA@mail.gmail.com>
References: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
	<1493398313-6673-5-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMrCfOkLXBWP-UDboWmPD0Ah6Viv9gFn3WxTUwyxR4thw@mail.gmail.com>
	<CALHRZupOf4KWYnVUSAJPW-MZQBj8LJct_km5Lsn+ci5_FgmNXA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 May 2017 16:53:58 -0700
Message-ID: <CAKmqyKMb=K=jTedaPO=ML0Af+6C8zfP6CfBVnAa=bfMHxmT0bQ@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel RFC v3 4/5] msf2: Add Smartfusion2 SoC.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d8d+Zks9Vbuf

On Fri, May 5, 2017 at 9:14 AM, sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
> Hi Alistair,
>
> On Fri, May 5, 2017 at 3:51 AM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Fri, Apr 28, 2017 at 9:51 AM, Subbaraya Sundeep
>> <sundeep.lkml@gmail.com> wrote:
>>> Smartfusion2 SoC has hardened Microcontroller subsystem
>>> and flash based FPGA fabric. This patch adds support for
>>> Microcontroller subsystem in the SoC.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> ---
>>>  default-configs/arm-softmmu.mak |   1 +
>>>  hw/arm/Makefile.objs            |   2 +-
>>>  hw/arm/msf2_soc.c               | 194 ++++++++++++++++++++++++++++++++++++++++
>>>  include/hw/arm/msf2_soc.h       |  62 +++++++++++++
>>>  4 files changed, 258 insertions(+), 1 deletion(-)
>>>  create mode 100644 hw/arm/msf2_soc.c
>>>  create mode 100644 include/hw/arm/msf2_soc.h
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 78d7af0..7062512 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -122,3 +122,4 @@ CONFIG_ACPI=y
>>>  CONFIG_SMBIOS=y
>>>  CONFIG_ASPEED_SOC=y
>>>  CONFIG_GPIO_KEY=y
>>> +CONFIG_MSF2=y
>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>> index 4c5c4ee..cce2759 100644
>>> --- a/hw/arm/Makefile.objs
>>> +++ b/hw/arm/Makefile.objs
>>> @@ -1,7 +1,7 @@
>>>  obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>>>  obj-$(CONFIG_DIGIC) += digic_boards.o
>>>  obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
>>> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>>> +obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2_soc.o
>>>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>>>  obj-y += netduino2.o
>>> diff --git a/hw/arm/msf2_soc.c b/hw/arm/msf2_soc.c
>>> new file mode 100644
>>> index 0000000..a470872
>>> --- /dev/null
>>> +++ b/hw/arm/msf2_soc.c
>>> @@ -0,0 +1,194 @@
>>> +/*
>>> + * SmartFusion2 SoC emulation.
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to deal
>>> + * in the Software without restriction, including without limitation the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qapi/error.h"
>>> +#include "qemu-common.h"
>>> +#include "hw/arm/arm.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "hw/char/serial.h"
>>> +#include "hw/boards.h"
>>> +#include "sysemu/block-backend.h"
>>> +#include "hw/arm/msf2_soc.h"
>>> +
>>> +#define MSF2_TIMER_BASE       0x40004000
>>> +#define MSF2_SYSREG_BASE      0x40038000
>>> +
>>> +#define MSF2_TIMER_IRQ0       14
>>> +#define MSF2_TIMER_IRQ1       15
>>> +
>>> +static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 , 0x40011000 };
>>
>> Hey Sundeep,
>>
>> From your other patch it sounds like this should just be a single SPI
>> device with to busses, so this will have to be re-worked.
>>
> I may be entirely wrong please correct me. I assumed this SoC and Board file
> are analogous to dtsi and dts in linux. So SoC file will instantiate
> all the controllers
> like SPI0 and SPI1 present in SoC whereas board file will attach slaves present
> on board (like EEPROM, SPI flashes etc.,).  Hence in board file I
> attached flash to
> SPI0. I was expecting one bus for each controller eg:
> SPI0:
>         bus: spi0
>              device: flash (Chip select 0)
>              device: other device (Chip select 1)
> SPI1:
>         bus: spi1
>              device: other device (Chip select 0) (if attached in board file)

That's pretty much each. The SoC should create everything that is on
the SoC. So the SoC should create the SPI controller (which will
create the SPI buses) but not connect anything to them.

Then it's up to the board/machine to connect the SPI devices to the SPI buses.

>
> But this is not the case because am not able to create spi1 bus in
> controller model
> (hw/ssi/msf2_spi.c). How would model know about which
> controller(SPI0/1) is currently
> accessed and use corresponding bus(spi0/spi1) to transfer to slave devices?

I don't know anything about the board, but it sounds like you need to
be able to create the spi1 bus in a single SPI device right?

Otherwise you can do what the ZynqMP board does and create multiple
spi devices and alias spi0,spi1... to the spi0 bus of each device.

Thanks,

Alistair

> If am wrong I will remove SPI1 from SoC.
>
>>> +static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
>>> +
>>> +static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
>>> +static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
>>> +
>>> +static void msf2_soc_initfn(Object *obj)
>>> +{
>>> +    MSF2State *s = MSF2_SOC(obj);
>>> +    int i;
>>> +
>>> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
>>> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
>>> +
>>> +    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
>>> +    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
>>> +
>>> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSF2_TIMER);
>>> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
>>> +
>>> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
>>> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
>>> +                          TYPE_MSF2_SPI);
>>> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
>>> +    }
>>> +}
>>> +
>>> +static void msf2_soc_realize(DeviceState *dev_soc, Error **errp)
>>> +{
>>> +    MSF2State *s = MSF2_SOC(dev_soc);
>>> +    DeviceState *dev, *armv7m;
>>> +    SysBusDevice *busdev;
>>> +    Error *err = NULL;
>>> +    int i;
>>> +
>>> +    MemoryRegion *system_memory = get_system_memory();
>>> +    MemoryRegion *nvm = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
>>> +
>>> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
>>> +                           &error_fatal);
>>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
>>> +                             nvm, 0, ENVM_SIZE);
>>> +    vmstate_register_ram_global(nvm);
>>> +
>>> +    memory_region_set_readonly(nvm, true);
>>> +    memory_region_set_readonly(nvm_alias, true);
>>> +
>>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>>> +
>>> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
>>> +                           &error_fatal);
>>> +    vmstate_register_ram_global(ddr);
>>> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
>>> +
>>> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
>>> +                           &error_fatal);
>>> +    vmstate_register_ram_global(sram);
>>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>>> +
>>> +    armv7m = DEVICE(&s->armv7m);
>>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>> +    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>>> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>>> +                                     "memory", &error_abort);
>>> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
>>> +    if (err != NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +
>>> +    for (i = 0; i < MSF2_NUM_UARTS; i++) {
>>> +        if (serial_hds[i]) {
>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>> +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
>>> +        }
>>> +    }
>>> +
>>> +    dev = DEVICE(&s->timer);
>>> +    qdev_prop_set_uint32(dev, "clock-frequency", 83 * 1000000);
>>
>> Macro for the frequency.
>>
> Yeah will change.
>
>>> +    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
>>> +    if (err != NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    busdev = SYS_BUS_DEVICE(dev);
>>> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
>>> +    sysbus_connect_irq(busdev, 0,
>>> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));
>>> +    sysbus_connect_irq(busdev, 1,
>>> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));
>>> +
>>> +    dev = DEVICE(&s->sysreg);
>>> +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized", &err);
>>> +    if (err != NULL) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    busdev = SYS_BUS_DEVICE(dev);
>>> +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
>>> +
>>> +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
>>> +        gchar *bus_name = g_strdup_printf("spi%d", i);
>>> +
>>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
>>> +        if (err != NULL) {
>>> +            g_free(bus_name);
>>> +            error_propagate(errp, err);
>>> +            return;
>>> +        }
>>> +
>>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>>> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
>>> +
>>> +        /* Alias controller SPI bus to the SoC itself */
>>> +        object_property_add_alias(OBJECT(s), bus_name,
>>> +                                  OBJECT(&s->spi[i]), "spi0",
>>> +                                  &error_abort);
>>> +        g_free(bus_name);
>>> +    }
>>> +}
>>> +
>>> +static Property msf2_soc_properties[] = {
>>> +    DEFINE_PROP_STRING("cpu-model", MSF2State, cpu_model),
>>
>> Does this actually change?
>>
> No. I will remove the property.
>
>> This looks pretty good, just a few things to fix up.
>>
>
> Thank you,
> Sundeep
>
>> Thanks,
>>
>> Alistair
>>
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void msf2_soc_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +
>>> +    dc->realize = msf2_soc_realize;
>>> +    dc->props = msf2_soc_properties;
>>> +}
>>> +
>>> +static const TypeInfo msf2_soc_info = {
>>> +    .name          = TYPE_MSF2_SOC,
>>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(MSF2State),
>>> +    .instance_init = msf2_soc_initfn,
>>> +    .class_init    = msf2_soc_class_init,
>>> +};
>>> +
>>> +static void msf2_soc_types(void)
>>> +{
>>> +    type_register_static(&msf2_soc_info);
>>> +}
>>> +
>>> +type_init(msf2_soc_types)
>>> diff --git a/include/hw/arm/msf2_soc.h b/include/hw/arm/msf2_soc.h
>>> new file mode 100644
>>> index 0000000..1184d9a
>>> --- /dev/null
>>> +++ b/include/hw/arm/msf2_soc.h
>>> @@ -0,0 +1,62 @@
>>> +/*
>>> + * Microsemi Smartfusion2 SoC
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to deal
>>> + * in the Software without restriction, including without limitation the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef HW_ARM_MSF2_SOC_H
>>> +#define HW_ARM_MSF2_SOC_H
>>> +
>>> +#include "hw/misc/msf2_sysreg.h"
>>> +#include "hw/timer/msf2_timer.h"
>>> +#include "hw/ssi/msf2_spi.h"
>>> +#include "hw/arm/armv7m.h"
>>> +
>>> +#define TYPE_MSF2_SOC     "msf2-soc"
>>> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
>>> +
>>> +#define MSF2_NUM_SPIS         2
>>> +#define MSF2_NUM_UARTS        2
>>> +
>>> +#define ENVM_BASE_ADDRESS     0x60000000
>>> +#define ENVM_SIZE             (128 * 1024)
>>> +
>>> +#define DDR_BASE_ADDRESS      0xA0000000
>>> +#define DDR_SIZE              (64 * 1024 * 1024)
>>> +
>>> +#define SRAM_BASE_ADDRESS     0x20000000
>>> +#define SRAM_SIZE             (64 * 1024)
>>> +
>>> +typedef struct MSF2State {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +    /*< public >*/
>>> +
>>> +    char *cpu_model;
>>> +
>>> +    ARMv7MState armv7m;
>>> +
>>> +    MSF2SysregState sysreg;
>>> +    MSF2TimerState timer;
>>> +    MSF2SpiState spi[MSF2_NUM_SPIS];
>>> +} MSF2State;
>>> +
>>> +#endif
>>> --
>>> 2.5.0
>>>
