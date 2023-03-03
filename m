Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1059680ejc;
        Fri, 3 Mar 2023 05:24:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/PBg+l9NoEBQPPesf+gPk/25FSRvQeQ3qxBoOn/sfa0BXECJrIeHfPPwtL+0gl+p0re/ql
X-Received: by 2002:ad4:5ba5:0:b0:56e:9dd8:47f3 with SMTP id 5-20020ad45ba5000000b0056e9dd847f3mr2565725qvq.13.1677849845608;
        Fri, 03 Mar 2023 05:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677849845; cv=none;
        d=google.com; s=arc-20160816;
        b=x3C4K3zJA0uy+NHFk6IGK8ph0n586a0CMvrLLWU3wb+JSLuZGXtsIfG9U9lz4jwt7F
         nQJsV9U9lb5Fpm75c9cZAIJlvOusBTcZbVEGFtc/5L0L7vSGZtxTHoFMbZYryiVy1R3B
         PRgNr7ZIshlrZQL31oUXlA+EgcnRLbG0OgPXm1nax2cWIjFJIHJCbq2DNYPIme0Z0UXL
         R84D8PwlMJBcK0X3kQXMV5WYtASYymCT6bro6p4lYNxRDvFUpcPM5NCpErXxJ6DPY34h
         OBPd3Gp2uwnIc29hOXU30m5TOTedc9a5zNECYDWEd4b1xB5qKBQ2JvSYo2q3FiAB55/Q
         A1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=vY6brOEP/DXoCROxB1kV4HEQhVJBPpkS7zYoyza2yGM=;
        b=nng+A2gefKQPMiuXQph77WnZOFEDVghalsb4+6z3wtiSh0b1Vl6mXXscwya5UYAWh2
         W0i3uU6hX/3yUzOutDK/QO6zT4R9aCfppDuYxjHo/wFTQkdKiPycCFvsAdMh9mvwHST6
         UjO2sMnbXUjqn/TZ/X33TYo4u/Pwz6C7k0wrr+npUiQgx6oRX58YAVBZhxxnLBdCnjD4
         IDnleczUoaO64ss8HB7BjO5FS4U5L1fLM01P/Q8kR0hYXzpvHEWbmj5wjZsLyVBBWxyI
         XWGYY5bV0P+ku2xdIShx9F7EmpeWmCo/no45RYRBP66CZcC2X1EQBHt15QtTfNZYH8zH
         qV+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020a0cab59000000b005722e511e72si1453819qvb.582.2023.03.03.05.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 05:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY5O3-0003uh-Qq; Fri, 03 Mar 2023 08:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pY5Ns-0003jC-BZ
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 08:23:40 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pY5Nq-0002w4-0x
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 08:23:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A1B1E2CA55;
 Fri,  3 Mar 2023 13:23:25 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 3 Mar
 2023 14:23:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0063ec08ae6-643c-4ac0-8dd3-e6d8038f2ce0,
 D247C90D5DACFD620130D6A3F59DE8A1FE9C6D23) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
Date: Fri, 3 Mar 2023 14:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 00/11] aspeed queue
Content-Language: en-US
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>
References: <20230302174206.2434673-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 597aa1e2-462e-4de4-8a78-5d5aebddfeb6
X-Ovh-Tracer-Id: 17639755318039710685
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedukeeuheegtdekvdegveelvdffieegveevheeukeetgeekfeeivefgheduieekteenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nBf2+trz8v9b

Hello Peter,

On 3/2/23 18:41, Cédric Le Goater wrote:
> The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11fe06b:
> 
>    Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu into staging (2023-03-01 19:19:20 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
> 
> for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da:
> 
>    aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50 +0100)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * fix for the Aspeed I2C slave mode
> * a new I2C echo device from Klaus and its associated test in avocado.
> * initial SoC cleanups to allow the use of block devices instead of
>    drives on the command line.
> * new facebook machines and eeprom fixes for the Fuji
> * readline fix

This one was merged already. Would you prefer an updated PR instead ?

Thanks,

C.

