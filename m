Received: by 10.223.159.82 with SMTP id f18csp787836wrg;
        Tue, 21 Nov 2017 07:04:18 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYf6bAS4ZPuL/7dLs1LHvsWZ8YvN1E9eoRenRnA/un8xB7lfHJF29BUa67dGEgVckbvuUM6
X-Received: by 10.37.105.80 with SMTP id e77mr10686250ybc.150.1511276658145;
        Tue, 21 Nov 2017 07:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511276658; cv=none;
        d=google.com; s=arc-20160816;
        b=OVyHjkzGVjB/t6ZZHa1hKb8Fh4FAx3eBwkO5BHIT023zYMYQXphosQPBaL+vTLav8q
         LFc8ErG5Ini9dxUV6fxY0WOTjGfNLgmMmOlrEdwhhiWmC0rtygkcdwkQtrhoJn+ejXsG
         N11vgSQsrts9tZF/sSWwTU8/aPmipEDzdHmyNZZCx1pSwIjX7ovW/P57Iz58Zk1+Iqvu
         2+n6MFPHRW6queL9ajWB4iBKmyO8jKJjhVjT4etECTp7wNFR0ZuUQw8oiLI5pq2klo5b
         V0lYpv0UMonmfEPkg3bxW9ZSm5UpbrLZe6XsPpbLRDK0THHbZy4fglwO6tTw7z7t5DXW
         q6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WmPkSD4jptsRIE02KR963FFyDUIWMljyspkstp1YU+o=;
        b=OVsUaMd4zve5eUObwbUBWv6zPgNhqHWmYvQfY+a9jS6o1s2zJLqVhsl7izObcAr6Fe
         glv1UhrEL5NiMkhX0gPf8gwUx1rTwJ/PzdCpczUkkZ1GcUBgDioOZJDS9jjTURsXYLDk
         eSuUiP2M1OsWDpImE83tjYK7lPc3g9aXr988XJifGtUGqFTkdqU1nl9OznhMfa4h2KfT
         a2sX5/iw8QaS7vEP2TjZfSFrfcKoNHji+/GdSHSm5xSrw2dyVi4x4k3bDQZZjUTX/5fG
         droGMOb8Ltz1dmhaRKhx3vFP4A5vydRvD83oNBPKwF/FY/PoUo0AXVYpYVtW9YQGVECe
         EiAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oa65QJbG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r204si2791387ywg.791.2017.11.21.07.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 07:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oa65QJbG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHA5x-0005J0-K7
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 10:04:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHA4J-0004S1-IV
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 10:02:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHA4H-0001DE-Qw
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 10:02:35 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:38087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHA4H-0001Ck-Jx
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 10:02:33 -0500
Received: by mail-oi0-x242.google.com with SMTP id b189so8717833oia.5
	for <qemu-devel@nongnu.org>; Tue, 21 Nov 2017 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WmPkSD4jptsRIE02KR963FFyDUIWMljyspkstp1YU+o=;
	b=Oa65QJbGAjemey1kyu3fwFND3JeJQss0gOyFE72D1FMeIcYJj7slX0nyF3IHJKPYnf
	XzjYfrbk18yoh/0vY+YVtqMBuacVvitm1Ay3vcb6E/ZbTlqaKPRJrAMiNuJcMoBQbDMi
	eDrnR9O9wXe7bMAKBV0Ej0m5i9bavzci+Pm7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WmPkSD4jptsRIE02KR963FFyDUIWMljyspkstp1YU+o=;
	b=poqyxRPo1IizBwsW3nj8lkXgiG5mmk0uSSobo0gTBf5a+0J2d5B8KKs4UOR+HmyEWJ
	7QcCFbEEeu9g41gzMpKxf9mj1PBO+03n3R8MmEawUf5F0NHUFw7JIWKpHy38AD9RMC/V
	xPZmY7wAkig/LfQBBzquybYd27i276Kns5VLZb8XS0E0RW+mQhs3Y9XWC6vOSZqgIZtr
	O3K5DWV+ZeUS+rx65K7TgYe/Xf1k5NC8OatMGTQPWbMMAHKUzQriuvvsnX9a+v4oHJqI
	SmJ1W3E2S7dE0afODflGbGW1lit9V7p7lJPIyKKmib7cd/PXD05Ihsi1e68b4vOedeea
	85fQ==
