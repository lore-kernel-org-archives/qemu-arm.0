Received: by 10.223.197.9 with SMTP id q9csp7460074wrf;
        Thu, 19 Oct 2017 20:00:28 -0700 (PDT)
X-Received: by 10.55.138.135 with SMTP id m129mr4712457qkd.214.1508468428857;
        Thu, 19 Oct 2017 20:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508468428; cv=none;
        d=google.com; s=arc-20160816;
        b=lNM8d2svJJpoSdaxIcjqFIJVcgLPdbMx+w6gkCSe/20Vbiwz3nwwmg9sqgn/hG3d2p
         oM0uZkCpbtLy7iATGv8JihIO0AqHyFcTlAs/C2Vn4G8qTrRnlGUmC+f6Mn3w3+zZh/NJ
         mlW4PErg6tCq2CQusS/3dwXOEasCOrMUrvZc5tiGUOqtHicItGUVG6Y8OIhsvyIlZn5f
         sAMOhLt6h1oi5/slBfgSeUsYCBNA/X26BfWfBdiIla/6znRIWE+WBtk3dq21pALbo3PU
         dU6w4bA9NocoEgO2HBt+EseFglMsnGepn+kPEgFnynuNYbYhMFYLPXBmFdMukLEWkB0S
         8JCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zyUyu4/YUNCKUuMOcgVQyPNRdUmK8NWx+g7Rg6xYqcQ=;
        b=bE6/0gsin0nU3E1djFQrlutOC0+BTdNrXn69a2TyjIBkulX24/nSGxxdn3DVZ0rkvB
         w2b3+T9ACpBtYt3F5unHshcFWSifuTJ9SrGJIAA69/Yl82p/3iLViygjVpY2JzYepDsC
         8CM5nHA8RpxFPsYwGtRHdZSd9XjihSLjSFu9Yn+qQSOCBlD0mnvviBvKnIP1Dbuiy9K2
         cz/KNNODeya6iV1cZfMc2wRy7lshoDp6fy56YqLzX90OfFX6va7gMav0HyHuRyZrJ1uP
         nlhk6rtQBNQHtOuBHYYEpG0y8Bb8FqTE6cyJWshXgd5fmvYuPTgaBTY6u+E0J7C0JCSj
         wBog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRVJ/RFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p63si141936qki.284.2017.10.19.20.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 20:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRVJ/RFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5NXu-00061l-Jr
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 23:00:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NXh-0005zf-DP
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NXe-00007E-Br
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:00:13 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:51160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NXV-0008KL-A4; Thu, 19 Oct 2017 23:00:01 -0400
Received: by mail-qk0-x241.google.com with SMTP id o187so12831434qke.7;
	Thu, 19 Oct 2017 20:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zyUyu4/YUNCKUuMOcgVQyPNRdUmK8NWx+g7Rg6xYqcQ=;
	b=hRVJ/RFGU6qPpIOzU1DDIABpN6+vWbj/kxAZQMihLiOkeqq9hBchrog+ggtjQutbc+
	QqzBgyU4ePDM4nInHV+Xwwr9zYSXtcnCwsc0K+JtlONgPRa8YRgIoOlP3CaDYY+47pMk
	iCRxlqC3QFyTMUmeNZs3IUfLIOOdgebN9R96XbuO+lEAhLnJrWFpER5Ueuxr/86iNRDr
	mG8IHZ3toWOXmJz7uouzaLO+RUZz4PBL/ueIb7PCtC15zG/ewyAENE4BwqH0mZjo1eF0
	c7HsKp5RNeRMRPWbS5WuJMI6oMStedRCpoqEMYHC1ltX4ynXeDaQBImL3xND7eXoqh6C
	y3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zyUyu4/YUNCKUuMOcgVQyPNRdUmK8NWx+g7Rg6xYqcQ=;
	b=o3+8DLYIs9MT7Yc4jUq8I58z4engdGQgL7Hm8hfsiySoOJIXOCfIXd5/judCnAIxUC
	RsElnBfOe6JSPOPfbrJoB6SoIlqKW9dl7hyLmD+KIgsQTgHr6Iu8kLL91AmHyxI92a74
	ZNLOR5Enhotf3/9CIfkAduw64ch7HYUIeAPU517ZdogPImdvQIyR+7T3KpDWAeRkoyYL
	L0D/zwoPu23DRHDxpMo1v2qr1tQUxAYwW+bxGAczwItJsVScsAK4SaA34Sf6kkq/Ra7x
	eVma03848Eg5/3hT6sba9vqomQNPIgM8sdKWxIUdAMvfGbUfds4EEjsRkdJh6inrjmX2
	Fmvw==
X-Gm-Message-State: AMCzsaWSXTcuPGFOTh9zve7w15NJl+RC5KdI+1HvSyYfWzoQdNdyJpVu
	V53ppe5daw5xB/LhJ32RANU=
X-Google-Smtp-Source: ABhQp+QMQHUYpS4ZiOv4QAcSsUs9f7JxPEf4QcKoP64bk3CQuzQFFF4o/RpvKN4VsEvZpaNXJoz2iA==
X-Received: by 10.55.139.70 with SMTP id n67mr4929722qkd.275.1508468400622;
	Thu, 19 Oct 2017 20:00:00 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u48sm5826469qtk.77.2017.10.19.19.59.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 20:00:00 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171019163546.2039-1-clg@kaod.org>
	<20171019163546.2039-9-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2348bd8d-3247-c0f8-8a75-59b9ea0b2732@amsat.org>
Date: Thu, 19 Oct 2017 23:59:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171019163546.2039-9-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v6 8/8] aspeed: add the pc9552 chips to the
 witherspoon machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOaLDdaaHezx

On 10/19/2017 01:35 PM, Cédric Le Goater wrote:
> The pca9552 LED blinkers on the Witherspoon machine are used for leds
> but also as GPIOs to control fans and GPUs.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index df7f266800ba..0e2a4fa62c26 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -397,6 +397,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>      AspeedSoCState *soc = &bmc->soc;
>      uint8_t *eeprom_buf = g_malloc0(8 * 1024);
>  
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552", 0x60);

TYPE_PCA9552 ?

> +
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
>  
> @@ -409,6 +411,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  
>      smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
>                            eeprom_buf);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552",

ditto

> +                     0x60);
>  }
>  
>  static void witherspoon_bmc_init(MachineState *machine)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
