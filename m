Received: by 10.25.0.144 with SMTP id 138csp1218770lfa;
        Mon, 17 Apr 2017 03:44:29 -0700 (PDT)
X-Received: by 10.200.56.56 with SMTP id q53mr9131177qtb.105.1492425869814;
        Mon, 17 Apr 2017 03:44:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k25si10546530qtk.308.2017.04.17.03.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 03:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d048z-0007p0-9h
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 06:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d048s-0007nQ-Cx
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 06:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d048q-000781-Ec
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 06:44:22 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:36709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d048m-00075u-R7; Mon, 17 Apr 2017 06:44:16 -0400
Received: by mail-yw0-x243.google.com with SMTP id 203so9718039ywk.3;
	Mon, 17 Apr 2017 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SXiXDTWS2ADdDYDXWkjarpE+bk10+zmgfu3/SPPKAt0=;
	b=V8BkZIX/m9yF0/ZgqLSSvoZjZRas5cng+GjwlTuEs6myVlH0HA8iVsExLNYlbeSZhQ
	cKn8yOIX04ET8ebvSeAgyv7yCezglKqkqo8B7QHqEuDiBpNdw4FxGb2K4nuz569NZlP3
	NDLQ3LHJnji5vd0LM+vMM66vIxI7oBZchLAd/Bkp24Qy3+nBYp22+fzAI9OW8susZ45T
	abW353X2zntmb7DeiHkKpjeUeU4EBpsDXnus+tu+hdOqsjcQ113CmPYH64E21Jsa9yTJ
	QGDsSFWDpHrBkjQ8XH7g1Nf3eWL2TQiQtwHl6bFJYv4uBA1cMeVq5RnSVFObyPkJSjza
	rk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SXiXDTWS2ADdDYDXWkjarpE+bk10+zmgfu3/SPPKAt0=;
	b=OtElI2JF2NuI+ul2k23Jo75Qjz3uCbSKiHx+WC2uoJjeJJvzIQ3a7n5bxrEyO18wI3
	Op8xe7uLi8ldTxzWNGZBOOQCeGIozP4oTZJa8NFzx0KmJqnHMoiv0/3V77i0JkVKHUW4
	jG/sQZyF3tRYZnAU5mhLaD6ffkNNYZJ2lTLwsLugGxgqu5v+yRqSOlJ1baDZuRaKhAvu
	xfTlLFc41xcMv5tg68fSYyDT943KcsnmsLa18q+Sb9wDPil7gjwqwsHWIjqwgl1XB/EP
	zb5V/H+ZsMNRCj/rWi5fP1AaAQFmubJYhtpREcYUSwV3+bp7zk3L3v30YxbeipSF+GOH
	as8A==
X-Gm-Message-State: AN3rC/60VuTXHAIrGB/SZ8f+hOMoyHzgN8HMEnUZaYPOdexYA2ENrPDP
	wdMS2jZ89WKanYfihQyJRoMTLnjpAg==
X-Received: by 10.13.209.70 with SMTP id t67mr15418917ywd.148.1492425856072;
	Mon, 17 Apr 2017 03:44:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Mon, 17 Apr 2017 03:44:15 -0700 (PDT)
In-Reply-To: <CAKmqyKPAwL27-ina2X4DUJ-x_POTqRdf5HAr1mNUVYQBeUAjPQ@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-5-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPAwL27-ina2X4DUJ-x_POTqRdf5HAr1mNUVYQBeUAjPQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 17 Apr 2017 16:14:15 +0530
Message-ID: <CALHRZuo3s-NRXPpJvfkkaf7FzNoyv2uSmox-nhycSz1x+r6fGg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 4/4] msf2: Add
 Emcraft's Smartfusion2 SOM kit.
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
X-TUID: LEhfW5sQ81yQ

Hii Alistair,

