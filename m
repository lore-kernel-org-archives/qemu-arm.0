Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1066946wrt;
        Thu, 3 Jan 2019 13:34:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4eK2j9CxZ0c4ya+juyyW5jkpdP/gg42FeQeGDN7aOyKNiQDdNR1qG7hlhNECwaJo/rjl8u
X-Received: by 2002:ac8:593:: with SMTP id a19mr46663292qth.111.1546551241918;
        Thu, 03 Jan 2019 13:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546551241; cv=none;
        d=google.com; s=arc-20160816;
        b=0Mnq0fX90IMDb4+PsfXUG9CPvEGHVOTXzY39O/b8CxgWbf4WfbNpwO8zIloJCkDvNl
         Q2NVzQbs2TSvjzPOXGMQl34TJi6qEozNYJtN2z0JzvaJrpnU+0QMRVd/Z8Zgw9pckv+q
         thTlFhAF9VWv+YI7q9m49+CeBey1nV8kRkAtP5VZSeGEBG2NNWLlv3PZTQdifBWm/Bdn
         nZtxzRuDIjm/Li6pZ88qgn0GRVUVSZfScIeHLxlt4fizPKCkFfIh9NtpJ2K0Glv6Y98U
         z9nus+uKxnBf6m+h+5NZqQb8tfF1GmvBjN2joCHmVK0TVV2yad+/7iKLsw/Ei8v6AF0O
         L+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvL4+L3cnNOSOTuB3dxSq8M1J1PON4vxsjrjnmHL7n8=;
        b=SnStyi7GTgXuJ8sbNtq3aaC3VLP7Yu2nGJOqTCYgDCWpC0mYuQEhP1g2azz8cALSOv
         UdhnSW7QHXJUBi9vhKp/PDO+lGDlj4EIeJlKve8u3vywjwO2MvVnTdp8CH18f3DCskFJ
         fQRjjyoUXJ7PEukQEteG8xS/+mUAyHTtC60b0uuS6fgUXuwL+O7A/c60ITYqfa1h30DF
         C6DCXZaAgFjcHbMtiSutjJa8pNBUv2sxX1+lD8c1xfMkOTVk6UEDf8aPObsvgMQIBQu8
         m93e40qY/E6F+jq2YdF/I+TVWVhw84sIAORoaWAAUr4PWBbkb/l1XeFTvK51kXngFqfX
         EHNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hcmHkiDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o127si9058159qkd.13.2019.01.03.13.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 13:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hcmHkiDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfAcr-0004Yo-8H
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 16:34:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gfAcY-0004U9-20
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 16:33:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gfAcW-00031h-I1
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 16:33:42 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gfAcS-0002z0-VB; Thu, 03 Jan 2019 16:33:37 -0500
Received: by mail-lj1-x244.google.com with SMTP id x85-v6so30903436ljb.2;
	Thu, 03 Jan 2019 13:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZvL4+L3cnNOSOTuB3dxSq8M1J1PON4vxsjrjnmHL7n8=;
	b=hcmHkiDisd7WqTfuDUkMMZbH+MjRzSZZjLfR7igYn43zGb6aWrb7uYQ3N9idnFrIMh
	5Bwj1oWWepK6u4+eQnlVHkFxO0l3Kxntiy+YHLrYq7ze891aDLpiVvutfEtLzUwCYhfS
	TCtyzJgRWASaWp8BLkV4AbGXE2ac1iks5evzRh6LQyjapyahoH/vy3Dv5XbBXIarwTJM
	lNAO3za7YIhVglTRii+12ZgmGIqt1yJUm84gZwrFkq3sw0iRWax8OXy8oTHAfz0zpxYv
	+7MFTzgs8jfjwmuaMuIgBXAynulaTRkIZG71L6EIn+NrzhJzgLcBqrIsiU4bRedFggvh
	Vpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZvL4+L3cnNOSOTuB3dxSq8M1J1PON4vxsjrjnmHL7n8=;
	b=BvDTJVWgquXXvhKxjP08TKSdT612e8RF3eMz0XKWRLLF8eGCf2XHfqXNosk+97ojyj
	AgvFzaHU4D5YRlBH3NGl0CNbY8WaQ0PXHLLt6nYjZ25uv79nmoENQxPNLeI+J9rpF3HW
	puOjmdeM2PRByOS/OehKGx/c/KPIWhQixyP9VP36pNM/Q19ABN6mg23cgLoBoFv3qVo3
	7w/iQpZLzm/HIzUIH7ZDTbHAIPwpci8hEZsUbfQwg5ePZqkO6lk39xsND3eF+nzB0TZe
	PBYqLG4Nb/kKh0vZFA9paG942skshIEixYgaFy1nEC3VCpUD+xU1LCpWIlm+OlJT9Ciy
	J1bw==
X-Gm-Message-State: AJcUukd8xsomQeL2vzVu7R7HI6NFww7fJurbEgQ+0nM8KEpUdRHR1aD/
	pMw/N3krImoTm22AmQTzPnp25I9WZbyTF4pXpHc=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr24969467lji.145.1546551215313; 
	Thu, 03 Jan 2019 13:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20181226190702.403-1-plaes@plaes.org>
