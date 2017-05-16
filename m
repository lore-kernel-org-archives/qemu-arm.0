Received: by 10.25.0.6 with SMTP id 6csp1882494lfa;
        Tue, 16 May 2017 06:58:37 -0700 (PDT)
X-Received: by 10.55.7.138 with SMTP id 132mr9487715qkh.274.1494943117880;
        Tue, 16 May 2017 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494943117; cv=none;
        d=google.com; s=arc-20160816;
        b=NKr3ypBzflbs16j4u3e5C0SBuaNZf6npjQXmpBQZDXHrcbZ8wXNIvD2Jsf260HFDGu
         x4jACTjhWzT5kfNaEqUWqo/LVECXfjhVcrN3nYBxuG4MZPRGqrLYk6mel/dxFvTM3fd5
         HbRPsNyy6l8/0Ix5re4qJVU+++0xkJKJNnpKCdGeigQbxGZXq6QMihYhpqyxlQf3wUTa
         QWEPv6215bdXHep5286vbZX8VQ5GK+UOEer8/dZ+eDTWcOjiOcVsdTX7xs7xhD85b+Ez
         UKcwMtwnC0lOgKkziVb3xIJJKoavEOEpYjrWjch07SY4Jlhr5iyPmCxSgflTmqBlUyGE
         GWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:mime-version:references:in-reply-to:message-id:to
         :date:dkim-signature:arc-authentication-results;
        bh=sDrVwh7tF4gxpDN/KXmLRBaaG/4mFyXmHfQnxRkdZps=;
        b=hZRWdunQ8kjNYN/IvESugyVt/BFxq5uS9t12KUJTJEdAqPt3Nrm6YpHRP8AqBwBEQk
         lMckfL+TecMzIBI/OHlIMxceRGpxEjRtAlz81xliGM06HPdGgDzZTH/7916TaO5MDVCF
         dil2wG/liFlPIgxRGis3zqrFnvDIf+MMVo9+hPojyhZksyPT/OVscOY6tVzol+duh3wf
         HmofymoZ1/Xwhd0fg6kNnkBnscAEnQwNTt6OqfNr5SieMYVpotljNainSeEwipoBiOFD
         ilX0FPuYbtA1mChJbTxSTk0edtujp4LaivFCeJhTZAxOTkYQdJVA+9io53j4dcIsKkv4
         KkjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si13607783qtc.10.2017.05.16.06.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 06:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAczl-0000zO-BC
	for alex.bennee@linaro.org; Tue, 16 May 2017 09:58:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAczE-0000db-EE
	for qemu-arm@nongnu.org; Tue, 16 May 2017 09:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAczA-0005qU-EB
	for qemu-arm@nongnu.org; Tue, 16 May 2017 09:58:04 -0400
