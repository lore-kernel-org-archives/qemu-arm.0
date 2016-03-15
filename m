Received: by 10.25.208.211 with SMTP id h202csp858587lfg;
        Tue, 15 Mar 2016 16:07:01 -0700 (PDT)
X-Received: by 10.55.75.212 with SMTP id y203mr929759qka.3.1458083221091;
        Tue, 15 Mar 2016 16:07:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si494679qgz.58.2016.03.15.16.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 16:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:52006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afy3I-0002ss-Hn
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 19:07:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afy3F-0002sm-Ca
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 19:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afy3C-0003wv-4q
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 19:06:57 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:40562
	helo=homiemail-a22.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afy3B-0003wc-Rw; Tue, 15 Mar 2016 19:06:54 -0400
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id B87B6114070;
	Tue, 15 Mar 2016 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=gpf/dz55Wm8xUDK7BpKxk
	uezer8=; b=xISSle1Mb9P380kHOz3o4pHb5mgA6aONmfOwRyXhpr67DqQcgEm4k
	LILVorKOYyn/NMU7XQqQ0JsAc7cVgCvWk0cTgzzpmUVrHSgZTopifUm5SZ/2kjhV
	wklLb5CYvR+G7Uh5K07QFP/6K8jjX0wiHPkRozARElpFa4V1qwHD3Y=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 2759711406F; 
	Tue, 15 Mar 2016 16:06:47 -0700 (PDT)
Message-ID: <1458083204.29435.37.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 09:36:44 +1030
In-Reply-To: <56E80AC5.2080508@kaod.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<1457928832-31026-2-git-send-email-andrew@aj.id.au>
	<56E80AC5.2080508@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2ozH+BtsoJsalXJy1ne4"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	Jeremy Kerr <jk@ozlabs.org>, qemu-devel@nongnu.org
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
X-TUID: hXE0IYmCWb0g


--=-2ozH+BtsoJsalXJy1ne4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-03-15 at 14:14 +0100, C=C3=A9dric Le Goater wrote:
> On 03/14/2016 05:13 AM, Andrew Jeffery wrote:
> > Implement basic ASPEED timer functionality for the AST2400 SoC[1]: Up t=
o
> > 8 timers can independently be configured, enabled, reset and disabled.
> > Some hardware features are not implemented, namely clock value matching
> > and pulse generation, but the implementation is enough to boot the Linu=
x
> > kernel configured with aspeed_defconfig.
> >=20
> > [1] http://www.aspeedtech.com/products.php?fPath=3D20&rId=3D376
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Looks good. One stylistic comment and a possible compile break in=20
> timer_to_ctrl().=20
>=20
> >=20
> > ---
> > Since v3:
> >   * Drop unnecessary mention of VMStateDescription in timer_to_ctrl des=
cription
> >   * Mention hw/timer/a9gtimer.c with respect to clock value matching
> >   * Add missing VMSTATE_END_OF_LIST() to vmstate_aspeed_timer_state
> >=20
> > Since v2:
> >   * Improve handling of timer configuration with respect to enabled sta=
te
> >   * Remove redundant enabled member from AspeedTimer
> >   * Implement VMStateDescriptions
> >   * Fix interrupt behaviour (edge triggered, both edges)
> >   * Fix various issues with trace-event declarations
> >   * Include qemu/osdep.h
> >=20
> > Since v1:
> >   * Refactor initialisation of and respect requested clock rates (APB/E=
xternal)
> >   * Simplify some index calculations
> >   * Use tracing infrastructure instead of internal DPRINTF
> >   * Enforce access size constraints and alignment in MemoryRegionOps
> >=20
> >  default-configs/arm-softmmu.mak |   1 +
> >  hw/timer/Makefile.objs          |   1 +
> >  hw/timer/aspeed_timer.c         | 451 ++++++++++++++++++++++++++++++++=
++++++++
> >  include/hw/timer/aspeed_timer.h |  59 ++++++
> >  trace-events                    |   9 +
> >  5 files changed, 521 insertions(+)
> >  create mode 100644 hw/timer/aspeed_timer.c
> >  create mode 100644 include/hw/timer/aspeed_timer.h
> >=20
> > diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> > index a9f82a1..2bcd236 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -110,3 +110,4 @@ CONFIG_IOH3420=3Dy
> >  CONFIG_I82801B11=3Dy
> >  CONFIG_ACPI=3Dy
> >  CONFIG_SMBIOS=3Dy
> > +CONFIG_ASPEED_SOC=3Dy
> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> > index 5cfea6e..003c14f 100644
> > --- a/hw/timer/Makefile.objs
> > +++ b/hw/timer/Makefile.objs
> > @@ -32,3 +32,4 @@ obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> >  obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> > =20
> >  common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
> > +common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > new file mode 100644
> > index 0000000..0e82178
> > --- /dev/null
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -0,0 +1,452 @@
> > +/*
> > + * ASPEED AST2400 Timer
> > + *
> > + * Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + * Copyright (C) 2016 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/ptimer.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/timer/aspeed_timer.h"
> > +#include "qemu-common.h"
> > +#include "qemu/bitops.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/timer.h"
> > +#include "trace.h"
> > +
> > +#define TIMER_NR_REGS 4
> > +
> > +#define TIMER_CTRL_BITS 4
> > +#define TIMER_CTRL_MASK ((1 << TIMER_CTRL_BITS) - 1)
> > +
> > +#define TIMER_CLOCK_USE_EXT true
> > +#define TIMER_CLOCK_EXT_HZ 1000000
> > +#define TIMER_CLOCK_USE_APB false
> > +#define TIMER_CLOCK_APB_HZ 24000000
> > +
> > +#define TIMER_REG_STATUS 0
> > +#define TIMER_REG_RELOAD 1
> > +#define TIMER_REG_MATCH_FIRST 2
> > +#define TIMER_REG_MATCH_SECOND 3
> > +
> > +#define TIMER_FIRST_CAP_PULSE 4
> > +
> > +enum timer_ctrl_op {
> > +    op_enable =3D 0,
> > +    op_external_clock,
> > +    op_overflow_interrupt,
> > +    op_pulse_enable
> > +};
> > +
> > +/**
> > + * Avoid mutual references between AspeedTimerCtrlState and AspeedTime=
r
> > + * structs, as it's a waste of memory. The ptimer BH callback needs to=
 know
> > + * whether a specific AspeedTimer is enabled, but this information is =
held in
> > + * AspeedTimerCtrlState. So, provide a helper to hoist ourselves from =
an
> > + * arbitrary AspeedTimer to AspeedTimerCtrlState.
> > + */
> > +static inline struct AspeedTimerCtrlState *timer_to_ctrl(AspeedTimer *=
t)
>=20
>=20
> you can remove the 'struct' above.

