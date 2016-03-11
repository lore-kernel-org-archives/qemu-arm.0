Received: by 10.25.208.211 with SMTP id h202csp899228lfg;
        Fri, 11 Mar 2016 01:10:04 -0800 (PST)
X-Received: by 10.141.5.130 with SMTP id h124mr10673241qhd.89.1457687404529;
        Fri, 11 Mar 2016 01:10:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si7778423qgf.53.2016.03.11.01.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 01:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeJ59-0002Yr-Vg
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 04:10:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeJ56-0002XW-9u
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeJ54-0000PM-Tq
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:10:00 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:32888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeJ54-0000PG-L6
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:09:58 -0500
Received: by mail-vk0-x22e.google.com with SMTP id k1so127210355vkb.0
	for <qemu-arm@nongnu.org>; Fri, 11 Mar 2016 01:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ukdSRVp2N5Nb4ERg7vi0jSHc0a1XE9lWFqLZ/L4Z3fY=;
	b=MmgvwRtxFdwz9jSh3bMOpOtXY+TojlYybSyQjb/NTWvJxv73YZ9tjMUSzAS+hb1eRd
	WeeBXfHcdC9FKR7kDMRGtHvPSlkgDwKfcA3rA1UJiMEw/+cRhMDxz2u+SphhwP12pkPT
	Z7yMA6jzYXgTBPs2STXc2ha4+TNQzYHu+a4yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ukdSRVp2N5Nb4ERg7vi0jSHc0a1XE9lWFqLZ/L4Z3fY=;
	b=fi9iNUx3Fvl1UPu2DEa9XIV3rwCxUrrOoKKbxC98E88KgVGniU8n0PXH48CfOQUXHJ
	LRNCmJYzIl6hRUtfYVRjhRRnSjKTErM2rrjHdNuZ1cyRXSHCfVQXSilJlTSAhHeGs2wZ
	HnrELpE1HQ/86AxVThiru1bYsq17Qc0l1qzQJ6RveBsuEBWvZr3CeYAFLtB73nvEtKzW
	Yr/Y9MTaaAsX49GTAaQaSNvhrWMwq6O2ED/IEe79foEl/dOm6sNnsE8Ajg28X6zLe8t5
	AWJAzh5V682RHJibvaf4uDvaijDLl+Io3h6xWzv6n3nQTI414R5+MsGoN+oYZxk1wsGc
	qDoQ==
X-Gm-Message-State: AD7BkJIWfHO6c7F1KQ6cAEXDJ/CxAN6dEmgxyJTnup8sGOajLGgnpXTu7u7rBZ4ggwPD0tLtgNaYqoydU5ydBPfB
X-Received: by 10.31.52.147 with SMTP id b141mr8639960vka.82.1457687398161;
	Fri, 11 Mar 2016 01:09:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 11 Mar 2016 01:09:38 -0800 (PST)
In-Reply-To: <1457152177-19550-4-git-send-email-andrew@aj.id.au>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
	<1457152177-19550-4-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Mar 2016 16:09:38 +0700
Message-ID: <CAFEAcA9Jt6PhUU0T4vV6zU_8HOPGBVr+uzA-EZJzXW70Q4-k4g@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v3 3/3] hw/arm: Add ASPEED AST2400 machine
	model
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
X-TUID: 0oxKD/sq/8UB

On 5 March 2016 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> Adds an AST2400 ARM machine[1], based around an AST2400 SOC containing an
> ARM926 processor, ASPEED VIC and timer devices, and a 8250 UART. The new
> machine type is functional enough to boot an aspeed_defconfig Linux
> kernel to userspace.
>
> [1] http://www.aspeedtech.com/products.php?fPath=20&rId=376
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Since v2:
>   * Implement a SOC model to move code out from the machine definition
>   * Rework the machine to better use QOM
>   * Include qemu/osdep.h
>   * Revert back to qemu_log_mask(LOG_UNIMP, ...) in IO handlers
>
> Since v1:
>
>  hw/arm/Makefile.objs |   1 +
>  hw/arm/ast2400.c     | 208 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 209 insertions(+)
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
> index 0000000..74aca49
> --- /dev/null
> +++ b/hw/arm/ast2400.c
> @@ -0,0 +1,208 @@
> +/*
> + * ASPEED AST2400
> + *
> + * Andrew Jeffery <andrew@aj.id.au>
> + * Jeremy Kerr <jk@ozlabs.org>
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "exec/address-spaces.h"
> +#include "hw/arm/arm.h"
> +#include "hw/boards.h"
> +#include "hw/char/serial.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/aspeed_vic.h"
> +#include "hw/timer/aspeed_timer.h"
> +#include "target-arm/cpu.h"
> +#include "trace.h"
> +
> +#define AST2400_UART_5_BASE      0x00184000
> +#define AST2400_IOMEM_SIZE       0x00200000
> +#define AST2400_IOMEM_BASE       0x1E600000
> +#define AST2400_VIC_BASE         0x1E6C0000
> +#define AST2400_TIMER_BASE       0x1E782000
> +#define AST2400_SDRAM_BASE       0x40000000

> +
> +static void ast2400_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    int i;
> +    AST2400SOCState *s = AST2400_SOC(dev);
> +    Error *err = NULL;
> +
> +    /* IO space */
> +    memory_region_init_io(&s->iomem, NULL, &ast2400_soc_io_ops, NULL,
> +            "ast2400.io", AST2400_IOMEM_SIZE);
> +    memory_region_add_subregion(get_system_memory(), AST2400_IOMEM_BASE,
> +            &s->iomem);

You need to add this memory region with a priority set so it is
lower priority than the VIC etc memory regions which it overlaps
(use memory_region_add_subregion_overlap()).

> +static void ast2400_soc_register_types(void)
> +{
> +    type_register_static(&ast2400_soc_type_info);
> +}
> +
> +type_init(ast2400_soc_register_types)

Your SoC device should be in its own source file, not sharing
one with the board file.

Otherwise I think this looks OK.

thanks
-- PMM
