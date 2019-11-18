Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2536454lfq;
        Mon, 18 Nov 2019 00:02:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCPcwXpVmvT8lsoExqX8xaAhZ/fdNWBwwZ3LVKehhgT13rzrO0x+lvOqchAT/wGtOXfxoB
X-Received: by 2002:a17:906:25c5:: with SMTP id n5mr24283606ejb.126.1574064135258;
        Mon, 18 Nov 2019 00:02:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574064135; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFjnWDp4hdnJe2sCP0NZTRkoXMUEMaEhhJr9Jox30NGyIWlyYcoA5QfVOqs+xBqxVz
         74527mvwSnH8o+2gzH+SqGKd0TFLHxvSliXZQ4lmN1vOSd9PXYGMzIc8NtOiVr7l2SF+
         MqW/32xsG1telByzaCWxGpnATSfto8TwmnXo6JV9vRScNsapCQps1Apv3sjigaSbJENI
         2eU63sxImyce+eba28xMkRvDHwrtnAQUx1n9gyn+Fy0vwdHxl1KgiV/9PzsTxbK4K52Q
         6jygwr9id+IybZEY3RP3DGBSqmYTobkP2IcC4D/xBE/G358zV4PTvQEUrKS9ckXp7em9
         3trA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=XwMBv13XDcWJArbNz3Xk+A5UGlQJ9xSNh7ReuJBuOE8=;
        b=tej0DjW6DZWxa+JMfXz899yFi43BM1hhV7Y+Zndcnc3Bxus/kPb5Fu9hajZH4l9Ycb
         MzRGYfNkz2hUQMH5a0vW9+5kmAiTMrDbZYCTaYBZ5+nPRmFAKqFrP+7/iQq9DVcpGRiJ
         /ggMIHPIsXxGML4b6JjH5yNjbpCjrowKotxAjQjFnDXFTeXgc6h52bsWN/RoiWnJKHXv
         JGBn8Y0ZBya5rYXo+Zbcvo/xBl9sWybi0SEsYsTeRNC/sHiBL+5jc7N+O6cPhfu9GZNH
         H4OkPSAcDgRbEWRVlatTc7Ogql1ryRlBqPK0BxyN8fbvEpIhJnwmZzsFCFmlO9l8QfLM
         ZX7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si10825860ejw.30.2019.11.18.00.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 00:02:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWbzC-00080n-5y
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 03:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWbz2-0007zD-AG
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 03:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWbz1-0007MA-2A
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 03:02:04 -0500
Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]:53728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWbyz-0007Bf-Ar
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 03:02:02 -0500
Received: from player763.ha.ovh.net (unknown [10.108.35.215])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id AA80D25A4A6
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 09:01:53 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 1AF27C361097;
 Mon, 18 Nov 2019 08:01:44 +0000 (UTC)
Subject: Re: [QEMU-DEVEL][PATCH] gpio: fix memory leak in aspeed_gpio_init()
To: pannengyuan@huawei.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au
References: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6cfb4721-d2f7-6876-83a8-2e4bf82b8c84@kaod.org>
Date: Mon, 18 Nov 2019 09:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 5760385401363532776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeggedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejieefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.111.247
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
Cc: qemu-arm@nongnu.org, kenny.zhangjun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DcIRcjL3O9TF

On 18/11/2019 02:37, pannengyuan@huawei.com wrote:
> From: PanNengyuan <pannengyuan@huawei.com>
>=20
> Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>=20

I will add this patch the series I am building for 5.0.

Thanks,

C.

> ---
>  hw/gpio/aspeed_gpio.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 7acc5fa..41e11ea 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
>                                 pin_idx % GPIOS_PER_GROUP);
>          object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
>                              aspeed_gpio_set_pin, NULL, NULL, NULL);
> +        g_free(name);
>      }
>  }
> =20
>=20

