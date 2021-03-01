Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3444644lfg;
        Mon, 1 Mar 2021 02:36:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykfoNov+GAcNLkNL6rf/DQsQiep2AWdaaRLVXUU4pTLExx/+9WxmND4xX6r6tgP4hnGJE3
X-Received: by 2002:a5d:89d9:: with SMTP id a25mr11903746iot.69.1614594969305;
        Mon, 01 Mar 2021 02:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614594969; cv=none;
        d=google.com; s=arc-20160816;
        b=rbON0zWiD7S1Cpyo74UeDtUSiHIeu+T/fYPjaJPcTMyvy3z7D9la5aiYAlGulPGczg
         bCyjMwHG9Zw/059V6ph2dnNjzYet+JcgQ1zMLhiji787hPHzfB6QTEQpVxZnUt50pz6M
         ggmRAPJSUgcNTGWy0EN+LxnS4gfs5bGxedHSPtQ06BDyqOEQRcSs0Bl6hSHS3lrGtJ5n
         ewckD6Ot6t3EztNPoQsk6VXyZ+KGZJ4SfmaFQgLUFg/52pO7Q/RY88jRbYTa4U1prRus
         zD4XN7ZGWjrxLEkkrgRYIn2t2r7EuAOxLCLY5zsuI6atMBYsXKDH2+3jWz7KCD9cgsZv
         p2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=/vHb+jPiEX7c7a5VhtLaJChq8bC8yy6lSIuGrQqA8sY=;
        b=JbVi2dARmjB8A/0f84Tpb8QYHoTMDBMZVdMm9jcvU/wJa7wktPkT1YaHKQpkOagTL6
         3YoG6AAL2v0gwQC55iW+R0nK0Qbg8F6/O3TD3KNSjBQQ+N3mDllYn5XpSnUUaur7yjJ/
         lT3WELM1IPl2uTDhRGo59HzhZaLGsHq4CkM3c+ZSI4ElNyOP1bMPP21SIxf9tmFf7kKg
         ySePZ459AlpHRhLNpXxp8YFcCa95GsmWhbRNLv2ib7Dm/DGv5sZPiI6PBf5iPkZYjpRg
         wEZokeGiM6a3mCXiUG939GrXph1leyt4g7+FJdchbbG9zMkDpwB4NEz6yMbWrrOUAXjs
         fKdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si3455089jam.115.2021.03.01.02.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 02:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGfuK-0005hq-Im
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 05:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGfu0-0005Vo-RW; Mon, 01 Mar 2021 05:35:48 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGfty-0002Mb-8W; Mon, 01 Mar 2021 05:35:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E008A8C0163A;
 Mon,  1 Mar 2021 11:35:43 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 11:35:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e48769fb-98f2-4e70-8903-9c4f63c21e21,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 3/5] hw/arm: ast2600: Correct the iBT interrupt ID
To: Andrew Jeffery <andrew@aj.id.au>, <qemu-arm@nongnu.org>
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-4-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <42e9d178-6ee6-c50f-8f54-332ad9a58aee@kaod.org>
Date: Mon, 1 Mar 2021 11:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-4-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a0108dda-2cd2-483e-a72c-428524cbd263
X-Ovh-Tracer-Id: 14086978162818386796
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ya1tP00uEeR+

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
> the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
> shared a single LPC IRQ.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 22fcb5b0edbe..2125a96ef317 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -98,7 +98,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_DEV_WDT]       = 24,
>      [ASPEED_DEV_PWM]       = 44,
>      [ASPEED_DEV_LPC]       = 35,
> -    [ASPEED_DEV_IBT]       = 35,    /* LPC */
> +    [ASPEED_DEV_IBT]       = 143,
>      [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
>      [ASPEED_DEV_ETH1]      = 2,
>      [ASPEED_DEV_ETH2]      = 3,
> 

