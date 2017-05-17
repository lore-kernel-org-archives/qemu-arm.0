Received: by 10.25.0.6 with SMTP id 6csp367565lfa;
        Wed, 17 May 2017 11:39:11 -0700 (PDT)
X-Received: by 10.200.56.46 with SMTP id q43mr206352qtb.83.1495046351496;
        Wed, 17 May 2017 11:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495046351; cv=none;
        d=google.com; s=arc-20160816;
        b=BSYW4GydLyg3sK/AVvio178vtH/J/mlMbhFhiyWfzcDiqZMm4egdJlX/T+JpvlZBwc
         5H9V6B9XITBVKu8n6WQWiXuVV9V3dirafqtMOOWm6kAOP06zepBscTjk4Wr3xD4QWErz
         T0XLo7jeTwKqkAS1twHlyuTVTdnUNp0GUAyJTBDEkA0wlBLHkWCGYwfmEgMKTp3KlN2N
         1X5YtY3etswG3LPYl+qHXw4hfeYnuAlitdMYOMiJMhJ9lzdaWv7wi8CruEUhgpF69hSk
         CWopL5bj7iJ8c929CHTtSFtq7PS+jDgr/K60g+re2clUDv7C5XmM+Lkqm7RrD4uJZR+y
         UU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:mime-version:references:in-reply-to:message-id:to
         :date:dkim-signature:arc-authentication-results;
        bh=BxNkwMl22CujP+Ww00culbl71whgSu/8LeNdeIFuLZw=;
        b=Ua6Nqg3pUExLEN2/t9pbw4bAi+RpLb73FoHmBEyUPO05/4ErUtTWvNtfLkB3Yb7V5A
         +dUMj/dGrm+iXXru8BEAgV+YKe7WSLXKbBnSLlAImaUo2Czi4hpyTC5q986gYvaV1TO5
         Wxkzg2qZ4Jln7Mfz3AMYTETB5y109hK7iGkR4uMXjZ6aX6xUfVEVj4suXmVz+razr4l1
         8GlppUXZTV2UHnHOTTBFnnS7NM5xZK5BtzVV+RdZcwh1xemH+qFRfDkNaC9SqE9FMzkN
         gwTgj0Ud2df5gO/2vfjMN21qekQgKRlHbhF9UQqBPXRttvuWM3njPE8Log8V9I0EH5Zd
         gzpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a27si2991428qtb.82.2017.05.17.11.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 11:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB3qo-0005qI-TP
	for alex.bennee@linaro.org; Wed, 17 May 2017 14:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB3qb-0005pM-U7
	for qemu-arm@nongnu.org; Wed, 17 May 2017 14:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB3qY-0004iF-Ny
	for qemu-arm@nongnu.org; Wed, 17 May 2017 14:38:57 -0400