Received: from sonic306-47.consmr.mail.ir2.yahoo.com ([77.238.176.233]:43495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAczA-0005pS-1H
	for qemu-arm@nongnu.org; Tue, 16 May 2017 09:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1494943077; bh=sDrVwh7tF4gxpDN/KXmLRBaaG/4mFyXmHfQnxRkdZps=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=MzoNKxy2W1j/cPZTXdFUE2E8rn5Sc2T25hoAf17zK+WDClPtFjPJqIPlaCr86R8BZrT/R0Vst1gutc+42jPQ3S1IHpp5maUuK90YqbLPrJLP6H4q4kHfzChlOCE7VXqtxUyg9LIB2Oe9gVGYG52OU0WGCWo9iVVStApxArCJeh+Wcgapp5XuYJ4ue/eytmi/Z3QAtCILClZKWxUcQGlhGRcG9yyntl9jY6POfpZYiEcQj1znQ4IOTddTy6izTTZOvmX1bau9jR6f5I5x8uh1XDEiip5V04zst+bGpau6PH9AxdEeAfItGtB4XwZJDEw+wXvKRNuP5ljna2nHaG9B0w==
X-YMail-OSG: c9gCBFEVM1mGyNOfg1yXYDKMM0u.zuy71R7.3ZBOI9p4hsVmMu52PkJIG43yPmf
	lK_hB.tC4g_8z2ESKMaQsSDnxXauPf1q81SCblSXwe_b1QbJg76421ugbvFPKwFVUdrU8Zq9IkXu
	BefynDvzN.Ffzmj9.4yvBdj9io161PGHI.nMW.SkBNggrFUsuxxRkfOaovfgMSG7I9LZ9RJxe_mK
	m6N3cv1i6QyylzAntE7PESP31pQsTY81ax4ZDL4ql.7M6IaT1D3Wx3rdxhj9ZLdN__pBwJ4cRPAU
	8iWxea7W9QHWvusgu21FpptrED6tFMWKH4iH6e.hFYXuMLv2qWdpwxIDcSX7_lMKpDtXP5zgEbKc
	u3omXNK7wPkyPuacotJgLtmHbTH8anSmJLlYa6Mt0fvXWO2daCdWb4958jzHWhx2bmTwGMzfyVFt
	ySiGCIv9hvF3_GfjSl6J_3OA.meBZrPDZUWwAORtMdZNMbGHvTP6AyksE8xX.57DU1emdz9KLW07
	WiCpy1AEIBq7TSvFGhBvUGHHt_AfF7MYP6X2.YcMZ05HEW62JWHkLAZl_
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ir2.yahoo.com with HTTP;
	Tue, 16 May 2017 13:57:57 +0000
Date: Tue, 16 May 2017 13:53:56 +0000 (UTC)
To: Geert Martin Ijewski <gm.ijewski@web.de>, 
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <290007707.907996.1494942836719@mail.yahoo.com>
In-Reply-To: <96776f9a-ab8c-b92a-fd07-f69f495d0381@web.de>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
	<1337329283.3100470.1494870647989@mail.yahoo.com>
	<90703952-bc99-ecfe-96c7-810bb1784dce@amsat.org>
	<1901691584.9094.1494892886522@mail.yahoo.com>
	<96776f9a-ab8c-b92a-fd07-f69f495d0381@web.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_907995_1525233613.1494942836715"
X-Mailer: WebService/1.1.9552 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 77.238.176.233
Subject: Re: [Qemu-arm] [Qemu-devel] Changes to Broadcom(BCM) files and
 Raspberry Pi files. Addition of PanelEmu
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
From: John Bradley via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: John Bradley <flypie1@yahoo.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2yB4eJRo1T2

------=_Part_907995_1525233613.1494942836715
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The idea of an RFC is good, but with it I would like to have a demo. Someth=
ing with no mass implementation to worry about and this would be it.=20
I should also add a version number to the initialisation of the protocol to=
 increase robustness, between versions. I'll call this one V 0.
=C2=A0John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge H=
ill Liverpool L7 7AF=20

    On Tuesday, 16 May 2017, 9:56, Geert Martin Ijewski <gm.ijewski@web.de>=
 wrote:
=20

 Am 16.05.2017 um 02:01 schrieb John Bradley via Qemu-devel:
> Hi,
> The XML files in the base are not in the patch. They where net beans file=
s. I can easily get it into 3 files, one large at 91KB but contains only ne=
w files and so is easy to read. Could be smaller but seems pointless.
>
I think what Alistar meant was something along the lines of:
patch/commit 1) add the remaining bcm2835 devices from Markus=20
Armbruster's code to QEMU (btw: any reason why that hasn't been done?=20
The USB stuff does seem nice to have)
-- with a more meaningful commit title
2) add utils/panelemu.c and the include
3) bcm2835 now uses the emupanel
and then your other commits e.g.
4) USB CDC Ethernet driver dropped packets
5) emupanel: fixed compilation errors on linux
6) emupanel: removed last blocking I/O

