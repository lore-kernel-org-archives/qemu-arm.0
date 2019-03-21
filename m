Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp679869wrx;
        Thu, 21 Mar 2019 14:14:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh5XbewOsWFgEDLZEaix6JJ0kJImNaHsJgQOQFjfcfBGVKe4eS5O4tcAnngyw0oeXMojoS
X-Received: by 2002:adf:9f54:: with SMTP id f20mr4100298wrg.88.1553202860422;
        Thu, 21 Mar 2019 14:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553202860; cv=none;
        d=google.com; s=arc-20160816;
        b=z5UJ2PbYfvcYfxsamSI2DNhJuCPexZsB8mLO2qwgquGZyPfelcdvjJHPExfpEcpGnC
         q9QLWFHEaZ9kn6qka/kg8SVz+vFUgkJTAvRgVNbkopglhP/JYK5ljwpDSI7Rsvo/xFI4
         oHf9t9921YapkYtLWL0/p4RoPVQpUJgweja0+3nw6CXgbIHI/Ch+xw3hGmy/A5Wpzvev
         sPSjywQlUPN0FX1b0kCvQZxQ6PVZt11HfR597HrQqhbBIwT3BBA0ioR8MATwRLrpgQj1
         WBGR4/TtOYKHJgXLE5VPz0w/oc1lGJrEg8gn0rwYeQLxVk3w9CeVdDbZ44yMkJUzho9I
         pzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Xp0XMFeHrmDJ9DaxQGoxv2HKufDJ5fxLPQ14eF3QAeA=;
        b=UaW4GVrYVYXBg/nT0ASitgwZRkfw+uZsHn+CelXERsq9p2qCV8DEuv1gZrDsl1hwgk
         ESkxG9zMpYoKVHbO1/761Gc7QTq4fZBF9cJ4kGPE8oelEctE/0ZgSoR+EugyW4A9EzPL
         jzC0oeOZh8NiEBJOr7ufuokOvt8aa9oLkSTTQaeb1Y9GnaB1VPdklMDkUYbwkIIvL1OL
         RIAZTMjuP2xSE/I9I8mBTSm/i/fBfiEngPyJR0szKhMzSHu6iElj2kbhqZ/8qemUzRqY
         4X28DNq2XrDo7QuxRrlHf1zvXMJ1n7YZFK+jeGf9Jh+m3eNCEYUtNEkka8UQEhAOaDo+
         rVtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si3918144wmj.153.2019.03.21.14.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 14:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7511-00079N-Br
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 17:14:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h750m-00076i-Al
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 17:14:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h750j-0004b1-KE
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 17:14:04 -0400
Received: from mail-yw1-f51.google.com ([209.85.161.51]:37706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h750c-0004Rb-Br; Thu, 21 Mar 2019 17:13:54 -0400
Received: by mail-yw1-f51.google.com with SMTP id w66so250478ywd.4;
	Thu, 21 Mar 2019 14:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xp0XMFeHrmDJ9DaxQGoxv2HKufDJ5fxLPQ14eF3QAeA=;
	b=PHD7DJXbe7GN/RumEdG5RXIcIRA7hQ3e5Uv3ziAdmgQ/wULdYwZGylPDT8hLMMIwXH
	xYMYxNfuHuSvaxRl37ogANm4kgQ0RrJgpA8U5mwki6jWgbMoeFxY2Ozds6Dvq0T1WLbp
	wEjIsNO2UD32d9OUBABci5KDTnf2PI4m/1tG8Tq7goD5Ti5cpamCp5zGHcaShc1zxs42
	I8ch71/LQZ9JEqbRyt3Pcpj+GlQ9rbQzKloA51OsgEX7+LoPlyozBS0Ds8nXfGRyaMQC
	wOfEADFIFypK0j/k/yej5ClcI/FsynwGhhDLpyCVx5BjrKmn+PHFyOmmYEI6SPvt5Mft
	AjEg==
X-Gm-Message-State: APjAAAWSXY/kWcFhexiOP2d6ncUWUPMTDYjlOta/dSoFXG+gLPWP507l
	hgNLueHvY6oEh+z4B5S8r7cFwlxZiKQmVT8WiqM=
X-Received: by 2002:a0d:fe05:: with SMTP id o5mr5211340ywf.356.1553202826381; 
	Thu, 21 Mar 2019 14:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
	<875zsed86y.fsf@dusky.pond.sub.org>
In-Reply-To: <875zsed86y.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 21 Mar 2019 22:13:34 +0100
Message-ID: <CAAdtpL535VGZ5RzHFCH2HpRFhRz67kp8PvjdcAGyQo3yJpWdrw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb1bcb0584a136ae"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.51
Subject: Re: [Qemu-arm] [Qemu-devel] Maintainers,
 please tell us how to boot your machines!
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	sandra@codesourcery.com, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul.durrant@citrix.com>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 68bGSKI7BL7n

--000000000000bb1bcb0584a136ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 19 mars 2019 19:40, Markus Armbruster <armbru@redhat.com> a =C3=A9c=
rit :

> Markus Armbruster <armbru@redhat.com> writes:
>
> > Dear board code maintainers,
> >
> > This is a (rather late) follow-up to the last QEMU summit.  Minutes[*]:
> >
> >  * Deprecating unmaintained features (devices, targets, backends) in QE=
MU
> >
> >    QEMU has a mechanism to deprecate features but there remains a lot o=
f
> >    old unmaintained code.  Refactoring is hindered by untested legacy
> >    code, so there is a desire to deprecate unmaintained features more
> >    often.
> >
> >    [...]
> >
> >    We should require at least a minimal test for each board; if nobody
> >    cares enough to come up with one, that board should be deprecated.
> >
> >    [...]
> >
> >    Also see the qemu-devel discussion about deprecating code:
> >
> https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg05828.html.
> >
> > That's a link to "Minutes of KVM Forum BoF on deprecating stuff".
> > Quote:
> >
> >  * One obvious class of candidates for removal is machines we don't kno=
w
> >    how to boot, or can't boot, say because we lack required firmware
> >    and/or OS.
> >
> >    Of course, "can boot" should be an automated test.  As a first step
> >    towards that, we should at least document how to boot each machine.
> >    We're going to ask machine maintainers to do that.
> >
> > Let's get going on this.
> >
> > I gathered the machine types, mapped them to source files, which I fed
> > to get_maintainer.pl.  Results are appended.  If you're cc'ed,
> > MAINTAINERS fingers you for at least one machine type's source file.
> > Please tell us for all of them how to to a "meaningful" boot test.
> >
> > For now, what's "meaningful" is entirely up to you.  Booting Linux
> > certainly is.
> >
> > Make sure to include a complete QEMU command line.  If your QEMU comman=
d
> > line requires resources beyond the QEMU source tree and what we build
> > from it, please detail them, and provide download URLs as far as
> > possible.
> >
> > Goals for this exercise:
> >
> > * Gather information we need to cover more machines in our automated
> >   testing.
> >
> >   Related work:
> >   [PATCH v4 00/19] Acceptance Tests: target architecture support
> >   Message-Id: <20190312121150.8638-1-crosa@redhat.com>
> >   https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg03881.html
> >
> > * Maybe identify a few machines we don't know how to boot anymore.
> >
> > Thanks in advance for your help!
>
> Quite a few maintainers replied, and a few others, too.  Thank you!
>
> I still have to fully digest the replies, in particular whether there's
> enough detail for me to actually boot a guest.
>
> I'm still lacking information on 26 machines.  If you're cc'ed, you're
> considered a possible source of information.  Please help.
>
> If you're a supporter or maintainer, but can't help, please consider
> adjusting MAINTAINERS to S: Odd Fixes for the machine.
>
> Machines with at least one supporter:
>
>     =3D hw/xenpv/xen_machine_pv.c =3D
>     Stefano Stabellini <sstabellini@kernel.org> (supporter:X86)
>     Anthony Perard <anthony.perard@citrix.com> (supporter:X86)
>     Paul Durrant <paul.durrant@citrix.com> (supporter:X86)
>     xen-devel@lists.xenproject.org (open list:X86)
>
> Machines with no supporter, but at least one maintainer:
>
>     =3D hw/arm/integratorcp.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (maintainer:Integrator CP)
>     qemu-arm@nongnu.org (open list:Integrator CP)
>
>     =3D hw/arm/omap_sx1.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (maintainer:OMAP)
>     qemu-arm@nongnu.org (open list:ARM)
>
>     =3D hw/mips/mips_jazz.c =3D
>     "Herv=C3=A9 Poussineau" <hpoussin@reactos.org> (maintainer:Jazz)
>     Aleksandar Rikalo <arikalo@wavecomp.com> (reviewer:Jazz)
>     Aurelien Jarno <aurelien@aurel32.net> (maintainer:MIPS)
>     Aleksandar Markovic <amarkovic@wavecomp.com> (maintainer:MIPS)
>
>     =3D hw/mips/mips_r4k.c =3D
>     Aurelien Jarno <aurelien@aurel32.net> (maintainer:R4000)
>     Aleksandar Rikalo <arikalo@wavecomp.com> (reviewer:R4000)
>     Aleksandar Markovic <amarkovic@wavecomp.com> (maintainer:MIPS)
>
>     =3D hw/moxie/moxiesim.c =3D
>     Anthony Green <green@moxielogic.com> (maintainer:Moxie)
>
>     =3D hw/nios2/10m50_devboard.c =3D
>     Chris Wulff <crwulff@gmail.com> (maintainer:NiosII)
>     Marek Vasut <marex@denx.de> (maintainer:NiosII)
>
>     =3D hw/ppc/virtex_ml507.c =3D
>     "Edgar E. Iglesias" <edgar.iglesias@gmail.com> (odd
> fixer:virtex_ml507)
>     David Gibson <david@gibson.dropbear.id.au> (maintainer:PowerPC)
>     qemu-ppc@nongnu.org (open list:virtex_ml507)
>
>     =3D hw/tricore/tricore_testboard.c =3D
>     Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> (maintainer:TriCore)
>
>     =3D hw/unicore32/puv3.c =3D
>     Guan Xuetao <gxt@mprc.pku.edu.cn> (maintainer:UniCore32)
>
> Machines with no maintainer and no supporter:
>
>     =3D hw/arm/collie.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:Sharp SL-5500
> (Co...)
>     qemu-arm@nongnu.org (open list:Sharp SL-5500 (Co...)
>
>     =3D hw/arm/exynos4_boards.c =3D
>     Igor Mitsyanko <i.mitsyanko@gmail.com> (odd fixer:Exynos)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:Exynos)
>     qemu-arm@nongnu.org (open list:Exynos)
>
>     =3D hw/arm/imx25_pdk.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:i.MX25 PDK)
>     Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:i.MX25 PDK)
>     qemu-arm@nongnu.org (open list:i.MX25 PDK)
>
>     =3D hw/arm/mainstone.c =3D
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)
>
>     =3D hw/arm/mcimx6ul-evk.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:MCIMX6UL EVK /
> i....)
>     Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:MCIMX6UL EVK /
> i....)
>     qemu-arm@nongnu.org (open list:MCIMX6UL EVK / i....)
>
>     =3D hw/arm/mcimx7d-sabre.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:MCIMX7D SABRE /
> i...)
>     Andrey Smirnov <andrew.smirnov@gmail.com> (reviewer:MCIMX7D SABRE /
> i...)
>     qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...)
>
>     =3D hw/arm/musicpal.c =3D
>     Jan Kiszka <jan.kiszka@web.de> (odd fixer:Musicpal)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:Musicpal)
>     qemu-arm@nongnu.org (open list:Musicpal)
>
>     =3D hw/arm/palm.c =3D
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:Palm)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:Palm)
>     qemu-arm@nongnu.org (open list:Palm)
>
>     =3D hw/arm/sabrelite.c =3D
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6=
)
>     Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE /
> i.MX6)
>     qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)
>
>     =3D hw/arm/spitz.c =3D
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)
>
>     =3D hw/arm/tosa.c =3D
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)
>
>     =3D hw/arm/z2.c =3D
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)
>
>     =3D hw/ppc/mpc8544ds.c =3D
>     David Gibson <david@gibson.dropbear.id.au> (odd fixer:mpc8544ds)
>     qemu-ppc@nongnu.org (open list:mpc8544ds)
>     Alexander Graf <agraf@suse.de> (ratted out by David)
>
>     =3D hw/ppc/ppc405_boards.c =3D
>     David Gibson <david@gibson.dropbear.id.au> (odd fixer:ppc4xx)
>     qemu-ppc@nongnu.org (open list:ppc4xx) (ratted out by David)
>
> Machines in danger of being orphaned & deprecated:
>
>     =3D hw/lm32/lm32_boards.c =3D
>     Michael Walle <michael@walle.cc> (maintainer:LM32)
>
>     =3D hw/lm32/milkymist.c =3D
>     Michael Walle <michael@walle.cc> (maintainer:milkymist)
>
> Targets where we have received information for *no* machine so far:
>
>     lm32
>     moxie
>     nios2
>

