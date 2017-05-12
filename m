Received: by 10.25.0.6 with SMTP id 6csp44124lfa;
        Thu, 11 May 2017 20:18:57 -0700 (PDT)
X-Received: by 10.55.201.10 with SMTP id q10mr1849967qki.4.1494559137359;
        Thu, 11 May 2017 20:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494559137; cv=none;
        d=google.com; s=arc-20160816;
        b=XCxyBoA7iG82PMl3OKqROWHgQ/q4ObAXTE7liKFtQDAiLTM9x4eUn/BdWWZfYS4tgm
         7g9C8eWaJId3G0QiqK4k6eSBqYuASLXtepySl6wp0/VnEcEutc+XSWagxtfnnU6EsaAL
         c9N8J8+zsMq5PxIEY74FRpQnPiQi7jJtUindvhidN7HqJR5Ug+5EyBiorrLsRq19+oY9
         iU+FP7wOJR+Nfgh7AIGQLMhMTDqwEPCW7b3wjmZX8BeHshVGhiWJkIsQwgymOxHHMhd4
         gErJzeTfHGix8eA254qeek7efcWvQB6zXGvqsZRB7zoNZva6H//JMQD1ijbu3S2q2fz1
         Sd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=M0Mc0YoK1l/oRToSEppZ7Vw/kbMdPlI33iDRRFHaCqQ=;
        b=rP/4LPGve907FO74KT/UgcDDKMWv/hued518if1UDrStB2iTmMYHr4YSq+vWXCysx0
         WlJ67TKvbifdEdxl+3huG+jM0ey9TzFdNkILxq3OM7JDU/LogDds2/4/htsXmguK0aJg
         l1FEppLYwNkFG3tQBxCpCS/knbPoa/pKSNdpO5+GljT+T7Ze1LQhNShriRgs+fYuUs6c
         7H4cd65Du1a9B+L4PCz9mDb2gmZLmP+gTo5IIIujMfQYqoyolSwOxlnl18ooSHHwv4mz
         dfvVHtrXl9dnZcikdSzWa7Blk44ZL7UzDikpyMjl+Nz51ne/Dkq6qCIvwW6zAMMmZPVf
         2CfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si2165332qtc.37.2017.05.11.20.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 20:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d916W-0003Vq-Qg
	for alex.bennee@linaro.org; Thu, 11 May 2017 23:18:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d915b-0003Ca-5M
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d915X-00023i-PT
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:17:59 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:36293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d915X-00023A-FG; Thu, 11 May 2017 23:17:55 -0400
Received: by mail-yb0-x241.google.com with SMTP id n198so114995yba.3;
	Thu, 11 May 2017 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kO679Gaz5uDjLOuZo1gN2nUb26U8B4X85q7qFLZjbsQ=;
	b=EcgY3drLVjaNUS+8E6gw6N8lyBqxFqLQ3ZJWDjKZy0Qd2gP4Kk3TQkJLvguO8cS44+
	sfzetw/1bUMBz6oOVZTq3zt9kdEt5Y1YZ7V9HhvDIeuEW6PU5g4wT68naxkR3/QQawhr
	3U5LKpg6H0/jDCLyfw0h4eF5RCGBM667QNASAyGaEKTdywg5MhButESQhmuJZOniPloJ
	SJoKFTGXg0kEqQDTYVFL/vp7QcTYQF7Wf820kY96YrWKLXgduDYPLW/2l3rIfbpTYO4f
	NjE+aG79VNiYSSTTJSPNyq38coJPvKJipdgp0JAw/93s6piQUQk1vRC/bq5cZO37i9k4
	qoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kO679Gaz5uDjLOuZo1gN2nUb26U8B4X85q7qFLZjbsQ=;
	b=CLwWZrzz5Ysn0JXZoHwmlBV4CmKdbR0l3L6eoqlOPBSjsdzMgfhkecfxrLKFZ6eOnH
	xSoi8dxMXlsi2l/3zlfoEgZPVGBYE4BcoLWp+i8ENhDNceYmwc13rFY1lFnEG7Wx5tQ6
	gzEFdW6KAwpmIV3yOuQ3is+KCxpEmqg7LuKq4DtxIvJConKlJcTT3aUV8KE8UFvIrOjb
	fMiOtiWsg488bKjFRXaj9/FLxeT/nfQD545FwUVuR/zcZtiAiml+Q49g+ALosB1LBDeU
	SSOLLR7XDT8iDBQlOPE20F9gjtYI3gqEQLQz+bIXPGjAKwv1iRlr7Wci/3GRDpfCldZI
	I9Fw==
X-Gm-Message-State: AODbwcCPW8oHQCvGuN+8CO3RWJ+dRCJoTCN5HYryQfFANyTNWPPexahO
	23Lydjs4P8KO3j4qCCeut9sCCO9dvw==
X-Received: by 10.37.164.69 with SMTP id f63mr1522570ybi.78.1494559074524;
	Thu, 11 May 2017 20:17:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Thu, 11 May 2017 20:17:53 -0700 (PDT)
