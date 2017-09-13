Received: by 10.223.172.38 with SMTP id v35csp1288606wrc;
        Wed, 13 Sep 2017 10:08:41 -0700 (PDT)
X-Received: by 10.200.23.140 with SMTP id o12mr12493318qtj.269.1505322521561;
        Wed, 13 Sep 2017 10:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505322521; cv=none;
        d=google.com; s=arc-20160816;
        b=Errddu6AmILgbaAea+Rex5TJXErby6MiAtIHiISia/BFd4I/N3EZOXJPiOcELeUCtQ
         b6w3HBQx8vmaCDD9PGyPFUDe4vsqeQAnNAjRL5C36qusvmdAnicF4fhMkxm0rkqe+BT/
         rB/cqokkxRakYwzk2xeymGmRRQoQRO6wa9d1MjgafCZAU6ozOdWRx082VBQSCgJlkQf1
         WCtx3KR3mCRhmvl8uQiNlK0BG4uCU1MN9bFAa720fEN2i5T++iHHGwwbDJln4ogrnevC
         IXGmgCaxQB8PXuBxZIr55e4JcySFpK6MuGhbnUWmgynaHJVPW0sPJh0LAGoO4O5MWmks
         QoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Z70o3UPMiETNhxLT8Tu23sre2BubS6KcoG2MO3Yuj0M=;
        b=MeD1qUsBbA9pQsOAo0E6dhGD3wNzdvIh8XptA9uS0Jbr96mgoBVQsyksbHF8nT3J7N
         Yl13f++xIb5s134KfbprBUwr1CL6F0b/ISnB2H+ZCdU3YtIfgy5iqi9PZz0M24E7ohk1
         Dcy4YPEjC46zykLxvcIbyFqVlhVEXzSsaR5my0KCZyC8yXP1ifCkdC3u+KsEARfOrrdk
         AZ2M2YOqbj1mbjOX+Zkr+95OVMS1FrEDoG76iTNz6zwndSo3eUNkiKaxPLgh+PMcnnpJ
         B0q9bNt88Ov5dAuk5I7Z7aSf8hJHV62qKDrkyO83vp5wqGMyirV+kHCzM1gTGyjh7Dlm
         HGnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bhRYiI0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si15760706qkf.184.2017.09.13.10.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 10:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bhRYiI0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsB9S-0000Ym-Rn
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 13:08:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsB8S-0008Hu-0k
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 13:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsB8O-0005G6-Gh
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 13:07:35 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:43887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dsB8H-00059w-9o; Wed, 13 Sep 2017 13:07:25 -0400
Received: by mail-vk0-x22f.google.com with SMTP id t10so948564vke.0;
	Wed, 13 Sep 2017 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z70o3UPMiETNhxLT8Tu23sre2BubS6KcoG2MO3Yuj0M=;
	b=bhRYiI0kLYOW+nEmY5QsP83qUi2E8kHQcZTs35bns2jzn0BhbzxCrf37+/z+mWqSD3
	lVgSr7pppq1xpIaCpAPPGtAKv76B2D6uiMhm1pF577Xq58Kzv251Ni1YPRcG520kkC0t
	8ozl7pyyn30fk7Of9HHr+7scoYNApI2H4LqgZrxeWn5/PTYGFNxYIpesnopyAWsTnNYB
	wQgaOsAYxMbP6YgUa+Prs0XwD1mVhmvhIUE2f86A+5m37zZQNKRp2gUSDXu1TqBTholo
	ME9jZ1I8KJbE4gbcCrZYfeTJ6h9/P7/QtetTctO7sTJ1dBx6mDvgUNZjA2+F1sfoF9ot
	zBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z70o3UPMiETNhxLT8Tu23sre2BubS6KcoG2MO3Yuj0M=;
	b=fYtsiLX9ZpB8/Zk1zVpMmGXeC2/zeMQEqf/lIcF/FDqA/Rg9t61DRG6tYvUshBOgSr
	kfJuhUli1l6XVwdURE9XZ22JurcvzQTazpNMtQod7MSNrWxhBJr5eiRsw3aDkMwu2dGL
	4BSEZyyB+yk6icGVot+Up5jdfdKHfgOAnXLfUgZ8hIbuGk3YBD1ppOTaq97g2mP9CJ9o
	8F75IkAhKXKdy30Vofrybh0XXUS1J8hE8LvgpURFnXaEIeunjYQN0ufv0gmpd67h5+9O
	tUDO0AZXu2HKiGoTSyN8UWmPD4LXHflDIjQabXkCFrdTMHSf0fV42voGbejgIEtqo5ti
	sucQ==
