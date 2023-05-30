Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2241041ejb;
        Tue, 30 May 2023 08:04:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HYWn+9bU/i906bN+qfNmA2G0tt6mvdIL9cC4SC//eHOtygdq31dJ6pmWKipGx/wxMvguG
X-Received: by 2002:a05:620a:608c:b0:75b:23a1:8e4b with SMTP id dx12-20020a05620a608c00b0075b23a18e4bmr2341272qkb.28.1685459064336;
        Tue, 30 May 2023 08:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685459064; cv=none;
        d=google.com; s=arc-20160816;
        b=CegGQcQzjX45S/48+bJzdx/7sTSXytT3VMckwfKMMVIkLzuQAjmbMhoBRUJlilkE4u
         Pu8JDGVL9Ea8YiR20R5xHq72M6bBTQi5WtRywmVfSfq4YthstbUFmKJHSAn8/JqgE+zC
         cJ4z13FsKGGOAJ0er6nUpew6MlZdKUCMkr2ZAwxY7NVl7AorhkdUX973gTOFWsTLwKXE
         +N0hM9UxvOdBVsQiFZobZxjXSSIEP6OpS+G2xU53sW9YcqW0u61fwuKJoNobr/MMVS01
         OYZLkckbc0aOUug750kb1lBHLtQHPuODuBAjbf8g3diWy4p5rztvWJS7xCoNtIZWqSCl
         afMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=WoP1E5VEPm9vqCOBt5ygb40AQFy3ku8XZZ1WrOGn2co=;
        b=KyMhqmJ/m8YOJ6Au6svhJgg/WoqgWNv1Ku9Dm6PYR2I3n723ZbJUk2djschL0/ADHH
         92bf9B+YJXhUp7aAoYdYnjx1ShRJV+y8axfNZImvLP3bsNaqdr+PrY1XwPM/eZMJmgng
         PuICUNNYH0lw/GlBYp+/I1A5JIwm/of8Z+b1VSYjDH8z8qmYhOkI6PD41TY8hKD4FIje
         st4HyvZ9y6RiSLGSwiWxM+Urq2eKKszeBi4DKXYih5pbCYyqjIv5niBS9yC3jKoyFTTi
         yO6PUUnEEtLUXZeY2Qqci+muWcDFe0rBza/JWvLyHsPjhDynDIfe8SkO85KaVSu49RKh
         imMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a05620a144700b0075cceb751a3si4358844qkl.547.2023.05.30.08.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q40tQ-0004HR-TR; Tue, 30 May 2023 11:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q40tM-0004Fw-0d; Tue, 30 May 2023 11:04:08 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q40tJ-0003L6-Dy; Tue, 30 May 2023 11:04:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0629A2050C;
 Tue, 30 May 2023 15:03:53 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 30 May
 2023 17:03:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040e62ecc5-045a-410d-a1f4-c8df410d257a,
 1689548285A2663F4093CB2B261AE0EDF3FE8C9C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <185256e8-6eba-5bcd-d5b9-05b4b22d5ed2@kaod.org>
Date: Tue, 30 May 2023 17:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/12] aspeed: fixes and extensions
Content-Language: en-US
To: <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Alistair Francis
 <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: ad4f6944-ec7f-4c39-b09f-e37149f93d41
X-Ovh-Tracer-Id: 1177972779210345254
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uJ0DLAYIPVcg

Hello,

On 5/8/23 09:58, Cédric Le Goater wrote:
> Hello,
> 
> This series fixes issues spotted by Coverity and adds a couple of
> improvements for the machine definition.
> 
> The first is to offer the capability to define all CS of all SPI
> controllers without introducing new machine types, using a blockdev on
> the command line :
> 
>      -blockdev node-name=fmc0,driver=file,filename=./flash.img
>      -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0
> 
> instead of using drives which relies on the command line order.
> Ultimately, we will get rid of drive_get(IF_MTD, ...) but we are not
> there yet. For this, SSIPeripheral is extended with an "addr"
> property.
> 
> A second extension is the introduction of a "uart" machine option to
> let the user define the default UART device of the machine from the
> QEMU command line :
> 
>      -M ast2500-evb,uart=uart3
> 
> Last, a new "vfp-d32" CPU property is added to ARM CPUs to model FPUs
> implementing VFPv4 without NEON support and with 16 64-bit FPU
> registers (and not 32 registers). This is the case for the Cortex A7
> of the Aspeed AST2600 SoC. I hope I got it right this time.

I should include these changes in the next aspeed PR. I would have
preferred to have R-b tags on some of them, SSI for instance, and
also the last patch adding the "vfp-d32" CPU property.

Thanks,

C.

