Received: by 10.25.0.147 with SMTP id 141csp693360lfa;
        Sun, 26 Feb 2017 14:09:50 -0800 (PST)
X-Received: by 10.237.48.196 with SMTP id 62mr12200918qtf.291.1488146990655;
        Sun, 26 Feb 2017 14:09:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si5611077qta.250.2017.02.26.14.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 26 Feb 2017 14:09:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ci70l-0001li-U6
	for alex.bennee@linaro.org; Sun, 26 Feb 2017 17:09:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ci4xs-0006b9-Dv
	for qemu-devel@nongnu.org; Sun, 26 Feb 2017 14:58:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ci4xr-0004y6-90
	for qemu-devel@nongnu.org; Sun, 26 Feb 2017 14:58:40 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ci4xm-0004wZ-Ds; Sun, 26 Feb 2017 14:58:34 -0500
Received: by mail-wm0-f65.google.com with SMTP id v77so10541180wmv.0;
	Sun, 26 Feb 2017 11:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aiPZbvxGhuEhLmuWbHpncziC5BuOQDd3q/X+69R+cFY=;
	b=pf4Rk45MLMCHzITwS+h0ONWEK6kJRe7X5FMXgtokE6yvbd78Eq7v78A1d580cHkQuE
	28lGiTNWXIc7nGepsmyHvDgavdW4ThUBxkiM3VDWQr8o+/nGOyyUQfpGQZmruBM1orjq
	A7oO2cPFP99XHSRD+VD/H9Vz5jHWmQq/K9Zx0CRJgThm6/+5xIRzMXvTKduqkMCceHiW
	r0ZrWLTFuYaAI6L6f8ayk5LJKWC/6pva9Nu6UrYkSjCWrCOU30wMzLVNruirVn9YkPOs
	ffPmXiIeb0KoJJeAqkadvBh2U9GNAUJFahzu2xHQJ1yWd14/i/hJs1ncxOLR7whaBwbP
	+IUQ==
X-Gm-Message-State: AMke39kr2wUBXr8Vc79Obidwc4irq0m1xNHZbTlj0A32jnTfYfN2VCn/sUxRlBZQT9uArQ==
X-Received: by 10.28.66.207 with SMTP id k76mr1023186wmi.121.1488139111546;
	Sun, 26 Feb 2017 11:58:31 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	m29sm19374676wrm.38.2017.02.26.11.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 26 Feb 2017 11:58:31 -0800 (PST)
Date: Sun, 26 Feb 2017 21:58:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170226195828.2o3442vxntlmzslj@kozik-lap>
References: <20170226195115.26564-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170226195115.26564-1-krzk@kernel.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
X-Mailman-Approved-At: Sun, 26 Feb 2017 17:02:12 -0500
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/arm/exynos: Fix Linux kernel
 division by zero for PLLs
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/O+cQ8RJSs0

