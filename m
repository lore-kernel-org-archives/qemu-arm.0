Received: by 10.25.208.194 with SMTP id h185csp910358lfg;
        Fri, 22 Apr 2016 11:10:27 -0700 (PDT)
X-Received: by 10.141.45.5 with SMTP id w5mr23962362qhe.1.1461348627516;
        Fri, 22 Apr 2016 11:10:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si3923471qkb.163.2016.04.22.11.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 11:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atfX8-0003RJ-UB
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 14:10:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atfWe-0002aK-SN
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 14:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atfWa-00059n-QW
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 14:09:56 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atfWa-00059j-HA; Fri, 22 Apr 2016 14:09:52 -0400
Received: by mail-wm0-f42.google.com with SMTP id v188so30209513wme.1;
	Fri, 22 Apr 2016 11:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eAj6FNuf5F/N0Ey3fjpGp4WqqXDp+uVWCq49xDyK+aY=;
	b=T9bR7d+eb19pwEDh3kriER114BjWpgD15q9V2TyluttW7BVzVL1NLOzVYo7TERCkym
	DnI/B+ve7YAyXod9wfg4E+tRzFiXgE1XPPOGIUSv8xi/3lM74b67iHxHx0gV/VyrLqp3
	isO4AKSY5ju9UAJgTG3sXzXRm6gCk+LMyuRwM8aDwmRTYUdDffyM8dWt6lMDlHXEiFol
	KZfZGVkJ5NVCbSHBm1/gHb9IH+zlZ2+aEpsRg34gTH+0soNG1krbrmKUnrKTPZWaOGLk
	Wwl7J9txtlNayfQ0UOT5hei6TGTyiu0hAeYwzyESlYQxTeo+GDxlF0HBUjUc71z9iDOs
	MOkw==
X-Gm-Message-State: AOPr4FX6YjIlVKcqilZDVQtuCLDwnjZy0HY9OFTREqXuYwIuQtXNbAYuSpBAwrAlZjNEog==
X-Received: by 10.28.212.71 with SMTP id l68mr5317415wmg.22.1461348591903;
	Fri, 22 Apr 2016 11:09:51 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	r123sm4520623wmg.20.2016.04.22.11.09.49
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 11:09:50 -0700 (PDT)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_02B2668F-7A53-44B3-A6ED-89FD9413FEC5"
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <BLUPR0301MB2034E26C749A161446AAB1389E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 22 Apr 2016 20:09:48 +0200
Message-Id: <E923420D-A263-4C2C-80C7-AE10FFDF8E80@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
	<BLUPR0301MB2034E26C749A161446AAB1389E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.42
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
	Stephen Warren <swarren@wwwdotorg.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FCDiEbqhYDNy


--Apple-Mail=_02B2668F-7A53-44B3-A6ED-89FD9413FEC5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Le 22 avr. 2016 =C3=A0 13:44, Andrew Baumann =
<Andrew.Baumann@microsoft.com> a =C3=A9crit :
> You got further on this than I did. I considered a couple of options, =
of varying complexity/compatibility:
>=20
> 0. The status quo: we support -kernel (for Linux images) and -bios =
(e.g. Windows), but otherwise all the options that can be set in =
config.txt are treated as the defaults. For example, -bios images are =
always loaded at 0x8000. Additionally, framebuffer parameters can be set =
directly from the command line (e.g. Windows wants -global =
bcm2835-fb.pixo=3D0).
> 1. More pi-specific parameters in the line of the framebuffer =
parameters above, to control things like the image load address, and =
maybe to enable trustzone boot akin to config.txt's kernel-old=3D1.
> 2. Code to parse config.txt and set the parameters above.
> 3. Code to emulate the bootloader entirely, pulling config.txt and all =
the relevant boot bits out of an SD image (this is what Peter describes =
above).
> 4. An ARM-based reimplementation of the bootloader, running under =
emulation.


