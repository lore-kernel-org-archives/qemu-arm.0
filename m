Received: by 10.223.197.9 with SMTP id q9csp7588112wrf;
        Thu, 19 Oct 2017 23:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QAJKZOIlrj2LrZeWU6EW09Iw54eTtJgFHHQZ7Cg75oaj6j3UB3pXYCTfoumRJu85XhAJF9
X-Received: by 10.233.221.66 with SMTP id r63mr5547622qkf.79.1508481043412;
        Thu, 19 Oct 2017 23:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508481043; cv=none;
        d=google.com; s=arc-20160816;
        b=0wVygyKTjlQyujlL9Mb8HqO/OMbeVVowbnrx3klK4VS+cJpKHEYAyT2eIErCxE0d+G
         Uce+E/BhYCCsZKtwjrFewn4kz/jP0hhkHXi008MvEicrj3/8L/WdulTE8OD1SZg+76Qu
         kamZGiSS37aAOq92J224qhcIZK7J96pGlbdKGPUw0LHJkGKqtF7s8WXMdr/DV9CxnY6u
         Ofgens+YHQ+OFYGgbSTgeKMc3ObE+Jca4eg2dGC51OJjehlY3bSvAOilAJaiJLMpCsJU
         F3lnfX9HlC7XxkQZL2zQi9sxbt54/EL0Na3aXX61BdBWKw0Jwr0LJBdG5d/uPH5is83j
         jD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Rs8LaeGjcZNyu8spzVJLatzBrWv0fMTnTqe4vsFXu6U=;
        b=O2GK+TzRIfWksirntux9KLijb3oI5usFbtv4Jxli+ZbS4WTYsQ9reFeDgH5LfrOxA4
         PmzTRYCQg5opr3cpnIuqlue95odO/T97XGZAQ2iiDXcqoB7mXZtqhZ4HFamCSUquCO6y
         iMUtl8e/83qYIb0tMnwHHNwqy2xMaojZOdWNOZMAGZXDOa5C4NAgS1XG4f4PilUZshKH
         VQfu66Ow2n0lsQHS5qtP44P77Z9/TV5ta0Pe6vRxHH84GgGfXnd0zX9RkP/twACPkTp6
         Bk0OmiOfowJS6VklGUbrflCnC4LJbtjARJWtyk4oan6VHG7MHwWRBrEf4X1ftrCxN+Mo
         pbsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si240762qkk.158.2017.10.19.23.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 23:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5QpN-0000be-5b
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 02:30:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5QpE-0000aM-9A
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Qp8-0006pR-Dn
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:30:32 -0400
Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29]:53410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Qp8-0006nN-7D
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:30:26 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id C1D5D145141
	for <qemu-arm@nongnu.org>; Fri, 20 Oct 2017 08:30:24 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id AD90E8006F;
	Fri, 20 Oct 2017 08:30:17 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-2-clg@kaod.org>
	<CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
	<114c397f-7540-15ca-a44d-0b3a4cdcc238@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c8392d97-7823-7a00-648c-31a786957c26@kaod.org>
Date: Fri, 20 Oct 2017 08:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <114c397f-7540-15ca-a44d-0b3a4cdcc238@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10952472820376505299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudelgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.107.29
Subject: Re: [Qemu-arm] [PATCH v5 1/8] aspeed: use a ROM memory region to
 catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irOhF7/zr+5F

On 10/20/2017 05:10 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/19/2017 12:44 PM, Peter Maydell wrote:
>> On 19 October 2017 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>> Some legacy firmwares access unimplemented addresses on the Aspeed So=
C
>>> (old U-Boot code using variables in the bss when it shouldn't do).
>>> Let's use a ROM memory region to catch the invalid writes and support
>>> new boards without using the 'ignore_memory_transaction_failures'
>>> flag.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>
>>>  Changes since v4 :
>>>
>>>  - use a ROM memory region
>>
>> Probably worth mentioning in the commit message that this
>> is a migration compatibility break for these boards.
>=20
> What about the eeprom_buf from patch 6 "Add EEPROM I2C devices"?
>=20
> My understanding is a migrated board would resume with a zeroized
> eeprom, is this the expected behaviour?

That would be probably the case. yes. As we don't populate the eeprom=20
with VPD at machine init time and that migration is clearly not tested,=20
I think we will address this issue later. =20

Thanks,

C. =20
