Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1915569wru;
        Thu, 16 Aug 2018 07:24:46 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyHdzi9HJMSa2yY+aErlSz99iXihoPoFRxe4oHYQym7R+13mwn061bwvUTjlPRxHrUhWz1R
X-Received: by 2002:a37:2451:: with SMTP id w78-v6mr28090080qkg.218.1534429486770;
        Thu, 16 Aug 2018 07:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429486; cv=none;
        d=google.com; s=arc-20160816;
        b=FtpXgLEizlbnfl3Ph07anaM0mcfFcIFEpPg9+N8Qtz6u1/GcTbJbFPF0WQX5cQN3W7
         db+R+FcYFkbb0RAbVG3CtFHs39HS1xLRe5xt0d2+XcxEUQcYsqPaPiT9Csd9byeT2njD
         zldIVPStg66o5OLHs9uCcHrzcy0pYW2ip7ODi5EoP4o3pI3LWLm8Ii8/aBq16Y5R1gsH
         sjuWllviUp8ZxksvRUQO9JrbMVxty7XFYhe4Pyd1Pc0JrXLtZz+JDKNJqm4O1/G0ZKVd
         Tw0bLvvjuOj3cm5UPkcsMNK/XIBXTXZzmfF+Mc5ToHG6eNMeNCZ463HiwXXPB4yycZX1
         WOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/zvGQMftau9+3ava7PbbbSfxu2MjNDIJwyraRUO/+9o=;
        b=wlc9FXBsx8McpGn4CPBsg4fZMqZQjg5U9v0xMDu/t2r/8pFLxzjXlzntPA6Ib7NmW8
         e/MVwDgkN6N4HYgAU/RX/gbRF62z/yvPMhU3GIGw6SEzEAfUVot3o7el+1+BajGuRoZ4
         izZY++tMuHWO0tuUZurgl0QTbVVJTpKvFZ4KUuctgK34uiFQSan2LVOH8cSY+raDRrSX
         3SkfFEI08CioQGEDck0tOWV8L5KlSu7toXDE9rNSle2r7EaV/ILKkxQNBz6ZHnSFT1fk
         LFYqRGEY1EoX4d5N91LatE6+KEygfV5TDAZj4K3kDZ6jm+2njd6SQ8fsYellANegynD9
         K7Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iWbT13Jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p29-v6si2021654qkl.95.2018.08.16.07.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iWbT13Jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJCg-00014i-8w
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJCO-00012K-Iz
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJCN-0004kt-Ae
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:24:28 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJCN-0004kX-1J
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:24:27 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so8281608oie.13
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/zvGQMftau9+3ava7PbbbSfxu2MjNDIJwyraRUO/+9o=;
	b=iWbT13JxAyLSRmtmOepG1zNbVgbLUI5ERZyFMISjoO/U35Tpr5k8aU5GQ8PQof9XR9
	aT1dX1x5pUFM/7jReeXVLZMLq0v8wkK05TYv5L9We90T3AzKM/I/DtX0DZx5AlgmSnwu
	rK0wWFkYpiqPaG1+KPKbEXEig1orO89FscyoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/zvGQMftau9+3ava7PbbbSfxu2MjNDIJwyraRUO/+9o=;
	b=p3w1OVx7f2tz51eS11GxWxCVYGhf8ssfBBmHkmd4XbBnHGktEbZrGkpffXazcVGcfm
	SkQKZ6GM19G/4pXhRT3FT67NcFDgrmag1WtzVidBZZ/CnceLu6qUJgWHe/oKmY9afR23
	wUUCbkd9WMLTXWC3pWOv8BddSyCIT9irnHsHNz1B9tVnzz+2HC8rg4ERYQIkFYOgMwBP
	Nx7Q/G8F1ZrTcm5Swy2XzEDP4XffQ6ndDB7lkLqB8igKNFyInuIXwva43bg455Qo6efD
	WLCg7MxJMKhUONZPwKY3gRTp5u9+kWfXj8W5tmzQWslV5cPUptamGav751ms/vcCP49L
	ul7Q==
X-Gm-Message-State: AOUpUlF/HbPkfvI4G6ucxcWiOtHWZZOwYU0TSDHf9uDGLN5WfkhTr4fg
	lhXDZrnT4YfdX/jkZxiMLr6UjhuFdR6GL+j1QsU4Qw==
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr33559473oif.23.1534429466237; 
	Thu, 16 Aug 2018 07:24:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:24:05
	-0700 (PDT)
In-Reply-To: <20180816141303.20518-3-joel@jms.id.au>
References: <20180816141303.20518-1-joel@jms.id.au>
	<20180816141303.20518-3-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:24:05 +0100
Message-ID: <CAFEAcA9N_H2PqVUP-W=Sp-SQ4WYpbu5fqyN5hxkHdHGocX59Mg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v5 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m1Q7CU+IfLwd