Having the ARM bootloader (called armstub in raspberry pi developers =
words), the config.txt file, and the =C2=AB kernel =C2=BB (whatever it =
is, ELF or raw binary) on a FAT portion of an SD card is convenient for =
real hardware: on a lambda user perspective, you just use your lambda =
computer to burn an image on a SD card (one you don=E2=80=99t use =
anymore with your camera), then insert it in your shiny new raspberry pi =
hardware.

QEMU in my opinion does not target the regular lambda user, and I =
wouldn=E2=80=99t go as far as mimicking the FAT / SD emulation boot =
process: my personal use case for qemu as a developer is =C2=AB kernel =
=C2=BB development / debugging and my workflow sums up to a simple loop:=20=


# vi some_kernel_source_code.c && make && qemu -kernel =
the_new_kernel_image
Do that 100 times a day.

Having to place my kernel in a FAT partition of a mounted disk image in =
my host OS would just complexity my process. I don=E2=80=99t expect my =
emulator to be 100% similar to the real hardware (it will never in the =
case of the Raspberry Pi, as long as the GPU firmware source code is =
closed). I just want to use my emulator to get things done fast (on my =
host computer rather than real hardware) and I want to emulate CPU and =
code (interrupts, etc) as closely as possible, without too much effort.

Having said that, I would give the qemu user who wants raspberry pi =
emulation these two functionalities that the raspberry pi firmware =
provides:
1/ ability to use a custom bootloader before launching the kernel: =
option armstub=3Dsomebootloader.bin in config.txt (be it u-boot or a =
custom stub which leaves HYP mode)
2/ ability to load your =C2=AB kernel =C2=BB at a specific address: =
option kernel_address in config.txt

So future -kernel-address and -bootloader qemu command line parameters =
(either specific to Raspberry pi or global) is my dream. That way I can =
play fast with whatever bootloader I want, play with HYP mode, and I can =
use whatever loading address I want.=20

By the way, for the Raspberry Pi, the address is 0x8000 compared to the =
default 0x10000 for Arm in qemu, and being able to set it would enable =
to boot (without patching QEMU=E2=80=99s code) NetBSD images (compiled =
to work at 0x8000) and FreeBSD kernel without u-boot (requires the =
loading address to be a multiple of 2MB). Seems to me like basic =
functionality. I heard your argument Peter mentioning the linux boot =
protocol doesn=E2=80=99t mandate a loading address, and I find it is for =
this specific reason that which should let the user choose it. I also =
heard the =C2=AB use an ELF =C2=BB argument but some non-Linux kernels =
have by default a virtual (and not physical) address in their header, so =
doesn=E2=80=99t work straight out of the box.

Just my 2 cents :-) I however want to thank you all for the quality of =
the ARM emulation and more specifically the Raspberry Pi one, it opens =
many possibilities and is charm to work with.

Have a very good week-end all,
Sylvain.=

