Received: by 10.223.188.70 with SMTP id a6csp5053044wrh;
        Mon, 28 Aug 2017 14:59:14 -0700 (PDT)
X-Received: by 10.237.48.4 with SMTP id 4mr2867893qte.218.1503957554714;
        Mon, 28 Aug 2017 14:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503957554; cv=none;
        d=google.com; s=arc-20160816;
        b=OUnVrAMrn8gv9xi37mQlTPOcMh6l70bFeDQuGf3IajZM7a8WW3+6Q9fGta+7r+RzWa
         PjJJoCGNjG/j5aoxCre8H2uUwW3zzaQl7v7YFwrGdqjox4dAaXiohqSg/CW1GlLlNt4I
         yezUP5Hf73oJg6X2Urj2K1T4Hws/VfW/YP1q1hgGFqi3R71gQQQleDVVBRFYR49Msk/A
         iFvvFg4ji/KYHhAekJWNlZGHHawbgVgGeW504wUmfkk/9EkqOGL7/Yumy7ALTnFnRL98
         9fVdVLr/k60O3ORbt9Jm0JapxOGDLifiiaLCx3Llj4OYUfJXK6iDdCjvcr3jArCiB43O
         k1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2aMOE980Guuyg+v4W3Xc81x0SMaa2kf9z8x6jNf18T8=;
        b=QTgWoLb5VVY8FvdHY0ORui82a9RQ9akbE89ycMv34usSv4R57T/YFiISlP5Zu0inqY
         aQn3mFQUytJQ7EAKb+am0Oo0gY4Y2DqVXKFn4E9YdfrLES6FwM8hG+j2vfT8SmmBomeY
         +rdwTA9oLWVdBBVkwVCk1WKX5EMABFxS7It4NGn3DyfKxS0xKyJeJQcBTzarZ2qXMwfr
         vut+jQ+cGbVKOFE+DioTgHnrbVPz09YcO42yWI+GfB7IdarwInCWzaN5/b3SlCGIDQKY
         SiWUkorm2EU5Nxv5Xlglo0e6t2AMZY8GPbdk9LIE/xbM+6H/vomVZAqVzSZj35w3OHq6
         bgkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DmfP+oe/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4si1248718qtc.289.2017.08.28.14.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 14:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DmfP+oe/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmS3s-0003Ia-9F
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 17:59:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmS3E-0002uz-0s
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 17:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmS3C-0002xQ-8n
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 17:58:32 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dmS37-0002u0-VQ; Mon, 28 Aug 2017 17:58:26 -0400
Received: by mail-wr0-x244.google.com with SMTP id 40so932886wrv.3;
	Mon, 28 Aug 2017 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2aMOE980Guuyg+v4W3Xc81x0SMaa2kf9z8x6jNf18T8=;
	b=DmfP+oe/70M3YVgjpeoqwkCv1i0eY/pNvasPZlAUWr70xqhecMgAImrBgy6/m5m3kQ
	zFBflPEuOeXW3+5Y9gg5EABXoQMLt9ol1Yc/QidtVG5CY0M++EwiK8M+zDpoSpqlhq8J
	Swpxkr2QwwJPqZcH4qoPpKVyuEpQ5ZezDtm+/6tugdxdBRCOdDppnun+xVJpfGzmAFwr
	O1bTu5MmTa5Pr3ItKHiHL3jogNQnRKuosf1f+RswckgKFgxBwxxh3KiY/hlOvll6fwL1
	7Hix9Y5AVTT2YYDHbN2TF5aYPzoMjvuYm6TiMmZSWHi5ikvR6dllRhUfxbDF+G3bAyqR
	AUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2aMOE980Guuyg+v4W3Xc81x0SMaa2kf9z8x6jNf18T8=;
	b=MaGipeS5hgDuef2YZ74WS3sFbiRDBC1qDPD230iZwQDwV4ptNJhPPuuvV9GuF69qNW
	0eZ4I2wYGqOg1WHWetgcE+XB7VXY7P2QBpUS/6nZf8Bk+rFFy0ilDXLgviUtcGXOtMif
	4dQKtswI2ExcavkM+WI+dN32R2AVsJP9P/ZYGOkJ37Aaxma4IZaNJvnBNwoc6xvTL7BK
	s4a2l8m6XFwCDWQ9YDn8DDsmgbXEB7dUdtmtVrYjdPZw4kZuE5VJdLJCBIAuD89ftpHl
	/Ey6hvcjlEd7U4lOxCD51FsBluO8P4URbVSd+IGrUSoo0aXUlY3+YgsN9g83uFyikwDf
	BSVg==
