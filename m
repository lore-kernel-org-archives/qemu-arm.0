Received: by 10.223.188.70 with SMTP id a6csp802372wrh;
        Wed, 30 Aug 2017 05:24:38 -0700 (PDT)
X-Received: by 10.200.34.167 with SMTP id f36mr1581407qta.234.1504095878086;
        Wed, 30 Aug 2017 05:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504095878; cv=none;
        d=google.com; s=arc-20160816;
        b=xBvD4pJkBjFUF/H5YeuVrDDZqU+eLzowtThlEMF4H5uYeNhAQwu4rG1BnoSUXfhKQ7
         Ye8PAvpo3ycdhgowqpdaomN81AWCqERkFUXdXQNQlIY3p5F/vzZrfpakkY/8k1U52S85
         frovvgL3pI0zzQcCReaYJgnXJR2tBK6asTVTxmlurCnMhOtBt+00jSg8Yqr/IIJszsx5
         /S+fcyBIwKyJC6OV9BS0x2TcAgxrbzZY7DL5xyZxbwEmWYddcjKHUq3SQq5sU4eJhOn5
         wRVhCmQoDZdeXMRtevs8u90cG1H0EiB7C8XlsKCfIgqbYRLZ90G0aT0hQiUdt+XFafwe
         oP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=CH5cTP4PPJKXE+0jTAKggT/z0IzenLJ8zQxDcDBNc70=;
        b=zbekUDAb2nSNPdxCqqJtWAJKBUW2FHsL4iD3NyxDXtMOw8FlLpgmdPAFNtEVOEiVjw
         wLA1qqBDbihOURCbtuAwPw3avwiQGkVX1W2Evx6vy5YF0pegaoysfSaY6JffVKwD8u2X
         h19CT5RwrlyOvzpZOu+bbw9ImUIvVuCJ1Lfj7hXjvqRgFqbbrVEAsvcqaBNWteiP31hG
         +wzkRZYs+DsEwRdy7tBqHWHulSqig1TUOsw4DsHvfmP7HTe/vMX2znzAxZIUdTMKo7Ch
         mSRP0cVDa4fnX/LP3vvcjgEtBRkMj8uH8LImP1CIkpMRYvJ+j4M9Xu40Hn+Del9fAW3b
         AD5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=OaTkboEO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i32si2702748qtc.152.2017.08.30.05.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 05:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=OaTkboEO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dn22t-00087q-JF
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 08:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dn21k-0007k7-QN
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 08:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dn21h-0002GO-50
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 08:23:24 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dn21g-0002FY-RN; Wed, 30 Aug 2017 08:23:21 -0400
Received: by mail-vk0-x229.google.com with SMTP id s199so17020043vke.1;
	Wed, 30 Aug 2017 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=be691IAXlGJNnVAnxRCM1D6gS+Bima6Md/f67Fog8WQ=;
	b=OaTkboEOohPy2gLM0FLNjfKXJyTN4KUP6NXVx90jNSqsGfg06ENZ+RVGEpOXfQRRMF
	cwotNZVkggdfceXvCRl8z8/pHVRnczXd+pZR9rPaiR+s4s5HJjq5TPnGiDw7WmwrA/7N
	8I9xL9eMBnPk6Lvn+YNG/6cKx/TxFP1phznllPwwx2w4jb9buw3ICMeU1m9FdiT5E00v
	dnByMwA+Z61B4g3DMkzJcO9qUO6Dh+fSW0UU7Zj8WAcDYV1jg1+FBGtvKNihAeahAdMV
	IvrSNMH2oGUvHqtEzQGgyLJwv1LJY714hVqU9ef+NdN2auNh+zdm8UOCUXO9i/duptGB
	zI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=be691IAXlGJNnVAnxRCM1D6gS+Bima6Md/f67Fog8WQ=;
	b=SgV/aVt0A28T4sIZwGR7UgbyL8E8xpppT34YvEcuUsgtF6ltiPhMW56oKwFLchoHfY
	5DOKYZqE/dXgaTlzdy3tbTNSREuwJle7Q0jxOaih2NHPvkBsXjyKaE/D3huezMMSdipg
	DH14//1x8n3eLmQrw0sxNcUBs5TJ4ToPzar4SVOGIcO8fT3B6d6rZjggIF9CleBZSjoJ
	nQPy1ptkAmMvayDG95nZLcRpWNkIE66Ya2FVmNp2JI9mJjkZ6NNXU/IYbCqA7wOQyo1O
	l+TDLrEBXkpYYRVkQysz6Zo5HoRmM1IrPWAsUmFoOf6xyT5DBaP2Mrdxs3wVa2pjbn3C
	xY7A==
X-Gm-Message-State: AHPjjUg8kjdJanoN8xa0u6k/FBMbunZ8B+56rTt5fSrx9kOmeWxlV7Uy
	SC72rBvSei5/ouc/fR5RvwEEsbOLDA==
X-Google-Smtp-Source: ADKCNb7ophkxlvhAu8hW82nARvYGNCaWgoqRWYWouBgxOL82B0kx9qYN1xEAvgw/hlcnGob3G/aP28UsJO1uz7QYZBk=
X-Received: by 10.31.148.72 with SMTP id w69mr740139vkd.55.1504095798714; Wed,
	30 Aug 2017 05:23:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.75.196 with HTTP; Wed, 30 Aug 2017 05:23:18 -0700 (PDT)
