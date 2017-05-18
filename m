Received: by 10.25.0.6 with SMTP id 6csp813220lfa;
        Thu, 18 May 2017 09:39:29 -0700 (PDT)
X-Received: by 10.237.42.6 with SMTP id c6mr5483320qtd.74.1495125568978;
        Thu, 18 May 2017 09:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495125568; cv=none;
        d=google.com; s=arc-20160816;
        b=W+bVYbnYOth3B1znEFVNNQDme91sUrVQkFIwI3Q8GN/C4it+cKXJjv0RChNO9t0PD3
         bhqUtUaRgRQVrIhJ1zGQH+Kh4x/JMTuEz6uEBwzID4nk5FTxczfN3tf3y38LsW/AnJul
         /mq3xTVUc506ZiCrGtxxpKtTrlQrytZVZeHBD5rfWDaYH8O2P/cVN2tkZplR6mNgGgmp
         Bj4a6+9PeFCzHfHD67XLSXnna3tkP1gaVZikQg2OGXx4+9SzKAuEPRki0YrXVS++YFRw
         jb3AnculkWh2J/opUQ3U9jMjya/Y0Qku86sMK5Gzw8qyDClD3p9gHtyhUDFCUh0xUhbq
         3sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:mime-version:references:in-reply-to:message-id:to
         :date:dkim-signature:arc-authentication-results;
        bh=CaOmGlkHIlNLWqnj8utvrt0NiaaX5dxrPBYRXVsyBsI=;
        b=s2YFoLfDM9DB+tUf3IH38Iv9SmRQdQxp9LoNGv470FMFCjyiXE33G/ZRMqBXehzZ1C
         QhFPIGvuV7frjG7WRGVud9HG0R+MeYYjVmZ89wxSQYn5aTYdIr9OB4v2PXYC2EtioKmH
         dqW/Bf4bV6bk6+xqg3oFT/pFqZ7YQBAwTqu6oQCVhTBzLKVOxISkIr/Ba+AHWkvElIqw
         99axIKwKpBVy3tkDp0/WWBUDHCWsNWv6DVPO1d6kdWOm0Uj9QAJBCcv8fjA3gEfDa3Xu
         dIEHKAPLZAjr3+2seb8zKCwtaa6B3NVL18uxPaIL2EPCvaVu8fEXPbTTpXLiOTxGDkmM
         pCDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rocketmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i51si6293780qtf.0.2017.05.18.09.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 09:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rocketmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBOSW-0005lM-ES
	for alex.bennee@linaro.org; Thu, 18 May 2017 12:39:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dBOSS-0005lC-3O
	for qemu-arm@nongnu.org; Thu, 18 May 2017 12:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dBOSO-0006TX-JF
	for qemu-arm@nongnu.org; Thu, 18 May 2017 12:39:24 -0400
