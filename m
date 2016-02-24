Received: by 10.25.208.211 with SMTP id h202csp2375094lfg;
        Wed, 24 Feb 2016 09:36:35 -0800 (PST)
X-Received: by 10.140.81.51 with SMTP id e48mr9751151qgd.27.1456335394240;
        Wed, 24 Feb 2016 09:36:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si3667910qge.108.2016.02.24.09.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 09:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYdMX-0001Cw-Kz
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 12:36:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>) id 1aYbYC-0000iS-Mj
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 10:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>) id 1aYbY8-0008Jk-73
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 10:40:28 -0500
Received: from tritech.se ([46.59.120.190]:61086 helo=nic.tritech.se)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>) id 1aYbY7-0008IR-Sm
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 10:40:24 -0500
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by nic.tritech.se (8.14.4/8.14.4/Debian-4) with ESMTP id u1OFeF7f007532
	for <qemu-arm@nongnu.org>; Wed, 24 Feb 2016 16:40:15 +0100
Received: from POST.tritech.se ([10.75.60.100]) by post ([10.75.60.100]) with
	mapi id 14.03.0279.002; Wed, 24 Feb 2016 16:40:09 +0100
From: Mats Malmberg <mats.malmberg@tritech.se>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: help on how to emulate rasbperry pi 2
Thread-Index: AdFvD5ywZQzpz/W/SvS9NRf/arflfA==
Date: Wed, 24 Feb 2016 15:40:08 +0000
Message-ID: <605392182193B84A99A143D9DA347B52FB8AA7@post>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.220.60.189]
Content-Type: multipart/related;
	boundary="_004_605392182193B84A99A143D9DA347B52FB8AA7post_";
	type="multipart/alternative"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 46.59.120.190
X-Mailman-Approved-At: Wed, 24 Feb 2016 12:36:31 -0500
Subject: [Qemu-arm] help on how to emulate rasbperry pi 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ulohVAqEh/m/

--_004_605392182193B84A99A143D9DA347B52FB8AA7post_
Content-Type: multipart/alternative;
	boundary="_000_605392182193B84A99A143D9DA347B52FB8AA7post_"

--_000_605392182193B84A99A143D9DA347B52FB8AA7post_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all!

TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it with or=
dinary rpi distros? If not, what is the best way to emulate raspberry pi 2 =
via Qemu?

Host 'uname -a' output:
Linux user-Precision-M4700 3.19.0-49-generic #55~14.04.1-Ubuntu SMP Fri Jan=
 22 11:24:31 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

Qemu version (via apt-get) 2.5.50



I have been trying lately to get an emulation going with the raspi2 machine=
. I admit that this is my first encounter with trying to use qemu, so perha=
ps some of my attempts have been naive in their approach. Still, I've spent=
 a lot of time googling guides, qemu user documentation, blog posts, git re=
positories etc, but with no success. Now I'm all out of ideas...

I've tried more ways than suitable to describe here, but in short I typical=
ly:
1. take a official linux distro for raspberry pi (alpine, raspbian-jessie, =
Hypriot etc) (all of them verified to work on actual target)
2. find a (what I think is) a compatible kernel, either by copying from dis=
tro's rootfs boot/ directory or by building a qemu kernel from source (http=
s://github.com/dhruvvyas90/qemu-rpi-kernel)
3. try and start the emulation with
qemu-system-arm -kernel kernel_file -M raspi2 -hda linux_image_file.img

at this point, the terminal says "VNC server running on '127.0.0.1;5900'
4. using vinagre client i connect to the given address, but it only gives m=
e a compat_monitor0 console

Thus I wonder, is the raspi2 machine a feature that is ready to use?
If so, where do I fail in my attempts? If not, what is a recommended altern=
ative?

Any help or pointers on how to be able to emulate my target (raspberry pi 2=
) would be very appreciated.


Best Regards
Mats

[cid:tritech-logod35d90]

Mats Malmberg

mats.malmberg@tritech.se
+46 733 35 21 76

www.tritech.se<http://www.tritech.se>
+46 8 410 120 00
J=E4rnv=E4gsgatan 10
PO Box 1094, SE-172 22 Sundbyberg, Sweden


