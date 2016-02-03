Received: by 10.25.159.19 with SMTP id i19csp1275683lfe;
        Wed, 3 Feb 2016 07:09:34 -0800 (PST)
X-Received: by 10.129.147.5 with SMTP id k5mr1160762ywg.206.1454512174384;
        Wed, 03 Feb 2016 07:09:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f203si1914217ywc.128.2016.02.03.07.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 07:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQz3l-0004G9-Lj
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 10:09:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz3g-0004DX-Jk
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:09:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz3a-0008QY-Qf
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:09:28 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz3a-0008QR-L0
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:09:22 -0500
Received: by mail-vk0-x235.google.com with SMTP id e6so15915876vkh.2
	for <qemu-arm@nongnu.org>; Wed, 03 Feb 2016 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QI0gQNPrMz3RiRaz/fGApnrjsFUFeM7m0QeqFhLBQNw=;
	b=TqibmTmEqaIFJjErYQ/KQRMbc5D3o1OQGylLTby0MhY9cGgvQ0g29CtiwHdgTCdnBC
	UZ6TrBB2BdOszNJlpw+PjV31EA1BSC3n/39vhL8MsFqlcDWHoHtnYHXYqCQKNaId2g7Z
	wfUT3bNbU5sTysy6jBnXUL39FD/nK/LOig7Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QI0gQNPrMz3RiRaz/fGApnrjsFUFeM7m0QeqFhLBQNw=;
	b=CNAzEoUmUrlJrsqTfcePD9i3Hmm56KrbN1gTlqa3rH2I3b2gPbuQw5wo+NuQ3ua8Ve
	kSsiStnU+8M1uIzqdA2HpE8kRQCFRMDlFa+mS/UmxFmLsog/kITXZxRxIlCufLfyx9gQ
	s+XyT6ohl39x4W4JxrIm3Xdcy+CJ5imIuLzN2XsNZJH74QmFhJ6pr0Xx/JkLbiTIOFFu
	n4yyqfPdJH5evvO6bK4p1ZhgE3x7uhtgwUophhVUZKsvmEC5zBKSB6pRpT76LxeMHC3V
	IOOHZeRFXyOYNoEDuDu2GxKLJ1lIkD909CDCXR2dwj5BETgOCTMTsNJP/ptdBsHklDY4
	ndZw==
X-Gm-Message-State: AG10YORcin/pIGA0j/urgjsfwcuQ+3j4EdEU6LdqRjoLU6wEfn+8dwxMAUgpRFxM+mzBz+B+vqrJg6ooYO+/CS2A
X-Received: by 10.31.52.147 with SMTP id b141mr1557090vka.82.1454512162314;
	Wed, 03 Feb 2016 07:09:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 3 Feb 2016 07:09:02 -0800 (PST)
In-Reply-To: <1454107844-15704-9-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1454107844-15704-9-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2016 15:09:02 +0000
Message-ID: <CAFEAcA_ag-gcXSH_w5T2X9rW43_3h4Lw960uvSv+KojenKy-Ew@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: aPSHC4C/wKlA

The list server seems to have eaten this patch from this series
for some reason, so I'm just replying here so we have a copy of it
other than in my private email.

thanks
-- PMM

On 29 January 2016 at 22:50, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     Pi1 requires more peripherals, and will be added in a later patch
>     series.
>
>     v5:
>     * s/RaspiState/RasPiState/
>     * drop use of soc union in RasPiState
>     * use QEMU_BUILD_BUG_ON for static asserts in write_smpboot()
>     * other minor formatting/style tweaks
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
>  hw/arm/raspi.c       | 152 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 153 insertions(+), 1 deletion(-)
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
> index 0000000..0c9427c
> --- /dev/null
> +++ b/hw/arm/raspi.c
> @@ -0,0 +1,152 @@
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
> +typedef struct RasPiState {
> +    BCM2836State soc;
> +    MemoryRegion ram;
> +} RasPiState;
> +
> +static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    static const uint32_t smpboot[] = {
> +        0xe1a0e00f, /*    mov     lr, pc */
> +        0xe3a0fe00 + (BOARDSETUP_ADDR >> 4), /* mov pc, BOARDSETUP_ADDR */
> +        0xee100fb0, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
> +        0xe7e10050, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
> +        0xe59f5014, /*    ldr     r5, =0x400000CC      ;load mbox base */
> +        0xe320f001, /* 1: yield */
> +        0xe7953200, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core*/
> +        0xe3530000, /*    cmp     r3, #0               ;spin while zero */
> +        0x0afffffb, /*    beq     1b */
> +        0xe7853200, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
> +        0xe12fff13, /*    bx      r3                   ;jump to target */
> +        0x400000cc, /* (constant: mailbox 3 read/clear base) */
> +    };
> +
> +    /* check that we don't overrun board setup vectors */
> +    QEMU_BUILD_BUG_ON(SMPBOOT_ADDR + sizeof(smpboot) > MVBAR_ADDR);
> +    /* check that board setup address is correctly relocated */
> +    QEMU_BUILD_BUG_ON((BOARDSETUP_ADDR & 0xf) != 0
> +                      || (BOARDSETUP_ADDR >> 4) >= 0x100);
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
> +        /* load the firmware image (typically kernel.img) */
> +        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
> +                                ram_size - FIRMWARE_ADDR);
> +        if (r < 0) {
> +            error_report("Failed to load firmware from %s", machine->firmware);
> +            exit(1);
> +        }
> +
> +        binfo.entry = FIRMWARE_ADDR;
> +        binfo.firmware_loaded = true;
> +    } else {
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
> +    RasPiState *s = g_new0(RasPiState, 1);
> +
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> +                              &error_abort);
> +
> +    /* Allocate and map RAM */
> +    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
> +                                         machine->ram_size);
> +    /* FIXME: Remove when we have custom CPU address space support */
> +    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
> +
> +    /* Setup the SOC */
> +    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
> +                                   &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
> +                            &error_abort);
> +    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
> +
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