Received: from sonic317-26.consmr.mail.ir2.yahoo.com ([87.248.110.216]:43539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dBOSO-0006T8-5e
	for qemu-arm@nongnu.org; Thu, 18 May 2017 12:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
	t=1495125558; bh=CaOmGlkHIlNLWqnj8utvrt0NiaaX5dxrPBYRXVsyBsI=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=YTtTSwWptT5x689bd1TqJR2VpVgVT1k9IPyLDaJiww/Rp8zk230Hg+EhiP34SYcomBHvk78wRMBsfzad0RHmc/P07W7PGaaKuI8PoSIjaF2Nz1cPx+hjhLYwwxdkWyAtmr33GrhCLTGyMoAmYm4S7zpYu6CRle9aksh9CZFaFqDfSJc0QbjMfXnv3625HOAfupiFMDU6gEWK3P+CaL63dqK6jXHTF1SdQzSfiR3hiOX2ohM0BTrlplpR0k97ShKOmc2sGcjulngIzt7RLceb7hy0AU3hPJWb2A82wpX7uL3WIGbKt+Z6ubDhcswM7MtBL+4SVdkHQ1pVl1CPTW+Ihw==
X-YMail-OSG: rT94CTIVM1ncfs79LcZHUow9T_kZWFKRcpjkHWzhJ5NgxLDI7NW.m9kYQsskK3J
	PDCTrNLmEC0njvPOgmrD_GT3SQ6A5OZjIV.jUAXkyVv17yXBJ7d0LjAcoJ4uqwCDvfbv6B5RaJDh
	PsaSPrike3xfIhtOKknU0EIgQ.Ej26VFFUZ1OvgEvSrqaC.n_A1no0zPsDdjmzk14_Mkn_SOlW5.
	Jb3rfmNot0WHB18pUx1yh5GqTlXLwoFfElYFUwKBErqI4aQgrkmJNQ01QZw3b2WynQz_acWRRvSf
	xJwYZhiIbXuJJM2hiJ6lTY8RM_bQasvupc2YdaPKXnUIx03MI0YlJv3oJDTASKZk31.PTA56ZHh3
	ZOISNuuf8pkFFMZyo3WSGijKHgdN2LwF7QLFMg.fSzv8cUp9b9jxZmelhmJMEQrKsW0Wp6LuwH6s
	rjLuMhBLySAZ2K_SjJZF3vNgzbbJL5fki4F6Kb6uugdsoe4phKjelQsL_9P54vmluTQjI8qfxZ8X
	tkpzS0EW0eaAE4ynYJ0bV.Fms62kBfoFEYW9um7ap4q0nxc2A
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ir2.yahoo.com with HTTP;
	Thu, 18 May 2017 16:39:18 +0000
Date: Thu, 18 May 2017 16:39:18 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Message-ID: <1226435878.1302692.1495125558392@mail.yahoo.com>
In-Reply-To: <87bmqqvc6h.fsf@dusky.pond.sub.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
	<1832071588.99743.1495054408073@mail.yahoo.com>
	<bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
	<968647832.156883.1495056309814@mail.yahoo.com>
	<d7324134-4eb5-0ca2-2a13-6fd5c5479b49@redhat.com>
	<87bmqqvc6h.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1302691_847614814.1495125558386"
X-Mailer: WebService/1.1.9679 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 87.248.110.216
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
Cc: John Bradley <flypie@rocketmail.com>, John Bradley <flypie1@yahoo.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IqRf7SpEak3O

------=_Part_1302691_847614814.1495125558386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

HI,
No worries about Yesterday.
I decided to take a different approach. I'll put that stuff in that relates=
 to GDummyPanel flypie/GDummyPanel first I sent the patch to the list a cop=
y is here. 0001-PATCH-V-2-GDummyPanel-Fix-formatingissues.patch

 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
0001-PATCH-V-2-GDummyPanel-Fix-formatingissues.patch
 Shared with Dropbox  |   |

  |

  |

=20


Then set about getting the upgrades from Andrew Baumann in.
Then prepare an RFC for the=C2=A0 protocol used by GDummyPanel taking into =
account any feed pack on the prototype/proof of concept/risk reduction in t=
he patch.

 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
flypie/GDummyPanel
 GDummyPanel - The Client App which links to the Raspi to help simulate GPI=
O  |   |

  |

  |

=20
=C2=A0John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge H=
ill Liverpool L7 7AF=20

    On Thursday, 18 May 2017, 8:47, Markus Armbruster <armbru@redhat.com> w=
rote:
=20

 IANAL, this wouldn't be legal advice even if I was one, yadda, yadda,
here goes anyway:

Eric Blake <eblake@redhat.com> writes:

> On 05/17/2017 04:25 PM, John Bradley wrote:
>> Well unfortunately Eric. I don't understand your "top posted" slang.
>
> To learn what top-posting is:
> http://lmgtfy.com/?q=3Dwhat+is+top-posting
>
> and why we don't like it on technical lists:
> http://www.caliburn.nl/topposting.html
>
> Or more humorously:

Seconded.

> A: Yes.
>> >Q: Are you sure?
>>> >>A: Because it reverses the logical flow of conversation.
>>>> >>>Q: Why is top posting frowned upon?
>
>>=20
>> As for his "intent", it is quite irrelevant as I have gone over the code=
 line by line and what every he intended to do, he has succeed, as far as I=
 can tell , in matching you standards, to such an extent that I am happy th=
at=20
>
> You are correct that the GPL gives us legal rights to use Andrew's code
> without his permission.=C2=A0 And yes, YOU can fork qemu, and take whatev=
er
> GPL patches you want without attribution, and you are probably still
> just fine legally (as long as you still abide by the GPL in that you
> distribute sources to anyone that has your binary).
>
> But our project rules do not allow us to live by just GPL (in part,
> because the license of qemu is sometimes tricky to determine due to a
> mix of GPLv2-only code and non-GPL code, even though most new code is
> GPLv2+).=C2=A0 Also, if we ever had a reason to change license (supposing=
 it
> is even possible, although it might require ripping out or
> reimplementing portions of the code base), having S-o-b means that we
> cannot be accused of applying a license that someone did not agree to.
>
> Therefore, it is easier, pragmatically, even if not legally necessary,
> to enforce proper chain of authorship by getting Signed-off-by: tags on
> ALL patches, especially where a patch asserts a copyright owner, insofar
> as the original copyright owner is still alive and able to assent to the
> action.=C2=A0 It is not just about legalities, it is also about risk-avoi=
dance.
>
> It may sound like we are being hard-nosed (and so be it), but there's a
> reason that we list proper Signed-off-by: rules as our number 1 item on
> the SubmitAPatch page.
> http://wiki.qemu.org/Contribute/SubmitAPatch

Yes, we require patch submitters to provide their Signed-off-by.

We encourage documenting a patch's provenance in full by having every
author provide their S-o-b, whenever practical.=C2=A0 But we don't require
it.

The core purpose of the S-o-b is "to improve tracking of who did what"
by making patch authors formally certify that they "wrote it or
otherwise have the right to pass it on as a open-source patch"[2].=C2=A0 No=
te
"improve" and "have the right to pass it on".

One of the (many) reasons we're making software free is to help our
neighbor[1] by letting him use our creation on a quid pro quo basis.
Always requiring all author's S-o-b could make incorporating otherwise
free code impractical, and thus would conflict with this mission.

When obtaining an S-o-b is impractical, documenting provenance in other
ways has to do.

John wrote upthread:

=C2=A0 =C2=A0 Andrew Baumann has and others have release the code under GNU
=C2=A0 =C2=A0 General Public License version 2 (GPLv2), the same as QEMU th=
at
=C2=A0 =C2=A0 allows me to added it to QEMU as it is under the same license=
, by
=C2=A0 =C2=A0 signing it off this is what I am certifying.

I agree with the reasoning "if free software compatible with the GPLv2,
then I can incorporate it into QEMU as long as I certify by signing
off".

John, thank you for your contribution to QEMU.=C2=A0 I'm sorry your patch g=
ot
side-tracked into this non-technical swamp, and hope you understand why
we're rather careful when it comes to protecting the freedom of our
software.=C2=A0 I futher hope that we can put than behind us (along with
top-posting *grin*), and move on to the fun part.


[1] See "The four essential freedoms"
https://www.gnu.org/philosophy/free-sw.en.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plai=
n/Documentation/process/submitting-patches.rst


  =20
------=_Part_1302691_847614814.1495125558386
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div style=3D"color:#000; background-color:#fff; font-family:Helvetica N=
eue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px"><div id=3D=
"yui_3_16_0_ym19_1_1495112373981_17748">HI,</div><div id=3D"yui_3_16_0_ym19=
_1_1495112373981_17794"><br></div><div id=3D"yui_3_16_0_ym19_1_149511237398=
1_23123">No worries about Yesterday.</div><div id=3D"yui_3_16_0_ym19_1_1495=
112373981_17795"><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1495112=
373981_23115">I decided to take a different approach. I'll put that stuff i=
n that relates to GDummyPanel <a href=3D"https://github.com/flypie/GDummyPa=
nel" class=3D"enhancr2_f05fa098-a69d-a5cf-c7d9-c48a204a6a8e" id=3D"yui_3_16=
_0_ym19_1_1495112373981_20005">flypie/GDummyPanel</a> first I sent the patc=
h to the list a copy is here. <a href=3D"https://www.dropbox.com/s/je1xefco=
gicsa51/0001-PATCH-V-2-GDummyPanel-Fix-formatingissues.patch?dl=3D0" class=
=3D"enhancr2_d55f3a78-9dc5-f0bd-d906-7b3571e24d4d" id=3D"yui_3_16_0_ym19_1_=
1495112373981_23114">0001-PATCH-V-2-GDummyPanel-Fix-formatingissues.patch</=
a><br></div><div id=3D"yui_3_16_0_ym19_1_1495112373981_23297"><br></div><di=
v id=3D"enhancr2_d55f3a78-9dc5-f0bd-d906-7b3571e24d4d" class=3D"yahoo-link-=
enhancr-card  ymail-preserve-class ymail-preserve-style" style=3D"max-width=
:400px;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;" data-ur=
l=3D"https://www.dropbox.com/s/je1xefcogicsa51/0001-PATCH-V-2-GDummyPanel-F=
ix-formatingissues.patch?dl=3D0" data-type=3D"yenhancr" data-category=3D"we=
bsite" data-embed-url=3D"" data-size=3D"medium" dir=3D"ltr" contenteditable=
=3D"false"> <a href=3D"https://www.dropbox.com/s/je1xefcogicsa51/0001-PATCH=
-V-2-GDummyPanel-Fix-formatingissues.patch?dl=3D0" style=3D"text-decoration=
:none !important; color: #000 !important;" class=3D"yahoo-enhancr-cardlink"=
 target=3D"_blank" rel=3D"noreferrer" id=3D"yui_3_16_0_ym19_1_1495112373981=
_23193"> <table class=3D"card-wrapper yahoo-ignore-table" style=3D"max-widt=
h:400px;" id=3D"yui_3_16_0_ym19_1_1495112373981_23192" cellspacing=3D"0" ce=
llpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1495112373981_=
23191"><tr id=3D"yui_3_16_0_ym19_1_1495112373981_23190"> <td id=3D"yui_3_16=
_0_ym19_1_1495112373981_23189" width=3D"400"> <table class=3D"card yahoo-ig=
nore-table" style=3D"max-width:400px;" id=3D"yui_3_16_0_ym19_1_149511237398=
1_23188" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <=
tbody id=3D"yui_3_16_0_ym19_1_1495112373981_23187"><tr id=3D"yui_3_16_0_ym1=
9_1_1495112373981_23186"> <td class=3D"card-primary-image-cell" style=3D"ba=
ckground:#000 url('https://s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKL=
g--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com/=
static/images/icons128/page_white_code.png.cf.jpg') no-repeat center center=
;background-size:cover;height:200px;position:relative;" id=3D"yui_3_16_0_ym=
19_1_1495112373981_23185" valign=3D"top" bgcolor=3D"#000000" background=3D"=
https://s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDt=
maT1maWxsO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com/static/images/icons=
128/page_white_code.png.cf.jpg"> <!--[if gte mso 9]><v:rect fill=3D"true" s=
troke=3D"false" style=3D"width:400px;height:218px;position:absolute;top:0;l=
eft:0;"><v:fill type=3D"frame" color=3D"#000000" src=3D"https://s.yimg.com/=
vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3=
c9NDAw/https://cfl.dropboxstatic.com/static/images/icons128/page_white_code=
.png.cf.jpg"/></v:rect><![endif]--> <table class=3D"yahoo-ignore-table" val=
ign=3D"top" style=3D"width:100%;" id=3D"yui_3_16_0_ym19_1_1495112373981_231=
84" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16=
_0_ym19_1_1495112373981_23183"><tr id=3D"yui_3_16_0_ym19_1_1495112373981_23=
182"> <td style=3D"background:transparent url('https://s.yimg.com/nq/storm/=
assets/enhancrV2/12/overlay-tile.png') repeat left top;height:200px;" id=3D=
"yui_3_16_0_ym19_1_1495112373981_23181" valign=3D"top" bgcolor=3D"transpare=
nt" background=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-t=
ile.png"> <!--[if gte mso 9]><v:rect fill=3D"true" stroke=3D"false" style=
=3D"width:400px;height:218px;position:absolute;top:-18px;left:0;"><v:fill t=
ype=3D"pattern" color=3D"#000000" src=3D"https://s.yimg.com/nq/storm/assets=
/enhancrV2/12/overlay-tile.png"/><v:textbox inset=3D"0,0,20px,0"><![endif]-=
-> <table class=3D"yahoo-ignore-table" style=3D"width:100%;height:185px;min=
-height:185px;" id=3D"yui_3_16_0_ym19_1_1495112373981_23180" height=3D"185"=
> <tbody id=3D"yui_3_16_0_ym19_1_1495112373981_23179"><tr id=3D"yui_3_16_0_=
ym19_1_1495112373981_23178"> <td class=3D"card-richInfo2" style=3D"text-ali=
gn:left;text-align:left;padding:15px 0 0 15px;vertical-align:top;" id=3D"yu=
i_3_16_0_ym19_1_1495112373981_23341">  </td> <td class=3D"card-actions" sty=
le=3D"text-align:right;padding:15px 15px 0 0;vertical-align:top;" id=3D"yui=
_3_16_0_ym19_1_1495112373981_23177"> <div class=3D"card-share-container"></=
div> </td> </tr> </tbody></table> <!--[if gte mso 9]></v:textbox></v:rect><=
![endif]--> </td> </tr> </tbody></table> </td> </tr> <tr id=3D"yui_3_16_0_y=
m19_1_1495112373981_23350"> <td id=3D"yui_3_16_0_ym19_1_1495112373981_23349=
"> <table class=3D"card-info yahoo-ignore-table" style=3D"background:#fff;p=
osition:relative;z-index:2;width:95%;max-width:380px;border:1px solid #e0e4=
e9;border-bottom:3px solid #007ee4;margin-top:-40px;margin-left:auto;margin=
-right:auto;" id=3D"yui_3_16_0_ym19_1_1495112373981_23348" cellspacing=3D"0=
" cellpadding=3D"0" border=3D"0" align=3D"center"> <tbody id=3D"yui_3_16_0_=
ym19_1_1495112373981_23347"><tr id=3D"yui_3_16_0_ym19_1_1495112373981_23346=
"> <td style=3D"background-color:#ffffff;padding:16px 0 16px 12px;vertical-=
align:top;"> <img class=3D"card-object-1 yahoo-ignore-inline-image ymail-pr=
eserve-class" src=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/23/logos/=
dropbox.png" style=3D"min-width:32px;border:1px solid #e0e4e9;margin-top:3p=
x;" data-id=3D"e56a5a7a-b19b-6685-2d32-e3b190fb0bfb" height=3D"32">  </td> =
<td style=3D"vertical-align:middle;padding:16px 12px;width:99%;" id=3D"yui_=
3_16_0_ym19_1_1495112373981_23345"> <h2 class=3D"card-title" style=3D"font-=
size: 16px; line-height:19px; margin:0 0 4px 0;font-family:'Helvetica Neue'=
, Helvetica, Arial, sans-serif;word-break:break-word;" id=3D"yui_3_16_0_ym1=
9_1_1495112373981_23344">0001-PATCH-V-2-GDummyPanel-Fix-formatingissues.pat=
ch</h2>  <div class=3D"card-description" style=3D"font-size:11px;line-heigh=
t:15px;color:#999;word-break:break-word;">Shared with Dropbox</div> </td> <=
td style=3D"text-align:right;padding:16px 12px 16px 0;">  </td> </tr> </tbo=
dy></table> </td> </tr> </tbody></table> </td> </tr> </tbody></table> </a><=
/div><div><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1495112373981_=
23296"><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1495112373981_232=
95"><br>Then set about getting the upgrades from <span itemprop=3D"name" id=
=3D"yui_3_16_0_ym19_1_1495112373981_21217">Andrew Baumann in.</span></div><=
div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1495112373981_23131"><span itemprop=
=3D"name" id=3D"yui_3_16_0_ym19_1_1495112373981_21217"><br></span></div><di=
v dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1495112373981_23132"><span itemprop=
=3D"name" id=3D"yui_3_16_0_ym19_1_1495112373981_21217">Then prepare an RFC =
for the&nbsp; protocol used by GDummyPanel taking into account any feed pac=
k on the prototype/proof of concept/risk reduction in the patch.<br></span>=
</div><div id=3D"yui_3_16_0_ym19_1_1495112373981_21205"><br></div><div id=
=3D"enhancr2_f05fa098-a69d-a5cf-c7d9-c48a204a6a8e" class=3D"yahoo-link-enha=
ncr-card  ymail-preserve-class ymail-preserve-style" style=3D"max-width:400=
px;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;" data-url=3D=
"https://github.com/flypie/GDummyPanel" data-type=3D"yenhancr" data-categor=
y=3D"object" data-embed-url=3D"" data-size=3D"medium" dir=3D"ltr" contented=
itable=3D"false"> <a href=3D"https://github.com/flypie/GDummyPanel" style=
=3D"text-decoration:none !important; color: #000 !important;" class=3D"yaho=
o-enhancr-cardlink" target=3D"_blank" rel=3D"noreferrer"> <table class=3D"c=
ard-wrapper yahoo-ignore-table" style=3D"max-width:400px;" cellspacing=3D"0=
" cellpadding=3D"0" border=3D"0"> <tbody><tr> <td width=3D"400"> <table cla=
ss=3D"card yahoo-ignore-table" style=3D"max-width:400px;" width=3D"100%" ce=
llspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody><tr> <td class=3D"ca=
rd-primary-image-cell" style=3D"background:#000 url('https://s.yimg.com/vv/=
/api/res/1.2/L43IDfpUKzRHGyHPZf57yw--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9N=
DAw/https://avatars1.githubusercontent.com/u/5934895?v=3D3&amp;s=3D400.cf.j=
pg') no-repeat center center;background-size:cover;height:200px;position:re=
lative;" valign=3D"top" bgcolor=3D"#000000" background=3D"https://s.yimg.co=
m/vv//api/res/1.2/L43IDfpUKzRHGyHPZf57yw--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAw=
O3c9NDAw/https://avatars1.githubusercontent.com/u/5934895?v=3D3&amp;s=3D400=
.cf.jpg"> <!--[if gte mso 9]><v:rect fill=3D"true" stroke=3D"false" style=
=3D"width:400px;height:218px;position:absolute;top:0;left:0;"><v:fill type=
=3D"frame" color=3D"#000000" src=3D"https://s.yimg.com/vv//api/res/1.2/L43I=
DfpUKzRHGyHPZf57yw--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://avata=
rs1.githubusercontent.com/u/5934895?v=3D3&s=3D400.cf.jpg"/></v:rect><![endi=
f]--> <table class=3D"yahoo-ignore-table" valign=3D"top" style=3D"width:100=
%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody><tr> <td style=
=3D"background:transparent url('https://s.yimg.com/nq/storm/assets/enhancrV=
2/12/overlay-tile.png') repeat left top;height:200px;" valign=3D"top" bgcol=
or=3D"transparent" background=3D"https://s.yimg.com/nq/storm/assets/enhancr=
V2/12/overlay-tile.png"> <!--[if gte mso 9]><v:rect fill=3D"true" stroke=3D=
"false" style=3D"width:400px;height:218px;position:absolute;top:-18px;left:=
0;"><v:fill type=3D"pattern" color=3D"#000000" src=3D"https://s.yimg.com/nq=
/storm/assets/enhancrV2/12/overlay-tile.png"/><v:textbox inset=3D"0,0,20px,=
0"><![endif]--> <table class=3D"yahoo-ignore-table" style=3D"width:100%;hei=
ght:185px;min-height:185px;" height=3D"185"> <tbody><tr> <td class=3D"card-=
richInfo2" style=3D"text-align:left;text-align:left;padding:15px 0 0 15px;v=
ertical-align:top;">  </td> <td class=3D"card-actions" style=3D"text-align:=
right;padding:15px 15px 0 0;vertical-align:top;"> <div class=3D"card-share-=
container"></div> </td> </tr> </tbody></table> <!--[if gte mso 9]></v:textb=
ox></v:rect><![endif]--> </td> </tr> </tbody></table> </td> </tr> <tr> <td>=
 <table class=3D"card-info yahoo-ignore-table" style=3D"background:#fff;pos=
ition:relative;z-index:2;width:95%;max-width:380px;border:1px solid #e0e4e9=
;border-bottom:3px solid #010101;margin-top:-40px;margin-left:auto;margin-r=
ight:auto;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"cente=
r"> <tbody><tr> <td style=3D"background-color:#ffffff;padding:16px 0 16px 1=
2px;vertical-align:top;"> <img class=3D"card-object-1 yahoo-ignore-inline-i=
mage ymail-preserve-class" src=3D"https://s.yimg.com/nq/storm/assets/enhanc=
rV2/23/logos/github.png" style=3D"min-width:32px;border:1px solid #e0e4e9;m=
argin-top:3px;" data-id=3D"37724761-6f97-eb7d-f923-0583a62915a0" height=3D"=
32">  </td> <td style=3D"vertical-align:middle;padding:16px 12px;width:99%;=
"> <h2 class=3D"card-title" style=3D"font-size: 16px; line-height:19px; mar=
gin:0 0 4px 0;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;wo=
rd-break:break-word;">flypie/GDummyPanel</h2>  <div class=3D"card-descripti=
on" style=3D"font-size:11px;line-height:15px;color:#999;word-break:break-wo=
rd;">GDummyPanel - The Client App which links to the Raspi to help simulate=
 GPIO</div> </td> <td style=3D"text-align:right;padding:16px 12px 16px 0;">=
  </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </t=
body></table> </a></div><div><br></div><div id=3D"yui_3_16_0_ym19_1_1495112=
373981_17747"><span></span></div><div id=3D"yui_3_16_0_ym19_1_1495112373981=
_17746">&nbsp;</div><div class=3D"signature" id=3D"yui_3_16_0_ym19_1_149511=
2373981_17742"><div id=3D"yui_3_16_0_ym19_1_1495112373981_17741">John Bradl=
ey</div><div id=3D"yui_3_16_0_ym19_1_1495112373981_17776">Tel: 07896 839635=
</div><div id=3D"yui_3_16_0_ym19_1_1495112373981_17745">Skype: flypie125</d=
iv><div id=3D"yui_3_16_0_ym19_1_1495112373981_17743">
 125B Grove Street</div><div id=3D"yui_3_16_0_ym19_1_1495112373981_17744">E=
dge Hill </div><div>Liverpool L7 7AF</div></div> <div class=3D"qtdSeparateB=
R"><br><br></div><div class=3D"yahoo_quoted" style=3D"display: block;"> <di=
v style=3D"font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sa=
ns-serif; font-size: 16px;"> <div style=3D"font-family: HelveticaNeue, Helv=
etica Neue, Helvetica, Arial, Lucida Grande, Sans-Serif; font-size: 16px;">=
 <div dir=3D"ltr"><font size=3D"2" face=3D"Arial"> On Thursday, 18 May 2017=
, 8:47, Markus Armbruster &lt;armbru@redhat.com&gt; wrote:<br></font></div>=
  <br><br> <div class=3D"y_msg_container"><div dir=3D"ltr">IANAL, this woul=
dn't be legal advice even if I was one, yadda, yadda,<br></div><div dir=3D"=
ltr">here goes anyway:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
>Eric Blake &lt;<a ymailto=3D"mailto:eblake@redhat.com" href=3D"mailto:ebla=
ke@redhat.com">eblake@redhat.com</a>&gt; writes:<br></div><div dir=3D"ltr">=
<br></div><div dir=3D"ltr">&gt; On 05/17/2017 04:25 PM, John Bradley wrote:=
<br></div><div dir=3D"ltr">&gt;&gt; Well unfortunately Eric. I don't unders=
tand your "top posted" slang.<br></div><div dir=3D"ltr">&gt;<br></div><div =
dir=3D"ltr">&gt; To learn what top-posting is:<br></div><div dir=3D"ltr">&g=
t; <a href=3D"http://lmgtfy.com/?q=3Dwhat+is+top-posting" target=3D"_blank"=
>http://lmgtfy.com/?q=3Dwhat+is+top-posting</a><br></div><div dir=3D"ltr">&=
gt;<br></div><div dir=3D"ltr">&gt; and why we don't like it on technical li=
sts:<br></div><div dir=3D"ltr">&gt; <a href=3D"http://www.caliburn.nl/toppo=
sting.html" target=3D"_blank">http://www.caliburn.nl/topposting.html</a><br=
></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt; Or more humorou=
sly:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Seconded.<br></di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; A: Yes.<br></div><div di=
r=3D"ltr">&gt;&gt; &gt;Q: Are you sure?<br></div><div dir=3D"ltr">&gt;&gt;&=
gt; &gt;&gt;A: Because it reverses the logical flow of conversation.<br></d=
iv><div dir=3D"ltr">&gt;&gt;&gt;&gt; &gt;&gt;&gt;Q: Why is top posting frow=
ned upon?<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt;&gt;=
 <br></div><div dir=3D"ltr">&gt;&gt; As for his "intent", it is quite irrel=
evant as I have gone over the code line by line and what every he intended =
to do, he has succeed, as far as I can tell , in matching you standards, to=
 such an extent that I am happy that <br></div><div dir=3D"ltr">&gt;<br></d=
iv><div dir=3D"ltr">&gt; You are correct that the GPL gives us legal rights=
 to use Andrew's code<br></div><div dir=3D"ltr">&gt; without his permission=
.&nbsp; And yes, YOU can fork qemu, and take whatever<br></div><div dir=3D"=
ltr">&gt; GPL patches you want without attribution, and you are probably st=
ill<br></div><div dir=3D"ltr">&gt; just fine legally (as long as you still =
abide by the GPL in that you<br></div><div dir=3D"ltr">&gt; distribute sour=
ces to anyone that has your binary).<br></div><div dir=3D"ltr">&gt;<br></di=
v><div dir=3D"ltr">&gt; But our project rules do not allow us to live by ju=
st GPL (in part,<br></div><div dir=3D"ltr">&gt; because the license of qemu=
 is sometimes tricky to determine due to a<br></div><div dir=3D"ltr">&gt; m=
ix of GPLv2-only code and non-GPL code, even though most new code is<br></d=
iv><div dir=3D"ltr">&gt; GPLv2+).&nbsp; Also, if we ever had a reason to ch=
ange license (supposing it<br></div><div dir=3D"ltr">&gt; is even possible,=
 although it might require ripping out or<br></div><div dir=3D"ltr">&gt; re=
implementing portions of the code base), having S-o-b means that we<br></di=
v><div dir=3D"ltr">&gt; cannot be accused of applying a license that someon=
e did not agree to.<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr=
">&gt; Therefore, it is easier, pragmatically, even if not legally necessar=
y,<br></div><div dir=3D"ltr">&gt; to enforce proper chain of authorship by =
getting Signed-off-by: tags on<br></div><div dir=3D"ltr">&gt; ALL patches, =
especially where a patch asserts a copyright owner, insofar<br></div><div d=
ir=3D"ltr">&gt; as the original copyright owner is still alive and able to =
assent to the<br></div><div dir=3D"ltr">&gt; action.&nbsp; It is not just a=
bout legalities, it is also about risk-avoidance.<br></div><div dir=3D"ltr"=
>&gt;<br></div><div dir=3D"ltr">&gt; It may sound like we are being hard-no=
sed (and so be it), but there's a<br></div><div dir=3D"ltr">&gt; reason tha=
t we list proper Signed-off-by: rules as our number 1 item on<br></div><div=
 dir=3D"ltr">&gt; the SubmitAPatch page.<br></div><div dir=3D"ltr">&gt; <a =
href=3D"http://wiki.qemu.org/Contribute/SubmitAPatch" target=3D"_blank">htt=
p://wiki.qemu.org/Contribute/SubmitAPatch</a><br></div><div dir=3D"ltr"><br=
></div><div dir=3D"ltr">Yes, we require patch submitters to provide their S=
igned-off-by.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">We encou=
rage documenting a patch's provenance in full by having every<br></div><div=
 dir=3D"ltr">author provide their S-o-b, whenever practical.&nbsp; But we d=
on't require<br></div><div dir=3D"ltr">it.<br></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">The core purpose of the S-o-b is "to improve tracking =
of who did what"<br></div><div dir=3D"ltr">by making patch authors formally=
 certify that they "wrote it or<br></div><div dir=3D"ltr">otherwise have th=
e right to pass it on as a open-source patch"[2].&nbsp; Note<br></div><div =
dir=3D"ltr">"improve" and "have the right to pass it on".<br></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">One of the (many) reasons we're making =
software free is to help our<br></div><div dir=3D"ltr">neighbor[1] by letti=
ng him use our creation on a quid pro quo basis.<br></div><div dir=3D"ltr">=
Always requiring all author's S-o-b could make incorporating otherwise<br><=
/div><div dir=3D"ltr">free code impractical, and thus would conflict with t=
his mission.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">When obta=
ining an S-o-b is impractical, documenting provenance in other<br></div><di=
v dir=3D"ltr">ways has to do.<br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">John wrote upthread:<br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">&nbsp; &nbsp; Andrew Baumann has and others have release the code =
under GNU<br></div><div dir=3D"ltr">&nbsp; &nbsp; General Public License ve=
rsion 2 (GPLv2), the same as QEMU that<br></div><div dir=3D"ltr">&nbsp; &nb=
sp; allows me to added it to QEMU as it is under the same license, by<br></=
div><div dir=3D"ltr">&nbsp; &nbsp; signing it off this is what I am certify=
ing.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I agree with the =
reasoning "if free software compatible with the GPLv2,<br></div><div dir=3D=
"ltr">then I can incorporate it into QEMU as long as I certify by signing<b=
r></div><div dir=3D"ltr">off".<br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">John, thank you for your contribution to QEMU.&nbsp; I'm sorry you=
r patch got<br></div><div dir=3D"ltr">side-tracked into this non-technical =
swamp, and hope you understand why<br></div><div dir=3D"ltr">we're rather c=
areful when it comes to protecting the freedom of our<br></div><div dir=3D"=
ltr">software.&nbsp; I futher hope that we can put than behind us (along wi=
th<br></div><div dir=3D"ltr">top-posting *grin*), and move on to the fun pa=
rt.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">[1] See "The four essential freedoms"<br></div><div dir=3D"ltr"><a=
 href=3D"https://www.gnu.org/philosophy/free-sw.en.html" target=3D"_blank">=
https://www.gnu.org/philosophy/free-sw.en.html</a><br></div><div dir=3D"ltr=
">[2] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/plain/Documentation/process/submitting-patches.rst" target=3D"_bla=
nk">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plai=
n/Documentation/process/submitting-patches.rst</a><br></div><br><br></div> =
 </div> </div>  </div></div></body></html>
------=_Part_1302691_847614814.1495125558386--
