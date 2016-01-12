Received: by 10.25.159.19 with SMTP id i19csp278936lfe;
        Mon, 11 Jan 2016 19:58:09 -0800 (PST)
X-Received: by 10.140.32.203 with SMTP id h69mr41809511qgh.55.1452571089318;
        Mon, 11 Jan 2016 19:58:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si50548115qkh.31.2016.01.11.19.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq5w-0007vF-Va
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:58:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq5t-0007qg-Gl
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:58:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq5r-0001T3-RV
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:58:05 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq5l-0001SW-V4; Mon, 11 Jan 2016 22:57:58 -0500
Received: by mail-pf0-x244.google.com with SMTP id e65so4346560pfe.0;
	Mon, 11 Jan 2016 19:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9iacchMy5Oo/SdbvKeU0t7fNnrXlxaUuo6GyxBbCuOU=;
	b=xggr8PhPvbgGFdy4//cEbS3dDzCEbq1HRRpmIKFV5/TbEIP4MQX8KezvwA+adanJVU
	AodJlxW+zj00vIynyYHnwO0nlv+aiWYMCu6/AOyuQVIxlkUt+TmNt69U+B1KNg/c0Gdi
	BsesaXHijr+uNdjoP0MtUQWAhzS2UEdHOtqsTRfb0LuTGnFGBKveD+yCQlgr4cuin4Kt
	8ieL1MfKnLjvT9ktwaTBuy1Yolr8hbYXiGiBay980RABdnVzSz4JVhhNboIOdzXmsuby
	GHS1teFGbpdEhi4waQUjIl7s/POFyG6fp625dRBmgn1/aUbiN+Uc9NH/ETRUhujOHBR7
	bU5w==
X-Received: by 10.98.64.215 with SMTP id f84mr31350994pfd.113.1452571077344;
	Mon, 11 Jan 2016 19:57:57 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	v7sm26391318pfa.77.2016.01.11.19.57.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:57:56 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:57:53 -0800
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-ID: <20160112035753.GD3308@pcrost-box>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8xWkIgm4uRoo

On Thu, Dec 31, 2015 at 04:31:34PM -0800, Andrew Baumann wrote:
> bcm2835/Pi1 requires more peripherals, and will be added in a later
> patch series.
> 
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> 
> Notes:
>     v3:
>      * fix board setup to remain Pi1 compatible
>      * pass ram property
> 
>  hw/arm/Makefile.objs |   2 +-
>  hw/arm/raspi.c       | 180 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 181 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/raspi.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index f55f8d2..a711e4d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>  obj-$(CONFIG_DIGIC) += digic.o
>  obj-y += omap1.o omap2.o strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
> -obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o
> +obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
>  obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> new file mode 100644
> index 0000000..b73f544
> --- /dev/null
> +++ b/hw/arm/raspi.c
> @@ -0,0 +1,180 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
> + *
> + * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + *
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +/* Based on versatilepb.c, copyright terms below. */
> +
> +/*

No need to break and restart comments.

> + * ARM Versatile Platform/Application Baseboard System emulation.
> + *

Looks unrelated, I think this has reached total-rewrite status.

> + * Copyright (c) 2005-2007 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#include "hw/arm/bcm2836.h"
> +#include "qemu/error-report.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "hw/arm/arm.h"
> +#include "sysemu/sysemu.h"
> +
> +#define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
> +#define MVBAR_ADDR      0x400 /* secure vectors */
> +#define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
> +#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
> +
> +/* Table of Linux board IDs for different Pi versions */
> +static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
> +
> +typedef struct RaspiMachineState {
> +    union {
> +        Object obj;
> +        BCM2836State pi2;
> +    } soc;
> +    MemoryRegion ram;
> +} RaspiMachineState;
> +
> +static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    static const uint32_t smpboot[] = {
> +        0xE1A0E00F, /*    mov     lr, pc */
> +        0xE3A0FE42, /*    mov     pc, #0x420           ;call BOARDSETUP_ADDR */

Check highbank blobs to see how machine code addresses can be done as
relocatable. We should try and make these blobs relocatable from the top
level address definitions where possible.

> +        0xEE100FB0, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
> +        0xE7E10050, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
> +        0xE59F5014, /*    ldr     r5, =0x400000CC      ;load mbox base */
> +        0xE320F001, /* 1: yield */
> +        0xE7953200, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core*/
> +        0xE3530000, /*    cmp     r3, #0               ;spin while zero */
> +        0x0AFFFFFB, /*    beq     1b */
> +        0xE7853200, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
> +        0xE12FFF13, /*    bx      r3                   ;jump to target */
> +        0x400000CC, /* (constant: mailbox 3 read/clear base) */
> +    };
> +
> +    assert(SMPBOOT_ADDR + sizeof(smpboot) <= MVBAR_ADDR);
> +    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
> +                       info->smp_loader_start);
> +}
> +
> +static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)

This is almost identical to Highbank, I'm guessing you are stubbing monitor
firmware where you get away with nopping all the SMCs? Maybe we should split
Highbanks version off to common code, and parameterise the few differences.

