Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp463909ejh;
        Thu, 25 Aug 2022 15:03:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rpdOOfk8fP1fCje1R32cBoJi3a4FbF2jw+pVOHudsrTKcAk4tzmXkVTxH1QcCEvt+R3W1
X-Received: by 2002:ac8:5b05:0:b0:342:fd04:a25c with SMTP id m5-20020ac85b05000000b00342fd04a25cmr5548577qtw.303.1661465021334;
        Thu, 25 Aug 2022 15:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661465021; cv=none;
        d=google.com; s=arc-20160816;
        b=QP5EVxVg+z2k2NLqZObMlsxyD5KA4t7Uo2N+kqjktOO6eVSU/30/AbPl4R0ZcFk4sT
         B7pJXONvuNg7RFP1j1pDnT9zYQ3nQcE0McKTUwSwm5XmqKrfY8CjI8XIvAtH49yjyIHR
         4Zn4GQsHPZPbcVgWzrTO+r8rjgHHVKXrgLbgfcRokOUtfU3QYoFKeTiVz8H7MvvsljGX
         nrGXI3ilmq3tTDuq7d0/r2YSJEk4vv5eaZXGylo3i4dMTiE2x4OrpHCxslj4cm6TtV49
         kTyRZ8Ie55SD98jzySzoscKUYCq27UkmPizjOGvGEpw5eAVG9wj7svTfFVLtt8DXeRCW
         etPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=UNAMXnTZgLYODfSv9lpBT6y7jL2ARkzZxloyRmJbpyY=;
        b=aWJ8iq6sm7oudncuasGFhbNKX/D9ILTjGyrTe1vjvbFZFUhn9MOqJkoDaNQWFAqSLh
         uO9JxhHFhzuvzOCQpxTKXenMm1ew8w3EVh2Kbwel0tXc2VVNvryPceOBLZJ6j1dz9wnG
         7tLEpIraQNil6nEl0rdrn2egiTHAIFpUOXnFi+sxQryWfpj/niB/BWTLSiN4uDCIuLLY
         t8hQ18nweQ0x0zq8m+mMzsQ3CHimGVeHbe2EeQFKC08PSeSBg8lbZSw63GFn7NYsx6ez
         oK3rnENThrcSiyswR9nxqMSTfEhlzs1p1ck5u7w1N9cXTRoOAmIyLysi6vNQENa5hxLU
         lQ6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ac8138c000000b00342b1466da4si64852qtj.401.2022.08.25.15.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 15:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRKwu-0002fN-Sj
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 18:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oRKwA-0001y9-L4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:02:54 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oRKw8-0000RO-4p
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:02:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9892B25954;
 Thu, 25 Aug 2022 22:02:39 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 26 Aug
 2022 00:02:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001dbf4d7a2-462e-4ab6-a7e9-0d4410cc00ff,
 052AC8B081C640D3E856F13017BF92FF19103B6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.205.98.5
Message-ID: <87e953d8-bb2b-ce4a-c9cd-7c60d997bf6c@kaod.org>
Date: Fri, 26 Aug 2022 00:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PULL for-7.1 0/1] aspeed queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>
References: <20220825085710.34800-1-clg@kaod.org>
 <08249dfe-52b9-3048-e6c2-2be0414b10d6@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <08249dfe-52b9-3048-e6c2-2be0414b10d6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a285383f-b505-4542-a439-95f682299f89
X-Ovh-Tracer-Id: 17401627488757320672
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 7V/J8tU+xSCV

On 8/25/22 17:23, Richard Henderson wrote:
> On 8/25/22 01:57, Cédric Le Goater wrote:
>> The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:
>>
>>    Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)
> 
> Too late, as you can see by -rc4.

It will wait 7.2 then.

Thanks,

C.



> 
> r~
> 
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220825
>>
>> for you to fetch changes up to 7ccff968f65cfad573bc0015cb0ab800d4337a6e:
>>
>>    hw/i2c/aspeed: Fix old reg slave receive (2022-08-25 10:46:42 +0200)
>>
>> ----------------------------------------------------------------
>> Aspeed queue:
>>
>> * hw/i2c/aspeed: Fix old reg slave receive
>>
>> ----------------------------------------------------------------
>> Peter Delevoryas (1):
>>        hw/i2c/aspeed: Fix old reg slave receive
>>
>>   include/hw/i2c/aspeed_i2c.h | 1 +
>>   hw/i2c/aspeed_i2c.c         | 8 +++++---
>>   2 files changed, 6 insertions(+), 3 deletions(-)
> 

