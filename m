Received: by 10.25.0.6 with SMTP id 6csp1248547lfa;
        Sun, 28 May 2017 22:18:32 -0700 (PDT)
X-Received: by 10.233.237.72 with SMTP id c69mr13923890qkg.201.1496035112153;
        Sun, 28 May 2017 22:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496035112; cv=none;
        d=google.com; s=arc-20160816;
        b=TDqIfGzzRg9/iU1B62jdFHZOp/5gx/Sb2qu27TFzLi+y67qGysO2pSCbo3MyfioNTi
         jtqkInW9XcDd6vyOp9fRxbzVBwcIVy1Fbf3TLPaImzE9cS/gZwtvt89wp3q+/pubXK/D
         gLXjAx8Gn+wYCSiwCACxloXvoQnVFhZ6coGI2EGq5asXbYCmhWC1VTZmJWVqDqLtiZKb
         bSSNgbSsIGT/eEdMqlTmEl+Yd0qH68rL3nPIdmQ0TwDYSuzaORBVhfZtELGs2VJjUmlN
         awZMe/j8gTeONZSTWyiQsWgo18koL57tdOvGp+kQKU4txvRPxT+P7X+OlkoWNBDTWIpr
         obCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ffr07OWdNxUHS/Ouije0wCpq3c1X0hAKYrU76OnTExc=;
        b=LjJUy2sHM+cLcWWcot7Jf8ykYnpU7dpoWu7cE7peKb35yGFnARpO/bgdUvdN9nLU80
         K6NlpEs4yBJJ5EwYo3xd5nHP5ZC4HGS6fFNkmlDUpSTFxO1RzxaxLzE1QsZ0p2RyZ56L
         xa1Z8kowJhMBkU1IiiSvSTAVb2yy+zD9zwnScJ2bb9d8i/VECoPmvKk9XcTeMZz8MutI
         BrxC2f1PWc5MEYm5n/4HWAnWLvk6niWmtSsH7S5snxLqzP/YQnNy1Ax+grnUEW2Cnnet
         /Bn2MQKdij6dhxe7AWt7sSOWiG/TXXDDVspfCOsTm7VQUT099l4Ux5A8Oo40dnn0bbeU
         Mv2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62si6540716qkr.271.2017.05.28.22.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 28 May 2017 22:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFD4Z-0001Z2-Gt
	for alex.bennee@linaro.org; Mon, 29 May 2017 01:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFD3q-0001BN-6z
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFD3n-0006od-1n
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:17:46 -0400
Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242]:34188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dFD3g-0006iG-Kb; Mon, 29 May 2017 01:17:36 -0400
Received: by mail-yw0-x242.google.com with SMTP id 5so2303544ywe.1;
	Sun, 28 May 2017 22:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ffr07OWdNxUHS/Ouije0wCpq3c1X0hAKYrU76OnTExc=;
	b=BaxWElgtgcBoeCRGGLNr5M7bDiTBh9UTGRvm3zfHQvJvZzX/f8JcUhqENCEhpxWjvI
	19qA2E62nG+7AecTQLmpird5cnxn5e74IJFtEW4E5Nbdkgqion7z+9gvvVytVWjpqvco
	OnEBOE2oxXHlJ8m71ayDL7nsU6DidVysXP/KFL4pccVBG/Z+8vA7AZhiA1K9mxXmVTec
	2zufMcFpiaAosUbvejtOofRmUjOJvyeXYkoidyEIjZaivcdLvmFaamVxVJgSgJAjODNb
	Dl+KsP0semuDAclBqQifgveaQXLBE+8J2vDNk3cMVqyiuqJJsmzBYvmijMK6tm6XiOLq
	r7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ffr07OWdNxUHS/Ouije0wCpq3c1X0hAKYrU76OnTExc=;
	b=Byg9os7spYw/Z+UrCdlP1CvtzqA8SfFrH2hjmE7Me9tVg5lJRfMwpzyUqpN7r8pm3S
	i7P4bjwriOjqgLoGRxUb8btXpjZupmOgwQuCt80VexiR9UVe3qIVlVmvris+Au2h+lDg
	2HeMp1DwJhv5fDbmNIomLT4dDMljFYXxjhzFkW8o0z3s/aDOM7oyPNMEAfFeHk0N7ZMa
	7XG1M4ryvnS6Z+bRMsv8nc4AQo2xpjNcd0+sZ9FEqvfNC3NKujtXI0nFWLNaKEvgpm1K
	qj9jy+XbCIEfZwrVCpt/0sE8jd2c+2Nw1sY9Eiiv9GkBaCTV9OnqVngyc9KylqD26Yn+
	1EjQ==