In-Reply-To: <20181226190702.403-1-plaes@plaes.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 13:33:08 -0800
Message-ID: <CAKmqyKMBwBjV-8b=kNjqqWkG08a-dnLPLUxwCNw73q7TpOjEgA@mail.gmail.com>
To: Priit Laes <plaes@plaes.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] stm32f103: Add initial
 skeleton of STM32 F103 SoC
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
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AThmTt1YEBte

On Wed, Dec 26, 2018 at 11:08 AM Priit Laes <plaes@plaes.org> wrote:
>
> Initial barebone SoC implementation for STM32F103
> with "Blue Pill" board source for testing.
>
> Code is based on both nrf51/microbit and stm32f205.
>
> Although code loads and seems to be at the right
> addresses it does not yet run:
>
> ./arm-softmmu/qemu-system-arm -nographic \
>         -machine stm32bluepill \
>         -kernel \
>         libopencm3-miniblink/bin/stm32/bluepill.bin
> QEMU 3.1.50 monitor - type 'help' for more information
> (qemu) QEMU 3.1.50 monitor - type 'help' for more information
> (qemu) gdbserver
> Waiting for gdb connection on device 'tcp::1234'
>
> $ arm-none-eabi-gdb \
>         libopencm3-miniblink/bin/stm32/bluepill.elf
> (gdb) target remote tcp::1234
> Remote debugging using tcp::1234
> blocking_handler () at ../../cm3/vector.c:103
> 103     {
> (gdb) bt
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> (gdb) info line
> Line 103 of "../../cm3/vector.c" starts at address 0x8000380 \
>         <blocking_handler> and ends at 0x8000382 <null_handler>.
>
> Any ideas?

Have you tried running QEMU with the -d option (-d in_asm is a good
place to start)? Does that shed any light on what is happening?

Alistair

>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/arm/Makefile.objs            |  1 +
>  hw/arm/stm32f103_blue_pill.c    | 78 ++++++++++++++++++++++++++++
>  hw/arm/stm32f103_soc.c          | 92 +++++++++++++++++++++++++++++++++
>  include/hw/arm/stm32f103_soc.h  | 54 +++++++++++++++++++
>  5 files changed, 226 insertions(+)
>  create mode 100644 hw/arm/stm32f103_blue_pill.c
>  create mode 100644 hw/arm/stm32f103_soc.c
>  create mode 100644 include/hw/arm/stm32f103_soc.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491aac..7a55e523e1 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -95,6 +95,7 @@ CONFIG_RASPI=y
>  CONFIG_REALVIEW=y
>  CONFIG_ZAURUS=y
>  CONFIG_ZYNQ=y
> +CONFIG_STM32F103_SOC=y
>  CONFIG_STM32F2XX_TIMER=y
>  CONFIG_STM32F2XX_USART=y
>  CONFIG_STM32F2XX_SYSCFG=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 50c7b4a927..7f59a9349d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -24,6 +24,7 @@ obj-$(CONFIG_OMAP) += omap1.o omap2.o
>  obj-$(CONFIG_STRONGARM) += strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
>  obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
> +obj-$(CONFIG_STM32F103_SOC) += stm32f103_soc.o stm32f103_blue_pill.o
>  obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
>  obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
> diff --git a/hw/arm/stm32f103_blue_pill.c b/hw/arm/stm32f103_blue_pill.c
> new file mode 100644
> index 0000000000..09dd69aa71
> --- /dev/null
> +++ b/hw/arm/stm32f103_blue_pill.c
> @@ -0,0 +1,78 @@
> +/*
> + * STM32F103C8 Blue Pill development board Machine Model
> + *
> + * Copyright (c) 2018 Priit Laes <plaes@plaes.org>
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
> +#include "hw/boards.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/arm/stm32f103_soc.h"
> +
> +typedef struct {
> +    MachineState parent;
> +
> +    STM32F103State stm32f103;
> +} STM32BluePillMachineState;
> +
> +#define TYPE_STM32BLUEPILL_MACHINE MACHINE_TYPE_NAME("stm32bluepill")
> +
> +#define STM32BLUEPILL_MACHINE(obj) \
> +    OBJECT_CHECK(STM32BluePillMachineState, obj, TYPE_STM32BLUEPILL_MACHINE)
> +
> +static void stm32bluepill_init(MachineState *machine)
> +{
> +    STM32BluePillMachineState *s = STM32BLUEPILL_MACHINE(machine);
> +    Object *soc = OBJECT(&s->stm32f103);
> +
> +    sysbus_init_child_obj(OBJECT(machine), "stm32f103-soc", soc,
> +                          sizeof(s->stm32f103), TYPE_STM32F103_SOC);
> +    object_property_set_bool(soc, true, "realized", &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       FLASH_SIZE);
> +}
> +
> +static void stm32bluepill_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "STM32F103 Blue Pill development board";
> +    mc->init = stm32bluepill_init;
> +    mc->max_cpus = 1;
> +}
> +
> +static const TypeInfo stm32bluepill_info = {
> +    .name = TYPE_STM32BLUEPILL_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .instance_size = sizeof(STM32BluePillMachineState),
> +    .class_init = stm32bluepill_machine_class_init,
> +};
> +
> +static void stm32bluepill_machine_init(void)
> +{
> +    type_register_static(&stm32bluepill_info);
> +}
> +
> +type_init(stm32bluepill_machine_init);
> diff --git a/hw/arm/stm32f103_soc.c b/hw/arm/stm32f103_soc.c
> new file mode 100644
> index 0000000000..3093bce4ea
> --- /dev/null
> +++ b/hw/arm/stm32f103_soc.c
> @@ -0,0 +1,92 @@
> +/*
> + * STM32 F103 SoC (or MCU)
> + *
> + * Copyright 2018 Priit Laes <plaes@plaes.org>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/arm/stm32f103_soc.h"
> +
> +#define FLASH_BASE      0x08000000
> +#define SRAM_BASE       0x20000000
> +
> +static void stm32f103_soc_init(Object *obj)
> +{
> +    STM32F103State *s = STM32F103_SOC(obj);
> +
> +    sysbus_init_child_obj(obj, "armv7m", &s->cpu, sizeof(s->cpu),
> +                      TYPE_ARMV7M);
> +}
> +
> +static void stm32f103_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    STM32F103State *s = STM32F103_SOC(dev_soc);
> +    Error *err = NULL;
> +
> +    /*
> +     * XXX: Region 0x1FFF F000 - 0x1FFF F7FF is called "System Memory"
> +     * containing boot loader used to reprogram flash by using USART1.
> +     */
> +    MemoryRegion *system_memory = get_system_memory();
> +
> +    memory_region_init_rom(&s->flash, NULL, "stm32.flash", FLASH_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, FLASH_BASE, &s->flash);
> +    /*
> +     * TODO: based on BOOT pin, 0x00000000 - 0x0007FFFF is aliased to
> +     * either Flash or system memory. We currently hardcode it to flash.
> +     */
> +    memory_region_init_alias(&s->flash_alias, NULL, "stm32.flash_alias",
> +                             &s->flash, 0, FLASH_SIZE);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
> +
> +    memory_region_init_ram(&s->sram, NULL, "stm32.sram", SRAM_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE, &s->sram);
> +
> +    qdev_prop_set_bit(DEVICE(&s->cpu), "enable-bitband", true);
> +    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 80);
> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
> +
> +    object_property_set_link(OBJECT(&s->cpu), OBJECT(system_memory),
> +                                    "memory", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +}
> +
> +static Property stm32f103_soc_properties[] = {
> +    DEFINE_PROP_UINT32("flash-size", STM32F103State, flash_size, FLASH_SIZE),
> +    DEFINE_PROP_UINT32("sram-size", STM32F103State, sram_size, SRAM_SIZE),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void stm32f103_soc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props   = stm32f103_soc_properties;
> +    dc->realize = stm32f103_soc_realize;
> +}
> +
> +static const TypeInfo stm32f103_soc_info = {
> +    .name          = TYPE_STM32F103_SOC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(STM32F103State),
> +    .instance_init = stm32f103_soc_init,
> +    .class_init    = stm32f103_soc_class_init,
> +};
> +
> +static void stm32f103_soc_types(void)
> +{
> +    type_register_static(&stm32f103_soc_info);
> +}
> +type_init(stm32f103_soc_types)
> diff --git a/include/hw/arm/stm32f103_soc.h b/include/hw/arm/stm32f103_soc.h
> new file mode 100644
> index 0000000000..d6b2eb9c57
> --- /dev/null
> +++ b/include/hw/arm/stm32f103_soc.h
> @@ -0,0 +1,54 @@
> +/*
> + * STM32 F103 SoC (or MCU)
> + *
> + * Copyright (c) 2018 Priit Laes <plaes@plaes.org>
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
> +#ifndef HW_ARM_STM32F103_SOC_H
> +#define HW_ARM_STM32F103_SOC_H
> +
> +#include "hw/arm/armv7m.h"
> +
> +#define TYPE_STM32F103_SOC "stm32f103-soc"
> +#define STM32F103_SOC(obj) \
> +    OBJECT_CHECK(STM32F103State, (obj), TYPE_STM32F103_SOC)
> +
> +/* TODO: flash/sram sizes are for STM32F103C8 part. */
> +#define FLASH_SIZE     (64 * 1024)
> +#define SRAM_SIZE      (20 * 1024)
> +
> +typedef struct STM32F103State {
> +    SysBusDevice parent_obj;
> +
> +    ARMv7MState cpu;
> +
> +    uint32_t sram_size;
> +    uint32_t flash_size;
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    /* XXX: find better name */
> +    MemoryRegion flash_alias;
> +
> +    /* TODO: Peripherals */
> +
> +} STM32F103State;
> +
> +#endif /* HW_ARM_STM32F103_SOC_H */
> --
> 2.20.1
>
>
