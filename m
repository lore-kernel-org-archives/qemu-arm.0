Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp252980lfk;
        Tue, 16 Nov 2021 22:48:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEauTlBmgWBlKb+ivoT8b5xLpgi+oOJG6i1RD6ZhaEo2h75p9uNb/oOCKiNP3OiSoihcUn
X-Received: by 2002:ad4:5e8c:: with SMTP id jl12mr52575645qvb.58.1637131700127;
        Tue, 16 Nov 2021 22:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637131700; cv=none;
        d=google.com; s=arc-20160816;
        b=DiAysq5r7CwFB74VpVWT/kAeD0GxXLnZH5BLrBTK1mSA7MvJdncSCtpUm/suwHLqAG
         bOg0gVb2HupLZR2Yyh7EBwwltA3KxvOMC8XXYJeYxa+tv6CorMjIL+P/Za/WlSG8d8Dd
         uGBqjGcm/mA2fGfQLYszxR1R15U1wqg96hAIU4Mhl7JSY9womR5pT9e1AKh8s/KLfrpG
         n3da9dgI6ax0G/5WO9IXTL3XKyRybf3SmQp8UI0YNQl2BUTeGhERKlMwpixAkldiByHl
         zDKun7pvldHWRwZ+EPeNVUT01HDQSqbFhuZ5y/a94bNx5erbaaMeBagt1OTYBitj44ME
         bd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=fMtAkB4xn207PfqJhHlul+c6vpXU9g6QmClulRHsa8o=;
        b=H8KSCIK7woLHTRMuzUJXE+Wx6zlyjVLRVkdhU4CT2awKveYgzF02BzyY/fKmUlSPqn
         N2Z2202+qChA5rytYkSqOBA61OduamLY93P7SyElY4qp0XqJU5oFE2uuOoi9F5R8J0pH
         AJxCtpsvfb9pSqeKVNcO0te11f6mt8I/fU3MaMmIb4JeR80eSF4VEOv4icc4F+I05++7
         jbSRRJ/aogB+sLUpB5wC6vdFhkJmhpex0JYyJsaWzpouWG+3vx+XGVxVOqBnQ2yUtCAW
         XIJ0JVYAJf2josmvr74Q9tJ9CWGpN8PLPzvUwgxAiB+a0Ovp2ryKXbdOplxlaObHfgdE
         UwhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f38si31344392qtb.430.2021.11.16.22.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEjy-0006K7-ON
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEjV-0006Iq-9G
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 01:47:49 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:51275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEjS-0003yZ-P5
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 01:47:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 93984CC006EC;
 Wed, 17 Nov 2021 07:47:44 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 07:47:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c79d167c-1d6d-4ac3-8f0a-a189194091bf,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <662d5a80-967d-fbb5-2ea9-a750036f7fd0@kaod.org>
Date: Wed, 17 Nov 2021 07:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [RESEND PATCH 3/3] docs: aspeed: Give an example of
 booting a kernel
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117010947.297540-1-joel@jms.id.au>
 <20211117010947.297540-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117010947.297540-4-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: be29c3b7-fdfc-456d-b93b-e116a56c57fe
X-Ovh-Tracer-Id: 11930035413495483299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehgfehvdfhteekuddtfeefffeihfeihfevjeevtddttdehvdehteekgeegkedtjeenucffohhmrghinhepohhpvghnsghmtgdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +PKR/tmxuzq7

On 11/17/21 02:09, Joel Stanley wrote:
> A common use case for the ASPEED machine is to boot a Linux kernel.
> Provide a full example command line.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.


> ---
>   docs/system/arm/aspeed.rst | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 4bed7b5221b4..de408b0364ea 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -77,9 +77,9 @@ Missing devices
>   Boot options
>   ------------
>   
> -The Aspeed machines can be started using the ``-kernel`` option to
> -load a Linux kernel or from a firmware. Images can be downloaded from
> -the OpenBMC jenkins :
> +The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
> +to load a Linux kernel or from a firmware. Images can be downloaded from the
> +OpenBMC jenkins :
>   
>      https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
>   
> @@ -87,6 +87,15 @@ or directly from the OpenBMC GitHub release repository :
>   
>      https://github.com/openbmc/openbmc/releases
>   
> +To boot a kernel directly from a Linux build tree:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M ast2600-evb -nographic \
> +        -kernel arch/arm/boot/zImage \
> +        -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
> +        -initrd rootfs.cpio
> +
>   The image should be attached as an MTD drive. Run :
>   
>   .. code-block:: bash
> 

