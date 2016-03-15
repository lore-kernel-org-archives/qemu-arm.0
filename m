Received: by 10.25.208.211 with SMTP id h202csp859624lfg;
        Tue, 15 Mar 2016 16:09:52 -0700 (PDT)
X-Received: by 10.140.25.161 with SMTP id 30mr878703qgt.73.1458083392776;
        Tue, 15 Mar 2016 16:09:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si166692qkb.15.2016.03.15.16.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 16:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:52013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afy64-0004AB-81
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 19:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afy61-00049r-Ev
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 19:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afy5y-0005Sn-8L
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 19:09:49 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:50293
	helo=homiemail-a100.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afy5y-0005Sf-0C; Tue, 15 Mar 2016 19:09:46 -0400
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 7ACC531A073; 
	Tue, 15 Mar 2016 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=fbl0Zsb+JsmTThspaRJCP
	keeH/0=; b=iwBaTN97Op4IM+cYLcRS3i7BDt9zXKMR2lHq0WbqcMqcreGLswJsn
	xq2rVfMYCOFVGDrHg+Ngr5aufCALu+igZM4LQSg+y+ktIzThlpgBAFj/VywpACVC
	Fz4mdH99cQ3Ivh1TgDAHJKh0KLGuEGMyi0n7TRPEGP29954Amtw/Vo=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id D8DB631A070;
	Tue, 15 Mar 2016 16:09:42 -0700 (PDT)
Message-ID: <1458083378.29435.38.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Jeremy Kerr
	<jk@ozlabs.org>, Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 09:39:38 +1030
In-Reply-To: <56E7E31B.20703@kaod.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<56E790E2.7040006@ozlabs.org> <1458018080.29435.20.camel@aj.id.au>
	<56E7E31B.20703@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qLURuG+dcgsAnKkSHi0E"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v4 0/4] Add ASPEED AST2400 SoC and OpenPower
	BMC machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: andrew@aj.id.au
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Asv5dA0rLLV


--=-qLURuG+dcgsAnKkSHi0E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-03-15 at 11:25 +0100, C=C3=A9dric Le Goater wrote:
> On 03/15/2016 06:01 AM, Andrew Jeffery wrote:
> > On Tue, 2016-03-15 at 12:34 +0800, Jeremy Kerr wrote:
> > > Hi Andrew,
> > >=20
> > > > This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] t=
o
> > > > boot an aspeed_defconfig Linux kernel[1][2]. Specifically, the seri=
es
> > > > implements the ASPEED timer and VIC devices, integrates them into a=
n
> > > > AST2400 SoC and exposes it all through a new opbmc2400 machine. The
> > > > device model patches only partially implement the hardware features=
 of
> > > > the timer and VIC, again mostly just enough to boot Linux.
> > >=20
> > > Awesome! Nice to have these patches escaping the lab :)
> > >=20
> > > In terms of naming suggestions: I think this depends on what we're
> > > looking to emulate here. I see two options:
> > >=20
> > > The qemu platform becomes a "reference" for OpenPOWER bmc hardware, b=
ut
> > > doesn't necessarily align with an actual machine. In that case,
> > > something generic like opbmc- would make sense.
> > >=20
> > > On the other hand, if we'd like to create qemu platforms that represe=
nt
> > > actual machines (eg, the OpenPOWER "palmetto" machine), then
> > > -bmc would seem more appropriate. In this case, the machine
> > > name would be palmetto-bmc. No need to include the SoC name in that, =
as
> > > it's defined by the hardware implementation.
> > >=20
> > > I think the latter option may be more generally useful.
> >=20
> > Okay, agreed, I'll rework the change to use palmetto-bmc for the
> > machine name. Thanks for the feedback.
>=20
> Yes. palmetto-bmc is good choice. Palmetto is a reference machine
> for OpenPOWER.=20
>=20
> May be change also :
>=20
> +    mc->desc =3D "OpenPOWER AST2400 BMC (ARM926EJ-S)";
>=20
> to reflect that choice.

Will do!

Thanks,

Andrew
--=-qLURuG+dcgsAnKkSHi0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6JYyAAoJEJ0dnzgO5LT52jUP/j0AdlifQILay2t/FyCy/PVQ
CcX8Ks5ecLVUMMZ3tLwYDZX/VMbQSkT38O9yDllAxhMlIqPNI8N5FrWTZUg/BAk1
umlTNKBo6t9OKZjKB+otk96OUQquG/WzlljISFhXtx6pWmUkxNMm0kWKcwjumBcr
xnEBv2V0D1gs56AKIvfDTOp0BFRnMDaeDo1z5BxSyDGMSDHbzT7fAb2Lxnvi4PhE
lsMd858KOm1cL+EdXOlsG7ozhbrf3n6nn5efA+JQyGDXQGSpCNjUod+R87CxTzxb
Vg4mBkRsHB7hRDtX/adlQghe//eoFvYTHKj2JYEQOdsAIJTvAX41J2soRMqDqe/u
BxGBUaKfsiDNYG45uUfsvtdvevy0pYroJzycdTHeTezx+Ewv8PNHkb4cLcKJx4Rd
Y1G2rluechKNLfu9JjN9tT2jf4ycmm13W2W0TLIQQ2X+5Sk1iBeN8Osbyhfmhcb1
xHI44IMzaoyIg0sxrPiH8XmtZMUhRL61cE9mQXLwefxv5Urt65o9pyhwkQodvheN
Y9ICYu2PdJg5H9jyguE2h1SacJqzAbAcvj9SDuh2DlRHW3dcCW4raPLIptZrWA6r
5Hrd0hUGwjIyDBgLzaQcBrfChWu/4Srd76Zz8P6Mc6qVIix8qoX/+XgdO8I0YAsp
kiFyV2gPaN/XiXUagSB6
=A9jg
-----END PGP SIGNATURE-----

--=-qLURuG+dcgsAnKkSHi0E--

