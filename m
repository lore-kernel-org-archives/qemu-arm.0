Received: by 10.25.150.194 with SMTP id y185csp2449251lfd;
        Wed, 23 Nov 2016 00:49:10 -0800 (PST)
X-Received: by 10.55.139.134 with SMTP id n128mr1549842qkd.43.1479890950134;
        Wed, 23 Nov 2016 00:49:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si11467150qti.35.2016.11.23.00.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 00:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9TEr-00055f-Fq
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 03:49:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9TEm-00053h-K3
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 03:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9TEj-0007XN-Jr
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 03:49:04 -0500
Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29]:35047)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1c9TEj-0007Ty-EG
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 03:49:01 -0500
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 293CE4BD90
	for <qemu-arm@nongnu.org>; Wed, 23 Nov 2016 09:48:56 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id AA771600098;
	Wed, 23 Nov 2016 09:48:50 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-5-git-send-email-alastair@au1.ibm.com>
	<948f93ef-50d3-a450-c69f-faefd078f00d@kaod.org>
	<1479861992.11116.112.camel@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <db1b87d9-8e3a-af86-a7ac-c960698f606e@kaod.org>
Date: Wed, 23 Nov 2016 09:48:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479861992.11116.112.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6338816478861757395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdeigdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.107.29
Subject: Re: [Qemu-arm] [PATCH 4/4] arm: Add an RX8900 RTC to the ASpeed
 board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LW9jPQx7v9+0

On 11/23/2016 01:46 AM, Alastair D'Silva wrote:
> On Tue, 2016-11-22 at 17:56 +0100, C=C3=A9dric Le Goater wrote:
>> On 11/17/2016 05:36 AM, Alastair D'Silva wrote:
>>>
>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>
>>> Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
>>
>> If this is a board device, we should include it under a machine
>> routine.
>>
>> Is that for the palmetto ? The ast2500 does not have a RTC.
>>
>> Thanks,
>>
>> C.=20
>=20
> Ok
=20
I suppose we could change aspeed_board_init() to return=20
a AspeedSoCState* and use the soc object in the specific=20
<machine>_init routines to add devices.=20

Andrew, what is your opinion on that ?=20

Thanks,

C.
