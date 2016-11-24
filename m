Received: by 10.25.150.194 with SMTP id y185csp2836249lfd;
        Wed, 23 Nov 2016 16:15:33 -0800 (PST)
X-Received: by 10.200.39.51 with SMTP id g48mr5117605qtg.256.1479946533563;
        Wed, 23 Nov 2016 16:15:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si20778366qkg.268.2016.11.23.16.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 16:15:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9hhN-0005vF-20
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 19:15:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1c9hhJ-0005ti-DT
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 19:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1c9hhE-00011U-FK
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 19:15:29 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1c9hhE-00010X-4F; Wed, 23 Nov 2016 19:15:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2731820698;
	Wed, 23 Nov 2016 19:15:22 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 23 Nov 2016 19:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=Bkz4WwNLOTLEVvuUiM0jjLcCp5A=; b=KfKMpc
	5V+BYoV9t5OiCHtnQhLJ2W8CN5n0uQlJn+pA5784rWPWP7g5IqZEDdawtiGTWyZw
	5zTbYgVLhPW601tt+qNE7y9FV4jBjLVWabyDvLAMEQ1aNtK+gSNbqYBd+alB9mrV
	4zaSvhPxUiACYj2tvRdUmCs3UE6k+t/vJAD+k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Bkz4WwNLOTLEVv
	uUiM0jjLcCp5A=; b=aBSBi04gidtarl/73yGD2dMJ7QVqOcwgTER6tvqo6e/yrn
	Z4gueyf7oVeZZ03lTIqn0YzpDYcdaEpbZYNOnybmxulgy7jnP11c3OZ/mWQ5QY+G
	8mSbD+rl8oxiHK7CeLCGUyDOk10VPUFpq4K7pesvp+44zC8NujIjMv8B7lXmo=
X-ME-Sender: <xms:GjE2WBZvS6JSyUVdMRUvoq_mh-4RifZhxR2v1ZPOrUxuNvYQgbsnZQ>
X-Sasl-enc: DM0FY0Idwvsdq72H5iOUyANrPHK8nn0QehuFG7cT4yw5 1479946521
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7B1CB7E9B9;
	Wed, 23 Nov 2016 19:15:19 -0500 (EST)
Message-ID: <1479946512.2503.48.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Alastair D'Silva
	<alastair@au1.ibm.com>, qemu-arm@nongnu.org
Date: Thu, 24 Nov 2016 10:45:12 +1030
In-Reply-To: <db1b87d9-8e3a-af86-a7ac-c960698f606e@kaod.org>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-5-git-send-email-alastair@au1.ibm.com>
	<948f93ef-50d3-a450-c69f-faefd078f00d@kaod.org>
	<1479861992.11116.112.camel@au1.ibm.com>
	<db1b87d9-8e3a-af86-a7ac-c960698f606e@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wL8Ychlz1rxCR2Xie8vt"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7h7Sd/ESsAk


--=-wL8Ychlz1rxCR2Xie8vt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-23 at 09:48 +0100, C=C3=A9dric Le Goater wrote:
> On 11/23/2016 01:46 AM, Alastair D'Silva wrote:
> > On Tue, 2016-11-22 at 17:56 +0100, C=C3=A9dric Le Goater wrote:
> > > On 11/17/2016 05:36 AM, Alastair D'Silva wrote:
> > > >=20
> > > > > > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > >=20
> > > > Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
> > >=20
> > > If this is a board device, we should include it under a machine
> > > routine.
> > >=20
> > > Is that for the palmetto ? The ast2500 does not have a RTC.
> > >=20
> > > Thanks,
> > >=20
> > > C.=C2=A0
> >=20
> > Ok
>=20
> =C2=A0
> I suppose we could change aspeed_board_init() to return=C2=A0
> a AspeedSoCState* and use the soc object in the specific=C2=A0
> <machine>_init routines to add devices.=C2=A0
>=20
> Andrew, what is your opinion on that ?=C2=A0

I see the I2C bus configuration as a declarative problem. In a similar
vein we already have AspeedBoardConfig, so I think we should try to
describe the buses and attached devices there. That way we can have a
generic aspeed_i2c_bus_init() routine that we call inside
aspeed_board_init().

This would avoid encoding the buses and their slaves in the board-
specific init code.

Is that a reasonable alternative? I agree that we need to use a
different approach to that which the current patch is using.

Andrew
--=-wL8Ychlz1rxCR2Xie8vt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYNjEQAAoJEJ0dnzgO5LT5g2oP/3/EvqS6pMvFEQFUklCQvQV/
TczhrNUktOaQyWm4C2hO+Jg6AjYDz1Qpt3iPxhv0pUW3BuZkB3Wuar4Td/GtBlkQ
Zgc7ERGsnZzp9IysxTcBIJdCwWF7SZIoPuHnpDLeIwgmG80vJPit+9yzLFGu9Tb6
TRNU7idNJzHYyId5xoPu7u/WpH8AVGMQiVxwLNIsdqEHPys29SFu893oszHVdLGK
NOp1QFyzMtYtEkOaLRJKL4wm2lQzaPbatkqu3gFOwWTzZQgci2m+As5iththyTun
pGrjtKLU09afWAlJPhuVBA7yIW4rbLUQXoS2rKqdHKoGoRlnhL0IurqfmYCHpghj
Mxrt/+HUe/0qU0QsLeUwQZfVSTDpSg/HizoA4RAt1T3ye+46ayZscsDi6Azg6mZU
gMqpeha84sowA3oyTQKYL4VwXaY51PabfdjQm0MkBIdk2m/8FN9mGMdT1FKOp6BX
6jYn0XWikWtcQkeOunEgxhCmglggVfXcYrBwbLvsBhFjIUJeXeZMFYr3Smipel71
ECCMRE/l+8eK9OIPLubsCmG3josywh897a6f0qhROVOLIX2jwU+FD6TZQrUJUMu/
A2g0OdoUnguVTkRgYpJ5qzc/PdxLiUSj1oiCcIZCmPzpIOYgG8n78CxDV4Ei9dbi
UN3J3smzRURTUKPbh16L
=SFLC
-----END PGP SIGNATURE-----

--=-wL8Ychlz1rxCR2Xie8vt--

