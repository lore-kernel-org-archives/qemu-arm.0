Received: by 10.25.21.96 with SMTP id l93csp1139466lfi;
        Mon, 27 Jun 2016 07:14:34 -0700 (PDT)
X-Received: by 10.55.101.200 with SMTP id z191mr3778511qkb.80.1467036874146;
        Mon, 27 Jun 2016 07:14:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si17305196qke.155.2016.06.27.07.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 07:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHXJ3-000670-Jq
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 10:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bHXIx-00066N-B1
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 10:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bHXIr-0000K3-Rw
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 10:14:26 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bHXIp-0000AF-J2; Mon, 27 Jun 2016 10:14:21 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 72771BC6;
	Mon, 27 Jun 2016 10:14:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 27 Jun 2016 10:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=K/Cv6
	kDNK06Xf0fmkZ+RR5Y3mZ8=; b=cTpqxo0DZTIvR3Haxl+9ZQdzrfMs+pHFRj83K
	SvM/Ujt1oIX7zqRWeUY74R5pX9qrX1ozVp/NVU/XX1BICYeS50avzmv69h0YtfYi
	0imjVm1VDtBaJbs0Mi2GDcsW0bYBvjc18LuzIxwVKDQ0kdRJ8P6HApwNhiguptCh
	s+8408=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=K/Cv6kDNK06Xf0fmkZ+RR5Y3mZ8=; b=RNIZX
	YeicMjPNBumqdYW8jNoalx0VpPsMgFob+XJFSBkbk+SxxEpI25wfpGiFuBdGEOXO
	8xI/6S5gjLKm6XPZKjYvLKksMNUoVStOHqLr85Z72e4bhRzV6Xz0W0iMdMlqEsOw
	tsGU0IQsQ0LCeXTDXQBMunXW1nhMsHfIcVpEXo=
X-Sasl-enc: gpRWjHFvTt5T0v0Ns6I9fBbanzPwJgWd2N3eVQMsSoet 1467036845
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id F3E32F29FE;
	Mon, 27 Jun 2016 10:14:03 -0400 (EDT)
Message-ID: <1467036839.23740.183.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2016 23:43:59 +0930
In-Reply-To: <CAFEAcA_O_vPM=97KYWDcmsT8SeHBrcoi6JsEnp2J0mjEptZJ2A@mail.gmail.com>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
	<CAFEAcA_O_vPM=97KYWDcmsT8SeHBrcoi6JsEnp2J0mjEptZJ2A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0vgj5UzDIWFNF1/PQPD7"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Add ASPEED SCU device
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w/hsU8Gs37EW


--=-0vgj5UzDIWFNF1/PQPD7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-27 at 14:47 +0100, Peter Maydell wrote:
> On 24 June 2016 at 05:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Hi all,
> >=20
> > These are three patches implementing minimal functionality for the ASPE=
ED System
> > Control Unit device and integrating it into the AST2400 SoC model/palme=
tto-bmc
> > machine. The device is critical for initialisation of u-boot and the ke=
rnel as
> > it provides chip level control registers, influencing the configuration=
 of the
> > software and the software's configuration of the SoC.
> >=20
> > Since v2:
> >=20
> > * Fix mixing of offsets and register indexes
> > * Sanity check device property values
> > * SoC actually initialises the silicon revision
> >=20
> > Since v1:
> >=20
> > * Select reset values based on silicon revision
> > * Expose hardware strapping values via properties
> >=20
> > Andrew Jeffery (3):
> > =C2=A0 hw/misc: Add a model for the ASPEED System Control Unit
> > =C2=A0 ast2400: Integrate the SCU model and set silicon revision
> > =C2=A0 palmetto-bmc: Configure the SCU's hardware strapping register
>=20
>=20
> Applied to target-arm.next, thanks.

Thanks; I intend to send a follow-up patch addressing the discussion on
patch 3/3. I'm away for a week so it will miss soft-freeze, but given
the nature of the patch that might not be the end of the world?

Cheers,

Andrew
--=-0vgj5UzDIWFNF1/PQPD7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcTSnAAoJEJ0dnzgO5LT5X40P/3135kOvuM+yHvdGLFnn3yr3
NtgJRcSOFPkzgpUKdONSG2+XkhlY34R71XXBi85GtMGSdCsSi4b9Dfhzipjc3Ed9
i+hmMgNLJTk0TwceIz/4pfjoANEgn0pmaBcVQ7alYhzDd7RfzthV0dztb4OsBlu6
Jha09lxqtjFQJSvGpsrzoHGdIqmXgBVLzC6pDyH5Bw2ASYIwMxV8St62iiIgW1d7
IF/F9mHfb6nuNScen2r8xVHg38Vtd/FuoNTcTMUPqM/gpyXMxCxA5LV558eIAk30
vJJSGc4uR/JdFle1qUIso6Fr0XEymVBqy3sVXKgxO2NUjsGRXL8Xowv8GXf9yr2F
2lZUZ3j6iC+mt0SdGBqGicHfRr8WGeDHHPVOu3V9tTwXoEfYp+N08McHG7CHm1oj
mQxi5TgL1QPeeKsf00sQqXjQZAwJz4QLnPI1XOAtODGj4gJs6H2JvEE+oHzYs+Nr
nXPJbavNGQObbRI4ODm6l+F3HQL44Aw3rcXHBLnIQPNn6vzKIct+2DM/0VYb154v
zXYlWszyviSLLuVn5tImwuP3kSa3D4F1oVUpDsvCdAKCkAcJaKKCy7VPFEJShR4j
NC2ebTkgz8RsLhiqD8WjwWYe0WXXDRB3hSNA4A48+9mNRHIHd3U448YBYW7tHAGg
9dc/UosDIzXD1+nkWZ7N
=/eTX
-----END PGP SIGNATURE-----

--=-0vgj5UzDIWFNF1/PQPD7--

