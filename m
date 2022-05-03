Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1184325lfj;
        Mon, 2 May 2022 22:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj8kSUXvPOxDCdPLOmrUrgfwER+bIWXbGDDgutz+hpPFes8NxjxR0drcst6oHokf/PSqac
X-Received: by 2002:a0c:aad7:0:b0:45a:9960:6097 with SMTP id g23-20020a0caad7000000b0045a99606097mr3666235qvb.55.1651554988242;
        Mon, 02 May 2022 22:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651554988; cv=none;
        d=google.com; s=arc-20160816;
        b=GtF3Y0vgEqzJqP65s56CW3wcg2UcnVDcI1GDemPN7sDBIv0Co8sNMuCMU+qwx+hT76
         YceHIMsnQklro6TkFSL98AOkqhVTiePoJsvgcvcrfsLx7kKAoSRE4zXwcSH9mOFMFy6S
         U3Yz+qrWe7ap19UoJxB2wQG1wQMTSEpexgz8At+fwyjmUkhp5D4RnPph/22IlTec4F69
         9+PV9ovuGW8H0Jnzipw5v45Lw5KYmegJEdCjEMX3yaucESzVFwfbYC3let05x38+rsdP
         ROHOxDJ90snkakrLuXEqFI4ij4jI83RDOwNEdapvYGiM0eIPWDgrVDULHPOyjk3rmpt/
         mumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Q4PC9NhdUh0VxEw9aYjai0xr5DAjwPv4Y1U9KsdgoXw=;
        b=GY/2s723QX5khpX+ttC5t911q3nfM+wxUzpHzHkhbBIqbCo1+iODLwqpUTEa2eIs0D
         cRd0WFF4YbFK9W9lE5W9cbq2uklToWPutbk2dnZXygA0PeXqZVZcqOmKfJZF6WdCB7ZN
         xbPl0OScoaLBLmCDBRmw+NZx8YaUZpsT6Jv9xqEjoMJRjiAksF0MQn1/CGm0144wyZVM
         OdYURUywskvBGLpcvnD6KPBxUGq6yrMoKvwcHPGUHI6habIDGnhxR1LNLfkMvuXaB9Wz
         5v4JYEXnK0/SeF1G8L7aG1B0hfsqUuA6OvsYJQS0B/4wv2h1RkMQFpVtX9rdwlDuw7yR
         QBww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj21-20020a05620a191500b0069fd6fc4dafsi2573076qkb.268.2022.05.02.22.16.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 22:16:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlktf-00007H-OI
	for alex.bennee@linaro.org; Tue, 03 May 2022 01:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlktA-00006c-ML
 for qemu-arm@nongnu.org; Tue, 03 May 2022 01:15:57 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlkt8-0002uJ-Km
 for qemu-arm@nongnu.org; Tue, 03 May 2022 01:15:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 76002221D0;
 Tue,  3 May 2022 05:15:49 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 3 May 2022
 07:15:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00488da3245-bafb-449b-9c51-5400d44e45cd,
 F6B89E566DA044E9E2FB2CFEBB669705F2CEA7ED) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <64846418-93b8-0122-191d-67b301906d63@kaod.org>
Date: Tue, 3 May 2022 07:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/1] aspeed/hace: Support AST1030 HACE
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
References: <20220503022710.4119-1-steven_lee@aspeedtech.com>
 <20220503022710.4119-2-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220503022710.4119-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3c596954-b7bf-41bd-83b1-58439df6ba14
X-Ovh-Tracer-Id: 13439867189573946220
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: sPVQMrCXKvjG

On 5/3/22 04:27, Steven Lee wrote:
> Per ast1030_v7.pdf, AST1030 HACE engine is identical to AST2600's HACE
> engine.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>   hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
>   include/hw/misc/aspeed_hace.h |  2 ++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..91f3c0b208 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -378,11 +378,31 @@ static const TypeInfo aspeed_ast2600_hace_info = {
>       .class_init = aspeed_ast2600_hace_class_init,
>   };
>   
> +static void aspeed_ast1030_hace_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
> +
> +    dc->desc = "AST1030 Hash and Crypto Engine";
> +
> +    ahc->src_mask = 0x7FFFFFFF;
> +    ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->key_mask = 0x7FFFFFF8;
> +    ahc->hash_mask = 0x00147FFF;
> +}
> +
> +static const TypeInfo aspeed_ast1030_hace_info = {
> +    .name = TYPE_ASPEED_AST1030_HACE,
> +    .parent = TYPE_ASPEED_HACE,
> +    .class_init = aspeed_ast1030_hace_class_init,
> +};
> +
>   static void aspeed_hace_register_types(void)
>   {
>       type_register_static(&aspeed_ast2400_hace_info);
>       type_register_static(&aspeed_ast2500_hace_info);
>       type_register_static(&aspeed_ast2600_hace_info);
> +    type_register_static(&aspeed_ast1030_hace_info);
>       type_register_static(&aspeed_hace_info);
>   }
>   
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..e9d3563a05 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -15,6 +15,8 @@
>   #define TYPE_ASPEED_AST2400_HACE TYPE_ASPEED_HACE "-ast2400"
>   #define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
>   #define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
> +#define TYPE_ASPEED_AST1030_HACE TYPE_ASPEED_HACE "-ast1030"
> +
>   OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
>   
>   #define ASPEED_HACE_NR_REGS (0x64 >> 2)

