Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp71926lfu;
        Tue, 5 Apr 2022 09:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFyA+FBQ0LrB7zgoZzLNPW1rF0BFFITFBTYGpbNJFIVOdEHaaFLt7/H0nzAvApZ4czi6SE
X-Received: by 2002:a5b:10c:0:b0:63b:38a6:3171 with SMTP id 12-20020a5b010c000000b0063b38a63171mr3117683ybx.331.1649175216092;
        Tue, 05 Apr 2022 09:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649175216; cv=none;
        d=google.com; s=arc-20160816;
        b=H54cadbX9/cbHf8z1V94BxgRkyD8OlT8crquRnDputndVF0Af3HMUM4Ugp5laNpBkD
         4EvnVL3j1Sbt6uM5I4MdHmlziz+oG9wCsv29l1CMxQfjXr/X/Pph96x0MatOrtEcugIj
         BLtX0pM/P4NLMwLIte+yu/ho5eHWL52b7QsnICiaLuOoVzHEYjqyiSgRJAd6iMLa+UjZ
         5MLDn0sB5rLvrVSXh901oxxJHSMsIJHcYnBuLxYkbCJAJPZrAphnDAwpfZ7o8FKEVohA
         +6+SvUycr52NJspNhjGgMvmys5bYjv+klJqpygI14xwo0RR6VpghJKFuqKHn5Osjtcor
         Q+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=4+I5oZ0Erd5BqabYLuYnG/7hSwJU4gTCeKw1UmfjuoQ=;
        b=eHHrQUT3cTvfz5dE1egI2vA0ebuP0hbIDU3EfBQAouJEqlpBw/BMaT9aMke0fqqWXp
         lKDEXWVo3Iep8yO8eSi2slMAoOK6JColQj7CV7meAA8OVxHmLDZAKRYekFlD+kR04I3J
         hcWvoUqLlELKi620rim3WntNqARae2J6sXP15eXYuK2IE2Rkc9s236mJT/XApAPU8IDh
         FF9UX/kyc20UzytkhgYWGS9ABQw9scDYK2wqK1Q7VLy+LILx4vGt/h4mfTy4RAhk1gjb
         jEfcGPmQA/btL/LZHRLWc/9aOMyREcevY8x1sylV/fwCnQiGXjtPa4UgCBERLAn3GuZX
         hyOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v141-20020a252f93000000b00633e0f7b8dfsi10402122ybv.387.2022.04.05.09.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 09:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbloF-0003SE-8o
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 12:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nblnT-0003Pp-8n
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 12:12:47 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:53213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nblnR-0007xg-Ca
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 12:12:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C18CC2047F;
 Tue,  5 Apr 2022 16:12:33 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 5 Apr
 2022 18:12:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040752f4eb-f49b-4332-a9a9-0f4411790b01,
 B6D6B3DA04F085AAB79815B670852A2EB9FB851F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <66783c6a-4942-23c5-1052-0dcab389e177@kaod.org>
Date: Tue, 5 Apr 2022 18:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 387ff193-e5a4-4999-8552-b55c5675f08d
X-Ovh-Tracer-Id: 7669911642123701179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgedgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefiedukefhueejteffvedthffhkeehhefhtdejkeefheeifeejvdfgfffgieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 67ZTL2x+LAqs

Hello Jamin,

On 4/1/22 10:38, Jamin Lin wrote:
> Changes from v5:
> - remove TYPE_ASPEED_MINIBMC_MACHINE and ASPEED_MINIBMC_MACHINE
> - remove ast1030_machine_instance_init function
> 
> Changes from v4:
> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> 
> Changes from v3:
> - remove AspeedMiniBmcMachineState state structure and
>    AspeedMiniBmcMachineClass class
> - remove redundant new line in hw/arm/aspeed_ast10xx.c

Do we want to be in sync with the zephyr naming and use ast10x0.c ?

    https://github.com/zephyrproject-rtos/zephyr/tree/main/soc/arm/aspeed

This is just a question. Don't resend for this.

Thanks,

C.
