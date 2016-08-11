Received: by 10.25.21.156 with SMTP id 28csp52054lfv;
        Thu, 11 Aug 2016 03:32:00 -0700 (PDT)
X-Received: by 10.55.114.69 with SMTP id n66mr10279698qkc.174.1470911520563;
        Thu, 11 Aug 2016 03:32:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k64si1155505qkd.254.2016.08.11.03.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnHL-0007DU-Rl
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:31:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnFM-0005Ut-A2
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnFK-0000QQ-6F
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:29:55 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:34974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnFK-0000QE-0M
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:29:54 -0400
Received: by mail-ua0-x235.google.com with SMTP id n59so111797765uan.2
	for <qemu-devel@nongnu.org>; Thu, 11 Aug 2016 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Wl30EQI79Ic8Zc/kxx4Blnx/RBUYRxA1HExQDGbI9lE=;
	b=NQA4kQzUhtCkqkp3DmToaaLJAoWoEMyWJVaQSCPmWewEaCvYhKBAwuOHtwmdabbZ/K
	9T30eiar3stibBa5wKPhhZAiSIRg3+I8RobAYeLy7fi1VLTi5sBX4GvlcRZY1rMuH4y+
	z6Gxl64C0abp7T3pOjNiutVkURe8YPHkhfvG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Wl30EQI79Ic8Zc/kxx4Blnx/RBUYRxA1HExQDGbI9lE=;
	b=FpeQsLRzPm1C+MFUuK2qcf6vHl/TUzvUceTQhkaURsXjmAXOu7vv456R5YFqSpI74f
	r+vVHEVoVKjWwlLwn+raxwBXaq5kpqASK3lLokFUKXMS9OTcUNidl2AdzMfkkl6iVDBR
	soQToHeROeSubpEX+AdH9AM/gPXQ1d0/OjXoTluWG3ZbbjvGj57wE1FbGuF7Mj2/Tku0
	Jk8Uk/kKBtZfUnEu4zsyhByx96cHGsTQkcCApTXCnwQaWTc5lXCyW1zpfenXk3QYtYr7
	ZQzRxLz6PTf+T4DXNIXNw1AlNRpn1dymD0zNzNtkkG0DE8hwGAMcnGajVVUAHO0rF2Kx
	6PnA==
X-Gm-Message-State: AEkoouvQLCyMmzWfg33majPiz+UqN91fH/WIJnJDmMoG4MFwap/ocvP17Bm7YRqxJh1o2txFq3ThQ+pPrGC2vBKC
X-Received: by 10.159.32.66 with SMTP id 60mr1033270uam.125.1470911393576;
	Thu, 11 Aug 2016 03:29:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:29:33 -0700 (PDT)
In-Reply-To: <1470158147-16378-8-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-8-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:29:33 +0100
Message-ID: <CAFEAcA8VyvMOw0fYCAjLJCxzL43tD3-H+SrPYHx7gHygxisTOA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-devel] [PATCH v3 07/10] hw/misc: use macros to define
 hw-strap1 register on the AST2400 Aspeed SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mIBg90lB1Mqc

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This gives some explanation behind the magic number 0x120CE416.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v2:
>
>  - more precise definitions of the hw-strap1 register
>  - moved hw-strap1 to the board level.
>
>  hw/arm/aspeed.c              |  15 +++++-
>  include/hw/misc/aspeed_scu.h | 118 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 132 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 4226b8dcd95c..80907b4244ea 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -39,8 +39,21 @@ enum {
>      PALMETTO_BMC
>  };
>
> +#define PALMETTO_BMC_HW_STRAP1 (                                        =
\
> +        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               =
\
> +        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=3D6, CWL=3D5 =
*/) | \
> +        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 =
\
> +        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_48M_IN) |       =
\
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN) |                =
\
> +        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1=
) | \
> +        SCU_HW_STRAP_SPI_WIDTH |                                        =
\
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
> +        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
> +
>  static const AspeedBoardConfig aspeed_boards[] =3D {
> -    [PALMETTO_BMC] =3D { "ast2400-a0", 0x120CE416 },
> +    [PALMETTO_BMC] =3D { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
>  };
>
>  static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index fdfd982288f2..0761f0880c69 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -36,4 +36,122 @@ typedef struct AspeedSCUState {
>
>  extern bool is_supported_silicon_rev(uint32_t silicon_rev);
>
> +/*
> + * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
> + * were added.
> + *
> + * Original header file :
> + *    arch/arm/mach-aspeed/include/mach/regs-scu.h
> + *
> + *    Copyright (C) 2012-2020  ASPEED Technology Inc.
> + *
> + *    This program is free software; you can redistribute it and/or modi=
fy
> + *    it under the terms of the GNU General Public License version 2 as
> + *    published by the Free Software Foundation.
> + *
> + *      History      :
> + *       1. 2012/12/29 Ryan Chen Create
> + */
> +
> +/* Hardware Strapping Register definition (for Aspeed AST2400 SOC)
> + *
> + * 31:29  Software defined strapping registers
> + * 28:27  DRAM size setting (for VGA driver use)
> + * 26:24  DRAM configuration setting
> + * 23     Enable 25 MHz reference clock input
> + * 22     Enable GPIOE pass-through mode
> + * 21     Enable GPIOD pass-through mode
> + * 20     Disable LPC to decode SuperIO 0x2E/0x4E address
> + * 19     Disable ACPI function
> + * 23,18  Clock source selection
> + * 17     Enable BMC 2nd boot watchdog timer
> + * 16     SuperIO configuration address selection
> + * 15     VGA Class Code selection
> + * 14     Enable LPC dedicated reset pin function
> + * 13:12  SPI mode selection
> + * 11:10  CPU/AHB clock frequency ratio selection
> + * 9:8    H-PLL default clock frequency selection
> + * 7      Define MAC#2 interface
> + * 6      Define MAC#1 interface
> + * 5      Enable VGA BIOS ROM
> + * 4      Boot flash memory extended option
> + * 3:2    VGA memory size selection
> + * 1:0    BMC CPU boot code selection
> + */
> +#define SCU_AST2400_HW_STRAP_SW_DEFINE(x)          (x << 29)

Brackets around macro parameters on the RHS, please (both
here and below).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
