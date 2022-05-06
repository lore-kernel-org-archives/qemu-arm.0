Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1590115lfj;
        Thu, 5 May 2022 23:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtEBO+57MmsEVxnrO7x2pMaPb0BUJJrB7tLcDJ2GTXeBPEBcNAVaepzE7M1rVBjWgdlcQ5
X-Received: by 2002:ad4:5c8f:0:b0:456:3dbf:f58e with SMTP id o15-20020ad45c8f000000b004563dbff58emr1294275qvh.37.1651819163374;
        Thu, 05 May 2022 23:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651819163; cv=none;
        d=google.com; s=arc-20160816;
        b=VbLCl3tggbVHsnXyzs5ENC0YddHrxOcT7fic7dXNlWGYctibcAL4C1wnMAIuIfa4ak
         7VF2mVtoUCiEEqetKhXTU3HLRLBgJ8jVt0YeIwP7BvVeX7VSTTyDkfq3ye8EequvDHMX
         RJj7qjkYswmKK4kMnog06VdPOS6F/5gEDzFVk65OpIsQoG9hhZa7GwLoDip66/HgSXWY
         0amoxUteMZnm4PPO9d/PqU5XwiyLV736tDrpJgEdf35COuakJI+eXidKb3GDcuNE5x7r
         ThPsGHqMt77FqYOoFjzM6wG6wB8dYI0u0nPiUumt+Q6+s1mCjm9iaJb4YczrplPqLP/9
         Z5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=0UImBbC1gCwHX5sn3jv1/a6UfzdZbUvHsUyYQ3UOte0=;
        b=NRPNpfQ3Tv4WFU0n33gDR6qbpN/YJkmCYIYtaf3EiYaf88qWs3eoQXGVhhxqxN1EM5
         WKjN6HFMPsDd/YnchJW4dkugCIr7j/5psMO4Q8rQIHGfG48TTQitQUUl9skZpZ0/4dqJ
         lv+QF/c6vc9Ah158DLnq74iOzaIvl4p00WPvjg1M6Pj4Z4tVHktDdoVtp3uKFzHpLjdL
         4AfMhk4tFX760lnf3sjYGYrwJgEdQqh7/4Upn4k/SwoMONQ8CGJnm64OlgatiTUo12PF
         CYH978uFFJtdLzQW9rJC/g5fthxtL1MiyaKWw04PNTfIFu2OpAq1l1JIyYTjL37rc29q
         ObeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a05620a268300b0069f4a9ddba6si2018193qkp.479.2022.05.05.23.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 23:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmrcY-0002Rl-Qh
	for alex.bennee@linaro.org; Fri, 06 May 2022 02:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmraG-0001IV-Qy
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:37:01 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmraE-0001iV-U1
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:37:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B039CFCF6B00;
 Fri,  6 May 2022 08:36:55 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 6 May 2022
 08:36:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005cbeb307c-23af-4b87-808f-437e93b79658,
 85FEA43FB7D152D5FE87D0D31D0EEF45A371AE19) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <6a44aa70-e778-a115-6e4a-1336fef6c951@kaod.org>
Date: Fri, 6 May 2022 08:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter
 Maydell <peter.maydell@linaro.org>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
 <3C811C58-AF56-412B-B567-1218076B7584@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3C811C58-AF56-412B-B567-1218076B7584@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a4c7bd08-8600-40f1-8ded-19409e0afd62
X-Ovh-Tracer-Id: 13981143571456035747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0haII13A3uQ


>>> Have you considered extending the emulation to include a AST1030 SoC
>>> in a larger machine ?
>>>
>>> The AST1030 SoC is merged and I think that QEMU could run a cortex-m4
>>> CPU and a A7 CPU. A + R CPUs is supported (Xilinx boards).
>>>
>>
>> As a matter of fact yes! I tested booting our OpenBIC Zephyr kernel last week with the 1030, that worked. I also used the experimental i2c multi-master patches from Klaus to make a i2c-netdev device that connects two separate QEMU instances through a socket and sends their i2c messages back and forth. I was able to test a basic MCTP transaction.
>>
>> I’m hoping to help however possible with merging Klaus’s changes, and then propose the i2c-netdev thing too.
> 
> Oh wait a minute: You mean I could include both SoC’s in one machine? 

Yes. We would need to extend the Aspeed machines to instantiate
2 different SoCs (or more). This is something quite interesting
to design.

> Oh that’s a good idea actually. Maybe I’ll look into that as an alternative to the socket thing. Still, it might be something useful to submit anyways.

Yes. Please do.

Thanks,

C.

