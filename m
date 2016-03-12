Received: by 10.25.208.211 with SMTP id h202csp1337731lfg;
        Fri, 11 Mar 2016 19:07:01 -0800 (PST)
X-Received: by 10.140.140.196 with SMTP id 187mr16542749qhm.29.1457752021006;
        Fri, 11 Mar 2016 19:07:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s104si11551669qgd.51.2016.03.11.19.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 19:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:58729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeZtM-0005M5-AF
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 22:07:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aeZtJ-0005Lm-RA
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 22:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aeZtE-0006er-Qz
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 22:06:57 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:41533
	helo=homiemail-a17.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1aeZtE-0006en-Fh; Fri, 11 Mar 2016 22:06:52 -0500
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 7EA322B206A;
	Fri, 11 Mar 2016 19:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=Bhw4hNdlRzkTvJQW/Fed6
	BIFHn4=; b=cZnj6jIhJjm076980lkN77JSpDvoX3MPAx+0jgcQp9mjdRFIt2Oaf
	bEvvgD4Cy0OmwrnSurnbpEUF0ltNkcSrY7aGAd0fIkSs8Ka90L5ycLXJirb9nsHX
	9b1iYNicFypsHF4C6HGZps7F+0TLPWMNlTZva0SC28OnTUNX/zRHsM=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id E028C2B2065; 
	Fri, 11 Mar 2016 19:06:47 -0800 (PST)
Message-ID: <1457751999.29435.14.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Mar 2016 13:36:39 +1030
In-Reply-To: <CAFEAcA9PWRYEfTD5TfHJ5aqPgw53Oe145P9B6yDGKGJuSrP_Cg@mail.gmail.com>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
	<1457152177-19550-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA9PWRYEfTD5TfHJ5aqPgw53Oe145P9B6yDGKGJuSrP_Cg@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3iaig4q8yeB/WKXMrPO5"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hw/timer: Add ASPEED timer device
	model
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
X-TUID: uZdkURHuWKDG


--=-3iaig4q8yeB/WKXMrPO5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-03-11 at 15:56 +0700, Peter Maydell wrote:
> On 5 March 2016 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Implement basic AST2400 timer functionality: Up to 8 timers can
> > independently be configured, enabled, reset and disabled. A couple of
> > hardware features are not implemented, namely clock value matching and
> > pulse generation, but the implementation is enough to boot the Linux
> > kernel configured with aspeed_defconfig.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > +/**
> > + * Avoid mutual references between AspeedTimerCtrlState and AspeedTime=
r
> > + * structs, as it's a waste of memory and it makes implementing
> > + * VMStateDescription a little clunky.
>=20
> Not sure what you have in mind with the reference to VMStateDescription
> here. The vmstate struct only has to list the fields which contain
> actual volatile state -- things like backreference pointers to other
> structs aren't volatile state so don't appear.

Good point, looks like I was over-thinking things. I'll remove the part
referencing VMStateDescription.

>=20
> > The ptimer BH callback needs to know
> > + * whether a specific AspeedTimer is enabled, but this information is =
held in
> > + * AspeedTimerCtrlState. So, provide a helper to hoist ourselves from =
an
> > + * arbitrary AspeedTimer to AspeedTimerCtrlState.
> > + */
> > +static inline struct AspeedTimerCtrlState *timer_to_ctrl(AspeedTimer *=
t)
> > +{
> > +    AspeedTimer (*timers)[] =3D (void *)t - (t->id * sizeof(*t));
> > +    return container_of(timers, AspeedTimerCtrlState, timers);
> > +}
>=20
> > +static void aspeed_timer_expire(void *opaque)
> > +{
> > +    AspeedTimer *t =3D opaque;
> > +
> > +    /* Only support interrupts on match values of zero for the moment =
- this is
> > +     * sufficient to boot an aspeed_defconfig Linux kernel. Non-zero m=
atch
> > +     * values need some further consideration given the current ptimer=
 API.
> > +     * Maybe run multiple ptimers?
> > +     */
>=20
> See hw/timer/a9gtimer.c for an example of a timer with a comparator
> that can fire when the timer hits an arbitrary comparator value
> (it doesn't use ptimers but the principle is the same -- you set
> the timer to fire at the next interesting event, and then in the
> timer-fired handler you reset the timer to fire whenever the next
> event after that is, if any.) In any case this is probably ok for now.

Thanks for the pointer. I'll leave that change to a future patch given
it looks like this is converging on being acceptable, though I'll
expand the comment to cover a9gtimer.

>=20
> > +    bool match =3D !(t->match[0] && t->match[1]);
> > +    bool interrupt =3D timer_overflow_interrupt(t) || match;
> > +    if (timer_enabled(t) && interrupt) {
> > +        t->level =3D !t->level;
> > +        qemu_set_irq(t->irq, t->level);
> > +    }
> > +}
> > +
>=20
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

Andrew

>=20
> thanks
> -- PMM
--=-3iaig4q8yeB/WKXMrPO5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW44e/AAoJEJ0dnzgO5LT5pTkP/33uM4LVn5ep6VFeq/8Xa05W
UM5yYDca6VGe2lZHiUYpUg9/j0f2FB8Sel7xg6ymdcWpiYvWXAWkxVTLgmDn794o
oyHyUCGcrf7uD5QJwtQQJNBr7rrmJnUTxAZYR2+xFe5bLRbzllMgrh5gV7eBeYnQ
LyqA5yO7cR0wOoQAMkwFyi45JFKjiqaVKE+TW9zkQ/c3aDnnccJ6eDMGRrxILenU
AKSqTi0PSwTvkuu4fNZ0ObRuDcH6X+i7uwUfmk8eDZLoA1G26lZUe74OW0zGdt4p
X4hKuKjs0QxKr4jSUrNwBCoDRQcSseOsltyUPbf9BohBAbBeCvpauC1EbAEyevLy
JCVIKDS0Wfj8kebEfUviTJoQ/D7ooSbwFx0gkigzVw4iuQ5hsdykB1iw4vxgXQVP
A3O+8ykSgUv7rrehp6/W4kWnnBaHL1Oc4moBtDzWILEPa1xtN3sAKpD2Tdn9Y+6m
JxXtecJdk09eOkN+PwBSdy+IYIkNG7oXY42nDvK4KvComezJG60wbOdpDrWZE5hM
Km+BxyHtN9VaXbY8sfV5vilDnT1u7FjIUyA5pSvWRpIdz9mbaAPfiyTo/O8rZl9j
sGmSgAL52q5JIn+eeoAd/WnLFyqxXCDLQ3Uv2/K2QgZkqQzH/JOQimwFT7JYDsZx
c4bSAB3/z60eT4Tdvm/Z
=uCeF
-----END PGP SIGNATURE-----

--=-3iaig4q8yeB/WKXMrPO5--