In-Reply-To: <b913e666-8df3-714f-3ff9-e8f4ff9e7098@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-5-git-send-email-sundeep.lkml@gmail.com>
	<b913e666-8df3-714f-3ff9-e8f4ff9e7098@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 12 May 2017 08:47:53 +0530
Message-ID: <CALHRZuptHwyzu0Y98VWnNd785W80AZ=+1cr_rfegvDo5amh+3g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-devel PATCH 4/5] msf2: Add Smartfusion2 SoC.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvLjeGGFGf9O

Hi Philippe,

On Wed, May 10, 2017 at 5:20 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
>
> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>
>> Smartfusion2 SoC has hardened Microcontroller subsystem
>> and flash based FPGA fabric. This patch adds support for
>> Microcontroller subsystem in the SoC.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  default-configs/arm-softmmu.mak |   1 +
>>  hw/arm/Makefile.objs            |   2 +-
>>  hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++++++++++++
>> ++++++++++
>>  include/hw/arm/msf2-soc.h       |  60 +++++++++++++
>>  4 files changed, 250 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/msf2-soc.c
>>  create mode 100644 include/hw/arm/msf2-soc.h
>>
>> diff --git a/default-configs/arm-softmmu.mak
>> b/default-configs/arm-softmmu.mak
>> index 78d7af0..7062512 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -122,3 +122,4 @@ CONFIG_ACPI=3Dy
>>  CONFIG_SMBIOS=3Dy
>>  CONFIG_ASPEED_SOC=3Dy
>>  CONFIG_GPIO_KEY=3Dy
>> +CONFIG_MSF2=3Dy
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 4c5c4ee..ae5e4a3 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -1,7 +1,7 @@
>>  obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>>  obj-$(CONFIG_DIGIC) +=3D digic_boards.o
>>  obj-y +=3D integratorcp.o mainstone.o musicpal.o nseries.o
>> -obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o
>> +obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-soc.o
>>
>
> Not a big deal, but since you added CONFIG_MSF2 why not using it here and
> the Makefiles you touched (misc/ssi/timer)?
>
> obj-$(CONFIG_MSF2) +=3D msf2-soc.o
>
>   OK. Will change it.

