Received: by 10.25.21.156 with SMTP id 28csp2368752lfv;
        Sun, 31 Jul 2016 17:31:05 -0700 (PDT)
X-Received: by 10.233.216.2 with SMTP id u2mr66552367qkf.203.1470011465660;
        Sun, 31 Jul 2016 17:31:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z68si18682446qka.194.2016.07.31.17.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Jul 2016 17:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bU18L-00044f-3k
	for alex.bennee@linaro.org; Sun, 31 Jul 2016 20:31:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bU18G-00044a-Dv
	for qemu-arm@nongnu.org; Sun, 31 Jul 2016 20:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bU18D-0000mt-6x
	for qemu-arm@nongnu.org; Sun, 31 Jul 2016 20:31:00 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:39698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bU18A-0000lW-OI; Sun, 31 Jul 2016 20:30:57 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 37F4625DD;
	Sun, 31 Jul 2016 20:30:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Sun, 31 Jul 2016 20:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=DCSic
	xJAR5Cf5mCi37IF5ZoT730=; b=jX31X6POF9BA1cPQJn7VlplTFa/uI0sPkdHkS
	KAJHBAP3jQvRVK0VQLCuDXqYTcRCmhYhynglHvtTJFWwONgAHfC0j1IG4+1DY7mP
	UE3vR6iqBDktVhr3Krw4zPbEZcwmQb+VY813OKOUgPHWrl4hghF2jx1elLKIdWo/
	3571fo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=DCSicxJAR5Cf5mCi37IF5ZoT730=; b=antIi
	xamUIUPkuz20kjpeoUWpF4Wt/qRI/qd7RIICkyilJP0HO0cu8NKdMzSrBptlZtvb
	yRgGr641ubFu8ECW/LckjqBR/xLy5SoWcvRiN0yFNPJvQR/GkpAfj7+honafToWh
	tRRffNw3WfheUpq9DtbPUZLcoMvShjdSWx02KI=
X-Sasl-enc: PjzWUgE4ikPJhlb9A4wGcX8mufLHyQXO16sLKgAsy8Eo 1470011437
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id C764BF29E1;
	Sun, 31 Jul 2016 20:30:35 -0400 (EDT)
Message-ID: <1470011431.4428.13.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 01 Aug 2016 10:00:31 +0930
In-Reply-To: <98566db3-da3b-5696-f21c-db031757f83b@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-2-git-send-email-clg@kaod.org>
	<1469672053.5468.81.camel@aj.id.au>
	<9316329d-c22d-aab1-c5d9-e10ab306ffb8@kaod.org>
	<1469754973.5468.149.camel@aj.id.au>
	<98566db3-da3b-5696-f21c-db031757f83b@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FVexGJEQUzfMLBvS82Gr"
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
X-TUID: tEXTXny82YJo


--=-FVexGJEQUzfMLBvS82Gr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2016-07-30 at 10:35 +0200, C=C3=A9dric Le Goater wrote:
> On 07/29/2016 03:16 AM, Andrew Jeffery wrote:
> >=20
> > On Thu, 2016-07-28 at 09:51 +0200, C=C3=A9dric Le Goater wrote:
> > >=20
> > > On 07/28/2016 04:14 AM, Andrew Jeffery wrote:
> > > >=20
> > > >=20
> > > > On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
> > > > >=20
> > > > >=20
> > > > > The SCU controler holds the board revision number in its 0x7C
> > > > > register. Let's use an alias to link a "silicon-rev" property of =
the
> > > > > soc to the "silicon-rev" property of the SCU controler.
> > > > >=20
> > > > > The SDMC controler "silicon-rev" property is derived from the SCU=
 one
> > > > > at realize time. I did not find a better way to handle this part.
> > > > > Links and aliases being a one-to-one relation, I could not use on=
e of
> > > > > them. I might wrong though.
> > > > Are we trying to over-use the silicon-rev value (it would seem so a=
t
> > > > least in the face of the link/alias constraints)? We know which SDM=
C
> > > > revision we need for each SoC and we'll be modelling an explicit So=
C
> > > > revision, so should we instead set a separate property on the SDMC =
in
> > > > the SoCs' respective initialise functions (and leave silicon-rev to=
 the
> > > > SCU)?=C2=A0
> > > This is the case. no ?=C2=A0
> > No, because you are selecting the SDMC configuration from the silicon-
> > rev rather than letting e.g. the SDMC configuration define which
> > silicon-rev the SoC takes.
> >=20
> > My thinking is the silicon rev is a property of the SoC. The platform
> > should select a SoC to use and not be setting silicon revision values,
> > that is I think it's a layering violation for the platform to be
> > setting the silicon-rev (and also the CPU).
> >=20
> > We also wind up in a situation where the ast2500 soc identifies as an
> > ast2400 in TypeInfo.name due to the approach to reuse by this series.
> OK. To be cleaner, we could add a AspeedSoCClass and a set of predefined=
=C2=A0
> subclasses for each revision we support, that we would instantiate at the=
=C2=A0
> platform level.

Yes - an AspeedSocClass is the way I went when I briefly started to
sketch out a patch to make my thoughts more concrete.

> =C2=A0=C2=A0
> The AspeedSocClass would be similar to the AspeedBoardConfig struct in=C2=
=A0
> the current patchset, plus the cpu model. How would that be ?=C2=A0=C2=A0

Sounds good to me, though hw-strap1 still needs to be set by the
platform and not the SoC.

