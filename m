Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3239537wrh;
        Mon, 6 May 2019 22:46:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnb3i2uOr/vqZTxInxY8FJRUc8dUSko3MoTRQdcjmlGwDV9I5U3zQiK3pun4VM6Xc55HdO
X-Received: by 2002:adf:f548:: with SMTP id j8mr3646006wrp.171.1557207990968;
        Mon, 06 May 2019 22:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557207990; cv=none;
        d=google.com; s=arc-20160816;
        b=gVAMLzZQ7Jp/iDOyel4lf1YR/vNSxCmdOL5VCzlN5ACZp9uTwQ5eohcwjqjac6htbo
         OT+9c1jADEmbEqaUaXy7Y0cF07AOhCildOLRLrjsT0FWgusJJVyLFUsKYdfr+Q0OpBwj
         iyzc2999ig4Fx/0N5z20ljy8aSlidNt/YK2zxFQ3oVjoe50yeKuUOGzCeOdXl/AaF+k+
         gKtlWUYeTfxKj4MZYwkLEI34kgPvKt2NTDIIl/NOvQx8Fj4BhutjHCqrod0V81nzr1Nc
         e2/I0dA1BJovdl5eaSL09kNZloAx3yPils4LZZI8aca1Tld+7t6gNvRC5cRSR7fCF5Ka
         pv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=X6FuCssFlQh7pMhHf4MFiyuPR7kYecNTo54TamMBiUc=;
        b=uvsZyuKaoWPnypQUC/PYDJHHsyfwnSAt4HMR3M9/sf20ec0GNFmM/faILfwWjRSc2D
         4eWSrEqwsf3TIdN7HJEYCmjpaFAayUFNqiGes3CZjaaDArojW70E8T3lDQMowwSQlkcJ
         nhHIxIj1YxrsiRpPu3l8FCjClA2bqo80oZi/vYsM+zhc9YPPYEcAWvHr5RrpnVoIOo+q
         b5sh+7Kj90xCCuVW+fBLVrEDllyYmGQO1VcjWaDR9G52cId2JY2EiB8BHwMtJnpqbsU0
         HQH8iG1uofawLa1H94iO9sqcADO4lb/lRV5UmVT4uSTPrX+HN1Y9rpo3nxwlkCh1X6m7
         L+vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si8356849wma.141.2019.05.06.22.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 22:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNsvu-0001SP-0K
	for alex.bennee@linaro.org; Tue, 07 May 2019 01:46:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNsvb-0001H7-Gj
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNsva-0003y9-6m
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:46:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNsva-0003xh-0O
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:46:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id l2so20386806wrb.9
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 22:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X6FuCssFlQh7pMhHf4MFiyuPR7kYecNTo54TamMBiUc=;
	b=R5g2QtnUgVCIbpS57DSOI1h5E1AOWHVqbvHYf+geaygAqE24Ug0vYgxePbf4fOs/Il
	YEKpGGGcCqlcJxDvAKX6wjDmQqDbRlbezt/EWNjy/5GL0SIgn1vUB6IU2dwcNbLcJ5Pr
	Ld09wNIH8X8J07Fvp17OcsHl2xzYYasWULrND2d9n610Fka+5dIjWDyx6SejRV4eFl1l
	/4TCF95EBdEiZsJgwb89IovOg6e8xwzTrjBet0pe0JBKNgHBvbAnRkhHRyhXaLnTC2dC
	kq2u5vhExZydaUZM7EuNlIvqAwwGw0Dj8F2oooRntuBeifD0KLfi+spS4SV5KzGJsAN2
	IfPg==
X-Gm-Message-State: APjAAAUV1ofDe1O/WUhzIUTlsZ7aUFF4eyhinb1+7Ykuf4ymclqI/IhF
	RHXUlfkvtJKGILJckaZgSEtrTw==
X-Received: by 2002:adf:eb0e:: with SMTP id s14mr11463465wrn.158.1557207968991;
	Mon, 06 May 2019 22:46:08 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	z7sm16255682wme.26.2019.05.06.22.46.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 22:46:08 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4f7131a7-9099-f506-035f-abc584bf56b0@redhat.com>
Date: Tue, 7 May 2019 07:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506142042.28096-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] aspeed: use
 sysbus_init_child_obj() to initialize children
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
X-TUID: PE/pmqg8Bmuw

Hi Cédric,

On 5/6/19 4:20 PM, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_soc.c | 50 ++++++++++++++++++---------------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index bd83618ceba9..4b705afd096a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -172,12 +172,11 @@ static void aspeed_soc_init(Object *obj)
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      int i;
>  
> -    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", OBJECT(&s->cpu), sizeof(s->cpu),
> +                            sc->info->cpu_type, &error_abort, NULL);
>  
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
> -    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
> +                          TYPE_ASPEED_SCU);

A similar patch (although better described IMO) was posted here:
https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05931.html

However you improved it by using sysbus_init_child_obj(). If you don't
mind I'll respin addressing Markus comment and using your improvement.

>      qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
>                           sc->info->silicon_rev);
>      object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
> @@ -187,36 +186,29 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                "hw-prot-key", &error_abort);
>  
> -    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
> -    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
> +                          TYPE_ASPEED_VIC);
>  
> -    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
> -    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), NULL);
> +    sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
> +                          sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
>      object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
>                                     OBJECT(&s->scu), &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
>  
> -    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> -    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
> +                          TYPE_ASPEED_I2C);
>  
> -    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
> -    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
> +                          sc->info->fmc_typename);
>      object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
>                                &error_abort);
>  
>      for (i = 0; i < sc->info->spis_num; i++) {
> -        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> -                          sc->info->spi_typename[i]);
> -        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NULL);
> -        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
> +                              sizeof(s->spi[i]), sc->info->spi_typename[i]);
>      }
>  
> -    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
> -    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
> +                          TYPE_ASPEED_SDMC);
>      qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
>                           sc->info->silicon_rev);
>      object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
> @@ -225,16 +217,14 @@ static void aspeed_soc_init(Object *obj)
>                                "max-ram-size", &error_abort);
>  
>      for (i = 0; i < sc->info->wdts_num; i++) {
> -        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
> -        object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NULL);
> -        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
> +                              sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
>          qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
>                                      sc->info->silicon_rev);
>      }
>  
> -    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
> -    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
> +                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> 
