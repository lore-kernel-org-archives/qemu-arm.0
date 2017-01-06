Received: by 10.25.205.13 with SMTP id d13csp10261947lfg;
        Fri, 6 Jan 2017 04:03:56 -0800 (PST)
X-Received: by 10.237.39.37 with SMTP id n34mr71462028qtd.128.1483704236291;
        Fri, 06 Jan 2017 04:03:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si40759181qke.164.2017.01.06.04.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 04:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPTFR-0002p9-IV
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 07:03:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTFM-0002nm-Ro
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:03:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTFL-0003or-UP
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:03:48 -0500
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:36088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPTFL-0003oY-Qf
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:03:47 -0500
Received: by mail-ua0-x22b.google.com with SMTP id 88so398925935uaq.3
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 04:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e+ZdUSPJ5aPE3TH2CCN9LUzCPM0txODd4DPsTJYs0+4=;
	b=aNCp9gHueOGPD7P6vO1NZ0aZu0mhm/b6Q7A/bZlnfWCgN5NtfeZUJjeQLg+LGd0Kn3
	DGhwWX66yB5e0BShSrF8m6029X9m1hmqtYDORNAt3PhBi8Lglic1utPJXuxTLKRQpa+Z
	qvZvsUfABetNIXLRVom9AWYStlB0dAd0FXYcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e+ZdUSPJ5aPE3TH2CCN9LUzCPM0txODd4DPsTJYs0+4=;
	b=W3SqeyEw0BgM/nFmRkNRJucqHqP+u8FqK0yqkpoHgsssJw+LlZY7Z3+6P8mIZqBHHS
	MeIDqi/BvIPwNSq3U7WIAt0SsA0e16RKNOmqzjDFMqCMr53TYTZ7+1GN7torXdsA8o9W
	sUGFmoKy8woc3OZJx9io8UlddZbCIgkliVSYtp5PBQDQ60tErWUecopYowyQXz0aTTmX
	OcNXiUqLjdYuBpIeKn8AXeqS2vD8PFE1q1LskKbp6vYDKw6b7BBClaoePiR0gT+OUINF
	uMoOxb2MDJeI9kxaoyVqDgqvdLQvyiWFN9S/znsHDbSt3cjkvYBuBv8ZqhGPzkxtHt3+
	9Pog==
X-Gm-Message-State: AIkVDXKheAWWS3YzDhoHxpekiXrs3SkqqtSVmDL74EXaWDn/rG83aBs00GPzMqKWBvfUmthTCQktRq7N6rKX1zDN
X-Received: by 10.176.88.65 with SMTP id p1mr58007505uac.175.1483704226175;
	Fri, 06 Jan 2017 04:03:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 04:03:25 -0800 (PST)
In-Reply-To: <5b9a682feb30a4c22b068d698d65063c299d24cf.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
	<5b9a682feb30a4c22b068d698d65063c299d24cf.1482265908.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 12:03:25 +0000
Message-ID: <CAFEAcA-oiVXMCfEJOgybD8b_OcL2qwsVxNKazAzXka=DuFj_Vg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-arm] [PATCH v3 3/3] xlnx-zynqmp: Connect the ARM Generic
 Timer
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wUHeGA+Y3jZn

On 20 December 2016 at 22:42, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 0d86ba3..f3891ae 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -38,6 +38,8 @@
>  #define SATA_ADDR           0xFD0C0000
>  #define SATA_NUM_PORTS      2
>
> +#define ARM_GEN_TIMER_ADDR  0xFF260000
> +
>  #define DP_ADDR             0xfd4a0000
>  #define DP_IRQ              113
>
> @@ -172,6 +174,10 @@ static void xlnx_zynqmp_init(Object *obj)
>          qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
>      }
>
> +    object_initialize(&s->arm_gen_timer, sizeof(s->arm_gen_timer),
> +                      TYPE_ARM_GEN_TIMER);
> +    qdev_set_parent_bus(DEVICE(&s->arm_gen_timer), sysbus_get_default());
> +
>      object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
>      qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
>
> @@ -405,6 +411,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          g_free(bus_name);
>      }
>
> +    object_property_set_bool(OBJECT(&s->arm_gen_timer), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 0, ARM_GEN_TIMER_ADDR);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 1, ARM_GEN_TIMER_ADDR - 0x10000);

Having a #define for a base address and then also using
thing - 0x10000 is a bit odd. I'd use two #defines, I think.
(Also avoids the overlong line.)

If we take the "board responsible for only mapping the secure-only
regs into the secure address space" approach this code will need to
change accordingly.

> +
>      object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index c2931bf..8deabb4 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -26,6 +26,7 @@
>  #include "hw/ide/ahci.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/ssi/xilinx_spips.h"
> +#include "hw/timer/arm_generic_timer.h"
>  #include "hw/dma/xlnx_dpdma.h"
>  #include "hw/display/xlnx_dp.h"
>
> @@ -83,6 +84,7 @@ typedef struct XlnxZynqMPState {
>      SysbusAHCIState sata;
>      SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
>      XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
> +    ARMGenTimer arm_gen_timer;
>      XlnxDPState dp;
>      XlnxDPDMAState dpdma;

thanks
-- PMM
