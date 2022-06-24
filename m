Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp90187lft;
        Thu, 23 Jun 2022 23:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s680LjFlWxVBS5maoe7pUkVqEr4uXwgJH4OljyFrEcpS50AHxrDriFrslwHqj8Q1fedlWK
X-Received: by 2002:a0c:a902:0:b0:470:7411:a6e2 with SMTP id y2-20020a0ca902000000b004707411a6e2mr8479081qva.129.1656052620396;
        Thu, 23 Jun 2022 23:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656052620; cv=none;
        d=google.com; s=arc-20160816;
        b=gflLPe7Z+xp5Qb8QFusQtVjUkrzDklfTTGJ4VnXL70FIv/kJ2ZNrmQwkTA3eMHy9za
         OMEOemV82A+RynW07Il5eape9Rg7Ew4CHGdwODlds8k21lo4nKdaywX5xqk2AvMZ7CBs
         DRfJu0N2vJFfklrlSHcuKBrQdvOnhoWVOtaends7opUkiIjte+N1h9w9fXF+XAUGHfIA
         x1XvrUlLxJYzO+FNJjSYFzo2gsCbepyrKFl8O5xU1+BW64GZF1G1cM0Z8500q2dQkgME
         DhsvjESZMGQodt4eJHWX+hvIl26pWadxmu0qvRpuKRPK4kwgW+CviRducrYVCGK+E7JA
         6nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=rQDc5a5hpG51VoOMkg1lL/ls9CrR3KjCcpSPq2JOtYA=;
        b=dvIkuwks4HbjfVGHCypepgDw4HhEppo0X4hqrJlUuJemLU5yqSVVCXvuGnaebfr++z
         McmmY/0XNYRhEWoTavsO8QFCejotVN5vE8iyYsEntF1OBHVmKtBs+6iSpCr8QC0yVPYQ
         GsYt1vjWNvFJQBCcy2j167uDfIDkwIc6pw34iWmiM0633++kSNgfXlwlX5SCWBeLoq0i
         tlZt7NNa7pB336/7dAf3TURB1yMOcU9+kRn3XbRwhUVT8Top561Mj4h8aUBURtStHeoK
         Yu2ji0h/jNOquhO3mJsf8sa75YGQP85QCpmLM0uZlmz4edMvy7VfeSokfYrLF/d7kbsj
         vFJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a05620a137800b006a658fdc4basi1148863qkl.40.2022.06.23.23.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 23:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4cw7-0000nV-U4
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 02:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4cvv-0000nF-85
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:36:47 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:41963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4cvs-0002Ve-1e
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:36:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4430B26E5F;
 Fri, 24 Jun 2022 06:36:41 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:36:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0051b9e8ccf-034d-4f64-a4a2-c4100f9ad5a1,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
Date: Fri, 24 Jun 2022 08:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7bdad71-d9aa-4290-88a4-00f176ba925b
X-Ovh-Tracer-Id: 6591299531615931360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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
X-TUID: jXw0GYLNJSzI

On 6/24/22 02:36, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Please merge this patch with patch 2 in which the "memory" property
is defined.

Thanks,

C.


> ---
>   hw/arm/aspeed_ast2600.c | 2 ++
>   hw/arm/aspeed_soc.c     | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f70b17d3f9..f950fff070 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -294,6 +294,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>   
>           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>                                   &error_abort);
> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> +                                 OBJECT(get_system_memory()), &error_abort);
>   
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index f530028874..06e5629800 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -247,6 +247,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>   
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> +                                 OBJECT(get_system_memory()), &error_abort);
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
>           }