Received: from sonic316-20.consmr.mail.ir2.yahoo.com ([87.248.110.179]:44074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB3qY-0004hf-Ck
	for qemu-arm@nongnu.org; Wed, 17 May 2017 14:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1495046333; bh=BxNkwMl22CujP+Ww00culbl71whgSu/8LeNdeIFuLZw=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=V2D/imjq5uvjWXntHOec4mWsp+KWCwolRE3NkduxcxsQCqzdKcLApQ8BcxZUa+pyewPdmiQmbrjk13+8mE2/jbn8MlfUa+Zxerb4XarwS58o4lDgI3WR2qyNb+jL8nTDdnl/eSWTOU3H4dqxQvGUPcVX3qriElvKFSclp+bqTxqBWuwyLUqzZ/F+7MTcpNFuVdf2XyJ0iijuZdQq+JcEv7n+xs3HXF+U+7d7As0hfmhlBh474jy5cKQvxNYriE/IOV3go7DWzcG6PkRRw2BHdTuEdZLnEaZ/9a+Dh6Ji4ZlKVsS2uGuB11FeGnFJIEw7znGfXLz5F99hjH85bweN9g==
X-YMail-OSG: .wVUmHcVM1mXBltj4PqbVKLrYql5ar74.VNa7U_MnAhIrL0yV2w9xTa_xZxdcNY
	AixWwycm6_ZjnmQN4GWV.Q.I_olmXb9JpFhSUBKV3U.wSk4k_J2mQFw_7YgEgjgEMpvuDnLkEqTh
	7ISr.dEL.kMKlvpGdLtkUJQmC4I6VMZ8jFkm9A1gn5Qnefr97VHE3bPzXC5aZPNZtcrUBz_XFJd3
	ifqdys3hbmBpcI3KHdxKCBbXHzQtVr1n089wE5TfpPFm2ACY87273E.VCtE2rUjqU7bU_vle_ZtO
	38bDd7qVY7eB37gC4ilRuL6Dzltd2c4f9LURR8erb3Wf8FCEi9RZHRAPi0.Fc1gWMYwmBcqTCRB8
	7yMVfK39spW877zHKk9RaHcUbGx9tZBH3quHHF1gFMxsyzE2CEFbAj.vBjjWMWz374pknrBO60j0
	YP8FWbq5pwwi_ym6cnKsDiJgCNq8sPyWppVYmrJSdq5o9I6XFQfFBS16PBqLcK2den94YMkZT_bl
	tXMKYewr7OloRkXIQzkJqW5te8Uf4mq4NhT0jumF7BH7XCYpIo28YK7BD2.VBveq95aSXNhot73b
	akUCBUj4MmYbHKTHi7CFC39PB722NrNo0s7PNPPfx7sjwJRYZEJLOCBrY
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ir2.yahoo.com with HTTP;
	Wed, 17 May 2017 18:38:53 +0000
Date: Wed, 17 May 2017 18:34:51 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <107015620.2969780.1495046091978@mail.yahoo.com>
In-Reply-To: <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2969779_2066250843.1495046091973"
X-Mailer: WebService/1.1.9552 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 87.248.110.179
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lj1BNyC62VUw

------=_Part_2969779_2066250843.1495046091973
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is especial true as I meant Andrew Baumann 0xabu (Andrew Baumann)

 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
0xabu (Andrew Baumann)
 0xabu has 3 repositories available. Follow their code on GitHub.  |   |

  |

  |

=20

=C2=A0John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge H=
ill Liverpool L7 7AF=20

    On Wednesday, 17 May 2017, 19:27, Eric Blake <eblake@redhat.com> wrote:
=20

 On 05/17/2017 01:09 PM, John Bradley via Qemu-devel wrote:
> Also available at=20
>=20
> https://www.dropbox.com/s/gwuquw0kirstw7a/0001-Add-Markus-Armbrusters-cod=
e-for-Broadcom-Perhiperals.patch?dl=3D0

This content belongs...

>=20
> Following suggestions split my original patch up. This the largest monoli=
thic chunk is=20
> additional BCM device support from Markus Armbruster.
>=20
>=20
>>>From 0b39a04030d5a2cea4fcd2159d365580ca155b78 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Wed, 17 May 2017 18:57:21 +0100
> Subject: [PATCH] Add Markus Armbrusters code for Broadcom Perhiperals for=
 ARM.
>=20
> Signed-off-by: John Bradley <flypie@rocketmail.com>

I would expect that if some of this code was written by Markus, then it
would carry his Signed-off-by.=C2=A0 Or, maybe you just mean that you are
splitting your patch according to the device Markus gave (in which case,
a Suggested-by: tag may be appropriate).=C2=A0 Either way, I don't see why
Markus' name has to be in the subject line (the patch subject should be
WHAT changed, not WHO suggested the change).

> ---

...here, after the --- separator.=C2=A0 It is useful to reviewers, but shou=
ld
not end up as part of the actual commit message.

> hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-
> hw/arm/bcm2835.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 114 ++++
> hw/arm/bcm2835_peripherals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 ++++
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

That's still rather large to review in one chunk, especially while
touching other files.=C2=A0 It can probably still be split up further.