X-Gm-Message-State: AODbwcC+AF6t3ddiF59ojyXmgODlEEKBSzhTmb8sO2CtA9Z6/TncT/Bb
	c2laUWgnQcL5ePJ344FW+/GQU4CKYQ==
X-Received: by 10.13.201.193 with SMTP id l184mr11395596ywd.151.1496035055666; 
	Sun, 28 May 2017 22:17:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.195 with HTTP; Sun, 28 May 2017 22:17:35 -0700 (PDT)
In-Reply-To: <CAKmqyKPwu+2CdMkxgkiQacVbcxyERKtRd_Ysj_gy1oR4ecRk4g@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-5-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwu+2CdMkxgkiQacVbcxyERKtRd_Ysj_gy1oR4ecRk4g@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 29 May 2017 10:47:35 +0530
Message-ID: <CALHRZuq7g6jvq1WTk1ontT2fuH8cP89Q3Eq2ggsZ6psobhAuUg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a114e68aa10a5fa0550a2ce16"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::242
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZB/Wg4THubV

--001a114e68aa10a5fa0550a2ce16
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Sat, May 27, 2017 at 5:18 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Smartfusion2 SoC has hardened Microcontroller subsystem
> > and flash based FPGA fabric. This patch adds support for
> > Microcontroller subsystem in the SoC.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  default-configs/arm-softmmu.mak |   1 +
> >  hw/arm/Makefile.objs            |   1 +
> >  hw/arm/msf2-soc.c               | 201 ++++++++++++++++++++++++++++++
> ++++++++++
> >  include/hw/arm/msf2-soc.h       |  69 ++++++++++++++
> >  4 files changed, 272 insertions(+)
> >  create mode 100644 hw/arm/msf2-soc.c
> >  create mode 100644 include/hw/arm/msf2-soc.h
> >
> > diff --git a/default-configs/arm-softmmu.mak
> b/default-configs/arm-softmmu.mak
> > index 78d7af0..7062512 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -122,3 +122,4 @@ CONFIG_ACPI=y
> >  CONFIG_SMBIOS=y
> >  CONFIG_ASPEED_SOC=y
> >  CONFIG_GPIO_KEY=y
> > +CONFIG_MSF2=y
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index 4c5c4ee..c828061 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
> >  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> >  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
> >  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
> > +obj-$(CONFIG_MSF2) += msf2-soc.o
> > diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> > new file mode 100644
> > index 0000000..329e30c
> > --- /dev/null
> > +++ b/hw/arm/msf2-soc.c
> > @@ -0,0 +1,201 @@
> > +/*
> > + * SmartFusion2 SoC emulation.
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu-common.h"
> > +#include "hw/arm/arm.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/char/serial.h"
> > +#include "hw/boards.h"
> > +#include "sysemu/block-backend.h"
> > +#include "hw/arm/msf2-soc.h"
> > +
> > +#define MSF2_TIMER_BASE     0x40004000
> > +#define MSF2_SYSREG_BASE    0x40038000
> > +
> > +#define MSF2_TIMER_IRQ0     14
> > +#define MSF2_TIMER_IRQ1     15
> > +
> > +static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 ,
> 0x40011000 };
> > +static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 ,
> 0x40010000 };
> > +
> > +static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
> > +static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
> > +
> > +static void m2sxxx_soc_initfn(Object *obj)
> > +{
> > +    MSF2State *s = MSF2_SOC(obj);
> > +    int i;
> > +
> > +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
> > +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
> > +
> > +    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
> > +    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
> > +
> > +    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
> > +    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
> > +
> > +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> > +        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> > +                          TYPE_MSS_SPI);
> > +        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> > +    }
> > +}
> > +
> > +static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
> > +{
> > +    MSF2State *s = MSF2_SOC(dev_soc);
> > +    DeviceState *dev, *armv7m;
> > +    SysBusDevice *busdev;
> > +    Error *err = NULL;
> > +    int i;
> > +
> > +    MemoryRegion *system_memory = get_system_memory();
> > +    MemoryRegion *nvm = g_new(MemoryRegion, 1);
> > +    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
> > +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> > +
> > +    memory_region_init_ram(nvm, NULL, "MSF2.eNVM", s->envm_size,
> > +                           &error_fatal);
> > +
> > +    /*
> > +     * On power-on, the eNVM region 0x60000000 is automatically
> > +     * remapped to the Cortex-M3 processor executable region
> > +     * start address (0x0). We do not support remapping other eNVM,
> > +     * eSRAM and DDR regions by guest(via Sysreg) currently.
> > +     */
> > +    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
> > +                             nvm, 0, s->envm_size);
> > +    vmstate_register_ram_global(nvm);
> > +
> > +    memory_region_set_readonly(nvm, true);
> > +    memory_region_set_readonly(nvm_alias, true);
> > +
> > +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
> > +    memory_region_add_subregion(system_memory, 0, nvm_alias);
> > +
> > +    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
> > +                           &error_fatal);
> > +    vmstate_register_ram_global(sram);
> > +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS,
> sram);
> > +
> > +    armv7m = DEVICE(&s->armv7m);
> > +    qdev_prop_set_uint32(armv7m, "num-irq", 81);
> > +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
> > +    object_property_set_link(OBJECT(&s->armv7m),
> OBJECT(get_system_memory()),
> > +                                     "memory", &error_abort);
> > +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized",
> &err);
> > +    if (err != NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +
> > +    for (i = 0; i < MSF2_NUM_UARTS; i++) {
> > +        if (serial_hds[i]) {
> > +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
> > +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
> > +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
> > +        }
> > +    }
> > +
> > +    dev = DEVICE(&s->timer);
> > +    /* pclk0 is the timer input clock */
> > +    qdev_prop_set_uint32(dev, "clock-frequency", s->pclk0);
> > +    object_property_set_bool(OBJECT(&s->timer), true, "realized",
> &err);
> > +    if (err != NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    busdev = SYS_BUS_DEVICE(dev);
> > +    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
> > +    sysbus_connect_irq(busdev, 0,
> > +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));
> > +    sysbus_connect_irq(busdev, 1,
> > +                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));
> > +
> > +    dev = DEVICE(&s->sysreg);
> > +    object_property_set_bool(OBJECT(&s->sysreg), true, "realized",
> &err);
> > +    if (err != NULL) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    busdev = SYS_BUS_DEVICE(dev);
> > +    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
> > +
> > +    for (i = 0; i < MSF2_NUM_SPIS; i++) {
> > +        gchar *bus_name = g_strdup_printf("spi%d", i);
> > +
> > +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
> &err);
> > +        if (err != NULL) {
> > +            g_free(bus_name);
> > +            error_propagate(errp, err);
> > +            return;
> > +        }
> > +
> > +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
> > +                           qdev_get_gpio_in(armv7m, spi_irq[i]));
> > +
> > +        /* Alias controller SPI bus to the SoC itself */
> > +        object_property_add_alias(OBJECT(s), bus_name,
> > +                                  OBJECT(&s->spi[i]), "spi0",
> > +                                  &error_abort);
> > +        g_free(bus_name);
> > +    }
> > +}
> > +
> > +static Property m2sxxx_soc_properties[] = {
> > +    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
>
> This is never used, why have it here?
>
Just for information purpose as there are many variants. I thought it would
be good to
show this in qtree to user.

>
> > +    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size,
> MSF2_ENVM_SIZE),
> > +    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
> MSF2_ESRAM_SIZE),
> > +    /* Libero GUI shows 100Mhz as default for clocks */
> > +    DEFINE_PROP_UINT32("pclk0", MSF2State, pclk0, 100 * 1000000),
> > +    DEFINE_PROP_UINT32("pclk1", MSF2State, pclk1, 100 * 1000000),
>
> Same with this one.
>
Yeah currently not used maybe it will be useful in future. I will remove it
for now.

