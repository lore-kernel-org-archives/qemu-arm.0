Received: by 10.25.27.66 with SMTP id b63csp45191lfb;
        Thu, 9 Jun 2016 17:59:29 -0700 (PDT)
X-Received: by 10.237.48.45 with SMTP id 42mr12389270qte.7.1465520369736;
        Thu, 09 Jun 2016 17:59:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si4900115qtc.24.2016.06.09.17.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 17:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBAnJ-0001Rd-6s
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 20:59:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bBAnD-0001RW-Up
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 20:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bBAn8-0008CR-Od
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 20:59:22 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:48985
	helo=homiemail-a21.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bBAn8-0008C9-DX; Thu, 09 Jun 2016 20:59:18 -0400
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id BAAEA300072;
	Thu,  9 Jun 2016 17:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=wrE86k17NfDXtau6Im0dq
	RPCJsM=; b=uwX01yUzj5oRVB0mh882C9YkORztRk6GrP1IbGaYdQvmuK3cI9rOB
	FauY8+3lPkHQqw3SZo0DnXYb35oaKHLCNxh/gZ/Gtc6Bv3pnTyTndo8/490PdAwW
	JrveZ/46/69kmYdhOKi3o2bWX/4muFPBXLUe+uC98BB5Kc8XBGdh9s=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id 5682C300059; 
	Thu,  9 Jun 2016 17:59:14 -0700 (PDT)
Message-ID: <1465520347.16048.180.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2016 10:29:07 +0930
In-Reply-To: <CAFEAcA8+3trGJ=6K8fFX4-2Z1N+ZUiBKUcSTR6fYnQtMfNs3rw@mail.gmail.com>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
	<CAFEAcA8+3trGJ=6K8fFX4-2Z1N+ZUiBKUcSTR6fYnQtMfNs3rw@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5H5iLfvr2s15ALARmiGL"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
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
X-TUID: vf8/Jw1zPtnB


--=-5H5iLfvr2s15ALARmiGL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-09 at 19:15 +0100, Peter Maydell wrote:
> On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on the
> > palmetto-bmc machine. Two match registers are provided for each timer.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >=20
> > The change pulls out ptimer in favour of the regular timer infrastructu=
re. As a
> > consequence it implements the conversions between ticks and time which =
feels a
> > little tedious. Any comments there would be appreciated.
> Couple of minor comments below.
>=20
> >=20
> > =C2=A0hw/timer/aspeed_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 135 ++++++++++++++++++++++++++++++----------
> > =C2=A0include/hw/timer/aspeed_timer.h |=C2=A0=C2=A0=C2=A06 +-
> > =C2=A02 files changed, 105 insertions(+), 36 deletions(-)
> >=20
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > index 4b94808821b4..905de0f788b2 100644
> > --- a/hw/timer/aspeed_timer.c
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -9,13 +9,12 @@
> > =C2=A0 * the COPYING file in the top-level directory.
> > =C2=A0 */
> >=20
> > +#include=20
> > =C2=A0#include "qemu/osdep.h"
> osdep.h must always be the first include.

Thanks for picking that up.

