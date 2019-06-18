Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3485035wrg;
        Tue, 18 Jun 2019 02:22:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuX6OOtLqbRVL8feGBLd3nqKOFECgK6X4JZeOtXl7ATvHAfqlodGYh3nqtrcyVuOjdjXxK
X-Received: by 2002:a50:addc:: with SMTP id b28mr27745912edd.174.1560849722926;
        Tue, 18 Jun 2019 02:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560849722; cv=none;
        d=google.com; s=arc-20160816;
        b=ToOtnaTYxQ6ibbMNJWa8Q0KOi8rV3z4vT2hIgl4OjgK1O66AE4fnl7RR0WDLwH5Cw3
         ZNdN1A0MTdIOzxT+R3r876AlWLlMhvmdT+vJI9o4/EpWDzw3iXrd6ZotjwejaI13Cke/
         nItUvZ1KVyimxxkutcGtqV4UU1rshvR1LSZ6J4a0tGwkqNVTibC1RE4XCIfIWJjXhYXw
         oUHYqtvdstuPQ/NlCwfA9WtidYxzHC1q9zHvwY/enFSUkPcOvd49TKTYO61Ei25QlcUq
         lW8DJ5VwhhJSf+RDN4BE0tlOQ0WfG8lCB6LY6I48WJX7Bn42A+VSgeEZAVxjGlxigw3A
         M42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=4EnvnNDSnSaEqWcEfh6epo2Bdy+VspD+rfNgrL6P/mE=;
        b=zk7lNSJkRitUX7mROt82cGR5X0ZsHe7o07UqXSV8hZqIHe6qQPjMJyx9SZXcN+OeG9
         FR+v1E91u9JBuK3yxhbs/Maq0jk7X5iEcjCFAzyyJcU4jMKKdXfNf7Mu3Khpie/pS+yL
         fTd5ECVbzCVlRXFNNtOxyUSGIqQKkbcSAlHohcP2B7sCkuue4UcfgbrGqiLGHj1E9tzR
         SfKkk3DDpSayWGdQxkpJcCDcPhJJ68tl7TlMVD3S58FFWs0kXjOrLocID5gKXDD8lGMw
         6kNNLYlDSTYTY6VhjFCYAXUtLY4EVZLQsIzT20yXaKvNvNZyF7VAE5m7RzczN/9tejPO
         Fo6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19si10353921edm.1.2019.06.18.02.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 02:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdAJV-0005Sx-Ap
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 05:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdAJ9-0005SZ-Lm
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 05:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdAJ8-00029L-HQ
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 05:21:39 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:59173)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdAJ8-00026R-9i
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 05:21:38 -0400
Received: from player691.ha.ovh.net (unknown [10.109.146.53])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id C348210009E
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 11:21:35 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 6DE2470C8AAB;
 Tue, 18 Jun 2019 09:21:29 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, qemu-arm@nongnu.org
References: <20190618085154.21498-1-rashmica.g@gmail.com>
 <20190618085154.21498-3-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <07308eea-1249-98d2-6e3a-d701c97410ee@kaod.org>
Date: Tue, 18 Jun 2019 11:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618085154.21498-3-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12474689493473135571
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.61.149
Subject: Re: [Qemu-arm] [PATCH 2/2] aspeed: add a GPIO controller to the SoC
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PlkE7kOiT3XC

On 18/06/2019 10:51, Rashmica Gupta wrote:
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
>  include/hw/arm/aspeed_soc.h |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 1cc98b9f40..8583869acf 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -23,6 +23,7 @@
>  #include "net/net.h"
>  
>  #define ASPEED_SOC_IOMEM_SIZE       0x00200000
> +#define ASPEED_SOC_GPIO_BASE        0x1E780000
>

You should put this value in the memmap array.

C. 


>  static const hwaddr aspeed_soc_ast2400_memmap[] = {
>      [ASPEED_IOMEM]  = 0x1E600000,
> @@ -120,6 +121,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -131,6 +133,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -142,6 +145,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -153,6 +157,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 2,
>          .fmc_typename = "aspeed.smc.ast2500-fmc",
>          .spi_typename = aspeed_soc_ast2500_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2500",
>          .wdts_num     = 3,
>          .irqmap       = aspeed_soc_ast2500_irqmap,
>          .memmap       = aspeed_soc_ast2500_memmap,
> @@ -225,6 +230,8 @@ static void aspeed_soc_init(Object *obj)
>  
>      sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
>                            sizeof(s->ftgmac100), TYPE_FTGMAC100);
> +    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
> +                          sc->info->gpio_typename);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -366,6 +373,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>                      sc->info->memmap[ASPEED_ETH1]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
>                         aspeed_soc_get_irq(s, ASPEED_ETH1));
> +
> +    /* GPIO */
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, ASPEED_SOC_GPIO_BASE);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +            qdev_get_gpio_in(DEVICE(&s->vic), 20));
>  }
>  
>  static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 88b901d5df..28ff2bedb4 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -20,6 +20,7 @@
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
> +#include "hw/gpio/aspeed_gpio.h"
>  
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
> @@ -40,6 +41,7 @@ typedef struct AspeedSoCState {
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100;
> +    AspeedGPIOState gpio;
>  } AspeedSoCState;
>  
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -53,6 +55,7 @@ typedef struct AspeedSoCInfo {
>      int spis_num;
>      const char *fmc_typename;
>      const char **spi_typename;
> +    const char *gpio_typename;
>      int wdts_num;
>      const int *irqmap;
>      const hwaddr *memmap;
> 

