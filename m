Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1812570lfj;
        Mon, 16 May 2022 00:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGXnl8nbKcyGWrBkhckSBvMs00tTkjljuzTrUNyUCpxZu9sd0At47bmbof7uig+vHembuE
X-Received: by 2002:ad4:414a:0:b0:461:ce93:f10c with SMTP id z10-20020ad4414a000000b00461ce93f10cmr2904707qvp.73.1652685982119;
        Mon, 16 May 2022 00:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652685982; cv=none;
        d=google.com; s=arc-20160816;
        b=k6fjxPFlXO/NUm67m2QqZmJ5bSGVxwSwE0CXjtJTrGp5oUjDwE5WLVE9A8LV+dbVMT
         qnqfsE//ADUfv0dERdSYoI1++b9wemRhI5uMggikFTMBcd3nobo13AKCM4B6aMpYvwei
         y/QMiW7+O53B6+kTIXOLCpyqYS67nLdbiBu7Er8IEo8NWGfnuPL/tgSUnEQRRapIoiDs
         s9In6tGIvihpuJRcWm1HQ1lC07w2lyc0H7EzUGmWVo7ewP/b4zjnECw+nEJ1hh5i6frO
         NNoPLhaRBU/mwBaRBvIZXnKxv4Hy8fLNA+69poQmVtO8qPebDDoe6LlV/lXhAay8Zaj6
         o2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=gCMmlI5tmgfsEHjWHi4T8govnXe0hzQIfsXmGsQD1V8=;
        b=P+27ykHTU5xCVZnuEkMHMSy5Lbaw6f4CVEpHMZ7b84+uOlXREUOJ4/WufXhRSFnzbv
         cxdFXl8gOemcXzSrkf5X+07wGZoRrR/w8TQSfoEZ3+E3kwJkQYuLQXG/gnfvXTUbhY9d
         vnwqO+dwjtW+D3a489KfZbI0+d8ICngRC+2wk1ZJlZUyee2xUEgYDfzB7/HWV3Z2IuYn
         HVjA/bc14LNe9nns+Q4kK0uDyQARjU5EsP7HRo2GVyKB0mTbp20P5e/+x8D4O1IX2+lJ
         i81fW21ix7fnySc/55fIIgG54Qe3hL0xg+D67yGFGdfUAmE0F6kN3+cikhzm8V+DSnen
         yBXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf14-20020a0562140e8e00b0045a85fbf823si4925836qvb.176.2022.05.16.00.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 00:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqV7V-000720-FS
	for alex.bennee@linaro.org; Mon, 16 May 2022 03:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV1h-0003Io-St
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:20:30 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:56229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV1e-0007ts-JB
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:20:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 29F6710028D31;
 Mon, 16 May 2022 09:20:16 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:20:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00427e822b8-dea9-48e7-8b84-9bda22a61f38,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2f1490d3-6bc1-06a8-70d4-c233f9886927@kaod.org>
Date: Mon, 16 May 2022 09:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/5] hw: aspeed: Add uarts_num SoC attribute
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7c0fef0-3ad6-4ab7-b5d7-e4b7e99b230e
X-Ovh-Tracer-Id: 18099966906678414258
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DBG0B5ae3KGE

On 5/16/22 08:23, Peter Delevoryas wrote:
> AST2400 and AST2500 have 5 UART's, while the AST2600 and AST1030 have 13.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c     | 1 +
>   hw/arm/aspeed_ast2600.c     | 1 +
>   hw/arm/aspeed_soc.c         | 2 ++
>   include/hw/arm/aspeed_soc.h | 1 +
>   4 files changed, 5 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index fa2cc4406c..bb8177e86c 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -301,6 +301,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       sc->ehcis_num = 0;
>       sc->wdts_num = 4;
>       sc->macs_num = 1;
> +    sc->uarts_num = 13;
>       sc->irqmap = aspeed_soc_ast1030_irqmap;
>       sc->memmap = aspeed_soc_ast1030_memmap;
>       sc->num_cpus = 1;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f3ecc0f3b7..a9523074a0 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -588,6 +588,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 4;
>       sc->macs_num     = 4;
> +    sc->uarts_num    = 13;
>       sc->irqmap       = aspeed_soc_ast2600_irqmap;
>       sc->memmap       = aspeed_soc_ast2600_memmap;
>       sc->num_cpus     = 2;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 96bc060680..7008cd1af7 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -490,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 1;
>       sc->wdts_num     = 2;
>       sc->macs_num     = 2;
> +    sc->uarts_num    = 5;
>       sc->irqmap       = aspeed_soc_ast2400_irqmap;
>       sc->memmap       = aspeed_soc_ast2400_memmap;
>       sc->num_cpus     = 1;
> @@ -516,6 +517,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 3;
>       sc->macs_num     = 2;
> +    sc->uarts_num    = 5;
>       sc->irqmap       = aspeed_soc_ast2500_irqmap;
>       sc->memmap       = aspeed_soc_ast2500_memmap;
>       sc->num_cpus     = 1;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 709a78285b..669bc49855 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -91,6 +91,7 @@ struct AspeedSoCClass {
>       int ehcis_num;
>       int wdts_num;
>       int macs_num;
> +    int uarts_num;
>       const int *irqmap;
>       const hwaddr *memmap;
>       uint32_t num_cpus;

