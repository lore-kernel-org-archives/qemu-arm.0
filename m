Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1626098lfj;
        Sun, 15 May 2022 14:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9ryYkCv+kNzldjQJmu9FP/Os6rcfCkkJLiIigYpV1XY1pkWoE65I21HGoCIRvMrPprqSI
X-Received: by 2002:a05:6214:21cd:b0:45b:127b:7dd1 with SMTP id d13-20020a05621421cd00b0045b127b7dd1mr12779764qvh.108.1652649595743;
        Sun, 15 May 2022 14:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652649595; cv=none;
        d=google.com; s=arc-20160816;
        b=NdSmWIU6O8HYT5o6WLuzq9OqqmNV/S3BIXSRwE5yh8SHIltVu8ITaLwDnr0cxTsQ6Q
         Z+QzvVXBSyUeVNYVK+7OvFEBtogVd2UJPbfSWi7TzCnghODbG0xn0K2of9rGy6O67nfJ
         jMpx/FXgub59BESKCFcolp4SE41QM/Hg6HGM/1AFbeoPVe5tba0N1xZ8fhmCn0RIIPNu
         MxrXNlUegq/TSJ+GpQmeyveBbFtb8BIzamBevK9jr5pxqG4uqe3kUeTz5fsrSrjF458h
         s1Ae2r/3J9+spPue1veKh7kGtkjtu9WpPjl2xkzbpZ3BUOOyOviJy7wVM1DBw1nU8Nn1
         Ep1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=07uJg3zPhBOzOrsiWSWAHiBJjsV1aYJG8jVhkc7TNhI=;
        b=PTYyz3whvMEWnWjrxiX9qFs9v7lkqalJgGFWzisZSPvd76N5ehWBlbKdsgFWB5kPCR
         +xcwg9JOBEYF8Tg8VxSKHzhrzmBBnnwrwlriChIipRNsU9M/uOKSORnDE7XjsQWG+Mu7
         J6XHfYxBHd3k98Pyc+Vc6R+5pxDUXRn7x5ZaLVKgeDcP88XZG8vBHzhmtC4B9wlChzpX
         6TMJ0f2APYHlwes2NTHlM+xc6dP2kut3bvD2eP4rsnBAGylWVZcw8MUFfeZWRoFR7XiR
         A3pNgbwRXtmx9BdVmTbBGLZkblArdIHGn/V2hUCZ8UDG7yNtwIDZ7hG6cl+8vliy7BaB
         lQFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05620a070100b0069c86c6801dsi4336009qkc.282.2022.05.15.14.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 14:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqLed-0004bE-9M
	for alex.bennee@linaro.org; Sun, 15 May 2022 17:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqLeT-0004ag-7p
 for qemu-arm@nongnu.org; Sun, 15 May 2022 17:19:45 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:35859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqLeR-0000gB-Bp
 for qemu-arm@nongnu.org; Sun, 15 May 2022 17:19:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D25D026545;
 Sun, 15 May 2022 21:19:27 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Sun, 15 May
 2022 23:19:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002c6684bdc-49b2-42b0-ad63-36f164cb272d,
 43753C8B2FFFCD567C459F3D30927D04895098CF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7187a877-354e-5e79-7ad1-a6e368678002@kaod.org>
Date: Sun, 15 May 2022 23:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via <qemu-devel@nongnu.org>, 
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>, OpenBMC List
 <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
 <bcc23f78-e81c-f4b7-3dae-17c216eb9afd@kaod.org>
 <5CBDFE96-B354-4EE6-BEA3-48E4CC68FBA5@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5CBDFE96-B354-4EE6-BEA3-48E4CC68FBA5@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3a68d27b-a6c1-49b8-8af6-5d5475c034d2
X-Ovh-Tracer-Id: 7953075467965926322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheefgdduheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GRHvfgBeyu/6

[ ... ]

>> The problem is that it is breaking compatibility with previous QEMUs.
> 
> It is? We can still run things the old way too, I specifically
> wrote this with the intention that it would support backwards
> compatibility.

You are right. Let's start with your patchset. We can add the "uart"
machine option when the need arises.

I have sent a small cleanup of aspeed_soc_get_irq() that should avoid
the duplication of the serial init in the different SoC models. Please
give it a try.

Thanks,

C.