Along the way you also seem to fix indentation in other code a lot, that=20
makes following the patches more confusing than they need to be.
It's harder to gauge at a quick glance whether you changed something=20
meaingul or not.

Maybe even send a RFC just detailing the protocol, because it's probably=20
important to get that right from the start.

Geert
> another which is about 19KB of quite simple changes to mostly make files.
> Then one 15KB which quite straight forward when you look at it. Applying =
them in that order should allow step wise addition. I've uploaded them to a=
 share if anyone wants to comment.
>
> The 3 files are new.patch
>
> |
> |
> |
> |=C2=A0 |=C2=A0 =C2=A0 |
>
>=C2=A0 =C2=A0 |
>
>=C2=A0 |
> |
> |=C2=A0 =C2=A0 |
> new.patch
>=C2=A0 Shared with Dropbox=C2=A0 |=C2=A0 |
>
>=C2=A0 |
>
>=C2=A0 |
>
>
>=C2=A0 mod1.patch
>
>
> |
> |
> |
> |=C2=A0 |=C2=A0 =C2=A0 |
>
>=C2=A0 =C2=A0 |
>
>=C2=A0 |
> |
> |=C2=A0 =C2=A0 |
> mod1.patch
>=C2=A0 Shared with Dropbox=C2=A0 |=C2=A0 |
>
>=C2=A0 |
>
>=C2=A0 |
>
>
>
> and
>=C2=A0 a_hw_gpio_bcm2835_gpio.c.patch
>
> |
> |
> |
> |=C2=A0 |=C2=A0 =C2=A0 |
>
>=C2=A0 =C2=A0 |
>
>=C2=A0 |
> |
> |=C2=A0 =C2=A0 |
> a_hw_gpio_bcm2835_gpio.c.patch
>=C2=A0 Shared with Dropbox=C2=A0 |=C2=A0 |
>
>=C2=A0 |
>
>=C2=A0 |
>
>
>
>
>
> John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hill =
Liverpool L7 7AF
>
>=C2=A0 =C2=A0 On Tuesday, 16 May 2017, 0:20, Philippe Mathieu-Daud=C3=A9 <=
f4bug@amsat.org> wrote:
>
>
>=C2=A0 Hi John,
>
>> That is going to be very difficult as a lot of the changes are
>> interlinked the vast majority of the patch is new files.
>
> I rebased your branch on latest qemu/master here:
>
> https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebased
>
> It is much easier to follow now, the big XML files you added/removed
> also disappeared (gitk was crashing 'Out Of Memory' trying to look at
> your tree).
>
> I hope it can help you to continue reordering in smaller patches.
>
> Regards,
>
> Phil.
>
> On 05/15/2017 01:46 PM, Alistair Francis wrote:
>>
>> Hey John,
>>
>> Thanks for the patch!
>>
>> Unfortunately this patch is too long to review, you need to split the
>> patch up into shorter more readable patches. Otherwise it's too hard
>> to people to understand what you are changing and why.
>>
>> There are some details here:
>> http://wiki.qemu.org/Contribute/SubmitAPatch
>> <http://wiki.qemu.org/Contribute/SubmitAPatch>about how to split up
>> patches. Each patch applied in order shouldn't break any compilation
>> or runtime. Generally the flow is to add the logic in earlier patches
>> and then connect it and switch it on in the later patches.
>>
>> Try splitting up adding/editing each individual device and send that
>> our first. That is generally the easiest to review/accept.
>>
>> Thanks,
>>
>> Alistair
>>
>>> ---
>>> .gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++
>>> hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-
>>> hw/arm/bcm2835.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 114 ++++
>>> hw/arm/bcm2835_peripherals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 +++=
+
>>> hw/arm/bcm2836.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-
>>> hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 77 ++-
>>> hw/gpio/bcm2835_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 333 ++++++-----
>>> hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +
>>> hw/misc/bcm2835_mphi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 163 ++++++
>>> hw/misc/bcm2835_power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 106 ++++
>>> hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +
>>> hw/timer/bcm2835_st.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 202 +++++++
>>> hw/timer/bcm2835_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 224 +++++++
>>> hw/usb/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 4 +-
>>> hw/usb/bcm2835_usb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 604 +++++++++++++++++++
>>> hw/usb/bcm2835_usb_regs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10=
61
>> ++++++++++++++++++++++++++++++++++
>>> hw/usb/dev-network.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-
>>> include/hw/arm/bcm2835.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 37 ++
>>> include/hw/arm/bcm2835_peripherals.h |=C2=A0 10 +
>>> include/hw/gpio/bcm2835_gpio.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +
>>> include/hw/intc/bcm2835_control.h=C2=A0 =C2=A0 |=C2=A0 53 ++
>>> include/hw/intc/bcm2836_control.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +
>>> include/hw/misc/bcm2835_mphi.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +
>>> include/hw/misc/bcm2835_power.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +
>>> include/hw/timer/bcm2835_st.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +
>>> include/hw/timer/bcm2835_timer.h=C2=A0 =C2=A0 |=C2=A0 32 +
>>> include/hw/usb/bcm2835_usb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++
>>> include/qemu/PanelEmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 53 ++
>>> util/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +
>>> util/PanelEmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 293 ++++++++++
>>> 30 files changed, 3547 insertions(+), 149 deletions(-)
>>> create mode 100644 hw/arm/bcm2835.c
>>> create mode 100644 hw/misc/bcm2835_mphi.c
>>> create mode 100644 hw/misc/bcm2835_power.c
>>> create mode 100644 hw/timer/bcm2835_st.c
>>> create mode 100644 hw/timer/bcm2835_timer.c
>>> create mode 100644 hw/usb/bcm2835_usb.c
>>> create mode 100644 hw/usb/bcm2835_usb_regs.h
>>> create mode 100644 include/hw/arm/bcm2835.h
>>> create mode 100644 include/hw/intc/bcm2835_control.h
>>> create mode 100644 include/hw/misc/bcm2835_mphi.h
>>> create mode 100644 include/hw/misc/bcm2835_power.h
>>> create mode 100644 include/hw/timer/bcm2835_st.h
>>> create mode 100644 include/hw/timer/bcm2835_timer.h
>>> create mode 100644 include/hw/usb/bcm2835_usb.h
>>> create mode 100644 include/qemu/PanelEmu.h
>>> create mode 100644 util/PanelEmu.c
>>>
>>
>>
>
>
>
>



  =20
