Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6709937ejb;
        Mon, 2 Jan 2023 05:40:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1ITB/3e7zB294Bcmsp8c39DVFjw6GdsotcykcY0KhdQM9scWIlXy6FxCe+duK01pqj7Lv
X-Received: by 2002:ac8:7093:0:b0:3a7:ed21:ac45 with SMTP id y19-20020ac87093000000b003a7ed21ac45mr47926374qto.20.1672666854041;
        Mon, 02 Jan 2023 05:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666854; cv=none;
        d=google.com; s=arc-20160816;
        b=qq7pjiguBkImCmsR6eMP07qj1SweOPn59CbdOjTs8J1z/eBtGEfwOfMIAxE0bwkItK
         QhJfroRrkyJ6ms5qWA5MSgfooZdDjdXIncs08/UBFrTSuTL1/x5dV+iIml2DPHNnpYqz
         7thiarq+hG/riiboapZJlOknXA6osyn1fNEp1hOqaXfQ91UuXJYs6onfyrNd8NdMLso8
         xZ6JgBBPxbZ0MbUiKX/IDfUJhk16GEXPbqE4W23TQofAImNjphijOk0o+wN51kAI+lH8
         /kzbE/U5WN+31NAgVEhUgLNxB0RTz8byWJw6OIGZ/pMQpcobRp81hgLhjenK9RnyPOln
         k83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=8REzn6SJ2mtuJUA41K98gAbO06F3w2xSYIFUh+FyHok=;
        b=HA/LXPMzSrPk09ATs4qZDS/wkm557rxPPAKhapeM3ilKGY4hbFyAFw0tbPX5lPvqO5
         Qxc2zh/W2RP6m36lzWQmj2Mw/KZ7juo0qXB2Y1zEK/pxnHKGAVUHH640qU1oLwTKkNnn
         EOTnK7RZSkMMy5AZa9EpFkWjCi4w328Wpj+V2bPcV6NbGKpD6CC/3fKDHy0gmLhEP3l3
         NvyeSvSSmu/KS44u1RASh1NfpShq2NdBD8EBCoDMqaJ+x167UjC8KxruLwPvqtUxOS4u
         4FqGVTH+FulGA2KInQ2cor/c27uB+1DyovPi54thIIx61lXmT2p9BS5lLdndkgsJxSqC
         jurA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a05620a15e800b006ffc964dcb5si13557036qkm.68.2023.01.02.05.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:40:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCL3U-0003X4-RX; Mon, 02 Jan 2023 08:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL3T-0003Wc-ES
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:40:43 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL3R-00070w-3q
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:40:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 739A7150565B0;
 Mon,  2 Jan 2023 14:40:38 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:40:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00691ef8117-9b8e-47d0-bdb6-13757481cd50,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <57000f3d-e319-2fe9-201c-ab53b8cffff1@kaod.org>
Date: Mon, 2 Jan 2023 14:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/11] hw/arm/aspeed_ast10x0: Map I3C peripheral
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
 <20221230113504.37032-8-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-8-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 108fadad-9e1b-4a83-b7a5-95c41678a2c8
X-Ovh-Tracer-Id: 16057021524972571524
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqth
 hinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yKv2BSeRkk31

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> Since I don't have access to the datasheet, the relevant
> values were found in:
> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
I3C is really a dummy model. I hope we can grow the modeling with time and add some
device models.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index d7dbc1a801..6c6d33d4a0 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -54,6 +54,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>       [ASPEED_DEV_WDT]       = 0x7E785000,
>       [ASPEED_DEV_LPC]       = 0x7E789000,
>       [ASPEED_DEV_PECI]      = 0x7E78B000,
> +    [ASPEED_DEV_I3C]       = 0x7E7A0000,
>       [ASPEED_DEV_I2C]       = 0x7E7B0000,
>   };
>   
> @@ -89,6 +90,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>       [ASPEED_DEV_ADC]       = 46,
>       [ASPEED_DEV_SPI1]      = 65,
>       [ASPEED_DEV_SPI2]      = 66,
> +    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
>       [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
>       [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
>       [ASPEED_DEV_UDC]       = 9,
> @@ -130,6 +132,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
>       snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
>       object_initialize_child(obj, "i2c", &s->i2c, typename);
>   
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> +
>       snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>       object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>   
> @@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>       }
>   
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                                        sc->irqmap[ASPEED_DEV_I3C] + i);
> +        /* The AST1030 I3C controller has one IRQ per bus. */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
> +    }
> +
>       /* PECI */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
>           return;

