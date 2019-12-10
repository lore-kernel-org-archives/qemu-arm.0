Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5762811lff;
        Tue, 10 Dec 2019 04:52:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoN01ylxNP/wkeZL7XFSttmp6SB3gMvjt0asdvzxqmT6dGWMAfWa6vTjZU9jQ3IR2sqYOJ
X-Received: by 2002:aca:4911:: with SMTP id w17mr3694932oia.22.1575982377714;
        Tue, 10 Dec 2019 04:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575982377; cv=none;
        d=google.com; s=arc-20160816;
        b=d7ps0NIWaJJYQv/2lMST7UsH/hA0ZJK9BvIFHEuHKXNbG6pNSh0hCoOY6P+62+iYxO
         Ecif2N63s1s9ro3UH5GKExuzQT/Pukw7XDXiAX7pnjKADDMfHgMaYSiBgd2lVof4Vu1j
         Fo39CZqTeJW1dc/sBs9ObYoe3Oh+yjFS9G2lQARjMi+zJqIEGU4HuS6YG29cfB050fL9
         yISs+gj/FnaBxGwxQj4/inU/m9TqarHgc+Kjw6wx/u7XtP46e208TGs/ze3bTaJf4fGP
         Nr0A/UoGjxEEAA5sNjhNACx3Z4qFJfqNIeXV7s+f7f3fNzOa2SKW7ibHKz+hJD4kxxRM
         tDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=m1sZ7XhFHihhThZNwkEIDLN3YjH4CaIeW6dGObZHKAc=;
        b=DDKQiU6kCQSnADks7WsPFJGCCBbL6ZnIU/+JAySe+Isri/4947ky5heR1j2N0p7B40
         seoPSMCAntm0wLFDp+fvzyrgA0TVGJlrrQUKjMN5WJAvZhaz35bU3f0yvYOipLPQVDNu
         FI8oVcE3vqJ/fHPqxKz5CeTTJ89PE2GGf1riAshRGpxKV0L+YJhP964bbFLw0JaPegm5
         TyXa9iMlyPmIYVOhM29x5aphKKaA7no+NFXgqC5MqHmNcBjfHexl2Wx/Cjty1POIipHt
         IgewtQszJWClI4AvkLmy19h3SMWo8cg4piNnEWHr29dw8oN/rWsYLq9/mbQcxoSKUzce
         I6jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m204si1823944oib.235.2019.12.10.04.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 04:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ief0a-0008PD-VF
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 07:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ief0U-0008Oy-0h
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 07:52:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ief0S-0001HB-Jb
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 07:52:49 -0500
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:48809)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ief0S-0001Gc-Cn
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 07:52:48 -0500
Received: from player759.ha.ovh.net (unknown [10.108.1.181])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 234BC25DC14
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 13:52:45 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id C375ED2502F3;
 Tue, 10 Dec 2019 12:52:40 +0000 (UTC)
Subject: Re: [PATCH 2/2] hw/arm: ast2600: Wire up the eMMC controller
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
 <5a93d2f9d375f92e9db6b1cf8687f86beaedcbb2.1575938234.git-series.andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d1d53a3f-90ed-4436-59ec-fe3fcc985817@kaod.org>
Date: Tue, 10 Dec 2019 13:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5a93d2f9d375f92e9db6b1cf8687f86beaedcbb2.1575938234.git-series.andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10744744289061342016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.124.100
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5TlCWLbAfQ44

On 10/12/2019 01:52, Andrew Jeffery wrote:
> Initialise another SDHCI model instance for the AST2600's eMMC
> controller and use the SDHCI's num_slots value introduced previously to
> determine whether we should create an SD card instance for the new slot.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

LGTM. One comment.

> ---
>  hw/arm/aspeed.c             | 13 +++++++++++++
>  hw/arm/aspeed_ast2600.c     | 21 +++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h |  2 ++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 862549b1f3a9..0e08d62e9ff3 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -272,6 +272,19 @@ static void aspeed_board_init(MachineState *machine,
>          object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
>      }
>  
> +    if (bmc->soc.emmc.num_slots) {
> +        SDHCIState *emmc = &bmc->soc.emmc.slots[0];
> +        DriveInfo *dinfo = drive_get_next(IF_SD);
> +        BlockBackend *blk;
> +        DeviceState *card;
> +
> +        blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> +        card = qdev_create(qdev_get_child_bus(DEVICE(emmc), "sd-bus"),
> +                           TYPE_SD_CARD);
> +        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
> +    }

I think we could use a function for the above ^

C.

>      arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>  }
>  
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931ee5aae183..723c8196c8a5 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -46,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>      [ASPEED_ADC]       = 0x1E6E9000,
>      [ASPEED_VIDEO]     = 0x1E700000,
>      [ASPEED_SDHCI]     = 0x1E740000,
> +    [ASPEED_EMMC]      = 0x1E750000,
>      [ASPEED_GPIO]      = 0x1E780000,
>      [ASPEED_GPIO_1_8V] = 0x1E780800,
>      [ASPEED_RTC]       = 0x1E781000,
> @@ -64,6 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>  
>  #define ASPEED_SOC_AST2600_MAX_IRQ 128
>  
> +/* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
>  static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_UART1]     = 47,
>      [ASPEED_UART2]     = 48,
> @@ -77,6 +79,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_ADC]       = 78,
>      [ASPEED_XDMA]      = 6,
>      [ASPEED_SDHCI]     = 43,
> +    [ASPEED_EMMC]      = 15,
>      [ASPEED_GPIO]      = 40,
>      [ASPEED_GPIO_1_8V] = 11,
>      [ASPEED_RTC]       = 13,
> @@ -215,6 +218,14 @@ static void aspeed_soc_ast2600_init(Object *obj)
>          sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]),
>                                sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDHCI);
>      }
> +
> +    sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc), sizeof(s->emmc),
> +                          TYPE_ASPEED_SDHCI);
> +
> +    object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abort);
> +
> +    sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s->emmc.slots[0]),
> +            sizeof(s->emmc.slots[0]), TYPE_SYSBUS_SDHCI);
>  }
>  
>  /*
> @@ -487,6 +498,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                      sc->memmap[ASPEED_SDHCI]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>                         aspeed_soc_get_irq(s, ASPEED_SDHCI));
> +
> +    /* eMMC */
> +    object_property_set_bool(OBJECT(&s->emmc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_EMMC]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_EMMC));
>  }
>  
>  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 495c08be1b84..911443f4c071 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -56,6 +56,7 @@ typedef struct AspeedSoCState {
>      AspeedGPIOState gpio;
>      AspeedGPIOState gpio_1_8v;
>      AspeedSDHCIState sdhci;
> +    AspeedSDHCIState emmc;
>  } AspeedSoCState;
>  
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -125,6 +126,7 @@ enum {
>      ASPEED_MII4,
>      ASPEED_SDRAM,
>      ASPEED_XDMA,
> +    ASPEED_EMMC,
>  };
>  
>  #endif /* ASPEED_SOC_H */
> 