>=20
> >=20
> > -#include "hw/ptimer.h"
> > =C2=A0#include "hw/sysbus.h"
> > =C2=A0#include "hw/timer/aspeed_timer.h"
> > =C2=A0#include "qemu-common.h"
> > =C2=A0#include "qemu/bitops.h"
> > -#include "qemu/main-loop.h"
> > =C2=A0#include "qemu/timer.h"
> > =C2=A0#include "qemu/log.h"
> > =C2=A0#include "trace.h"
> > @@ -77,21 +76,99 @@ static inline bool timer_can_pulse(AspeedTimer *t)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return t->id >=3D TIMER_FIRST_CAP_PULSE;
> > =C2=A0}
> >=20
> > +static inline bool timer_external_clock(AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0return timer_ctrl_status(t, op_external_clock)=
;
> > +}
> > +
> > +static double clock_rates[] =3D { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_=
HZ };
> > +
> > +static inline double calculate_rate(struct AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0return clock_rates[timer_external_clock(t)];
> > +}
> > +
> > +static inline double calculate_period(struct AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0return NANOSECONDS_PER_SECOND / calculate_rate=
(t);
> > +}
> > +
> > +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t=
 now_ns)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t delta_ns =3D now_ns - MIN(now_ns, t->=
start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ticks =3D (uint32_t) floor(delta_ns /=
 calculate_period(t));
> Do we really need to do this with floating point ?

I went with floating point to avoid accumulating errors from truncation
by integer division. At eg 24MHz truncation increases the tick rate by
approximately 1 in 63. We're using floor() here, but that only
truncates at the end of the calculation, so the fractional current
tick.

Having said that, grep'ing around under {,include/}hw/ doesn't show a
lot of use of floating point. It looks like we are explicitly avoiding
it, however with a quick search I didn't find it mentioned in any of
the docs. What's the reasoning? Should I use a fixed-point approach
like ptimer?

>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return t->reload - MIN(t->reload, ticks);
> > +}
> > +
> > +static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t =
ticks)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t delta_ns;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0ticks =3D MIN(t->reload, ticks);
> > +=C2=A0=C2=A0=C2=A0=C2=A0delta_ns =3D (uint64_t) floor((t->reload - tic=
ks) * calculate_period(t));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return t->start + delta_ns;
> > +}
> > +
> > +static uint64_t calculate_next(struct AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t now;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t next;
> > +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > +=C2=A0=C2=A0=C2=A0=C2=A0/* We don't know the relationship between the =
values in the match
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* registers, so sort using MAX/MIN/zero.=
 We sort in that order as the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* timer counts down to zero. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t seq[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAX(t->match[0], t->ma=
tch[1]),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MIN(t->match[0], t->ma=
tch[1]),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00,
> > +=C2=A0=C2=A0=C2=A0=C2=A0};
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < ARRAY_SIZE(seq); i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0next =3D calculate_tim=
e(t, seq[i]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (now < next) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return next;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint64_t reload_ns;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload_ns =3D (uint64_=
t) floor(t->reload * calculate_period(t));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->start =3D now - ((n=
ow - t->start) % reload_ns);
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return calculate_next(t);
> Why is this recursing ?

The common case is that we return during iterating over seq array i.e.
we're anticipating another match event (either from the match values or
the timer reaching zero). If not then we've overrun, so we reinitialise
the timer by resetting the 'start' reference point then searching again
for the next event (iterating over seq). As the search for the next
event is encoded in the function, I've recursed to reuse it.

Would you prefer a loop here?

Considering the two approaches (recursion vs loop), if TCO doesn't
apply we could blow the stack, and with loops or TCO it's possible we
could spin here indefinitely if the timer period is shorter than the
time it takes to recalculate. Arguably, not crashing is better so I'm
happy to rework it.

As an aside, the approach for reinitialising start skips countdown
periods that were completely missed through high service latency, and
there will be no interrupts issued for the missing events. Is that
reasonable?

>=20
> >=20
> > +}
> > +
> > =C2=A0static void aspeed_timer_expire(void *opaque)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedTimer *t =3D opaque;
> > +=C2=A0=C2=A0=C2=A0=C2=A0bool interrupt =3D false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ticks;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0/* Only support interrupts on match values of =
zero for the moment - this is
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* sufficient to boot an aspeed_defconfig=
 Linux kernel.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* TODO: matching on arbitrary values (se=
e e.g. hw/timer/a9gtimer.c)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > -=C2=A0=C2=A0=C2=A0=C2=A0bool match =3D !(t->match[0] && t->match[1]);
> > -=C2=A0=C2=A0=C2=A0=C2=A0bool interrupt =3D timer_overflow_interrupt(t)=
 || match;
> > -=C2=A0=C2=A0=C2=A0=C2=A0if (timer_enabled(t) && interrupt) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (!timer_enabled(t)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0ticks =3D calculate_ticks(t, qemu_clock_get_ns=
(QEMU_CLOCK_VIRTUAL));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (!ticks) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D timer_ov=
erflow_interrupt(t) || !t->match[0] || !t->match[1];
> > +=C2=A0=C2=A0=C2=A0=C2=A0} else if (ticks <=3D MIN(t->match[0], t->matc=
h[1])) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0} else if (ticks <=3D MAX(t->match[0], t->matc=
h[1])) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (interrupt) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->level =3D !t->=
level;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set_irq(t->i=
rq, t->level);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0timer_mod(&t->timer, calculate_next(t));
> > =C2=A0}
> >=20
> > =C2=A0static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
> > @@ -100,7 +177,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer =
*t, int reg)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (reg) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_STATUS:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D ptimer_get_c=
ount(t->timer);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D calculate_ti=
cks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_RELOAD:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D t->relo=
ad;
> > @@ -160,24 +237,21 @@ static void aspeed_timer_set_value(AspeedTimerCtr=
lState *s, int timer, int reg,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (reg) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_STATUS:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (timer_enabled=
(t)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0ptimer_set_count(t->timer, value);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0int64_t delta =3D (int64_t) value - (int64_t) calculate_ticks(t, now);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0t->start +=3D delta * calculate_period(t);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0timer_mod(&t->timer, calculate_next(t));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_RELOAD:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->reload =3D val=
ue;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_set_limit(t->ti=
mer, value, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_MATCH_FIRST:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case TIMER_REG_MATCH_SECOND:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (value) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0/* Non-zero match values are unsupported. As such an interrupt will
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0* always be triggered when the timer reaches zero even if the
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0* overflow interrupt control bit is clear.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0*/
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by device: "
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"0x%" PRIx32 "\n", __fun=
c__, value);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0t->match[reg - 2] =3D value;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->match[reg - 2] =3D =
value;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (timer_enabled(t)) =
{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0timer_mod(&t->timer, calculate_next(t));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
> > @@ -196,21 +270,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer =
*t, bool enable)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_aspeed_timer_ctrl_enable(t->id, ena=
ble);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (enable) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_run(t->timer, 0=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->start =3D qemu_cloc=
k_get_ns(QEMU_CLOCK_VIRTUAL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0timer_mod(&t->timer, c=
alculate_next(t));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_stop(t->timer);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_set_limit(t->ti=
mer, t->reload, 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0timer_del(&t->timer);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0}
> >=20
> > =C2=A0static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool=
 enable)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_aspeed_timer_ctrl_external_clock(t-=
>id, enable);
> > -=C2=A0=C2=A0=C2=A0=C2=A0if (enable) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_set_freq(t->tim=
er, TIMER_CLOCK_EXT_HZ);
> > -=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptimer_set_freq(t->tim=
er, TIMER_CLOCK_APB_HZ);
> > -=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > =C2=A0}
> >=20
> > =C2=A0static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, =
bool enable)
> > @@ -351,12 +420,10 @@ static const MemoryRegionOps aspeed_timer_ops =3D=
 {
> >=20
> > =C2=A0static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_=
t id)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0QEMUBH *bh;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedTimer *t =3D &s->timers[id];
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->id =3D id;
> > -=C2=A0=C2=A0=C2=A0=C2=A0bh =3D qemu_bh_new(aspeed_timer_expire, t);
> > -=C2=A0=C2=A0=C2=A0=C2=A0t->timer =3D ptimer_init(bh);
> > +=C2=A0=C2=A0=C2=A0=C2=A0timer_init_ns(&t->timer, QEMU_CLOCK_VIRTUAL, a=
speed_timer_expire, t);
> > =C2=A0}
> >=20
> > =C2=A0static void aspeed_timer_realize(DeviceState *dev, Error **errp)
> > @@ -404,7 +471,7 @@ static const VMStateDescription vmstate_aspeed_time=
r =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fields =3D (VMStateField[]) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_UINT8(id,=
 AspeedTimer),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_INT32(lev=
el, AspeedTimer),
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_PTIMER(timer, =
AspeedTimer),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_TIMER(timer, A=
speedTimer),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_UINT32(re=
load, AspeedTimer),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_UINT32_AR=
RAY(match, AspeedTimer, 2),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_END_OF_LI=
ST()
> You need to bump the vmstate version_id and minimum_version_id if
> you change the format (and then the version number you use in the
> VMSTATE_STRUCT_ARRAY that refers to this one).

