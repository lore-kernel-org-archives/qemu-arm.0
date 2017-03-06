Received: by 10.25.0.147 with SMTP id 141csp1466453lfa;
        Mon, 6 Mar 2017 09:09:55 -0800 (PST)
X-Received: by 10.200.55.57 with SMTP id o54mr18548107qtb.78.1488820194938;
        Mon, 06 Mar 2017 09:09:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si15898126qte.112.2017.03.06.09.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 09:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckw8u-0006jq-9M
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 12:09:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckw8r-0006jk-1Z
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:09:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckw8n-0000Qf-QF
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:09:49 -0500
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ckw8n-0000Qb-Jq; Mon, 06 Mar 2017 12:09:45 -0500
Received: by mail-wr0-f195.google.com with SMTP id u48so22584565wrc.1;
	Mon, 06 Mar 2017 09:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=x77VKsQOzEC2uk7H4yCdSvwydn/OsQmX1r35aKHC9NM=;
	b=RoO09vu0Mt6bqfCZIEPYVvIwi2tPBPuMBooaBtYpfrWhE9CYMgsTsYtw7myW/sgTXn
	oZurACke61xZxwwHvatTYWRq6W5J0H+/e3YIkLExsuf7FnFGMc7O40PU3Z1aeaU2iDqX
	kh3oyfUnPgQURPVnQVdP/Zz3i7RSx9Bi9N0Y7F/I8Lu2OpL8xnzTvQdrZp9+0QJCnLll
	6TBHfKWGnXO7ysRX2OXurc4lzJjxZ1Oi38MTwS4xudj1W2z3MtlZJZho2X+rO5h4ZOPI
	g2w/O3wPSeOAE7iTRHDwv0QHJZKh+X/rw2YEM6Hp+dYfvSRGphsAvJ0b2GehlKI/FB+j
	N1Hg==
X-Gm-Message-State: AMke39lSEvT4biXwno0uND4RrBADYbHpz1OILWBoYmhgQ1LiCrWDYZV89YnDPqlAkP26xA==
X-Received: by 10.223.155.211 with SMTP id e19mr14625768wrc.74.1488820184324; 
	Mon, 06 Mar 2017 09:09:44 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	e72sm13239831wma.5.2017.03.06.09.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Mar 2017 09:09:43 -0800 (PST)
Date: Mon, 6 Mar 2017 19:09:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20170306170932.oj5fndc6rbbawzpr@kozik-lap>
References: <20170305214857.9510-1-krzk@kernel.org>
	<67b0d01e-219a-9df6-1e46-f763e879e767@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <67b0d01e-219a-9df6-1e46-f763e879e767@amsat.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.195
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Convert fprintf to
 error_report()
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z9y4ii4Tge9a

On Sun, Mar 05, 2017 at 06:56:09PM -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Krzysztof,
>=20
> On 03/05/2017 06:48 PM, Krzysztof Kozlowski wrote:
> > error_report() is preferred over fprintf() for logging errors.  Also
> > remove square brackets [] and additional new line characters in printed
> > messages.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  hw/arm/exynos4_boards.c   |  6 +++---
> >  hw/timer/exynos4210_mct.c |  5 +++--
> >  hw/timer/exynos4210_pwm.c | 11 +++++------
> >  hw/timer/exynos4210_rtc.c | 16 +++++++---------
> >  4 files changed, 18 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> > index 0efa19405409..5cd94d402b52 100644
> > --- a/hw/arm/exynos4_boards.c
> > +++ b/hw/arm/exynos4_boards.c
> > @@ -22,6 +22,7 @@
> >   */
> >=20
> >  #include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> >  #include "qemu-common.h"
> >  #include "cpu.h"
> >  #include "sysemu/sysemu.h"
> > @@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(=
MachineState *machine,
> >      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> >=20
> >      if (smp_cpus !=3D EXYNOS4210_NCPUS && !qtest_enabled()) {
> > -        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring=
 smp_cpus"
> > -                " value.\n",
> > -                mc->name, EXYNOS4210_NCPUS);
> > +        error_report("%s board supports only %d CPU cores. Ignoring sm=
p_cpus value.",
> > +                     mc->name, EXYNOS4210_NCPUS);
>=20
> ok, to inform the user

By inform you mean error_report or some lower level?

>=20
> >      }
> >=20
> >      exynos4_board_binfo.ram_size =3D exynos4_board_ram_size[board_type=
];
> > diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> > index 6069116942a4..48041ab036a6 100644
> > --- a/hw/timer/exynos4210_mct.c
> > +++ b/hw/timer/exynos4210_mct.c
> > @@ -53,6 +53,7 @@
> >   */
> >=20
> >  #include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> >  #include "hw/sysbus.h"
> >  #include "qemu/timer.h"
> >  #include "qemu/main-loop.h"
> > @@ -1364,8 +1365,8 @@ static void exynos4210_mct_write(void *opaque, hw=
addr offset,
> >      case L0_TCNTO: case L1_TCNTO:
> >      case L0_ICNTO: case L1_ICNTO:
> >      case L0_FRCNTO: case L1_FRCNTO:
> > -        fprintf(stderr, "\n[exynos4210.mct: write to RO register "
> > -                TARGET_FMT_plx "]\n\n", offset);
> > +        error_report("exynos4210.mct: write to RO register " TARGET_FM=
T_plx,
> > +                     offset);
>=20
> no need to annoy the user here, it seems better to use
> qemu_log_mask(LOG_UNIMP, ...
>=20
> same for following diffs

Sure, I'll fix that as well.

Thanks for review.


Best regards,
Krzysztof