On Sat, Apr 15, 2017 at 2:42 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Sun, Apr 9, 2017 at 4:19 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
>> Emulated Emcraft's Smartfusion2 System On Module starter
>> kit.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>
> Hey Sundeep,
>
> Cool patch, I have some comments below.
>
>> ---
>>  default-configs/arm-softmmu.mak |   1 +
>>  hw/arm/Makefile.objs            |   2 +-
>>  hw/arm/msf2_soc.c               | 141 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 143 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/msf2_soc.c
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index 1e3bd2b..379f7e1 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -121,3 +121,4 @@ CONFIG_ACPI=y
>>  CONFIG_SMBIOS=y
>>  CONFIG_ASPEED_SOC=y
>>  CONFIG_GPIO_KEY=y
>> +CONFIG_MSF2=y
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 4c5c4ee..cce2759 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -1,7 +1,7 @@
>>  obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>>  obj-$(CONFIG_DIGIC) += digic_boards.o
>>  obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
>> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>> +obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2_soc.o
>>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>>  obj-y += netduino2.o
>> diff --git a/hw/arm/msf2_soc.c b/hw/arm/msf2_soc.c
>> new file mode 100644
>> index 0000000..7277b51
>> --- /dev/null
>> +++ b/hw/arm/msf2_soc.c
>> @@ -0,0 +1,141 @@
>> +/*
>> + * Smartfusion2 SOM starter kit(from Emcraft) emulation.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
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
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "hw/arm/arm.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/char/serial.h"
>> +#include "hw/boards.h"
>> +#include "sysemu/block-backend.h"
>> +#include "hw/ssi/ssi.h"
>> +
>> +#define MSF2_NUM_USARTS       1
>> +#define MSF2_NUM_TIMERS       2
>> +
>> +#define ENVM_BASE_ADDRESS     0x60000000
>> +#define ENVM_SIZE             (128 * 1024)
>> +
>> +#define DDR_BASE_ADDRESS      0xA0000000
>> +#define DDR_SIZE              (64 * 1024 * 1024)
>> +
>> +#define SRAM_BASE_ADDRESS     0x20000000
>> +#define SRAM_SIZE             (64 * 1024)
>> +
>> +#define MSF2_TIMER_BASE       0x40004000
>> +#define MSF2_UART0_BASE       0x40000000
>> +#define MSF2_SYSREG_BASE      0x40038000
>> +#define MSF2_SPI0_BASE        0x40001000
>> +
>> +#define MSF2_SPI0_IRQ         2
>> +#define MSF2_UART0_IRQ        10
>> +#define MSF2_TIMER_IRQ0       14
>> +#define MSF2_TIMER_IRQ1       15
>> +
>> +static void msf2_init(MachineState *machine)
>> +{
>> +    const char *kernel_filename = NULL;
>> +    DeviceState *dev, *nvic;
>> +    MemoryRegion *system_memory = get_system_memory();
>> +    MemoryRegion *nvm = g_new(MemoryRegion, 1);
>> +    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
>> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
>> +    QemuOpts *machine_opts = qemu_get_machine_opts();
>> +    SysBusDevice *busdev;
>> +    DriveInfo *dinfo = drive_get_next(IF_MTD);
>> +    qemu_irq cs_line;
>> +    SSIBus *spi;
>> +
>> +    kernel_filename = qemu_opt_get(machine_opts, "kernel");
>
> You can just get the kernel filename directly from: machine->kernel_filename
>
I have to check again. I remember getting NULL from machine->kernel_filename.
I will comment on this again.
>> +
>> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
>> +                           &error_fatal);
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
>> +                             nvm, 0, ENVM_SIZE);
>> +    vmstate_register_ram_global(nvm);
>> +
>> +    memory_region_set_readonly(nvm, true);
>> +    memory_region_set_readonly(nvm_alias, true);
>> +
>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>> +
>> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
>> +                           &error_fatal);
>> +    vmstate_register_ram_global(ddr);
>> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
>> +
>> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
>> +                           &error_fatal);
>> +    vmstate_register_ram_global(sram);
>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>> +
>> +    nvic = armv7m_init(system_memory, ENVM_SIZE, 96,
>> +                       kernel_filename, "cortex-m3");
>> +
>> +       if (serial_hds[0]) {
>> +                serial_mm_init(get_system_memory(), MSF2_UART0_BASE, 2,
>> +                       qdev_get_gpio_in(nvic, MSF2_UART0_IRQ),
>> +                       115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
>> +    }
>> +    dev = qdev_create(NULL, "msf2-timer");
>> +    qdev_prop_set_uint32(dev, "clock-frequency", 83 * 1000000);
>> +    qdev_init_nofail(dev);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MSF2_TIMER_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
>> +                           qdev_get_gpio_in(nvic, MSF2_TIMER_IRQ0));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1,
>> +                           qdev_get_gpio_in(nvic, MSF2_TIMER_IRQ1));
>> +
>> +    dev = qdev_create(NULL, "msf2-sysreg");
>> +    qdev_init_nofail(dev);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MSF2_SYSREG_BASE);
>> +
>> +    dev = qdev_create(NULL, "msf2-spi");
>> +    qdev_init_nofail(dev);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_mmio_map(busdev, 0, MSF2_SPI0_BASE);
>> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, MSF2_SPI0_IRQ));
>> +
>> +    spi = (SSIBus *)qdev_get_child_bus(dev, "spi");
>> +    dev = ssi_create_slave_no_init(spi, "s25sl12801");
>> +    qdev_prop_set_uint8(dev, "spansion-cr2nv", 1);
>> +    if (dinfo)
>> +               qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
>> +                                    &error_fatal);
>> +    qdev_init_nofail(dev);
>> +    cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>> +    sysbus_connect_irq(busdev, 1, cs_line);
>
> Instead of calling all of these in the init function you should split
> it up over the machines init and realize function.
>
> Look at the stm32f205_soc or xlnx-zynqmp files for examples of how to do this.
>
> It also moves away from calling qdev_create() and qdev_init_nofail()
> and instead manually creates the objects.
>
I am still learning all these. Please correct me if am wrong.
I need to create a SoC file and a board file like stm32f205 and
xlnx-zynqmp now right?

> Otherwise this patch looks pretty good.

Thank you :)
Sundeep

>
> Thanks,
>
> Alistair
>
>> +}
>> +
>> +static void msf2_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
>> +    mc->init = msf2_init;
>> +}
>> +
>> +DEFINE_MACHINE("smartfusion2-som", msf2_machine_init)
>> --
>> 2.5.0
>>
>>