------=_Part_907995_1525233613.1494942836715
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font=
-size:16px">The idea of an RFC is good, but with it I would like to have a =
demo. Something with no mass implementation to worry about and this would b=
e it. <br>I should also add a version number to the initialisation of the p=
rotocol to increase robustness, between versions. I'll call this one V 0.<b=
r><div id=3D"yui_3_16_0_1_1494939876032_17207"><span></span></div><div id=
=3D"yui_3_16_0_1_1494939876032_17086">&nbsp;</div><div class=3D"signature" =
id=3D"yui_3_16_0_1_1494939876032_17090"><div id=3D"yui_3_16_0_1_14949398760=
32_17158">John Bradley</div><div id=3D"yui_3_16_0_1_1494939876032_17094">Te=
l: 07896 839635</div><div id=3D"yui_3_16_0_1_1494939876032_17093">Skype: fl=
ypie125</div><div id=3D"yui_3_16_0_1_1494939876032_17091">
 125B Grove Street</div><div id=3D"yui_3_16_0_1_1494939876032_17092">Edge H=
ill </div><div id=3D"yui_3_16_0_1_1494939876032_17089">Liverpool L7 7AF</di=
v></div> <div class=3D"qtdSeparateBR"><br><br></div><div class=3D"yahoo_quo=
ted" style=3D"display: block;"> <div style=3D"font-family: Helvetica Neue, =
Helvetica, Arial, Lucida Grande, sans-serif; font-size: 16px;"> <div style=
=3D"font-family: HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Gr=
ande, Sans-Serif; font-size: 16px;"> <div dir=3D"ltr"><font face=3D"Arial" =
size=3D"2"> On Tuesday, 16 May 2017, 9:56, Geert Martin Ijewski &lt;gm.ijew=
ski@web.de&gt; wrote:<br></font></div>  <br><br> <div class=3D"y_msg_contai=
ner"><div dir=3D"ltr">Am 16.05.2017 um 02:01 schrieb John Bradley via Qemu-=
devel:<br clear=3D"none">&gt; Hi,<br clear=3D"none">&gt; The XML files in t=
he base are not in the patch. They where net beans files. I can easily get =
it into 3 files, one large at 91KB but contains only new files and so is ea=
sy to read. Could be smaller but seems pointless.<br clear=3D"none">&gt;<br=
 clear=3D"none">I think what Alistar meant was something along the lines of=
