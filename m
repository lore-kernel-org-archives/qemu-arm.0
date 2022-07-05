Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3696138lft;
        Mon, 4 Jul 2022 22:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uimjnxWOReGbFQbNhmQ7zoWxK47SHVFKCBXyXqeE5A6ixSR0KKuLsRsgV9G+w3H+BP9ugN
X-Received: by 2002:a05:620a:1b90:b0:6af:6ca:4f7a with SMTP id dv16-20020a05620a1b9000b006af06ca4f7amr21841929qkb.665.1657000104979;
        Mon, 04 Jul 2022 22:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657000104; cv=none;
        d=google.com; s=arc-20160816;
        b=p0d0Jx9RiOMbQ3oXHpYgfU7+YGnSot8DeaElqdalA9AzzaCAyAYV6XZzL+ER4UbVEJ
         Upnin47xO2bnhHLU9dBFmIIvtJGo1b9N1qwNEqX/lsPyxFbtObMH9jIY02+GQlMbspKT
         eEczjbn/bpov8zsZN16L56t7oNi+8qJZt2bAlqfbTVBN9MlBj5li0O7VEXoEDXAXBBQ2
         QfBCPLUhmBmzdKtJCr5AZ52iZFTvlBQEOhxvqW93/CbtWowNkLOZrtOi2Q9h1QRt6gxe
         iZ4sN8RF26FNLG+VXInGVB0zxs+4GB6jOKvZGrBBMIKRUHmwMy2AIXLo/nWwY+JHdIUg
         Dadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=sJGsjJ2Y4rJRP+rtohIxthjPjTwgQT1R5fcwaL4mIIs=;
        b=H6REbmf4BpYEzQ+nqKwrxHfPHsnXib1ofw3B2lUishFtoLpFEoWsRVE3AXA/k9PrX6
         zqxZ0B/BtylBWxkkLfbKFn/ymvE405aHPODX+BTn33Uuok4m7LCv4hQcJEbwh763j+Eu
         C8no4f6g+P11hRGGjZXK7x/KZz5O1gbEV7fjL9PtAOIzwCU5SZ1hJkldcHKfgQ427tIU
         JEA4ljNc0MxZl49SKn/594eL6Q9Hb0WP6AZ80mRwv+KF5b3SrwxKU3XS2lqgoG/XcGHY
         z6srE83KoG7dyXhDHRgk0MjSLg4ll37upcKcC0r6/dumullq5heRimHrEeqvXmIZ2R6P
         lxvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140d4300b004726e3e3f0csi16471802qvr.558.2022.07.04.22.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 22:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8bQ8-00006O-Fc
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 01:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8bP5-00005Y-5u; Tue, 05 Jul 2022 01:47:19 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:48689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8bOt-0005CJ-6l; Tue, 05 Jul 2022 01:47:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D130A114601E3;
 Tue,  5 Jul 2022 07:47:01 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 07:47:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005209147fe-f0c0-4e59-b028-e87291dbeb62,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5b88331e-fbc5-252f-17c6-6da2dadfc7b7@kaod.org>
Date: Tue, 5 Jul 2022 07:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/8] aspeed: Create SRAM name from first CPU index
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-2-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704215457.38332-2-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 625a4d7f-88c8-46b1-b389-28e2ef0a1364
X-Ovh-Tracer-Id: 15011904935517719334
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVXgtTcqQMHp

On 7/4/22 23:54, Peter Delevoryas wrote:
> To support multiple SoC's running simultaneously, we need a unique name for
> each RAM region. DRAM is created by the machine, but SRAM is created by the
> SoC, since in hardware it is part of the SoC's internals.
> 
> We need a way to uniquely identify each SRAM region though, for VM
> migration. Since each of the SoC's CPU's has an index which identifies it
> uniquely from other CPU's in the machine, we can use the index of any of the
> CPU's in the SoC to uniquely identify differentiate the SRAM name from other
> SoC SRAM's. In this change, I just elected to use the index of the first CPU
> in each SoC.
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed_ast10x0.c | 5 ++++-
>   hw/arm/aspeed_ast2600.c | 5 +++--
>   hw/arm/aspeed_soc.c     | 5 +++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 33ef331771..677699e54c 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       DeviceState *armv7m;
>       Error *err = NULL;
>       int i;
> +    g_autofree char *sram_name = NULL;
>   
>       if (!clock_has_source(s->sysclk)) {
>           error_setg(errp, "sysclk clock must be wired up by the board code");
> @@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
>   
>       /* Internal SRAM */
> -    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
> +    sram_name = g_strdup_printf("aspeed.sram.%d",
> +                                CPU(s->armv7m.cpu)->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
>       if (err != NULL) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 3f0611ac11..64eb5a7b26 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
>       qemu_irq irq;
> +    g_autofree char *sram_name = NULL;
>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 0f675e7fcd..0bb6a2f092 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       AspeedSoCState *s = ASPEED_SOC(dev);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
> +    g_autofree char *sram_name = NULL;
>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;