Thanks,
Sundeep

>
> Thanks,
> Alistair
>
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->realize = m2sxxx_soc_realize;
> > +    dc->props = m2sxxx_soc_properties;
> > +}
> > +
> > +static const TypeInfo m2sxxx_soc_info = {
> > +    .name          = TYPE_MSF2_SOC,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(MSF2State),
> > +    .instance_init = m2sxxx_soc_initfn,
> > +    .class_init    = m2sxxx_soc_class_init,
> > +};
> > +
> > +static void m2sxxx_soc_types(void)
> > +{
> > +    type_register_static(&m2sxxx_soc_info);
> > +}
> > +
> > +type_init(m2sxxx_soc_types)
> > diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
> > new file mode 100644
> > index 0000000..67adddb
> > --- /dev/null
> > +++ b/include/hw/arm/msf2-soc.h
> > @@ -0,0 +1,69 @@
> > +/*
> > + * Microsemi Smartfusion2 SoC
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_ARM_MSF2_SOC_H
> > +#define HW_ARM_MSF2_SOC_H
> > +
> > +#include "hw/misc/msf2-sysreg.h"
> > +#include "hw/timer/mss-timer.h"
> > +#include "hw/ssi/mss-spi.h"
> > +#include "hw/arm/armv7m.h"
> > +#include "qemu/cutils.h"
> > +
> > +#define TYPE_MSF2_SOC     "msf2-soc"
> > +#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
> > +
> > +#define MSF2_NUM_SPIS         2
> > +#define MSF2_NUM_UARTS        2
> > +
> > +#define ENVM_BASE_ADDRESS     0x60000000
> > +
> > +#define SRAM_BASE_ADDRESS     0x20000000
> > +
> > +#define MSF2_ENVM_SIZE        (512 * K_BYTE)
> > +#define MSF2_ESRAM_SIZE       (64 * K_BYTE)
> > +
> > +#define M2S010_ENVM_SIZE      (256 * K_BYTE)
> > +#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
> > +
> > +typedef struct MSF2State {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +    /*< public >*/
> > +
> > +    ARMv7MState armv7m;
> > +
> > +    char *part_name;
> > +    uint64_t envm_size;
> > +    uint64_t esram_size;
> > +
> > +    uint32_t pclk0;
> > +    uint32_t pclk1;
> > +
> > +    MSF2SysregState sysreg;
> > +    MSSTimerState timer;
> > +    MSSSpiState spi[MSF2_NUM_SPIS];
> > +} MSF2State;
> > +
> > +#endif
> > --
> > 2.5.0
> >
>