--_000_605392182193B84A99A143D9DA347B52FB8AA7post_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">=0A=
<!--=0A=
p=0A=
	{margin-top:0;=0A=
	margin-bottom:0}=0A=
-->=0A=
P {margin-top:0;margin-bottom:0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">Hello all!<br>
<br>
TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it with or=
dinary rpi distros? If not, what is the best way to emulate raspberry pi 2 =
via Qemu?<br>
<br>
Host 'uname -a' output: <br>
Linux user-Precision-M4700 3.19.0-49-generic #55~14.04.1-Ubuntu SMP Fri Jan=
 22 11:24:31 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux<br>
<br>
Qemu version (via apt-get) 2.5.50<br>
<br>
<br>
<br>
I have been trying lately to get an emulation going with the raspi2 machine=
. I admit that this is my first encounter with trying to use qemu, so perha=
ps some of my attempts have been naive in their approach. Still, I've spent=
 a lot of time googling guides,
 qemu user documentation, blog posts, git repositories etc, but with no suc=
cess. Now I'm all out of ideas...<br>
<br>
I've tried more ways than suitable to describe here, but in short I typical=
ly:<br>
1. take a official linux distro for raspberry pi (alpine, raspbian-jessie, =
Hypriot etc) (all of them verified to work on actual target)<br>
2. find a (what I think is) a compatible kernel, either by copying from dis=
tro's rootfs boot/ directory or by building a qemu kernel from source (http=
s://github.com/dhruvvyas90/qemu-rpi-kernel)<br>
3. try and start the emulation with <br>
qemu-system-arm -kernel kernel_file -M raspi2 -hda linux_image_file.img <br=
>
<br>
at this point, the terminal says &quot;VNC server running on '127.0.0.1;590=
0'<br>
4. using vinagre client i connect to the given address, but it only gives m=
e a compat_monitor0 console<br>
<br>
Thus I wonder, is the raspi2 machine a feature that is ready to use?<br>
If so, where do I fail in my attempts? If not, what is a recommended altern=
ative?<br>
<br>
Any help or pointers on how to be able to emulate my target (raspberry pi 2=
) would be very appreciated.<br>
<br>
<br>
Best Regards<br>
Mats<br>
</div>
</div>
<div class=3D"WordSection1"><br>
</div>
<div class=3D"WordSection1"><img border=3D"0" hspace=3D"0" align=3D"top" sr=
c=3D"cid:tritech-logod35d90" &gt;<BR=3D"">
</div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><b><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Aria=
l','sans-serif'; COLOR: black"></span></b>&nbsp;</p>
<p class=3D"MsoNormal"><b><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Aria=
l','sans-serif'; COLOR: black">Mats Malmberg</span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Aria=
l','sans-serif'; COLOR: black"></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Aria=
l','sans-serif'"></span></b><br>
</p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: #33a7d7"><font color=3D"#4bacc6">mats.malmberg@tritech=
.se</font></span></p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: black">&#43;46 733 35 21 76</span></p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'"></span><br>
</p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: #33a7d7"><a href=3D"http://www.tritech.se"><font color=
=3D"#4bacc6">www.tritech.se</font></a></span></p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: black">&#43;46 8 410 120 00</span></p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: black">J=E4rnv=E4gsgatan 10</span></p>
<p class=3D"MsoNormal"><span style=3D"FONT-SIZE: 9pt; FONT-FAMILY: 'Arial',=
'sans-serif'; COLOR: black">PO Box 1094, SE-172 22 Sundbyberg, Sweden</span=
></p>
</div>
<br>
</body>
</html>

--_000_605392182193B84A99A143D9DA347B52FB8AA7post_--

--_004_605392182193B84A99A143D9DA347B52FB8AA7post_
Content-Type: image/jpeg; name="tritech-logod35d90"
Content-Description: tritech-logod35d90
Content-Disposition: inline; filename="tritech-logod35d90"; size=1530;
	creation-date="Wed, 24 Feb 2016 15:40:10 GMT";
	modification-date="Wed, 24 Feb 2016 15:40:10 GMT"
Content-ID: <tritech-logod35d90>
Content-Transfer-Encoding: base64

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

--_004_605392182193B84A99A143D9DA347B52FB8AA7post_--