> include/hw/arm/bcm2835.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 37 ++
> include/hw/arm/bcm2835_peripherals.h |=C2=A0 10 +
> include/hw/intc/bcm2835_control.h=C2=A0 =C2=A0 |=C2=A0 53 ++
> include/hw/misc/bcm2835_mphi.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +
> include/hw/misc/bcm2835_power.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +
> include/hw/timer/bcm2835_st.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +
> include/hw/timer/bcm2835_timer.h=C2=A0 =C2=A0 |=C2=A0 32 +
> include/hw/usb/bcm2835_usb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++
> 20 files changed, 2871 insertions(+), 2 deletions(-)
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
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +1-919-301-3266
Virtualization:=C2=A0 qemu.org | libvirt.org


  =20
------=_Part_2969779_2066250843.1495046091973
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div style=3D"color:#000; background-color:#fff; font-family:Helvetica N=
eue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px">This is es=
pecial true as I meant <span itemprop=3D"name" id=3D"yui_3_16_0_ym19_1_1495=
034604426_121218">Andrew Baumann <a href=3D"https://github.com/0xabu" id=3D=
"yui_3_16_0_ym19_1_1495034604426_121347" class=3D"enhancr2_7412ec80-c564-40=
8f-a69e-34a09984b10f">0xabu (Andrew Baumann)</a><div><br></div><div><br></d=
iv><div id=3D"enhancr2_7412ec80-c564-408f-a69e-34a09984b10f" class=3D"yahoo=
-link-enhancr-card  ymail-preserve-class ymail-preserve-style" style=3D"max=
-width:400px;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;" d=
ata-url=3D"https://github.com/0xabu" data-type=3D"yenhancr" data-category=
=3D"profile" data-embed-url=3D"" data-size=3D"medium" dir=3D"ltr" contented=
itable=3D"false"> <a href=3D"https://github.com/0xabu" style=3D"text-decora=
tion:none !important; color: #000 !important;" class=3D"yahoo-enhancr-cardl=
ink" target=3D"_blank" rel=3D"noreferrer" id=3D"yui_3_16_0_ym19_1_149503460=
4426_121364"> <table class=3D"card-wrapper yahoo-ignore-table" style=3D"max=
-width:400px;" id=3D"yui_3_16_0_ym19_1_1495034604426_121363" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_14950346=
04426_121362"><tr id=3D"yui_3_16_0_ym19_1_1495034604426_121361"> <td id=3D"=
yui_3_16_0_ym19_1_1495034604426_121360" width=3D"400"> <table class=3D"card=
 yahoo-ignore-table" style=3D"max-width:400px;" id=3D"yui_3_16_0_ym19_1_149=
5034604426_121359" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1495034604426_121358"><tr> <td clas=
s=3D"card-primary-image-cell" style=3D"background:#000 url('https://s.yimg.=
com/vv//api/res/1.2/JntdA5ttdNDM92VSV2wY1w--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9Mj=
AwO3c9NDAw/https://avatars2.githubusercontent.com/u/13037682?v=3D3&amp;s=3D=
400.cf.jpg') no-repeat center center;background-size:cover;height:200px;pos=
ition:relative;" valign=3D"top" bgcolor=3D"#000000" background=3D"https://s=
.yimg.com/vv//api/res/1.2/JntdA5ttdNDM92VSV2wY1w--/YXBwaWQ9bWFpbDtmaT1maWxs=
O2g9MjAwO3c9NDAw/https://avatars2.githubusercontent.com/u/13037682?v=3D3&am=
p;s=3D400.cf.jpg"> <!--[if gte mso 9]><v:rect fill=3D"true" stroke=3D"false=
" style=3D"width:400px;height:218px;position:absolute;top:0;left:0;"><v:fil=
l type=3D"frame" color=3D"#000000" src=3D"https://s.yimg.com/vv//api/res/1.=
2/JntdA5ttdNDM92VSV2wY1w--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https:/=
/avatars2.githubusercontent.com/u/13037682?v=3D3&s=3D400.cf.jpg"/></v:rect>=
<![endif]--> <table class=3D"yahoo-ignore-table" valign=3D"top" style=3D"wi=
dth:100%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody><tr> <t=
d style=3D"background:transparent url('https://s.yimg.com/nq/storm/assets/e=
nhancrV2/12/overlay-tile.png') repeat left top;height:200px;" valign=3D"top=
" bgcolor=3D"transparent" background=3D"https://s.yimg.com/nq/storm/assets/=
enhancrV2/12/overlay-tile.png"> <!--[if gte mso 9]><v:rect fill=3D"true" st=
roke=3D"false" style=3D"width:400px;height:218px;position:absolute;top:-18p=
x;left:0;"><v:fill type=3D"pattern" color=3D"#000000" src=3D"https://s.yimg=
.com/nq/storm/assets/enhancrV2/12/overlay-tile.png"/><v:textbox inset=3D"0,=
0,20px,0"><![endif]--> <table class=3D"yahoo-ignore-table" style=3D"width:1=
00%;height:185px;min-height:185px;" height=3D"185"> <tbody><tr> <td class=
=3D"card-richInfo2" style=3D"text-align:left;text-align:left;padding:15px 0=
 0 15px;vertical-align:top;">  </td> <td class=3D"card-actions" style=3D"te=
