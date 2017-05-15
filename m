Received: by 10.25.0.6 with SMTP id 6csp1601559lfa;
        Mon, 15 May 2017 14:44:14 -0700 (PDT)
X-Received: by 10.55.192.145 with SMTP id v17mr6661422qkv.96.1494884654577;
        Mon, 15 May 2017 14:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494884654; cv=none;
        d=google.com; s=arc-20160816;
        b=r1KU/TlaGafHw2/VStqg5GUcIzqmoM/v80EQDLYh1478BcemsP4TH93Zmte4eUiNFq
         PYxdIQiXuLjIZctuK1j70U51hOWOyacjA48IYPkIKg2cpDY2JOD8kV2SooXm6DVc27sI
         R07wvS5KRF+SCigCg9mwn0cpyE4D0uI0Iu0YqUuxMKVe2KuDLhdlzAEp7e3y3ZGwzucH
         PmfQ8RFfwXO6HpKlHJkg8fSitlUxBMmzNXGlG4Skiru2VPFIU+jAVPlgu8MfQoF2N+x+
         Bquco/qU37VOta4clOAfeqSZnWSN5b4hK0W3ab6fdWIURsEU3nqPhztSvfeE6zOmxRSL
         bRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-length:mime-version:references
         :in-reply-to:message-id:to:date:dkim-signature
         :arc-authentication-results;
        bh=aybs/bIRS1xMuYUlFy1EqrQxIqmOYbMLKwUMofagV3s=;
        b=ARka6dj92WDjDkV4XNKOGRclQA6alVtHbjjsbiilc02j6AsSepgUrDmdPuhQ3c1Ndy
         Wwxdy/yiAenT0vt8aB3C034fZiLWEECjL4WQskNdXwvvdN4sEdfQptZyBOTjI5JnMkHV
         s/64E8UnPhEIWjQSEHEwEJCSPcTZ9AbFs14kXR0phhgXLsHQlUlXPrD1SshnS4EcWA6T
         PuBFFMhrCV3Vst/pKZecrZpeaWYV+xb5AnrJ05D1YJ/Mif4V12wxY1noqQauoq+8qltY
         c0OKTZNRci9GdCabdHQUCHYXyrCwGuMXdx9+sO6iXNbPVo9ccyeuJEkXUOPZd/pIFVzv
         k2Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 58si7405744qtt.218.2017.05.15.14.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 14:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dANmn-0006tH-VC
	for alex.bennee@linaro.org; Mon, 15 May 2017 17:44:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAK96-0004oJ-QU
	for qemu-devel@nongnu.org; Mon, 15 May 2017 13:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAK92-0004mv-OU
	for qemu-devel@nongnu.org; Mon, 15 May 2017 13:51:00 -0400
