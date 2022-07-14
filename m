Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp693743lfp;
        Thu, 14 Jul 2022 07:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgOan4pl9hm8Etir0JIbshuV4wWhdaQsc2WwoRFmNJgcXbgCUJr4LsQmptMT2Nzt8lLj7j
X-Received: by 2002:a05:620a:448a:b0:6af:39e9:c31 with SMTP id x10-20020a05620a448a00b006af39e90c31mr6186028qkp.9.1657808852023;
        Thu, 14 Jul 2022 07:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657808852; cv=none;
        d=google.com; s=arc-20160816;
        b=OtFeETEO5Iqn7Vbhta7oDdPSfHOBLyNqLF1R4E/ODsL6ocHcLs4LZtSy1mFgvQAeHB
         bHRfWfFM6j6XoamWG6+8htMuzooP+F3mAjKAJLDvzJpbjp1sIO95wDdELDftsAKKQY0V
         r1OrcWv+tF2R/PJDmik5P2AsdA9jkgN1qjGgE/NQ5h29pR4/Hd5Upoc6jDYT+w2+WB4e
         zZnPhOc8eXaAt0/gI7N9mLM6U6KyWB3upqX/6lqrHOBvFDtqX05KSO8Qt+wVznJahZKz
         ek75Nt0hd9LaUEbg0lWRm18vEJXHUe/z858SgukGRibkkhEg5dykdXPFwDJ0lwyNFxwC
         oJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=uxbcmTCPwRwBPKFzRtDkArvhydZwuH0hVP56fDuyWuM=;
        b=tRc0DmTVrDdINWpvwjgWAL17T7DKyWTrTTuNS2hXJS9IW18Upxqlq+NR5C931cFOCc
         K34FbKntWjMPmquWqiUDmZ5+hGnfka+MxRoT95MhcrGYfOnZJMvpzcjveVpv6bXGodCB
         zj6GB56zx37DecfHbWzBfmvBZL9RgVu6ftWVf398UsUCup5Ykzj/eG8ft8EqZ90wvQpa
         sOWBljOB4o1Co1hCmYAWIhwQVUkg7Qwj0lCejlFNpBoGny53yK1WmKQG9k9wHFcmaKtV
         wY2kSVq+uyZeoINMFOEGLA6RWNzHeqdIfYjYXUBMiwBdnxtQFkEBqffCoA7CIj6FdOsl
         jgWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke21-20020a056214301500b0047309cecac8si772535qvb.144.2022.07.14.07.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 07:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBzoQ-0005TT-Ho
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 10:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBzoC-0005T8-JP
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:27:17 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBzo9-0007yI-2K
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:27:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EBCA511820B57;
 Thu, 14 Jul 2022 16:26:56 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 14 Jul
 2022 16:26:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002cf6a21d6-de9b-49a2-a9c4-fd58bfb471b5,
 34332D216D760BBBE1E6AE2DE5FCE67E0A5C7624) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <16349149-8714-505c-c299-ad7e599ec4b5@kaod.org>
Date: Thu, 14 Jul 2022 16:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/19] aspeed queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20220713075255.2248923-1-clg@kaod.org>
 <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 69927096-0d21-4b6a-815b-bef52abd20da
X-Ovh-Tracer-Id: 2859785766474320864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedttefhfedttdegleefkeefveefkefgvdfhueeikeduhedvveelleefteeiffffveenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-TUID: 8EJjU5LqGqDb

On 7/14/22 15:51, Peter Maydell wrote:
> On Wed, 13 Jul 2022 at 08:53, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:
>>
>>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220713
>>
>> for you to fetch changes up to 053b2ee5629d1b822127cc454634ec272624bab2:
>>
>>    aspeed: Add fby35-bmc slot GPIO's (2022-07-13 08:16:46 +0200)
>>
>> ----------------------------------------------------------------
>> aspeed queue:
>>
>> * New ISL69259 device model
>> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
>> * Aspeed GPIO fixes
>> * Extension of m25p80 with write protect bits
>> * More avocado tests using the Aspeed SDK
>>
>> ----------------------------------------------------------------
> 
> Build failures:
> https://gitlab.com/qemu-project/qemu/-/jobs/2722152320
> 
> hw/arm/fby35.c isn't passing enough arguments to blk_pread().
> 
> Your pullreq probably collided with the recent merge of the
> block patches including
> commits 3b35d4542c853 and a9262f551eba44 which add a new
> argument and swap two of the existing arguments to this function.

Yes. I will resend after a rebase.

Thanks,

C.
