Received: by 10.25.21.156 with SMTP id 28csp665267lfv;
        Thu, 28 Jul 2016 00:58:57 -0700 (PDT)
X-Received: by 10.237.36.173 with SMTP id t42mr54730517qtc.89.1469692737308;
        Thu, 28 Jul 2016 00:58:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32si7191574qtl.100.2016.07.28.00.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSgDY-0008GQ-Rr
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSgDU-0008FP-Rc
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSgDQ-0004oI-08
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:58:52 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:42994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSgDN-0004jy-KO; Thu, 28 Jul 2016 03:58:47 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6CFE5BC3;
	Thu, 28 Jul 2016 03:58:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Thu, 28 Jul 2016 03:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=l9YVr
	Umr9L5IIpu466RsBpP0nV8=; b=hsGF4SFz9RQxYXVbxNfzXbJnY/2LCdu8VfoJA
	6Tlx6Ti+NwCbmPa82DMspTylj3pXm8u2RGLNcEtcGKCwmaHIQnasyzvf9upG0v8j
	j1QzWZrVtwf1LcOXGD3S/Uc6rAfDjT9LjIXMJ/X+xvaxn3D7sw8AdmBxCTuZj+Nb
	/RvD+8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=l9YVrUmr9L5IIpu466RsBpP0nV8=; b=VT3Oi
	EiKLe2ka6xGcJeU6t8/SNMy2OpEFDH25/AZoibP+gf9Lud0duiu+YN/CnhonRl63
	OrtJHXanUqydLENY/Zzy6l994A17UKw9bG9h2Zz/PE1Onn/2rtZmVJkNKCxD4Xey
	gBJxa23aI/jYxEQK2Jk+dLUiiL8iBpYHSE3Bag=
X-Sasl-enc: 5nKnd/sLfhxqIuqNgb4GBoOMYx5CdhB/CsbbRiZYPXb9 1469692712
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 06F31F29F4;
	Thu, 28 Jul 2016 03:58:30 -0400 (EDT)
Message-ID: <1469692703.5468.125.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 17:28:23 +0930
In-Reply-To: <947a8251-7bb6-ea6e-8bd0-05bdd89b9bc0@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-7-git-send-email-clg@kaod.org>
	<1469682716.5468.114.camel@aj.id.au>
	<947a8251-7bb6-ea6e-8bd0-05bdd89b9bc0@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tc+i+4+3W3l5ItKE/1W1"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
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
X-TUID: HsQO6B5dDnKb


--=-tc+i+4+3W3l5ItKE/1W1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-07-28 at 09:15 +0200, C=C3=A9dric Le Goater wrote:
> >=C2=A0
> > Also, the meaning of the bits have changed from the AST2400 - they
> > probably should be documented somewhere?
>=20
> So you want me send to an updated version of :
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0http://lists.nongnu.org/a=
rchive/html/qemu-arm/2016-06/msg00698.html
>=20
> as a prereq ?=C2=A0

I mentioned this in passing due to the discussion on my original patch.
I think we discussed this separately and concluded the macros were
pretty verbose given they are sort-of single-use given the value
doesn't change. Maybe just comments as Peter was requesting? You have
the patch below but some of the macros will be different for the
AST2500.

I'm probably leaning towards comments over macros, but don't feel
strongly either way.

Andrew

>=20
> Now that we have done the cleanups in U-Boot, we can pull from :
>=20
> https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/arch/arm/i=
nclude/asm/arch-aspeed/regs-scu.h
>=20
> to get the definitions. I will add that.
--=-tc+i+4+3W3l5ItKE/1W1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmbsfAAoJEJ0dnzgO5LT5fpcP/0VT9U8cl8CJ+iCR+oGcHN9p
QuMFnyUU/umejpiL5Ea3C6Ibnj0SEeiFCRe55BQnLC76cok1p1+zo6KN8Fa5yrgh
hhIgaV5zs0nRATuKnBcNIMvn82OD3KqKgFUugt7NpuTZYcAd9dTlMkfliONBITq0
19fsQ7cKLPoSQLsoCzGAq2RW7lWBQAraE3dKCPbJZkuvFnRtXvmSdw/rSbRwE4qz
XbAXJlpNx1Tv6Ht5H1oFKotFAudQeeKwrAL/Nf/DvJg/MAxCtzs7wYpfylbO9C9+
Ge4XZ4dPGybp14PuCurytDvqgEu9VzqGinGG8WaK1rYp096Se21/yblqw0TtTjmZ
GCk7jXr8T3o93K3kpiOA9ZgYwaHnViUghy9XmEV/Z5fTUyREAd92RqY5nejcMr9p
PyC8gdPmIutyjuTCUpjWXPINGVzTm9+thbXcs2uMmkowciZtX7zC7a+Kfy3jBqTf
ER9ZFYA6hp3stpxLJ1FM+xzClGvnSIefz9O0393dBQqD+RMYyZWawAOvPP7S7Po/
UmxyLUn48vE+s26uBx75YZOS6ZBvQsqwfseNggWsUxyuE9KcwlfUEOEDYrvyVOFz
eZlFO84ea/7wSD3tst0zE4ehrJmBK4xshOW0cVQ9XSKDsvZX4xY5T3tR4HIy29PL
V/lIAWxusOcIGzHoR5Zl
=cqoG
-----END PGP SIGNATURE-----

--=-tc+i+4+3W3l5ItKE/1W1--

