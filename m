Received: by 10.25.141.12 with SMTP id p12csp37007lfd;
        Mon, 13 Jun 2016 22:16:46 -0700 (PDT)
X-Received: by 10.237.49.227 with SMTP id 90mr18258314qth.44.1465881406218;
        Mon, 13 Jun 2016 22:16:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si17302556qhe.24.2016.06.13.22.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 22:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCgiT-0004pa-LY
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 01:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bCgiO-0004pF-FE
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 01:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bCgiK-0005L0-Ms
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 01:16:39 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:53858
	helo=homiemail-a39.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bCgiK-0005Kw-B2; Tue, 14 Jun 2016 01:16:36 -0400
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id E0429150074;
	Mon, 13 Jun 2016 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=e+y5sjbBEuA7WLmbC+VsY
	dHQjkc=; b=HUdl4t7h7UaOaMf1gVZA+RU9WYUwBoXEx8aFbx+59vjr3I/F/Tnkk
	76cF4yOO1BXJieo9ik7eoyYIW0oFn57k55tuHCTc9BIgZZclsOl9+GSafAEbswbG
	ACqt/3iQAPA5hpr+rAjD0RHShiSx39pbGT60Tg1SsxkLCQdp6potxM=
Received: from localhost (orion.jms.id.au [119.9.53.35])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id C474C15006D; 
	Mon, 13 Jun 2016 22:16:32 -0700 (PDT)
Message-ID: <1465881389.2644.14.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 15:16:29 +1000
In-Reply-To: <CAFEAcA9OUKDmA_CHXXMOWJCMF+-DeQYvGTY29KRkNktB=nCb_g@mail.gmail.com>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
	<CAFEAcA8+3trGJ=6K8fFX4-2Z1N+ZUiBKUcSTR6fYnQtMfNs3rw@mail.gmail.com>
	<1465520347.16048.180.camel@aj.id.au>
	<CAFEAcA9OUKDmA_CHXXMOWJCMF+-DeQYvGTY29KRkNktB=nCb_g@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Mfb4wUvIwWOxB0HA5QvL"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
X-TUID: tSH6Naw4x67d


--=-Mfb4wUvIwWOxB0HA5QvL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-06-10 at 11:42 +0100, Peter Maydell wrote:
> On 10 June 2016 at 01:59, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Thu, 2016-06-09 at 19:15 +0100, Peter Maydell wrote:
> > >=20
> > > On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >=20
> > > >=20
> > > > Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on t=
he
> > > > palmetto-bmc machine. Two match registers are provided for each tim=
er.
> > > >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > ---
> > > >=20
> > > > The change pulls out ptimer in favour of the regular timer infrastr=
ucture. As a
> > > > consequence it implements the conversions between ticks and time wh=
ich feels a
> > > > little tedious. Any comments there would be appreciated.
> > > Couple of minor comments below.
> > >=20
> > > >=20
> > > >=20
> > > > =C2=A0hw/timer/aspeed_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 135 ++++++++++++++++++++++++++++++----------
> > > > =C2=A0include/hw/timer/aspeed_timer.h |=C2=A0=C2=A0=C2=A06 +-
> > > > =C2=A02 files changed, 105 insertions(+), 36 deletions(-)
> > > >=20
> > > > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > > > index 4b94808821b4..905de0f788b2 100644
> > > > --- a/hw/timer/aspeed_timer.c
> > > > +++ b/hw/timer/aspeed_timer.c
> > > > @@ -9,13 +9,12 @@
> > > > =C2=A0 * the COPYING file in the top-level directory.
> > > > =C2=A0 */
> > > >=20
> > > > +#include
> > > > =C2=A0#include "qemu/osdep.h"
> > > osdep.h must always be the first include.
> > Thanks for picking that up.
> If you like you can run scripts/clean-includes file ...
> and it will automatically make any necessary changes like this to
> your files.

Thanks, I'll add that to my submission checklist

