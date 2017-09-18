Received: by 10.223.172.38 with SMTP id v35csp3566885wrc;
        Mon, 18 Sep 2017 02:49:57 -0700 (PDT)
X-Received: by 10.55.4.141 with SMTP id 135mr17989758qke.86.1505728197669;
        Mon, 18 Sep 2017 02:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505728197; cv=none;
        d=google.com; s=arc-20160816;
        b=d4kFao6tNatU5afZsQA6e7beYjylgjRXGiB2UxErO7PMmmJ5+vc5FUdRzAnWNYrCYZ
         6FGBCmezLWjCD46+SDff1SaZkNgnpUancsU/xfn5FUy6sc0XPtS9UvzFQbZkj7+xJzvY
         vkQB+dbGX9aOAyqboz2m/77WhuOqCVjl36DzpKVA/IMivx50IWNiW6zJODuEKkbaIdAn
         YQEpDBvSwxS9alxJ1usBrjvclt+kxEjsfJCeN3GzYsDt0p1xZJBUyPymDun7AvBvNA+y
         0SIRW1juT0+k4wumoel3yxzr561NkzwswhpRhg2FJ631FiEHRyFJH0kt0RVmbkvOKn15
         8eHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=32eOL52Y60PAmDt90Sm5/RmizKXuevw9T4pyw3iA2zQ=;
        b=Frjm4khZNUUBopbd91Sam0TOhlQh2rbL0Eh7KZRVyUqwzBhV0NCGQX/9t7Apt8iaaK
         azmeva9xAK45fyUItX+u9llkTy0SMUjmplvdSMQuMDJJEhlzNwTDlzilMxXnfnJEj53m
         iRLnLX7KqKNxbnQZFUEFbNOXO/Xigr2iRwIOE1ueyCzxxoDUllyOh2ckVhcR3ZjylvMx
         vMcX+05FaffIDo7HRkD8Ob1vXOUAOFPjRNdZyXV2ICHMFBPb388gvi95XqliGvH34DWM
         eKUHmTwQdUbhGgb5Drk3AUc109Gdnpm3i1VBZtiJk6RSfnaRCgGx5yNvJwdhHDXxDsuH
         /dcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=icD/CejM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v33si6515385qtg.44.2017.09.18.02.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 02:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=icD/CejM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtsgd-00039c-58
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 05:49:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtsgP-00036s-Qk
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtsgL-0008DT-SG
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:49:41 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:45735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dtsgC-0008AB-Jo; Mon, 18 Sep 2017 05:49:28 -0400
Received: by mail-vk0-x234.google.com with SMTP id w23so3419089vkw.2;
	Mon, 18 Sep 2017 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=32eOL52Y60PAmDt90Sm5/RmizKXuevw9T4pyw3iA2zQ=;
	b=icD/CejMA2cBRmKY6Fm+w+IWBexppDVNnygRR4UnsBoYjAVsivFrl1dH86Sztn4EGj
	BRH5AzBhOC5apUo0bXiq0O7UTIjhz8o2D8PjHqYwkDpZN5LaEctWoHL9AalBS42ENbIl
	FI7NQjgugQQ3dK+XxybxuF7amakuHhOfWlx4+CNB2ERqkN26r6DNYcOFt/9sZgaeyC/T
	pYeF7WlDHNsQxmcuqtmqbCa9PjO5gYOJ5Y7Uz7Zew6EXf+X/6wIiXw8bLwkbs3zRXKK9
	gUUCI3I96ZQEuFVuVSXjqCpFFomF7rUXjPxbsZb5y+Xni9CV3JoP0q93om/12gnFeUB8
	dcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=32eOL52Y60PAmDt90Sm5/RmizKXuevw9T4pyw3iA2zQ=;
	b=D9GKvP66+QRbvZYQd7nldfSU4WpJAG4m5pPAeE0kQLu4AypzAq5yk7F5KNEU7UFL/6
	8qv0O9Kev7yX8/H6e13r2G+aIOq5tJnuYmaduMK2Myj9qa/Oiv0ECAM1r1+6mbhyBmr2
	lDZso0/cmLyInyElIj9X5rDOZ3PoI5q9uSA8Ph7WfGUY4508fJRs0iywbybaugSXcyA0
	sQOUGU2z/XqiXhRa1ndB+7K1Wykj5mLKGAkwTkRJwmfM/m1TLRNT/Rd/xMzo7nI3eXSr
	4PoFpEhppBoKiBq6B6+pg6A+GksxsspiW2SQLVbtdqi5shij2LTLGqKGRxaSNsIm2Mmj
	+CeQ==