X-Gm-Message-State: AHPjjUiXeWUhk3VAWRYWoKn8GPV/oCgOVrWngYh1r+4JUKTZ9BS0YtUR
	XVa98uUqHRUfhWhGKSkIgEiIUSKRbgdSmPwyzhk=
X-Google-Smtp-Source: AOwi7QDM4Uoi3EACXgfcGbg5yLCWxFl2gQ481C1eaZ72aNp2y9KOAuQbC9XpgT15MKROuXehnbyq4ka21jiOr8/RlA0=
X-Received: by 10.31.203.197 with SMTP id b188mr13505051vkg.150.1505322444532; 
	Wed, 13 Sep 2017 10:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Wed, 13 Sep 2017 10:07:24 -0700 (PDT)
In-Reply-To: <CALHRZurVQzOX+U7OioHGiMKSoZNSOA77zqhyEGgp=H_5fKC7qg@mail.gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
	<26693abe-07a2-1744-1a8d-4d08941837c5@amsat.org>
	<CALHRZurB_6GT+KccybDgWb8bPdU89Ey1si46HnbQgsLuHYCh_w@mail.gmail.com>
	<CALHRZurVQzOX+U7OioHGiMKSoZNSOA77zqhyEGgp=H_5fKC7qg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 13 Sep 2017 22:37:24 +0530
Message-ID: <CALHRZuq_bAYZBE_uo7mTynNhH=hMpBZ=dN4=+XS3ERiv_hHbYw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114dc2bc9441c3055915311e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22f
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxG78Jm4MYQl

--001a114dc2bc9441c3055915311e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, Sep 13, 2017 at 2:51 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Philippe,
>
> All patches got Reviewed-by. Do you want me to change alias to remap and
> send
> v9 or wait so that you get time to review?
>
> Sorry. My bad, I overlooked your comment. I will just drop alias and send
v9.

Thanks,
Sundeep


