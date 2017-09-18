Received: by 10.223.172.38 with SMTP id v35csp3752798wrc;
        Mon, 18 Sep 2017 06:25:59 -0700 (PDT)
X-Received: by 10.55.159.81 with SMTP id i78mr20294159qke.81.1505741159197;
        Mon, 18 Sep 2017 06:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505741159; cv=none;
        d=google.com; s=arc-20160816;
        b=FAG2DyLqIjBFmz+dfi/QzJdtTPxy2exnQC31av7rujsmLExEuJ7kRl/Io94vnjYB5c
         mmsS/nPHzoYkKHLZ67lGZj4clJ/eBQArAYE1BMvqLg2flKfdhT3mpSQtKiEDCqSiYMpA
         xJ3/PPJ9DwMDGJUkckAM6JSGqutjmpVI9z+oG00GfODuSop6AS+Dd6jz64Tiaf8CRW2B
         CcwROqzjeIzs/7QpIlAuHoVA5xy1BHG64l3CriXIxAkpv9zpWu06ob1wLoe4rbeDSbRp
         QMtTN9zE+HZZOmT7LiOgS71gi5Rc+6NgLeCMTS36oQMjWXC3wO/KuLZPq3g9lr1sKl92
         pP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NjTdmSPzoc4IQs40uhCbH2Jy+09Xl+UUf65hb10gcbo=;
        b=MD+4btHIIyn9jsGvXfMM7MYU8RVysv1rf78mc1GEwtJtHSX/aMz+ezhSeJLMcyTUT2
         i7ujgVu/MChhZQ4xyKmHQOxXuevFGcY9qR0dpuFwsqo9+r+7zAXWt5u6Q6wYPzitEPZE
         creNgzOtXjGhX46m3290wLFYAdhfFZIweqSt6gjEsqXP/TLlljs9cYogxHPeSsCyrSSH
         +GJNTXU1aqUWe8Rl4EC7yY66XU9KXzSemhTbWM7TGn/JnYv6NkDcTfvBEYDXWPXhVVDJ
         WjMo+9TcIiZNxuMCubvqw+ry1215NRCZAvsWwCeLEGzD0DFbosUiDw/GmXykCHjpg9tN
         ffjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n5a0vyrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si7052495qtk.103.2017.09.18.06.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 06:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n5a0vyrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtw3g-0005HD-TA
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 09:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtw3G-00053m-UD
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 09:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtw3F-0007G1-Ah
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 09:25:30 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:38774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dtw3A-0007A6-LY; Mon, 18 Sep 2017 09:25:24 -0400
Received: by mail-vk0-x243.google.com with SMTP id o22so134089vke.5;
	Mon, 18 Sep 2017 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NjTdmSPzoc4IQs40uhCbH2Jy+09Xl+UUf65hb10gcbo=;
	b=n5a0vyrpB5FcW/7ilEevaQv2ihL+v0/TrHXNFCCMljkru6s94W3mEF0d91733sbLqw
	Wg83qREtUXN9LwZge4Kcm4aasbBFv3qF1RlRRt40UOvNd14UJ6ywJ5HHSKdMMOmiAlXd
	ld5iUkygmyydMa5QnkyiSFSgRgiAt97bYFqQcdBmyy8lbrU6Sm4FtuxetYvYWNjvtM6Y
	QUQe0Dqs9pQzfGsxw5qmf+eldIHkyWCWzbVLWrf6l8yaSiyk95Pf8YcLjd5u9+oIRQTo
	PJeYJyB6wtRdKSWWxWo1l+NwE/bcnex+mF4ezILsW7GYJvIBlvTM8Kogar1kcS2tIANR
	RdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NjTdmSPzoc4IQs40uhCbH2Jy+09Xl+UUf65hb10gcbo=;
	b=gt7cAH1H8HT7edFgPOnurGgHBXdyhaKo6YEFYgUV+35Yy0Olb9EchOKkLq8dK1EMnY
	DiAIMSt6+LCPXHR0c1XKDfwTHcJRko+8RBX/IS5DcVtYkFjH3pqmgjujLqwJ1TjuL73b
	R5q0XIAUeVqxyipKswY9IYbcISRoH+9DQDPEsWVstmg/vPmvWtnyzEgisJdoFivuVR9P
	FAIvbX84PvasoG+LpkFY94hURFej31wipn7kI+PrItX0i8F5cqOEYk5m/teLI3t4TvW7
	du/lOOUh1fbBvwbLtbBwSnF3yUELdZHq8IsWccuhR/TWmbeMfpXbEGWrEr2m+VlmCrxr
	Gs3g==
