Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp399332ejc;
        Thu, 31 Aug 2023 22:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSOTlE0IIXA4i5JDLdJVBPkDOTBvRNAyQ1TcmxkhhK0rVhhW4IUCm1ai9C5c2WDdmhvEV0
X-Received: by 2002:a05:620a:2ae2:b0:76e:eeaa:a06e with SMTP id bn34-20020a05620a2ae200b0076eeeaaa06emr1506734qkb.4.1693547304391;
        Thu, 31 Aug 2023 22:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693547304; cv=none;
        d=google.com; s=arc-20160816;
        b=G8SUM2DDh1dkiEIJcey5emfWjXQ5IYkUdxZNvdt3Bnc/Zb+bj7pHk3Qd7o3cJbB1Hy
         1jI8vbrH+x/KlB289ae3bEFvDKIkGCGAX4H4qNZRl9CwuJxajry3yJ0qvDvDMBXsKxMS
         bHX6xJIyY3CzjConIekepyWN+Exl9flZ6iLe5Ie0BVf43/QdSaeAOZ9V7/8/G88sBiiW
         N1Vp4E25NzV64kzs+chaEr16Fc6YEcayL/Fvt0bmJGvaIraDQQKkJHVoGyWjiMFaPdH3
         nmY0Ly999eU/1auLcjHgAztwBMlsI1vNmZGUqMjzqs5YeZy7o7VG59MJ5lYvf/iYAxF/
         27Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=E9S/E1ua5eV96VCLZpB/sNQiyiuE2zf1KB5S2Eo1Bkg=;
        fh=XiugZQNHH8lLH3DLyA57Kf61M0pD0zPaPvlVBeWSJic=;
        b=RBgruTWsZ7M1D87tGIXPX1N4Z2ceROXsq+ohwptcsCHRN0wzUABvKrJ9zzIQwufu+7
         DwhXqsE8MX++eesDQ4O0Z+f39W7tcdsZbQZGhDO5ozFTWmceoz+uH7L4SpbghwvFoAlg
         ybpqP5CumuboC2woojDhPyQOrsHHweo4Z2Gf9sUgkmQmieruChc/xwkl9xFdaNfNSJj6
         mILm/4Mz0y6QHfwNMaFewOG+KyPnYwWUR8gvNm+unhjoSXGT/IBh8iImUy/lUG4urQ4W
         4y5UxkWveWsNmS7wMDQjdISWDe6nvh8AwKzFvUQX/aPwYI5RVVgOutzfBIkS4vpxtj2s
         KCMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp19-20020a05620a459300b0076f1024f25asi2095537qkb.448.2023.08.31.22.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 22:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbx10-00087H-5N; Fri, 01 Sep 2023 01:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qbx0v-00086j-PF; Fri, 01 Sep 2023 01:48:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qbx0t-0001XI-2i; Fri, 01 Sep 2023 01:48:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcRrx3MFZz4wy6;
 Fri,  1 Sep 2023 15:48:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcRrt3dMMz4wb0;
 Fri,  1 Sep 2023 15:47:58 +1000 (AEST)
Message-ID: <4dcdcdb4-6b1e-9141-c23d-b8deda819b8c@kaod.org>
Date: Fri, 1 Sep 2023 07:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/11] hw/arm/aspeed: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-8-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230831225607.30829-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.478, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: joGr97XnBr9D

On 9/1/23 00:56, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>    hw/arm/aspeed_ast2600.c:391:18: error: declaration shadows a local variable [-Werror,-Wshadow]
>          qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
>                   ^
>    hw/arm/aspeed_ast2600.c:283:14: note: previous declaration is here
>      qemu_irq irq;
>               ^
>    hw/arm/aspeed_ast2600.c:416:18: error: declaration shadows a local variable [-Werror,-Wshadow]
>          qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>                   ^
>    hw/arm/aspeed_ast2600.c:283:14: note: previous declaration is here
>      qemu_irq irq;
>               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast2600.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a8b3a8065a..f54063445d 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -280,7 +280,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       AspeedSoCState *s = ASPEED_SOC(dev);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
> -    qemu_irq irq;
>       g_autofree char *sram_name = NULL;
>   
>       /* Default boot region (SPI memory or ROMs) */
> @@ -339,6 +338,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < sc->num_cpus; i++) {
>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
>           DeviceState  *d   = DEVICE(&s->cpu[i]);
> +        qemu_irq irq;
>   
>           irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
>           sysbus_connect_irq(sbd, i, irq);

