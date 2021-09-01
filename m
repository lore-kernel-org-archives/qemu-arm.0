Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp195649lfb;
        Tue, 31 Aug 2021 23:44:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym1XlxGT3ADQqP0VujwHU6PAAJsgtyEpHR1ZrxPXA6+I9yxZJgHCZe2X8KP/2nQshm3EFI
X-Received: by 2002:a02:85c2:: with SMTP id d60mr6428603jai.85.1630478699665;
        Tue, 31 Aug 2021 23:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630478699; cv=none;
        d=google.com; s=arc-20160816;
        b=KPW4G5B4ADNEHzNtJQktBG98zQRvY2Fb/bY17fuOJupiTaZMysuiErF9xxO96Cx5xV
         Tr8Oo82L6k3ADSuP5MkOLPyzqGXRuwdQjUDRAbs4tUBkekmL03o3crMJPa6Uug+fYfRc
         GnYx+51PmXJMeGdQK/BnigBaxzjQT0nybfXHYvHkaHdI+jK3c2B377N2R2Elj5iWSoF8
         WK8CosMzO/vaMIZpTtDue1AWU7+ghyLmlXqyhr/ZfXWDTnW9Qnu6SyerjunptZZ8Ow8/
         66fRx8crF6kIOm26+WTyY8dRbve1EjaJ44avYyGZHbypaB+PlOeJlBNWSdP7K32XvHlD
         V4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZYMERLIBClZ7NLkWmT5hP1D7lCDH514JK77KaJwoUVM=;
        b=W0OmpKKcXBuHI1sYnx8g4sVS2bw6OgyStqxfHM4rLbL/h+KaPv21BngVi2TOO8GfGX
         bidft+gUPEJqbV1K4QB6iz8SbHvOomOibVQRmvz4QwVB3BW+ryOqUc6p/yDQCl0umaf/
         HC+vI6pXrlkC6B1tz4glzFcZEfI4wr3Q7+QlWKkYPh01a/DmKD8bpK+He5N/4o40pdVC
         TXuvLdGaNj25EUVe7iCI/TMqUzXy7JwuEP6t9HZ8dquWvA82/0oEWL0Hb5cr8bdUlHz1
         iXOtS+KVcD2AYBn1BUDFho1sjZyI+51dSDiKzL64KBKvdackpLSw1Yn4xA5HR8tNOrAM
         kHvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si21033245iow.12.2021.08.31.23.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 23:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLJzX-0004yu-0r
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 02:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLJzN-0004xi-7X
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 02:44:49 -0400
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:53550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLJzK-00011Y-Ti
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 02:44:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 0AD9D294B8C;
 Wed,  1 Sep 2021 08:44:42 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 08:44:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b2900c0a-3fc1-4ad3-a5f9-9fe606980e89,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
To: <pdel@fb.com>
References: <20210831233140.2659116-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <af023c9a-8ec5-27ec-9055-089969c88d1a@kaod.org>
Date: Wed, 1 Sep 2021 08:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831233140.2659116-1-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11fc943b-df1c-415b-b951-ed220c56ef06
X-Ovh-Tracer-Id: 2403233355025582956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgvdetkeduffeuvdelheektdetteelhedtvddtvefhteeuffejfeeltedvhefgheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, andrew@aj.id.au,
 qemu-devel@nongnu.org, f4bug@amsat.org, patrick@stwcx.xyz, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VDUFJ8QmxWhy

On 9/1/21 1:31 AM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This is a follow-up to a discussion in a previous series I sent:
> 
> https://lore.kernel.org/qemu-devel/20210827210417.4022054-1-pdel@fb.com/
> 
> I tried to add a new machine type called Fuji that required the ability
> to specify the UART connected to the first serial device on the command
> line (serial_hd(0)).
> 
> After some discussion, we concluded that we could add a serial_dev
> option to the machine class and the SoC to support this:
> 
> https://lore.kernel.org/qemu-devel/a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org/
> 
> I didn't follow Cedric's advice _exactly_, so let me know if you have
> suggestions. I used "uint32_t serial_hd0", because I think it more
> clearly indicates that this is the device to connect to the first serial
> device, serial_hd(0).

I don't have a strong opinion on the name but it is part of the user
API and can be set from the command line  : 

  -global driver=ast2600-a3,property=serial-hd0,value=5

I would prefer something like "uart-default" which makes more sense.

> Also, I didn't know how to transfer data from the machine class to the
> device state, so I just added the attribute to the machine class and
> used 'qdev_get_machine' to within aspeed_soc_realize() based on some
> code I found in hw/ppc/spapr_cpu_core.c. 

This is called from the reset execution path which is a bit special.
The use of qdev_get_machine() should be avoided when possible. 

> I expect that I'm missing
> something, I've just been having some trouble figuring out the QEMU
> object model.

Look at the "dram" property of the SoC.

Thanks,

C. 

> If this patch is accepted, I can follow-up with another patch adding the
> fuji machine type with "serial_hd0 = ASPEED_DEV_UART1".
> 
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>   hw/arm/aspeed: Allow machine to set serial_hd(0)
> 
>  hw/arm/aspeed.c         |  1 +
>  hw/arm/aspeed_ast2600.c | 11 +++++++----
>  hw/arm/aspeed_soc.c     |  9 ++++++---
>  include/hw/arm/aspeed.h |  1 +
>  4 files changed, 15 insertions(+), 7 deletions(-)
> 