On 16 August 2018 at 15:13, Joel Stanley <joel@jms.id.au> wrote:
> The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
> plus other common ARM SoC peripherals.
>
>  http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
>
> This defines a basic model of the CPU and memory, with no peripherals
> implemented at this stage.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>   put memory as struct fileds in state structure
>   pass OBJECT(s) as owner, not NULL
>   Add missing addresses for ficr
>   Fix flash and sram sizes for microbit
>   Embed cpu object in state object an initalise it without use of armv7m_init
>   Link to datasheet
> v3:
>   rebase nrf51 on m0 changes
>   remove unused kernel_filename
>   clarify flash and sram size
>   make flash and sram size properties of the soc state
> v4:
>   set the number of interrupts to 32
> v5:
>  move back to armv7m calls, as v4 of Stefan's patch removed the
>  m_profile changes
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
>  include/hw/arm/nrf51_soc.h      |  42 +++++++++++
>  4 files changed, 163 insertions(+)
>  create mode 100644 hw/arm/nrf51_soc.c
>  create mode 100644 include/hw/arm/nrf51_soc.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 311584fd74eb..2ff27c2e1d5a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -101,6 +101,7 @@ CONFIG_STM32F2XX_SYSCFG=y
>  CONFIG_STM32F2XX_ADC=y
>  CONFIG_STM32F2XX_SPI=y
>  CONFIG_STM32F205_SOC=y
> +CONFIG_NRF51_SOC=y
>
>  CONFIG_CMSDK_APB_TIMER=y
>  CONFIG_CMSDK_APB_UART=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2902f47b4c4c..ae4e20373b9e 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -37,3 +37,4 @@ obj-$(CONFIG_IOTKIT) += iotkit.o
>  obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>  obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
>  obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
> +obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> new file mode 100644
> index 000000000000..9f9649c7807d
> --- /dev/null
> +++ b/hw/arm/nrf51_soc.c
> @@ -0,0 +1,119 @@
> +/*
> + * Nordic Semiconductor nRF51 SoC
> + * http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.1.pdf
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/arm/arm.h"
> +#include "hw/sysbus.h"
> +#include "hw/boards.h"
> +#include "hw/devices.h"
> +#include "hw/misc/unimp.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +
> +#include "hw/arm/nrf51_soc.h"
> +
> +#define IOMEM_BASE      0x40000000
> +#define IOMEM_SIZE      0x20000000
> +
> +#define FICR_BASE       0x10000000
> +#define FICR_SIZE       0x000000fc
> +
> +#define FLASH_BASE      0x00000000
> +#define SRAM_BASE       0x20000000
> +
> +/* The size and base is for the NRF51822 part. If other parts
> + * are supported in the future, add a sub-class of NRF51SoC for
> + * the specific variants */

/* and */ both on a line of their own for multiline comments, please.

> +#define NRF51822_FLASH_SIZE     (256 * 1024)
> +#define NRF51822_SRAM_SIZE      (16 * 1024)
> +
> +static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    NRF51State *s = NRF51_SOC(dev_soc);
> +    Error *err = NULL;
> +
> +    if (!s->board_memory) {
> +        error_setg(errp, "memory property was not set");
> +        return;
> +    }
> +
> +    object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "memory",
> +            &err);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);

You need to check whether you get an error after the first call;
you can't stack up multiple calls with a single error check like this.
See the comment in include/qapi/error.h (this is a violation of the
final "Do *not*" in that comment).

> +
> +    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
> +
> +    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", s->flash_size,
> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_set_readonly(&s->flash, true);

memory_region_init_rom() is equivalent to memory_region_init_ram() +
memory_region_set_readonly().


> +    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
> +
> +    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);

Assuming this is the main (largest) ram block in the system, it
should be created with memory_region_allocate_system_memory().

> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
> +
> +    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> +    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +    create_unimplemented_device("nrf51_soc.private", 0xF0000000, 0x10000000);

This looks like some base/size #defines for the 'private' region would
be useful.

> +}
> +
> +static void nrf51_soc_init(Object *obj)
> +{
> +    NRF51State *s = NRF51_SOC(obj);
> +
> +    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
> +
> +    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARMV7M);
> +    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu), &error_abort);
> +    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());

Use sysbus_init_child_obj() rather than this sequence of 3 calls.

> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME("cortex-m0"));
> +    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 32);
> +}
> +
> +static Property nrf51_soc_properties[] = {
> +    DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("sram-size", NRF51State, sram_size, NRF51822_SRAM_SIZE),
> +    DEFINE_PROP_UINT32("flash-size", NRF51State, flash_size, NRF51822_FLASH_SIZE),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

Ah, I was wondering how flash_size was handled when I looked at patch 3.

Instead of your patch 3 board model code reaching into the internals
of the NRF51State struct to pull out the flash_size field, the board
code should set this property on the object it creates, and then it
knows how big the flash it's asked for is and can pass that value also
to the armv7m_load_kernel() function.

> --- /dev/null
> +++ b/include/hw/arm/nrf51_soc.h
> @@ -0,0 +1,42 @@
> +/*
> + * Nordic Semiconductor nRF51  SoC
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef NRF51_SOC_H
> +#define NRF51_SOC_H
> +
> +#include "qemu/osdep.h"

Our convention with osdep.h is that:
 * all .c files must include it as their first header
 * .h files must never include it

thanks
-- PMM