X-Gm-Message-State: AHPjjUjFyL52ZaTmdotGQofjbYmyFhHLYEeQ8sORtbXWTrcf9WypwFgt
	e3xv+oeuNDYlMRkQnH97ZrkkajnUeECR0jGhJFk=
X-Google-Smtp-Source: AOwi7QCiGQz72z9r3hS3ixkKC+PJ+dh0bZSWUFcS2MGUtlJZelki3S8p47ko9/Wje25TL5/hRajIXM0fJPHQflnotIw=
X-Received: by 10.31.160.204 with SMTP id j195mr25443635vke.172.1505741123684; 
	Mon, 18 Sep 2017 06:25:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Mon, 18 Sep 2017 06:25:23 -0700 (PDT)
In-Reply-To: <CAFEAcA9vydmYr81oMazziyi409S+DpQf+RGaCTHfRxXhPj-aYw@mail.gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CAFEAcA9vydmYr81oMazziyi409S+DpQf+RGaCTHfRxXhPj-aYw@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 18 Sep 2017 18:55:23 +0530
Message-ID: <CALHRZuoMibZoUf5BSqMDyY9zknui-6Jc507-c=EJ03XoV0fibQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a114696f6cd0e4f055976ac9c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n5xEPiScEcZg

--001a114696f6cd0e4f055976ac9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

H Peter,

