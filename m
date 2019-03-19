Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3846603wrt;
        Tue, 19 Mar 2019 11:39:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+ig8pxSaqg52sITKxcBjhMYfwV0ukTOprzncaUtdyGKt0eobx+DEp4jwxRQ8A+2zYgdNK
X-Received: by 2002:a1c:35c5:: with SMTP id c188mr4683095wma.79.1553020764435;
        Tue, 19 Mar 2019 11:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553020764; cv=none;
        d=google.com; s=arc-20160816;
        b=riPqd1iMd7Cjh4oc1R0/0THAlfbslvdw7SJYHKJlrRb7OcEt2okJX2gaOmCy0TlOLh
         DjqvKSpi6Xv8CuSQuB8JYMSV2VmdP3dRcSKvCuixkyoj589OPN9kRFEh2KCA9Z+z+vaS
         eyeuoiDEGdNeDeS6SaPJOnQGcfEwCeFbXI/L1klzrP7sdlM3D1kDMF+QsZPbrnVFDDpH
         AVU2orBmgaCbTkFLaJAZ9dUcqtcSOWP/pgvQ0aqpM9UJ7rqtkRFx569t1xwRsvtLbNJn
         rV042+pw3n/pMfvM0wmVJHjgvJCvHnh43/y7to7Jy11UYGR7pxB51gbixPeI6DyijBDh
         PDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=tWPhyoUG7iZBYSO7kPx3nuPhp3/GK2ckrT7s+pIyGDI=;
        b=wS872kfkCm8ViaLmBtBlP114qVfVGF8NKbdl8StP8kHor5psPFUJjg1RZarjE3QrgN
         a+WJ8zBNG7niLQkoo1+JgEEPYWKNP1wiof6AIZOi5MhWtaiFTFDB/E1k5fo4QGuTzToS
         7TuzadUo6fSeaAZ0zClL9lmWfpWtrpVz8zZqZlYgCbTqWpUaF196CTZ5kZVQtldnwrMz
         uT0CJwkxYUREvfmSH5kuh7z0WuQYPHoWS0g3huyptYseZlgBsQAmM8qIOe/ZNJn/vRt/
         KJC7anZ9waCwvrtJLpG08M+7gw8OJYNFLs+JRLXJO7A+MqlLgTpVAIUsABQpTeEQFLGF
         UxzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si4371677wrm.306.2019.03.19.11.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Mar 2019 11:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6Jdz-00058k-Fk
	for alex.bennee@linaro.org; Tue, 19 Mar 2019 14:39:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h6JdK-0004qh-82
	for qemu-devel@nongnu.org; Tue, 19 Mar 2019 14:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h6JZe-0001U1-DU
	for qemu-devel@nongnu.org; Tue, 19 Mar 2019 14:34:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h6JZb-0001Ng-SY; Tue, 19 Mar 2019 14:34:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 315A630BC648;
	Tue, 19 Mar 2019 18:34:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-132.ams2.redhat.com
	[10.36.116.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3334F2C230;
	Tue, 19 Mar 2019 18:34:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9107211385E4; Tue, 19 Mar 2019 19:34:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
Date: Tue, 19 Mar 2019 19:34:45 +0100
In-Reply-To: <87d0mwatbu.fsf@dusky.pond.sub.org> (Markus Armbruster's message
	of "Tue, 12 Mar 2019 18:36:05 +0100")
Message-ID: <875zsed86y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 19 Mar 2019 18:34:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Maintainers,
 please tell us how to boot your machines!
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>,
	=?utf-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Paul Durrant <paul.durrant@citrix.com>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHBmRtvphZ/I

Markus Armbruster <armbru@redhat.com> writes:

> Dear board code maintainers,
>
> This is a (rather late) follow-up to the last QEMU summit.  Minutes[*]:
>
>  * Deprecating unmaintained features (devices, targets, backends) in QEMU
>
>    QEMU has a mechanism to deprecate features but there remains a lot of
>    old unmaintained code.  Refactoring is hindered by untested legacy
>    code, so there is a desire to deprecate unmaintained features more
>    often.
>
>    [...]
>
>    We should require at least a minimal test for each board; if nobody
>    cares enough to come up with one, that board should be deprecated.
>
>    [...]
>
>    Also see the qemu-devel discussion about deprecating code:
>    https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg05828.html.
>
> That's a link to "Minutes of KVM Forum BoF on deprecating stuff".
> Quote:
>
>  * One obvious class of candidates for removal is machines we don't know
>    how to boot, or can't boot, say because we lack required firmware
>    and/or OS.
>
>    Of course, "can boot" should be an automated test.  As a first step
>    towards that, we should at least document how to boot each machine.
>    We're going to ask machine maintainers to do that.
>
> Let's get going on this.
>
> I gathered the machine types, mapped them to source files, which I fed
> to get_maintainer.pl.  Results are appended.  If you're cc'ed,
> MAINTAINERS fingers you for at least one machine type's source file.
> Please tell us for all of them how to to a "meaningful" boot test.
>
> For now, what's "meaningful" is entirely up to you.  Booting Linux
> certainly is.
>
> Make sure to include a complete QEMU command line.  If your QEMU command
> line requires resources beyond the QEMU source tree and what we build
> from it, please detail them, and provide download URLs as far as
> possible.
>
> Goals for this exercise:
>
> * Gather information we need to cover more machines in our automated
>   testing.
>
>   Related work:
>   [PATCH v4 00/19] Acceptance Tests: target architecture support
>   Message-Id: <20190312121150.8638-1-crosa@redhat.com>
>   https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg03881.html
>
> * Maybe identify a few machines we don't know how to boot anymore.
>
> Thanks in advance for your help!

Quite a few maintainers replied, and a few others, too.  Thank you!

I still have to fully digest the replies, in particular whether there's
enough detail for me to actually boot a guest.

I'm still lacking information on 26 machines.  If you're cc'ed, you're
considered a possible source of information.  Please help.

If you're a supporter or maintainer, but can't help, please consider
adjusting MAINTAINERS to S: Odd Fixes for the machine.

Machines with at least one supporter:

    =3D hw/xenpv/xen_machine_pv.c =3D
    Stefano Stabellini <sstabellini@kernel.org> (supporter:X86)
    Anthony Perard <anthony.perard@citrix.com> (supporter:X86)
    Paul Durrant <paul.durrant@citrix.com> (supporter:X86)
    xen-devel@lists.xenproject.org (open list:X86)

Machines with no supporter, but at least one maintainer:

    =3D hw/arm/integratorcp.c =3D
    Peter Maydell <peter.maydell@linaro.org> (maintainer:Integrator CP)
    qemu-arm@nongnu.org (open list:Integrator CP)

    =3D hw/arm/omap_sx1.c =3D
    Peter Maydell <peter.maydell@linaro.org> (maintainer:OMAP)
    qemu-arm@nongnu.org (open list:ARM)

    =3D hw/mips/mips_jazz.c =3D
    "Herv=C3=A9 Poussineau" <hpoussin@reactos.org> (maintainer:Jazz)
    Aleksandar Rikalo <arikalo@wavecomp.com> (reviewer:Jazz)
    Aurelien Jarno <aurelien@aurel32.net> (maintainer:MIPS)
    Aleksandar Markovic <amarkovic@wavecomp.com> (maintainer:MIPS)

    =3D hw/mips/mips_r4k.c =3D
    Aurelien Jarno <aurelien@aurel32.net> (maintainer:R4000)
    Aleksandar Rikalo <arikalo@wavecomp.com> (reviewer:R4000)
    Aleksandar Markovic <amarkovic@wavecomp.com> (maintainer:MIPS)

    =3D hw/moxie/moxiesim.c =3D
    Anthony Green <green@moxielogic.com> (maintainer:Moxie)

    =3D hw/nios2/10m50_devboard.c =3D
    Chris Wulff <crwulff@gmail.com> (maintainer:NiosII)
    Marek Vasut <marex@denx.de> (maintainer:NiosII)

    =3D hw/ppc/virtex_ml507.c =3D
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com> (odd fixer:virtex_ml507)
    David Gibson <david@gibson.dropbear.id.au> (maintainer:PowerPC)
    qemu-ppc@nongnu.org (open list:virtex_ml507)

    =3D hw/tricore/tricore_testboard.c =3D
    Bastian Koppelmann <kbastian@mail.uni-paderborn.de> (maintainer:TriCore)

    =3D hw/unicore32/puv3.c =3D
    Guan Xuetao <gxt@mprc.pku.edu.cn> (maintainer:UniCore32)

Machines with no maintainer and no supporter:

    =3D hw/arm/collie.c =3D
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:Sharp SL-5500 (Co..=
.)
    qemu-arm@nongnu.org (open list:Sharp SL-5500 (Co...)

    =3D hw/arm/exynos4_boards.c =3D
    Igor Mitsyanko <i.mitsyanko@gmail.com> (odd fixer:Exynos)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:Exynos)
    qemu-arm@nongnu.org (open list:Exynos)

    =3D hw/arm/imx25_pdk.c =3D
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:i.MX25 PDK)
    Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:i.MX25 PDK)
    qemu-arm@nongnu.org (open list:i.MX25 PDK)

    =3D hw/arm/mainstone.c =3D
    Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
    qemu-arm@nongnu.org (open list:PXA2XX)

    =3D hw/arm/mcimx6ul-evk.c =3D
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:MCIMX6UL EVK / i...=
.)
    Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:MCIMX6UL EVK / i=