Good catch, will do.

>=20
> > +{
> > +    AspeedTimer (*timers)[] =3D (void *)t - (t->id * sizeof(*t));
>=20
> This will not compile on gcc < 5.0. You need to add a 'const' :
>=20
>     const AspeedTimer (*timers)[] =3D (void *)t - (t->id * sizeof(*t));
>=20
> That should work on all versions.

Thanks, I've confirmed the failure and fix with gcc-4.7. I'll make sure
to test with the earliest gcc easily available to me (looks like it's
4.7, on Ubuntu Wily) going forward.

Cheers,

Andrew
--=-2ozH+BtsoJsalXJy1ne4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6JWEAAoJEJ0dnzgO5LT5k/IP/Aurj+7fyzmgkhckCOIJyPXp
HByVXjNv+rDq+v5vJ6hwNtPuTBixRMVon4xMDTuiUHBza3ZGMsJnSrfOmQ2vLz8t
rrsf2wJQr/enlz5E/bPtfkPn79aJ7Y6AmpQoH0hcW9rjFLh10MYmP6ST6SuTZpgB
Cy5RhortyU15eE3lgBryGoVpJZzE+9Asv3HT4V74BEPvJBHzXSLaHEW2cNMzh6DN
JQ/n+YTsfsKZ+V79P0nDkKq/1wD5z/nQKW/Z3LRnYr2HE5bTAVRJGy1AlGB/wMSC
89ojn7080oLZWpTXFAy1/mzSJpyOD7Rzv+M5hATbGidOzlo3kCHVWsKcPHZz3Wyv
8BvdZ9NzjaStZ+pbvqNTzWh0yazn8KrlX5MnDVu+x5eg9aeMKhJoYZ3IftsQODAP
XsQ37pqUUAJ0QmgOCkTSA7kQAu7FUL65Cfl1TFsUGC6yjo3V+28FZDmBLqL3HSyo
a3CSuV3XDLfk6/b/4zF2al9BB8nGsb/Cl20HcpY/Bt3Cw30rCS80Hi3a9KjCVQbf
CdP+26NvCeKC+cyRcs1nD60zrIsBJrbJof9CXUomIS90hdvLdupFLjSRnh1JZSGt
1Bm9mG8YJOE+2wHxm+FPvsd0lb69msi/q65pB/c6kYMwlFElHRRB83jUwPY/ZLRP
BF2yJAoYA9xxBlY5w1W8
=QbeF
-----END PGP SIGNATURE-----

--=-2ozH+BtsoJsalXJy1ne4--

