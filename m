Received: by 10.25.21.156 with SMTP id 28csp1078691lfv;
        Thu, 28 Jul 2016 18:16:44 -0700 (PDT)
X-Received: by 10.200.40.99 with SMTP id 32mr61122541qtr.97.1469755003940;
        Thu, 28 Jul 2016 18:16:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v94si10302649qtd.148.2016.07.28.18.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 18:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSwPr-0004yv-8X
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 21:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSwPn-0004yR-Ns
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 21:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSwPj-0007Fa-EM
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 21:16:38 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSwPh-0007Dr-2D; Thu, 28 Jul 2016 21:16:35 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 49F211748;
	Thu, 28 Jul 2016 21:16:20 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Thu, 28 Jul 2016 21:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=jvijF
	vZrRhab9HK0Wfu4LIBXNiw=; b=XMViwBoB5azQXD1ra+/dxTxYM6ZT7XJrAtqq0
	RYCk1XEVGIZJj52Z0l8OfhO7p7gCC4YuPLH6pjfRRVneXR1ofMDGJd0Q8Fm2DdCS
	+9kdx/xPuaX9mAsIJNxe1WiRfs57WLsCbUm/XIBX08DgqW0lZSQWbW0D/woIbxhx
	SKwoIE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=jvijFvZrRhab9HK0Wfu4LIBXNiw=; b=ptKE5
	cel2br4pap7zHmcaWNVklQ+gc9tEVFyDG/vDwRe2zjhrLpScKtlFJSwxfQSIGR/K
	ydixV1iEcRsNhxd4ogLCbBSGVpSz3uwrOgwtlQP3UMfuTvbayn4l6j4koR8IxxZa
	ZZKkTdcx7l0BONX7X4ppMLAcBWfd5vzV8fT2cU=
X-Sasl-enc: b4oG0sFa+xHZ24+kiNSZhWMX2YeUzbq29xP4fQ3BqLH/ 1469754979
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 014CFF29F5;
	Thu, 28 Jul 2016 21:16:17 -0400 (EDT)
Message-ID: <1469754973.5468.149.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 10:46:13 +0930
In-Reply-To: <9316329d-c22d-aab1-c5d9-e10ab306ffb8@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-2-git-send-email-clg@kaod.org>
	<1469672053.5468.81.camel@aj.id.au>
	<9316329d-c22d-aab1-c5d9-e10ab306ffb8@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9aThMwXhVcOD38W4d9L8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.224
Subject: Re: [Qemu-arm] [PATCH 1/6] palmetto-bmc: add a "silicon-rev"
 property at the soc level
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
X-TUID: hweFsBGpfBrl


--=-9aThMwXhVcOD38W4d9L8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-07-28 at 09:51 +0200, C=C3=A9dric Le Goater wrote:
> On 07/28/2016 04:14 AM, Andrew Jeffery wrote:
> >=20
> > On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
> > >=20
> > > The SCU controler holds the board revision number in its 0x7C
> > > register. Let's use an alias to link a "silicon-rev" property of the
> > > soc to the "silicon-rev" property of the SCU controler.
> > >=20
> > > The SDMC controler "silicon-rev" property is derived from the SCU one
> > > at realize time. I did not find a better way to handle this part.
> > > Links and aliases being a one-to-one relation, I could not use one of
> > > them. I might wrong though.
> > Are we trying to over-use the silicon-rev value (it would seem so at
> > least in the face of the link/alias constraints)? We know which SDMC
> > revision we need for each SoC and we'll be modelling an explicit SoC
> > revision, so should we instead set a separate property on the SDMC in
> > the SoCs' respective initialise functions (and leave silicon-rev to the
> > SCU)?=C2=A0
> This is the case. no ?=C2=A0

No, because you are selecting the SDMC configuration from the silicon-
rev rather than letting e.g. the SDMC configuration define which
silicon-rev the SoC takes.

My thinking is the silicon rev is a property of the SoC. The platform
should select a SoC to use and not be setting silicon revision values,
that is I think it's a layering violation for the platform to be
setting the silicon-rev (and also the CPU).

We also wind up in a situation where the ast2500 soc identifies as an
ast2400 in TypeInfo.name due to the approach to reuse by this series.