Sandra Loosemore seems to use this board.

    tricore
>     unicore
>
>

--000000000000bb1bcb0584a136ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le mar. 19 mars 2019 19:40, Markus Armbruster &lt;<a href=3D"mailto:armbru@=
redhat.com">armbru@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:armbru@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; Dear board code maintainers,<br>
&gt;<br>
&gt; This is a (rather late) follow-up to the last QEMU summit.=C2=A0 Minut=
es[*]:<br>
&gt;<br>
&gt;=C2=A0 * Deprecating unmaintained features (devices, targets, backends)=
 in QEMU<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 QEMU has a mechanism to deprecate features but there rema=
ins a lot of<br>
&gt;=C2=A0 =C2=A0 old unmaintained code.=C2=A0 Refactoring is hindered by u=
ntested legacy<br>
&gt;=C2=A0 =C2=A0 code, so there is a desire to deprecate unmaintained feat=
ures more<br>
&gt;=C2=A0 =C2=A0 often.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 [...]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 We should require at least a minimal test for each board;=
 if nobody<br>
&gt;=C2=A0 =C2=A0 cares enough to come up with one, that board should be de=
precated.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 [...]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Also see the qemu-devel discussion about deprecating code=
:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://lists.nongnu.org/archive/html/qemu-dev=
el/2018-10/msg05828.html" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg05828.html</a>.<=
br>
&gt;<br>
&gt; That&#39;s a link to &quot;Minutes of KVM Forum BoF on deprecating stu=
ff&quot;.<br>
&gt; Quote:<br>
&gt;<br>
&gt;=C2=A0 * One obvious class of candidates for removal is machines we don=
&#39;t know<br>
&gt;=C2=A0 =C2=A0 how to boot, or can&#39;t boot, say because we lack requi=
red firmware<br>
&gt;=C2=A0 =C2=A0 and/or OS.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Of course, &quot;can boot&quot; should be an automated te=
st.=C2=A0 As a first step<br>
&gt;=C2=A0 =C2=A0 towards that, we should at least document how to boot eac=
h machine.<br>
&gt;=C2=A0 =C2=A0 We&#39;re going to ask machine maintainers to do that.<br=
>
&gt;<br>
&gt; Let&#39;s get going on this.<br>
&gt;<br>
&gt; I gathered the machine types, mapped them to source files, which I fed=
<br>
&gt; to <a href=3D"http://get_maintainer.pl" rel=3D"noreferrer noreferrer" =
target=3D"_blank">get_maintainer.pl</a>.=C2=A0 Results are appended.=C2=A0 =
If you&#39;re cc&#39;ed,<br>
&gt; MAINTAINERS fingers you for at least one machine type&#39;s source fil=
e.<br>
&gt; Please tell us for all of them how to to a &quot;meaningful&quot; boot=
 test.<br>
