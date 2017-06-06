Received: by 10.25.0.23 with SMTP id 23csp1461319lfa;
        Tue, 6 Jun 2017 00:39:10 -0700 (PDT)
X-Received: by 10.55.187.196 with SMTP id l187mr29249205qkf.185.1496734750802;
        Tue, 06 Jun 2017 00:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496734750; cv=none;
        d=google.com; s=arc-20160816;
        b=Iy+YMAHfQEPOjGbtOwKTnfYBwq5h/eCDu/hfg9hGbygcNRqXqxDRZAQV6bmw0l5KRA
         pnfM3w3lzap6CYPvmtEHC/6omasS++kTaDW26nSj4H3+tpPJBb9GT6sCNuIWO8+Qg9Ve
         B+P8DpgmRpBWPXzoNJfFPlbx46Fku/LtMguP6LF2JHKfgkgnk/3UkH4fvlVJMJpwXbLS
         EumUiGLhHACN2XXCN1kQj7zLOIy5uwSnX0yCMlpPq0Xl2jVhzwaVDtcDxWFyLcmxNA77
         KYSCvQjy466t9fREaIZuut7LQ7g8BKtNuEyguuPJrwM9kVGVyHQZxb227sCcp8wylya3
         PyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3NI8w0tndORnQEAQVlo1MVswJLwqJQimBqc8YhFMxgk=;
        b=Rpkmze6eUJcI+EUxPjzCqTt/PpqvRRq9E97767ovXT90OTC/p3Pl8pgwiJzAMNhhLP
         aGXOlx2PxHeG33I3+tbKC+HB3Y993+LOujzYqcTv82aGDGeZy28FnUwAbd5H8HlfTVoG
         nOQco7X6gOy9PK1pQeeCtSPR4RzUFuxTagwn390e6Pt3Gj4FcdLj3BtOvXAfRcv3++xD
         NSUbHPDKeTi04d+5bkNGDtJuvkA+/qTgzU6l+0XHtj7K4jbP7CMpcgkCJaX6KYEIYXWG
         Kfc0HqaOuleEheQV4e0p5AkgcPApq8tc7JqhkjhsvX4ZBDGMA3as8KhVSb3M1CC4acCS
         9qyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si34185770qkc.8.2017.06.06.00.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 00:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dI951-0003Z7-Sr
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 03:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dI91Z-0000NY-Bs
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 03:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dI91W-0002RN-MJ
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 03:35:33 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:35692)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dI91Q-0002Ol-7N; Tue, 06 Jun 2017 03:35:24 -0400
Received: by mail-yw0-x243.google.com with SMTP id p144so9373336ywp.2;
	Tue, 06 Jun 2017 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3NI8w0tndORnQEAQVlo1MVswJLwqJQimBqc8YhFMxgk=;
	b=BDvoyFAJ5t8b28rQecZJaiejUOXeysKedSvUxgNzJW+BvpHvhBWGAG9Bkkc8ITMPVs
	Uvh9qmkhjY9trdqUZHG+db2G7wupRcSpFUA3QFSyX/Ctc+Ug+jczN0d8/CtVZfKV09T1
	KExibMktXJfi/TrMWMOWqrZjaWh6wY9cPy6Qv0WOU4yJFIjErzaFgvIutbxTcZkeTws7
	/H0VWW7BR9bolM4WYHjlTZME9nGT24yH74XvUh6+OkysEWoGvWYLiaYPLPzTR39TuQwb
	ZBzc1G2k2Qa7BriGJb5z1ijHW/j3Qyeni/jM7phm4Pok5hcpcJYetS1Eg9aGupQJMo2n
	tBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3NI8w0tndORnQEAQVlo1MVswJLwqJQimBqc8YhFMxgk=;
	b=Dzzf1MgoCsHjnxyXVi3HPpfUtiTiebmqhxBTx1BiWngyf6ltq+vuI630+3HpnYoyuy
	WscmxmPm2911tFweC7o1ffRSs7baPLsATLCOU17PDjsh56mow3l0m1n2E5IF+qJWpq6o
	NFjGY99yhYcoIkcUBFJgpVw4AtestRFzkLM/dfb5mayFFfi8l9WVvj3eV7rXpV3dniTB
	tBc6N9uFE5us8udtprCM9zJoREkfXxLL0B6iYu4g2k1k+lV9fW3VUs0VCtwAHLnUtGiA
	WjSgS8aRlcArTNURt0r9Xv/lOjYl6s87YHFfBTkIGyLlntF5EScM/2t7r4PBLEbcYCQV
	rZew==