X-Gm-Message-State: AJaThX67s+hC9xn3kHqEdgL/OCJrzviHhBL3iopVf/pe4nzdEQGp1JKs
	fbYwVjrxNTV+MpIrNFOeCQ2khVxGXebSjlEpGIfPaQ==
X-Received: by 10.202.108.66 with SMTP id h63mr1383984oic.305.1511276552539;
	Tue, 21 Nov 2017 07:02:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 07:02:12 -0800 (PST)
In-Reply-To: <1509107055-21978-6-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
	<1509107055-21978-6-git-send-email-costa@advantech.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 15:02:12 +0000
Message-ID: <CAFEAcA-z5t_=iEUEUdQ-bFaz9q86v_xRxwMLO0Gavczz=HRPPw@mail.gmail.com>
To: Gabriel Costa <gabriel291075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v7 5/5] arm: kinetis_mk64fn1m0 machine
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LgoOzJnR0Pgl

On 27 October 2017 at 13:24, Gabriel Costa <gabriel291075@gmail.com> wrote:
> This Patch include mk64fn1m0.c that describe the kinetis k64 machine and
> some peripherals.
> Also, include changes in Makefile.objs and arm-softmmu.mak to compile
> this machine.
>
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/mk64fn1m0.c              | 136 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 hw/arm/mk64fn1m0.c
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 5059d13..a835d4f 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -130,3 +130,4 @@ CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_GPIO_KEY=y
>  CONFIG_MSF2=y
> +CONFIG_KINETIS_K64=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2794e08..874a38a 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
>  obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
> +obj-$(CONFIG_KINETIS_K64) += mk64fn1m0.o
> diff --git a/hw/arm/mk64fn1m0.c b/hw/arm/mk64fn1m0.c
> new file mode 100644
> index 0000000..618791c
> --- /dev/null
> +++ b/hw/arm/mk64fn1m0.c
> @@ -0,0 +1,136 @@
> +/*
> + * Kinetis K64 MK64FN1M0 microcontroller emulation.
> + *
> + * Copyright (c) 2017 Advantech Wireless
> + * Written by Gabriel Costa <gabriel291075@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "hw/ssi/ssi.h"
> +#include "hw/arm/arm.h"
> +#include "hw/devices.h"
> +#include "qemu/timer.h"
> +#include "hw/i2c/i2c.h"
> +#include "net/net.h"
> +#include "hw/boards.h"
> +#include "qemu/log.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/char/pl011.h"
> +#include "hw/misc/unimp.h"
> +#include "cpu.h"
> +#include "hw/char/kinetis_k64_uart.h"
> +#include "hw/misc/kinetis_k64_system.h"
> +#include "hw/misc/kinetis_k64_mcg.h"
> +#include "hw/misc/kinetis_k64_pmux.h"
> +
> +#define FLASH_SIZE              (1024 * 1024)
> +#define FLASH_BASE_ADDRESS      (0x00000000)
> +#define SRAM_SIZE               (192 * 1024)
> +#define SRAM_BASE_ADDRESS       (0x20000000)
> +
> +#define NUM_IRQ_LINES 85
> +
> +/* System controller.  */
> +
> +static void do_sys_reset(void *opaque, int n, int level)
> +{
> +    if (level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    }
> +}
> +
> +/* Interruptions at pag.77 of K64P144M120F5RM.pdf */
> +
> +static void mk64fn1m0_init_mach(MachineState *ms, const char *kernel_filename)
> +{
> +    DeviceState *nvic;
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram(flash, NULL, "k64.flash", FLASH_SIZE, &error_fatal);
> +    memory_region_set_readonly(flash, true);

You could just use memory_region_init_rom() rather than _init_ram
and then set_readonly.

> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> +    memory_region_init_ram(sram, NULL, "k64.sram", SRAM_SIZE, &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +    nvic = armv7m_init(system_memory, FLASH_SIZE, NUM_IRQ_LINES,
> +            ms->kernel_filename, ms->cpu_type);
> +    qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
> +            qemu_allocate_irq(&do_sys_reset, NULL, 0));
> +
> +    sysbus_create_simple(TYPE_KINETIS_K64_SIM, 0x40048000, NULL);
> +    sysbus_create_simple(TYPE_KINETIS_K64_MCG, 0x40064000, NULL);
> +    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x40049000,
> +            qdev_get_gpio_in(nvic, 59));
> +    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004A000,
> +            qdev_get_gpio_in(nvic, 60));
> +    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004B000,
> +            qdev_get_gpio_in(nvic, 61));
> +    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004C000,
> +            qdev_get_gpio_in(nvic, 62));
> +    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004D000,
> +            qdev_get_gpio_in(nvic, 63));
> +    create_unimplemented_device("kinetis_k64_spi0",  0x4002C000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_spi1",  0x4002D000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_adc0",  0x4003B000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_dac",   0x4002F000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_i2c0",  0x40066000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_i2c1",  0x40067000, 0x1000);
> +    kinetis_k64_uart_create(0x4006A000, qdev_get_gpio_in(nvic, 31),
> +            serial_hds[0]);
> +    create_unimplemented_device("kinetis_k64_uart1", 0x4006B000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_uart2", 0x4006C000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_uart3", 0x4006D000, 0x1000);

Aren't all the UARTs the same? If they are, you might as well
create them all since you have the device model. If they're not,
have a comment explaining why you don't do that.

> +    create_unimplemented_device("kinetis_k64_spi2",  0x400AC000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_adc1",  0x400BB000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_i2c2",  0x400E6000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_uart4", 0x400EA000, 0x1000);
> +    create_unimplemented_device("kinetis_k64_uart5", 0x400EB000, 0x1000);
> +    create_unimplemented_device("peripheral_brdg_0", 0x40000000, 0x1000);
> +    create_unimplemented_device("Crossbar_Switch",   0x40004000, 0x1000);
> +    create_unimplemented_device("DMA_Controller",    0x40008000, 0x1000);
> +    create_unimplemented_device("DMA_Controller_t",  0x40009000, 0x1000);
> +    create_unimplemented_device("FlexBus",           0x4000C000, 0x1000);
> +    create_unimplemented_device("MPU",               0x4000D000, 0x1000);
> +    create_unimplemented_device("Flash_mem_ctrl",    0x4001F000, 0x1000);
> +    create_unimplemented_device("Flash_mem",         0x40020000, 0x1000);
> +    create_unimplemented_device("DMA_ch_multiplx",   0x40021000, 0x1000);
> +}
> +
> +static void mk64fn1m0_init(MachineState *machine)
> +{
> +    const char *kernel_filename = machine->kernel_filename;
> +    mk64fn1m0_init_mach(machine, kernel_filename);
> +}
> +
> +static void mk64fn1m0_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Kinetis K64 MCU (Cortex-M4)";
> +    mc->init = mk64fn1m0_init;
> +    mc->ignore_memory_transaction_failures = true;

New board models must not set this flag -- it is strictly for
legacy models that are already in the QEMU tree.

> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +    mc->max_cpus = 1;
> +}
> +
> +static const TypeInfo mk64_type = {
> +    .name = MACHINE_TYPE_NAME("mk64fn1m0"),
> +    .parent = TYPE_MACHINE,
> +    .class_init = mk64fn1m0_class_init,
> +};
> +
> +static void mk64fn1m0_machine_init(void)
> +{
> +    type_register_static(&mk64_type);
> +}
> +
> +type_init(mk64fn1m0_machine_init)
> --
> 2.1.4


thanks
-- PMM