> =C2=A0
>=20
> >=20
> > >=20
> > > SCU holds the silicon-rev value. The patch adds a property alias to t=
he=C2=A0
> > > SCU 'silicon-rev' property at the soc level. This is convenient
> > Right, but "convenient" here is a bit of a stretch given we are
> > subsequently fetching the value out of the SCU to select the SDMC
> > configuration. You might argue that it's due to limitations of the
> > property alias/link API, but maybe we could rearrange things so this
> > goes away.
> yes that would be nicer not to have to re-set the silicon rev of the=C2=
=A0
> controllers of a SoC.
>=20
> >=20
> > >=20
> > > =C2=A0for the
> > > platform to initialize the soc. This is similar to what the rpi2 does=
,
> > > which goes one level in the aliasing.
> > Okay, maybe I'm barking up trees unnecessarily.
> No. your point on the SoC reuse is very valid. I try not to overspecify=
=C2=A0
> too early but I agree I took a little shortcut. I will kick a v3 with
> the above. It should not be too much of a change.
>=20
> >=20
> > >=20
> > > Then, at initialize time, the SCU 'silicon-rev' property value is rea=
d
> > > to initialize the SDMC controller. If we have more controllers in the=
=C2=A0
> > > future needing 'silicon-rev,=C2=A0=C2=A0we could follow the same patt=
ern. Not=C2=A0
> > > saying this is perfect.=C2=A0
> > >=20
> > > What I would have liked to do, is to link all the 'silicon-rev' do
> > > the SCU one. I did not find a way.
> > Yes, that would be nice. I did briefly poke around to see if there was
> > a solution to the link/alias issue but it seems not.=C2=A0
> >=20
> > >=20
> > >=20
> > > >=20
> > > >=20
> > > > My thought was the silicon-rev value is reflective of the SoC
> > > > design rather than the other way around - but maybe that's splittin=
g
> > > > hairs.=C2=A0
> > > ah. is your concern about which object is holding the value ? If so,
> > > I thought that keeping it where it belongs on real HW was the better=
=C2=A0
> > > option, that is in SCU, and then build from there.
> > No, that's not my concern, but I agree that it would not reflect the
> > hardware if there was a property on the SoC (i.e. there is nowhere
> > besides the SCU that the value is held).
> So I understand that the 'silicon-rev' location is not the biggest concer=
n
> and we can keep it as it is in the patchset.

Yes, sounds good. Though with this approach we shouldn't need to fetch
the value out and poke it into the SDMC...

> Being able to alias the=C2=A0
> different 'silicon-rev' properties to a common one would be nice though.

... which means we shouldn't need this behaviour. But it sounds nice
all-the-same.

> =C2=A0
> >=20
> > >=20
> > > >=20
> > > > It would also be trading off a bit of ugliness in this patch for
> > > > potential bugs if the properties get out of sync.
> > > This is the exact the purpose of the patch ! I failed to make it feel
> > > that way :)
> > Right. I think we need another layer of abstraction, essentially a soc
> > configuration struct that is accessed by what are currently the
> > ast2400_{init,realise}() functions. This will capture differences like
> > changes in IO addresses, changes to IP behaviour, the CPU types and
> > ultimately the silicon-rev value. What is now ast2400_init() and
> > ast2400_realise() can become generic aspeed_soc_{init,realise}(), and
> > then we wrap calls to this up in SoC-specific
> > ast2{4,5}00_{init,realise}() where we set the configuration struct. It
> > is a bit more work but I think the result would better reflect the
> > hardware and avoid introducing what feel to me like layering
> > violations.
> >=20
> > Thoughts?
> Looks good. However I don't think there is no need for init() and realize=
()=C2=A0
> ops right now. A .class_data should be sufficient.=20

Right - we should do what is elegant. I didn't poke too deeply, I was
just sketching out something that I thought would demonstrate the
layering.

Cheers,

Andrew

> see this patch [1]. I still=C2=A0
> need to rework that i2c patch btw.=C2=A0=C2=A0
>=20
> We can rework the SoC realize() if the need arise.
>=20
> Cheers,
>=20
> C.
>=20
> [1] https://patchwork.kernel.org/patch/9129887/
--=-FVexGJEQUzfMLBvS82Gr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXnpgnAAoJEJ0dnzgO5LT5AsYQAKiqDObjYKwJC68xP+oEeuIV
pCcxje5So0rgm8h4Z31dTA1HXXWvIEZvyKIbMrjbqWbHkBCC8h9DHN9yEhq60lmG
FPUegpxlJleYEK/OFcVZ7aLpMsJQs/OFTHA0KaKhNQ+ppjTK5Acc1l7RgAa1+SU3
CL0hHPxFo3xOnQcl9tsqpsZYKLbwfCtJSdIplPe4R5HgnxkjFR8aSTuO0ae1CVkW
ZYUwanLaqBvvhfZf19o9s/YmNgMtZAS5S8J4GIOLuFS3kVciRyVRNT0sgOB1iJ4G
q010Pb+z0KyQE7tyGTP5imfRUzYhpktxf3cfIKxUceeOo3Vtki2a9O4nf1rFsndL
JulF8xSuRvZ1cHjNASE6lbyujTrPAdAjGyDsClZ4JPMFFGgN8RUk22KqNoij35so
VuNtrV/CT+rqtepqSD6OoHRL17HKjG3a4XKK9a9VxDN5grn5sne9MLKg3wjspASD
jGeUpeRTMfxsMwSbmsTEXXhNbCdrbZpayxnf0ATThZTEr3/iR2posdXe8HtnJ5DS
OFXdJDo/o9N5zOpLNg48WiSOau0tcWnCIOy1YA3w/HSfFoCjpOl/MKzcSf8GPcMU
Majs+g6A5nPWwNnurvY2w4gifTXdrXpT5qWsUc3lkZO7yS/p9JIeV85c+DCJ21Yj
37T2y7AXOZ9Ku7rI2LMZ
=DHAx
-----END PGP SIGNATURE-----

--=-FVexGJEQUzfMLBvS82Gr--