--001a114e68aa10a5fa0550a2ce16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Sat, May 27, 2017 at 5:18 AM, Alistair Francis <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair=
23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">On Tue, May 16, 2017 at 8:38 AM, Subbaray=
a Sundeep<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Smartfusion2 SoC has hardened Microcontroller subsystem<br>
&gt; and flash based FPGA fabric. This patch adds support for<br>
&gt; Microcontroller subsystem in the SoC.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 default-configs/arm-softmmu.<wbr>mak |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 201 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
&gt;=C2=A0 include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 69 +=
+++++++++++++<br>
&gt;=C2=A0 4 files changed, 272 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/arm/msf2-soc.c<br>
&gt;=C2=A0 create mode 100644 include/hw/arm/msf2-soc.h<br>
&gt;<br>
&gt; diff --git a/default-configs/arm-softmmu.<wbr>mak b/default-configs/ar=
m-softmmu.<wbr>mak<br>
&gt; index 78d7af0..7062512 100644<br>
&gt; --- a/default-configs/arm-softmmu.<wbr>mak<br>
&gt; +++ b/default-configs/arm-softmmu.<wbr>mak<br>
&gt; @@ -122,3 +122,4 @@ CONFIG_ACPI=3Dy<br>
&gt;=C2=A0 CONFIG_SMBIOS=3Dy<br>
&gt;=C2=A0 CONFIG_ASPEED_SOC=3Dy<br>
&gt;=C2=A0 CONFIG_GPIO_KEY=3Dy<br>
&gt; +CONFIG_MSF2=3Dy<br>
&gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
&gt; index 4c5c4ee..c828061 100644<br>
&gt; --- a/hw/arm/Makefile.objs<br>
&gt; +++ b/hw/arm/Makefile.objs<br>
&gt; @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o=
<br>
&gt;=C2=A0 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o<br>
&gt;=C2=A0 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o<br>
&gt;=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o<br>
&gt; +obj-$(CONFIG_MSF2) +=3D msf2-soc.o<br>
&gt; diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..329e30c<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/arm/msf2-soc.c<br>
&gt; @@ -0,0 +1,201 @@<br>
&gt; +/*<br>
&gt; + * SmartFusion2 SoC emulation.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qemu-common.h&quot;<br>
&gt; +#include &quot;hw/arm/arm.h&quot;<br>
&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; +#include &quot;hw/char/serial.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt; +#include &quot;sysemu/block-backend.h&quot;<br>
&gt; +#include &quot;hw/arm/msf2-soc.h&quot;<br>
&gt; +<br>
&gt; +#define MSF2_TIMER_BASE=C2=A0 =C2=A0 =C2=A00x40004000<br>
&gt; +#define MSF2_SYSREG_BASE=C2=A0 =C2=A0 0x40038000<br>
&gt; +<br>
&gt; +#define MSF2_TIMER_IRQ0=C2=A0 =C2=A0 =C2=A014<br>
&gt; +#define MSF2_TIMER_IRQ1=C2=A0 =C2=A0 =C2=A015<br>
&gt; +<br>
&gt; +static const uint32_t spi_addr[MSF2_NUM_SPIS] =3D { 0x40001000 , 0x40=
011000 };<br>
&gt; +static const uint32_t uart_addr[MSF2_NUM_UARTS] =3D { 0x40000000 , 0x=
40010000 };<br>
&gt; +<br>
&gt; +static const int spi_irq[MSF2_NUM_SPIS] =3D { 2, 3 };<br>
&gt; +static const int uart_irq[MSF2_NUM_UARTS] =3D { 10, 11 };<br>
&gt; +<br>
&gt; +static void m2sxxx_soc_initfn(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2State *s =3D MSF2_SOC(obj);<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;armv7m, sizeof(s-&gt;armv7=
m), TYPE_ARMV7M);<br>
&gt; +=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;armv7m), sys=
bus_get_default());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;sysreg, sizeof(s-&gt;sysre=
g), TYPE_MSF2_SYSREG);<br>
&gt; +=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;sysreg), sys=
bus_get_default());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;timer, sizeof(s-&gt;timer)=
, TYPE_MSS_TIMER);<br>
&gt; +=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;timer), sysb=
us_get_default());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_SPIS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;s-&gt;spi[i], size=
of(s-&gt;spi[i]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_MSS_SPI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&g=
t;spi[i]), sysbus_get_default());<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2State *s =3D MSF2_SOC(dev_soc);<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev, *armv7m;<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *busdev;<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *system_memory =3D get_system_memory();<br=
>
&gt; +=C2=A0 =C2=A0 MemoryRegion *nvm =3D g_new(MemoryRegion, 1);<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *sram =3D g_new(MemoryRegion, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_ram(nvm, NULL, &quot;MSF2.eNVM&quot;=
, s-&gt;envm_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* On power-on, the eNVM region 0x60000000 is auto=
matically<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* remapped to the Cortex-M3 processor executable =
region<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* start address (0x0). We do not support remappin=
g other eNVM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* eSRAM and DDR regions by guest(via Sysreg) curr=
ently.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_alias(nvm_<wbr>alias, NULL, &quot;MS=
F2.eNVM.alias&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvm, 0, s-&gt;envm_size);<br>
&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>nvm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_set_readonly(<wbr>nvm, true);<br>
&gt; +=C2=A0 =C2=A0 memory_region_set_readonly(<wbr>nvm_alias, true);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_memory, ENVM_BA=
SE_ADDRESS, nvm);<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_memory, 0, nvm_=
alias);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_ram(sram, NULL, &quot;MSF2.eSRAM&quo=
t;, s-&gt;esram_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>sram);<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_memory, SRAM_BA=
SE_ADDRESS, sram);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 armv7m =3D DEVICE(&amp;s-&gt;armv7m);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;num-irq&quot;, 81);<=
br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_string(armv7m, &quot;cpu-model&quot;, &qu=
ot;cortex-m3&quot;);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_link(<wbr>OBJECT(&amp;s-&gt;armv7m)=
, OBJECT(get_system_memory()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory=
&quot;, &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp;s-&gt;armv7m)=
, true, &quot;realized&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_UARTS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (serial_hds[i]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial_mm_init(get_system_<=
wbr>memory(), uart_addr[i], 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, uart_irq[i]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;timer);<br>
&gt; +=C2=A0 =C2=A0 /* pclk0 is the timer input clock */<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;clock-frequency&quot;, =
s-&gt;pclk0);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp;s-&gt;timer),=
 true, &quot;realized&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);<br>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));<br>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(busdev, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;sysreg);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp;s-&gt;sysreg)=