--Apple-Mail=_02B2668F-7A53-44B3-A6ED-89FD9413FEC5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Le 22 avr. 2016 =C3=A0 13:44, Andrew Baumann &lt;<a =
href=3D"mailto:Andrew.Baumann@microsoft.com" =
class=3D"">Andrew.Baumann@microsoft.com</a>&gt; a =C3=A9crit :<br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">You got further on this than I did. I considered =
a couple of options, of varying complexity/compatibility:</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">0. The status quo: we support -kernel =
(for Linux images) and -bios (e.g. Windows), but otherwise all the =
options that can be set in config.txt are treated as the defaults. For =
example, -bios images are always loaded at 0x8000. Additionally, =
framebuffer parameters can be set directly from the command line (e.g. =
Windows wants -global bcm2835-fb.pixo=3D0).</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">1. More pi-specific =
parameters in the line of the framebuffer parameters above, to control =
things like the image load address, and maybe to enable trustzone boot =
akin to config.txt's kernel-old=3D1.</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">2. Code to parse config.txt and set the =
parameters above.</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">3. Code to emulate the bootloader entirely, =
pulling config.txt and all the relevant boot bits out of an SD image =
(this is what Peter describes above).</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">4. An ARM-based reimplementation of the =
bootloader, running under emulation.</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""></div></blockquote></div><br class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">Having the ARM =
bootloader (called armstub in raspberry pi developers words), the =
config.txt file, and the =C2=AB&nbsp;kernel&nbsp;=C2=BB (whatever it is, =
ELF or raw binary) on a FAT portion of an SD card is convenient for real =
hardware: on a lambda user perspective, you just use your lambda =
computer to burn an image on a SD card (one you don=E2=80=99t use =
anymore with your camera), then insert it in your shiny new raspberry pi =
hardware.</div><div class=3D""><br class=3D""></div><div class=3D"">QEMU =
in my opinion does not target the regular lambda user, and I wouldn=E2=80=99=
t go as far as mimicking the FAT / SD emulation boot process: my =
personal use case for qemu as a developer is =C2=AB&nbsp;kernel&nbsp;=C2=BB=
 development / debugging and my workflow sums up to a simple =
loop:&nbsp;</div><div class=3D""><br class=3D""></div><div class=3D""># =
vi some_kernel_source_code.c &amp;&amp; make &amp;&amp; qemu -kernel =
the_new_kernel_image</div><div class=3D"">Do that 100 times a =
day.</div><div class=3D""><br class=3D""></div><div class=3D"">Having to =
place my kernel in a FAT partition of a mounted disk image in my host OS =
would just complexity my process. I don=E2=80=99t expect my emulator to =
be 100% similar to the real hardware (it will never in the case of the =
Raspberry Pi, as long as the GPU firmware source code is closed). I just =
want to use my emulator to get things done fast (on my host computer =
rather than real hardware) and I want to emulate CPU and code =
(interrupts, etc) as closely as possible, without too much =
effort.</div><div class=3D""><br class=3D""></div><div class=3D"">Having =
said that, I would give the qemu user who wants raspberry pi emulation =
these two functionalities that the raspberry pi firmware =
provides:</div><div class=3D"">1/ ability to use a custom bootloader =
before launching the kernel: option armstub=3Dsomebootloader.bin in =
config.txt (be it u-boot or a custom stub which leaves HYP =
mode)</div><div class=3D"">2/ ability to load your =C2=AB kernel&nbsp;=C2=BB=
 at a specific address: option kernel_address in config.txt</div><div =
class=3D""><br class=3D""></div><div class=3D"">So future =
-kernel-address and -bootloader qemu command line parameters (either =
specific to Raspberry pi or global) is my dream. That way I can play =
fast with whatever bootloader I want, play with HYP mode, and I can use =
whatever loading address I want.&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">By the way, for the Raspberry Pi, the =
address is 0x8000 compared to the default 0x10000 for Arm in qemu, and =
being able to set it would enable to boot (without patching QEMU=E2=80=99s=
 code) NetBSD images (compiled to work at 0x8000) and FreeBSD kernel =
without u-boot (requires the loading address to be a multiple of 2MB). =
Seems to me like basic functionality. I heard your argument Peter =
mentioning the linux boot protocol doesn=E2=80=99t mandate a loading =
address, and I find it is for this specific reason that which should let =
the user choose it. I also heard the =C2=AB&nbsp;use an ELF =C2=BB =
argument but some non-Linux kernels have by default a virtual (and not =
physical) address in their header, so doesn=E2=80=99t work straight out =
of the box.</div><div class=3D""><br class=3D""></div><div class=3D"">Just=
 my 2 cents :-) I however want to thank you all for the quality of the =
ARM emulation and more specifically the Raspberry Pi one, it opens many =
possibilities and is charm to work with.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Have a very good week-end =
all,</div><div class=3D"">Sylvain.</div></body></html>=

--Apple-Mail=_02B2668F-7A53-44B3-A6ED-89FD9413FEC5--