X-Gm-Message-State: AHPjjUjm4dPH7tQXAQ7yx++Kzy0rhINeW6CTz1hbNxDkb7+HSW4ab/x4
	Rf6Ulac0iZrJuZ6AmWGrjxb8AS2jmrQtyBGa/60=
X-Google-Smtp-Source: AOwi7QD/4w+5iRg6mg2ByYb7vMmxJGAJW5D3XtrDckMnHrELHTvd4MwMfD/0M+Ofu3hGxIbmL20LMStI5i82WBHpbJk=
X-Received: by 10.31.60.203 with SMTP id j194mr22327878vka.134.1505728167479; 
	Mon, 18 Sep 2017 02:49:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Mon, 18 Sep 2017 02:49:27 -0700 (PDT)
In-Reply-To: <9d3d6ffd-bf3b-8102-8a08-beee28656a54@amsat.org>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-5-git-send-email-sundeep.lkml@gmail.com>
	<9d3d6ffd-bf3b-8102-8a08-beee28656a54@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 18 Sep 2017 15:19:27 +0530
Message-ID: <CALHRZurrbATjkAbBc-RJBH-+nX8jA4WcV2tqS+CNw8VaKEEkjQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a1143026a8d0fb6055973a878"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lr3QtIpqJw2f

--001a1143026a8d0fb6055973a878
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, Sep 18, 2017 at 6:38 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>
>> Smartfusion2 SoC has hardened Microcontroller subsystem
>> and flash based FPGA fabric. This patch adds support for
>> Microcontroller subsystem in the SoC.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>   default-configs/arm-softmmu.mak |   1 +
>>   hw/arm/Makefile.objs            |   1 +
>>   hw/arm/msf2-soc.c               | 232 ++++++++++++++++++++++++++++++
>> ++++++++++
>>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>>   4 files changed, 300 insertions(+)
>>   create mode 100644 hw/arm/msf2-soc.c
>>   create mode 100644 include/hw/arm/msf2-soc.h
>>
>> diff --git a/default-configs/arm-softmmu.mak
>> b/default-configs/arm-softmmu.mak
>> index bbdd3c1..5059d13 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -129,3 +129,4 @@ CONFIG_ACPI=3Dy
>>   CONFIG_SMBIOS=3Dy
>>   CONFIG_ASPEED_SOC=3Dy
>>   CONFIG_GPIO_KEY=3Dy
>> +CONFIG_MSF2=3Dy
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index a2e56ec..df36a03 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>>   obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>>   obj-$(CONFIG_MPS2) +=3D mps2.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-soc.o
>> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
>> new file mode 100644
>> index 0000000..5c0a2ea
>> --- /dev/null
>> +++ b/hw/arm/msf2-soc.c
>> @@ -0,0 +1,232 @@
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
>> +#include "qemu/cutils.h"
>> +#include "hw/arm/msf2-soc.h"
>> +#include "hw/misc/unimp.h"
>> +
>> +#define MSF2_TIMER_BASE       0x40004000
>> +#define MSF2_SYSREG_BASE      0x40038000
>> +
>> +#define ENVM_BASE_ADDRESS     0x60000000
>> +
>> +#define SRAM_BASE_ADDRESS     0x20000000
>> +
>> +#define MSF2_ENVM_MAX_SIZE    (512 * K_BYTE)
>> +
>> +/*
>> + * eSRAM max size is 80k without SECDED(Single error correction and
>> + * dual error detection) feature and 64k with SECDED.
>> + * We do not support SECDED now.
>> + */
>> +#define MSF2_ESRAM_MAX_SIZE       (80 * K_BYTE)
>> +
>> +static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 ,
>> 0x40011000 };
>> +static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 ,
>> 0x40010000 };
>> +
>> +static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };
>> +static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };
>> +static const int timer_irq[MSF2_NUM_TIMERS] =3D { 14, 15 };
>> +
>> +static void m2sxxx_soc_initfn(Object *obj)
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
>> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
>> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
>> +
>> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
>> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
>> +                          TYPE_MSS_SPI);
>> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
>> +    }
>> +}
>> +
>> +static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
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
>> +
>> +    memory_region_init_rom(nvm, NULL, "MSF2.eNVM", s->envm_size,
>> +                           &error_fatal);
>> +    /*
>> +     * On power-on, the eNVM region 0x60000000 is automatically
>> +     * remapped to the Cortex-M3 processor executable region
>> +     * start address (0x0). We do not support remapping other eNVM,
>> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
>> +     */
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM",
>> +                             nvm, 0, s->envm_size);
>> +
>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>> +
>> +    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
>> +                           &error_fatal);
>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram)=
;
>> +
>> +    armv7m =3D DEVICE(&s->armv7m);
>> +    qdev_prop_set_uint32(armv7m, "num-irq", 81);
>> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
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
>> +    system_clock_scale =3D NANOSECONDS_PER_SECOND / s->m3clk;
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
>> +    /* APB0 clock is the timer input clock */
>> +    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk / s->apb0div)=
;
>> +    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err)=
;
>> +    if (err !=3D NULL) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    busdev =3D SYS_BUS_DEVICE(dev);
>> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
>> +    sysbus_connect_irq(busdev, 0,
>> +                           qdev_get_gpio_in(armv7m, timer_irq[0]));
>> +    sysbus_connect_irq(busdev, 1,
>> +                           qdev_get_gpio_in(armv7m, timer_irq[1]));
>> +
>> +    dev =3D DEVICE(&s->sysreg);
>> +    qdev_prop_set_uint32(dev, "apb0divisor", s->apb0div);
>> +    qdev_prop_set_uint32(dev, "apb1divisor", s->apb1div);
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
>> +        gchar *bus_name;
>> +
>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
>> &err);
>> +        if (err !=3D NULL) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
>> +
>> +        /* Alias controller SPI bus to the SoC itself */
>> +        bus_name =3D g_strdup_printf("spi%d", i);
>> +        object_property_add_alias(OBJECT(s), bus_name,
>> +                                  OBJECT(&s->spi[i]), "spi",
>> +                                  &error_abort);
>> +        g_free(bus_name);
>> +    }
>> +
>> +    /* Below devices are not modelled yet. */
>> +    create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
>> +    create_unimplemented_device("pdma", 0x40003000, 0x1000);
>>
>
> name it "dma" only.