:<br clear=3D"none">patch/commit 1) add the remaining bcm2835 devices from =
Markus <br clear=3D"none">Armbruster's code to QEMU (btw: any reason why th=
at hasn't been done? <br clear=3D"none">The USB stuff does seem nice to hav=
e)<br clear=3D"none">-- with a more meaningful commit title<br clear=3D"non=
e">2) add utils/panelemu.c and the include<br clear=3D"none">3) bcm2835 now=
 uses the emupanel<br clear=3D"none">and then your other commits e.g.<br cl=
ear=3D"none">4) USB CDC Ethernet driver dropped packets<br clear=3D"none">5=
) emupanel: fixed compilation errors on linux<br clear=3D"none">6) emupanel=
: removed last blocking I/O<br clear=3D"none"><br clear=3D"none">Along the =
way you also seem to fix indentation in other code a lot, that <br clear=3D=
"none">makes following the patches more confusing than they need to be.<br =
clear=3D"none">It's harder to gauge at a quick glance whether you changed s=
omething <br clear=3D"none">meaingul or not.<br clear=3D"none"><br clear=3D=
"none">Maybe even send a RFC just detailing the protocol, because it's prob=
ably <br clear=3D"none">important to get that right from the start.<br clea=
r=3D"none"><br clear=3D"none">Geert<div class=3D"yqt2186597457" id=3D"yqtfd=
15598"><br clear=3D"none">&gt; another which is about 19KB of quite simple =
changes to mostly make files.<br clear=3D"none">&gt; Then one 15KB which qu=
ite straight forward when you look at it. Applying them in that order shoul=
d allow step wise addition. I've uploaded them to a share if anyone wants t=
o comment.<br clear=3D"none">&gt;<br clear=3D"none">&gt; The 3 files are ne=
w.patch<br clear=3D"none">&gt;<br clear=3D"none">&gt; |<br clear=3D"none">&=
gt; |<br clear=3D"none">&gt; |<br clear=3D"none">&gt; |&nbsp;  |&nbsp; &nbs=
p; |<br clear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp; &nbsp; |<br clear=
=3D"none">&gt;<br clear=3D"none">&gt;&nbsp;  |<br clear=3D"none">&gt; |<br =
clear=3D"none">&gt; |&nbsp; &nbsp; |<br clear=3D"none">&gt; new.patch<br cl=
ear=3D"none">&gt;&nbsp; Shared with Dropbox&nbsp; |&nbsp;  |<br clear=3D"no=
ne">&gt;<br clear=3D"none">&gt;&nbsp;  |<br clear=3D"none">&gt;<br clear=3D=
"none">&gt;&nbsp;  |<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=
=3D"none">&gt;&nbsp; mod1.patch<br clear=3D"none">&gt;<br clear=3D"none">&g=
t;<br clear=3D"none">&gt; |<br clear=3D"none">&gt; |<br clear=3D"none">&gt;=
 |<br clear=3D"none">&gt; |&nbsp;  |&nbsp; &nbsp; |<br clear=3D"none">&gt;<=
