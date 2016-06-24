Received: by 10.25.21.96 with SMTP id l93csp809410lfi;
        Thu, 23 Jun 2016 19:05:11 -0700 (PDT)
X-Received: by 10.55.78.16 with SMTP id c16mr1975049qkb.48.1466733911558;
        Thu, 23 Jun 2016 19:05:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si3024300qkh.203.2016.06.23.19.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 19:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGGUZ-0007Cy-1D
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 22:05:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGGUU-0007BE-1C
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 22:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGGUP-0002dQ-Nf
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 22:05:04 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGGUN-0002XG-BK; Thu, 23 Jun 2016 22:05:01 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8DA08A7C;
	Thu, 23 Jun 2016 22:04:45 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 23 Jun 2016 22:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=BAPpb
	tXW++0XiUAWlt5f2IvbE6Y=; b=S/UBB3tMehN1ddWYWuWe507NIF5qKlWRbgYSg
	XO0Th/CyyUK7yDK//UsPUARFrzXSNUmwQvrPmQYGsApNWPBwK4suHof5p67RRx+Z
	8wN1xP09hBNme2XYGhKhnGqtRVEjn2yJZigt0Kh65TDPdzH66cF6MXjk0huPzM6V
	4Hf0Qw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=BAPpbtXW++0XiUAWlt5f2IvbE6Y=; b=or2i+
	Sfm/ewtMn3X0od/UQQEFbzvruklzWVDeDbNqdHmYeo+2VMhoovYhEWA74h3dNWBR
	hZ6ad0L0Lzh1gXkoi/2FzZTL+yjufQip2vJ2Re3UUSmt4N3t/Fc8A+nYraHyvwC7
	9muu3UwMLnkRWZc2Sz+TRXv25lloXh9fLzMiws=
X-Sasl-enc: ggg0vNr1J9KGfjRn5zpssKvvO5L4RS+fo5aE/cyA5WDx 1466733881
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8E947F29F3;
	Thu, 23 Jun 2016 22:04:38 -0400 (EDT)
Message-ID: <1466733871.23740.111.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 11:34:31 +0930
In-Reply-To: <CAFEAcA9MYTmTRsj1ga-Vu0yrunytvY9rAUDwHR3ziY2oHWNYpg@mail.gmail.com>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA9MYTmTRsj1ga-Vu0yrunytvY9rAUDwHR3ziY2oHWNYpg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iCjhPVV1IdiIPjiWO/wB"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/misc: Add a model for the ASPEED
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QI+DS9YnUF1U


--=-iCjhPVV1IdiIPjiWO/wB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-23 at 18:42 +0100, Peter Maydell wrote:
> On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > The SCU is a collection of chip-level control registers that manage the
> > various functions supported by ASPEED SoCs. Typically the bits control
> > interactions with clocks, external hardware or reset behaviour, and we
> > can largly take a hands-off approach to reads and writes.
> >=20
> > Firmware makes heavy use of the state to determine how to boot, but the
> > reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> > property is exposed so that the integrating SoC model can configure the
> > silicon revision, which in-turn selects the appropriate reset values.
> > Further qdev properties are exposed so the board model can configure th=
e
> > board-dependent hardware strapping.
> >=20
> > Almost all provided AST2400 reset values are specified by the datasheet=
.
> > The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> > successfully initialised to avoid unnecessary dark corners in the SoC's
> > u-boot support.
> >=20
> > +static Property aspeed_scu_properties[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT32("silicon-rev", AspeedSCUSta=
te, silicon_rev, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState=
, hw_strap1, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState=
, hw_strap1, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> > +};
> You don't seem to specify in the board layer or the SoC layer
> any of these except hw-strap1, so should the default values
> for these really all be zero?

Both strap register default values are 0 according to the datasheet.

>=20
> I suspect silicon-rev at least should either have a default
> value specified here, or have the SoC layer specify it.
> (It probably should not be specified at the board level.)

I intended to set silicon-rev in the SoC layer, so I'll fix patch 2/3.
With the addition of sanity checking in the SCU's realise() we'll catch
the case where it's an invalid value (eg 0). I don't think it's right
to plow ahead with an unexpected configuration if a chosen default
value doesn't match the SoC at hand.

Maybe I shouldn't send patches with a heavy head cold :/

Cheers,

Andrew
--=-iCjhPVV1IdiIPjiWO/wB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXbJUvAAoJEJ0dnzgO5LT5I4oP/20HU2XwQO2RjAvucWTOPteq
cIHuRwxZY7rkcApdOgGs/1IXHfJ/PIr5wO93ql+Bz3jXLIYb/g8KNQc/KIfB9RjZ
ywANoO93tH9XscHLWJ3h+qvJ54t8q8VusXrPm0wN3aZB9PC63eUfWMKmJyTP/Pzd
Ps39VUzRTfc1o/NAcHo8M3sTobo/lyk4Z25FirFhnVvDz+g0drialgXMo8NTEHrD
nrA85KtxlOl74CoCQTk/GY3+NiqA3JSGVJ9rRxwIgl8sTQxZfjHcMaJnnXCLk2DO
6OCfjtDpljbVI6Hdq2fswvEeoEuif6Mz/Ki0cSAO060kb+n+R+S+rkwpfv+3zllF
8ILWFHV+JUNjrAB7nL8Hjkq2u1Pub1uQVNI14SJp9R4UU9Im2qKly1l0tn4fCXat
YLUxho0Xdq0hCPks3uLIrR6rqpMMM7gpytIXa7q0KDbtVt10H2AOKJ0tn6fZteDP
wo0BkzhR6aUxtKSIdgNZlDGctrBGGpsYKyvETl6Z7ds7+ZTev0lkdv7DbS6zeORS
5/sduvLP13FWNqA6Kyz2J+iXITowPJaEbLtW7uQyxgA3qZkcU3zj/t9UudhGDVqS
pnqF8UEl3xTS7hBeoXMeZnxYQf7CLRa8T2x002n5YOFT0O5cELg9m8Mkg5NzJsIn
39zUcQMu6SX/fwcjgCQo
=encd
-----END PGP SIGNATURE-----

--=-iCjhPVV1IdiIPjiWO/wB--