In-Reply-To: <10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 30 Aug 2017 17:53:18 +0530
Message-ID: <CALHRZuq-V-7i57ptJQZKPmP5z=aqfkm+quPemmukOzyqd2-SkQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::229
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2
 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOXNY7E7ZnrL

Hi Philippe,

On Wed, Aug 30, 2017 at 8:15 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
>
> On 08/28/2017 01:38 PM, Subbaraya Sundeep wrote:
>
>> Smartfusion2 SoC has hardened Microcontroller subsystem
>> and flash based FPGA fabric. This patch adds support for
>> Microcontroller subsystem in the SoC.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>   default-configs/arm-softmmu.mak |   1 +
>>   hw/arm/Makefile.objs            |   1 +
>>   hw/arm/msf2-soc.c               | 215 ++++++++++++++++++++++++++++++
>> ++++++++++
>>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>>   4 files changed, 283 insertions(+)
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
>> index 0000000..276eec5
>> --- /dev/null
>> +++ b/hw/arm/msf2-soc.c
>> @@ -0,0 +1,215 @@
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
>> +
>> +#define MSF2_TIMER_BASE       0x40004000
>> +#define MSF2_SYSREG_BASE      0x40038000
>> +
>> +#define ENVM_BASE_ADDRESS     0x60000000
>> +
>> +#define SRAM_BASE_ADDRESS     0x20000000
>> +
>> +#define MSF2_ENVM_SIZE        (512 * K_BYTE)
>> +#define MSF2_ESRAM_SIZE       (64 * K_BYTE)
>>
>
> Eventually you should name those _SIZE_MAX.


I agree and will change to SIZE_MAX

>


> I miscorrected you in v4, 64kB is true with SECDED disabled, else the SoC
> is designed for 80kB. Not a big deal, we can add a "SECDED not supported"
> warning later.
> Can you add a comment about it?


Sure will add a comment about it.

>
>
> +
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
>>
>
> What about the UARTs?
>
> +    for (i =3D 0; i < MSF2_NUM_SPIS; i++) {
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
>> +    memory_region_init_ram(nvm, NULL, "MSF2.eNVM", s->envm_size,
>> +                           &error_fatal);
>>
>
> Why do you initialize as RAM? I'd rather use memory_region_init_rom_devic=
e()
> here, so you can boot a dumped eNVM flash.


Just followed other SoC(like stm32), booting a dumped eNVM flash? I am not
clear about this how to do that?

>
>
> +
>> +    /*
>> +     * On power-on, the eNVM region 0x60000000 is automatically
>> +     * remapped to the Cortex-M3 processor executable region
>> +     * start address (0x0). We do not support remapping other eNVM,
>> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
>> +     */
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
>> +                             nvm, 0, s->envm_size);
>> +
>> +    memory_region_set_readonly(nvm, true);
>> +    memory_region_set_readonly(nvm_alias, true);
>>
>
> Hmmm not sure the alias needs this.


Once we change to rom then memory_region_set_readonly  will go away.

>
>
> +
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
>>
>
> I think they might be issues if you start QEMU without -serial and then
> use a firmware polling for an uart, the device won't be mapped and the
> memory accesses are mostly ignored.
>
> I'd rather use:
>
>     for (i =3D 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) {
>         static const char *serial[] =3D {"serial0", "serial1"};
>
>         if (!serial_hds[i]) {
>             serial_hds[i] =3D qemu_chr_new(serial[i], "null");
>
>         }
>

I agree. I will go through this and change.

>
> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
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
>> +        gchar *bus_name =3D g_strdup_printf("spi%d", i);
>>
>
> move g_strdup_printf() down ...
>
> +
>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
>> &err);
>> +        if (err !=3D NULL) {
>> +            g_free(bus_name);
>>
>
> so this g_free() is not needed.
>
> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>> +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
>> +
>> +        /* Alias controller SPI bus to the SoC itself */
>>
>
> Here:
>            bus_name =3D g_strdup_printf("spi%d", i);


Ok will modify.

>
> +        object_property_add_alias(OBJECT(s), bus_name,
>>
>> +                                  OBJECT(&s->spi[i]), "spi",
>> +                                  &error_abort);
>> +        g_free(bus_name);
>> +    }
>> +}
>> +
>> +static Property m2sxxx_soc_properties[] =3D {
>> +    /*
>> +     * part name specifies the type of SmartFusion2 device variant(this
>> +     * property is for information purpose only.
>> +     */
>> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
>> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size,
>> MSF2_ENVM_SIZE),
>> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
>> MSF2_ESRAM_SIZE),
>> +    /* Libero GUI shows 100Mhz as default for clocks */
>> +    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
>> +    /* default divisors in Libero GUI */
>> +    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
>> +    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
>> +    DEFINE_PROP_END_OF_LIST(),
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
>> +
>> +    MSF2SysregState sysreg;
>> +    MSSTimerState timer;
>> +    MSSSpiState spi[MSF2_NUM_SPIS];
>> +} MSF2State;
>> +
>> +#endif
>>
>
> Almost there :)
>
> Are you OK to:
> - register eNVM as ROM
> - check UARTs?
>

Yeah I will change. Thank you :)

Sundeep


>
> Regards,
>
> Phil.
>