Just named so that it matches documentation. No strong feelings regd. names=
.
I will change to dma and hs-dma .

>
>
> +    create_unimplemented_device("watchdog", 0x40005000, 0x1000);
>> +    create_unimplemented_device("i2c_1", 0x40012000, 0x1000);
>> +    create_unimplemented_device("gpio", 0x40013000, 0x1000);
>> +    create_unimplemented_device("hpdma", 0x40014000, 0x1000);
>>
>
> "hs-dma" ?


Ok

>
>
> +    create_unimplemented_device("can", 0x40015000, 0x1000);
>> +    create_unimplemented_device("rtc", 0x40017000, 0x1000);
>> +    create_unimplemented_device("apb_config", 0x40020000, 0x10000);
>>
>
> hmm ok.
>
> +    create_unimplemented_device("emac", 0x40041000, 0x1000);
>> +    create_unimplemented_device("usb", 0x40043000, 0x1000);
>> +}
>>
>
> now the cpu memory tree looks:
>
> (qemu) info mtree
> address-space: cpu-memory
>   0000000000000000-ffffffffffffffff (prio 0, i/o): armv7m-container
>     0000000000000000-ffffffffffffffff (prio -1, i/o): system
>       0000000000000000-000000000003ffff (prio 0, i/o): alias MSF2.eNVM
> @MSF2.eNVM 0000000000000000-000000000003ffff
>       0000000020000000-000000002000ffff (prio 0, ram): MSF2.eSRAM
>       0000000040000000-000000004000001f (prio 0, i/o): serial
>       0000000040001000-000000004000103f (prio 0, i/o): mss-spi
>       0000000040002000-0000000040002fff (prio -1000, i/o): i2c_0
>       0000000040003000-0000000040003fff (prio -1000, i/o): pdma
>       0000000040004000-000000004000402f (prio 0, i/o): mss-timer
>       0000000040005000-0000000040005fff (prio -1000, i/o): watchdog
>       0000000040011000-000000004001103f (prio 0, i/o): mss-spi
>       0000000040012000-0000000040012fff (prio -1000, i/o): i2c_1
>       0000000040013000-0000000040013fff (prio -1000, i/o): gpio
>       0000000040014000-0000000040014fff (prio -1000, i/o): hpdma
>       0000000040015000-0000000040015fff (prio -1000, i/o): can
>       0000000040017000-0000000040017fff (prio -1000, i/o): rtc
>       0000000040020000-000000004002ffff (prio -1000, i/o): apb_config
>       0000000040038000-00000000400382ff (prio 0, i/o): msf2-sysreg
>       0000000040041000-0000000040041fff (prio -1000, i/o): emac
>       0000000040043000-0000000040043fff (prio -1000, i/o): usb
>       0000000060000000-000000006003ffff (prio 0, rom): MSF2.eNVM
>       00000000a0000000-00000000a3ffffff (prio 0, ram): ddr-ram
>     0000000022000000-0000000023ffffff (prio 0, i/o): bitband
>     0000000042000000-0000000043ffffff (prio 0, i/o): bitband
>     00000000e000e000-00000000e000efff (prio 0, i/o): nvic
>       00000000e000e000-00000000e000efff (prio 0, i/o): nvic_sysregs
>       00000000e000e010-00000000e000e0ef (prio 1, i/o): systick
>
> +
>> +static Property m2sxxx_soc_properties[] =3D {
>> +    /*
>> +     * part name specifies the type of SmartFusion2 device variant(this
>> +     * property is for information purpose only.
>> +     */
>> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
>> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size,
>> MSF2_ENVM_MAX_SIZE),
>> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
>> +                        MSF2_ESRAM_MAX_SIZE),
>> +    /* Libero GUI shows 100Mhz as default for clocks */
>> +    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
>> +    /* default divisors in Libero GUI */
>> +    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
>> +    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
>>
>
> DEFINE_PROP_UINT8 ?
>
>
> Ok


> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D m2sxxx_soc_realize;
>> +    dc->props =3D m2sxxx_soc_properties;
>> +}
>> +
>> +static const TypeInfo m2sxxx_soc_info =3D {
>> +    .name          =3D TYPE_MSF2_SOC,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(MSF2State),
>> +    .instance_init =3D m2sxxx_soc_initfn,
>> +    .class_init    =3D m2sxxx_soc_class_init,
>> +};
>> +
>> +static void m2sxxx_soc_types(void)
>> +{
>> +    type_register_static(&m2sxxx_soc_info);
>> +}
>> +
>> +type_init(m2sxxx_soc_types)
>> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
>> new file mode 100644
>> index 0000000..eb239fa
>> --- /dev/null
>> +++ b/include/hw/arm/msf2-soc.h
>> @@ -0,0 +1,66 @@
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
>> +#include "hw/arm/armv7m.h"
>> +#include "hw/timer/mss-timer.h"
>> +#include "hw/misc/msf2-sysreg.h"
>> +#include "hw/ssi/mss-spi.h"
>> +
>> +#define TYPE_MSF2_SOC     "msf2-soc"
>> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
>> +
>> +#define MSF2_NUM_SPIS         2
>> +#define MSF2_NUM_UARTS        2
>> +
>> +/*
>> + * System timer consists of two programmable 32-bit
>> + * decrementing counters that generate individual interrupts to
>> + * the Cortex-M3 processor
>> + */
>> +#define MSF2_NUM_TIMERS       2
>> +
>> +typedef struct MSF2State {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +    /*< public >*/
>> +
>> +    ARMv7MState armv7m;
>> +
>> +    char *part_name;
>> +    uint64_t envm_size;
>> +    uint64_t esram_size;
>> +
>> +    uint32_t m3clk;
>> +    uint32_t apb0div;
>> +    uint32_t apb1div;
>>
>
> uint8_t ?


Ok

>
>
> +
>> +    MSF2SysregState sysreg;
>> +    MSSTimerState timer;
>> +    MSSSpiState spi[MSF2_NUM_SPIS];
>> +} MSF2State;
>> +
>> +#endif
>>
>>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Thank you,
Sundeep

