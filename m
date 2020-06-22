Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2914485lfm;
        Sun, 21 Jun 2020 23:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWreDVOkoew993R7d5wY2EE2iWJpKXM0VHxrileGwk6FmZ+ojNrFChIfZDKd7IA2LNhhVh
X-Received: by 2002:a25:dcb:: with SMTP id 194mr27043905ybn.226.1592808615333;
        Sun, 21 Jun 2020 23:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592808615; cv=none;
        d=google.com; s=arc-20160816;
        b=Xl25tKgyamEZX5CfF7e0NTSdT33DWMha8xq36b0yiNc4JS0CZSwDgieQEnIpHsUKzt
         Uhszg7UzvUhahSrzVweqUL1CRo1s4KxGj0ufP8zpUIs3RLASNuiFy8IqN0nYSObtaSyh
         89saXOV0FtSP+d/eKBcc3I4HVsWeh2yBkk8Z5ctv1A/2LJTyhHBr4w5FPWxIc5cua3O0
         /JG4KUlhL1v53n3aUjWBhZ8ttqkI59XLTpJ8By30tkUeWSNTebw2QSEMJpghwPeoPdMu
         k7b91SYnhrlYyCNmiq4tjJSCeJhXXAHh5AlItVeN5w26A0lAfi6di80H4BQEr4MakPe7
         9YOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=9MM9A88IpFyhi06JReEsrFzMa8KWNGd2WpO68yfV42w=;
        b=WD4sKoP75u0t/O/ZYEKpt0MthJbNNuhkbxkU9V9cRcyJRi01G3i7pU1OO4lmHnKiuY
         3Xolpa6ntabERYASbfMlVVGmIYx+tqsEUZGx8+oet6sv4NIGnOkfGymnql1l7miY0uNB
         tGwfBL+XflbyuW7B1GEnXZhA3GTymicnmv0cgpPAB/N6S0CoaU+Wyowh8kIVdqcpOsdC
         LijeVMT9T7CKugiQf1jN8jABbUG8pVBC4jvB//DZgqGI6EfTdKGTP7mH8UmGceEvg/+R
         XLVTVSTTI2mfeGezbPVYphtiSQ4qwhGfL7+4w2kDE5XJmuRJBCOa24vr06xWw8ssoEts
         Wgzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s72si13127728ybi.447.2020.06.21.23.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 23:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnGHW-0002Gb-O7
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 02:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnGHO-0002GI-Dy
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:50:06 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:59766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnGHM-0002Ht-HX
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:50:06 -0400
Received: from player718.ha.ovh.net (unknown [10.108.35.240])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5703616E99B
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 08:50:02 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id A1702137FE343;
 Mon, 22 Jun 2020 06:49:54 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d4bac214-8a1f-4a5f-a845-aac5f99c9e56,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 6/8] hw/arm/aspeed: Describe each PCA9552 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-7-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <38918d0a-272f-c05c-6a03-c6ddd8cc592e@kaod.org>
Date: Mon, 22 Jun 2020 08:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6095903570880990123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkefhtedufeffvedvleejgeeghedvgeeuieeufeejueeltddugeduhedvveelgfehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedukedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.76.148; envelope-from=clg@kaod.org;
 helo=9.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:25:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpvEprFEogoa

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> We have 2 distinct PCA9552 devices. Set their description
> to distinguish them when looking at the trace events.

It's nice and usefull but couldn't we do the same with a QOM object name ? 

C. 

> 
> Description name taken from:
> https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/aspeed.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6b7533aeee..3d5dec4692 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -508,12 +508,15 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
>      uint8_t *eeprom_buf = g_malloc0(8 * 1024);
> +    DeviceState *dev;
>  
>      /* Bus 3: TODO bmp280@77 */
>      /* Bus 3: TODO max31785@52 */
>      /* Bus 3: TODO dps310@76 */
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9552,
> -                     0x60);
> +    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    qdev_prop_set_string(dev, "description", "pca1");
> +    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
> +                          &error_fatal);
>  
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
> @@ -528,8 +531,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  
>      smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
>                            eeprom_buf);
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA9552,
> -                     0x60);
> +    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    qdev_prop_set_string(dev, "description", "pca0");
> +    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11),
> +                          &error_fatal);
>      /* Bus 11: TODO ucd90160@64 */
>  }
>  
> 

