Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp119779lfg;
        Wed, 24 Mar 2021 00:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE49e4wAOXerwwtE60X5YY7ndL3HgL3WVYKp3I5kIdwuKQo0M1vcq4IWeaqZ6/xszZWYLG
X-Received: by 2002:a25:56c2:: with SMTP id k185mr1307056ybb.131.1616570683875;
        Wed, 24 Mar 2021 00:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616570683; cv=none;
        d=google.com; s=arc-20160816;
        b=vgYJGlmHAOFolEJ+yxcbRzaxzjqwHb5TkruRbu5H0h0rt7fd+ZakkLj7UZPCk2Vmel
         iv8sH27Z0xlH59/eI9o4c12Cg/vx/SGLWtzsyTn2Ny+OrscZ9SQbsAjNlJn2zka1tDHg
         /6/mnbNBzyps0wLQLBl6BJzz4LUe1ea2BDg6GtCkfMjYF8iXt1HIUkO0T6jCn+GuAOM+
         m393xB3H+tnz1qsXoCCkXTZeZ29LHVsjvFrpHTaLDOOvDPxzCo7g/5cu+obVe43hRHIG
         npGt0GiVRxWRyYafoqAfMv8Dc7/zKuaOExKJsv5oLwp2oH11wTYjiA31d9lR4ht4Chg5
         wQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=MDmQ3JwJ/31xXIsuqng3fi/eCXd+E1Bla3JEUZXUdLM=;
        b=uQEdVo3YYeiA+/vpcHXuFNser+ZsSmCXB1PCSRsPwFt3gAANfTMpNrx7bNdiaq6A8r
         oZzrjzreqnLhD9Dc9bJZrHVRutVipz92+MuS2kQIXx6IYdlC5/ebKcvnmfcEWYh4jYEX
         tLpBve7z4jwteoKpZqeIPHZtlh2HP2VtdumVt65rhUKrPzU4w2djeztPpt2YAdgEqfK4
         yOTf9D0rnOEk6mzZiE8BPvihn636C/0FEuVkGBVnqYHoZzPbGarTrxOekV8ZSDT72dBW
         IOe7EpIFqBTDHN6DWAwBywrw7QxySc81UlmgoAUP5SmgMP1oio/JLkjgTQ3RvyjoZ6Yn
         a/Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si1658495ybc.382.2021.03.24.00.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 00:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOxsh-0001WZ-5l
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 03:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lOxpw-0006kK-E7
 for qemu-arm@nongnu.org; Wed, 24 Mar 2021 03:21:52 -0400
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:49584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lOxpu-0006sq-60
 for qemu-arm@nongnu.org; Wed, 24 Mar 2021 03:21:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.221])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 17380255FBD;
 Wed, 24 Mar 2021 08:21:46 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 08:21:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002911f2134-810f-47b8-bf4b-ea4397835682,
 90EFDD1C85C6F754CEE6F6149A82CEA72524D6DA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 2/3] aspeed: Integrate HACE
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210324070955.125941-1-joel@jms.id.au>
 <20210324070955.125941-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <158967a9-9a91-5551-8546-5d37b805634d@kaod.org>
Date: Wed, 24 Mar 2021 08:21:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210324070955.125941-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 70d9836d-8c65-49f9-bac0-b8090332792c
X-Ovh-Tracer-Id: 16756205367250029350
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3PBLiF8apxx+