>=20
>=20
> >=20
> > >=20
> > > >=20
> > > > +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint=
64_t now_ns)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t delta_ns =3D now_ns - MIN(now_ns,=
 t->start);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ticks =3D (uint32_t) floor(delta_=
ns / calculate_period(t));
> > > Do we really need to do this with floating point ?
> > I went with floating point to avoid accumulating errors from truncation
> > by integer division. At eg 24MHz truncation increases the tick rate by
> > approximately 1 in 63. We're using floor() here, but that only
> > truncates at the end of the calculation, so the fractional current
> > tick.
> Right, but you only have a risk of truncation because of the way
> you've structured the calculation. You have
>=20
> floor(delta_ns / calculate_period())
> =3D=3D floor(delta_ns / (calculate_rate() / NS_PER_SEC))
> =3D=3D floor((delta_ns * NS_PER_SEC) / calculate_rate())
>=20
> and calculate_rate() returns either 1000000 or 24000000.
>=20
> So you have a 64 bit delta_ns, a 32 bit NANOSECONDS_PER_SECOND
> and a 32 bit frequency. We have a function for doing this
> accurately with integer arithmetic: muldiv64() (which takes
> a 64 bit a, 32 bit b and 32 bit c and returns (a*b)/c using
> an intermediate 96 bit precision to avoid overflow).
>=20
> Doing ticks-to-ns and ns-to-ticks with muldiv64() is pretty
> standard (grep the codebase and you'll see a lot of it).

Right! As I didn't see a concern with floating point prior to sending
the patch I didn't try to rearrange the calculation. I'll rework to use
muldiv64().

>=20
> >=20
> > Having said that, grep'ing around under {,include/}hw/ doesn't show a
> > lot of use of floating point. It looks like we are explicitly avoiding
> > it, however with a quick search I didn't find it mentioned in any of
> > the docs. What's the reasoning? Should I use a fixed-point approach
> > like ptimer?
> My view is that hardware doesn't generally use floating point
> so it's odd to see it in a software model of hardware.

Fair enough.

>  Double
> doesn't actually get you any more bits than uint64_t anyway...
>=20
> >=20
> > >=20
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0return calculate_next(t);
> >=20
> > >=20
> > > Why is this recursing ?
> > The common case is that we return during iterating over seq array i.e.
> > we're anticipating another match event (either from the match values or
> > the timer reaching zero). If not then we've overrun, so we reinitialise
> > the timer by resetting the 'start' reference point then searching again
> > for the next event (iterating over seq). As the search for the next
> > event is encoded in the function, I've recursed to reuse it.
> >=20
> > Would you prefer a loop here?
> >=20
> > Considering the two approaches (recursion vs loop), if TCO doesn't
> > apply we could blow the stack, and with loops or TCO it's possible we
> > could spin here indefinitely if the timer period is shorter than the
> > time it takes to recalculate. Arguably, not crashing is better so I'm
> > happy to rework it.
> Yes, I'd prefer a loop -- TCO is an optimization, not a guarantee
> by the compiler.

Yes, on reflection I agree. I'll rework it.

>=20
> >=20
> > As an aside, the approach for reinitialising start skips countdown
> > periods that were completely missed through high service latency, and
> > there will be no interrupts issued for the missing events. Is that
> > reasonable?
> If the countdown period is so short that we can't service it
> in time then the system is probably not going to be functional
> anyway, so I don't think it matters very much. (In ptimer we
> impose an artificial limit on the timeout rate for a periodic timer
> and just refuse to fire any faster than that: see ptimer_reload().)

I'll leave it as is for v2.

Thanks for the feedback!

Andrew
--=-Mfb4wUvIwWOxB0HA5QvL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXX5MtAAoJEJ0dnzgO5LT56F4P/3C0pmIsfwsr0RaZUc7CQdiN
8j488ThZV1WJlj7pzG8cv7NvBwWOOokJ9ezmJ9S907CQ7oIANoQ552FxsFyruiNi
hkvmgBvwBp+HRwa+FHU6/vFrAYI6kFiJYAD8hY0dZHWRZGao/PZzTh/fq4IvKY/r
tUY69GLMXjWfWb54vksY33PoOWBBmgHlKpb5naV+qPIrtnhjZ4PSDknyE91u1T5g
pDNCuxNAa+UKpzXXmAnLAxm0U0OQEPnz+RyAdMjqYNLjuW/NSJy/1Y9taIT5VdwC
wMcUmeoDNY5AeYlKI+eRGbyuYYBL93v9W516qeTsSXFHPAwW4gF+l8jP/yU41Tx9
TU2TYCRhhncbcjL++M4zw5JUQl/IEoTmnsPLK1kuLtyuN/KpG1ZsrL8Dl7zLUaRQ
TR6gBdqpWsw1PYcUXgjLOnfmknQ+CIcqTr8kkFdCUxbi/ZwYmO+bT7frFIGSNUIR
1UKYb50FYsjxVf0hZsfJYarCH1DUTEpefnDaHmaMYPnh4veGLu/Qdp0sIWkUp9Jg
6t1rB0NPPqSXv2d8L5W47IB5gXEiC0aZD9n/qqntHhILtc9tFDcm0zGGR2z1+DV2
/z6MPKs35BPe2EJvKU5tkFDc74uAbOr8WogrvVSZi4kX8g4sg4EzTQc42BwsOt+D
hiXd21d9cO28VPeI+i9Q
=7NWu
-----END PGP SIGNATURE-----

--=-Mfb4wUvIwWOxB0HA5QvL--