write_board_setup_dummy_monitior(ARMCPU *cpu ..., uint32_t scr_flags);

or something like it. Makes sense to be in arm/boot.c .

> +{
> +    static const uint32_t board_setup[] = {
> +        /* MVBAR_ADDR: secure monitor vectors */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        /* BOARDSETUP_ADDR */
> +        0xE3A00B01, /* mov     r0, #0x400             ;MVBAR_ADDR */
> +        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
> +        0xE3A00031, /* mov     r0, #0x31              ;enable AW, FW, NS */
> +        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */

If combining with HB, could you do this as read-modify-write?

> +        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
> +        0xE1600070, /* smc     #0                     ;monitor call */
> +        0xE1A0F001, /* mov     pc, r1                 ;return */

I'm looking at the Highbank version which doesn't save lr across the SMC and
wondering why it doesn't. Is this banked by CPU mode and do you get from
already-in-monitor-mode? Or simply, that Highbank code may have a bug?

> +    };
> +
> +    rom_add_blob_fixed("raspi_boardsetup", board_setup, sizeof(board_setup),
> +                       MVBAR_ADDR);
> +}
> +
> +static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    CPUState *cs = CPU(cpu);
> +    cpu_set_pc(cs, info->smp_loader_start);
> +}
> +
> +static void setup_boot(MachineState *machine, int version, size_t ram_size)
> +{
> +    static struct arm_boot_info binfo;
> +    int r;
> +
> +    binfo.board_id = raspi_boardid[version];
> +    binfo.ram_size = ram_size;
> +    binfo.nb_cpus = smp_cpus;
> +    binfo.board_setup_addr = BOARDSETUP_ADDR;
> +    binfo.write_board_setup = write_board_setup;
> +    binfo.secure_board_setup = true;
> +    binfo.secure_boot = true;
> +
> +    /* Pi2 requires SMP setup */
> +    if (version == 2) {
> +        binfo.smp_loader_start = SMPBOOT_ADDR;
> +        binfo.write_secondary_boot = write_smpboot;
> +        binfo.secondary_cpu_reset_hook = reset_secondary;
> +    }
> +
> +    /* If the user specified a "firmware" image (e.g. UEFI), we bypass
> +       the normal Linux boot process */

Multi-line comment style should be

/* text
 * text
 */

> +    if (machine->firmware) {
> +        /* load the firmware image (typically kernel.img) */
> +        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
> +                                ram_size - FIRMWARE_ADDR);
> +        if (r < 0) {
> +            error_report("Failed to load firmware from %s", machine->firmware);
> +            exit(1);
> +        }
> +
> +        /* set variables so arm_load_kernel does the right thing */
> +        binfo.entry = FIRMWARE_ADDR;
> +        binfo.firmware_loaded = true;
> +    } else {
> +        /* Just let arm_load_kernel do everything for us... */
> +        binfo.kernel_filename = machine->kernel_filename;
> +        binfo.kernel_cmdline = machine->kernel_cmdline;
> +        binfo.initrd_filename = machine->initrd_filename;
> +    }
> +
> +    arm_load_kernel(ARM_CPU(first_cpu), &binfo);
> +}
> +
> +static void raspi2_init(MachineState *machine)
> +{
> +    RaspiMachineState *s = g_new0(RaspiMachineState, 1);

Use of the MachineState name-stem suggest that you are QOM inheriting from
MachineState but you are not. So the struct just needs a rename to something
without "MachineState"

> +
> +    /* Initialise the SOC */
> +    object_initialize(&s->soc.pi2, sizeof(s->soc.pi2), TYPE_BCM2836);
> +    object_property_add_child(OBJECT(machine), "soc", &s->soc.obj,
> +                              &error_abort);
> +
> +    /* Allocate and map RAM */
> +    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
> +                                         machine->ram_size);
> +    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);

I thought the SoC handled this now? Why do you need to add to system_memory?

> +
> +    /* Setup the SOC */
> +    object_property_add_const_link(&s->soc.obj, "ram", OBJECT(&s->ram),
> +                                   &error_abort);

Just cast using OBJECT() rather than having the union.

> +    object_property_set_bool(&s->soc.obj, true, "realized", &error_abort);
> +
> +    /* Boot! */

Not really. You just setup the boot for core code to do it later.

> +    setup_boot(machine, 2, machine->ram_size);
> +}
> +
> +static void raspi2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 2";
> +    mc->init = raspi2_init;
> +    mc->block_default_type = IF_SD;

> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;

Curious, what do these do from a user-visible point of view? Maybe we should
add them to more ARM boards as they certainly make sense.

Regards,
Peter

> +    mc->max_cpus = BCM2836_NCPUS;
> +    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
> +     * we do not yet support the framebuffer / GPU, we need to limit
> +     * RAM usable by the OS to sit below the peripherals. */
> +    mc->default_ram_size = 0x3F000000; /* BCM2836_PERI_BASE */
> +};
> +DEFINE_MACHINE("raspi2", raspi2_machine_init)
> -- 
> 2.5.3
> 
