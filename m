Received: by 10.25.21.96 with SMTP id l93csp1798168lfi;
        Tue, 21 Jun 2016 00:11:30 -0700 (PDT)
X-Received: by 10.55.154.136 with SMTP id c130mr26092949qke.79.1466493090029;
        Tue, 21 Jun 2016 00:11:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si50139686qtb.32.2016.06.21.00.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 00:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFFqL-0001o3-6m
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 03:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFFqH-0001m2-5X
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 03:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFFqB-0003lo-4H
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 03:11:24 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:58572
	helo=homiemail-a23.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFFqA-0003lZ-Jr; Tue, 21 Jun 2016 03:11:19 -0400
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id F0DD94B0084;
	Tue, 21 Jun 2016 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=sMyoOvBwyAeG+Nuu6FW/u
	t0xP/U=; b=inODViTQHl9586LiEuakWtXTLnd8R65lw0nqA2Fg9MBMKT6Xpa38d
	oUn5TQdTl0YAGNqzKMyXybBWx+vQ7ajb1tWTNUMZeDcsq2shfPXMfC/RhSgBV0N3
	h0rmOoBdD1twUmx3fZDDmxbqAKF4t3qyKbukoi3p0aLoWinwe763Ag=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 924EB4B0062; 
	Tue, 21 Jun 2016 00:11:15 -0700 (PDT)
Message-ID: <1466493071.4344.59.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 16:41:11 +0930
In-Reply-To: <CAFEAcA85mf8Rr+rKEm4x0aA3r4XNuRFwHEzXsUk4D-EEwO8WbA@mail.gmail.com>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
	<1466394273.4344.25.camel@aj.id.au>
	<CAFEAcA_=5Dvg9R1o67b-5MuMZWtWbobywA+XzKuR-TeTCWfN0Q@mail.gmail.com>
	<1466480985.4344.50.camel@aj.id.au>
	<CAFEAcA85mf8Rr+rKEm4x0aA3r4XNuRFwHEzXsUk4D-EEwO8WbA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UqdqewCXMeSW+b7zXnev"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Reply-To: andrew@aj.id.au
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mPivrAEM67u


--=-UqdqewCXMeSW+b7zXnev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-06-21 at 07:56 +0100, Peter Maydell wrote:
> On 21 June 2016 at 04:49, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Mon, 2016-06-20 at 14:57 +0100, Peter Maydell wrote:
> > >=20
> > > I think there are a couple of plausible ways you might model this:
> > >=20
> > > (a) just have a single property for "revision" which corresponds
> > > to the revision of this bit of silicon IP within the SoC; the
> > > model of the device itself then knows what the reset state is
> > > for this revision of the device.
> > > (b) ditto, but also have some configurable flags where relevant
> > > (ie approximately where it's the same IP rev within the SoC
> > > but it's been configured by tying down different config lines;
> > > for instance hw/dma/pl330.c has a collection of properties
> > > which match the configurable knobs for the hardware.)
> > Okay. I think (b) is the most appropriate. The board-controllable bits
> > are primarily in the hardware strapping register. The register is
> > composed of fields of mostly unrelated bits, so we could go two ways
> > here:
> >=20
> > (1) expose the register through a single 32bit property
> > (2) break out a property for each bitfield
> >=20
> > Do you have a preference? grepping the tree suggests there isn't a
> > precedent for "large" numbers of properties* so maybe (2) is overkill,
> > but (1) feels like it might fit into the overly-general-interface
> > problem that we're trying to eliminate.
> >=20
> > * Seems the microblaze CPU defines the most with 9 properties?
> (You forgot '-n' on your sort rune.)
> hw/dma/pl330.c has 15.

Ugh.

>=20
> >=20
> > Approach (2) will leave us with 21 properties for the SCU.
> What would the 21 properties be in this case?
>=20
> But yes, a single 32 bit property would probably be better.

Alright, I'll go ahead with that.

Thanks for the feedback.

Andrew
--=-UqdqewCXMeSW+b7zXnev
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXaOiPAAoJEJ0dnzgO5LT53fEP/iiQoUfrExvO7/CwjclASI7z
IZrdPd4XQmYqwRWFUxn9baNFOt5fNRaLlYBaSebC1Yaf0SYcCckBeZDlcIvd6uQl
UgS/fSlycW0R/18sLrjpQodUtAfZRRI9cx4qWzokTnN7MmeLNfMMTHuUb9U1+JR7
frf7vk3dkfGFYKqYxJ5n5kCxp3iNeIiq/WKbQnpb9x0nwe/awqm2+/gkoyTX9K1X
yq2Lzdm+MeVxzh02blHj2WgIRhdt62rxy6rylvniCGpo+dTaE5iCvP2NOCrqUVV6
cF+eTRlxpj1hG8AKa8qEGBzghqHMJ55vyP6sHOG+em4W/jGyUbLIxhHCupPwCH/m
HV4Pcw0GXqTdtCU/owXgscJQ3K4wJRKtwMJbQqSU083qECuR4kp00RN6ToIzpKdO
fdqyMZ2lBBIUw+cKnEWQhgqOUXArhzoXHbCImpw7r7o+J+1n7KkUqfObL4+ZC5FV
I8ufb1IPAd/t8nQmMHT5k32EfLr2u9VtupQMxT96Hotz2rJNd+rLUCUDdzOnrFGc
1LKKEhiraY8msucYZ++OfntuuQ/bet8etwJtRCooj2ZwKrmR9/a6P+6ah2P+qj3d
btUtw0d3f+spZnuJHQAf+BV3vo5v/oChGikE5ICLNi2V4dH/O+lqUFBW588apLli
T+oxO5d37K0f+CcQKQat
=Z9HS
-----END PGP SIGNATURE-----

--=-UqdqewCXMeSW+b7zXnev--

