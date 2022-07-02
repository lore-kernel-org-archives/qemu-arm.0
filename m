Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1743169lft;
        Fri, 1 Jul 2022 23:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqZTMHvxRgsxjZdk2OjTBVpqIQ+75KfVXerHtg8GAVjUaQgmZ9K3LMe55042MYX4BH+qBX
X-Received: by 2002:a25:cfd8:0:b0:66d:e726:ed18 with SMTP id f207-20020a25cfd8000000b0066de726ed18mr6034489ybg.267.1656741698290;
        Fri, 01 Jul 2022 23:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656741698; cv=none;
        d=google.com; s=arc-20160816;
        b=QV5cO6jVo5260azJ/Un1Q3lM7wpqkC2LCNJ7LkfzlHUu58vh4hCvnynyLruvZ5HeDK
         YtZijl1QVLFswWjUmy40CY6AK2c8sSTEW649Xumz0Tbuzp5TSe+TU5HK5Dsut8xjo+Vh
         bXw/i0jnOYbgjzi5NovnFXax7/uZwWLj4V8ba8wvBplyq+Dywh+pTPyLnfE0YpiiOmsR
         pFfpp6EyEZH+I6SOb0fEgtZhM/KExqW5Nqb5+8z1MoYBBr1pVzg4br1olkYh8hqw2/Y4
         67lX2e/V2Np4k5f4DJGvHgkmDvwgoXDdO3uDEJozx/TZFD5uzFzV9+uuuvfqLi06RbT0
         i4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=fFNg76+VxmGlwDABTNh8Msf/TzL90CEBUtFBI18fxGs=;
        b=U03NdlJTpi55jPUlJRNRqbiPC88BuEYY9cABSMMiXxE5mb1DcxagYJuPsl1VJQ/Mkb
         kmm8F0V335h9/E4lTZFbpO0KmswEGHUlPziA/T1jkV6FR0Bo3z4K7rFbefgKWgDJAiUT
         w7WwYSBv5xaXyUvfhp65c5jsUe5f8bOi2OsgIgIDYV7KxgqtPeKm1DW4SpDzjUE28KIK
         M/8ZyzZ9Slwtys2q1lGcQXI2iQkA5j7IK2QzggCX4ETOSuqvL7EC0+Z9GIZQiQe4j6U9
         gpB3woFx8A/U8bBLCswfEPSkogsPEvVcKv+ulNRDMNIxqKMNqJtt0HS0p2fh1bWWkSUu
         KOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188-20020a254dc5000000b00664378afa74si26265641ybb.199.2022.07.01.23.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 23:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7WCH-00024a-MB
	for alex.bennee@linaro.org; Sat, 02 Jul 2022 02:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WC2-00024R-CJ
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 02:01:22 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WC0-0004gb-7G
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 02:01:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6C66624856;
 Sat,  2 Jul 2022 06:01:16 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:01:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0041635b4ef-0324-4f2f-90f9-e91b11c1f8c2,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3b367b09-075e-a21b-8d24-3b2be091f816@kaod.org>
Date: Sat, 2 Jul 2022 08:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed: Create SRAM name from first CPU index
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220701180603.38408-1-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220701180603.38408-1-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 271d87e8-5d0a-4bb2-99f6-de98edbafc89
X-Ovh-Tracer-Id: 16081228370541251366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: HqDqOkMa8mKg

On 7/1/22 20:06, Peter Delevoryas wrote:
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

hopefully the index is allocated. Did you check ?


> Signed-off-by: Peter Delevoryas <me@pjd.dev>
> ---
>   hw/arm/aspeed_ast10x0.c | 5 ++++-
>   hw/arm/aspeed_ast2600.c | 5 +++--
>   hw/arm/aspeed_soc.c     | 5 +++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 33ef331771..b6b6f0d053 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       DeviceState *armv7m;
>       Error *err = NULL;
>       int i;
> +    char name[64];
>   
>       if (!clock_has_source(s->sysclk)) {
>           error_setg(errp, "sysclk clock must be wired up by the board code");
> @@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
>   
>       /* Internal SRAM */
> -    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d",
> +             CPU(s->armv7m.cpu)->cpu_index);
> +    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
>       if (err != NULL) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 3f0611ac11..7efb9f888a 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
>       qemu_irq irq;
> +    char name[64];

May be ?

      g_autofree char *sram_name =
             g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);


Thanks,

C.


>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 0f675e7fcd..1ddba33d2a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       AspeedSoCState *s = ASPEED_SOC(dev);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
> +    char name[64];
>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;