On Sun, Feb 26, 2017 at 09:51:14PM +0200, Krzysztof Kozlowski wrote:
> Without any clock controller, the Linux kernel was hitting division by
> zero during boot or with clk_summary:
> [    0.000000] [<c031054c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
> [    0.000000] [<c030ba6c>] (show_stack) from [<c05b2660>] (dump_stack+0x88/0x9c)
> [    0.000000] [<c05b2660>] (dump_stack) from [<c05b11a4>] (Ldiv0+0x8/0x10)
> [    0.000000] [<c05b11a4>] (Ldiv0) from [<c06ad1e0>] (samsung_pll45xx_recalc_rate+0x58/0x74)
> [    0.000000] [<c06ad1e0>] (samsung_pll45xx_recalc_rate) from [<c0692ec0>] (clk_register+0x39c/0x63c)
> [    0.000000] [<c0692ec0>] (clk_register) from [<c125d360>] (samsung_clk_register_pll+0x2e0/0x3d4)
> [    0.000000] [<c125d360>] (samsung_clk_register_pll) from [<c125d7e8>] (exynos4_clk_init+0x1b0/0x5e4)
> [    0.000000] [<c125d7e8>] (exynos4_clk_init) from [<c12335f4>] (of_clk_init+0x17c/0x210)
> [    0.000000] [<c12335f4>] (of_clk_init) from [<c1204700>] (time_init+0x24/0x2c)
> [    0.000000] [<c1204700>] (time_init) from [<c1200b2c>] (start_kernel+0x24c/0x38c)
> [    0.000000] [<c1200b2c>] (start_kernel) from [<4020807c>] (0x4020807c)
> 
> Provide stub for clock controller returning reset values for PLLs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/arm/exynos4210.c      |   6 ++
>  hw/misc/Makefile.objs    |   2 +-
>  hw/misc/exynos4210_clk.c | 164 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 171 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/exynos4210_clk.c
> 
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index be3c96d21ea3..a0ecbe8c1ffc 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> +#include "qemu/log.h"
>  #include "cpu.h"
>  #include "hw/boards.h"
>  #include "sysemu/sysemu.h"
> @@ -74,6 +75,9 @@
>  /* PMU SFR base address */
>  #define EXYNOS4210_PMU_BASE_ADDR            0x10020000
>  
> +/* Clock controller SFR base address */
> +#define EXYNOS4210_CLK_BASE_ADDR            0x10030000
> +
>  /* Display controllers (FIMD) */
>  #define EXYNOS4210_FIMD0_BASE_ADDR          0x11C00000
>  
> @@ -297,6 +301,8 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
>      */
>      sysbus_create_simple("exynos4210.pmu", EXYNOS4210_PMU_BASE_ADDR, NULL);
>  
> +    sysbus_create_simple("exynos4210.clk", EXYNOS4210_CLK_BASE_ADDR, NULL);
> +
>      /* PWM */
>      sysbus_create_varargs("exynos4210.pwm", EXYNOS4210_PWM_BASE_ADDR,
>                            s->irq_table[exynos4210_get_irq(22, 0)],
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 898e4ccfb1ee..8e080def33ae 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -26,7 +26,7 @@ obj-$(CONFIG_IVSHMEM) += ivshmem.o
>  obj-$(CONFIG_REALVIEW) += arm_sysctl.o
>  obj-$(CONFIG_NSERIES) += cbus.o
>  obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
> -obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o
> +obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o
>  obj-$(CONFIG_IMX) += imx_ccm.o
>  obj-$(CONFIG_IMX) += imx31_ccm.o
>  obj-$(CONFIG_IMX) += imx25_ccm.o
> diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
> new file mode 100644
> index 000000000000..0ad89bb7d39b
> --- /dev/null
> +++ b/hw/misc/exynos4210_clk.c
> @@ -0,0 +1,164 @@
> +/*
> + *  Exynos4210 Clock Controller Emulation
> + *
> + *  Copyright (c) 2017 Krzysztof Kozlowski <krzk@kernel.org>
> + *
> + *  This program is free software; you can redistribute it and/or modify it
> + *  under the terms of the GNU General Public License as published by the
> + *  Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but WITHOUT
> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + *  for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +
> +#define TYPE_EXYNOS4210_CLK             "exynos4210.clk"
> +#define EXYNOS4210_CLK(obj) \
> +    OBJECT_CHECK(Exynos4210ClkState, (obj), TYPE_EXYNOS4210_CLK)
> +
> +#define CLK_PLL_LOCKED                  BIT(29)
> +
> +#define EXYNOS4210_CLK_REGS_MEM_SIZE    0x15104
> +
> +typedef struct Exynos4210Reg {
> +    const char   *name; /* for debug only */
> +    uint32_t     offset;
> +    uint32_t     reset_value;
> +} Exynos4210Reg;
> +
> +/* Clock controller register base: 0x10030000 */
> +static const Exynos4210Reg exynos4210_clk_regs[] = {
> +    {"EPLL_LOCK",                     0xc010, 0x00000fff},
> +    {"VPLL_LOCK",                     0xc020, 0x00000fff},
> +    {"EPLL_CON0",                     0xc110, 0x00300301 + CLK_PLL_LOCKED},

My bad, this obviously should not be '+' but '|'.

I'll send a v2.

Best regards,
Krzysztof