br clear=3D"none">&gt;&nbsp; &nbsp; |<br clear=3D"none">&gt;<br clear=3D"no=
ne">&gt;&nbsp;  |<br clear=3D"none">&gt; |<br clear=3D"none">&gt; |&nbsp; &=
nbsp; |<br clear=3D"none">&gt; mod1.patch<br clear=3D"none">&gt;&nbsp; Shar=
ed with Dropbox&nbsp; |&nbsp;  |<br clear=3D"none">&gt;<br clear=3D"none">&=
gt;&nbsp;  |<br clear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp;  |<br clea=
r=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"n=
one">&gt; and<br clear=3D"none">&gt;&nbsp; a_hw_gpio_bcm2835_gpio.c.patch<b=
r clear=3D"none">&gt;<br clear=3D"none">&gt; |<br clear=3D"none">&gt; |<br =
clear=3D"none">&gt; |<br clear=3D"none">&gt; |&nbsp;  |&nbsp; &nbsp; |<br c=
lear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp; &nbsp; |<br clear=3D"none">=
&gt;<br clear=3D"none">&gt;&nbsp;  |<br clear=3D"none">&gt; |<br clear=3D"n=
one">&gt; |&nbsp; &nbsp; |<br clear=3D"none">&gt; a_hw_gpio_bcm2835_gpio.c.=
patch<br clear=3D"none">&gt;&nbsp; Shared with Dropbox&nbsp; |&nbsp;  |<br =
clear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp;  |<br clear=3D"none">&gt;<=
br clear=3D"none">&gt;&nbsp;  |<br clear=3D"none">&gt;<br clear=3D"none">&g=
t;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br =
clear=3D"none">&gt; John BradleyTel: 07896 839635Skype: flypie125 125B Grov=
e StreetEdge Hill Liverpool L7 7AF<br clear=3D"none">&gt;<br clear=3D"none"=
>&gt;&nbsp; &nbsp;  On Tuesday, 16 May 2017, 0:20, Philippe Mathieu-Daud=C3=
=A9 &lt;<a shape=3D"rect" ymailto=3D"mailto:f4bug@amsat.org" href=3D"mailto=
:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br clear=3D"none">&gt;<br =
clear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp; Hi John,<br clear=3D"none"=
>&gt;<br clear=3D"none">&gt;&gt; That is going to be very difficult as a lo=
t of the changes are<br clear=3D"none">&gt;&gt; interlinked the vast majori=
ty of the patch is new files.<br clear=3D"none">&gt;<br clear=3D"none">&gt;=
 I rebased your branch on latest qemu/master here:<br clear=3D"none">&gt;<b=
