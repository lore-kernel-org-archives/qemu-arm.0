Received: by 10.223.197.9 with SMTP id q9csp3690278wrf;
        Tue, 10 Oct 2017 08:39:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB2p8YWuz60vPmp/HPMWYo/ULLq4JtZKkqrodvpY8B2xu044aohPlw3LcFj7lmDIjDeBBq4
X-Received: by 10.237.37.76 with SMTP id w12mr14730804qtc.201.1507649946640;
        Tue, 10 Oct 2017 08:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507649946; cv=none;
        d=google.com; s=arc-20160816;
        b=qa+C6Se36rhJAgdf25SthxSdpRQjBllD+ZQ2ppu66mrxOgtuCpEJa1nOM3YauMIta3
         /5HqV7u920jngQQwq2NkgBNH6dN6+dmp1aQ8U1oSShgv3G1eL0usTAYqjNJcgM3t32Pq
         9ZFovVFqKLrcRKrf9ILyGnuiK0Q/mkjy8YehVk2kN2aTO94LlV2Vl4UFcp0kDRLDNAKf
         HWlaAdsb0fIz1BOBjUHqqPgV0qkwn1I2QO8aOcR16mcoWOR50X+DVnwLhUncznQu44+Q
         XFISmUX/fefNupHaiMRmW72bIx5CU/odTc7p6EAEcpeq4YOuSMcA4c28DM1Ae32vsaEJ
         h6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=piJl5DQvMmtRuCIIREKu8Zv9VJ9c7CQ+36qaRIdbZaw=;
        b=ZahQjcfc3Dk2burU1GFvoqd9cntAtrNhNjx+AKrmY+89UoJk9JgPjyKbZbjI/QqUXL
         8nO99h/9hOpFBp+/S2l9YaRGHxOfihzV+uYXVtW8uu2GHOswWALAEK93QyW4G4oLSqr9
         lXJMRIBeM/sEiRTtmsXjff5A8VB+xqHi3nS8mebaCyzZ/FE3yVStcfda9GAwGsDsFgFi
         QraDgkf9qGQxF7jnJClG4B98mDdVW4cB14/YDtq4MUogWYx+3eS7UDPYhzq7wDaUlJWa
         YeRJ7/p00nwflyUxDMi8+qYuVGrIM5mTrp87eIC0Rb3oGZQCgUy+m6OckdbBB/0JKOQy
         TgqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r29si3779567qtb.243.2017.10.10.08.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 08:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1wca-0007kZ-Cu
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 11:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1wcP-0007jI-7Z
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1wcM-0000dJ-3m
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:38:53 -0400
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:35678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e1wcL-0000b9-U2
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:38:50 -0400
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id B594758BA0
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 17:38:41 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice3n7.emea.ibm.com
	[195.212.29.177]) (Authenticated sender: postmaster@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id 137FD54007A;
	Tue, 10 Oct 2017 17:38:31 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
	<CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
	<900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
	<CAFEAcA-tZG-mVMk-kfxZz3oKOSBr9QDpwJWc_CSvqc7An8NNbg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cf00417c-86a6-cf7c-eea7-b1b46d9b2cc1@kaod.org>
Date: Tue, 10 Oct 2017 17:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-tZG-mVMk-kfxZz3oKOSBr9QDpwJWc_CSvqc7An8NNbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 16824885259841801156
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddtgdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.58.91
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1x22S7GVK/s

On 10/10/2017 03:24 PM, Peter Maydell wrote:
> On 10 October 2017 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> On 10/10/2017 11:54 AM, Peter Maydell wrote:
>>> The goal is to model hardware correctly. Hardware gives
>>> aborts if you touch a physical address with no device there,
>>> and so QEMU's model should do the same. If you have guest
>>> code that touches a physical address and blows up because
>>> of an abort (but doesn't when run on h/w) then either:
>>>  * it is trying to probe a device that exists in real h/w:
>>>    you need to provide a stub implementation in QEMU
>>>  * the SoC's bus fabric really doesn't pass aborts back
>>>    to the CPU; I think this is unlikely, but you can model
>>>    it at the SoC level with a suitable default memory region
>>
>> well, that is case it seems.
>=20
> If it is, then we should model the SoC that way, ie find
> out from the hardware docs what part of the bus fabric
> ignores decode errors and use memory regions with the
> right default behaviour to cover the relevant address
> ranges.

The addresses generating memory fault errors are all in=20
the region where the BMC SPI Flash Memory is mapped :=20
[ 20000000-2FFFFFFF ]

but we should not be doing any writes there. I will make
some inquiries.

Thanks,

C.=20