> Thanks,
> Sundeep
>
> On Fri, Sep 8, 2017 at 12:56 PM, sundeep subbaraya <sundeep.lkml@gmail.co=
m
> > wrote:
>
>> Hi Philippe,
>>
>> On Fri, Sep 8, 2017 at 3:08 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
>> wrote:
>>
>>> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
>>>
>>>> Smartfusion2 SoC has hardened Microcontroller subsystem
>>>> and flash based FPGA fabric. This patch adds support for
>>>> Microcontroller subsystem in the SoC.
>>>>
>>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>>>> ---
>>>>   default-configs/arm-softmmu.mak |   1 +
>>>>   hw/arm/Makefile.objs            |   1 +
>>>>   hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++++++++++
>>>> ++++++++++
>>>>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>>>>   4 files changed, 286 insertions(+)
>>>>   create mode 100644 hw/arm/msf2-soc.c
>>>>   create mode 100644 include/hw/arm/msf2-soc.h
>>>>
>>>> diff --git a/default-configs/arm-softmmu.mak
>>>> b/default-configs/arm-softmmu.mak
>>>> index bbdd3c1..5059d13 100644
>>>> --- a/default-configs/arm-softmmu.mak
>>>> +++ b/default-configs/arm-softmmu.mak
>>>> @@ -129,3 +129,4 @@ CONFIG_ACPI=3Dy
>>>>   CONFIG_SMBIOS=3Dy
>>>>   CONFIG_ASPEED_SOC=3Dy
>>>>   CONFIG_GPIO_KEY=3Dy
>>>> +CONFIG_MSF2=3Dy
>>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>>> index a2e56ec..df36a03 100644
>>>> --- a/hw/arm/Makefile.objs
>>>> +++ b/hw/arm/Makefile.objs
>>>> @@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>>>>   obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>>>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>>>>   obj-$(CONFIG_MPS2) +=3D mps2.o
>>>> +obj-$(CONFIG_MSF2) +=3D msf2-soc.o
>>>> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
>>>> new file mode 100644
>>>> index 0000000..47fffa4
>>>> --- /dev/null
>>>> +++ b/hw/arm/msf2-soc.c
>>>> @@ -0,0 +1,218 @@
>>>> +/*
>>>> + * SmartFusion2 SoC emulation.
>>>> + *
>>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person
>>>> obtaining a copy
>>>> + * of this software and associated documentation files (the
>>>> "Software"), to deal
>>>> + * in the Software without restriction, including without limitation
>>>> the rights
>>>> + * to use, copy, modify, merge, publish, distribute, sublicense,
>>>> and/or sell
>>>> + * copies of the Software, and to permit persons to whom the Software
>>>> is
>>>> + * furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>>> SHALL
>>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>>>> OR OTHER
>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>> ARISING FROM,
>>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>> DEALINGS IN
>>>> + * THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/error.h"
>>>> +#include "qemu-common.h"
>>>> +#include "hw/arm/arm.h"
>>>> +#include "exec/address-spaces.h"
>>>> +#include "hw/char/serial.h"
>>>> +#include "hw/boards.h"
>>>> +#include "sysemu/block-backend.h"
>>>> +#include "qemu/cutils.h"
>>>> +#include "hw/arm/msf2-soc.h"
>>>> +
>>>> +#define MSF2_TIMER_BASE       0x40004000
>>>> +#define MSF2_SYSREG_BASE      0x40038000
>>>> +
>>>> +#define ENVM_BASE_ADDRESS     0x60000000
>>>> +
>>>> +#define SRAM_BASE_ADDRESS     0x20000000
>>>> +
>>>> +#define MSF2_ENVM_MAX_SIZE        (512 * K_BYTE)
>>>> +
>>>> +/*
>>>> + * eSRAM max size is 80k without SECDED(Single error correction and
>>>> + * dual error detection) feature and 64k with SECDED.
>>>> + * We do not support SECDED now.
>>>> + */
>>>> +#define MSF2_ESRAM_MAX_SIZE       (80 * K_BYTE)
>>>> +
>>>> +static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 ,
>>>> 0x40011000 };
>>>> +static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 ,
>>>> 0x40010000 };
>>>> +
>>>> +static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };
>>>> +static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };
>>>> +static const int timer_irq[MSF2_NUM_TIMERS] =3D { 14, 15 };
>>>> +
>>>> +static void m2sxxx_soc_initfn(Object *obj)
>>>> +{
>>>> +    MSF2State *s =3D MSF2_SOC(obj);
>>>> +    int i;
>>>> +
>>>> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
>>>> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
>>>> +
>>>> +    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG=
);
>>>> +    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
>>>> +
>>>> +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
>>>> +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
>>>> +
>>>> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
>>>> +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
>>>> +                          TYPE_MSS_SPI);
>>>> +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default())=
;
>>>> +    }
>>>> +}
>>>> +
>>>> +static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
>>>> +{
>>>> +    MSF2State *s =3D MSF2_SOC(dev_soc);
>>>> +    DeviceState *dev, *armv7m;
>>>> +    SysBusDevice *busdev;
>>>> +    Error *err =3D NULL;
>>>> +    int i;
>>>> +
>>>> +    MemoryRegion *system_memory =3D get_system_memory();
>>>> +    MemoryRegion *nvm =3D g_new(MemoryRegion, 1);
>>>> +    MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);
>>>> +    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
>>>> +
>>>> +    memory_region_init_rom(nvm, NULL, "MSF2.eNVM", s->envm_size,
>>>> +                           &error_fatal);
>>>> +    /*
>>>> +     * On power-on, the eNVM region 0x60000000 is automatically
>>>> +     * remapped to the Cortex-M3 processor executable region
>>>> +     * start address (0x0). We do not support remapping other eNVM,
>>>> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
>>>> +     */
>>>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
>>>>
>>>
>>> you can drop the ".alias", this function already prepends "alias "
>>
>>
>> .remap sounds good?
>>
>> Thanks,
>> Sundeep
>>
>>>
>>>
>>> +                             nvm, 0, s->envm_size);
>>>> +
>>>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS,
>>>> nvm);
>>>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>>>> +
>>>> +    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
>>>> +                           &error_fatal);
>>>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS,
>>>> sram);
>>>> +
>>>> +    armv7m =3D DEVICE(&s->armv7m);
>>>> +    qdev_prop_set_uint32(armv7m, "num-irq", 81);
>>>> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
>>>> +    object_property_set_link(OBJECT(&s->armv7m),
>>>> OBJECT(get_system_memory()),
>>>> +                                     "memory", &error_abort);
>>>> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized",
>>>> &err);
>>>> +    if (err !=3D NULL) {
>>>> +        error_propagate(errp, err);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    system_clock_scale =3D NANOSECONDS_PER_SECOND / s->m3clk;
>>>> +
>>>> +    for (i =3D 0; i < MSF2_NUM_UARTS; i++) {
>>>> +        if (serial_hds[i]) {
>>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>>> +                           115200, serial_hds[i],
>>>> DEVICE_NATIVE_ENDIAN);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    dev =3D DEVICE(&s->timer);
>>>> +    /* APB0 clock is the timer input clock */
>>>> +    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk /
>>>> s->apb0div);
>>>> +    object_property_set_bool(OBJECT(&s->timer), true, "realized",
>>>> &err);
>>>> +    if (err !=3D NULL) {
>>>> +        error_propagate(errp, err);
>>>> +        return;
>>>> +    }
>>>> +    busdev =3D SYS_BUS_DEVICE(dev);
>>>> +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
>>>> +    sysbus_connect_irq(busdev, 0,
>>>> +                           qdev_get_gpio_in(armv7m, timer_irq[0]));
>>>> +    sysbus_connect_irq(busdev, 1,
>>>> +                           qdev_get_gpio_in(armv7m, timer_irq[1]));
>>>> +
>>>> +    dev =3D DEVICE(&s->sysreg);
>>>> +    qdev_prop_set_uint32(dev, "apb0divisor", s->apb0div);
>>>> +    qdev_prop_set_uint32(dev, "apb1divisor", s->apb1div);
>>>> +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized",
>>>> &err);
>>>> +    if (err !=3D NULL) {
>>>> +        error_propagate(errp, err);
>>>> +        return;
>>>> +    }
>>>> +    busdev =3D SYS_BUS_DEVICE(dev);
>>>> +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
>>>> +
>>>> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
>>>> +        gchar *bus_name;
>>>> +
>>>> +        object_property_set_bool(OBJECT(&s->spi[i]), true,
>>>> "realized", &err);
>>>> +        if (err !=3D NULL) {
>>>> +            error_propagate(errp, err);
>>>> +            return;
>>>> +        }
>>>> +
>>>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>>>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>>>> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
>>>> +
>>>> +        /* Alias controller SPI bus to the SoC itself */
>>>> +        bus_name =3D g_strdup_printf("spi%d", i);
>>>> +        object_property_add_alias(OBJECT(s), bus_name,
>>>> +                                  OBJECT(&s->spi[i]), "spi",
>>>> +                                  &error_abort);
>>>> +        g_free(bus_name);
>>>> +    }
>>>> +}
>>>> +
>>>> +static Property m2sxxx_soc_properties[] =3D {
>>>> +    /*
>>>> +     * part name specifies the type of SmartFusion2 device variant(th=
is
>>>> +     * property is for information purpose only.
>>>> +     */
>>>> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
>>>> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size,
>>>> MSF2_ENVM_MAX_SIZE),
>>>> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
>>>> +                        MSF2_ESRAM_MAX_SIZE),
>>>> +    /* Libero GUI shows 100Mhz as default for clocks */
>>>> +    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
>>>> +    /* default divisors in Libero GUI */
>>>> +    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
>>>> +    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>> +
>>>> +static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
>>>> +{
>>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>> +
>>>> +    dc->realize =3D m2sxxx_soc_realize;
>>>> +    dc->props =3D m2sxxx_soc_properties;
>>>> +}
>>>> +
>>>> +static const TypeInfo m2sxxx_soc_info =3D {
>>>> +    .name          =3D TYPE_MSF2_SOC,
>>>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>>>> +    .instance_size =3D sizeof(MSF2State),
>>>> +    .instance_init =3D m2sxxx_soc_initfn,
>>>> +    .class_init    =3D m2sxxx_soc_class_init,
>>>> +};
>>>> +
>>>> +static void m2sxxx_soc_types(void)
>>>> +{
>>>> +    type_register_static(&m2sxxx_soc_info);
>>>> +}
>>>> +
>>>> +type_init(m2sxxx_soc_types)
>>>> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
>>>> new file mode 100644
>>>> index 0000000..eb239fa
>>>> --- /dev/null
>>>> +++ b/include/hw/arm/msf2-soc.h
>>>> @@ -0,0 +1,66 @@
>>>> +/*
>>>> + * Microsemi Smartfusion2 SoC
>>>> + *
>>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person
>>>> obtaining a copy
>>>> + * of this software and associated documentation files (the
>>>> "Software"), to deal
>>>> + * in the Software without restriction, including without limitation
>>>> the rights
>>>> + * to use, copy, modify, merge, publish, distribute, sublicense,
>>>> and/or sell
>>>> + * copies of the Software, and to permit persons to whom the Software
>>>> is
>>>> + * furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>>> SHALL
>>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>>>> OR OTHER
>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>> ARISING FROM,
>>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>> DEALINGS IN
>>>> + * THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#ifndef HW_ARM_MSF2_SOC_H
>>>> +#define HW_ARM_MSF2_SOC_H
>>>> +
>>>> +#include "hw/arm/armv7m.h"
>>>> +#include "hw/timer/mss-timer.h"
>>>> +#include "hw/misc/msf2-sysreg.h"
>>>> +#include "hw/ssi/mss-spi.h"
>>>> +
>>>> +#define TYPE_MSF2_SOC     "msf2-soc"
>>>> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SO=
C)
>>>> +
>>>> +#define MSF2_NUM_SPIS         2
>>>> +#define MSF2_NUM_UARTS        2
>>>> +
>>>> +/*
>>>> + * System timer consists of two programmable 32-bit
>>>> + * decrementing counters that generate individual interrupts to
>>>> + * the Cortex-M3 processor
>>>> + */
>>>> +#define MSF2_NUM_TIMERS       2
>>>> +
>>>> +typedef struct MSF2State {
>>>> +    /*< private >*/
>>>> +    SysBusDevice parent_obj;
>>>> +    /*< public >*/
>>>> +
>>>> +    ARMv7MState armv7m;
>>>> +
>>>> +    char *part_name;
>>>> +    uint64_t envm_size;
>>>> +    uint64_t esram_size;
>>>> +
>>>> +    uint32_t m3clk;
>>>> +    uint32_t apb0div;
>>>> +    uint32_t apb1div;
>>>> +
>>>> +    MSF2SysregState sysreg;
>>>> +    MSSTimerState timer;
>>>> +    MSSSpiState spi[MSF2_NUM_SPIS];
>>>> +} MSF2State;
>>>> +
>>>> +#endif
>>>>
>>>>
>>
>

