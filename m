Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp327151ejb;
        Tue, 31 Jan 2023 23:50:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dzx856W1naj2/aGAmDDvL6o5fw7xpT11nUrlVZG5pE3AhBO+nMCh2YZzn0Rl2mlkE0qKL
X-Received: by 2002:ac8:7fd5:0:b0:3b9:b817:e9ae with SMTP id b21-20020ac87fd5000000b003b9b817e9aemr2751964qtk.5.1675237814733;
        Tue, 31 Jan 2023 23:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675237814; cv=none;
        d=google.com; s=arc-20160816;
        b=O/v95F/rAGUfjoRQw8p2YfGtQyiboZbXKuA8F4IklBc66o1/omKqmCecxqGinxCKiq
         iQVgCZRgrUtLWEAUuOKhGBKuZI8wiF3ZzoWfyk4gaRQtwACz/SHYRMwE9dqDgYVSZx70
         sJWU5Jgi+hVsmvjUgVpRkHj6n237r/z1QEPdaec/4pU6FDgn6L79gkQ3AtjS2bhCdASM
         ae/UwKWa40AdKpFHV9+XdyGgHToMYOOXbpHq7Nw7SM/QiVgSF792FW8931f/uRpx12p7
         7qkojz12sos2POU2jiBBKtd3RmcsWfNoyJlLvZNkGb7GR4H5C8z44qJlKZHTD2LdDRkG
         AZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=pyEEMjxBSwQNOLQlfUXjk6pIcfWdlku0q5Bqe8jDHd4=;
        b=e96nNEakJCnCO+m40vkX9iLlRcMkWXxDEvlA/eUGLeOH+1kzEvJfo3R1V2eD8fOi+F
         e9+M131Crqov+HrdgXBhQN71UnoKFgmwCvKysrz/PwZPuumNPZ1mO989QeQ9Vx4Is/2p
         +wxeKL1dEKH6tqV+4F2X/I+vh2ekdqCkZ2/kho1Tin5AcDszVBUM3yIeQTPW6Hu6HDWP
         t13ko9o4RGAkwCtAw+pfAwEnmXWIKUHHrynWMO1Pu1phHImLZ14r1wUmpi6Uq1bsaS/B
         jG353C62AdxojZTbJcII19KGJ9PX3L+CYKqy2FNtbb/KBdkKMuuLnj8dz64FWrDELLGZ
         wxug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac842c3000000b003b81d86242bsi6109023qtm.51.2023.01.31.23.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Jan 2023 23:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pN7sh-0003cg-Rn; Wed, 01 Feb 2023 02:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN7sf-0003bp-06
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 02:50:09 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN7sb-0008H0-U4
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 02:50:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 053CC2B265;
 Wed,  1 Feb 2023 07:50:00 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 1 Feb
 2023 08:50:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00660eca92e-0607-4b7d-9872-90aaeccc239e,
 F0C8195E27B16437EDCB3A2BE992E155E5E23C80) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f1f96a11-5b4d-1f9e-a832-8e07bb2cee56@kaod.org>
Date: Wed, 1 Feb 2023 08:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/25] aspeed: Add Supermicro X11 SPI machine type
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Guenter Roeck <linux@roeck-us.net>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-3-clg@kaod.org>
 <CACPK8XeSN90WZjpAiBqcQyOgJh+q=HTgFsw98Ywm7voGHY7ypw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XeSN90WZjpAiBqcQyOgJh+q=HTgFsw98Ywm7voGHY7ypw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e0867b6f-503d-4802-ba4b-787eabba1f66
X-Ovh-Tracer-Id: 1848727650116078374
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvddvgfejudegudfgteduueehjedugffftdefgeetffeivdfhvdduhffhheegleefnecuffhomhgrihhnpehsuhhpvghrmhhitghrohdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: af/xmntYUOer

On 2/1/23 06:39, Joel Stanley wrote:
> On Thu, 19 Jan 2023 at 12:36, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
>> the Supermicro documentation for X11 BMCs, and it does not match the
>> devicetree file in the Linux kernel.
> 
> I found this sentence confusing; AFAICT X11 doesn't name a specific
> motherboard. It appears to be a marketing term for a bunch of
> different things.
> 
>> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
>> while others use AST2500.
>>
>> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
> 
> How about supermicro-x11spi-bmc? It would match the product name:
> 
> https://www.supermicro.com/en/products/motherboard/X11SPi-TF
> 
> as well as the device tree filename.

Indeed,

         model = "X11SPI BMC";
         compatible = "supermicro,x11spi-bmc", "aspeed,ast2500";

I was the one who suggested the name. Let's change if Guenter agrees.

Thanks,

C.

