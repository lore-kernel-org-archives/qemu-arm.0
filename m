Received: by 10.25.159.19 with SMTP id i19csp795494lfe;
        Thu, 28 Jan 2016 23:31:25 -0800 (PST)
X-Received: by 10.140.98.100 with SMTP id n91mr8933250qge.56.1454052685008;
        Thu, 28 Jan 2016 23:31:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e195si15778503qhc.85.2016.01.28.23.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 23:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP3We-0001fk-Cv
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 02:31:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP3Wb-0001cZ-HQ
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 02:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP3WW-00027x-PW
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 02:31:21 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:33594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aP3WT-00027I-Cj; Fri, 29 Jan 2016 02:31:13 -0500
Received: by mail-wm0-x22f.google.com with SMTP id l66so55445817wml.0;
	Thu, 28 Jan 2016 23:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rrTETZjK/dshdGCvrxBlA4xTTPRcPKj0aduhXOmRbdQ=;
	b=ubtKJd8TYt3/xKbPvNEM9T5xkEIY3WGzk96DR/JqbBhAx0fidHgsMEFFRLaa5pDUTR
	innNzpaGpsG0+1p4Eq7ESo2uD5tpV4KNQT/v52hyWCKKki4VRvhu20B//0CsOtoYpNAf
	Hk0IYuWzJUKKzA/aDqlzjK8Hq3wg4hNlp3Es0wLmSv5/Vc0ewdSIXYobslMfk52NS3lT
	97lliPRBLDBqJpia234MS0v8qrCnCv7tY3bQd6hboM153z2fgof0iD0vpJPZkexwg4pi
	06wowId41YqPZgbPOsEHr1+04Olke1vJ0JFovTFcaIfc7c0ARTdaCmDFCgRHWyc+2JkO
	RsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=rrTETZjK/dshdGCvrxBlA4xTTPRcPKj0aduhXOmRbdQ=;
	b=j9DWnu4LnZ9g+NhK+2RKE0ahN9Sv7Kb4AeZpu4hQBNnWmXedddmPndZvJp9bzMYkds
	f7TFUGo+jKXr9fWChSnZOJWAtOvBzKA6+1nqPyyyePAb1l7RDc/CzkHSom8tm7nRKaLl
	91xohKqW5egef843nDHwbsk5z4R2UBFW+YTDCBh4WOb3nF6+x/Yu5E7LRBxMC+tiQ/oE
	cYgM+YA8i3NZitQNL7BUO7F+rkNj9IQ426LzpnXSd04w9soiWi6s60tQbZjaswX8jnZk
	jF5CehYrJMWl60QSReuivu6X+UQwdbJaJeVw9lF0rlAQAKRgYFH8rDAthGotyn+3KQC2
	ckOA==
X-Gm-Message-State: AG10YOSAusZmqz8twmap3aosN1J7WZZ86xQz8cl58ljeXXLxMrQNVqGPywYfwwbY/vLSz6ikOzAmOR/kQyoejw==
MIME-Version: 1.0
X-Received: by 10.194.22.132 with SMTP id d4mr7160506wjf.174.1454052672612;
	Thu, 28 Jan 2016 23:31:12 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 28 Jan 2016 23:31:12 -0800 (PST)
In-Reply-To: <1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
Date: Thu, 28 Jan 2016 23:31:12 -0800
Message-ID: <CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: FISBgg7CSE9n

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     Pi1 requires more peripherals, and will be added in a later patch
>     series.
>
>     v4:
>     * drop header comment from versatile
>     * made smpboot and board setup blobs relocatable (within limits:
>       we can't use ARMv7 MOVW for Pi1, so it's messier than highbank)
>     * move board setup blob to common code
>     * modify SCR using read-or-write
>     * s/RaspiMachineState/RaspiState/
>     * style tweaks
>
>     v3:
>      * fix board setup to remain Pi1 compatible
>      * pass ram property
>
>  hw/arm/Makefile.objs |   2 +-
>  hw/arm/raspi.c       | 156 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 157 insertions(+), 1 deletion(-)
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
> index 0000000..2110725
> --- /dev/null
> +++ b/hw/arm/raspi.c
> @@ -0,0 +1,156 @@
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
> +typedef struct RaspiState {

A quick google search, I see the camel case form for rpi is usually
"RasPi". Should we follow?

> +    union {

union not needed.

> +        BCM2836State pi2;
> +    } soc;
> +    MemoryRegion ram;
> +} RaspiState;
> +
> +static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    static const uint32_t smpboot[] = {
> +        0xE1A0E00F, /*    mov     lr, pc */
> +        0xE3A0FE00 + (BOARDSETUP_ADDR >> 4), /* mov pc, BOARDSETUP_ADDR */
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

lower case hex for consistency with other blobbing boards (exynos,
zynq, arm_boot).

> +    };
> +

> +    /* check that we don't overrun board setup vectors */
> +    assert(SMPBOOT_ADDR + sizeof(smpboot) <= MVBAR_ADDR);
> +    /* check that board setup address is correctly relocated */
> +    assert((BOARDSETUP_ADDR & 0xf) == 0 && (BOARDSETUP_ADDR >> 4) < 0x100);

QEMU_BUILD_BUG_ON (both asserts should be convertible)

> +
> +    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
> +                       info->smp_loader_start);
> +}
> +
> +static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
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
> +     * the normal Linux boot process
> +     */
> +    if (machine->firmware) {

Others on the qemu-arm list follow UEFI support better than I so Peter
or someone else should take a look at this section I think.

> +        /* load the firmware image (typically kernel.img) */
> +        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
> +                                ram_size - FIRMWARE_ADDR);
> +        if (r < 0) {
> +            error_report("Failed to load firmware from %s", machine->firmware);
> +            exit(1);
> +        }
> +
> +        /* set variables so arm_load_kernel does the right thing */

This comment doesn't add too much. I think it can be dropped
(everything in a binfo is to make arm_load_kernel DTRT).

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
> +    RaspiState *s = g_new0(RaspiState, 1);
> +
> +    /* Initialise the SOC */

Drop comment.

> +    object_initialize(&s->soc.pi2, sizeof(s->soc.pi2), TYPE_BCM2836);
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> +                              &error_abort);
> +
> +    /* Allocate and map RAM */
> +    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
> +                                         machine->ram_size);

/* FIXME: Remove when we have custom CPU address space support */

> +    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
> +
> +    /* Setup the SOC */
> +    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
> +                                   &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
> +                            &error_abort);
> +    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
> +
> +    /* Prepare to boot */

Comment still doesn't add much so should drop.

Otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Thanks for your continued persistence and sorry about the recent
delays through review process.

Regards,
Peter

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
> +    mc->max_cpus = BCM2836_NCPUS;
> +
> +    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
> +     * we do not yet support the framebuffer / GPU, we need to limit
> +     * RAM usable by the OS to sit below the peripherals.
> +     */
> +    mc->default_ram_size = 0x3F000000; /* BCM2836_PERI_BASE */
> +};
> +DEFINE_MACHINE("raspi2", raspi2_machine_init)
> --
> 2.5.3
>
