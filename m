Received: by 2002:ac2:46e6:0:0:0:0:0 with SMTP id q6csp437852lfo;
        Sun, 19 Jun 2022 07:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzZjcg9gsgtDFKj70Ma8dAkqvlNNtJj4//HlEkRn4d4cb5KvR1YbCO8QuHVOhyntB66pp8
X-Received: by 2002:ac8:5e09:0:b0:305:2d57:8601 with SMTP id h9-20020ac85e09000000b003052d578601mr16328116qtx.131.1655648639722;
        Sun, 19 Jun 2022 07:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655648639; cv=none;
        d=google.com; s=arc-20160816;
        b=o32yDws4xJJdBYOpfPkFFclO9trSsVruGdrSkEEN699P/+rIXs01QLILdefX4SPg+c
         YLgTCKTI4I0Df1VK735x66qhSVPeOl1Px+g9bxahWpXXW7G3SYA/ydR/XnhoXTG/4mcZ
         hEKr/1HlhijX3u/v81Qo/nShGSwN0CSgMtkjRyC8B8cRRGVAD2w9PSDkyCRUtwQ88trF
         ueors+vaIF7JPgrrwsbR0eGt429DKH+c1AhYt9SHnYo8aSVuNsmWaOWVJ3pAvo+/6kwn
         yry0fnjV88trX5kl5OfaDK9lLo6YbAQHgr6+6LtAhl0uiqdVcH/GdQGPXNC69xNG9iyb
         xYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=bku4J285c5rJ4mdKtP5owLofk10XD/MREh2BZjEREds=;
        b=RoN9BUpjspKSSr1z/8mYc4saoDHMCX1Q1OwAkUBJeG3SBXV0vuwdlrWWrc3e2XogNe
         p/3qjSr8RjEMCE8E0GFfiIyhOuNg9Qws/YvStOCBYFrArC026AVWGKunCdHOzEzO3B7w
         8H0hvrkRQ5ZIYn11aOTtu7PxG4J45TBCuOsrjKW4byqLKq7xbYqDWJ177VBUh5L8sxBB
         jOKcB0fP9eBXPKXueDEEqSAGbcI5wxLbVFAiu5BNRGp6ByJwc/6y2RS+0wu9X+EJBWMA
         Vzxd8b/sIlrOcvHY/mpXJ3Cjc3aUiVvCqfTrSe1a95vOoCb8t4L0KyNeOWtOenBrvgOB
         74Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a0c4a00b006a6b850dc2esi7034470qki.179.2022.06.19.07.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jun 2022 07:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2vqJ-0008DE-6p
	for alex.bennee@linaro.org; Sun, 19 Jun 2022 10:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2vph-00089E-Mp
 for qemu-arm@nongnu.org; Sun, 19 Jun 2022 10:23:21 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2vpf-0008E3-83
 for qemu-arm@nongnu.org; Sun, 19 Jun 2022 10:23:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CD2B52023B;
 Sun, 19 Jun 2022 14:23:14 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 16:23:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002cf1c33ab-2b2a-4ca3-bc1b-30614de2aeaa,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <017221aa-93a5-d36e-0c13-3392a5b70798@kaod.org>
Date: Sun, 19 Jun 2022 16:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/1] hw: m25p80: fix aspeed_smc tests failure when run in
 isolation
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220617230758.2537544-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220617230758.2537544-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5615be9-a2ca-4d94-9d9f-30bbb7887f5b
X-Ovh-Tracer-Id: 3553903059867241348
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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
X-TUID: Iel0+i2zok5S

On 6/18/22 01:07, Iris Chen wrote:
> Hey everyone,
> 
> I discovered that some of the tests in tests/qtest/aspeed_smc-test.c were
> failing when run in isolation due to dependencies between the tests. For
> example, one test would test the reading of a block of memory written
> in the test before it.
> 
> I think it would make sense to add flash_reset() between running the
> tests and make sure the tests do not rely on each other. Thus, I have
> made changes to the tests so that they now pass individually with
> no dependencies on each other.

Good. Thanks for doing that.

Please add to your .gitconfig :

   [sendemail]
	  thread = true

Emails are not correctly threaded. At least on my side.

Thanks,

C.


> Thanks,
> Iris
> 
> Iris Chen (1):
>    hw: m25p80: fixing individual test failure when tests are running in
>      isolation
> 
>   tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++------
>   1 file changed, 63 insertions(+), 11 deletions(-)
> 
> --
> 2.30.2