On Mon, Sep 18, 2017 at 4:05 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 18 September 2017 at 11:17, sundeep subbaraya <sundeep.lkml@gmail.com>
> wrote:
> > Hi Philippe,
> >
> > On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org
> >
> > wrote:
> >>
> >> Hi Sundeep, Peter,
> >>
> >>
> >> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
> >>>
> >>> Added Sytem register block of Smartfusion2.
> >>> This block has PLL registers which are accessed by guest.
> >>>
> >>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> >>> ---
> >>>   hw/misc/Makefile.objs         |   1 +
> >>>   hw/misc/msf2-sysreg.c         | 168
> >>> ++++++++++++++++++++++++++++++++++++++++++
> >>>   hw/misc/trace-events          |   5 ++
> >>>   include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
> >>>   4 files changed, 251 insertions(+)
> >>>   create mode 100644 hw/misc/msf2-sysreg.c
> >>>   create mode 100644 include/hw/misc/msf2-sysreg.h
> >>>
> >>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> >>> index 29fb922..e8f0a02 100644
> >>> --- a/hw/misc/Makefile.objs
> >>> +++ b/hw/misc/Makefile.objs
> >>> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
> >>>   obj-$(CONFIG_AUX) +=3D auxbus.o
> >>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
> >>>   obj-y +=3D mmio_interface.o
> >>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
> >>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> >>> new file mode 100644
> >>> index 0000000..dc3597b
> >>> --- /dev/null
> >>> +++ b/hw/misc/msf2-sysreg.c
> >>> @@ -0,0 +1,168 @@
> >>> +/*
> >>> + * System Register block model of Microsemi SmartFusion2.
> >>> + *
> >>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or
> >>> + * modify it under the terms of the GNU General Public License
> >>> + * as published by the Free Software Foundation; either version
> >>> + * 2 of the License, or (at your option) any later version.
> >>> + *
> >>> + * You should have received a copy of the GNU General Public License
> >>> along
> >>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "qemu/log.h"
> >>> +#include "hw/misc/msf2-sysreg.h"
> >>> +#include "trace.h"
> >>> +
> >>> +static inline int msf2_divbits(uint32_t div)
> >>> +{
> >>> +    int ret =3D 0;
> >>> +
> >>> +    switch (div) {
> >>> +    case 1:
> >>> +        ret =3D 0;
> >>> +        break;
> >>> +    case 2:
> >>> +        ret =3D 1;
> >>> +        break;
> >>> +    case 4:
> >>> +        ret =3D 2;
> >>> +        break;
> >>> +    case 8:
> >>> +        ret =3D 4;
> >>> +        break;
> >>> +    case 16:
> >>> +        ret =3D 5;
> >>> +        break;
> >>> +    case 32:
> >>> +        ret =3D 6;
> >>> +        break;
> >>> +    default:
> >>> +        break;
> >>
> >>
> >> eh?
> >>
> >>> +    }
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>> +static void msf2_sysreg_reset(DeviceState *d)
> >>> +{
> >>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
> >>> +
> >>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
> >>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
> >>> +    s->regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s->apb0div) << 5 |
> >>
> >>
> >> ctz32(s->apb0div) << 5 ...
> >
> >
> > I will modify like below:
> > div0 =3D s->apb0div < 8 ? ctz32(s->apb0div) : ctz32(s->apb0div) + 1;
> > div1 =3D s->apb1div < 8 ? ctz32(s->apb1div) : ctz32(s->apb1div) + 1;
>
> I think you should keep an msf2_divbits() function for that,
> even if it's only
>
> static inline int msf2_divbits(uint32_t div)
> {
>     int r =3D ctz32(div);
>
>     return (div < 8) ? r : r + 1;
> }
>
> Ok will change like this.

Thanks,
Sundeep


> thanks
> -- PMM
>

--001a114696f6cd0e4f055976ac9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">H Peter,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Mon, Sep 18, 2017 at 4:05 PM, Peter Maydell <span dir=3D"ltr">&l=
t;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.mayde=
ll@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
class=3D"HOEnZb"><div class=3D"h5">On 18 September 2017 at 11:17, sundeep s=
ubbaraya &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.c=
om</a>&gt; wrote:<br>
&gt; Hi Philippe,<br>
&gt;<br>
&gt; On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Sundeep, Peter,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Added Sytem register block of Smartfusion2.<br>
&gt;&gt;&gt; This block has PLL registers which are accessed by guest.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.f=
rancis@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 168<br>
&gt;&gt;&gt; ++++++++++++++++++++++++++++++<wbr>++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 ++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0include/hw/misc/msf2-sysreg.h |=C2=A0 77 +++++++++=
++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A04 files changed, 251 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 hw/misc/msf2-sysreg.c<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 include/hw/misc/msf2-sysreg.h<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
&gt;&gt;&gt; index 29fb922..e8f0a02 100644<br>
&gt;&gt;&gt; --- a/hw/misc/Makefile.objs<br>
&gt;&gt;&gt; +++ b/hw/misc/Makefile.objs<br>
&gt;&gt;&gt; @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_tes=
tdev.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0obj-$(CONFIG_AUX) +=3D auxbus.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_=
sdmc.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0obj-y +=3D mmio_interface.o<br>
&gt;&gt;&gt; +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
&gt;&gt;&gt; diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..dc3597b<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/hw/misc/msf2-sysreg.c<br>
&gt;&gt;&gt; @@ -0,0 +1,168 @@<br>
&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt; + * System Register block model of Microsemi SmartFusion2.<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto=
:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * This program is free software; you can redistribute it and=
/or<br>
&gt;&gt;&gt; + * modify it under the terms of the GNU General Public Licens=
e<br>
&gt;&gt;&gt; + * as published by the Free Software Foundation; either versi=
on<br>
&gt;&gt;&gt; + * 2 of the License, or (at your option) any later version.<b=
r>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * You should have received a copy of the GNU General Public =
License<br>
&gt;&gt;&gt; along<br>
&gt;&gt;&gt; + * with this program; if not, see &lt;<a href=3D"http://www.g=
nu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/l=
icenses/</a>&gt;<wbr>.<br>
&gt;&gt;&gt; + */<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;&gt;&gt; +#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
&gt;&gt;&gt; +#include &quot;trace.h&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +static inline int msf2_divbits(uint32_t div)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 switch (div) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 4:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 2;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 8:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 4;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 16:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 5;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 case 32:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 6;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; eh?<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +static void msf2_sysreg_reset(DeviceState *d)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D 0=
x021A2358;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s-=
&gt;apb0div) &lt;&lt; 5 |<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ctz32(s-&gt;apb0div) &lt;&lt; 5 ...<br>
&gt;<br>
&gt;<br>
&gt; I will modify like below:<br>
&gt; div0 =3D s-&gt;apb0div &lt; 8 ? ctz32(s-&gt;apb0div) : ctz32(s-&gt;apb=
0div) + 1;<br>
&gt; div1 =3D s-&gt;apb1div &lt; 8 ? ctz32(s-&gt;apb1div) : ctz32(s-&gt;apb=
1div) + 1;<br>
<br>
</div></div>I think you should keep an msf2_divbits() function for that,<br=
>
even if it&#39;s only<br>
<br>
static inline int msf2_divbits(uint32_t div)<br>
{<br>
=C2=A0 =C2=A0 int r =3D ctz32(div);<br>
<br>
=C2=A0 =C2=A0 return (div &lt; 8) ? r : r + 1;<br>
}<br>
<br></blockquote><div>Ok will change like this.</div><div><br></div><div>Th=
anks,</div><div>Sundeep</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--001a114696f6cd0e4f055976ac9c--