&gt;<br>
&gt; For now, what&#39;s &quot;meaningful&quot; is entirely up to you.=C2=
=A0 Booting Linux<br>
&gt; certainly is.<br>
&gt;<br>
&gt; Make sure to include a complete QEMU command line.=C2=A0 If your QEMU =
command<br>
&gt; line requires resources beyond the QEMU source tree and what we build<=
br>
&gt; from it, please detail them, and provide download URLs as far as<br>
&gt; possible.<br>
&gt;<br>
&gt; Goals for this exercise:<br>
&gt;<br>
&gt; * Gather information we need to cover more machines in our automated<b=
r>
&gt;=C2=A0 =C2=A0testing.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Related work:<br>
&gt;=C2=A0 =C2=A0[PATCH v4 00/19] Acceptance Tests: target architecture sup=
port<br>
&gt;=C2=A0 =C2=A0Message-Id: &lt;<a href=3D"mailto:20190312121150.8638-1-cr=
osa@redhat.com" target=3D"_blank" rel=3D"noreferrer">20190312121150.8638-1-=
crosa@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2=
019-03/msg03881.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2019-03/msg03881.html</a><br>
&gt;<br>
&gt; * Maybe identify a few machines we don&#39;t know how to boot anymore.=
<br>
&gt;<br>
&gt; Thanks in advance for your help!<br>
<br>
Quite a few maintainers replied, and a few others, too.=C2=A0 Thank you!<br=
>
<br>
I still have to fully digest the replies, in particular whether there&#39;s=
<br>
enough detail for me to actually boot a guest.<br>
<br>
I&#39;m still lacking information on 26 machines.=C2=A0 If you&#39;re cc&#3=
9;ed, you&#39;re<br>
considered a possible source of information.=C2=A0 Please help.<br>
<br>
If you&#39;re a supporter or maintainer, but can&#39;t help, please conside=
r<br>
adjusting MAINTAINERS to S: Odd Fixes for the machine.<br>
<br>
Machines with at least one supporter:<br>
<br>
=C2=A0 =C2=A0 =3D hw/xenpv/xen_machine_pv.c =3D<br>
=C2=A0 =C2=A0 Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt; (su=
pporter:X86)<br>
=C2=A0 =C2=A0 Anthony Perard &lt;<a href=3D"mailto:anthony.perard@citrix.co=
m" target=3D"_blank" rel=3D"noreferrer">anthony.perard@citrix.com</a>&gt; (=
supporter:X86)<br>
=C2=A0 =C2=A0 Paul Durrant &lt;<a href=3D"mailto:paul.durrant@citrix.com" t=
arget=3D"_blank" rel=3D"noreferrer">paul.durrant@citrix.com</a>&gt; (suppor=
ter:X86)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_=
blank" rel=3D"noreferrer">xen-devel@lists.xenproject.org</a> (open list:X86=
)<br>
<br>
Machines with no supporter, but at least one maintainer:<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/integratorcp.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (mai=
ntainer:Integrator CP)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:Integrator CP)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/omap_sx1.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (mai=
ntainer:OMAP)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:ARM)<br>
<br>
=C2=A0 =C2=A0 =3D hw/mips/mips_jazz.c =3D<br>
=C2=A0 =C2=A0 &quot;Herv=C3=A9 Poussineau&quot; &lt;<a href=3D"mailto:hpous=
sin@reactos.org" target=3D"_blank" rel=3D"noreferrer">hpoussin@reactos.org<=
/a>&gt; (maintainer:Jazz)<br>
=C2=A0 =C2=A0 Aleksandar Rikalo &lt;<a href=3D"mailto:arikalo@wavecomp.com"=
 target=3D"_blank" rel=3D"noreferrer">arikalo@wavecomp.com</a>&gt; (reviewe=
r:Jazz)<br>
=C2=A0 =C2=A0 Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" ta=
rget=3D"_blank" rel=3D"noreferrer">aurelien@aurel32.net</a>&gt; (maintainer=
:MIPS)<br>
=C2=A0 =C2=A0 Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.=
com" target=3D"_blank" rel=3D"noreferrer">amarkovic@wavecomp.com</a>&gt; (m=
aintainer:MIPS)<br>
<br>
=C2=A0 =C2=A0 =3D hw/mips/mips_r4k.c =3D<br>
=C2=A0 =C2=A0 Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" ta=
rget=3D"_blank" rel=3D"noreferrer">aurelien@aurel32.net</a>&gt; (maintainer=
:R4000)<br>
=C2=A0 =C2=A0 Aleksandar Rikalo &lt;<a href=3D"mailto:arikalo@wavecomp.com"=
 target=3D"_blank" rel=3D"noreferrer">arikalo@wavecomp.com</a>&gt; (reviewe=
r:R4000)<br>
=C2=A0 =C2=A0 Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.=
com" target=3D"_blank" rel=3D"noreferrer">amarkovic@wavecomp.com</a>&gt; (m=
aintainer:MIPS)<br>
<br>
=C2=A0 =C2=A0 =3D hw/moxie/moxiesim.c =3D<br>
=C2=A0 =C2=A0 Anthony Green &lt;<a href=3D"mailto:green@moxielogic.com" tar=
get=3D"_blank" rel=3D"noreferrer">green@moxielogic.com</a>&gt; (maintainer:=
Moxie)<br>
<br>
=C2=A0 =C2=A0 =3D hw/nios2/10m50_devboard.c =3D<br>
=C2=A0 =C2=A0 Chris Wulff &lt;<a href=3D"mailto:crwulff@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">crwulff@gmail.com</a>&gt; (maintainer:NiosII=
)<br>
=C2=A0 =C2=A0 Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_b=
lank" rel=3D"noreferrer">marex@denx.de</a>&gt; (maintainer:NiosII)<br>
<br>
=C2=A0 =C2=A0 =3D hw/ppc/virtex_ml507.c =3D<br>
=C2=A0 =C2=A0 &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.igl=
esias@gmail.com" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@gmail.=
com</a>&gt; (odd fixer:virtex_ml507)<br>
=C2=A0 =C2=A0 David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.a=
u" target=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;=
 (maintainer:PowerPC)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-ppc@nongnu.org</a> (open list:virtex_ml507)<br>
