Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp897698lfl;
        Wed, 16 Feb 2022 01:06:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGzoS2D2L6uU/LZe4fNTQncNaMevHk9vA4/iiILEmOPq5ZmcqWriBvH+JQPUJ/ioQtz22O
X-Received: by 2002:a05:622a:20a:b0:2d1:59a3:b077 with SMTP id b10-20020a05622a020a00b002d159a3b077mr1239443qtx.665.1645002412442;
        Wed, 16 Feb 2022 01:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645002412; cv=none;
        d=google.com; s=arc-20160816;
        b=gOdEXpGS3KPU/TP1Y2gwQL4I80CT9dX7qhBRh4oNK87UWjsXLufEk5pt7Pq37PLwTI
         76Ec2Zb9wmQ0ek6c7cAuAz6QmeHS9gkb9xSro5J8RazCp10o9XgJqX0Mo9d7cmX7dh1+
         GlkvpxqfrmIBGhBCTp34oL8Zuj+np5aMZn4j7XGiAdlz11lx6sWeuVuEounQpMAOq2NQ
         2JKWEWX1XRDnWShZ+/YjkKgLU1SZ34z5U6Ry/k437BJ4ykKqTf0uo9pwYC2UrUPkC+l5
         l0hxQKUrteHMKtytkTcDE8IxEoMos3sh7HH1ORPxWtBWNUsbCJ6xoD/zD0V3CDeh3jAx
         TzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=6mgv00w6vmOaxA3JIXIMAQnc79sk/nwEp6parOYySPg=;
        b=M74tHBMHFC6lNpQd7Fi0EmrQtDnwQ6ObI59R/R3eJrmghBf55ReiIWk5hOlkrUr4T/
         c3k+qfoYc+g/DLLA6R63ulWQ6Iu/RGj0D3fZsgGnqU6MGQU0KithjjyRgVPjI4pn8wlT
         mkNlvLw9esj6GBOQ+utaadvc5wSHIo8xigKjzq0f8GKkEn67cUzZw8qVrCQlPmdU+1xg
         9Kj1MSYZiAiTlX3WenxLGnVA75uQgocTbSfAh//uIxacS0kU/ElY25hmKOkZiZRKzRa3
         MeLPvJgyn1CvsPY9TWvl3vSuA6p3StonitU5oXKyxcAxQtlaszUsww32MwBLBp9C9PYr
         536Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl42si8173075qkb.469.2022.02.16.01.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 01:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKGGx-0003BO-T7
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 04:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKFLj-0006vH-Qk
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 03:07:45 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:36525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKFLd-0000iZ-Rr
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 03:07:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 76F1A24B79;
 Wed, 16 Feb 2022 08:07:34 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 09:07:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00171a95591-d8fa-466f-b234-8262a42ee357,
 A1B2BD187F74F0B5B5C68C97B98B37E493FE0AD5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <142d4fb5-c33f-5902-0aec-a21af01c717c@kaod.org>
Date: Wed, 16 Feb 2022 09:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm: Remove swift-bmc machine
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20220216080354.65257-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220216080354.65257-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0f938586-c29d-4ed1-a3a3-b033c81606f0
X-Ovh-Tracer-Id: 12737587124430801827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeehgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hmnAmFiMOgcD

On 2/16/22 09:03, Joel Stanley wrote:
> It was scheduled for removal in 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Could you please send a v2 with an update of docs/about/deprecated.rst ?

With that,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   docs/system/arm/aspeed.rst |  1 -
>   hw/arm/aspeed.c            | 53 --------------------------------------
>   2 files changed, 54 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index d8b102fa0ad0..60ed94f18759 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -22,7 +22,6 @@ AST2500 SoC based machines :
>   - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
> -- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
>   - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
>   - ``g220a-bmc``            Bytedance G220A BMC
>   
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d911dc904fb3..9789a489047b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -544,35 +544,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
>   }
>   
> -static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> -{
> -    AspeedSoCState *soc = &bmc->soc;
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
> -    /* The swift board expects a pca9551 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
> -
> -    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
> -                     0x74);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
> -}
> -
>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> -
> -    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
> -    amc->soc_name  = "ast2500-a1";
> -    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;
> -    amc->fmc_model = "mx66l1g45g";
> -    amc->spi_model = "mx66l1g45g";
> -    amc->num_cs    = 2;
> -    amc->i2c_init  = swift_bmc_i2c_init;
> -    mc->default_ram_size       = 512 * MiB;
> -    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> -        aspeed_soc_num_cpus(amc->soc_name);
> -
> -    mc->deprecation_reason = "redundant system. Please use a similar "
> -        "OpenPOWER BMC, Witherspoon or Romulus.";
> -};
> -
>   static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1277,10 +1228,6 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("romulus-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_romulus_class_init,
> -    }, {
> -        .name          = MACHINE_TYPE_NAME("swift-bmc"),
> -        .parent        = TYPE_ASPEED_MACHINE,
> -        .class_init    = aspeed_machine_swift_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,

