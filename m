Received: by 10.25.208.211 with SMTP id h202csp2904945lfg;
        Thu, 25 Feb 2016 08:37:05 -0800 (PST)
X-Received: by 10.140.217.209 with SMTP id n200mr33822668qhb.101.1456418224992;
        Thu, 25 Feb 2016 08:37:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si8690493qhc.104.2016.02.25.08.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 08:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYyuW-0003D3-HG
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 11:37:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYyu6-0002p0-P0
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:36:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYyu5-0008S2-IG
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:36:38 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYyu5-0008Rx-2f
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:36:37 -0500
Received: by mail-vk0-x235.google.com with SMTP id k196so53106713vka.0
	for <qemu-devel@nongnu.org>; Thu, 25 Feb 2016 08:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=10/d4y6YCOZbIZFbSHjBuAcMVk10v8l6utUg/o3StPU=;
	b=izgl6sm+bPYuUT+6ptOUY2rA+cVnsP+Uim1cChFcQNFTb3hmZmYxqyT0h23xYjh/kS
	OU7gYGLGuHKGpr02SvJlOmjCi8dxfa1w55IGxDj4oGBV0g0tyzNv9jBtVIRMECyUV6gW
	nBu9TlrsHCbgEFjYF5iqj4wTifGy+ibshopQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=10/d4y6YCOZbIZFbSHjBuAcMVk10v8l6utUg/o3StPU=;
	b=iMwj31nCagXigWHDxG4p7WxgMG3JItYunJ9DQvBtUccdWFQsgqPrmm9erVbsJJiNU/
	i4kpL3JBuS4kQ9nTUw1zXF4aJd8D613YaMJzfLQhlO/EOVYsizrb9bS+gwNu8mrQYU0H
	4ujNEIaMtK9o8cDXMGeKCmz2REujxePGFZ6m8bH/k7VJCyOmcEhDRaV+340LNp454RwM
	rxapwhsjyTHsnKByvMAAq2Y8T+pi7aZSb2JbvRGOrZW9LNnD2xAODHKDUVWR9uHzOivu
	XgdzEIreLpFm/wKt+pfMEEfRkqPitlLr2BP7h2yZp8vQW5Z0IzsV+cIep89V317Sr/py
	ivuw==
X-Gm-Message-State: AG10YOScbrWPHYUL57eCeTwWYve37fVLnEAXMMtx+hjuzXCyN7cnNBmiTc+Blv/oN3sARyneKRUaHWZfQx6hFDOk
X-Received: by 10.31.141.2 with SMTP id p2mr38139374vkd.37.1456418196657; Thu,
	25 Feb 2016 08:36:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:36:17 -0800 (PST)
In-Reply-To: <1455622497-25966-4-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-4-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:36:17 +0000
Message-ID: <CAFEAcA9dpV72335ZijOAviKsRg5KMWQQ3QVc8_fuvQHfuT_Tbg@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 3/3] hw/arm: Add ASPEED
	AST2400 machine type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SSCcYXPK512O

On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> Adds the AST2400 machine type with ASPEED AVIC and timer models. The
> new machine type is functional enough to boot Linux to userspace.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

This seems to be missing an "SoC object" level of modelling between the
devices and the board code. Have a look at the Xilinx, raspi, etc board
models for examples.

> ---
>  hw/arm/Makefile.objs |   1 +
>  hw/arm/ast2400.c     | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  trace-events         |   4 ++
>  3 files changed, 144 insertions(+)
>  create mode 100644 hw/arm/ast2400.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index a711e4d..f333b7f 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -16,3 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> +obj-$(CONFIG_ASPEED_SOC) += ast2400.o
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> new file mode 100644
> index 0000000..e3cd496
> --- /dev/null
> +++ b/hw/arm/ast2400.c
> @@ -0,0 +1,139 @@
> +/*
> + * ASPEED AST2400
> + *
> + * Jeremy Kerr <jk@ozlabs.org>
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2015, 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Based off of the i.MX31 Vectored Interrupt Controller

Really? :-)

> + *
> + * Note that this device model does not implement the legacy register space.
> + * The assumption is that the device base address is exposed such that all
> + * offsets are calculated relative to the address of the first "new" register.

This looks like copy-n-paste error too.

> + */
> +

#include "qemu/osdep.h".