<br>
=C2=A0 =C2=A0 =3D hw/tricore/tricore_testboard.c =3D<br>
=C2=A0 =C2=A0 Bastian Koppelmann &lt;<a href=3D"mailto:kbastian@mail.uni-pa=
derborn.de" target=3D"_blank" rel=3D"noreferrer">kbastian@mail.uni-paderbor=
n.de</a>&gt; (maintainer:TriCore)<br>
<br>
=C2=A0 =C2=A0 =3D hw/unicore32/puv3.c =3D<br>
=C2=A0 =C2=A0 Guan Xuetao &lt;<a href=3D"mailto:gxt@mprc.pku.edu.cn" target=
=3D"_blank" rel=3D"noreferrer">gxt@mprc.pku.edu.cn</a>&gt; (maintainer:UniC=
ore32)<br>
<br>
Machines with no maintainer and no supporter:<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/collie.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:Sharp SL-5500 (Co...)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:Sharp SL-5500 (Co...)<br=
>
<br>
=C2=A0 =C2=A0 =3D hw/arm/exynos4_boards.c =3D<br>
=C2=A0 =C2=A0 Igor Mitsyanko &lt;<a href=3D"mailto:i.mitsyanko@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">i.mitsyanko@gmail.com</a>&gt; (odd fixe=
r:Exynos)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:Exynos)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:Exynos)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/imx25_pdk.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:i.MX25 PDK)<br>
=C2=A0 =C2=A0 Jean-Christophe Dubois &lt;<a href=3D"mailto:jcd@tribudubois.=
net" target=3D"_blank" rel=3D"noreferrer">jcd@tribudubois.net</a>&gt; (revi=
ewer:i.MX25 PDK)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:i.MX25 PDK)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/mainstone.c =3D<br>
=C2=A0 =C2=A0 Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">balrogg@gmail.com</a>&gt; (odd fixer:PX=
A2XX)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:PXA2XX)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:PXA2XX)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/mcimx6ul-evk.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:MCIMX6UL EVK / i....)<br>
=C2=A0 =C2=A0 Jean-Christophe Dubois &lt;<a href=3D"mailto:jcd@tribudubois.=
net" target=3D"_blank" rel=3D"noreferrer">jcd@tribudubois.net</a>&gt; (revi=
ewer:MCIMX6UL EVK / i....)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:MCIMX6UL EVK / i....)<br=
>
<br>
=C2=A0 =C2=A0 =3D hw/arm/mcimx7d-sabre.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:MCIMX7D SABRE / i...)<br>
=C2=A0 =C2=A0 Andrey Smirnov &lt;<a href=3D"mailto:andrew.smirnov@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">andrew.smirnov@gmail.com</a>&gt; (re=
viewer:MCIMX7D SABRE / i...)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:MCIMX7D SABRE / i...)<br=
>
<br>
=C2=A0 =C2=A0 =3D hw/arm/musicpal.c =3D<br>
=C2=A0 =C2=A0 Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@web.de" target=3D=
"_blank" rel=3D"noreferrer">jan.kiszka@web.de</a>&gt; (odd fixer:Musicpal)<=
br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:Musicpal)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:Musicpal)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/palm.c =3D<br>
=C2=A0 =C2=A0 Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">balrogg@gmail.com</a>&gt; (odd fixer:Pa=
lm)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:Palm)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:Palm)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/sabrelite.c =3D<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:SABRELITE / i.MX6)<br>
=C2=A0 =C2=A0 Jean-Christophe Dubois &lt;<a href=3D"mailto:jcd@tribudubois.=
net" target=3D"_blank" rel=3D"noreferrer">jcd@tribudubois.net</a>&gt; (revi=
ewer:SABRELITE / i.MX6)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:SABRELITE / i.MX6)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/spitz.c =3D<br>
=C2=A0 =C2=A0 Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">balrogg@gmail.com</a>&gt; (odd fixer:PX=
A2XX)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:PXA2XX)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:PXA2XX)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/tosa.c =3D<br>
=C2=A0 =C2=A0 Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">balrogg@gmail.com</a>&gt; (odd fixer:PX=
A2XX)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:PXA2XX)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:PXA2XX)<br>
<br>
=C2=A0 =C2=A0 =3D hw/arm/z2.c =3D<br>
=C2=A0 =C2=A0 Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">balrogg@gmail.com</a>&gt; (odd fixer:PX=
A2XX)<br>
=C2=A0 =C2=A0 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; (odd=
 fixer:PXA2XX)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-arm@nongnu.org</a> (open list:PXA2XX)<br>