--001a114dc2bc9441c3055915311e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Sep 13, 2017 at 2:51 PM, sundeep subbaraya <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">=
sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">Hi Philippe,<div><br></div><div>All patches got Review=
ed-by. Do you want me to change alias to remap and send</div><div>v9 or wai=
t so that you get time to review?</div><div><br></div></div></blockquote><d=
iv>Sorry. My bad, I overlooked your comment. I will just drop alias and sen=
d v9.<br><br></div><div>Thanks,<br></div><div>Sundeep<br>=C2=A0 <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div></div><div>Thanks,</div=
><div>Sundeep=C2=A0</div></div><div class=3D"HOEnZb"><div class=3D"h5"><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep 8, 2017 a=
t 12:56 PM, sundeep subbaraya <span dir=3D"ltr">&lt;<a href=3D"mailto:sunde=
ep.lkml@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Philippe,<div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D"m_-=
7187139597179956050h5">On Fri, Sep 8, 2017 at 3:08 AM, Philippe Mathieu-Dau=
d=C3=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"=
_blank">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div class=3D"m_-7187139597179956050m_-3669830361279732445HOEnZb"><div=
 class=3D"m_-7187139597179956050m_-3669830361279732445h5">On 09/07/2017 04:=
24 PM, Subbaraya Sundeep wrote:<br>
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
=C2=A0 default-configs/<a href=3D"http://arm-softmmu.ma" target=3D"_blank">=
arm-softmmu.ma</a><wbr>k |=C2=A0 =C2=A01 +<br>
=C2=A0 hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0 hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 218 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0 include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 66 +++++=
+++++++<br>
=C2=A0 4 files changed, 286 insertions(+)<br>
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
index 0000000..47fffa4<br>
--- /dev/null<br>
+++ b/hw/arm/msf2-soc.c<br>
@@ -0,0 +1,218 @@<br>
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
+<br>
+#define MSF2_TIMER_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A00x40004000<br>
+#define MSF2_SYSREG_BASE=C2=A0 =C2=A0 =C2=A0 0x40038000<br>
+<br>
+#define ENVM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x60000000<br>
+<br>
+#define SRAM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x20000000<br>
+<br>
+#define MSF2_ENVM_MAX_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (512 * K_BYTE)<br>
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
VM.alias&quot;,<br>
</blockquote>
<br></div></div>
you can drop the &quot;.alias&quot;, this function already prepends &quot;a=
lias &quot;</blockquote><div><br></div></div></div><div>.remap sounds good?=
</div><div><br></div><div>Thanks,</div><div>Sundeep =C2=A0</div><div><div c=
lass=3D"m_-7187139597179956050h5"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"m_-7187139597179956050m_-3669830361279732445HOEnZb"><div class=3D"m_-=
7187139597179956050m_-3669830361279732445h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
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
+}<br>
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
+<br>
+=C2=A0 =C2=A0 MSF2SysregState sysreg;<br>
+=C2=A0 =C2=A0 MSSTimerState timer;<br>
+=C2=A0 =C2=A0 MSSSpiState spi[MSF2_NUM_SPIS];<br>
+} MSF2State;<br>
+<br>
+#endif<br>
<br>
</blockquote>
</div></div></blockquote></div></div></div><br></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div>

--001a114dc2bc9441c3055915311e--
