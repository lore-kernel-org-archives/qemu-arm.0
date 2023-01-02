Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6708501ejb;
        Mon, 2 Jan 2023 05:38:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGd9v2q+k3MaAQs3WLaq6U1t+iVhJBSo5H02d6JyWurUFMHx4hIrmFeg9f//JbZHbWkBMO
X-Received: by 2002:ad4:5011:0:b0:51f:bfd:b725 with SMTP id s17-20020ad45011000000b0051f0bfdb725mr62240022qvo.49.1672666712455;
        Mon, 02 Jan 2023 05:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666712; cv=none;
        d=google.com; s=arc-20160816;
        b=hBFKO3HrldqGZ4dTz6RyVgmuXDx9CR4DD6MdjKIrmswwHgv3Y6LBz4zubB76Xja4vz
         XgCg9Q6ZHgvZB6KM9czWkskPAqYAPztfv2bbBE9MYmEL0r+yRU/CC4hcT9XBHbQ/f4wb
         5RFJNH2YplDjGdHQV3LbSZqdh6FU/5ur/cfI0ntTT1HH8HEN9m77G9oxVyaZrEw9chS2
         qlHn8Q3Y6Ip1ObE5FFWR7PeL3RjrDxew9+4ukMNyZy3EaQaSMnykmz49x7viIou30ReS
         Tw7XjGLgNdhug0/JYucFCvYZ7z+1qwyDtWTOyjx5VWPwwuSVGacmUF4uYgiAsbBu5vgA
         o6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=vZyrdOiO10hHGSj3zbpUsbQOdPbs66+DsilqMmIHc18=;
        b=i08wYmieW0d7oJ78EQkxXWLUq82Aerb1n8aCHcUcN/NTeVWskGyIA3uFGB8P6RFrDM
         Sz83AYR8ZfPiut8Lqf6U206C2eWu+8SFH8DdZZCSOVkrrzAZIkxwY5BDSQfE2lg5DRfq
         xNvBGfuzDBdy8hqENlaCj471eGQiORxLwxbaZqy2+cKhuBLIDi5XFkTmy5nhxHjjcpGQ
         JaGoz+lkgvveeBGTXQFjRXpoIrXFG16Dh+yZ2xVfl09yW1wRR20L5Rm5achUxVaIS7Uu
         P7GAPCDnwaE45fqdBsqHcPvx05qmCEedg60dbG1ABvgqGAMhwqpcGwOh0RELepy3AZSY
         VNGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a05620a290400b006fbf7a09effsi14787556qkp.647.2023.01.02.05.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:38:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCL1D-0001c7-6Z; Mon, 02 Jan 2023 08:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL1B-0001XC-5y
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:38:21 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL18-0006Dv-Gk
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:38:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BC3522CDC3;
 Mon,  2 Jan 2023 13:38:15 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:38:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c79f2384-0524-4375-b0ea-f07f75b5b60a,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <78f03e54-597d-2ab5-6d81-36de0eb46332@kaod.org>
Date: Mon, 2 Jan 2023 14:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/11] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-7-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-7-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: de304fec-42d9-43e3-9294-075bc18394cd
X-Ovh-Tracer-Id: 16016770602621438852
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqth
 hinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kOVmOE2SHeZA

On 12/30/22 12:34, Philippe Mathieu-Daudé wrote:
> Based on booting Zephyr demo from [1] running QEMU with
> '-d unimp' and checking missing devices in [2].
> 
> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> [2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
>   include/hw/arm/aspeed_soc.h | 11 +++++++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 3500294df7..d7dbc1a801 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -28,10 +28,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>       [ASPEED_DEV_FMC]       = 0x7E620000,
>       [ASPEED_DEV_SPI1]      = 0x7E630000,
>       [ASPEED_DEV_SPI2]      = 0x7E640000,
> +    [ASPEED_DEV_UDC]       = 0x7E6A2000,
>       [ASPEED_DEV_SCU]       = 0x7E6E2000,
> +    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
> +    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
>       [ASPEED_DEV_ADC]       = 0x7E6E9000,
> +    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
>       [ASPEED_DEV_SBC]       = 0x7E6F2000,
>       [ASPEED_DEV_GPIO]      = 0x7E780000,
> +    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
>       [ASPEED_DEV_TIMER1]    = 0x7E782000,
>       [ASPEED_DEV_UART1]     = 0x7E783000,
>       [ASPEED_DEV_UART2]     = 0x7E78D000,
> @@ -79,12 +84,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>       [ASPEED_DEV_LPC]       = 35,
>       [ASPEED_DEV_PECI]      = 38,
>       [ASPEED_DEV_FMC]       = 39,
> +    [ASPEED_DEV_ESPI]      = 42,
>       [ASPEED_DEV_PWM]       = 44,
>       [ASPEED_DEV_ADC]       = 46,
>       [ASPEED_DEV_SPI1]      = 65,
>       [ASPEED_DEV_SPI2]      = 66,
>       [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
>       [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
> +    [ASPEED_DEV_UDC]       = 9,
> +    [ASPEED_DEV_SGPIOM]    = 51,
> +    [ASPEED_DEV_JTAG0]     = 27,
> +    [ASPEED_DEV_JTAG1]     = 53,
>   };
>   
>   static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
> @@ -155,6 +165,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
>       object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
>       object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
>                               TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "sgpiom", &s->sgpiom,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
>   }
>   
>   static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> @@ -337,6 +356,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                       sc->memmap[ASPEED_DEV_GPIO]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
> +                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
> +                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
> +                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
> +                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
>   }
>   
>   static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8389200b2d..9a5e3c0bac 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -44,6 +44,7 @@
>   #define ASPEED_CPUS_NUM  2
>   #define ASPEED_MACS_NUM  4
>   #define ASPEED_UARTS_NUM 13
> +#define ASPEED_JTAG_NUM  2
>   
>   struct AspeedSoCState {
>       /*< private >*/
> @@ -87,6 +88,11 @@ struct AspeedSoCState {
>       UnimplementedDeviceState video;
>       UnimplementedDeviceState emmc_boot_controller;
>       UnimplementedDeviceState dpmcu;
> +    UnimplementedDeviceState pwm;
> +    UnimplementedDeviceState espi;
> +    UnimplementedDeviceState udc;
> +    UnimplementedDeviceState sgpiom;
> +    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
>   };
>   
>   #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -174,6 +180,11 @@ enum {
>       ASPEED_DEV_DPMCU,
>       ASPEED_DEV_DP,
>       ASPEED_DEV_I3C,
> +    ASPEED_DEV_ESPI,
> +    ASPEED_DEV_UDC,
> +    ASPEED_DEV_SGPIOM,
> +    ASPEED_DEV_JTAG0,
> +    ASPEED_DEV_JTAG1,
>   };
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);