X-Gm-Message-State: AODbwcAXymEqHgLVaMU7j08DC9KSz2JxcxUIGFay3ADKkoqtd1a5tyWY
	MwFCJf3jwpzCHrhd3FQ+VQIrLTv2vQ==
X-Received: by 10.13.192.5 with SMTP id b5mr1805192ywd.52.1496734523542; Tue,
	06 Jun 2017 00:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.199 with HTTP; Tue, 6 Jun 2017 00:35:23 -0700 (PDT)
In-Reply-To: <553a2ef3-cbf3-f876-cbf0-3d46bb24e14b@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-5-git-send-email-sundeep.lkml@gmail.com>
	<553a2ef3-cbf3-f876-cbf0-3d46bb24e14b@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 6 Jun 2017 13:05:23 +0530
Message-ID: <CALHRZupvEtr-ZkPu=WF7LtUjczzFSBDuku8VHK6w=vj-tX=D=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114e3f98994f61055145a9ae"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 4/5] msf2: Add Smartfusion2 SoC.
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
X-TUID: 3KZ+iKHxlHu2

--001a114e3f98994f61055145a9ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, May 31, 2017 at 11:13 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
wrote:

> Hi Subbaraya,
>
> So far so good!
>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Smartfusion2 SoC has hardened Microcontroller subsystem
>> and flash based FPGA fabric. This patch adds support for
>> Microcontroller subsystem in the SoC.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  default-configs/arm-softmmu.mak |   1 +
>>  hw/arm/Makefile.objs            |   1 +
>>  hw/arm/msf2-soc.c               | 201 ++++++++++++++++++++++++++++++
>> ++++++++++
>>  include/hw/arm/msf2-soc.h       |  69 ++++++++++++++
>>  4 files changed, 272 insertions(+)
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
>> index 4c5c4ee..c828061 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
>>  obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>>  obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-soc.o
>> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
>> new file mode 100644
>> index 0000000..329e30c
>> --- /dev/null
>> +++ b/hw/arm/msf2-soc.c
>> @@ -0,0 +1,201 @@
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
>> +#define MSF2_TIMER_BASE     0x40004000
>> +#define MSF2_SYSREG_BASE    0x40038000
>> +
>> +#define MSF2_TIMER_IRQ0     14
>> +#define MSF2_TIMER_IRQ1     15
>> +
>> +static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 ,
>> 0x40011000 };
>> +static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 ,
>> 0x40010000 };
>> +
>> +static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };
>> +static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };
>>
>
> Maybe you can declare timer_irq[] here instead of the defines, to keep a
> common style.


Ok will change.

