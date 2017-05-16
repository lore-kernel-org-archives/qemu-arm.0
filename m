Received: by 10.25.0.6 with SMTP id 6csp1638478lfa;
        Mon, 15 May 2017 17:05:39 -0700 (PDT)
X-Received: by 10.200.46.79 with SMTP id s15mr7905169qta.263.1494893139661;
        Mon, 15 May 2017 17:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494893139; cv=none;
        d=google.com; s=arc-20160816;
        b=QVvgy7Ng+W8/JuV56pNu+87FszpE7SyuWUxAYRuOKkxBE4Ea8IWXIRWNYC7tgJVE2+
         9DK5JZobi4STnjr+NcdXHJ7+XXnDFqqsMli46PlPfshgChpcwHZHdVJnQApYJGr6jxpq
         IgkAQ6gAwnJtDdQFwtJa/S+z6ywmqKLYN7rgxHs81Q8w1xPm3PL13D7b23G7R1w9BBaN
         IkzgUmFhRMD3SGRiWJP3K9BX5fzEetKKLKGCweQZED/cpgbWwFn4EwaC6xkTMaQJ5a1y
         nqFcp9E4GFFWxjEnX9mAr5Bhz3HYub5btb1JbQPB8PjrNjd75mR6T/38DNsVfPnZu/7u
         6U5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:mime-version:references:in-reply-to:message-id:to
         :date:dkim-signature:arc-authentication-results;
        bh=lOa5LhYwxSI6c4P2OwDF1VyawxNvAWbde7UyC5vKQgM=;
        b=zJT77GkH4RD2Dibei9W8UiErVTLcDm5EhKd7HujUK38rR8tKBHQenrolJKGejgOoBG
         Wk9fHVkDFGtwcI0X0gSpfVOyVNAGdOTWG4C9Mj6Zd+RNylLBzQjGdnck8WUtXEOCXObU
         boFvW/PnvAuIoKzQV0v7VQ/H2jlBMGhO+fO5ePixEoCSQ39hQPXbNfaARmeQIxp8yMmf
         2Asq3T1FaBKVGr5lQ0hmtWDg9LhIC6zolgQwwBUWrKmrH6Ril4bscCsuG9v5NeiVZb2c
         9nF1DkRCeNNPhrVWYOUKIID7bYBSnx78PP4fdDTopVLZPZwJamZQnoPHFGZnW2yGBUC2
         CK+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n40si12102774qtn.227.2017.05.15.17.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 17:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAPzf-0007c8-3A
	for alex.bennee@linaro.org; Mon, 15 May 2017 20:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAPzZ-0007aI-1n
	for qemu-arm@nongnu.org; Mon, 15 May 2017 20:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAPzU-000417-Uo
	for qemu-arm@nongnu.org; Mon, 15 May 2017 20:05:33 -0400
