Received: by 10.103.124.15 with SMTP id x15csp1598167vsc;
        Mon, 22 May 2017 16:41:40 -0700 (PDT)
X-Received: by 10.176.86.28 with SMTP id y28mr11219443uaa.145.1495496500062;
        Mon, 22 May 2017 16:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495496500; cv=none;
        d=google.com; s=arc-20160816;
        b=rwf2Du+3I8k1pdxjl7vDOIbE+/4I9mPxWAZoGORbEQmx9v/lfIWWgaous0EHM1iCuB
         /AQXxVPP7Ti1GrqExzI7H4XLHjD+heKJDRl0UsZahRrnTnX4Xfh5k8M76R94nKMvf7Za
         pXY3yP2Broxiw2vXcCilmcg4CEiYDs3H24Nu2OmVkKApPnDIaeU3TnjK2/iZXeWhZM7D
         EUN2ruq3vhfiZ9fj2rlBIUgVpfbdsjvCmTmUHBirMrHU5P9nUapaS5ZbWGwHlmYaJ3LN
         0fxK9QYQksPAVxkT0LC38fMpN8kW6xIgvlryfsoGVyvmWbsv8Uo2j/J4PSxbZLpiFZVa
         Pw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bOq2luggBuT0n29J48kSUzkBBfMqbRX7gC/bby5PnBw=;
        b=tbbfa/tvwxkfM9CgpieJXJ/54lSj88cMfbuJJROCOf+bbXiyFVIRq3c3GdVePNod17
         nWnFsbza6wkqO/zNSyG2Vz0yefWqafYCZq0W6+mLLJ92/XFe0whGErsS+flflP26W+uW
         l7nCvi4k0z70mh21v2GIO0W+5uMS93qCs2eLcGwy76CgmdqPDHnV3wt72D5dOI3uCc5F
         boVqzoIGIRHH6QFUEN8euGwl6/353f4w7tLPo7rkX5DLBj7L8Kw9UNYa6v2iarzWF1jJ
         jtFiGdgfjONzZQpUk9+/VhoEsUnVkobTgSpjYkNAx09neWE4A/Pos9q2esfdxpVKzdeo
         Un2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w17si9133632uag.6.2017.05.22.16.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 16:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCwxH-0006HF-Jx
	for alex.bennee@linaro.org; Mon, 22 May 2017 19:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dCwx8-0006H7-9E
	for qemu-arm@nongnu.org; Mon, 22 May 2017 19:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dCwx7-0001yT-9C
	for qemu-arm@nongnu.org; Mon, 22 May 2017 19:41:30 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dCwx7-0001yB-4Z; Mon, 22 May 2017 19:41:29 -0400
Received: by mail-oi0-x242.google.com with SMTP id w138so25299778oiw.3;
	Mon, 22 May 2017 16:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bOq2luggBuT0n29J48kSUzkBBfMqbRX7gC/bby5PnBw=;
	b=qLyLfq1AH0VctRtMXTtKN5z68CcJiqrMU1tU0uP/x6lzRu5TDqXo8Ok+RS0A+MQ4Ia
	WTtv45qeKpm1EIuWpR2rOwAsOFDJbeSKUBlL9I3ZkI9R0PaweGeRI9DuaBSinR4WLDxH
	Rosj2m5jyJRRCKZ7v8+JF7u6aGvtZIXdwO1z+l/CBgUAkhvv1ai9uiSZfoRleQrRfob6
	DnSON1+d0+idi4xaxnVEfAzOBB8hS0u2tiELaUEax28d21CB2RFAGaCT4XXAQ8CtBR3u
	TNbtM7XFbcIRnuKKb2kOv0RnA3VS+kGRTESVu1guJdKm94Puv1o8r7FmCPFBhH1PCRZ1
	aueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bOq2luggBuT0n29J48kSUzkBBfMqbRX7gC/bby5PnBw=;
	b=BmNAWSlT0264lnly3jU/5maa8kXwPySDBx6ohLzdJ4ZRUyM0UdPpV5attJuwDDIeMi
	dsw/vk+4YUWxx5N4hB9Od9Da9+3/Vbg7/DqM1ElEEe2Dslx0qkabcvENeS294MZJYhVk
	PfbrNWX/YGK0ovhoNJqJmxSOCNlzYbqam0wl/Uj4aysjwdFo6a1GWy0GRN6HqIazZwOk
	ca/TTmT6CjvviUYANhcxZMl0WekV/W8SuW0i3RjMobtEBssHnLTldMsbDHqSUMTiTW7c
	rHCClqbqQydQDvvOKUzzTGop7JnGyg5SQk2thrY6hrIZx65aD0NtFMLIq9kJ+uPAPN1s
	PszA==
