Received: by 10.25.21.156 with SMTP id 28csp835147lfv;
        Thu, 28 Jul 2016 07:27:00 -0700 (PDT)
X-Received: by 10.55.52.147 with SMTP id b141mr42331616qka.13.1469716020727;
        Thu, 28 Jul 2016 07:27:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c71si8120695qke.248.2016.07.28.07.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmH6-0005zD-6J
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmH0-0005z0-Hl
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmGu-0005Ho-I8
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:26:53 -0400
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:49533)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmGu-0005Gr-BL
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:26:48 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id D5E1210043DC
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:26:46 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 399265C0096;
	Thu, 28 Jul 2016 16:26:43 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-7-git-send-email-clg@kaod.org>
	<1469682716.5468.114.camel@aj.id.au>
	<947a8251-7bb6-ea6e-8bd0-05bdd89b9bc0@kaod.org>
	<1469692703.5468.125.camel@aj.id.au>
	<81cfd17c-ee36-6ba1-7c63-7046d935ea06@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <84463040-1bd5-46c7-a6ad-cb38cfea65e2@kaod.org>
Date: Thu, 28 Jul 2016 16:26:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <81cfd17c-ee36-6ba1-7c63-7046d935ea06@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1595963119555480496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.118
Subject: Re: [Qemu-arm] [PATCH 6/6] arm: add support for an ast2500
 evaluation board
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIbKV8yI3Par

On 07/28/2016 10:03 AM, C=C3=A9dric Le Goater wrote:
> On 07/28/2016 09:58 AM, Andrew Jeffery wrote:
>> On Thu, 2016-07-28 at 09:15 +0200, C=C3=A9dric Le Goater wrote:
>>>> =20
>>>> Also, the meaning of the bits have changed from the AST2400 - they
>>>> probably should be documented somewhere?
>>>
>>> So you want me send to an updated version of :
>>>
>>>         http://lists.nongnu.org/archive/html/qemu-arm/2016-06/msg0069=
8.html
>>>
>>> as a prereq ?=20
>>
>> I mentioned this in passing due to the discussion on my original patch=
.
>> I think we discussed this separately and concluded the macros were
>> pretty verbose given they are sort-of single-use given the value
>> doesn't change. Maybe just comments as Peter was requesting? You have
>> the patch below but some of the macros will be different for the
>> AST2500.
>=20
> yes.
>=20
>> I'm probably leaning towards comments over macros, but don't feel
>> strongly either way.
>=20
> ok. having a correct value is a minimum and this is not the case=20
> in this patch. I think I will go for the comments for now as We=20
> have not merged anything in mainline uboot yet.

I gave comments a try and honestly, macros are cleaner to check=20
which bits you are setting. less prone to errors. So I will send
a v2 with macros.=20

Cheers,

C.=20