>
>  obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>  obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
>>  obj-y +=3D netduino2.o
>> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
>> new file mode 100644
>> index 0000000..d6341a2
>> --- /dev/null
>> +++ b/hw/arm/msf2-soc.c
>> @@ -0,0 +1,188 @@
>> +/*
>> + * SmartFusion2 SoC emulation.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "hw/arm/arm.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/char/serial.h"
>> +#include "hw/boards.h"
>> +#include "sysemu/block-backend.h"
>> +#include "hw/arm/msf2-soc.h"
>> +
>> +#define MSF2_TIMER_BASE       0x40004000
>> +#define MSF2_SYSREG_BASE      0x40038000
>> +
>> +#define MSF2_TIMER_IRQ0       14
>> +#define MSF2_TIMER_IRQ1       15
>> +
>> +static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 ,
>> 0x40011000 };
>> +static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 ,
>> 0x40010000 };
>> +
>> +static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };
>> +static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };
>> +
>> +static void msf2_soc_initfn(Object *obj)
>> +{
>> +    MSF2State *s =3D MSF2_SOC(obj);
>> +    int i;
>> +
>> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
>> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
>> +
>> +    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
>> +    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
>> +
>> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSF2_TIMER);
>> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
>> +
>> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
>> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
>> +                          TYPE_MSF2_SPI);
>> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
>> +    }
>> +}
>> +
>> +static void msf2_soc_realize(DeviceState *dev_soc, Error **errp)
>> +{
>> +    MSF2State *s =3D MSF2_SOC(dev_soc);
>> +    DeviceState *dev, *armv7m;
>> +    SysBusDevice *busdev;
>> +    Error *err =3D NULL;
>> +    int i;
>> +
>> +    MemoryRegion *system_memory =3D get_system_memory();
>> +    MemoryRegion *nvm =3D g_new(MemoryRegion, 1);
>> +    MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);
>> +    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
>> +    MemoryRegion *ddr =3D g_new(MemoryRegion, 1);
>> +
>> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
>> +                           &error_fatal);
>>
>
> Maybe you can name it "eNVM" to match the documentation.
>
> Also envm_size should be a per-model property.
>

Ok.

>
> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
>> +                             nvm, 0, ENVM_SIZE);
>>
>
> Hmmm well this would be the "Cache Matrix Remap" which happens to be
> mapped by default to eNVM on cold reset.
> Naming it "MSF2.flash.alias" is pretty confusing.
>

Exactly it is Cache Matrix Remap.
AFAIK currently we cannot remap memory during runtime in Qemu.
So I handled default remap with alias.
Please suggest the name. MSF2.eNVM.alias sounds fine?

>
> +    vmstate_register_ram_global(nvm);
>> +
>> +    memory_region_set_readonly(nvm, true);
>> +    memory_region_set_readonly(nvm_alias, true);
>> +
>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>> +
>> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
>> +                           &error_fatal);
>>
>
> Wrong, there is no DDR on this SoC.
>
DDR controller is there in Smartfusion2 (different from Smartfusion). As
you said below this
should be in board file.

>
> +    vmstate_register_ram_global(ddr);
>> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
>> +
>> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
>> +                           &error_fatal);
>>
>
> I'd rather like to see it named "eSRAM" somehow, so there is no confusion
> possible with external SRAM a SoM/board can map at 0x60000000.
>
> Same comment than envm_size, sram_size should be a per-model property.
>
> OK

> +    vmstate_register_ram_global(sram);
>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram)=
;
>> +
>> +    armv7m =3D DEVICE(&s->armv7m);
>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>
>
> Can you point me to your datasheet? I thought the SF2 had 240 IRQs.


Please go to link:
https://www.microsemi.com/document-portal/search_form
and provide search keyword as "UG0331". You can the download the spec.
It has 81 irqs I remember when I have given 81 qemu complained not multiple
of 4.
I checked again with 81 and it is fine. I will change it to 81.

+    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
>> +    object_property_set_link(OBJECT(&s->armv7m),
>> OBJECT(get_system_memory()),
>> +                                     "memory", &error_abort);
>> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized",
>> &err);
>> +    if (err !=3D NULL) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +
>> +    for (i =3D 0; i < MSF2_NUM_UARTS; i++) {
>> +        if (serial_hds[i]) {
>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>> +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN)=
;
>> +        }
>> +    }
>> +
>> +    dev =3D DEVICE(&s->timer);
>> +    qdev_prop_set_uint32(dev, "clock-frequency", MSF2_TIMER_FREQ);
>> +    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err)=
;
>> +    if (err !=3D NULL) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    busdev =3D SYS_BUS_DEVICE(dev);
>> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
>> +    sysbus_connect_irq(busdev, 0,
>> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));
>> +    sysbus_connect_irq(busdev, 1,
>> +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));
>> +
>> +    dev =3D DEVICE(&s->sysreg);
>> +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized",
>> &err);
>> +    if (err !=3D NULL) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    busdev =3D SYS_BUS_DEVICE(dev);
>> +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
>> +
>> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
>> +        gchar *bus_name =3D g_strdup_printf("spi%d", i);
>> +
>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
>> &err);
>> +        if (err !=3D NULL) {
>> +            g_free(bus_name);
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
>> +
>> +        /* Alias controller SPI bus to the SoC itself */
>> +        object_property_add_alias(OBJECT(s), bus_name,
>> +                                  OBJECT(&s->spi[i]), "spi0",
>> +                                  &error_abort);
>> +        g_free(bus_name);
>> +    }
>> +}
>> +
>> +static void msf2_soc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D msf2_soc_realize;
>> +}
>> +
>> +static const TypeInfo msf2_soc_info =3D {
>> +    .name          =3D TYPE_MSF2_SOC,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(MSF2State),
>> +    .instance_init =3D msf2_soc_initfn,
>> +    .class_init    =3D msf2_soc_class_init,
>> +};
>> +
>> +static void msf2_soc_types(void)
>> +{
>> +    type_register_static(&msf2_soc_info);
>> +}
>> +
>> +type_init(msf2_soc_types)
>> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
>> new file mode 100644
>> index 0000000..29a8ff8
>> --- /dev/null
>> +++ b/include/hw/arm/msf2-soc.h
>> @@ -0,0 +1,60 @@
>> +/*
>> + * Microsemi Smartfusion2 SoC
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_ARM_MSF2_SOC_H
>> +#define HW_ARM_MSF2_SOC_H
>> +
>> +#include "hw/misc/msf2-sysreg.h"
>> +#include "hw/timer/msf2-timer.h"
>> +#include "hw/ssi/msf2-spi.h"
>> +#include "hw/arm/armv7m.h"
>> +
>> +#define TYPE_MSF2_SOC     "msf2-soc"
>> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
>> +
>> +#define MSF2_NUM_SPIS         2
>> +#define MSF2_NUM_UARTS        2
>> +
>> +#define ENVM_BASE_ADDRESS     0x60000000
>> +#define ENVM_SIZE             (128 * 1024)
>>
>
> The SoC design ENVM_SIZE is 1MB, 128K seems your particular model.
>

 M2S010 SoC device has 256K eNMV. My bad it should be 256 instead of 128.
 The board I have contains M2S010 device in SOM.

> +
>> +#define DDR_BASE_ADDRESS      0xA0000000
>> +#define DDR_SIZE              (64 * 1024 * 1024)
>>
>
> This belongs to the SoM.
> Yes will change it.
>
>> +
>> +#define SRAM_BASE_ADDRESS     0x20000000
>> +#define SRAM_SIZE             (64 * 1024)
>>
>
> Indeed this SoC is designed to have up to 64K of SRAM.
> Luckily your model provides 64K.
>


Yes it is 64k :)

>
>
+
>> +typedef struct MSF2State {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +    /*< public >*/
>> +
>> +    ARMv7MState armv7m;
>> +
>> +    MSF2SysregState sysreg;
>> +    MSF2TimerState timer;
>> +    MSF2SpiState spi[MSF2_NUM_SPIS];
>> +} MSF2State;
>> +
>> +#endif
>>
>>
