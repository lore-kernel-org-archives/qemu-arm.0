Received: by 10.25.21.156 with SMTP id 28csp668093lfv;
        Thu, 28 Jul 2016 01:05:21 -0700 (PDT)
X-Received: by 10.55.185.131 with SMTP id j125mr39467336qkf.170.1469693121237;
        Thu, 28 Jul 2016 01:05:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si7193782qkl.213.2016.07.28.01.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 01:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSgJk-0002q4-Mv
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 04:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSgIh-0002Xm-Mk
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 04:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSgIc-000656-OK
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 04:04:15 -0400
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:50070)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSgIc-00063t-IQ
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 04:04:10 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 26F7E100C846
	for <qemu-devel@nongnu.org>; Thu, 28 Jul 2016 10:04:07 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id DAC155C0098;
	Thu, 28 Jul 2016 10:04:03 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-7-git-send-email-clg@kaod.org>
	<1469682716.5468.114.camel@aj.id.au>
	<947a8251-7bb6-ea6e-8bd0-05bdd89b9bc0@kaod.org>
	<1469692703.5468.125.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <81cfd17c-ee36-6ba1-7c63-7046d935ea06@kaod.org>
Date: Thu, 28 Jul 2016 10:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469692703.5468.125.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 13580323204890069936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.122.254
Subject: Re: [Qemu-devel] [PATCH 6/6] arm: add support for an ast2500
 evaluation board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 78wvtbC5HEZl

On 07/28/2016 09:58 AM, Andrew Jeffery wrote:
> On Thu, 2016-07-28 at 09:15 +0200, C=C3=A9dric Le Goater wrote:
>>> =20
>>> Also, the meaning of the bits have changed from the AST2400 - they
>>> probably should be documented somewhere?
>>
>> So you want me send to an updated version of :
>>
>>         http://lists.nongnu.org/archive/html/qemu-arm/2016-06/msg00698=
.html
>>
>> as a prereq ?=20
>=20
> I mentioned this in passing due to the discussion on my original patch.
> I think we discussed this separately and concluded the macros were
> pretty verbose given they are sort-of single-use given the value
> doesn't change. Maybe just comments as Peter was requesting? You have
> the patch below but some of the macros will be different for the
> AST2500.

yes.

> I'm probably leaning towards comments over macros, but don't feel
> strongly either way.

ok. having a correct value is a minimum and this is not the case=20
in this patch. I think I will go for the comments for now as We=20
have not merged anything in mainline uboot yet.

Thanks,

C.