Received: from nm10-vm8.bullet.mail.ir2.yahoo.com ([212.82.96.160]:45306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAK92-0004lP-3w
	for qemu-devel@nongnu.org; Mon, 15 May 2017 13:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1494870654; bh=Fy4RWb2Lf+zaoJp4+Pd5N0Vy8YLseMHJKF4VcKH5kBM=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=XVnTrIoShRGoMonsRQjROsnn55UXaUaUZl9Nyq7xFcWxIpm1KGu025wAYi6B0973tzHR64LsIgadX9a+H0dtJB7HcmaaoGzk0QipwN8uH8v7p3D78qKVqagXB36GIC8+zIpbR3C/IByFStre3/ka07u1pKT/oP2+jFNMYYMiSMdcVABxIqXCp3+1F3aNpPueGDG/zq/aj9Oojp3kAwR0tw3bUdzgXllKLlesnVPBNwrdvddadT/OD2uAgDVXp0s4twDzqI6XDCANAoAZ8rNik4UaWfOuFdjkd+Bgo60m6GjRSo/TXM9YNkLFjntkfdlDtSEjuT/qv6mxmeXCSgW0XQ==
Received: from [212.82.98.52] by nm10.bullet.mail.ir2.yahoo.com with NNFMP;
	15 May 2017 17:50:54 -0000
Received: from [212.82.98.102] by tm5.bullet.mail.ir2.yahoo.com with NNFMP;
	15 May 2017 17:50:54 -0000
Received: from [127.0.0.1] by omp1039.mail.ir2.yahoo.com with NNFMP;
	15 May 2017 17:50:54 -0000
X-Yahoo-Newman-Property: ymail-4
X-Yahoo-Newman-Id: 419905.66471.bm@omp1039.mail.ir2.yahoo.com
X-YMail-OSG: 4tUyVLQVM1lJviQVfehHLZOrVcBJvsRRNlLdcQctAtIefQ4OJIFxtX_v6VxvRXg
	KDRW64f7tUFrQTsBIfHnjx_isTJWJuBbtgykk6azoL4FknbI7oL1ftq7o9TSBlIR4emk5kFFHDBf
	uXbtX93J1X38pCyBNF1Veb6jdq6LuFqPxjAWw16GZ5QEzdX.YJlc1SdrVWj6o_oCqAnfc4QG.6YF
	e5SEoN3KoqE8dlpxGWhOPEodUqO2a499i3BQxvoPhh2cr40r_kymZ_G.6V5KM9UBkeJjSNJ7tfz2
	AZs_wi7EZyXNAOUqts_UXHpl6k3EnifCl1s27px8xBll5kqI6ECKcxiTHVXd1vS5aADlkdKS1us8
	CHHBJGBUdGefsGqPGXUfCPxmiPt0HF0yaymd2Ch_kMRnU5pdveYfxzBhLcMK_0u8N_JbUg8UHZQP
	cTJLUn0UndoohpLRwDXOtNuPLVbQbCAMlVhC3_Fzt43MvitwmMeI8HwdyKmqrq4Z8jcVr.hdg3nW
	oRZbZPjf1I.do2n0MNCX9anZwQOy7m947x7PGi0nJAuqXHE9xknsq1g8-
Received: from jws700026.mail.ir2.yahoo.com by
	sendmailws168.mail.ir2.yahoo.com;
	Mon, 15 May 2017 17:50:53 +0000; 1494870653.854
Date: Mon, 15 May 2017 17:50:47 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <1337329283.3100470.1494870647989@mail.yahoo.com>
In-Reply-To: <CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.9641 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 212.82.96.160
X-Mailman-Approved-At: Mon, 15 May 2017 17:42:10 -0400
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Changes to Broadcom(BCM) files and Raspberry Pi
 files. Addition of PanelEmu
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
From: John Bradley via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: John Bradley <flypie1@yahoo.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cnx2iXPvTLn

Hi,
That is going to be very difficult as a lot of the changes are interlinked =
the vast majority of the patch is new files.=C2=A0John BradleyTel: 07896 83=
9635Skype: flypie125 125B Grove StreetEdge Hill Liverpool L7 7AF=20

    On Monday, 15 May 2017, 17:54, Alistair Francis <alistair.francis@xilin=
x.com> wrote:
=20

 On Sat, May 13, 2017 at 5:42 PM, John Bradley via Qemu-devel
<qemu-devel@nongnu.org> wrote:
> From 7f74f048f135d9c9c230a9e90f72451c841c6d35 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Sat, 13 May 2017 23:07:47 +0100
> Subject: [PATCH] Changes to Broadcom(BCM) files and Raspberry Pi files.
> Addition of PanelEmu
>
> The files add the ability to attach, via TCP, a panel emulator
> The include a unification of several PD Raspberry PI additions
> A modification to dev-network to all circle SDK WWW client to work
> The DummyPanel is not included but available at
> https://github.com/flypie/GDummyPanel.git
>
> Signed-off-by: John Bradley <flypie@rocketmail.com>

Hey John,

Thanks for the patch!

Unfortunately this patch is too long to review, you need to split the
patch up into shorter more readable patches. Otherwise it's too hard
to people to understand what you are changing and why.

There are some details here:
http://wiki.qemu.org/Contribute/SubmitAPatch about how to split up
patches. Each patch applied in order shouldn't break any compilation
or runtime. Generally the flow is to add the logic in earlier patches
and then connect it and switch it on in the later patches.

Try splitting up adding/editing each individual device and send that
our first. That is generally the easiest to review/accept.

Thanks,

Alistair

> ---
> .gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++
> hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-
> hw/arm/bcm2835.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 114 ++++
> hw/arm/bcm2835_peripherals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 ++++
> hw/arm/bcm2836.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-
> hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 77 ++-
> hw/gpio/bcm2835_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 333 ++++++-----
> hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +
> hw/misc/bcm2835_mphi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 163 ++++++
> hw/misc/bcm2835_power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 106 ++++
> hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +
> hw/timer/bcm2835_st.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 202 +++++++
> hw/timer/bcm2835_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 224 +++++++
> hw/usb/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 4 +-
> hw/usb/bcm2835_usb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 604 +++++++++++++++++++
> hw/usb/bcm2835_usb_regs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1061=
 ++++++++++++++++++++++++++++++++++
> hw/usb/dev-network.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-
> include/hw/arm/bcm2835.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 37 ++
> include/hw/arm/bcm2835_peripherals.h |=C2=A0 10 +
> include/hw/gpio/bcm2835_gpio.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +
> include/hw/intc/bcm2835_control.h=C2=A0 =C2=A0 |=C2=A0 53 ++
> include/hw/intc/bcm2836_control.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +
> include/hw/misc/bcm2835_mphi.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +
> include/hw/misc/bcm2835_power.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +
> include/hw/timer/bcm2835_st.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +
> include/hw/timer/bcm2835_timer.h=C2=A0 =C2=A0 |=C2=A0 32 +
> include/hw/usb/bcm2835_usb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++
> include/qemu/PanelEmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 53 ++
> util/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 1 +
> util/PanelEmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 293 ++++++++++
> 30 files changed, 3547 insertions(+), 149 deletions(-)
> create mode 100644 hw/arm/bcm2835.c
> create mode 100644 hw/misc/bcm2835_mphi.c
> create mode 100644 hw/misc/bcm2835_power.c
> create mode 100644 hw/timer/bcm2835_st.c
> create mode 100644 hw/timer/bcm2835_timer.c
> create mode 100644 hw/usb/bcm2835_usb.c
> create mode 100644 hw/usb/bcm2835_usb_regs.h
> create mode 100644 include/hw/arm/bcm2835.h
> create mode 100644 include/hw/intc/bcm2835_control.h
> create mode 100644 include/hw/misc/bcm2835_mphi.h
> create mode 100644 include/hw/misc/bcm2835_power.h
> create mode 100644 include/hw/timer/bcm2835_st.h
> create mode 100644 include/hw/timer/bcm2835_timer.h
> create mode 100644 include/hw/usb/bcm2835_usb.h
> create mode 100644 include/qemu/PanelEmu.h
> create mode 100644 util/PanelEmu.c
>


  =20
