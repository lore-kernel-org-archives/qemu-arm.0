Received: by 10.25.208.211 with SMTP id h202csp852593lfg;
        Tue, 15 Mar 2016 15:48:59 -0700 (PDT)
X-Received: by 10.55.74.75 with SMTP id x72mr820162qka.100.1458082139661;
        Tue, 15 Mar 2016 15:48:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e95si448717qgd.14.2016.03.15.15.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 15:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:51960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afxlr-0000ca-8G
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 18:48:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afxlo-0000aF-0a
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 18:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afxlk-0003X0-RB
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 18:48:55 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:47596
	helo=homiemail-a23.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afxlk-0003Wr-IQ; Tue, 15 Mar 2016 18:48:52 -0400
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id D0CC94B0063;
	Tue, 15 Mar 2016 15:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=rQmB0oXCBYUf9wAiH2CqD
	bW+EOY=; b=k3kieEzU6fywa8bOD2HMu3qwQ5wisL1SDFqVQB/606KjoW+nknIUc
	nCDniCdYnX78ZCuq8BA8cGYmA131m+VultS5TWCku4QUelUcTWZuz4yVMJsSmEls
	ggtcx2b7ihNxiIkgbAinwH+I+RdzokrshVVZt+EA7JzptT/wmFMfZk=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 1855F4B0062; 
	Tue, 15 Mar 2016 15:48:47 -0700 (PDT)
Message-ID: <1458082119.29435.29.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Dmitry Osipenko <digetx@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 09:18:39 +1030
In-Reply-To: <56E850F9.5080307@gmail.com>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<1457928832-31026-2-git-send-email-andrew@aj.id.au>
	<56E850F9.5080307@gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-luOkRVdxnFvBAAO0YeK9"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [Qemu-arm] [PATCH v4 1/4] hw/timer: Add ASPEED timer device
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
X-TUID: g5ydePiDeeCg


--=-luOkRVdxnFvBAAO0YeK9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, 2016-03-15 at 21:14 +0300, Dmitry Osipenko wrote:
> Hello Andrew,
>=20
> 14.03.2016 07:13, Andrew Jeffery =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Implement basic ASPEED timer functionality for the AST2400 SoC[1]: Up t=
o
> > 8 timers can independently be configured, enabled, reset and disabled.
> > Some hardware features are not implemented, namely clock value matching
> > and pulse generation, but the implementation is enough to boot the Linu=
x
> > kernel configured with aspeed_defconfig.
> >=20
>=20
> [snip]
>=20
> > +static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer,=
 int reg,
> > +                                   uint32_t value)
> > +{
> > +    AspeedTimer *t;
> > +
> > +    g_assert(timer >=3D 0 && timer < ASPEED_TIMER_NR_TIMERS);
>=20
> This would never fail, wouldn't it?

You're right, it shouldn't: I put it in as a sanity check and some
"active" documentation. I'm happy to remove it if you think just adds
noise.

>=20
> [snip]
>=20
> > +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t v=
alue,
> > +                               unsigned size)
> > +{
> > +    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
> > +    const int reg =3D (offset & 0xf) / 4;
> > +    AspeedTimerCtrlState *s =3D opaque;
> > +
> > +    switch (offset) {
> > +    /* Control Registers */
> > +    case 0x30:
> > +        aspeed_timer_set_ctrl(s, tv);
> > +        break;
> > +    case 0x34:
> > +        aspeed_timer_set_ctrl2(s, tv);
> > +        break;
> > +    /* Timer Registers */
> > +    case 0x00 ... 0x2c:
> > +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
> > +        break;
> > +    case 0x40 ... 0x8c:
> > +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, =
tv);
> > +        break;
>=20
>=20
> [snip]
>=20
> > +static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
> > +{
> > +    QEMUBH *bh;
> > +    AspeedTimer *t =3D &s->timers[id];
> > +
> > +    t->id =3D id;
> > +    bh =3D qemu_bh_new(aspeed_timer_expire, t);
> > +    assert(bh);
> > +    t->timer =3D ptimer_init(bh);
> > +    assert(t->timer);
> > +}
>=20
> I'm wondering why do you need those asserts, it's very unlikely that this=
 code=20
> would fail. Have you had any weird issues with it?

No, no weird issues - thanks for pointing them out as I'll remove them:
I put them in when I started developing the series, before
understanding that either call should already have aborted if the
allocations failed.

Thanks for taking a look at the patch!

Andrew
--=-luOkRVdxnFvBAAO0YeK9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6JFHAAoJEJ0dnzgO5LT5aDQP/20cYZLXwvTgNwduoe4giCEg
UBIKbS0ePRTfkjMux6HzMWl8cweT6gzDUAjN7bMFwYsA45nUK+RjwXzkaA5W87KL
D4ST2zNCVsEkK1rct48XrcRC1s8zxr1DIXtYxYTj2MmzmzxORlmVPJOHtUkhtehU
k3N0uwn3enW0xFMBPQ0mprA/CZMb0OVmabEk+rgBWhU16PUDvUFHFdu3qU2Wfcui
7wLq21jkd6/rI2HtyX9eXT72aZWf9QNEu1Is9W5jHh0YRh4+6ccJ+V2vFkl+/kRJ
pOVtmb2zYCD+lgijFir4xsodt220qsJjdFkY1HCBmM448X8NUoPQYgEsHjKRndZ1
WWb/+Ra0qpZm+P/y5cDg2HCbYyPdwmDZzGN4K0bsVwAD/HFEcmmkkt/QLWXrKx8r
InthVaMKs28uqP8k1oDTEFso7/T0EDOdhz6W7z6BzWzn5LfCJM9vxiyXB1E9yPFm
oSozVUfS590MTpANJ8Lfq5Dj9kNLMkqL355PXk3ofCWtCR5v75bXeLlHJEiMCDHO
vwk4sL5wBzPxzJmM/M2wk8ozgtHfxmvYIszeDrbmlyjmEu+QHVJ3STTs4tXPbPC0
HhohG4hX5y8ZBvH41oJUSzw5FzNrqbIga4MqcVrwJUIdwh4O2ZqvOHAwJn5zRPkZ
VTnDYZdmNTQETQgL94Nt
=7Xk3
-----END PGP SIGNATURE-----

--=-luOkRVdxnFvBAAO0YeK9--