<br>
=C2=A0 =C2=A0 =3D hw/ppc/mpc8544ds.c =3D<br>
=C2=A0 =C2=A0 David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.a=
u" target=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;=
 (odd fixer:mpc8544ds)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-ppc@nongnu.org</a> (open list:mpc8544ds)<br>
=C2=A0 =C2=A0 Alexander Graf &lt;<a href=3D"mailto:agraf@suse.de" target=3D=
"_blank" rel=3D"noreferrer">agraf@suse.de</a>&gt; (ratted out by David)<br>
<br>
=C2=A0 =C2=A0 =3D hw/ppc/ppc405_boards.c =3D<br>
=C2=A0 =C2=A0 David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.a=
u" target=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;=
 (odd fixer:ppc4xx)<br>
=C2=A0 =C2=A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=3D"_blank" rel=
=3D"noreferrer">qemu-ppc@nongnu.org</a> (open list:ppc4xx) (ratted out by D=
avid)<br>
<br>
Machines in danger of being orphaned &amp; deprecated:<br>
<br>
=C2=A0 =C2=A0 =3D hw/lm32/lm32_boards.c =3D<br>
=C2=A0 =C2=A0 Michael Walle &lt;michael@walle.cc&gt; (maintainer:LM32)<br>
<br>
=C2=A0 =C2=A0 =3D hw/lm32/milkymist.c =3D<br>
=C2=A0 =C2=A0 Michael Walle &lt;michael@walle.cc&gt; (maintainer:milkymist)=
<br>
<br>
Targets where we have received information for *no* machine so far:<br>
<br>
=C2=A0 =C2=A0 lm32<br>
=C2=A0 =C2=A0 moxie<br>
=C2=A0 =C2=A0 nios2<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Sandra Loosemore seems to use this board.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
=C2=A0 =C2=A0 tricore<br>
=C2=A0 =C2=A0 unicore<br>
<br>
</blockquote></div></div></div>

--000000000000bb1bcb0584a136ae--