Received: from sonic314-47.consmr.mail.ir2.yahoo.com ([77.238.177.173]:36434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAPzU-0003zQ-F5
	for qemu-arm@nongnu.org; Mon, 15 May 2017 20:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1494893127; bh=lOa5LhYwxSI6c4P2OwDF1VyawxNvAWbde7UyC5vKQgM=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=XWLBczE0WZzWRHqxbNVFjsx/xtWdfT8Xurpq/rsAB0CwMCSjZN+FkO4LKM31ePDO5rinMh6X7cBdR25JZ6kGKumvagpKPhJ2gWXicABJb/lWLD6WG3QEDAzJCI+AYAaYZRJj73XKx2QqseysU8Htd9U6LNWIBRZ11rkFvC9BZ7ZCu5Z6g4LRXGNkQV3+6hYKzQML93I5iXYXy+1EOs2739LHq/fJSUgiLZFUBf3saBQ+8jYmCKvzihmHJTG5pzloLL7C6zgnMkPfKnBmfhh+n324F0CzcdMuxGckzl/xODeHwQ1mWwOmWSkkCIsbE3KLMhSJVoY8XVey3pwtFiKLjg==
X-YMail-OSG: QnATWwAVM1nHLMHY2hNQ0U1fqtX_nusADfxLyIS7fs6GyiUiTn9gT5yBl5lvDfr
	qmp2WdhjJL65iydjG7MH9hfGmpdAzhmINGHPoe49W1Wj3hxhJ9_SCxNfTOugtm9ZEBS4GBT__C.2
	yktTMY8p_oGW0ipe75ItI6vkmFIWdPP2Tjgeqwecc26m5R__mHf0SIHJoSt1fKjwWVn8OMF1L6tI
	9fzZmJYi65rSKRGFXwL_NHNEuCbnKfwU6xo9O9AV4tUlckPJ3E5E2kmY.1GAPiIXECfXBIyDv70l
	06VY92AmtAG99IyGoy_tBWzq2LjKI61L.6yN4XMyiHzAoOjAuPaU7IbJwO1h_G2TR0i.lytZHh8H
	zB1s9yXKuW2jBXOeME9Xr3VBef1QztCvGrAo8X5iZ45dyD1YJu5kYN4J3aAp86wGKFYyBiLzTdtU
	ZWPe8dD10iK6QBhVI74kVQ.ZlVk7z3rZpqgaAVYJgp3ZDWmT1cwH0OfgMzu_4iovN0uTLokFLqGr
	2uidaZ4Qjqu9pi2KELYfkorqv8Cdd1vnnIbB..UX6CRBdMU4R5vVSqRGy0UY-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ir2.yahoo.com with HTTP;
	Tue, 16 May 2017 00:05:27 +0000
Date: Tue, 16 May 2017 00:01:26 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <1901691584.9094.1494892886522@mail.yahoo.com>
In-Reply-To: <90703952-bc99-ecfe-96c7-810bb1784dce@amsat.org>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
	<1337329283.3100470.1494870647989@mail.yahoo.com>
	<90703952-bc99-ecfe-96c7-810bb1784dce@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9093_1791623637.1494892886517"
X-Mailer: WebService/1.1.9552 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 77.238.177.173
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
X-TUID: kJu2eYiKuhYB

------=_Part_9093_1791623637.1494892886517
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
The XML files in the base are not in the patch. They where net beans files.=
 I can easily get it into 3 files, one large at 91KB but contains only new =
files and so is easy to read. Could be smaller but seems pointless.=20

another which is about 19KB of quite simple changes to mostly make files.
Then one 15KB which quite straight forward when you look at it. Applying th=
em in that order should allow step wise addition. I've uploaded them to a s=
hare if anyone wants to comment.

The 3 files are new.patch
 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
new.patch
 Shared with Dropbox  |   |

  |

  |

=20
=C2=A0mod1.patch

 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
mod1.patch
 Shared with Dropbox  |   |

  |

  |

=20

and=20
=C2=A0a_hw_gpio_bcm2835_gpio.c.patch
 =20
| =20
|  =20
|  =20
|   |    |

   |

  |
| =20
|    | =20
a_hw_gpio_bcm2835_gpio.c.patch
 Shared with Dropbox  |   |

  |

  |

=20



John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hill Li=
verpool L7 7AF=20

    On Tuesday, 16 May 2017, 0:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
=20

 Hi John,

> That is going to be very difficult as a lot of the changes are
> interlinked the vast majority of the patch is new files.

I rebased your branch on latest qemu/master here:

https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebased

It is much easier to follow now, the big XML files you added/removed=20
also disappeared (gitk was crashing 'Out Of Memory' trying to look at=20
your tree).

I hope it can help you to continue reordering in smaller patches.

Regards,

Phil.

On 05/15/2017 01:46 PM, Alistair Francis wrote:
>
> Hey John,
>
> Thanks for the patch!
>
> Unfortunately this patch is too long to review, you need to split the
> patch up into shorter more readable patches. Otherwise it's too hard
> to people to understand what you are changing and why.
>
> There are some details here:
> http://wiki.qemu.org/Contribute/SubmitAPatch
> <http://wiki.qemu.org/Contribute/SubmitAPatch>about how to split up
> patches. Each patch applied in order shouldn't break any compilation
> or runtime. Generally the flow is to add the logic in earlier patches
> and then connect it and switch it on in the later patches.
>
> Try splitting up adding/editing each individual device and send that
> our first. That is generally the easiest to review/accept.
>
> Thanks,
>
> Alistair
>
>> ---
>> .gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++
>> hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-
>> hw/arm/bcm2835.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 114 ++++
>> hw/arm/bcm2835_peripherals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 ++++
>> hw/arm/bcm2836.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-
>> hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 77 ++-
>> hw/gpio/bcm2835_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 333 ++++++-----
>> hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +
>> hw/misc/bcm2835_mphi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 163 ++++++
>> hw/misc/bcm2835_power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 106 ++++
>> hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +
>> hw/timer/bcm2835_st.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 202 +++++++
>> hw/timer/bcm2835_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 224 +++++++
>> hw/usb/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 4 +-
>> hw/usb/bcm2835_usb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 604 +++++++++++++++++++
>> hw/usb/bcm2835_usb_regs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 106=
1
> ++++++++++++++++++++++++++++++++++
>> hw/usb/dev-network.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-
>> include/hw/arm/bcm2835.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 37 ++
>> include/hw/arm/bcm2835_peripherals.h |=C2=A0 10 +
>> include/hw/gpio/bcm2835_gpio.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +
>> include/hw/intc/bcm2835_control.h=C2=A0 =C2=A0 |=C2=A0 53 ++
>> include/hw/intc/bcm2836_control.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +
>> include/hw/misc/bcm2835_mphi.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +
>> include/hw/misc/bcm2835_power.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +
>> include/hw/timer/bcm2835_st.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +
>> include/hw/timer/bcm2835_timer.h=C2=A0 =C2=A0 |=C2=A0 32 +
>> include/hw/usb/bcm2835_usb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++
>> include/qemu/PanelEmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 53 ++
>> util/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +
>> util/PanelEmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 293 ++++++++++
>> 30 files changed, 3547 insertions(+), 149 deletions(-)
>> create mode 100644 hw/arm/bcm2835.c
>> create mode 100644 hw/misc/bcm2835_mphi.c
>> create mode 100644 hw/misc/bcm2835_power.c
>> create mode 100644 hw/timer/bcm2835_st.c
>> create mode 100644 hw/timer/bcm2835_timer.c
>> create mode 100644 hw/usb/bcm2835_usb.c
>> create mode 100644 hw/usb/bcm2835_usb_regs.h
>> create mode 100644 include/hw/arm/bcm2835.h
>> create mode 100644 include/hw/intc/bcm2835_control.h
>> create mode 100644 include/hw/misc/bcm2835_mphi.h
>> create mode 100644 include/hw/misc/bcm2835_power.h
>> create mode 100644 include/hw/timer/bcm2835_st.h
>> create mode 100644 include/hw/timer/bcm2835_timer.h
>> create mode 100644 include/hw/usb/bcm2835_usb.h
>> create mode 100644 include/qemu/PanelEmu.h
>> create mode 100644 util/PanelEmu.c
>>
>
>


  =20
------=_Part_9093_1791623637.1494892886517
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div style=3D"color:#000; background-color:#fff; font-family:Helvetica N=
eue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px"><div id=3D=
"yui_3_16_0_ym19_1_1494843305358_199208"><span>Hi,</span></div><div id=3D"y=
ui_3_16_0_ym19_1_1494843305358_199680"><span><br></span></div><div dir=3D"l=
tr" id=3D"yui_3_16_0_ym19_1_1494843305358_199561"><span id=3D"yui_3_16_0_ym=
19_1_1494843305358_199562">The XML files in the base are not in the patch. =
They where net beans files. I can easily get it into 3 files, one large at =
91KB but contains only new files and so is easy to read. Could be smaller b=
ut seems pointless. <br><br>another which is about 19KB of quite simple cha=
nges to mostly make files.</span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym=
19_1_1494843305358_199633"><span id=3D"yui_3_16_0_ym19_1_1494843305358_1995=
62"><br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1494843305358=
_199718"><span id=3D"yui_3_16_0_ym19_1_1494843305358_199562">Then one 15KB =
which quite straight forward when you look at it. Applying them in that ord=
er should allow step wise addition. I've uploaded them to a share if anyone=
 wants to comment.<br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1=
_1494843305358_202375"><span id=3D"yui_3_16_0_ym19_1_1494843305358_199562">=
<br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1494843305358_202=
368"><span id=3D"yui_3_16_0_ym19_1_1494843305358_199562">The 3 files are <a=
 href=3D"https://www.dropbox.com/s/dnoxem3m2urh562/new.patch?dl=3D0" class=
=3D"enhancr2_e038c85e-6c57-57b6-56fc-5fe401185fce" id=3D"yui_3_16_0_ym19_1_=
1494843305358_202367">new.patch</a></span></div><div id=3D"yui_3_16_0_ym19_=
1_1494843305358_202376"><br></div><div id=3D"enhancr2_e038c85e-6c57-57b6-56=
fc-5fe401185fce" class=3D"yahoo-link-enhancr-card  ymail-preserve-class yma=
il-preserve-style" style=3D"max-width:400px;font-family:'Helvetica Neue', H=
elvetica, Arial, sans-serif;" data-url=3D"https://www.dropbox.com/s/dnoxem3=
m2urh562/new.patch?dl=3D0" data-type=3D"yenhancr" data-category=3D"website"=
 data-embed-url=3D"" data-size=3D"medium" dir=3D"ltr" contenteditable=3D"fa=
lse"> <a href=3D"https://www.dropbox.com/s/dnoxem3m2urh562/new.patch?dl=3D0=
" style=3D"text-decoration:none !important; color: #000 !important;" class=
=3D"yahoo-enhancr-cardlink" target=3D"_blank" rel=3D"noreferrer" id=3D"yui_=
3_16_0_ym19_1_1494843305358_203102"> <table class=3D"card-wrapper yahoo-ign=
ore-table" style=3D"max-width:400px;" id=3D"yui_3_16_0_ym19_1_1494843305358=
_203101" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui=
_3_16_0_ym19_1_1494843305358_203100"><tr id=3D"yui_3_16_0_ym19_1_1494843305=
358_203099"> <td id=3D"yui_3_16_0_ym19_1_1494843305358_203098" width=3D"400=
"> <table class=3D"card yahoo-ignore-table" style=3D"max-width:400px;" id=
=3D"yui_3_16_0_ym19_1_1494843305358_203097" width=3D"100%" cellspacing=3D"0=
" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1494843305=
358_203096"><tr id=3D"yui_3_16_0_ym19_1_1494843305358_203095"> <td class=3D=
"card-primary-image-cell" style=3D"background:#000 url('https://s.yimg.com/=
vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3=
c9NDAw/https://cfl.dropboxstatic.com/static/images/icons128/page_white_code=
.png.cf.jpg') no-repeat center center;background-size:cover;height:200px;po=
sition:relative;" id=3D"yui_3_16_0_ym19_1_1494843305358_203094" valign=3D"t=
op" bgcolor=3D"#000000" background=3D"https://s.yimg.com/vv//api/res/1.2/wy=
GEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://cfl=
.dropboxstatic.com/static/images/icons128/page_white_code.png.cf.jpg"> <!--=
[if gte mso 9]><v:rect fill=3D"true" stroke=3D"false" style=3D"width:400px;=
height:218px;position:absolute;top:0;left:0;"><v:fill type=3D"frame" color=
=3D"#000000" src=3D"https://s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFK=
Lg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com=
/static/images/icons128/page_white_code.png.cf.jpg"/></v:rect><![endif]--> =
<table class=3D"yahoo-ignore-table" valign=3D"top" style=3D"width:100%;" id=
=3D"yui_3_16_0_ym19_1_1494843305358_203093" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1494843305358_203092"><=
tr id=3D"yui_3_16_0_ym19_1_1494843305358_203091"> <td style=3D"background:t=
ransparent url('https://s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-til=
e.png') repeat left top;height:200px;" id=3D"yui_3_16_0_ym19_1_149484330535=
8_203090" valign=3D"top" bgcolor=3D"transparent" background=3D"https://s.yi=
mg.com/nq/storm/assets/enhancrV2/12/overlay-tile.png"> <!--[if gte mso 9]><=
v:rect fill=3D"true" stroke=3D"false" style=3D"width:400px;height:218px;pos=
ition:absolute;top:-18px;left:0;"><v:fill type=3D"pattern" color=3D"#000000=
" src=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-tile.png"/=
><v:textbox inset=3D"0,0,20px,0"><![endif]--> <table class=3D"yahoo-ignore-=
table" style=3D"width:100%;height:185px;min-height:185px;" id=3D"yui_3_16_0=
_ym19_1_1494843305358_203089" height=3D"185"> <tbody id=3D"yui_3_16_0_ym19_=
1_1494843305358_203088"><tr id=3D"yui_3_16_0_ym19_1_1494843305358_203087"> =
<td class=3D"card-richInfo2" style=3D"text-align:left;text-align:left;paddi=
ng:15px 0 0 15px;vertical-align:top;">  </td> <td class=3D"card-actions" st=
yle=3D"text-align:right;padding:15px 15px 0 0;vertical-align:top;" id=3D"yu=
i_3_16_0_ym19_1_1494843305358_203086"> <div class=3D"card-share-container">=
</div> </td> </tr> </tbody></table> <!--[if gte mso 9]></v:textbox></v:rect=
><![endif]--> </td> </tr> </tbody></table> </td> </tr> <tr> <td> <table cla=
ss=3D"card-info yahoo-ignore-table" style=3D"background:#fff;position:relat=
ive;z-index:2;width:95%;max-width:380px;border:1px solid #e0e4e9;border-bot=
tom:3px solid #007ee4;margin-top:-40px;margin-left:auto;margin-right:auto;"=
 align=3D"center" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody>=
<tr> <td style=3D"background-color:#ffffff;padding:16px 0 16px 12px;vertica=
l-align:top;"> <img class=3D"card-object-1 yahoo-ignore-inline-image ymail-=
preserve-class" src=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/23/logo=
s/dropbox.png" style=3D"min-width:32px;border:1px solid #e0e4e9;margin-top:=
3px;" data-id=3D"8ea95abe-298e-6993-4b25-a528779d5862" height=3D"32">  </td=
> <td style=3D"vertical-align:middle;padding:16px 12px;width:99%;"> <h2 cla=
ss=3D"card-title" style=3D"font-size: 16px; line-height:19px; margin:0 0 4p=
x 0;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;word-break:b=
reak-word;">new.patch</h2>  <div class=3D"card-description" style=3D"font-s=
ize:11px;line-height:15px;color:#999;word-break:break-word;">Shared with Dr=
opbox</div> </td> <td style=3D"text-align:right;padding:16px 12px 16px 0;">=
  </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </t=
body></table> </a></div><div id=3D"yui_3_16_0_ym19_1_1494843305358_202379">=
<br></div><div id=3D"yui_3_16_0_ym19_1_1494843305358_199207"><div id=3D"yui=
_3_16_0_ym19_1_1494843305358_202378">&nbsp;</div><div dir=3D"ltr" id=3D"yui=
_3_16_0_ym19_1_1494843305358_202432"><a href=3D"https://www.dropbox.com/s/4=
6irgjsw5r306rh/mod1.patch?dl=3D0" class=3D"enhancr2_4b0a6cbe-2011-2d3f-4fda=
-8e9db0bdcb61" id=3D"yui_3_16_0_ym19_1_1494843305358_202431">mod1.patch</a>=
<br></div><div><br></div><div id=3D"enhancr2_4b0a6cbe-2011-2d3f-4fda-8e9db0=
bdcb61" class=3D"yahoo-link-enhancr-card  ymail-preserve-class ymail-preser=
ve-style" style=3D"max-width:400px;font-family:'Helvetica Neue', Helvetica,=
 Arial, sans-serif;" data-url=3D"https://www.dropbox.com/s/46irgjsw5r306rh/=
mod1.patch?dl=3D0" data-type=3D"yenhancr" data-category=3D"website" data-em=
bed-url=3D"" data-size=3D"medium" dir=3D"ltr" contenteditable=3D"false"> <a=
 href=3D"https://www.dropbox.com/s/46irgjsw5r306rh/mod1.patch?dl=3D0" style=
=3D"text-decoration:none !important; color: #000 !important;" class=3D"yaho=
o-enhancr-cardlink" target=3D"_blank" rel=3D"noreferrer" id=3D"yui_3_16_0_y=
m19_1_1494843305358_202456"> <table class=3D"card-wrapper yahoo-ignore-tabl=
e" style=3D"max-width:400px;" id=3D"yui_3_16_0_ym19_1_1494843305358_202455"=
 cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_=
ym19_1_1494843305358_202454"><tr id=3D"yui_3_16_0_ym19_1_1494843305358_2024=
53"> <td id=3D"yui_3_16_0_ym19_1_1494843305358_202452" width=3D"400"> <tabl=
e class=3D"card yahoo-ignore-table" style=3D"max-width:400px;" id=3D"yui_3_=
16_0_ym19_1_1494843305358_202451" width=3D"100%" cellspacing=3D"0" cellpadd=
ing=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1494843305358_202450=
"><tr> <td class=3D"card-primary-image-cell" style=3D"background:#000 url('=
https://s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDt=
maT1maWxsO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com/static/images/icons=
128/page_white_code.png.cf.jpg') no-repeat center center;background-size:co=
ver;height:200px;position:relative;" valign=3D"top" bgcolor=3D"#000000" bac=
kground=3D"https://s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBw=
aWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com/static/i=
mages/icons128/page_white_code.png.cf.jpg"> <!--[if gte mso 9]><v:rect fill=
=3D"true" stroke=3D"false" style=3D"width:400px;height:218px;position:absol=
ute;top:0;left:0;"><v:fill type=3D"frame" color=3D"#000000" src=3D"https://=
s.yimg.com/vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWx=
sO2g9MjAwO3c9NDAw/https://cfl.dropboxstatic.com/static/images/icons128/page=
_white_code.png.cf.jpg"/></v:rect><![endif]--> <table class=3D"yahoo-ignore=
-table" valign=3D"top" style=3D"width:100%;" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"> <tbody><tr> <td style=3D"background:transparent url('h=
ttps://s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-tile.png') repeat le=
ft top;height:200px;" valign=3D"top" bgcolor=3D"transparent" background=3D"=
https://s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-tile.png"> <!--[if =
gte mso 9]><v:rect fill=3D"true" stroke=3D"false" style=3D"width:400px;heig=
ht:218px;position:absolute;top:-18px;left:0;"><v:fill type=3D"pattern" colo=
r=3D"#000000" src=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/12/overla=
y-tile.png"/><v:textbox inset=3D"0,0,20px,0"><![endif]--> <table class=3D"y=
ahoo-ignore-table" style=3D"width:100%;height:185px;min-height:185px;" heig=
ht=3D"185"> <tbody><tr> <td class=3D"card-richInfo2" style=3D"text-align:le=
ft;text-align:left;padding:15px 0 0 15px;vertical-align:top;">  </td> <td c=
lass=3D"card-actions" style=3D"text-align:right;padding:15px 15px 0 0;verti=
cal-align:top;"> <div class=3D"card-share-container"></div> </td> </tr> </t=
body></table> <!--[if gte mso 9]></v:textbox></v:rect><![endif]--> </td> </=
tr> </tbody></table> </td> </tr> <tr id=3D"yui_3_16_0_ym19_1_1494843305358_=
202449"> <td id=3D"yui_3_16_0_ym19_1_1494843305358_202448"> <table class=3D=
"card-info yahoo-ignore-table" style=3D"background:#fff;position:relative;z=
-index:2;width:95%;max-width:380px;border:1px solid #e0e4e9;border-bottom:3=
px solid #007ee4;margin-top:-40px;margin-left:auto;margin-right:auto;" id=
=3D"yui_3_16_0_ym19_1_1494843305358_202447" align=3D"center" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_14948433=
05358_202446"><tr id=3D"yui_3_16_0_ym19_1_1494843305358_202445"> <td style=
=3D"background-color:#ffffff;padding:16px 0 16px 12px;vertical-align:top;">=
 <img class=3D"card-object-1 yahoo-ignore-inline-image ymail-preserve-class=
" src=3D"https://s.yimg.com/nq/storm/assets/enhancrV2/23/logos/dropbox.png"=
 style=3D"min-width:32px;border:1px solid #e0e4e9;margin-top:3px;" data-id=
=3D"a3fe41c3-6d1a-9fc2-be61-d5f2e1609234" height=3D"32">  </td> <td style=
=3D"vertical-align:middle;padding:16px 12px;width:99%;" id=3D"yui_3_16_0_ym=
19_1_1494843305358_202444"> <h2 class=3D"card-title" style=3D"font-size: 16=
px; line-height:19px; margin:0 0 4px 0;font-family:'Helvetica Neue', Helvet=
ica, Arial, sans-serif;word-break:break-word;">mod1.patch</h2>  <div class=
=3D"card-description" style=3D"font-size:11px;line-height:15px;color:#999;w=
ord-break:break-word;" id=3D"yui_3_16_0_ym19_1_1494843305358_202443">Shared=
 with Dropbox</div> </td> <td style=3D"text-align:right;padding:16px 12px 1=
6px 0;">  </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> <=
/tr> </tbody></table> </a></div><div id=3D"yui_3_16_0_ym19_1_1494843305358_=
202439"><br></div><div id=3D"yui_3_16_0_ym19_1_1494843305358_202440"><br></=
div><div id=3D"yui_3_16_0_ym19_1_1494843305358_202522" dir=3D"ltr">and <br>=
&nbsp;<a href=3D"https://www.dropbox.com/s/qy5s44bzbxgxo8q/a_hw_gpio_bcm283=
5_gpio.c.patch?dl=3D0" class=3D"enhancr2_aa515560-d672-f99e-6599-21d889334b=
d5" id=3D"yui_3_16_0_ym19_1_1494843305358_202555">a_hw_gpio_bcm2835_gpio.c.=
patch</a></div><div><br></div><div id=3D"enhancr2_aa515560-d672-f99e-6599-2=
1d889334bd5" class=3D"yahoo-link-enhancr-card  ymail-preserve-class ymail-p=
reserve-style" style=3D"max-width:400px;font-family:'Helvetica Neue', Helve=
tica, Arial, sans-serif;" data-url=3D"https://www.dropbox.com/s/qy5s44bzbxg=
xo8q/a_hw_gpio_bcm2835_gpio.c.patch?dl=3D0" data-type=3D"yenhancr" data-cat=
egory=3D"website" data-embed-url=3D"" data-size=3D"medium" dir=3D"ltr" cont=
enteditable=3D"false"> <a href=3D"https://www.dropbox.com/s/qy5s44bzbxgxo8q=
/a_hw_gpio_bcm2835_gpio.c.patch?dl=3D0" style=3D"text-decoration:none !impo=
rtant; color: #000 !important;" class=3D"yahoo-enhancr-cardlink" target=3D"=
_blank" rel=3D"noreferrer" id=3D"yui_3_16_0_ym19_1_1494843305358_202586"> <=
table class=3D"card-wrapper yahoo-ignore-table" style=3D"max-width:400px;" =
id=3D"yui_3_16_0_ym19_1_1494843305358_202585" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1494843305358_202584"><=
tr id=3D"yui_3_16_0_ym19_1_1494843305358_202583"> <td id=3D"yui_3_16_0_ym19=
_1_1494843305358_202582" width=3D"400"> <table class=3D"card yahoo-ignore-t=
able" style=3D"max-width:400px;" id=3D"yui_3_16_0_ym19_1_1494843305358_2025=
81" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody=
 id=3D"yui_3_16_0_ym19_1_1494843305358_202580"><tr> <td class=3D"card-prima=
ry-image-cell" style=3D"background:#000 url('https://s.yimg.com/vv//api/res=
/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/http=
s://cfl.dropboxstatic.com/static/images/icons128/page_white_code.png.cf.jpg=
') no-repeat center center;background-size:cover;height:200px;position:rela=
tive;" valign=3D"top" bgcolor=3D"#000000" background=3D"https://s.yimg.com/=
vv//api/res/1.2/wyGEsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3=
c9NDAw/https://cfl.dropboxstatic.com/static/images/icons128/page_white_code=
.png.cf.jpg"> <!--[if gte mso 9]><v:rect fill=3D"true" stroke=3D"false" sty=
le=3D"width:400px;height:218px;position:absolute;top:0;left:0;"><v:fill typ=
e=3D"frame" color=3D"#000000" src=3D"https://s.yimg.com/vv//api/res/1.2/wyG=
EsNxSDoWFnbaGiLFKLg--/YXBwaWQ9bWFpbDtmaT1maWxsO2g9MjAwO3c9NDAw/https://cfl.=
dropboxstatic.com/static/images/icons128/page_white_code.png.cf.jpg"/></v:r=
ect><![endif]--> <table class=3D"yahoo-ignore-table" valign=3D"top" style=
=3D"width:100%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"> <tbody><=
tr> <td style=3D"background:transparent url('https://s.yimg.com/nq/storm/as=
sets/enhancrV2/12/overlay-tile.png') repeat left top;height:200px;" valign=
=3D"top" bgcolor=3D"transparent" background=3D"https://s.yimg.com/nq/storm/=
assets/enhancrV2/12/overlay-tile.png"> <!--[if gte mso 9]><v:rect fill=3D"t=
rue" stroke=3D"false" style=3D"width:400px;height:218px;position:absolute;t=
op:-18px;left:0;"><v:fill type=3D"pattern" color=3D"#000000" src=3D"https:/=
/s.yimg.com/nq/storm/assets/enhancrV2/12/overlay-tile.png"/><v:textbox inse=
t=3D"0,0,20px,0"><![endif]--> <table class=3D"yahoo-ignore-table" style=3D"=
width:100%;height:185px;min-height:185px;" height=3D"185"> <tbody><tr> <td =
class=3D"card-richInfo2" style=3D"text-align:left;text-align:left;padding:1=
5px 0 0 15px;vertical-align:top;">  </td> <td class=3D"card-actions" style=
=3D"text-align:right;padding:15px 15px 0 0;vertical-align:top;"> <div class=
=3D"card-share-container"></div> </td> </tr> </tbody></table> <!--[if gte m=
so 9]></v:textbox></v:rect><![endif]--> </td> </tr> </tbody></table> </td> =
</tr> <tr id=3D"yui_3_16_0_ym19_1_1494843305358_202579"> <td id=3D"yui_3_16=
_0_ym19_1_1494843305358_202578"> <table class=3D"card-info yahoo-ignore-tab=
le" style=3D"background:#fff;position:relative;z-index:2;width:95%;max-widt=
h:380px;border:1px solid #e0e4e9;border-bottom:3px solid #007ee4;margin-top=
:-40px;margin-left:auto;margin-right:auto;" id=3D"yui_3_16_0_ym19_1_1494843=
305358_202577" align=3D"center" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"> <tbody id=3D"yui_3_16_0_ym19_1_1494843305358_202576"><tr id=3D"yui_=
3_16_0_ym19_1_1494843305358_202575"> <td style=3D"background-color:#ffffff;=
padding:16px 0 16px 12px;vertical-align:top;"> <img class=3D"card-object-1 =
yahoo-ignore-inline-image ymail-preserve-class" src=3D"https://s.yimg.com/n=
q/storm/assets/enhancrV2/23/logos/dropbox.png" style=3D"min-width:32px;bord=
er:1px solid #e0e4e9;margin-top:3px;" data-id=3D"df695e89-eb3f-4040-6998-c9=
cb28bf1e49" height=3D"32">  </td> <td style=3D"vertical-align:middle;paddin=
g:16px 12px;width:99%;" id=3D"yui_3_16_0_ym19_1_1494843305358_202574"> <h2 =
class=3D"card-title" style=3D"font-size: 16px; line-height:19px; margin:0 0=
 4px 0;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;word-brea=
k:break-word;" id=3D"yui_3_16_0_ym19_1_1494843305358_202573">a_hw_gpio_bcm2=
835_gpio.c.patch</h2>  <div class=3D"card-description" style=3D"font-size:1=
1px;line-height:15px;color:#999;word-break:break-word;">Shared with Dropbox=
</div> </td> <td style=3D"text-align:right;padding:16px 12px 16px 0;">  </t=
d> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </tbody>=
</table> </a></div><div><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_=
1494843305358_202552"><br></div><div><br></div><div><br></div></div><div cl=
ass=3D"signature" id=3D"yui_3_16_0_ym19_1_1494843305358_199192"><div id=3D"=
yui_3_16_0_ym19_1_1494843305358_199206">John Bradley</div><div id=3D"yui_3_=
16_0_ym19_1_1494843305358_199205">Tel: 07896 839635</div><div id=3D"yui_3_1=
6_0_ym19_1_1494843305358_199193">Skype: flypie125</div><div id=3D"yui_3_16_=
0_ym19_1_1494843305358_199191">
 125B Grove Street</div><div id=3D"yui_3_16_0_ym19_1_1494843305358_199742">=
Edge Hill </div><div id=3D"yui_3_16_0_ym19_1_1494843305358_200712">Liverpoo=
l L7 7AF</div></div> <div class=3D"qtdSeparateBR"><br><br></div><div class=
=3D"yahoo_quoted" style=3D"display: block;"> <div style=3D"font-family: Hel=
vetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; font-size: 16px;"=
> <div style=3D"font-family: HelveticaNeue, Helvetica Neue, Helvetica, Aria=
l, Lucida Grande, Sans-Serif; font-size: 16px;"> <div dir=3D"ltr"><font fac=
e=3D"Arial" size=3D"2"> On Tuesday, 16 May 2017, 0:20, Philippe Mathieu-Dau=
d=C3=A9 &lt;f4bug@amsat.org&gt; wrote:<br></font></div>  <br><br> <div clas=
s=3D"y_msg_container"><div dir=3D"ltr">Hi John,<br clear=3D"none"><br clear=
=3D"none">&gt; That is going to be very difficult as a lot of the changes a=
re<br clear=3D"none">&gt; interlinked the vast majority of the patch is new=
 files.<br clear=3D"none"><br clear=3D"none">I rebased your branch on lates=
t qemu/master here:<br clear=3D"none"><br clear=3D"none"><a shape=3D"rect" =
href=3D"https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebased" tar=
get=3D"_blank">https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebas=
ed</a><br clear=3D"none"><br clear=3D"none">It is much easier to follow now=
, the big XML files you added/removed <br clear=3D"none">also disappeared (=
gitk was crashing 'Out Of Memory' trying to look at <br clear=3D"none">your=
 tree).<br clear=3D"none"><br clear=3D"none">I hope it can help you to cont=
inue reordering in smaller patches.<br clear=3D"none"><br clear=3D"none">Re=
gards,<br clear=3D"none"><br clear=3D"none">Phil.<br clear=3D"none"><br cle=
ar=3D"none">On 05/15/2017 01:46 PM, Alistair Francis wrote:<div class=3D"yq=
t0219380845" id=3D"yqtfd16359"><br clear=3D"none">&gt;<br clear=3D"none">&g=
t; Hey John,<br clear=3D"none">&gt;<br clear=3D"none">&gt; Thanks for the p=
atch!<br clear=3D"none">&gt;<br clear=3D"none">&gt; Unfortunately this patc=
h is too long to review, you need to split the<br clear=3D"none">&gt; patch=
 up into shorter more readable patches. Otherwise it's too hard<br clear=3D=
"none">&gt; to people to understand what you are changing and why.<br clear=
=3D"none">&gt;<br clear=3D"none">&gt; There are some details here:<br clear=
=3D"none">&gt; <a shape=3D"rect" href=3D"http://wiki.qemu.org/Contribute/Su=
bmitAPatch" target=3D"_blank">http://wiki.qemu.org/Contribute/SubmitAPatch<=
/a><br clear=3D"none">&gt; &lt;<a shape=3D"rect" href=3D"http://wiki.qemu.o=
rg/Contribute/SubmitAPatch" target=3D"_blank">http://wiki.qemu.org/Contribu=
te/SubmitAPatch</a>&gt;about how to split up<br clear=3D"none">&gt; patches=
. Each patch applied in order shouldn't break any compilation<br clear=3D"n=
one">&gt; or runtime. Generally the flow is to add the logic in earlier pat=
ches<br clear=3D"none">&gt; and then connect it and switch it on in the lat=
er patches.<br clear=3D"none">&gt;<br clear=3D"none">&gt; Try splitting up =
adding/editing each individual device and send that<br clear=3D"none">&gt; =
our first. That is generally the easiest to review/accept.<br clear=3D"none=
">&gt;<br clear=3D"none">&gt; Thanks,<br clear=3D"none">&gt;<br clear=3D"no=
ne">&gt; Alistair<br clear=3D"none">&gt;<br clear=3D"none">&gt;&gt; ---<br =
clear=3D"none">&gt;&gt; .gitignore&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 54 ++<br clear=3D=
"none">&gt;&gt; hw/arm/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; |&nbsp; &nbsp; 2 +-<br clear=3D"none">&gt;&gt; hw/arm/bcm2=
835.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
|&nbsp; 114 ++++<br clear=3D"none">&gt;&gt; hw/arm/bcm2835_peripherals.c&nb=
sp; &nbsp; &nbsp; &nbsp; |&nbsp; 104 ++++<br clear=3D"none">&gt;&gt; hw/arm=
/bcm2836.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; |&nbsp; &nbsp; 3 +-<br clear=3D"none">&gt;&gt; hw/arm/raspi.c&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;=
 77 ++-<br clear=3D"none">&gt;&gt; hw/gpio/bcm2835_gpio.c&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 333 ++++++-----<br clear=3D"none">&g=
t;&gt; hw/misc/Makefile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; |&nbsp; &nbsp; 2 +<br clear=3D"none">&gt;&gt; hw/misc/bcm2835_mphi=
.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 163 ++++++<br cl=
ear=3D"none">&gt;&gt; hw/misc/bcm2835_power.c&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; |&nbsp; 106 ++++<br clear=3D"none">&gt;&gt; hw/timer/Mak=
efile.objs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2=
 +<br clear=3D"none">&gt;&gt; hw/timer/bcm2835_st.c&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 202 +++++++<br clear=3D"none">&gt;&=
gt; hw/timer/bcm2835_timer.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; 224 +++++++<br clear=3D"none">&gt;&gt; hw/usb/Makefile.objs&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 4 +-<br clear=3D"=
none">&gt;&gt; hw/usb/bcm2835_usb.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; |&nbsp; 604 +++++++++++++++++++<br clear=3D"none">&gt;&gt; =
hw/usb/bcm2835_usb_regs.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 1061<b=
r clear=3D"none">&gt; ++++++++++++++++++++++++++++++++++<br clear=3D"none">=
&gt;&gt; hw/usb/dev-network.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |&nbsp; &nbsp; 2 +-<br clear=3D"none">&gt;&gt; include/hw/arm/bcm=
2835.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 37 ++<br clear=3D"n=
one">&gt;&gt; include/hw/arm/bcm2835_peripherals.h |&nbsp; 10 +<br clear=3D=
"none">&gt;&gt; include/hw/gpio/bcm2835_gpio.h&nbsp; &nbsp; &nbsp; |&nbsp; =
&nbsp; 5 +<br clear=3D"none">&gt;&gt; include/hw/intc/bcm2835_control.h&nbs=
p; &nbsp; |&nbsp; 53 ++<br clear=3D"none">&gt;&gt; include/hw/intc/bcm2836_=
control.h&nbsp; &nbsp; |&nbsp; &nbsp; 2 +<br clear=3D"none">&gt;&gt; includ=
e/hw/misc/bcm2835_mphi.h&nbsp; &nbsp; &nbsp; |&nbsp; 28 +<br clear=3D"none"=
>&gt;&gt; include/hw/misc/bcm2835_power.h&nbsp; &nbsp; &nbsp; |&nbsp; 22 +<=
br clear=3D"none">&gt;&gt; include/hw/timer/bcm2835_st.h&nbsp; &nbsp; &nbsp=
; &nbsp; |&nbsp; 25 +<br clear=3D"none">&gt;&gt; include/hw/timer/bcm2835_t=
imer.h&nbsp; &nbsp; |&nbsp; 32 +<br clear=3D"none">&gt;&gt; include/hw/usb/=
bcm2835_usb.h&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 78 +++<br clear=3D"none">&=
gt;&gt; include/qemu/PanelEmu.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; |&nbsp; 53 ++<br clear=3D"none">&gt;&gt; util/Makefile.objs&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 1 +<br c=
lear=3D"none">&gt;&gt; util/PanelEmu.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 293 ++++++++++<br clear=3D"=
none">&gt;&gt; 30 files changed, 3547 insertions(+), 149 deletions(-)<br cl=
ear=3D"none">&gt;&gt; create mode 100644 hw/arm/bcm2835.c<br clear=3D"none"=
>&gt;&gt; create mode 100644 hw/misc/bcm2835_mphi.c<br clear=3D"none">&gt;&=
gt; create mode 100644 hw/misc/bcm2835_power.c<br clear=3D"none">&gt;&gt; c=
reate mode 100644 hw/timer/bcm2835_st.c<br clear=3D"none">&gt;&gt; create m=
ode 100644 hw/timer/bcm2835_timer.c<br clear=3D"none">&gt;&gt; create mode =
100644 hw/usb/bcm2835_usb.c<br clear=3D"none">&gt;&gt; create mode 100644 h=
w/usb/bcm2835_usb_regs.h<br clear=3D"none">&gt;&gt; create mode 100644 incl=
ude/hw/arm/bcm2835.h<br clear=3D"none">&gt;&gt; create mode 100644 include/=
hw/intc/bcm2835_control.h<br clear=3D"none">&gt;&gt; create mode 100644 inc=
lude/hw/misc/bcm2835_mphi.h<br clear=3D"none">&gt;&gt; create mode 100644 i=
nclude/hw/misc/bcm2835_power.h<br clear=3D"none">&gt;&gt; create mode 10064=
4 include/hw/timer/bcm2835_st.h<br clear=3D"none">&gt;&gt; create mode 1006=
44 include/hw/timer/bcm2835_timer.h<br clear=3D"none">&gt;&gt; create mode =
100644 include/hw/usb/bcm2835_usb.h<br clear=3D"none">&gt;&gt; create mode =
100644 include/qemu/PanelEmu.h<br clear=3D"none">&gt;&gt; create mode 10064=
4 util/PanelEmu.c<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;<br clea=
r=3D"none">&gt;<br clear=3D"none"></div></div><br><br></div>  </div> </div>=
  </div></div></body></html>
------=_Part_9093_1791623637.1494892886517--
