Received: by 2002:a05:6214:19c5:0:0:0:0 with SMTP id j5csp1489251qvc;
        Thu, 30 Jun 2022 23:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tguj5FszaxgoiMsJxJaaNp8hUVbm8sFxbTa/Q7w2BDpq1bzmh1EOb3zOhYqHr6IPcJlcey
X-Received: by 2002:a25:7710:0:b0:66c:e20c:746c with SMTP id s16-20020a257710000000b0066ce20c746cmr13903580ybc.3.1656656667061;
        Thu, 30 Jun 2022 23:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656656667; cv=none;
        d=google.com; s=arc-20160816;
        b=D4qgpJUdAUpmpqwUHhsFGg5/FUfn1Tzq7EiETCrMwPwGgRkcPZPwh10rnhN4PVM+dJ
         Eh6koA80ztXORecDbvqrMpqytrjWy6nctAljtLcdYVUnnFbOtO+BULnGVVUF/fGcoWNk
         w6Bo6X6iLRzjPg4HUAogBJkK9/LfFpYRmGXxXjJMKA7jIHCoxjaNE/PfTGJS8gGr6MEy
         csCroo6y0tVNSuJcJqSjteVsTrCPpPUlFK+ojIY1W8MNQRCMmXG5MHYWAAvSRMsuOSL3
         +vV0b5rduZ1q9fuHKOmCG8lqHID3IQJqmv+XJfWTxLXf4cEgg7AsPf/7Hdkycocv5FFn
         0jPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Wnix9KGCos6768nP3/zS7T5V8Aa/O483X9YJNNqNbQA=;
        b=L7w/NLeIG2Qo1IRnGbpeTdB/ziRCZ840/wVluWgNBECN+l3hwvdX/mtaH4dw4FO4ck
         bStoZ4oPoAHEMxCbJvrlZKo1439X+p0DqEiHNrBiQ4ewc0t6dsHhbc5Pi3ubN1CcG2rW
         73YGyVR3LcEd/1ofVCc7xmRugEeWjRWV5c2hnt5EkweoKD/7IS7oE5WqcYQapmsViRrB
         WlqOJT7B+u/z36VOGFabeNolFeheG5ZgLS75xOFakHSP1F4pJIz3vrk0Dfq+e/KXeA/T
         CPxrb7JTbdRbHBLDFDLWTIeURWd4JpDWc4svqWbQGNyex/bMfrfpuQ8FB/X9ZcZal2jH
         Wjag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c128-20020a254e86000000b0066d80b9e000si7055532ybb.105.2022.06.30.23.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 23:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7A4o-0003Qt-Hm
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 02:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7A1N-0001pm-2m
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 02:20:53 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:58383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7A1K-0005G5-Eu
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 02:20:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7CB5524AFD;
 Fri,  1 Jul 2022 06:20:46 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 08:20:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00151574818-6aaa-4ad9-985f-184099077d1f,
 4AFA7A5FE9B5479AF1021A557A7101AB3AA64E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f11c32a-407f-8a1a-0411-a8fe325514f0@kaod.org>
Date: Fri, 1 Jul 2022 08:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Content-Language: en-US
To: Patrick Venture <venture@google.com>, Peter Delevoryas <pdel@fb.com>
CC: Titus Rwantare <titusr@google.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "joel@jms.id.au" <joel@jms.id.au>, "cminyard@mvista.com"
 <cminyard@mvista.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
 <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
 <59308513-C87E-4DF9-8191-5F2664E90B85@fb.com>
 <CAO=notxbi2wroXK281X0Q4QUF2ONas2xHq=ZYDPsnKRaP4u2wg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAO=notxbi2wroXK281X0Q4QUF2ONas2xHq=ZYDPsnKRaP4u2wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb87ffd8-241f-4758-b39d-b933657b7af0
X-Ovh-Tracer-Id: 10537860179791678453
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepiihhuggrnhhivghlsehfsgdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: TT7WaRt+OUjS

>      > Thanks for the new device. It helps me see where to expand on PMBus.
> 
>     Thanks for adding the whole pmbus infrastructure! It’s really useful.
>     And thanks for the review.
> 
>     Off-topic, but I’ve been meaning to reach out to you guys (Google
>     engineers working on QEMU for OpenBMC) about your Nuvoton NPCM845R
>     series, my team is interested in using it. I was just curious about
>     the status of it and if there’s any features missing and what plans
>     you have for the future, maybe we can collaborate.
> 
> 
> Peter, feel free to reach out to me, or Titus, and we can sync up.  I used to work with Patrick who's now at Fb on OpenBMC stuff.  We sent a bunch of the Nuvoton patches up for review recently, and we're actively adding more devices, etc.
> 
> We also have quite a few patches downstream we're looking to upstream, including PECI, and sensors, etc, etc that we've seen on BMC servers.

So a simple PECI model is now merged. Sensors are always welcome,
it's nice to have properties to change values. On my wish-list
are PCIe and a working USB gadget network device.

Thanks,

C.