....)
    qemu-arm@nongnu.org (open list:MCIMX6UL EVK / i....)

    =3D hw/arm/mcimx7d-sabre.c =3D
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:MCIMX7D SABRE / i..=
.)
    Andrey Smirnov <andrew.smirnov@gmail.com> (reviewer:MCIMX7D SABRE / i..=
.)
    qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...)

    =3D hw/arm/musicpal.c =3D
    Jan Kiszka <jan.kiszka@web.de> (odd fixer:Musicpal)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:Musicpal)
    qemu-arm@nongnu.org (open list:Musicpal)

    =3D hw/arm/palm.c =3D
    Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:Palm)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:Palm)
    qemu-arm@nongnu.org (open list:Palm)

    =3D hw/arm/sabrelite.c =3D
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6)
    Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX=
6)
    qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)

    =3D hw/arm/spitz.c =3D
    Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
    qemu-arm@nongnu.org (open list:PXA2XX)

    =3D hw/arm/tosa.c =3D
    Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
    qemu-arm@nongnu.org (open list:PXA2XX)

    =3D hw/arm/z2.c =3D
    Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
    Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
    qemu-arm@nongnu.org (open list:PXA2XX)

    =3D hw/ppc/mpc8544ds.c =3D
    David Gibson <david@gibson.dropbear.id.au> (odd fixer:mpc8544ds)
    qemu-ppc@nongnu.org (open list:mpc8544ds)
    Alexander Graf <agraf@suse.de> (ratted out by David)

    =3D hw/ppc/ppc405_boards.c =3D
    David Gibson <david@gibson.dropbear.id.au> (odd fixer:ppc4xx)
    qemu-ppc@nongnu.org (open list:ppc4xx) (ratted out by David)

Machines in danger of being orphaned & deprecated:

    =3D hw/lm32/lm32_boards.c =3D
    Michael Walle <michael@walle.cc> (maintainer:LM32)

    =3D hw/lm32/milkymist.c =3D
    Michael Walle <michael@walle.cc> (maintainer:milkymist)

Targets where we have received information for *no* machine so far:

    lm32
    moxie
    nios2
    tricore
    unicore