>=20
> SCU holds the silicon-rev value. The patch adds a property alias to the=
=C2=A0
> SCU 'silicon-rev' property at the soc level. This is convenient

Right, but "convenient" here is a bit of a stretch given we are
subsequently fetching the value out of the SCU to select the SDMC
configuration. You might argue that it's due to limitations of the
property alias/link API, but maybe we could rearrange things so this
goes away.

>  for the
> platform to initialize the soc. This is similar to what the rpi2 does,
> which goes one level in the aliasing.

Okay, maybe I'm barking up trees unnecessarily.

>=20
> Then, at initialize time, the SCU 'silicon-rev' property value is read
> to initialize the SDMC controller. If we have more controllers in the=C2=
=A0
> future needing 'silicon-rev,=C2=A0=C2=A0we could follow the same pattern.=
 Not=C2=A0
> saying this is perfect.=C2=A0
>=20
> What I would have liked to do, is to link all the 'silicon-rev' do
> the SCU one. I did not find a way.

Yes, that would be nice. I did briefly poke around to see if there was
a solution to the link/alias issue but it seems not.=C2=A0

>=20
> >=20
> > My thought was the silicon-rev value is reflective of the SoC
> > design rather than the other way around - but maybe that's splitting
> > hairs.=C2=A0
> ah. is your concern about which object is holding the value ? If so,
> I thought that keeping it where it belongs on real HW was the better=C2=
=A0
> option, that is in SCU, and then build from there.

No, that's not my concern, but I agree that it would not reflect the
hardware if there was a property on the SoC (i.e. there is nowhere
besides the SCU that the value is held).

>=20
> >=20
> > It would also be trading off a bit of ugliness in this patch for
> > potential bugs if the properties get out of sync.
> This is the exact the purpose of the patch ! I failed to make it feel
> that way :)

Right. I think we need another layer of abstraction, essentially a soc
configuration struct that is accessed by what are currently the
ast2400_{init,realise}() functions. This will capture differences like
changes in IO addresses, changes to IP behaviour, the CPU types and
ultimately the silicon-rev value. What is now ast2400_init() and
ast2400_realise() can become generic aspeed_soc_{init,realise}(), and
then we wrap calls to this up in SoC-specific
ast2{4,5}00_{init,realise}() where we set the configuration struct. It
is a bit more work but I think the result would better reflect the
hardware and avoid introducing what feel to me like layering
violations.

Thoughts?

Andrew
--=-9aThMwXhVcOD38W4d9L8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmq5eAAoJEJ0dnzgO5LT5Fe8QAKSBS94yGEGhYg+t0IjEfOCD
fyi7f+qhqg16EkUjntvK1TFjA/nAUSv6HryI9yLkYV6ZOdSKak8RturpNrnWwZFv
oTDMP/rKW43m5BkoHyJUxGqPlhBI6QtZDiLRTC55BBBhw2I+LZmkeEk51LcrA5GC
FZADtRdr6QUdpCKvLqsc11hYxTbSnxNbrXuWZzy9fMDJHcNDyrJsA+go78CLvG6H
+eDsCM+L08s7lP1vnM5GY1On6a0Iu+vMMQvplC77SK9VisEJ9VMGsdFOGwGXQO+u
ReePPyWf8CbAYy0880Fec+NDGQGfuvJ28tXUITtkDqfa57AdHVKXBvCoBMBRKYs4
HJk8vSIr8TRVZgI54kimBqSNk4Obfd/0lrqOKzPGXEkXN0X8To5YaejHGXIOpBpf
daUgy9rAJJXNtMkKCYUtuDg0y1dKrTuLLMY+nHT3XClnAhpwtOuaVVw9wqUjk6v7
5h1WayDVNCa5mkbPJwlCswQdStmDBYQVFm2feVgYRqxXclfLnnfrIFaqHUTQmMc2
x68O90Gj+uNF9G4gquZN3M784VPJ10eMx3KpxDBVOPPkN3uOH0Mllby2CCc63KK4
Lv6SBknk96AMmg8KUxy5KqSgHmgEqA6QvTkoBE2HDdcJHS4RiRYewQuPj+5T7MKl
AnB9LoAw5pua36FE/fQG
=J/wh
-----END PGP SIGNATURE-----

--=-9aThMwXhVcOD38W4d9L8--