X-Gm-Message-State: AHYfb5i5SPP0D79A8k5WHqJm+9KIA94uEYt6VgykqL6DlX19zhbnb+0K
	xJNrhT6KCL4rbOb7lm55kHzjRav6XA==
X-Received: by 10.223.163.87 with SMTP id d23mr1118178wrb.84.1503957504716;
	Mon, 28 Aug 2017 14:58:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 28 Aug 2017 14:57:54 -0700 (PDT)
In-Reply-To: <1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Aug 2017 14:57:54 -0700
Message-ID: <CAKmqyKP+Yd8-zFiy581J39gfZHCFznH_p5T2hMQw-1x=_-9LkQ@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBAuHSUESPY7

On Mon, Aug 28, 2017 at 9:38 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Smartfusion2 SoC has hardened Microcontroller subsystem
> and flash based FPGA fabric. This patch adds support for
> Microcontroller subsystem in the SoC.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>

It looks like I have reviewed this one previously as well. Unless
there were any major changes since then you can re-add my reviewed by
tag.

Thanks,
Alistair

> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/msf2-soc.c               | 215 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/msf2-soc.h       |  66 ++++++++++++
>  4 files changed, 283 insertions(+)
>  create mode 100644 hw/arm/msf2-soc.c
>  create mode 100644 include/hw/arm/msf2-soc.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index bbdd3c1..5059d13 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -129,3 +129,4 @@ CONFIG_ACPI=y
>  CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_GPIO_KEY=y
> +CONFIG_MSF2=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index a2e56ec..df36a03 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
> +obj-$(CONFIG_MSF2) += msf2-soc.o
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> new file mode 100644
> index 0000000..276eec5
> --- /dev/null
> +++ b/hw/arm/msf2-soc.c
> @@ -0,0 +1,215 @@
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
> +
> +#define MSF2_TIMER_BASE       0x40004000
> +#define MSF2_SYSREG_BASE      0x40038000
> +
> +#define ENVM_BASE_ADDRESS     0x60000000
> +
> +#define SRAM_BASE_ADDRESS     0x20000000
> +
> +#define MSF2_ENVM_SIZE        (512 * K_BYTE)
> +#define MSF2_ESRAM_SIZE       (64 * K_BYTE)
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
> +    memory_region_init_ram(nvm, NULL, "MSF2.eNVM", s->envm_size,
> +                           &error_fatal);
> +
> +    /*
> +     * On power-on, the eNVM region 0x60000000 is automatically
> +     * remapped to the Cortex-M3 processor executable region
> +     * start address (0x0). We do not support remapping other eNVM,
> +     * eSRAM and DDR regions by guest(via Sysreg) currently.
> +     */
> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
> +                             nvm, 0, s->envm_size);
> +
> +    memory_region_set_readonly(nvm, true);
> +    memory_region_set_readonly(nvm_alias, true);
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
> +                                  OBJECT(&s->spi[i]), "spi",
> +                                  &error_abort);
> +        g_free(bus_name);
> +    }
> +}
> +
> +static Property m2sxxx_soc_properties[] = {
> +    /*
> +     * part name specifies the type of SmartFusion2 device variant(this
> +     * property is for information purpose only.
> +     */
> +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
> +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_SIZE),
> +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size, MSF2_ESRAM_SIZE),
> +    /* Libero GUI shows 100Mhz as default for clocks */
> +    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
> +    /* default divisors in Libero GUI */
> +    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
> +    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
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
> index 0000000..eb239fa
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
> +    uint32_t apb0div;
> +    uint32_t apb1div;
> +
> +    MSF2SysregState sysreg;
> +    MSSTimerState timer;
> +    MSSSpiState spi[MSF2_NUM_SPIS];
> +} MSF2State;
> +
> +#endif
> --
> 2.5.0
>