xt-align:right;padding:15px 15px 0 0;vertical-align:top;"> <div class=3D"ca=
rd-share-container"></div> </td> </tr> </tbody></table> <!--[if gte mso 9]>=
</v:textbox></v:rect><![endif]--> </td> </tr> </tbody></table> </td> </tr> =
<tr id=3D"yui_3_16_0_ym19_1_1495034604426_121357"> <td id=3D"yui_3_16_0_ym1=
9_1_1495034604426_121356"> <table class=3D"card-info yahoo-ignore-table" st=
yle=3D"background:#fff;position:relative;z-index:2;width:95%;max-width:380p=
x;border:1px solid #e0e4e9;border-bottom:3px solid #010101;margin-top:-40px=
;margin-left:auto;margin-right:auto;" id=3D"yui_3_16_0_ym19_1_1495034604426=
_121396" align=3D"center" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">=
 <tbody id=3D"yui_3_16_0_ym19_1_1495034604426_121395"><tr id=3D"yui_3_16_0_=
ym19_1_1495034604426_121394"> <td style=3D"background-color:#ffffff;padding=
:16px 0 16px 12px;vertical-align:top;"> <img class=3D"card-object-1 yahoo-i=
gnore-inline-image ymail-preserve-class" src=3D"https://s.yimg.com/nq/storm=
/assets/enhancrV2/23/logos/github.png" style=3D"min-width:32px;border:1px s=
olid #e0e4e9;margin-top:3px;" data-id=3D"9cc068cd-0966-c113-5d92-c402f66ee1=
47" height=3D"32">  </td> <td style=3D"vertical-align:middle;padding:16px 1=
2px;width:99%;" id=3D"yui_3_16_0_ym19_1_1495034604426_121393"> <h2 class=3D=
"card-title" style=3D"font-size: 16px; line-height:19px; margin:0 0 4px 0;f=
ont-family:'Helvetica Neue', Helvetica, Arial, sans-serif;word-break:break-=
word;">0xabu (Andrew Baumann)</h2>  <div class=3D"card-description" style=
=3D"font-size:11px;line-height:15px;color:#999;word-break:break-word;" id=
=3D"yui_3_16_0_ym19_1_1495034604426_121392">0xabu has 3 repositories availa=
ble. Follow their code on GitHub.</div> </td> <td style=3D"text-align:right=
;padding:16px 12px 16px 0;">  </td> </tr> </tbody></table> </td> </tr> </tb=
ody></table> </td> </tr> </tbody></table> </a></div><div id=3D"yui_3_16_0_y=
m19_1_1495034604426_121375"><br></div><br></span><div id=3D"yui_3_16_0_ym19=
_1_1495034604426_121282"><span></span></div><div>&nbsp;</div><div class=3D"=
signature" id=3D"yui_3_16_0_ym19_1_1495034604426_121342"><div id=3D"yui_3_1=
6_0_ym19_1_1495034604426_121344">John Bradley</div><div id=3D"yui_3_16_0_ym=
19_1_1495034604426_121341">Tel: 07896 839635</div><div>Skype: flypie125</di=
v><div>
 125B Grove Street</div><div>Edge Hill </div><div>Liverpool L7 7AF</div></d=
