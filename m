Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1810770lfj;
        Mon, 16 May 2022 00:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7iwJybuhDUHX//RQ+GfTO4GpSDZCJAn0MCekgKuj8DDe799x9y1SNVcAZc5heIG6A27lV
X-Received: by 2002:a05:620a:2681:b0:67e:908f:b513 with SMTP id c1-20020a05620a268100b0067e908fb513mr11248292qkp.204.1652685678121;
        Mon, 16 May 2022 00:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652685678; cv=none;
        d=google.com; s=arc-20160816;
        b=OnUV27Luqtuj7FL9NeipM+G3w0JyVcUiRXtZ3K62ttL6AkyV4jQuXv/Xgclyz0cYgh
         AY1aQROemRPViZXuly4Y9yYLcPQnKZRBfbSMqDP2JAKVnYEvZnb842/HWkuDV22eqED+
         Cj5mVKa2NepA0Tzz1bTZlyXaQ9h81satVAWziFpZc2AiqaviWqCOzUJBojK0zmVUZDk6
         BivB4/LDUPPUSbv7FX7bhi5TH6zxFqea1lDdyeORmy3aGQIPedbzaBZO2Z0h34yh85tO
         F95K2t7J/7M/R5jsMvQjpwQmGCGXlUSB1/Zc5rQRy9VeT9ObZ7MRynBKGYwCe3KimNQ6
         VBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=pBp1f1O2gPFPVl1MOkW9hpy5rFfk+CTikJofvCKQ1bw=;
        b=kCD4cbT075DC1aLcF5z1L17Q9TU3fCh2Q94I7wusQxdFkY+9yTo/+ngx+Wsxv6xH+A
         oAvov6Kx7yJQdBNwOu9z3JWBdxx9pLNNI+X63HkpaXYTSXRYKQ2oZMys+AF4dmdS1t6V
         ixhsQLl1rDVD1II7bqN0tB03VZFQMB3u6fHNgCqzgZWsEEpuSRpVZ5m1TKUR/rZRng6Y
         /MLxNnbcqZQFgLzqlvNxgU6klDS4umAa/4hFl1TgnD2YHwVP1+FaVOYMEH8ZyGNBkC3X
         TvPbte8Az3g85lmYR8IFKVHxHSDQ2/GTeX7VRcCLzWQAqfxbzI1tdYZwkBQVe3M5fxR6
         7rEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i188-20020a3754c5000000b0069f453b6f70si5160144qkb.474.2022.05.16.00.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 00:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqV2a-0002s7-UH
	for alex.bennee@linaro.org; Mon, 16 May 2022 03:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV0H-0002XY-7W
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:18:53 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV0E-0007kj-MR
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:18:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BE80D10028BA5;
 Mon, 16 May 2022 09:18:47 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:18:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004414e1081-a4cc-42b5-a69a-8b30e13c60b0,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Date: Mon, 16 May 2022 09:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 094042a1-8b3c-4f36-9b88-f7553e5c10c3
X-Ovh-Tracer-Id: 18074915631893023666
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihedvvedtteeutdfgvedtudffveetueeiieefgfefkeehvdelhfeuvdfhjedthfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: i80DCe87EsnX

On 5/16/22 08:23, Peter Delevoryas wrote:
> v2:
> - Rebased on Cedric's irq proposal. [1]
> - Added "Introduce common UART init function" patch
> - Added "Add uarts_num SoC attribute" patch
> - Rewrote last commit's message for clarity

Looks good to me.

> I tried testing this by running acceptance tests, particularly the
> boot_linux_console.py file, but I had to disable the raspi2_initrd case.
> It's not related to my changes (A/B tested and it fails on upstream/master
> too), but thought I would mention that.>
> I also manually tested several machines:
> 
> AST2400: https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> AST2500: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fby3.mtd
> AST2600: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> 
> [1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@kaod.org/
I have quite a few images which I run manually. OpenBMC is providing
images, Aspeed also. Joel did a small tool for the IBM rainier :

   https://github.com/shenki/qemu-boot-test

Having an automated framework for Aspeed machines pulling images
from different places would be nice but we cannot put all under
QEMU.


I like the buildroot CI using the QEMU boards. See a pipeline example:

   https://gitlab.com/legoater/buildroot/-/pipelines/539559209

but that's buildroot only and integrating a custom uboot might be
difficult.

For my ppc needs, I did a quick-and-dirty non-regression test suite :

   https://github.com/legoater/qemu-ppc-boot


Anyway, I haven't found a solution nor spent much time on it but
I am interested !


C.




> 
> Peter Delevoryas (5):
>    hw: aspeed: Add missing UART's
>    hw: aspeed: Add uarts_num SoC attribute
>    hw: aspeed: Ensure AST1030 respects uart-default
>    hw: aspeed: Introduce common UART init function
>    hw: aspeed: Init all UART's with serial devices
> 
>   hw/arm/aspeed_ast10x0.c     | 32 +++++++++++++++++++++++++++-----
>   hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++++++-----
>   hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++++----
>   include/hw/arm/aspeed_soc.h | 10 ++++++++++
>   4 files changed, 88 insertions(+), 14 deletions(-)
> 

