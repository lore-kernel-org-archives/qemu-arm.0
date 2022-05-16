Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1812622lfj;
        Mon, 16 May 2022 00:26:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKHAzTviVySOo9U0MQiPpScwrNnU0bYwiuyGdGjoLWcZPwH2JGEM6D4E+BY8RkU9rnrUNj
X-Received: by 2002:a05:6214:d0c:b0:45b:3c7:fd68 with SMTP id 12-20020a0562140d0c00b0045b03c7fd68mr14279676qvh.77.1652685991199;
        Mon, 16 May 2022 00:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652685991; cv=none;
        d=google.com; s=arc-20160816;
        b=Kgu8PNo53cLU27fuq1hxhnYkRhBjX8r8gxZkQxgD2mGnBUDNhVUnF8IcbMWSEXRO8l
         VhMLwpYD6NC32IPBjidLG6UYZVfKcWuE++TW/Fc1NAdvncW9cKeetm45LnshTiGK+h6j
         EhvgNEuXPj8cTDXzxL91poFLv01H/1O5CJ8L2DcYR0w46w4pUrmqpWsabVHDWMHIa4pY
         64sX9dTqFVlL4MRAkIMcCMu4RR6h7N2Hd67nkqTo2rcs7G9k4U3vDgNZL6LXGqzB9PZ4
         V6ow634vUSGK3nNfYptH2tFsAzbhB0eGRaLHq5EilUsE86O84gsppZ0EHoFo0iHQq+0h
         7n1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=zUmqs4uP8tfkbFW09geFxgDfMxwihbS26a2tyZlLhfc=;
        b=r464HvaxYRga6Xoghdj7XuJ9HTlwW3Hh6AfZLouauw4O1hvxHQQ0MvzAEBZ1qKleUh
         /Obqmtm2qoMw8T5Ax+rgKJdxyh/ubZpsRaRz1n9Ml4vYtCYCTO6kYalBzWBewC7p9fDm
         lXH1gCo7hHM11a4x64kmZhxpaqlbhfl3KRMkoqaB0GkOx3r1dStoAg4BLwtj7phidVr4
         KbrLcUMyzLNE5O2jgpiOjxeL3L2SynL7/4QArFMEjMcrhpdOJBWkb8NXYOgsQlzqsmBk
         pyBQW4KZ4GReQfV8QWnTbu6uixrOm+6cnuVanWzUxjp7pUPjvjinuZMo0GkOROTC1Ffj
         8bXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05622a14cd00b002f530da30c0si5756139qtx.388.2022.05.16.00.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 00:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqV7e-0008I8-LL
	for alex.bennee@linaro.org; Mon, 16 May 2022 03:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV24-0003P1-Td
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:20:46 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:33243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV21-0008H4-Hc
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:20:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5ECC321DA7;
 Mon, 16 May 2022 07:20:37 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:20:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001e18fa46d-3347-47f6-9108-8713955a4707,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a4bc0da6-cab0-c9c4-4171-51d5167b2b96@kaod.org>
Date: Mon, 16 May 2022 09:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] hw: aspeed: Ensure AST1030 respects uart-default
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-4-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-4-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b9b26e7f-ae49-43dc-bc86-caf57d9614fe
X-Ovh-Tracer-Id: 18105877877467483058
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kKCykO+I/aBl

On 5/16/22 08:23, Peter Delevoryas wrote:
> The AST1030 machine initialization was not respecting the Aspeed SoC
> property "uart-default", which specifies which UART should be connected to
> the first serial device, it was just always connecting UART5. This doesn't
> change any behavior, because the default value for "uart-default" is UART5,
> but it makes it possible to override this in new machine definitions using
> the AST1030.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index bb8177e86c..faafb800f3 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -215,9 +215,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
> -    /* UART5 - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> +    /* UART - attach an 8250 to the IO space as our UART */
> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +                   aspeed_soc_get_irq(s, s->uart_default),
>                      38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>   
>       /* Timer */

