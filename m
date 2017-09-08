Received: by 10.223.172.38 with SMTP id v35csp1157234wrc;
        Fri, 8 Sep 2017 00:27:14 -0700 (PDT)
X-Received: by 10.55.24.22 with SMTP id j22mr2397330qkh.310.1504855634138;
        Fri, 08 Sep 2017 00:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504855634; cv=none;
        d=google.com; s=arc-20160816;
        b=hYEVXTmVViR87C0x+Gj9HaEuGJWzojnvkEd1zGzRyAhkzvtYZVT6dTWhRTcPa37fZg
         bFyMkHmMU0OSCM74VgfQqOJZGjPF+neCaMKAYkLLnTNf0qzixFZhWJXGfjOTInVwsDpJ
         Q8an7sYp296s1zpXBYAa/A3aSCEChxNc5cyBLIYSmQRlonFbgdHQ6BO0T4AOWctiUifM
         baiJoaxQrRd8K83vaB7k1kNN+FxMOMp2O6v/XuFsiNGWsmpLy1v3a14krTB0+531Rqz+
         nLcdNMIZyj0ui6DtDYPspjDh04wADF0dd5jIPlNAF0/f4wFjGZFQe0vHyuw7vFRXBfhk
         ujqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=iRpCwW1So28fCFvWh8pJme61MNuM78wLZ2QTRINC0Ms=;
        b=fQEMd/g+5U47vOF3NoFQz43LFtMUYTa41vm3ofc7AceRUx/NaXMs7l6k1PiZYMF85/
         yPeNTrrukuJ4nJnkWZTN1E7yurdenRxvfBUfE/CKY/7fON3JBRfIpzR2h2y0rGGcc8zX
         x8mR7CR+QlzxaQ83qbSvXUrHo4rOoDnh8W2t5145ueAjBla7zZajIcslDWfTQFKQqCxm
         8WRFw5c9iBh+6FIEZB/N61elNMC3GCo3K3a1cOnHW884Ak/8t4aJTRC+hpHpuWFEMDzh
         Jc2+epVI0UZm91p2d3n9m7H2k84SIT8jek/f1SuKFrMibGLYN2gmOQlV48oiXtiD4XKN
         H5Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Hx/nzkgT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19si1415233qtg.508.2017.09.08.00.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 00:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Hx/nzkgT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqDh1-0006p3-Q4
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 03:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dqDg2-0006UV-U2
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 03:26:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dqDfv-0006Ho-Nh
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 03:26:10 -0400
Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244]:35807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dqDfv-0006Hd-FT; Fri, 08 Sep 2017 03:26:03 -0400
Received: by mail-ua0-x244.google.com with SMTP id g47so538661uad.2;
	Fri, 08 Sep 2017 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbqLFgHqW5HG36/O1uIrZGWO68t8H2mYs+WM6x9qKyM=;
	b=Hx/nzkgTP//02XMmt+ndPYd/BZ5f6SDTmj1pbWnJOi95B9Loz6aHnklfB6Q210uojv
	up95GjCfsj2OhZ9DWi4HPJ+o9uuovGIWGyGDk3O/kHK69T2z9GUk/4bW5SzBiX4Ja8OW
	Evu3z4aTq3qQKCLk9dSTMLeTwXHo/B6KZ4YhoW/L8a4j1Qt0us5ATPHymiQkAvVyZzqm
	ov0pMLghgWYy93SZi72Y7rNk7uFIkpzP0ja9fe4dxAhjljjpyvQ6g0m4LOum8OFdarXo
	/9Xwb8BTP9VVm4+8n49n4Cd67Gvbeh+gc6xYWPg4/3rq8XSypEfmdukzm7g07k/Cz+4Y
	eH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbqLFgHqW5HG36/O1uIrZGWO68t8H2mYs+WM6x9qKyM=;
	b=qfmowqy+OEgxs6VTtNniaqOSvsCSu61WvK9ThViy3BIYHLWj8CyRTlFc+MgMjVupXY
	FarveZWXQUBinAuQHAQbx/ohUJSPUjIksohiyITBFdVHID4v7pC6lNLQSM1XWbobTfsT
	wOhZM2HHIkZ4e/evc3jcNR+/e2y5XOLrVW1qvupfVjot72aR53LuXtQIC09NrL9OXVtL
	Hn6+3B4jXs8mGNeJHhmd8gYJUdYAGPtRah1g9ImF7L84V2ov3whLLdBVVo2taV9hsp+H
	PuyKreUMpZcwqJ0v6+Sf+dkYlMf8r0Xh+bR4ROnZLcI+34batCM/IsWa3tWvCry8pB+U
	tMmw==
X-Gm-Message-State: AHPjjUhVwj8isZUJe+lA/pzY97Y8FF6ZNi7wCfRzN7wwYvJr+gEE63ql
	XF1YQSSyznlvlP+0Oq71M97FkM1yEw==
X-Google-Smtp-Source: AOwi7QDoxMQcaLcC4l7U2g8mOYQQkwgE7qV7mNF/R/FwB6qFS3sqyDN4qzWTzdQdBQCO50lj21CwVMeERY3TzgEKrCA=
X-Received: by 10.176.1.180 with SMTP id 49mr1183999ual.159.1504855562879;
	Fri, 08 Sep 2017 00:26:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.75.196 with HTTP; Fri, 8 Sep 2017 00:26:02 -0700 (PDT)
In-Reply-To: <26693abe-07a2-1744-1a8d-4d08941837c5@amsat.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
	<26693abe-07a2-1744-1a8d-4d08941837c5@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 8 Sep 2017 12:56:02 +0530
Message-ID: <CALHRZurB_6GT+KccybDgWb8bPdU89Ey1si46HnbQgsLuHYCh_w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v8 PATCH 4/5] msf2: Add Smartfusion2
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
X-TUID: ckz4Ew4JhlfO

Hi Philippe,

On Fri, Sep 8, 2017 at 3:08 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
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
>>   hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++++++++++
>> ++++++++++
>>   include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>>   4 files changed, 286 insertions(+)
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
>> index 0000000..47fffa4
>> --- /dev/null
>> +++ b/hw/arm/msf2-soc.c
>> @@ -0,0 +1,218 @@
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
>> +#define MSF2_ENVM_MAX_SIZE        (512 * K_BYTE)
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
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
>>
>
> you can drop the ".alias", this function already prepends "alias "


.remap sounds good?

Thanks,
Sundeep

>
>
> +                             nvm, 0, s->envm_size);
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
>> +}
>> +
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
>>
