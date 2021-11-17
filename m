Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp247831lfk;
        Tue, 16 Nov 2021 22:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6XLONOfdp5t+sGYFkASpAWLcUI1JFDxSA/8zn3obycBYIYLF0xiHpIw4Q1RhwCihFuaun
X-Received: by 2002:a05:6122:907:: with SMTP id j7mr85505539vka.12.1637131369024;
        Tue, 16 Nov 2021 22:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637131369; cv=none;
        d=google.com; s=arc-20160816;
        b=eE2BAb/PC8yEe9PRZZPIw7LdHA1RHIDX0QHN3jZruiCl4E1G43EnJgtAFA6vDjZxIU
         pLXVuKI8laXzNxgD91zznCv9ZejiLiVnaMVn4hTbV1x98reIk2NclfRw9DcDMxGbb3za
         y24rUlmUkXiJGG6PcJaHJJpeeAELObgcX4sD3PEgNyDGp867B2Go4XvlZdhAgG6jVEfn
         Qy/hXouiezHFN4KeLkTU1MeKGY5b0rcjdqBQ/nadVJrfSAzm8lz6GF+CJhdvcC/Eoxfo
         pUrTpv8Pll2zLdov9oFpbYNPu7AOpsCzPXCoEE+yHpqGlvvY1rrGYemS8+w494eXcnwU
         oesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=H5MG5x60YsSR87beT5GmtBGSQrZyF3TeAb1rRXtTS5M=;
        b=ArUs4N5tN/X5SXHrR8DMX9Lr/NjyrdVoFe5MJhq5eRSjY+RyVphukWuLCxf4JJBUiY
         AuZcA2Yph+TDk/+eYKFWxiOE3v+9Tr37qEwfrN7MT/YGn5Z+bew0I8KULwm6je2kT9GI
         +f6aWPi+2ESeJzQbDhLRl3hTII2XeIXXYfn8iAYcsYc5n4KHX/8sKq/sVRGmuoxL7OnT
         22iRvaxK1ieBOy31B45+HbyYU97S+aE8GEudyu6I0EQs2N4tccUz5nbLhni5PLUfDMTZ
         2pLicDiAnFfycYAg+Bl9YK7cjJZlSxeJpYXBLzxhPY4QAmnIsuC/jJThth9Fqu2bp486
         VFPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si36112639vsk.248.2021.11.16.22.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEed-0001fe-Km
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEdP-0001dH-DK
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 01:41:32 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEdH-0002oj-DB
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 01:41:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 215A521580;
 Wed, 17 Nov 2021 06:41:16 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 07:41:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00523028bcd-2238-433e-852b-fb187bf5174d,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad8687ad-31b4-a5aa-4133-252743321427@kaod.org>
Date: Wed, 17 Nov 2021 07:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [RESEND PATCH 1/3] docs: aspeed: Add new boards
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117010947.297540-1-joel@jms.id.au>
 <20211117010947.297540-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117010947.297540-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74f03db8-1c7c-4f2a-9332-b9cb95b1fba0
X-Ovh-Tracer-Id: 11820823125521107875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ivqCqj0Um8r

On 11/17/21 02:09, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   docs/system/arm/aspeed.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index cec87e3743d0..b091c0c61dec 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -14,6 +14,7 @@ AST2400 SoC based machines :
>   
>   - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
>   - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
> +- ``supermicrox11-bmc``    Supermicro X11 BMC
>   
>   AST2500 SoC based machines :
>   
> @@ -22,11 +23,14 @@ AST2500 SoC based machines :
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
>   - ``swift-bmc``            OpenPOWER Swift BMC POWER9

That reminds me that this board is scheduled for removal in 7.0

> +- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
> +- ``g220a-bmc``            Bytedance G220A BMC
>   
>   AST2600 SoC based machines :
>   
>   - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
> +- ``rainier-bmc``          IBM Rainier BMC

May be we should add POWER10 in the description ^

and we merged the Fuji BMC also.

Thanks,

C.

>   
>   Supported devices
>   -----------------
> 