>
>
> +
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
>> +    memory_region_init_ram(nvm, NULL, "MSF2.eNVM", s->envm_size,
>> +                           &error_fatal);
>> +
>> +    /*
>> +     * On power-on, the eNVM region 0x60000000 is automatically
>> +     * remapped to the Cortex-M3 processor executable region
>> +     * start address (0x0). We do not support remapping other eNVM,
>> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
>> +     */
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
>> +                             nvm, 0, s->envm_size);
>> +    vmstate_register_ram_global(nvm);
>> +
>> +    memory_region_set_readonly(nvm, true);
>> +    memory_region_set_readonly(nvm_alias, true);
>> +
>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>> +
>> +    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
>> +                           &error_fatal);
>> +    vmstate_register_ram_global(sram);
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
>> +    /* pclk0 is the timer input clock */
>> +    qdev_prop_set_uint32(dev, "clock-frequency", s->pclk0);
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
>> +static Property m2sxxx_soc_properties[] =3D {
>> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
>> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size,
>> MSF2_ENVM_SIZE),
>> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
>> MSF2_ESRAM_SIZE),
>> +    /* Libero GUI shows 100Mhz as default for clocks */
>> +    DEFINE_PROP_UINT32("pclk0", MSF2State, pclk0, 100 * 1000000),
>> +    DEFINE_PROP_UINT32("pclk1", MSF2State, pclk1, 100 * 1000000),
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
>> index 0000000..67adddb
>> --- /dev/null
>> +++ b/include/hw/arm/msf2-soc.h
>> @@ -0,0 +1,69 @@
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
>> +#include "hw/timer/mss-timer.h"
>> +#include "hw/ssi/mss-spi.h"
>> +#include "hw/arm/armv7m.h"
>> +#include "qemu/cutils.h"
>> +
>> +#define TYPE_MSF2_SOC     "msf2-soc"
>> +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
>> +
>> +#define MSF2_NUM_SPIS         2
>> +#define MSF2_NUM_UARTS        2
>> +
>>
>
> from here ...
>
> +#define ENVM_BASE_ADDRESS     0x60000000
>> +
>> +#define SRAM_BASE_ADDRESS     0x20000000
>> +
>> +#define MSF2_ENVM_SIZE        (512 * K_BYTE)
>> +#define MSF2_ESRAM_SIZE       (64 * K_BYTE)
>> +
>> +#define M2S010_ENVM_SIZE      (256 * K_BYTE)
>> +#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
>> +
>>
>
> ... to here can go in C source.


Ok will change it.

>
>
> +typedef struct MSF2State {
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
>> +    uint32_t pclk0;
>> +    uint32_t pclk1;
>> +
>> +    MSF2SysregState sysreg;
>> +    MSSTimerState timer;
>> +    MSSSpiState spi[MSF2_NUM_SPIS];
>> +} MSF2State;
>> +
>> +#endif
>>
>>
> Regards,
>
> Phil.
>