Will do, thanks for clarifying.

Cheers,

Andrew
--=-5H5iLfvr2s15ALARmiGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXWhDbAAoJEJ0dnzgO5LT5SBkQAKVljHz1f9VjzLL35hiXA1od
iaRUMDATy/9ynGiSsJE6JirvNuGG/G9907yOgrbU2IZtJ2aThPao4di0nWRust8I
/WgbxZzEOMBddVSpwOopt0eTOLlOw9t0X08erPy7MMPG36ul/L4XwRvZAmvZvMOm
KjRqLZHNUrh7UdT4wpUL+XzgAdFizQSonKqOPpulg72144ARfQZ4jQZrydlfE0qe
eW24gZYlqocfuyipqxxDRTloe9GQy0HHICHkGy1qNfhztkiejJc9Zh2vBFiafbXU
+xLwnn8aSJbHiPANJhnZ2SjLsnLKOkJiiMxYBYOMpAS4waXqzK//WRq4pO4uO2fF
pFTj/jNbJnu5fVa8Fk0uzH48NqtqbY1N00hMrgwy1buKOK7P/3IXajb62cbbWE8l
WnKkg4eUdp4c/4L0jaSYeE9CRDbZqLr+3kTshfcZs5fKf7aOurUNmi50KiZES27u
L5LhRZFh1V82wgKEZHYU4FJMC1PiQC4QP3ERnRCRGoLvciDFUYPklc1EDRGJNmkc
A4P8ki5oqdjAGXN5+hc8hT88SnxIf77bu2myLiFsk9IpeN9GQu27R5Y6JQc+d0iv
qFmoawLZZDT6NcBpg5Uam/2bfrXWo5p0HwhvBsn3D0BobN3Pexk4Mg4RCultycbb
VeSpcGKzH73MY8ErHdP0
=kr2n
-----END PGP SIGNATURE-----

--=-5H5iLfvr2s15ALARmiGL--