r clear=3D"none">&gt; <a shape=3D"rect" href=3D"https://github.com/philmd/q=
emu/tree/flypie-GDummyPanel-rebased" target=3D"_blank">https://github.com/p=
hilmd/qemu/tree/flypie-GDummyPanel-rebased</a><br clear=3D"none">&gt;<br cl=
ear=3D"none">&gt; It is much easier to follow now, the big XML files you ad=
ded/removed<br clear=3D"none">&gt; also disappeared (gitk was crashing 'Out=
 Of Memory' trying to look at<br clear=3D"none">&gt; your tree).<br clear=
=3D"none">&gt;<br clear=3D"none">&gt; I hope it can help you to continue re=
ordering in smaller patches.<br clear=3D"none">&gt;<br clear=3D"none">&gt; =
Regards,<br clear=3D"none">&gt;<br clear=3D"none">&gt; Phil.<br clear=3D"no=
ne">&gt;<br clear=3D"none">&gt; On 05/15/2017 01:46 PM, Alistair Francis wr=
ote:<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; Hey John,<br cle=
ar=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; Thanks for the patch!<br cl=
ear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; Unfortunately this patch i=
s too long to review, you need to split the<br clear=3D"none">&gt;&gt; patc=
h up into shorter more readable patches. Otherwise it's too hard<br clear=
=3D"none">&gt;&gt; to people to understand what you are changing and why.<b=
r clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; There are some details=
 here:<br clear=3D"none">&gt;&gt; <a shape=3D"rect" href=3D"http://wiki.qem=
u.org/Contribute/SubmitAPatch" target=3D"_blank">http://wiki.qemu.org/Contr=
ibute/SubmitAPatch</a><br clear=3D"none">&gt;&gt; &lt;<a shape=3D"rect" hre=
f=3D"http://wiki.qemu.org/Contribute/SubmitAPatch" target=3D"_blank">http:/=
/wiki.qemu.org/Contribute/SubmitAPatch</a>&gt;about how to split up<br clea=
r=3D"none">&gt;&gt; patches. Each patch applied in order shouldn't break an=
y compilation<br clear=3D"none">&gt;&gt; or runtime. Generally the flow is =
to add the logic in earlier patches<br clear=3D"none">&gt;&gt; and then con=
nect it and switch it on in the later patches.<br clear=3D"none">&gt;&gt;<b=
r clear=3D"none">&gt;&gt; Try splitting up adding/editing each individual d=
evice and send that<br clear=3D"none">&gt;&gt; our first. That is generally=
 the easiest to review/accept.<br clear=3D"none">&gt;&gt;<br clear=3D"none"=
>&gt;&gt; Thanks,<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; Ali=
stair<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt;&gt; ---<br clea=
r=3D"none">&gt;&gt;&gt; .gitignore&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 54 ++<br clear=3D=
"none">&gt;&gt;&gt; hw/arm/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2 +-<br clear=3D"none">&gt;&gt;&gt; hw/=
arm/bcm2835.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; |&nbsp; 114 ++++<br clear=3D"none">&gt;&gt;&gt; hw/arm/bcm2835_peri=
pherals.c&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 104 ++++<br clear=3D"none">&gt=
;&gt;&gt; hw/arm/bcm2836.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 3 +-<br clear=3D"none">&gt;&gt;&gt; hw/=
arm/raspi.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; |&nbsp; 77 ++-<br clear=3D"none">&gt;&gt;&gt; hw/gpio/bcm2835_=
gpio.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 333 ++++++--=
---<br clear=3D"none">&gt;&gt;&gt; hw/misc/Makefile.objs&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2 +<br clear=3D"none">&=
gt;&gt;&gt; hw/misc/bcm2835_mphi.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; |&nbsp; 163 ++++++<br clear=3D"none">&gt;&gt;&gt; hw/misc/bcm2835_p=
ower.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 106 ++++<br =
clear=3D"none">&gt;&gt;&gt; hw/timer/Makefile.objs&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2 +<br clear=3D"none">&gt;&gt;&gt; h=
w/timer/bcm2835_st.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 |&nbsp; 202 +++++++<br clear=3D"none">&gt;&gt;&gt; hw/timer/bcm2835_timer.=
c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 224 +++++++<br clear=3D"=
none">&gt;&gt;&gt; hw/usb/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 4 +-<br clear=3D"none">&gt;&gt;&gt; hw/u=
sb/bcm2835_usb.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&n=
bsp; 604 +++++++++++++++++++<br clear=3D"none">&gt;&gt;&gt; hw/usb/bcm2835_=
usb_regs.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 1061<br clear=3D"none=
">&gt;&gt; ++++++++++++++++++++++++++++++++++<br clear=3D"none">&gt;&gt;&gt=
; hw/usb/dev-network.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; |&nbsp; &nbsp; 2 +-<br clear=3D"none">&gt;&gt;&gt; include/hw/arm/bcm283=
5.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 37 ++<br clear=3D"none=
">&gt;&gt;&gt; include/hw/arm/bcm2835_peripherals.h |&nbsp; 10 +<br clear=
=3D"none">&gt;&gt;&gt; include/hw/gpio/bcm2835_gpio.h&nbsp; &nbsp; &nbsp; |=
&nbsp; &nbsp; 5 +<br clear=3D"none">&gt;&gt;&gt; include/hw/intc/bcm2835_co=
ntrol.h&nbsp; &nbsp; |&nbsp; 53 ++<br clear=3D"none">&gt;&gt;&gt; include/h=
w/intc/bcm2836_control.h&nbsp; &nbsp; |&nbsp; &nbsp; 2 +<br clear=3D"none">=
&gt;&gt;&gt; include/hw/misc/bcm2835_mphi.h&nbsp; &nbsp; &nbsp; |&nbsp; 28 =
+<br clear=3D"none">&gt;&gt;&gt; include/hw/misc/bcm2835_power.h&nbsp; &nbs=
p; &nbsp; |&nbsp; 22 +<br clear=3D"none">&gt;&gt;&gt; include/hw/timer/bcm2=
835_st.h&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 25 +<br clear=3D"none">&gt;&gt;=
&gt; include/hw/timer/bcm2835_timer.h&nbsp; &nbsp; |&nbsp; 32 +<br clear=3D=
"none">&gt;&gt;&gt; include/hw/usb/bcm2835_usb.h&nbsp; &nbsp; &nbsp; &nbsp;=
 |&nbsp; 78 +++<br clear=3D"none">&gt;&gt;&gt; include/qemu/PanelEmu.h&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 53 ++<br clear=3D"none"=
>&gt;&gt;&gt; util/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 1 +<br clear=3D"none">&gt;&gt;&gt; util/=
PanelEmu.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; |&nbsp; 293 ++++++++++<br clear=3D"none">&gt;&gt;&gt; 30 files =
changed, 3547 insertions(+), 149 deletions(-)<br clear=3D"none">&gt;&gt;&gt=
; create mode 100644 hw/arm/bcm2835.c<br clear=3D"none">&gt;&gt;&gt; create=
 mode 100644 hw/misc/bcm2835_mphi.c<br clear=3D"none">&gt;&gt;&gt; create m=
ode 100644 hw/misc/bcm2835_power.c<br clear=3D"none">&gt;&gt;&gt; create mo=
de 100644 hw/timer/bcm2835_st.c<br clear=3D"none">&gt;&gt;&gt; create mode =
100644 hw/timer/bcm2835_timer.c<br clear=3D"none">&gt;&gt;&gt; create mode =
100644 hw/usb/bcm2835_usb.c<br clear=3D"none">&gt;&gt;&gt; create mode 1006=
44 hw/usb/bcm2835_usb_regs.h<br clear=3D"none">&gt;&gt;&gt; create mode 100=
644 include/hw/arm/bcm2835.h<br clear=3D"none">&gt;&gt;&gt; create mode 100=
644 include/hw/intc/bcm2835_control.h<br clear=3D"none">&gt;&gt;&gt; create=
 mode 100644 include/hw/misc/bcm2835_mphi.h<br clear=3D"none">&gt;&gt;&gt; =
create mode 100644 include/hw/misc/bcm2835_power.h<br clear=3D"none">&gt;&g=
t;&gt; create mode 100644 include/hw/timer/bcm2835_st.h<br clear=3D"none">&=
gt;&gt;&gt; create mode 100644 include/hw/timer/bcm2835_timer.h<br clear=3D=
"none">&gt;&gt;&gt; create mode 100644 include/hw/usb/bcm2835_usb.h<br clea=
r=3D"none">&gt;&gt;&gt; create mode 100644 include/qemu/PanelEmu.h<br clear=
=3D"none">&gt;&gt;&gt; create mode 100644 util/PanelEmu.c<br clear=3D"none"=
>&gt;&gt;&gt;<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt;<br clea=
r=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"n=
one">&gt;<br clear=3D"none"><br clear=3D"none"></div></div><br><br></div>  =
</div> </div>  </div></div></body></html>
------=_Part_907995_1525233613.1494942836715--
