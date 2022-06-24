Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp100271lft;
        Fri, 24 Jun 2022 00:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8Lixha5bLRQe7MnZmDFftys4ySMA9o6kOdXgCMc8zZyHZELvy5Cc3kNunZUjxJ1ZpDY9J
X-Received: by 2002:a05:622a:196:b0:304:f0a4:fdcd with SMTP id s22-20020a05622a019600b00304f0a4fdcdmr11526926qtw.659.1656054100001;
        Fri, 24 Jun 2022 00:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656054099; cv=none;
        d=google.com; s=arc-20160816;
        b=kLfEwO2BYPlrw2vjV+vwSS0sUOxgmmJrv80fpgnO2NEYHAgFeSQ01DEqPsIT0aPo1R
         cdkGLgDc9ZkO/ahCmgOZmBdlitoBa7rHfwvThVWaFQs2DASr1GAh3IKsshxKXN4h4qWE
         EhMYtVIhdx1Ixjms+EvmbDv5vc3oXSGPwAWILKHXnR9oCc670ZhKrq5D6mTwSvJQK3X1
         D6zWwA90og2sIa5Eka4nPIQISH3Bw0DwP+zALOzDGIkPVzMCqzx1jvCI79fWLAb5Gwjo
         /VAQ8fRYBJ1nDcK0BWW9sCfUBv0DmFtyIM5ZXaglv8msmQjSS+75XkwSE2DUWO68YUi8
         iHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=uhBSxp+KRtvplXbFbO5ojdZDfA9qke+tRb963gqw0WA=;
        b=Z9z1gGWzSg+07/rVCkeqLbXVZyIAJQSZDXfpaRDNiQqtO+UscpAcGNP/l3T1gx2cEq
         FYWGH03kXrb9NR4Qq8tVJISlM3MPGAaXesEL6sDGThlZRvQKnKzmgGz2gV5GvRX6Zk6L
         zAeX3iYq6LMUtoDNpipBYf6bIPRWi+/TVoTJUjUiGAnrjHPSrgytUN4U3yYxwpQYKUxF
         cYz0T/GxmxSYJ1KqdOer0CGu8Yk5sOYkRbkUn0GurHb7gDf4k66Y5zd2t80nW+4Wc6Ng
         mzjEnzDyRSrdEtT085noCnfHBCrPGT+sP3kTV1NJv+PV1KGzWeIci07CxwlgWz9ji4k+
         Ctvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dp4-20020a05620a2b4400b006a7172b071fsi1134348qkb.360.2022.06.24.00.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 00:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4dJz-0006oi-Dz
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 03:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dHA-0004fq-7v
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:58:44 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:50813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dH8-0005dv-70
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:58:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3E3B922C90;
 Fri, 24 Jun 2022 06:58:40 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:58:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00336616ad2-4d5b-4094-8b87-098f94ce948f,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1dfd5c7e-d361-1aa2-55cd-1e881023bdbf@kaod.org>
Date: Fri, 24 Jun 2022 08:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/8] aspeed: Remove use of qemu_get_cpu
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-6-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-6-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 66a3b67b-6467-43cf-8756-71271182888c
X-Ovh-Tracer-Id: 6962565028102376416
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: xJpAf3OuRFux

On 6/24/22 02:36, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.

> ---
>   hw/arm/aspeed_ast2600.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 8693660271..0656c02889 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -322,7 +322,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < sc->num_cpus; i++) {
>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
> -        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
> +        DeviceState  *d   = DEVICE(&s->cpu[i]);
>   
>           irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
>           sysbus_connect_irq(sbd, i, irq);