iv> <div class=3D"qtdSeparateBR"><br><br></div><div class=3D"yahoo_quoted" =
style=3D"display: block;"> <div style=3D"font-family: Helvetica Neue, Helve=
tica, Arial, Lucida Grande, sans-serif; font-size: 16px;"> <div style=3D"fo=
nt-family: HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, =
Sans-Serif; font-size: 16px;"> <div dir=3D"ltr"><font face=3D"Arial" size=
=3D"2"> On Wednesday, 17 May 2017, 19:27, Eric Blake &lt;eblake@redhat.com&=
gt; wrote:<br></font></div>  <br><br> <div class=3D"y_msg_container"><div d=
ir=3D"ltr">On 05/17/2017 01:09 PM, John Bradley via Qemu-devel wrote:<br></=
div><div dir=3D"ltr">&gt; Also available at <br></div><div dir=3D"ltr">&gt;=
 <br></div><div dir=3D"ltr">&gt; <a href=3D"https://www.dropbox.com/s/gwuqu=
w0kirstw7a/0001-Add-Markus-Armbrusters-code-for-Broadcom-Perhiperals.patch?=
dl=3D0" target=3D"_blank">https://www.dropbox.com/s/gwuquw0kirstw7a/0001-Ad=
d-Markus-Armbrusters-code-for-Broadcom-Perhiperals.patch?dl=3D0</a><br></di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">This content belongs...<br></=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"=
ltr">&gt; Following suggestions split my original patch up. This the larges=
t monolithic chunk is <br></div><div dir=3D"ltr">&gt; additional BCM device=
 support from Markus Armbruster.<br></div><div dir=3D"ltr">&gt; <br></div><=
div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&gt;&gt;From 0b39a04030d5a2=
cea4fcd2159d365580ca155b78 Mon Sep 17 00:00:00 2001<br></div><div dir=3D"lt=
r">&gt; From: John Bradley &lt;<a ymailto=3D"mailto:flypie@rocketmail.com" =
href=3D"mailto:flypie@rocketmail.com">flypie@rocketmail.com</a>&gt;<br></di=
v><div dir=3D"ltr">&gt; Date: Wed, 17 May 2017 18:57:21 +0100<br></div><div=
 dir=3D"ltr">&gt; Subject: [PATCH] Add Markus Armbrusters code for Broadcom=
 Perhiperals for ARM.<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"=