, true, &quot;realized&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; MSF2_NUM_SPIS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar *bus_name =3D g_strdup_printf(&quot=
;spi%d&quot;, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp=
;s-&gt;spi[i]), true, &quot;realized&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(bus_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_<wbr>DEVICE(&amp;=
s-&gt;spi[i]), 0, spi_addr[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_<wbr>DEVICE(&a=
mp;s-&gt;spi[i]), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(armv7m, spi_irq[i]));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Alias controller SPI bus to the SoC it=
self */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_alias(<wbr>OBJECT(s),=
 bus_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT(&amp;s-&gt;spi[i])=
, &quot;spi0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(bus_name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static Property m2sxxx_soc_properties[] =3D {<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;part-name&quot;<wbr>, MSF2Stat=
e, part_name),<br>
<br>
</div></div>This is never used, why have it here?<br></blockquote><div>Just=
 for information purpose as there are many variants. I thought it would be =
good to</div><div>show this in qtree to user.</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eNVM-size&quot;<wbr>, MSF2Stat=
e, envm_size, MSF2_ENVM_SIZE),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;eSRAM-<wbr>size&quot;, MSF2Sta=
te, esram_size, MSF2_ESRAM_SIZE),<br>
&gt; +=C2=A0 =C2=A0 /* Libero GUI shows 100Mhz as default for clocks */<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;pclk0&quot;, MSF2State, pclk0,=
 100 * 1000000),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;pclk1&quot;, MSF2State, pclk1,=
 100 * 1000000),<br>
