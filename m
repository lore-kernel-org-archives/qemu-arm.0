Received: by 10.25.44.15 with SMTP id s15csp4918895lfs;
        Tue, 11 Jul 2017 07:35:33 -0700 (PDT)
X-Received: by 10.98.200.208 with SMTP id i77mr46732884pfk.54.1499783732984;
        Tue, 11 Jul 2017 07:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499783732; cv=none;
        d=google.com; s=arc-20160816;
        b=M+0iGWpN/Rtd+q5ZbAwvu07ve1lmipa76Qkj78k9dqtyWR+O2Kf+Nqa8SBDK3v5YQu
         p7mmfEW93scTdSTNy+PXoCVdE3zrOJmbvQ8XfOT/ulWwZhc7wSYytQGFDU/iQI3HW1ci
         kwL+D8qUvUJyQFMuCwo4cK7isI2rXWvO+QU9cRtpKImdTy0+Y9xwXNAbC4N1qCzM7wH6
         TFgnK8aoaC2fKqinpoWw15KtE7kKH/9yIQUY8sP72M1XEBL9Ry1nyaOQ9QiY4kAMdaOC
         XTYJIehsy4Ds57FYNDNp7LD0KF17vAZatu5bY4o8InL/YzpDWio6IBpnEYJunKxaTVWD
         fZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=abJRxO87vIaRrT1NQiJpy7ogfhJmw1RyPnln7E56OY8=;
        b=C6Wu62PHV7s+SmhZS3G0OHsGlt9LITZrms3McIIx8L238o4V2S0e38esCJU+p1+YTi
         yDVmkr6vakBxT4kVctiGu/3eLjc3GToOYy9cIQI+JhwyMZ6amOHgPZOeMGyLxUx3Zc+e
         jFGcEbPXGXSmFwUIOsRrayp9qbij5k2kMQodDonto2KmZEqQU7ttNvHuRi4HLqxcbX1J
         8JEWMOs4RXGktpdeu0mSZfwwy2yKp7vw6tlKr8c4iE2zeS8zCoSl/7N026UwFnc6Urny
         n8MDr0zOxMJMiUh+XwVLvfJbSI0TiObbuznFKxB3KBA8mXV2+GY040CYQCzopSFJaSM3
         ziWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=mPROsUiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 3si64329pfd.360.2017.07.11.07.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 07:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=mPROsUiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUwG2-00037Z-4M
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 10:35:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUwEh-0002Mf-SW
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 10:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUwEb-0004RY-CA
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 10:33:59 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:33465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dUwEb-0004Qe-1r; Tue, 11 Jul 2017 10:33:53 -0400
Received: by mail-wr0-x229.google.com with SMTP id r103so1848713wrb.0;
	Tue, 11 Jul 2017 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=abJRxO87vIaRrT1NQiJpy7ogfhJmw1RyPnln7E56OY8=;
	b=mPROsUiEcG1vM33nyfO8h7WEjOyYJRlQbn1lcL7LRQPu3b3E78k04ymWHidzahhxfy
	zqxv2QH8xt1yl40Bv3vMcJZ7JJ5GQR6F/TKgQfzGiry93X2qFjwM/Dkvzratq8NNrIxA
	Lv3p1OHn8t65zGoJzSO+ZfAK4CWM4E6gpc22h1W57nTdX0o3dKsR8sDlwljc0ZoBn68r
	S20rRHujLlzPUqVXhF6PKqEklOAJEkwWoTIkxiwIPU4jny46nnvlMK7hHqxGVQQ9YT2O
	UOSQi3Ls5hg/Xc9V+JC0iDW70tSjcgCj4bREGKmR/r4ikcaNX0r2QXg9+V3EbbEKrqsY
	QR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=abJRxO87vIaRrT1NQiJpy7ogfhJmw1RyPnln7E56OY8=;
	b=AA6t2/KzA3ENsXe/x5FAUOLPAZ9+ekXufRvT+2e644iYHCSrampdufWnTJwNYbxMiS
	lTmpERvL/Y91DPfyeUcT6MHlvbDN6vhUgCwuOZvGCZFyULkAEt448o5FIdGZBE1yVSXl
	p9kDmZiogPmUU4sK2dkuL66ZK/DqDW9nBjji8UAKOqOM2FFJnl8BLenIQzkkFTmDDNSp
	5N4BuUIeMNHy4GNtwrX+6S61avzRL6aziDeIisd1NHa5JJAqT/6O9D66LzdLbA5nMiws
	yZYIxVbaMYeyDfOVt6fWNAQ0bbYiVfPMqtkSWnKwknYC7nRUeVKRHIERv0iPdV+pW7ay
	6hiA==
