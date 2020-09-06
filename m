Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2828983lfc;
        Sun, 6 Sep 2020 00:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn39gi0ZQaeHNIJh/mEaL3D91ZKIsr+ro52pfuZ+F01xiPMBNEBNo4l2GSoWp9C4b/K7TM
X-Received: by 2002:a25:3244:: with SMTP id y65mr19732909yby.81.1599377733853;
        Sun, 06 Sep 2020 00:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599377733; cv=none;
        d=google.com; s=arc-20160816;
        b=WGBasVIi3W2P35uvT8IdaDeGLRxwwGdhFyLVYbSDIO8omBmZa3w3ynk6J3rczvt876
         jhGigYyc/g47P4DYjrZC+0pAuxiJMuBm7A9CnXd6XITAwEpXhxUyQZGuMxklDsTjE6uw
         WnSCZWQ5K/SYZ1v0gEo+8sSYP6LVY0FTLmzZcFJ1khaUqwGmty7htGMd/MmRNawWywrf
         ZnqGSbc3N8c2dyfxTPHLdS5Raq0sn919fNqgq80aDs75DpMwCRha0FvphI59cDTttfjX
         66OhrPjy6c0FSfIw5oSrrSVB6Ib73F7DaRVxU3mja3z6nYLn85P8hkD9iYbuTO4yNaCA
         7NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=jsmswKONk0OSXxGpWrHnRCGDkJoqBrf3nC/NwI5gDzY=;
        b=zwmX7o/w8r4/y0UFOxN4Lcpt0KZEvVb3QOYL92CTVs3kj7Hghz+n0x+7m1V7ZytXwR
         BzvZflJ1Co5jOITZnu6K8QD5ylMA2jSWsnsaeug8aKQJHYaxZOKwIdgmS6tBoYIo8w0V
         Ea/fd3M/Ykwv/a2MFM5ZLbzqLyPkjB8zVfcDCfdFJU1XKkhU9ehq6rEW176pl/O4S8w8
         tiOBj+xtfUYlWoEZQ8koB5AoHD7lXg6RMsiwNP4XsCYlRwo2hWjanTxyC3KSHY/xa4Ut
         W/onwoZPPvXpS4lvNjGDfJj5YwIVzk2aTXTU0/GQnRbGhgacHYlyGDtyrfLNf5pY1s1p
         05OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p188si11956012ybg.28.2020.09.06.00.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Sep 2020 00:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEpD3-0002xp-83
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 03:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kEpCu-0002x9-Pj; Sun, 06 Sep 2020 03:35:24 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kEpCs-0001ER-Sm; Sun, 06 Sep 2020 03:35:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id A40665E6C1C1;
 Sun,  6 Sep 2020 09:35:10 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Sun, 6 Sep 2020
 09:35:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a7556670-9a2c-40a1-b5d5-b52daa0b74eb,
 F0DF53881C1DD6DF86E1DD74DB2F83E9981A8108) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/arm/aspeed: Map the UART5 device unconditionally
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200905212415.760452-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <728e4345-123a-ba17-2c07-e3c8dc847dd9@kaod.org>
Date: Sun, 6 Sep 2020 09:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200905212415.760452-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 262a8904-e070-41da-8cd0-7cb8076143fa
X-Ovh-Tracer-Id: 10461298984657324838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudegiedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 03:35:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dCXbcnMkXP8U

On 9/5/20 11:24 PM, Philippe Mathieu-Daudé wrote:
> The UART5 is present on the machine regardless there is a
> character device connected to it. Map it unconditionally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_ast2600.c | 8 +++-----
>  hw/arm/aspeed_soc.c     | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 9d95e421435..1450bde7cf2 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -325,11 +325,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* UART - attach an 8250 to the IO space as our UART5 */
> -    if (serial_hd(0)) {
> -        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
> -        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -    }
> +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> +                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>  
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 35be126db6f..7eefd54ac07 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -283,11 +283,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* UART - attach an 8250 to the IO space as our UART5 */
> -    if (serial_hd(0)) {
> -        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
> -        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -    }
> +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>  
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> 