On 3/24/21 8:09 AM, Joel Stanley wrote:
> Add the hash and crypto engine model to the Aspeed socs.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
> v3: Rebase on upstream
> v4: Update integration for soc-specific hace objects
> ---
>  docs/system/arm/aspeed.rst  |  2 +-
>  include/hw/arm/aspeed_soc.h |  3 +++
>  hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
>  hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
>  4 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index d1fb8f25b39c..f9466e6d8245 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -49,6 +49,7 @@ Supported devices
>   * Ethernet controllers
>   * Front LEDs (PCA9552 on I2C bus)
>   * LPC Peripheral Controller (a subset of subdevices are supported)
> + * Hash/Crypto Engine (HACE) - Hash support only, no scatter-gather
>  
>  
>  Missing devices
> @@ -59,7 +60,6 @@ Missing devices
>   * PWM and Fan Controller
>   * Slave GPIO Controller
>   * Super I/O Controller
> - * Hash/Crypto Engine
>   * PCI-Express 1 Controller
>   * Graphic Display Controller
>   * PECI Controller
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 9359d6da336d..d9161d26d645 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -21,6 +21,7 @@
>  #include "hw/rtc/aspeed_rtc.h"
>  #include "hw/i2c/aspeed_i2c.h"
>  #include "hw/ssi/aspeed_smc.h"
> +#include "hw/misc/aspeed_hace.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
>  #include "target/arm/cpu.h"
> @@ -50,6 +51,7 @@ struct AspeedSoCState {
>      AspeedTimerCtrlState timerctrl;
>      AspeedI2CState i2c;
>      AspeedSCUState scu;
> +    AspeedHACEState hace;
>      AspeedXDMAState xdma;
>      AspeedSMCState fmc;
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
> @@ -133,6 +135,7 @@ enum {
>      ASPEED_DEV_XDMA,
>      ASPEED_DEV_EMMC,
>      ASPEED_DEV_KCS,
> +    ASPEED_DEV_HACE,
>  };
>  
>  #endif /* ASPEED_SOC_H */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index bc87e754a3cc..c149936e0b28 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>      [ASPEED_DEV_ETH2]      = 0x1E680000,
>      [ASPEED_DEV_ETH4]      = 0x1E690000,
>      [ASPEED_DEV_VIC]       = 0x1E6C0000,
> +    [ASPEED_DEV_HACE]      = 0x1E6D0000,
>      [ASPEED_DEV_SDMC]      = 0x1E6E0000,
>      [ASPEED_DEV_SCU]       = 0x1E6E2000,
>      [ASPEED_DEV_XDMA]      = 0x1E6E7000,
> @@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
>      [ASPEED_DEV_ETH1]      = 2,
>      [ASPEED_DEV_ETH2]      = 3,
> +    [ASPEED_DEV_HACE]      = 4,
>      [ASPEED_DEV_ETH3]      = 32,
>      [ASPEED_DEV_ETH4]      = 33,
>      [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
> @@ -213,6 +215,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                              TYPE_SYSBUS_SDHCI);
>  
>      object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
>  }
>  
>  /*
> @@ -498,6 +503,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
>                         qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>                                  sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
> +
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>  }
>  
>  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 057d053c8478..c8c3bd233233 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>      [ASPEED_DEV_VIC]    = 0x1E6C0000,
>      [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>      [ASPEED_DEV_SCU]    = 0x1E6E2000,
> +    [ASPEED_DEV_HACE]   = 0x1E6E3000,
>      [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>      [ASPEED_DEV_VIDEO]  = 0x1E700000,
>      [ASPEED_DEV_ADC]    = 0x1E6E9000,
> @@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
>      [ASPEED_DEV_VIC]    = 0x1E6C0000,
>      [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>      [ASPEED_DEV_SCU]    = 0x1E6E2000,
> +    [ASPEED_DEV_HACE]   = 0x1E6E3000,
>      [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>      [ASPEED_DEV_ADC]    = 0x1E6E9000,
>      [ASPEED_DEV_VIDEO]  = 0x1E700000,
> @@ -117,6 +119,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
>      [ASPEED_DEV_ETH2]   = 3,
>      [ASPEED_DEV_XDMA]   = 6,
>      [ASPEED_DEV_SDHCI]  = 26,
> +    [ASPEED_DEV_HACE]   = 4,
>  };
>  
>  #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
> @@ -212,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
>      }
>  
>      object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -425,6 +431,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>  
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
>                         qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4));
> +
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>  }
>  static Property aspeed_soc_properties[] = {
>      DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> 