X-Gm-Message-State: AIVw112hsmknVYbEMQQqTiA3VKBG/ymvgnhFoWrjjpS4ZHyh372T6Jgo
	VQ9FbQd4USLPIeIAZOS9EJz94GasIQ==
X-Received: by 10.223.168.82 with SMTP id l76mr127148wrc.37.1499783629749;
	Tue, 11 Jul 2017 07:33:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Tue, 11 Jul 2017 07:33:19 -0700 (PDT)
In-Reply-To: <1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jul 2017 16:33:19 +0200
Message-ID: <CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] hw/arm/mps2: Implement
 skeleton mps2-an385 and mps2-an511 board models
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oaa/mEQtpvyg

On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Model the ARM MPS2/MPS2+ FPGA based development board.
>
> The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
> FPGA but is otherwise the same as the 2). Since the CPU itself
> and most of the devices are in the FPGA, the details of the board
> as seen by the guest depend significantly on the FPGA image.
>
> We model the following FPGA images:
>  "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
>  "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511
>
> They are fairly similar but differ in the details for some
> peripherals.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/mps2.c                   | 273 ++++++++++++++++++++++++++++++++++++++++
>  default-configs/arm-softmmu.mak |   1 +
>  3 files changed, 275 insertions(+)
>  create mode 100644 hw/arm/mps2.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 4c5c4ee..a2e56ec 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
> +obj-$(CONFIG_MPS2) += mps2.o

Is this file name possibly too generic? Should it be arm-mps2 instead.

I don't see any other boards with the same name from a Google search,
but it just seems a bit vague having a three letter acronym.

> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> new file mode 100644
> index 0000000..28838bc
> --- /dev/null
> +++ b/hw/arm/mps2.c
> @@ -0,0 +1,273 @@
> +/*
> + * ARM V2M MPS2 board emulation.
> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/* The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
> + * FPGA but is otherwise the same as the 2). Since the CPU itself
> + * and most of the devices are in the FPGA, the details of the board
> + * as seen by the guest depend significantly on the FPGA image.
> + * We model the following FPGA images:
> + *  "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
> + *  "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511
> + *
> + * Links to the TRM for the board itself and to the various Application
> + * Notes which document the FPGA images can be found here:
> + *   https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/arm.h"
> +#include "hw/arm/armv7m.h"
> +#include "hw/boards.h"
> +#include "exec/address-spaces.h"
> +#include "hw/misc/unimp.h"
> +
> +typedef enum MPS2FPGAType {
> +    FPGA_AN385,
> +    FPGA_AN511,
> +} MPS2FPGAType;
> +
> +typedef struct {
> +    MachineClass parent;
> +    MPS2FPGAType fpga_type;
> +    const char *cpu_model;
> +} MPS2MachineClass;
> +
> +typedef struct {
> +    MachineState parent;
> +
> +    ARMv7MState armv7m;
> +    MemoryRegion psram;
> +    MemoryRegion ssram1;
> +    MemoryRegion ssram1_m;
> +    MemoryRegion ssram23;
> +    MemoryRegion ssram23_m;
> +    MemoryRegion blockram;
> +    MemoryRegion blockram_m1;
> +    MemoryRegion blockram_m2;
> +    MemoryRegion blockram_m3;
> +    MemoryRegion sram;
> +} MPS2MachineState;
> +
> +#define TYPE_MPS2_MACHINE "mps2"

This public name seems too common as well. I am just worried it'll
conflict with something one day.

> +#define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
> +#define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
> +
> +#define MPS2_MACHINE(obj)                                       \
> +    OBJECT_CHECK(MPS2MachineState, obj, TYPE_MPS2_MACHINE)
> +#define MPS2_MACHINE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(MPS2MachineClass, obj, TYPE_MPS2_MACHINE)
> +#define MPS2_MACHINE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(MPS2MachineClass, klass, TYPE_MPS2_MACHINE)
> +
> +/* Main SYSCLK frequency in Hz */
> +#define SYSCLK_FRQ 25000000
> +
> +/* Initialize the auxiliary RAM region @mr and map it into
> + * the memory map at @base.
> + */
> +static void make_ram(MemoryRegion *mr, const char *name,
> +                     hwaddr base, hwaddr size)
> +{
> +    memory_region_init_ram(mr, NULL, name, size, &error_fatal);
> +    vmstate_register_ram_global(mr);
> +    memory_region_add_subregion(get_system_memory(), base, mr);
> +}
> +
> +/* Create an alias of an entire original MemoryRegion @orig
> + * located at @base in the memory map.
> + */
> +static void make_ram_alias(MemoryRegion *mr, const char *name,
> +                           MemoryRegion *orig, hwaddr base)
> +{
> +    memory_region_init_alias(mr, NULL, name, orig, 0,
> +                             memory_region_size(orig));
> +    memory_region_add_subregion(get_system_memory(), base, mr);
> +}
> +
> +static void mps2_common_init(MachineState *machine)
> +{
> +    MPS2MachineState *mms = MPS2_MACHINE(machine);
> +    MPS2MachineClass *mmc = MPS2_MACHINE_GET_CLASS(machine);
> +
> +    if (!machine->cpu_model) {
> +        machine->cpu_model = mmc->cpu_model;
> +    }
> +
> +    if (strcmp(machine->cpu_model, mmc->cpu_model) != 0) {
> +        error_report("This board can only be used with CPU %s", mmc->cpu_model);
> +        exit(1);
> +    }
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +
> +    DeviceState *armv7m;

These should be at the top of the function.

> +
> +    /* The FPGA images have an odd combination of different RAMs,
> +     * because in hardware they are different implementations and
> +     * connected to different buses, giving varying performance/size
> +     * tradeoffs. For QEMU they're all just RAM, though. We arbitrarily
> +     * call the 16MB our "system memory", as it's the largest lump.
> +     *
> +     * Common to both boards:
> +     *  0x21000000..0x21ffffff : PSRAM (16MB)
> +     * AN385 only:
> +     *  0x00000000 .. 0x003fffff : ZBT SSRAM1
> +     *  0x00400000 .. 0x007fffff : mirror of ZBT SSRAM1
> +     *  0x20000000 .. 0x203fffff : ZBT SSRAM 2&3
> +     *  0x20400000 .. 0x207fffff : mirror of ZBT SSRAM 2&3
> +     *  0x01000000 .. 0x01003fff : block RAM (16K)
> +     *  0x01004000 .. 0x01007fff : mirror of above
> +     *  0x01008000 .. 0x0100bfff : mirror of above
> +     *  0x0100c000 .. 0x0100ffff : mirror of above
> +     * AN511 only:
> +     *  0x00000000 .. 0x0003ffff : FPGA block RAM
> +     *  0x00400000 .. 0x007fffff : ZBT SSRAM1
> +     *  0x20000000 .. 0x2001ffff : SRAM
> +     *  0x20400000 .. 0x207fffff : ZBT SSRAM 2&3
> +     *
> +     * The AN385 has a feature where the lowest 16K can be mapped
> +     * either to the bottom of the ZBT SSRAM1 or to the block RAM.
> +     * This is of no use for QEMU so we don't implement it (as if
> +     * zbt_boot_ctrl is always zero).
> +     */
> +    memory_region_allocate_system_memory(&mms->psram,
> +                                         NULL, "mps.ram", 0x1000000);
> +    memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
> +
> +    switch (mmc->fpga_type) {
> +    case FPGA_AN385:
> +        make_ram(&mms->ssram1, "mps.ssram1", 0x0, 0x400000);
> +        make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", &mms->ssram1, 0x400000);
> +        make_ram(&mms->ssram23, "mps.ssram23", 0x20000000, 0x400000);
> +        make_ram_alias(&mms->ssram23_m, "mps.ssram23_m",
> +                       &mms->ssram23, 0x20400000);
> +        make_ram(&mms->blockram, "mps.blockram", 0x01000000, 0x4000);
> +        make_ram_alias(&mms->blockram_m1, "mps.blockram_m1",
> +                       &mms->blockram, 0x01004000);
> +        make_ram_alias(&mms->blockram_m2, "mps.blockram_m2",
> +                       &mms->blockram, 0x01008000);
> +        make_ram_alias(&mms->blockram_m3, "mps.blockram_m3",
> +                       &mms->blockram, 0x0100c000);
> +        break;
> +    case FPGA_AN511:
> +        make_ram(&mms->blockram, "mps.blockram", 0x0, 0x40000);
> +        make_ram(&mms->ssram1, "mps.ssram1", 0x00400000, 0x00800000);
> +        make_ram(&mms->sram, "mps.sram", 0x20000000, 0x20000);
> +        make_ram(&mms->ssram23, "mps.ssram23", 0x20400000, 0x400000);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    object_initialize(&mms->armv7m, sizeof(mms->armv7m), TYPE_ARMV7M);
> +    armv7m = DEVICE(&mms->armv7m);
> +    qdev_set_parent_bus(armv7m, sysbus_get_default());
> +    switch (mmc->fpga_type) {
> +    case FPGA_AN385:
> +        qdev_prop_set_uint32(armv7m, "num-irq", 32);
> +        break;
> +    case FPGA_AN511:
> +        qdev_prop_set_uint32(armv7m, "num-irq", 64);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    qdev_prop_set_string(armv7m, "cpu-model", machine->cpu_model);
> +    object_property_set_link(OBJECT(&mms->armv7m), OBJECT(system_memory),
> +                             "memory", &error_abort);
> +    object_property_set_bool(OBJECT(&mms->armv7m), true, "realized",
> +                             &error_fatal);
> +
> +    create_unimplemented_device("zbtsmram mirror", 0x00400000, 0x00400000);
> +    create_unimplemented_device("RESERVED 1", 0x00800000, 0x00800000);
> +    create_unimplemented_device("Block RAM", 0x01000000, 0x00010000);
> +    create_unimplemented_device("RESERVED 2", 0x01010000, 0x1EFF0000);
> +    create_unimplemented_device("RESERVED 3", 0x20800000, 0x00800000);
> +    create_unimplemented_device("PSRAM", 0x21000000, 0x01000000);
> +    /* These three ranges all cover multiple devices; we may implement
> +     * some of them below (in which case the real device takes precedence
> +     * over the unimplemented-region mapping).
> +     */
> +    create_unimplemented_device("CMSDK APB peripheral region @0x40000000",
> +                                0x40000000, 0x00010000);
> +    create_unimplemented_device("CMSDK peripheral region @0x40010000",
> +                                0x40010000, 0x00010000);
> +    create_unimplemented_device("Extra peripheral region @0x40020000",
> +                                0x40020000, 0x00010000);
> +    create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
> +    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
> +    create_unimplemented_device("VGA", 0x41000000, 0x0200000);

I did not know this was an option, this is pretty cool.

Besides the name I think this patch looks good.

Thanks,
Alistair
