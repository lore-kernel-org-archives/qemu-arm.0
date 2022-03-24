Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3255557lfb;
        Thu, 24 Mar 2022 06:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0QnFhJsdkPheg3U8miXv7CT6xk5wK/Itivkr16jotaMGTRpr8V6q49KHeKrZhvpmgkoee
X-Received: by 2002:ac8:5c4f:0:b0:2e0:63a9:5197 with SMTP id j15-20020ac85c4f000000b002e063a95197mr4634128qtj.361.1648130253043;
        Thu, 24 Mar 2022 06:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648130253; cv=none;
        d=google.com; s=arc-20160816;
        b=nnBx+bYYxCMTvAXI7NXVdBokha/wROs1OfjMmwxLZ5GVurjzSBZdWxXGK//QrW8FIU
         LDF/wz1S+Xi9RbXN/q9peTmSmT7Jrp3uAhWr4Zx4AWZki2gN2EYKYZtiwkOZa2WLj/9v
         Ify/zOqEVhvuOq30FIhPe3Q0vp5ge+mVuM18UB2Ar3r2soAN1JdOa+CTurxeJJW01S3p
         v+b2lQhNH6Ec55WYp3OR2GrU5gq0OZCzqehsbpmE1SkbY19rxtoVGRLuoXC0bQXHjgo3
         8B+GB5yAvBBb2LetKTCqwU6Hy/n/VzuYlIi/UgsdIg4alhtQbz8fq+NnSvRMW5IP+SPS
         5/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=hD1UWFv2n8AN3K87gQow6N2L+y3V3Dp8kUN5v4HwRsE=;
        b=ykNYYtbhntaWyeWFHukhckA/s2znHjG6OfMwD9s+qEbO6tyTYU9QDEDLZhOlrjGVTI
         VK1meOn240LaExdt9KFKAKzm6Up9WNqEIw/azAMQRVbg+ooYENYmtYKD2RRiu4Q1i5NK
         wN7ezmGmRXA4AO3kw6IBXMHA25jmHX4k7cWBAodup32sb+W2ooopQlBA2jojorgUz00L
         ZNUKmq9SWnIFGggb6L/maVMJ9jXFAfVRGylGiuhhQMFndh8LONNiUM6Bp4tZqyh4JW2+
         /khBFQdZvQlgxVGdCZGUb16lDDhGiDGNG9QhJ4rECMtPEd+zXbCN8UKzy8hJqXYwFC1O
         +AtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020ac81097000000b002e1fbf3c05esi5240991qtj.591.2022.03.24.06.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 06:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXNy0-0004Sq-Ht
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 09:57:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nXNpL-0005oG-Le
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 09:48:35 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:53999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nXNpJ-0007jc-Eh
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 09:48:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B661620C3C;
 Thu, 24 Mar 2022 13:48:22 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 24 Mar
 2022 14:48:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002408dcf82-5571-4cbd-ac50-bbae085143f8,
 8921D6D4056377124FF518EF6C5C68266D051705) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.195.214.108
Message-ID: <71a8086b-882e-58ee-ce34-363eb8fffb54@kaod.org>
Date: Thu, 24 Mar 2022 14:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 2/2] aspeed: Add I2C buses to AST1030 model
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <leetroy@gmail.com>
References: <20220324100439.478317-1-troy_lee@aspeedtech.com>
 <20220324100439.478317-3-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220324100439.478317-3-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 59aaf7e6-a316-445d-8de6-2c322860a898
X-Ovh-Tracer-Id: 8549520945358277423
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dv6KhgzNHl6+

On 3/24/22 11:04, Troy Lee wrote:
> Instanitate the I2C buses in AST1030 model and create two slave device
> for ast1030-evb.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast1030.c | 17 +++++++++++++++++
>   hw/arm/aspeed_minibmc.c | 13 +++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast1030.c b/hw/arm/aspeed_ast1030.c
> index fe700d922f..c16bcba7c9 100644
> --- a/hw/arm/aspeed_ast1030.c
> +++ b/hw/arm/aspeed_ast1030.c
> @@ -92,6 +92,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>       object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
>       object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
>   
> +    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
> +    object_initialize_child(obj, "i2c", &s->i2c, typename);
> +
>       snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>       object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>   
> @@ -163,6 +166,20 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
>   
> +    /* I2C */
> +    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
> +    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                                        sc->irqmap[ASPEED_DEV_I2C] + i);
> +        /* The AST2600 I2C controller has one IRQ per bus. */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
> +    }
> +
>       /* LPC */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>           return;
> diff --git a/hw/arm/aspeed_minibmc.c b/hw/arm/aspeed_minibmc.c
> index 6a29475919..764df92f65 100644
> --- a/hw/arm/aspeed_minibmc.c
> +++ b/hw/arm/aspeed_minibmc.c
> @@ -37,6 +37,18 @@ struct AspeedMiniBmcMachineState {
>   /* Main SYSCLK frequency in Hz (200MHz) */
>   #define SYSCLK_FRQ 200000000ULL
>   
> +static void ast1030_evb_i2c_init(AspeedMiniBmcMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /* U10 24C08 connects to SDA/SCL Groupt 1 by default */
> +    uint8_t *eeprom_buf = g_malloc0(32 * 1024);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50, eeprom_buf);
> +
> +    /* U11 LM75 connects to SDA/SCL Group 2 by default */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4d);
> +}
> +
>   static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>                                                             void *data)
>   {
> @@ -47,6 +59,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       amc->soc_name = "ast1030-a1";
>       amc->hw_strap1 = 0;
>       amc->hw_strap2 = 0;
> +    amc->i2c_init = ast1030_evb_i2c_init;
>       mc->default_ram_size = 0;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
>       amc->fmc_model = "sst25vf032b";

