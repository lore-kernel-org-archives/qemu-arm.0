Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp671560lfb;
        Mon, 21 Mar 2022 03:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPLRNJ8cOYL7EJol+hN6tIjIlIepttmQyiEXVzB9/Fk2iQ05Nznt2Umz9uUqeKkOLdQQDy
X-Received: by 2002:a05:622a:1343:b0:2e2:ec4:b94a with SMTP id w3-20020a05622a134300b002e20ec4b94amr5223588qtk.415.1647860148873;
        Mon, 21 Mar 2022 03:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647860148; cv=none;
        d=google.com; s=arc-20160816;
        b=I/yeiSXs3F8jSxz/BJvl9y+iQQMZpPGC9k+sI8V5wUN8FrPPpEjWGaciJBMy6gHwnw
         bZ6/sOq1IPvF0mR8x29zdW6Sv/suGzL/1T4Cs0qCc1I6YDlvusQNcuhyTA+XVrYncghX
         OS7hiW5oQs5jmwhmKEOUkDiqWBC02XgTK9qSriJbG+AT1246oiBkBSp1jVAUm2EsPr0l
         +EUnZjfAvpMSWrROAh2htoUOyD0NMmsx0x+E8bukfZeM5blW8y1jO35bI7cItTuDUEEM
         jiXjprN9N43DUk9079MeMK+xMAPOYgS5QWLS+Y/QYDSni34voA2b3vWrw8TOSPq2aMsW
         FDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=wSMEVVReY2oXiu0IfO/2aUGXCEQc0AGuLMqDXwnIen8=;
        b=uQgdOtA24oyb9HNCAkfdckG/Wjam01kZk+UghAGbbU2v3SsK7rKanTuI/+XOa9/D16
         TXkOdGYczgCZpA22sIRnJUmw4zvwW6X1/uXH2GJrb5C8WmI9MlgH6ycjVjtOj1hIks0N
         L2cX8DWMBQZbf+3ymvvSRXc39snkB3ogKcFVak1gZdbPF1CqCznQPYXatbIjigoB8/fY
         WcXsuKQTLUDaCi/LNLnmGl6rmsRSB2dPLgddClZMv2drEouga9QFUYr6aIhM7Q0KrtnB
         zePY1dbPxpRm9Vg4KBtD5xWzZIwqx4872e1eVfq4YJ1uZvC+A61BxIzmXsVw6ARa4R8O
         6ANw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196-20020a370bcd000000b0067e4be23a67si1693062qkl.684.2022.03.21.03.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 03:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWFhU-0001Ip-Bh
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 06:55:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWFhH-0001IZ-GW
 for qemu-arm@nongnu.org; Mon, 21 Mar 2022 06:55:35 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWFhE-0004oU-KO
 for qemu-arm@nongnu.org; Mon, 21 Mar 2022 06:55:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5A5B4ED114DD;
 Mon, 21 Mar 2022 11:55:28 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 21 Mar
 2022 11:55:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00376421b0b-1911-4048-9cd5-a6da7b471e99,
 1B2610401919D9AAB2F83A5D9344AD9F0D4CD782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <549ac24b-4636-374c-7086-33588f906be5@kaod.org>
Date: Mon, 21 Mar 2022 11:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 0/1] hw/gpio Add ASPEED GPIO model for AST1030
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df01e5ab-a3a5-4b1d-a8cc-ccd8393146cf
X-Ovh-Tracer-Id: 6458161869366791020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefiedukefhueejteffvedthffhkeehhefhtdejkeefheeifeejvdfgfffgieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nFqSZlpW2a9

Hello Jamin,

On 3/21/22 10:14, Jamin Lin wrote:
> 1. Add GPIO read/write trace event.
> 2. Support GPIO index mode for write operation.
> It did not support GPIO index mode for read operation.
> 3. AST1030 integrates one set of Parallel GPIO Controller

Is the AST1030 a new SoC you are developing ? We don't have a machine
for it in QEMU. We should introduce the models first if the changes
are specific to this SoC.

Thanks,

C.


> with maximum 151 control pins, which are 21 groups
> (A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
> S5 S6 S7 ) and the group T and U are input only.
> 
> Test Steps:
> 1. Download image from
> https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
> 2. Extract the zip file to obtain zephyr.elf
> 3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
> 4. Test GPIO D6 Pin
> uart:~$ gpio conf GPIO0_A_D 30 out
> uart:~$ gpio get GPIO0_A_D 30
> [Result]
> Reading GPIO0_A_D pin 30
> Value 0
> uart:~$ gpio set GPIO0_A_D 30 1
> uart:~$ gpio get GPIO0_A_D 30
> [Result]
> Reading GPIO0_A_D pin 30
> Value 1
> uart:~$ gpio set GPIO0_A_D 30 0
> uart:~$ gpio get GPIO0_A_D 30
> [Result]
> Reading GPIO0_A_D pin 30
> Value 0
> 
> Jamin Lin (1):
>    hw/gpio: Add ASPEED GPIO model for AST1030
> 
>   hw/gpio/aspeed_gpio.c         | 250 ++++++++++++++++++++++++++++++++--
>   hw/gpio/trace-events          |   5 +
>   include/hw/gpio/aspeed_gpio.h |  16 ++-
>   3 files changed, 255 insertions(+), 16 deletions(-)
> 