--001a114e3f98994f61055145a9ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, May 31, 2017 at 11:13 AM, Philippe Mathieu-Daud=C3=A9 <=
span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f=
4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi S=
ubbaraya,<br>
<br>
So far so good!<div><div class=3D"h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Smartfusion2 SoC has hardened Microcontroller subsystem<br>
and flash based FPGA fabric. This patch adds support for<br>
Microcontroller subsystem in the SoC.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
=C2=A0default-configs/arm-softmmu.m<wbr>ak |=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 201 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 69 ++++++=
++++++++<br>
=C2=A04 files changed, 272 insertions(+)<br>
=C2=A0create mode 100644 hw/arm/msf2-soc.c<br>
=C2=A0create mode 100644 include/hw/arm/msf2-soc.h<br>
<br>
diff --git a/default-configs/arm-softmmu.<wbr>mak b/default-configs/arm-sof=
tmmu.<wbr>mak<br>
index 78d7af0..7062512 100644<br>
--- a/default-configs/arm-softmmu.<wbr>mak<br>
+++ b/default-configs/arm-softmmu.<wbr>mak<br>
@@ -122,3 +122,4 @@ CONFIG_ACPI=3Dy<br>
=C2=A0CONFIG_SMBIOS=3Dy<br>
=C2=A0CONFIG_ASPEED_SOC=3Dy<br>
=C2=A0CONFIG_GPIO_KEY=3Dy<br>
+CONFIG_MSF2=3Dy<br>
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
index 4c5c4ee..c828061 100644<br>
--- a/hw/arm/Makefile.objs<br>
+++ b/hw/arm/Makefile.objs<br>
@@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o<br>
=C2=A0obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o<br>
=C2=A0obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o<br>
=C2=A0obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o<br>
+obj-$(CONFIG_MSF2) +=3D msf2-soc.o<br>
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c<br>
new file mode 100644<br>
index 0000000..329e30c<br>
--- /dev/null<br>
+++ b/hw/arm/msf2-soc.c<br>
@@ -0,0 +1,201 @@<br>
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
+#include &quot;hw/arm/msf2-soc.h&quot;<br>
+<br>
+#define MSF2_TIMER_BASE=C2=A0 =C2=A0 =C2=A00x40004000<br>
+#define MSF2_SYSREG_BASE=C2=A0 =C2=A0 0x40038000<br>
+<br>
+#define MSF2_TIMER_IRQ0=C2=A0 =C2=A0 =C2=A014<br>
+#define MSF2_TIMER_IRQ1=C2=A0 =C2=A0 =C2=A015<br>
+<br>
+static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 , 0x4001100=
0 };<br>
+static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 , 0x40010=
000 };<br>
+<br>
+static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };<br>
+static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };<br>
</blockquote>
<br></div></div>
Maybe you can declare timer_irq[] here instead of the defines, to keep a co=
mmon style.</blockquote><div><br></div><div>Ok will change.=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
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
+=C2=A0 =C2=A0 memory_region_init_ram(nvm, NULL, &quot;MSF2.eNVM&quot;, s-&=
gt;envm_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvm, 0, s-&gt;envm_size);<br>
+=C2=A0 =C2=A0 vmstate_register_ram_global(nv<wbr>m);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_set_readonly(nvm<wbr>, true);<br>
+=C2=A0 =C2=A0 memory_region_set_readonly(nvm<wbr>_alias, true);<br>
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
+=C2=A0 =C2=A0 vmstate_register_ram_global(sr<wbr>am);<br>
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
+=C2=A0 =C2=A0 /* pclk0 is the timer input clock */<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;clock-frequency&quot;, s-&gt=
;pclk0);<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));<br>
+<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;sysreg);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar *bus_name =3D g_strdup_printf(&quot;spi%=
d&quot;, i);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&g=
t;spi[i]), true, &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(bus_name);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_alias(OBJE<wbr>CT(s), bus_=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT(&amp;s-&gt;spi[i]), &q=
uot;spi0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(bus_name);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static Property m2sxxx_soc_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;part-name&quot;<wbr>, MSF2State, pa=
rt_name),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eNVM-size&quot;<wbr>, MSF2State, en=
vm_size, MSF2_ENVM_SIZE),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eSRAM-size<wbr>&quot;, MSF2State, e=
sram_size, MSF2_ESRAM_SIZE),<br>
+=C2=A0 =C2=A0 /* Libero GUI shows 100Mhz as default for clocks */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;pclk0&quot;, MSF2State, pclk0, 100 =
* 1000000),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;pclk1&quot;, MSF2State, pclk1, 100 =
* 1000000),<br>
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
index 0000000..67adddb<br>
--- /dev/null<br>
+++ b/include/hw/arm/msf2-soc.h<br>
@@ -0,0 +1,69 @@<br>
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
+#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
+#include &quot;hw/timer/mss-timer.h&quot;<br>
+#include &quot;hw/ssi/mss-spi.h&quot;<br>
+#include &quot;hw/arm/armv7m.h&quot;<br>
+#include &quot;qemu/cutils.h&quot;<br>
+<br>
+#define TYPE_MSF2_SOC=C2=A0 =C2=A0 =C2=A0&quot;msf2-soc&quot;<br>
+#define MSF2_SOC(obj)=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(MSF2State, (obj), TY=
PE_MSF2_SOC)<br>
+<br>
+#define MSF2_NUM_SPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
+#define MSF2_NUM_UARTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+<br>
</blockquote>
<br></div></div>
from here ...<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+#define ENVM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x60000000<br>
+<br>
+#define SRAM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x20000000<br>
+<br>
+#define MSF2_ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (512 * K_BYTE)<br>
+#define MSF2_ESRAM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
+<br>
+#define M2S010_ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 (256 * K_BYTE)<br>
+#define M2S010_ESRAM_SIZE=C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
+<br>
</blockquote>
<br></span>
... to here can go in C source.</blockquote><div>=C2=A0</div><div>Ok will c=
hange it.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
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
+=C2=A0 =C2=A0 uint32_t pclk0;<br>
+=C2=A0 =C2=A0 uint32_t pclk1;<br>
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
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a114e3f98994f61055145a9ae--