ltr">&gt; Signed-off-by: John Bradley &lt;<a ymailto=3D"mailto:flypie@rocke=
tmail.com" href=3D"mailto:flypie@rocketmail.com">flypie@rocketmail.com</a>&=
gt;<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I would expect tha=
t if some of this code was written by Markus, then it<br></div><div dir=3D"=
ltr">would carry his Signed-off-by.&nbsp; Or, maybe you just mean that you =
are<br></div><div dir=3D"ltr">splitting your patch according to the device =
Markus gave (in which case,<br></div><div dir=3D"ltr">a Suggested-by: tag m=
ay be appropriate).&nbsp; Either way, I don't see why<br></div><div dir=3D"=
ltr">Markus' name has to be in the subject line (the patch subject should b=
e<br></div><div dir=3D"ltr">WHAT changed, not WHO suggested the change).<br=
></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; ---<br></div><div d=
ir=3D"ltr"><br></div><div dir=3D"ltr">...here, after the --- separator.&nbs=
p; It is useful to reviewers, but should<br></div><div dir=3D"ltr">not end =
up as part of the actual commit message.<br></div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">&gt; hw/arm/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;  |&nbsp; &nbsp; 2 +-<br></div><div dir=3D"ltr">&gt=
; hw/arm/bcm2835.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;  |&nbsp; 114 ++++<br></div><div dir=3D"ltr">&gt; hw/arm/bcm283=
5_peripherals.c&nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp; 104 ++++<br></div><div =
dir=3D"ltr">&gt; hw/misc/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2 +<br></div><div dir=3D"ltr">&gt; hw/mis=
c/bcm2835_mphi.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp; 1=
63 ++++++<br></div><div dir=3D"ltr">&gt; hw/misc/bcm2835_power.c&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 106 ++++<br></div><div dir=3D=
"ltr">&gt; hw/timer/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;  |&nbsp; &nbsp; 2 +<br></div><div dir=3D"ltr">&gt; hw/timer/bcm2835_=
st.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 202 +++=
++++<br></div><div dir=3D"ltr">&gt; hw/timer/bcm2835_timer.c&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp; 224 +++++++<br></div><div dir=3D"ltr">&=
gt; hw/usb/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;  |&nbsp; &nbsp; 4 +-<br></div><div dir=3D"ltr">&gt; hw/usb/bcm2835_usb=
.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp; 604 ++++=
+++++++++++++++<br></div><div dir=3D"ltr">&gt; hw/usb/bcm2835_usb_regs.h&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 1061 +++++++++++++++++++++++++++++=
+++++<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">That's still rat=
her large to review in one chunk, especially while<br></div><div dir=3D"ltr=
">touching other files.&nbsp;  It can probably still be split up further.<b=
r></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; include/hw/arm/bcm=
2835.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp;  37 ++<br></div><d=
iv dir=3D"ltr">&gt; include/hw/arm/bcm2835_peripherals.h |&nbsp;  10 +<br><=
/div><div dir=3D"ltr">&gt; include/hw/intc/bcm2835_control.h&nbsp; &nbsp; |=
&nbsp;  53 ++<br></div><div dir=3D"ltr">&gt; include/hw/misc/bcm2835_mphi.h=
&nbsp; &nbsp; &nbsp;  |&nbsp;  28 +<br></div><div dir=3D"ltr">&gt; include/=
hw/misc/bcm2835_power.h&nbsp; &nbsp; &nbsp; |&nbsp;  22 +<br></div><div dir=
=3D"ltr">&gt; include/hw/timer/bcm2835_st.h&nbsp; &nbsp; &nbsp; &nbsp; |&nb=
sp;  25 +<br></div><div dir=3D"ltr">&gt; include/hw/timer/bcm2835_timer.h&n=
bsp; &nbsp;  |&nbsp;  32 +<br></div><div dir=3D"ltr">&gt; include/hw/usb/bc=
m2835_usb.h&nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp;  78 +++<br></div><div dir=
=3D"ltr">&gt; 20 files changed, 2871 insertions(+), 2 deletions(-)<br></div=
><div dir=3D"ltr">&gt; create mode 100644 hw/arm/bcm2835.c<br></div><div di=
r=3D"ltr">&gt; create mode 100644 hw/misc/bcm2835_mphi.c<br></div><div dir=
=3D"ltr">&gt; create mode 100644 hw/misc/bcm2835_power.c<br></div><div dir=
=3D"ltr">&gt; create mode 100644 hw/timer/bcm2835_st.c<br></div><div dir=3D=
"ltr">&gt; create mode 100644 hw/timer/bcm2835_timer.c<br></div><div dir=3D=
"ltr">&gt; create mode 100644 hw/usb/bcm2835_usb.c<br></div><div dir=3D"ltr=
">&gt; create mode 100644 hw/usb/bcm2835_usb_regs.h<br></div><div dir=3D"lt=
r">&gt; create mode 100644 include/hw/arm/bcm2835.h<br></div><div dir=3D"lt=
r">&gt; create mode 100644 include/hw/intc/bcm2835_control.h<br></div><div =
dir=3D"ltr">&gt; create mode 100644 include/hw/misc/bcm2835_mphi.h<br></div=
><div dir=3D"ltr">&gt; create mode 100644 include/hw/misc/bcm2835_power.h<b=
r></div><div dir=3D"ltr">&gt; create mode 100644 include/hw/timer/bcm2835_s=
t.h<br></div><div dir=3D"ltr">&gt; create mode 100644 include/hw/timer/bcm2=
835_timer.h<br></div><div dir=3D"ltr">&gt; create mode 100644 include/hw/us=
b/bcm2835_usb.h<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr"><=
br></div><div dir=3D"ltr">-- <br></div><div dir=3D"ltr">Eric Blake, Princip=
al Software Engineer<br></div><div dir=3D"ltr">Red Hat, Inc.&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;  +1-919-301-3266<br></div><div dir=3D"ltr">Virtualizati=
on:&nbsp; qemu.org | libvirt.org<br></div><br><br></div>  </div> </div>  </=
div></div></body></html>
------=_Part_2969779_2066250843.1495046091973--