--001a1143026a8d0fb6055973a878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Sep 18, 2017 at 6:38 AM, Philippe Mathieu-Daud=C3=A9 <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4=
bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
class=3D"HOEnZb"><div class=3D"h5">On 09/15/2017 01:59 PM, Subbaraya Sundee=
p wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Smartfusion2 SoC has hardened Microcontroller subsystem<br>
and flash based FPGA fabric. This patch adds support for<br>
Microcontroller subsystem in the SoC.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx=
.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
=C2=A0 default-configs/<a href=3D"http://arm-softmmu.ma">arm-softmmu.ma</a>=
<wbr>k |=C2=A0 =C2=A01 +<br>
=C2=A0 hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0 hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 232 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0 include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 66 +++++=
+++++++<br>
=C2=A0 4 files changed, 300 insertions(+)<br>
=C2=A0 create mode 100644 hw/arm/msf2-soc.c<br>
=C2=A0 create mode 100644 include/hw/arm/msf2-soc.h<br>
<br>
diff --git a/default-configs/arm-softmmu.<wbr>mak b/default-configs/arm-sof=
tmmu.<wbr>mak<br>
index bbdd3c1..5059d13 100644<br>
--- a/default-configs/arm-softmmu.<wbr>mak<br>
+++ b/default-configs/arm-softmmu.<wbr>mak<br>
@@ -129,3 +129,4 @@ CONFIG_ACPI=3Dy<br>
=C2=A0 CONFIG_SMBIOS=3Dy<br>
=C2=A0 CONFIG_ASPEED_SOC=3Dy<br>
=C2=A0 CONFIG_GPIO_KEY=3Dy<br>
+CONFIG_MSF2=3Dy<br>
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
index a2e56ec..df36a03 100644<br>
--- a/hw/arm/Makefile.objs<br>
+++ b/hw/arm/Makefile.objs<br>
@@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o<br>
=C2=A0 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o<br>
=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o<br>
=C2=A0 obj-$(CONFIG_MPS2) +=3D mps2.o<br>
+obj-$(CONFIG_MSF2) +=3D msf2-soc.o<br>
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c<br>
new file mode 100644<br>
index 0000000..5c0a2ea<br>
--- /dev/null<br>
+++ b/hw/arm/msf2-soc.c<br>
@@ -0,0 +1,232 @@<br>
+/*<br>
+ * SmartFusion2 SoC emulation.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+#include &quot;hw/arm/arm.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;hw/char/serial.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;sysemu/block-backend.h&quot;<br>
+#include &quot;qemu/cutils.h&quot;<br>
+#include &quot;hw/arm/msf2-soc.h&quot;<br>
+#include &quot;hw/misc/unimp.h&quot;<br>
+<br>
+#define MSF2_TIMER_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A00x40004000<br>
+#define MSF2_SYSREG_BASE=C2=A0 =C2=A0 =C2=A0 0x40038000<br>
+<br>
+#define ENVM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x60000000<br>
+<br>
+#define SRAM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x20000000<br>
+<br>
+#define MSF2_ENVM_MAX_SIZE=C2=A0 =C2=A0 (512 * K_BYTE)<br>
+<br>
+/*<br>
+ * eSRAM max size is 80k without SECDED(Single error correction and<br>
+ * dual error detection) feature and 64k with SECDED.<br>
+ * We do not support SECDED now.<br>
+ */<br>
+#define MSF2_ESRAM_MAX_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0(80 * K_BYTE)<br>
+<br>
+static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 , 0x4001100=
0 };<br>
+static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 , 0x40010=
000 };<br>
+<br>
+static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };<br>
+static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };<br>
+static const int timer_irq[MSF2_NUM_TIMERS] =3D { 14, 15 };<br>
+<br>
+static void m2sxxx_soc_initfn(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2State *s =3D MSF2_SOC(obj);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;armv7m, sizeof(s-&gt;armv7m), T=
YPE_ARMV7M);<br>
+=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;armv7m), sysbus_g=
et_default());<br>
+<br>
+=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;sysreg, sizeof(s-&gt;sysreg), T=
YPE_MSF2_SYSREG);<br>
+=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;sysreg), sysbus_g=
et_default());<br>
+<br>
+=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;timer, sizeof(s-&gt;timer), TYP=
E_MSS_TIMER);<br>
+=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;timer), sysbus_ge=
t_default());<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_SPIS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;s-&gt;spi[i], sizeof(s-=
&gt;spi[i]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_MSS_SPI);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;spi=
[i]), sysbus_get_default());<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2State *s =3D MSF2_SOC(dev_soc);<br>
+=C2=A0 =C2=A0 DeviceState *dev, *armv7m;<br>
+=C2=A0 =C2=A0 SysBusDevice *busdev;<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion *system_memory =3D get_system_memory();<br>
+=C2=A0 =C2=A0 MemoryRegion *nvm =3D g_new(MemoryRegion, 1);<br>
+=C2=A0 =C2=A0 MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);<br>
+=C2=A0 =C2=A0 MemoryRegion *sram =3D g_new(MemoryRegion, 1);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_rom(nvm, NULL, &quot;MSF2.eNVM&quot;, s-&=
gt;envm_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* On power-on, the eNVM region 0x60000000 is automatic=
ally<br>
+=C2=A0 =C2=A0 =C2=A0* remapped to the Cortex-M3 processor executable regio=
n<br>
+=C2=A0 =C2=A0 =C2=A0* start address (0x0). We do not support remapping oth=
er eNVM,<br>
+=C2=A0 =C2=A0 =C2=A0* eSRAM and DDR regions by guest(via Sysreg) currently=
.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 memory_region_init_alias(nvm_a<wbr>lias, NULL, &quot;MSF2.eN=
VM&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvm, 0, s-&gt;envm_size);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(sy<wbr>stem_memory, ENVM_BASE_AD=
DRESS, nvm);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(sy<wbr>stem_memory, 0, nvm_alias=
);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_ram(sram, NULL, &quot;MSF2.eSRAM&quot;, s=
-&gt;esram_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(sy<wbr>stem_memory, SRAM_BASE_AD=
DRESS, sram);<br>
+<br>
+=C2=A0 =C2=A0 armv7m =3D DEVICE(&amp;s-&gt;armv7m);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;num-irq&quot;, 81);<br>
+=C2=A0 =C2=A0 qdev_prop_set_string(armv7m, &quot;cpu-model&quot;, &quot;co=
rtex-m3&quot;);<br>
+=C2=A0 =C2=A0 object_property_set_link(OBJEC<wbr>T(&amp;s-&gt;armv7m), OBJ=
ECT(get_system_memory()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory&quo=
t;, &amp;error_abort);<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&gt;armv7m), tru=
e, &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 system_clock_scale =3D NANOSECONDS_PER_SECOND / s-&gt;m3clk;=
<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_UARTS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (serial_hds[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial_mm_init(get_system_memo<w=
br>ry(), uart_addr[i], 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, uart_irq[i]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;timer);<br>
+=C2=A0 =C2=A0 /* APB0 clock is the timer input clock */<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;clock-frequency&quot;, s-&gt=
;m3clk / s-&gt;apb0div);<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&gt;timer), true=
, &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(dev);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, timer_irq[0]));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, timer_irq[1]));<br>
+<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;sysreg);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;apb0divisor&quot;, s-&gt;apb=
0div);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;apb1divisor&quot;, s-&gt;apb=
1div);<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&gt;sysreg), tru=
e, &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(dev);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_SPIS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar *bus_name;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&g=
t;spi[i]), true, &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE<wbr>(&amp;s-&gt=
;spi[i]), 0, spi_addr[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEV<wbr>ICE(&amp;s-=
&gt;spi[i]), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, spi_irq[i]));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Alias controller SPI bus to the SoC itself =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_name =3D g_strdup_printf(&quot;spi%d&quot;=
, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_alias(OBJE<wbr>CT(s), bus_=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT(&amp;s-&gt;spi[i]), &q=
uot;spi&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(bus_name);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Below devices are not modelled yet. */<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;i<wbr>2c_0&quot;, 0x400020=
00, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;p<wbr>dma&quot;, 0x4000300=
0, 0x1000);<br>
</blockquote>
<br></div></div>
name it &quot;dma&quot; only.</blockquote><div>=C2=A0</div><div>Just named =
so that it matches documentation. No strong feelings regd. names.</div><div=
>I will change to dma and hs-dma .</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;w<wbr>atchdog&quot;, 0x400=
05000, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;i<wbr>2c_1&quot;, 0x400120=
00, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;g<wbr>pio&quot;, 0x4001300=
0, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;h<wbr>pdma&quot;, 0x400140=
00, 0x1000);<br>
</blockquote>
<br></span>
&quot;hs-dma&quot; ?</blockquote><div><br></div><div>Ok=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;c<wbr>an&quot;, 0x40015000=
, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;r<wbr>tc&quot;, 0x40017000=
, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;a<wbr>pb_config&quot;, 0x4=
0020000, 0x10000);<br>
</blockquote>
<br></span>
hmm ok.<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;e<wbr>mac&quot;, 0x4004100=
0, 0x1000);<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;u<wbr>sb&quot;, 0x40043000=
, 0x1000);<br>
+}<br>
</blockquote>
<br></span>
now the cpu memory tree looks:<br>
<br>
(qemu) info mtree<br>
address-space: cpu-memory<br>
=C2=A0 0000000000000000-fffffffffffff<wbr>fff (prio 0, i/o): armv7m-contain=
er<br>
=C2=A0 =C2=A0 0000000000000000-fffffffffffff<wbr>fff (prio -1, i/o): system=
<br>
=C2=A0 =C2=A0 =C2=A0 0000000000000000-000000000003f<wbr>fff (prio 0, i/o): =
alias MSF2.eNVM @MSF2.eNVM 0000000000000000-000000000003f<wbr>fff<br>
=C2=A0 =C2=A0 =C2=A0 0000000020000000-000000002000f<wbr>fff (prio 0, ram): =
MSF2.eSRAM<br>
=C2=A0 =C2=A0 =C2=A0 0000000040000000-0000000040000<wbr>01f (prio 0, i/o): =
serial<br>
=C2=A0 =C2=A0 =C2=A0 0000000040001000-0000000040001<wbr>03f (prio 0, i/o): =
mss-spi<br>
=C2=A0 =C2=A0 =C2=A0 0000000040002000-0000000040002<wbr>fff (prio -1000, i/=
o): i2c_0<br>
=C2=A0 =C2=A0 =C2=A0 0000000040003000-0000000040003<wbr>fff (prio -1000, i/=
o): pdma<br>
=C2=A0 =C2=A0 =C2=A0 0000000040004000-0000000040004<wbr>02f (prio 0, i/o): =
mss-timer<br>
=C2=A0 =C2=A0 =C2=A0 0000000040005000-0000000040005<wbr>fff (prio -1000, i/=
o): watchdog<br>
=C2=A0 =C2=A0 =C2=A0 0000000040011000-0000000040011<wbr>03f (prio 0, i/o): =
mss-spi<br>
=C2=A0 =C2=A0 =C2=A0 0000000040012000-0000000040012<wbr>fff (prio -1000, i/=
o): i2c_1<br>
=C2=A0 =C2=A0 =C2=A0 0000000040013000-0000000040013<wbr>fff (prio -1000, i/=
o): gpio<br>
=C2=A0 =C2=A0 =C2=A0 0000000040014000-0000000040014<wbr>fff (prio -1000, i/=
o): hpdma<br>
=C2=A0 =C2=A0 =C2=A0 0000000040015000-0000000040015<wbr>fff (prio -1000, i/=
o): can<br>
=C2=A0 =C2=A0 =C2=A0 0000000040017000-0000000040017<wbr>fff (prio -1000, i/=
o): rtc<br>
=C2=A0 =C2=A0 =C2=A0 0000000040020000-000000004002f<wbr>fff (prio -1000, i/=
o): apb_config<br>
=C2=A0 =C2=A0 =C2=A0 0000000040038000-0000000040038<wbr>2ff (prio 0, i/o): =
msf2-sysreg<br>
=C2=A0 =C2=A0 =C2=A0 0000000040041000-0000000040041<wbr>fff (prio -1000, i/=
o): emac<br>
=C2=A0 =C2=A0 =C2=A0 0000000040043000-0000000040043<wbr>fff (prio -1000, i/=
o): usb<br>
=C2=A0 =C2=A0 =C2=A0 0000000060000000-000000006003f<wbr>fff (prio 0, rom): =
MSF2.eNVM<br>
=C2=A0 =C2=A0 =C2=A0 00000000a0000000-00000000a3fff<wbr>fff (prio 0, ram): =
ddr-ram<br>
=C2=A0 =C2=A0 0000000022000000-0000000023fff<wbr>fff (prio 0, i/o): bitband=
<br>
=C2=A0 =C2=A0 0000000042000000-0000000043fff<wbr>fff (prio 0, i/o): bitband=
<br>
=C2=A0 =C2=A0 00000000e000e000-00000000e000e<wbr>fff (prio 0, i/o): nvic<br=
>
=C2=A0 =C2=A0 =C2=A0 00000000e000e000-00000000e000e<wbr>fff (prio 0, i/o): =
nvic_sysregs<br>
=C2=A0 =C2=A0 =C2=A0 00000000e000e010-00000000e000e<wbr>0ef (prio 1, i/o): =
systick<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+static Property m2sxxx_soc_properties[] =3D {<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* part name specifies the type of SmartFusion2 device =
variant(this<br>
+=C2=A0 =C2=A0 =C2=A0* property is for information purpose only.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;part-name&quot;<wbr>, MSF2State, pa=
rt_name),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eNVM-size&quot;<wbr>, MSF2State, en=
vm_size, MSF2_ENVM_MAX_SIZE),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eSRAM-size<wbr>&quot;, MSF2State, e=
sram_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MSF2_ESRAM_MAX_SIZE),<br>
+=C2=A0 =C2=A0 /* Libero GUI shows 100Mhz as default for clocks */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;m3clk&quot;, MSF2State, m3clk, 100 =
* 1000000),<br>
+=C2=A0 =C2=A0 /* default divisors in Libero GUI */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;apb0div&quot;, MSF2State, apb0div, =
2),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;apb1div&quot;, MSF2State, apb1div, =
2),<br>
</blockquote>
<br></span>
DEFINE_PROP_UINT8 ?<div><div class=3D"h5"><br>
<br></div></div></blockquote><div>Ok</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div><div class=3D"h5">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void m2sxxx_soc_class_init(ObjectCl<wbr>ass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D m2sxxx_soc_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;props =3D m2sxxx_soc_properties;<br>
+}<br>
+<br>
+static const TypeInfo m2sxxx_soc_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MSF2_SOC,<b=
r>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(MSF2State),<br>
+=C2=A0 =C2=A0 .instance_init =3D m2sxxx_soc_initfn,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D m2sxxx_soc_class_init,<br>
+};<br>
+<br>
+static void m2sxxx_soc_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;m2sxxx_s<wbr>oc_info);<br>
+}<br>
+<br>
+type_init(m2sxxx_soc_types)<br>
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h<br>
new file mode 100644<br>
index 0000000..eb239fa<br>
--- /dev/null<br>
+++ b/include/hw/arm/msf2-soc.h<br>
@@ -0,0 +1,66 @@<br>
+/*<br>
+ * Microsemi Smartfusion2 SoC<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef HW_ARM_MSF2_SOC_H<br>
+#define HW_ARM_MSF2_SOC_H<br>
+<br>
+#include &quot;hw/arm/armv7m.h&quot;<br>
+#include &quot;hw/timer/mss-timer.h&quot;<br>
+#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
+#include &quot;hw/ssi/mss-spi.h&quot;<br>
+<br>
+#define TYPE_MSF2_SOC=C2=A0 =C2=A0 =C2=A0&quot;msf2-soc&quot;<br>
+#define MSF2_SOC(obj)=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(MSF2State, (obj), TY=
PE_MSF2_SOC)<br>
+<br>
+#define MSF2_NUM_SPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
+#define MSF2_NUM_UARTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+<br>
+/*<br>
+ * System timer consists of two programmable 32-bit<br>
+ * decrementing counters that generate individual interrupts to<br>
+ * the Cortex-M3 processor<br>
+ */<br>
+#define MSF2_NUM_TIMERS=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
+<br>
+typedef struct MSF2State {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 ARMv7MState armv7m;<br>
+<br>
+=C2=A0 =C2=A0 char *part_name;<br>
+=C2=A0 =C2=A0 uint64_t envm_size;<br>
+=C2=A0 =C2=A0 uint64_t esram_size;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t m3clk;<br>
+=C2=A0 =C2=A0 uint32_t apb0div;<br>
+=C2=A0 =C2=A0 uint32_t apb1div;<br>
</blockquote>
<br></div></div>
uint8_t ?</blockquote><div><br></div><div>Ok=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 MSF2SysregState sysreg;<br>
+=C2=A0 =C2=A0 MSSTimerState timer;<br>
+=C2=A0 =C2=A0 MSSSpiState spi[MSF2_NUM_SPIS];<br>
+} MSF2State;<br>
+<br>
+#endif<br>
<br>
</blockquote>
<br></span>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.or=
g" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Thank you,</div><di=
v class=3D"gmail_extra">Sundeep</div></div>

--001a1143026a8d0fb6055973a878--
