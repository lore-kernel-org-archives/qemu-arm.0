Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1001669wrs;
        Fri, 16 Aug 2019 09:22:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3qyRe00CmqXvYB3dhtI4/RyCEwvr9h2gTHrYaRDACAkf8vrfHWCf8Gqkkw+0FKI11wbtV
X-Received: by 2002:a37:881:: with SMTP id 123mr9495394qki.145.1565972527585;
        Fri, 16 Aug 2019 09:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565972527; cv=none;
        d=google.com; s=arc-20160816;
        b=Zmr+LC+79hM7ACYGG9UjCahvPprfDaTgDWjCrn+1mkUrEuWC9p6MkYQnbScHjWZqvl
         kuWaUE8slT98VtiDzNxuCF9m/KQEmWDaRKJ9+891rL7b/AfwfT38sK7MEHPvOUvXwtKz
         QfsDXhctvEe10xhTn4XLGOPQs5r1KG9jRRjCydqA5bRxEQbYOi4wazJLuSf3ChTCSUcn
         nzptpZfoejmoIrqxuwXUW1N4FR9E8kX6Z9rIVAiWZnC0Jaq8gPlnHYfAwDNv0f+/tkvm
         RuVnnFQL+mVtJzDN8STG07MxbFSCOdajrvyOm5T2lLjErrC8eE+ZS+j/3CWN5D9bk0AO
         hc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=55y1Y3LlxOcFd9xjBLfNutZe0HvFGiJZd+y1CUPzaf8=;
        b=RijQ+h8PkAHpjZFZBL+VNDG+DY2D4aWhgllEEG8cyVckiaaTBBOemwxEQboDLDa7NL
         PuXwfcePimlqO1Bsh8DJ98Ht0qpJV1ycM9oEjQfh4hSKeHc9cFrv3r1+P9WDWI8iYLXF
         U2egZe0bxhFpmy4xRqYrNR0k9sloBHfIf8tvFnY+3lBshf2g3gZodGX5Ra2+d0U3U6gH
         YJ1ls0wEx7tUhgceBbl7QCVuf8NdQ52cu/3gNIb6B2HWRSISSnjYyjWL8D/+pT/inAeI
         d8PNmF4Pul6fsY++23TNhUY2fGYC5tZDv3C5b4/aJrEqDk6vuxnlib4dQAf/1n6oIM5N
         xXHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si3951110qta.357.2019.08.16.09.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 09:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyezP-0005Kd-2e
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 12:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hyez4-0005JK-DT
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 12:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hyez3-0000aw-B1
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 12:21:46 -0400
Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72]:49941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hyez3-0000Xp-5i
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 12:21:45 -0400
Received: from player728.ha.ovh.net (unknown [10.108.42.168])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id D705A10804E
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 18:21:41 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id D4EDD8D05A76;
 Fri, 16 Aug 2019 16:21:34 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20190816073229.22787-1-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <120fa848-808f-b918-14f3-ab9d1f06532e@kaod.org>
Date: Fri, 16 Aug 2019 18:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816073229.22787-1-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15570351288807361525
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeffedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.37.72
Subject: Re: [Qemu-arm] [PATCH v4 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, aik@ozlabs.ru, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oQp8Ouy5+9oA

On 16/08/2019 09:32, Rashmica Gupta wrote:
> v5:
> - integrated AspeedGPIOController fields into AspeedGPIOClass
> - separated ast2600_3_6v and ast2600_1_8v into two classes

Rashmica,

This looks much nicer !  

Please take a look at branch aspeed-4.2 in which I have merged your
v5 and modified slightly the ast2600 part. 

  https://github.com/legoater/qemu/commit/02b3df3f1a380eec4df7c49e88fa7ba27f75a610

I introduced a gpio_1_8v controller with its specific MMIO and IRQ
definitions. Tell me what you think of it. The principal motivation
behind these adjustments is that I don't know yet how we are going 
to instantiate/realize the specific models of the AST2600 SoC. the 
GPIO 1.8v is one of these extra controllers. 

Thanks,

C.

> v4:
> - proper interupt handling thanks to Andrew
> - switch statements for reading and writing suggested by Peter
> - some small cleanups suggested by Alexey
> 
> v3:
> - didn't have each gpio set up as an irq 
> - now can't access set AC on ast2400 (only exists on ast2500)
> - added ast2600 implementation (patch 3)
> - renamed a couple of variables for clarity
> 
> v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
> read/write to minimise confusion with a 'set' of registers.
> 
> Rashmica Gupta (3):
>   hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
>   aspeed: add a GPIO controller to the SoC
>   hw/gpio: Add in AST2600 specific implementation
> 
>  include/hw/arm/aspeed_soc.h   |    3 +
>  include/hw/gpio/aspeed_gpio.h |  100 ++++
>  hw/arm/aspeed_soc.c           |   17 +
>  hw/gpio/aspeed_gpio.c         | 1006 +++++++++++++++++++++++++++++++++
>  hw/gpio/Makefile.objs         |    1 +
>  5 files changed, 1127 insertions(+)
>  create mode 100644 include/hw/gpio/aspeed_gpio.h
>  create mode 100644 hw/gpio/aspeed_gpio.c
> 