> +#include "exec/address-spaces.h"
> +#include "hw/arm/arm.h"
> +#include "hw/boards.h"
> +#include "hw/char/serial.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/aspeed_vic.h"
> +#include "hw/timer/aspeed_timer.h"
> +#include "trace.h"
> +
> +#define ASPEED_SDRAM_BASE 0x40000000
> +#define ASPEED_IOMEM_BASE 0x1e600000
> +#define ASPEED_IOMEM_SIZE 0x00200000
> +#define ASPEED_TIMER_BASE 0x1E782000
> +#define ASPEED_VIC_BASE 0x1E6C0080
> +
> +static struct arm_boot_info ast2400_binfo = {
> +    .loader_start = ASPEED_SDRAM_BASE,
> +    .board_id = 0,
> +};
> +
> +/*
> + * IO handler: simply catch any reads/writes to IO addresses that aren't
> + * handled by a device mapping.
> + */
> +static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
> +{
> +    trace_ast2400_io_read(offset, size);

This is just to diagnose "missing device implementation", right?
Shouldn't we be using a LOG_UNIMP instead?

> +    return 0;
> +}
> +
> +static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value,
> +                unsigned size)
> +{
> +    trace_ast2400_io_write(offset, value, size);
> +}
> +
> +static const MemoryRegionOps ast2400_io_ops = {
> +    .read = ast2400_io_read,
> +    .write = ast2400_io_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +typedef struct AspeedState {
> +    ARMCPU *cpu;
> +    MemoryRegion *address_space;
> +    MemoryRegion *ram;
> +    ram_addr_t ram_size;
> +    MemoryRegion *iomem;
> +    AspeedVICState avic;
> +    AspeedTimerState timer;
> +} AspeedState;
> +
> +static void ast2400_init(MachineState *machine)
> +{
> +    AspeedState ast2400;
> +    DeviceState *dev;
> +    qemu_irq pic[ASPEED_VIC_NR_IRQS] = {0};
> +    int i;
> +
> +    if (!machine->cpu_model) {
> +        machine->cpu_model = "arm926";

What we do now is not let the user override the cpu model at all;
presumably this SoC only ever has an ARM926 and it doesn't make
any sense to have some frankenstein "this SoC but with a different
CPU in it" config.

> +    }
> +
> +    ast2400.cpu = cpu_arm_init(machine->cpu_model);
> +    if (!ast2400.cpu) {
> +        fprintf(stderr, "Unable to find CPU definition\n");

Prefer error_report() to plain fprintf.

> +        exit(1);
> +    }
> +
> +    ast2400.address_space = get_system_memory();
> +    ram_size = machine->ram_size;
> +
> +    /* System RAM */
> +    ast2400.ram = g_new(MemoryRegion, 1);
> +    memory_region_allocate_system_memory(ast2400.ram, NULL, "ast2400.ram",
> +            ram_size);
> +    memory_region_add_subregion(ast2400.address_space, ASPEED_SDRAM_BASE,
> +            ast2400.ram);
> +
> +    /* IO space */
> +    ast2400.iomem = g_new(MemoryRegion, 1);
> +    memory_region_init_io(ast2400.iomem, NULL, &ast2400_io_ops, NULL,
> +            "ast2400.io", ASPEED_IOMEM_SIZE);
> +    memory_region_add_subregion(ast2400.address_space, ASPEED_IOMEM_BASE,
> +            ast2400.iomem);
> +
> +    /* AVIC */
> +    dev = sysbus_create_varargs(TYPE_ASPEED_VIC, ASPEED_VIC_BASE,
> +                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_IRQ),
> +                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_FIQ),
> +                    NULL);
> +
> +    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
> +        pic[i] = qdev_get_gpio_in(dev, i);
> +    }
> +
> +    /* Timer */
> +    sysbus_create_varargs(TYPE_ASPEED_TIMER, ASPEED_TIMER_BASE, pic[16],
> +            pic[17], pic[18], pic[35], pic[36], pic[37], pic[38], pic[39],
> +            NULL);
> +
> +    /* UART - attach an 8250 to the IO space as our UART5 */
> +    if (serial_hds[0]) {
> +            serial_mm_init(ast2400.iomem, 0x184000, 2, pic[10], 38400,
> +                    serial_hds[0], DEVICE_NATIVE_ENDIAN);
> +    }

Most of this should live in the SoC object rather than the board model.

> +
> +    ast2400_binfo.kernel_filename = machine->kernel_filename;
> +    ast2400_binfo.initrd_filename = machine->initrd_filename;
> +    ast2400_binfo.kernel_cmdline = machine->kernel_cmdline;
> +    ast2400_binfo.ram_size = ram_size;
> +    arm_load_kernel(ast2400.cpu, &ast2400_binfo);
> +}
> +
> +static void ast2400_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "ASpeed ast2400 BMC (ARM926EJ-S)";
> +    mc->init = ast2400_init;
> +}

Should we be setting more of the MachineClass fields here?
(eg block_default_type, no_parallel, no_floppy, no_cdrom, max_cpus,
default_ram_size ?)

thanks
-- PMM