<br>
</span>Same with this one.<br></blockquote><div>Yeah currently not used may=
be it will be useful in future. I will remove it for now.</div><div><br></d=
iv><div>Thanks,</div><div>Sundeep=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void m2sxxx_soc_class_init(<wbr>ObjectClass *klass, void *data=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D m2sxxx_soc_realize;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;props =3D m2sxxx_soc_properties;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo m2sxxx_soc_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MSF2_S=
OC,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(MSF2State),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D m2sxxx_soc_initfn,<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D m2sxxx_soc_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void m2sxxx_soc_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;m2sxxx_<wbr>soc_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(m2sxxx_soc_types)<br>
&gt; diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..67adddb<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/arm/msf2-soc.h<br>
&gt; @@ -0,0 +1,69 @@<br>
&gt; +/*<br>
&gt; + * Microsemi Smartfusion2 SoC<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_ARM_MSF2_SOC_H<br>
&gt; +#define HW_ARM_MSF2_SOC_H<br>
&gt; +<br>
&gt; +#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
&gt; +#include &quot;hw/timer/mss-timer.h&quot;<br>
&gt; +#include &quot;hw/ssi/mss-spi.h&quot;<br>
&gt; +#include &quot;hw/arm/armv7m.h&quot;<br>
&gt; +#include &quot;qemu/cutils.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_MSF2_SOC=C2=A0 =C2=A0 =C2=A0&quot;msf2-soc&quot;<br>
&gt; +#define MSF2_SOC(obj)=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(MSF2State, (obj=
), TYPE_MSF2_SOC)<br>
&gt; +<br>
&gt; +#define MSF2_NUM_SPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt; +#define MSF2_NUM_UARTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +<br>
&gt; +#define ENVM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x60000000<br>
&gt; +<br>
&gt; +#define SRAM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x20000000<br>
&gt; +<br>
&gt; +#define MSF2_ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (512 * K_BYTE)<br>
&gt; +#define MSF2_ESRAM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
&gt; +<br>
&gt; +#define M2S010_ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 (256 * K_BYTE)<br>
&gt; +#define M2S010_ESRAM_SIZE=C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
&gt; +<br>
&gt; +typedef struct MSF2State {<br>
&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ARMv7MState armv7m;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 char *part_name;<br>
&gt; +=C2=A0 =C2=A0 uint64_t envm_size;<br>
&gt; +=C2=A0 =C2=A0 uint64_t esram_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t pclk0;<br>
&gt; +=C2=A0 =C2=A0 uint32_t pclk1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MSF2SysregState sysreg;<br>
&gt; +=C2=A0 =C2=A0 MSSTimerState timer;<br>
&gt; +=C2=A0 =C2=A0 MSSSpiState spi[MSF2_NUM_SPIS];<br>
&gt; +} MSF2State;<br>
&gt; +<br>
&gt; +#endif<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114e68aa10a5fa0550a2ce16--