X-Gm-Message-State: AODbwcCmdnRdmIeK5LoEDf1OKZKK7kwPhzbf1sCXjPu79Y08+288rlTj
	2A4W6wF3I8pxRDu0MKc58m9mH7H1Og==
X-Received: by 10.157.29.235 with SMTP id w40mr264981otw.128.1495496488059;
	Mon, 22 May 2017 16:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.2.37 with HTTP; Mon, 22 May 2017 16:40:57 -0700 (PDT)
In-Reply-To: <20170520002653.20213-3-andrew@aj.id.au>
References: <20170520002653.20213-1-andrew@aj.id.au>
	<20170520002653.20213-3-andrew@aj.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 May 2017 16:40:57 -0700
Message-ID: <CAKmqyKMcV-yD-HePHYsR5yvwt6LPv4YTSf+Eq1BNRTe6aoTVww@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm: Integrate ADC model
 into Aspeed SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MWuwcR8dS1qz

On Fri, May 19, 2017 at 5:26 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

The connections look good to me. I'll have a look at V2 of your first patch.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair


> ---
>  hw/arm/aspeed_soc.c         | 15 +++++++++++++++
>  include/hw/arm/aspeed_soc.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 5c667d2c35b6..11f9588720d2 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -31,6 +31,7 @@
>  #define ASPEED_SOC_VIC_BASE         0x1E6C0000
>  #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
>  #define ASPEED_SOC_SCU_BASE         0x1E6E2000
> +#define ASPEED_SOC_ADC_BASE         0x1E6E9000
>  #define ASPEED_SOC_SRAM_BASE        0x1E720000
>  #define ASPEED_SOC_TIMER_BASE       0x1E782000
>  #define ASPEED_SOC_WDT_BASE         0x1E785000
> @@ -157,6 +158,10 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>                                "hw-strap2", &error_abort);
>
> +    object_initialize(&s->adc, sizeof(s->adc), TYPE_ASPEED_ADC);
> +    object_property_add_child(obj, "adc", OBJECT(&s->adc), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->adc), sysbus_get_default());
> +
>      object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
>      object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
>      qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
> @@ -256,6 +261,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
>
> +    /* ADC */
> +    object_property_set_bool(OBJECT(&s->adc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, ASPEED_SOC_ADC_BASE);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
> +            qdev_get_gpio_in(DEVICE(&s->vic), 31));
> +
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hds[0]) {
>          qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index d16205c66b5f..3b4d66d30f08 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -15,6 +15,7 @@
>  #include "hw/arm/arm.h"
>  #include "hw/intc/aspeed_vic.h"
>  #include "hw/misc/aspeed_scu.h"
> +#include "hw/adc/aspeed_adc.h"
>  #include "hw/misc/aspeed_sdmc.h"
>  #include "hw/timer/aspeed_timer.h"
>  #include "hw/i2c/aspeed_i2c.h"
> @@ -37,6 +38,7 @@ typedef struct AspeedSoCState {
>      AspeedTimerCtrlState timerctrl;
>      AspeedI2CState i2c;
>      AspeedSCUState scu;
> +    AspeedADCState adc;
>      AspeedSMCState fmc;
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>      AspeedSDMCState sdmc;
> --
> 2.9.3
>
>
