Received: by 10.25.0.147 with SMTP id 141csp761291lfa;
        Sat, 4 Mar 2017 11:10:32 -0800 (PST)
X-Received: by 10.237.63.7 with SMTP id p7mr8502052qtf.249.1488654632247;
        Sat, 04 Mar 2017 11:10:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si12101583qtv.302.2017.03.04.11.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Mar 2017 11:10:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckF4X-00044W-IZ
	for alex.bennee@linaro.org; Sat, 04 Mar 2017 14:10:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1ckF4R-00044D-TG
	for qemu-arm@nongnu.org; Sat, 04 Mar 2017 14:10:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1ckF4Q-0003X2-GD
	for qemu-arm@nongnu.org; Sat, 04 Mar 2017 14:10:23 -0500
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:33721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <viniciusfre@gmail.com>)
	id 1ckF4Q-0003Wn-BL
	for qemu-arm@nongnu.org; Sat, 04 Mar 2017 14:10:22 -0500
Received: by mail-ua0-x22b.google.com with SMTP id u30so6742365uau.0
	for <qemu-arm@nongnu.org>; Sat, 04 Mar 2017 11:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=RFsZTnoM/Mbbj1+2KT7jY9xqwB9YKnSVjUEHzbCMc64=;
	b=Sfw2Hi+Pcniah3Hr0ZENBtB/hymF4vTUlJIUhZbo/k/lX5KzxlDVNpTqXPNhAZlio6
	asH9h8SG1dL/iPOJkAq4QP/UA9aZlUgehjUAU4p29lOpNXg9iQASxM8abscCM9BxsqMG
	zMzJVoy/UApfMeLhrwRTpE1Ahqewl3VvTODfAKSdXybEbyLpZnvy066ftnywKQYmfCJs
	8Qkp75vUAL5LUKUM4vJ/QXF69dT6KagiBQeqNzxtQDjkhELfJ1jP/ITfTJmoPXkZOBBo
	haYvZ3S85SzNfX/pUs/IgwbyKybZA/N1ir0B6gejcM+36fXqdVfedHidSXq5iOOrnChP
	N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RFsZTnoM/Mbbj1+2KT7jY9xqwB9YKnSVjUEHzbCMc64=;
	b=WPgBr6FC4/BfQ9vV7+pK3RHTIjcA4EucpKhlzjop+m34eFQLoZ0zYg5/8j7V5aM9vc
	0gkFybJgHPgsVMqo/6Mz878x5TWir2wHldZgzQiWJjgILaxC6W6JRjCsQNi4lPwtk5kz
	QATAtJ1p3rKJQEIoB4DpwFThDMRD5cdssmy0C2kl5+N+IjTJIKlhvBtk8qEdemAADqB5
	4Cs4/MyzSieUaigNC1zfEi0Z9UIvYxhKUyUOYRAko38fg8p/XZSoiQdZBei1FguGuJef
	q19Id+ZdwSY0IEWEb8P+7GypMEVdsT1pi4An9ZOmh563uEFUIcsXAooTsqJHHd7Vjmf6
	0OVQ==
X-Gm-Message-State: AMke39nffWoLGNw1aEsDjbRdksfhJncuhPLgb1ygwHBA5obWBv6cV/lbV3dGJtYL+Vb4n3gkRvbLSn0afTrKBA==
X-Received: by 10.176.85.26 with SMTP id t26mr3111904uaa.7.1488654619857; Sat,
	04 Mar 2017 11:10:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.0.201 with HTTP; Sat, 4 Mar 2017 11:10:19 -0800 (PST)
From: Vinicius Maciel <viniciusfre@gmail.com>
Date: Sat, 4 Mar 2017 16:10:19 -0300
Message-ID: <CAEz5UgHOXCSMmfymSuV5XYdyWyc_Ozp=24xv6X_wg2FMCMJFZg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=f403045dd850cf5b7e0549ec691f
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: [Qemu-arm]  [Bug] Raspberry PI 2 get stuck in boot
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OkeP2ZJSkFvP

--f403045dd850cf5b7e0549ec691f
Content-Type: text/plain; charset=UTF-8

Hi,

The linux kernel 4.4.34-v7+, version , used
in 2017-01-11-raspbian-jessie-lite.img get stuck in boot.

[   31.572869] INFO: rcu_sched detected stalls on CPUs/tasks:

[   31.576423] 1-O..: (13 GPs behind) idle=001/140000000000000/0
softirq=0/0 fqs=0

[   31.578076] 2-O..: (13 GPs behind) idle=001/140000000000000/0
softirq=0/0 fqs=0

[   31.579390] 3-O..: (13 GPs behind) idle=001/140000000000000/0
softirq=0/0 fqs=0

[   31.580762] (detected by 0, t=2102 jiffies, g=-287, c=-288, q=1)

[   31.583707] Task dump for CPU 1:

[   31.585268] swapper/1       R running      0     0      1 0x00000000

[   31.591144] Task dump for CPU 2:

[   31.591805] swapper/2       R running      0     0      1 0x00000000

[   31.593095] Task dump for CPU 3:

[   31.593741] swapper/3       R running      0     0      1 0x00000000
[   31.596279] rcu_sched kthread starved for 2102 jiffies! g4294967009
c4294967008 f0x0 s3 ->state=0x0

It happens in target-arm.for-upstream from Peter' repository and
http://git.qemu-project.org/qemu.git/ branch master as well.

Best regards,
Vinicius

--f403045dd850cf5b7e0549ec691f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>The linux kernel 4.4.34-v7+, versio=
n , used in=C2=A02017-01-11-raspbian-jessie-lite.img get stuck in boot.</di=
v><div><br></div><div><span id=3D"gmail-docs-internal-guid-b3f49d99-9a9e-38=
98-39d5-d24d57fadec5"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0);bac=
kground-color:transparent;vertical-align:baseline;white-space:pre-wrap">[ =
=C2=A0=C2=A031.572869] INFO: rcu_sched detected stalls on CPUs/tasks:</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:tra=
nsparent;vertical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.576=
423] </span><span style=3D"font-family:arial;color:rgb(0,0,0);background-co=
lor:transparent;vertical-align:baseline;white-space:pre-wrap"><span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span></span><span st=
yle=3D"font-family:arial;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap">1-O..: (13 GPs behind) idle=3D001=
/140000000000000/0 softirq=3D0/0 fqs=3D0 </span></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-fam=
ily:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:base=
line;white-space:pre-wrap">[ =C2=A0=C2=A031.578076] </span><span style=3D"f=
ont-family:arial;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap"><span class=3D"gmail-Apple-tab-span" styl=
e=3D"white-space:pre">	</span></span><span style=3D"font-family:arial;color=
:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spac=
e:pre-wrap">2-O..: (13 GPs behind) idle=3D001/140000000000000/0 softirq=3D0=
/0 fqs=3D0 </span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0);bac=
kground-color:transparent;vertical-align:baseline;white-space:pre-wrap">[ =
=C2=A0=C2=A031.579390] </span><span style=3D"font-family:arial;color:rgb(0,=
0,0);background-color:transparent;vertical-align:baseline;white-space:pre-w=
rap"><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span=
></span><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:=
transparent;vertical-align:baseline;white-space:pre-wrap">3-O..: (13 GPs be=
hind) idle=3D001/140000000000000/0 softirq=3D0/0 fqs=3D0 </span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-family:arial;color:rgb(0,0,0);background-color:transparent;ve=
rtical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.580762] </span=
><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:transpa=
rent;vertical-align:baseline;white-space:pre-wrap"><span class=3D"gmail-App=
le-tab-span" style=3D"white-space:pre">	</span></span><span style=3D"font-f=
amily:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:ba=
seline;white-space:pre-wrap">(detected by 0, t=3D2102 jiffies, g=3D-287, c=
=3D-288, q=3D1)</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>[ =C2=A0=C2=A031.583707] Task dump for CPU 1:</span></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-family:arial;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.585268] swapper/1 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R running =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=
=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 0x00000000</span></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:transpa=
rent;vertical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.591144]=
 Task dump for CPU 2:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">[ =C2=A0=C2=A031.591805] swapper/2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0R running =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A00 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A01 0x00000000</span></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-famil=
y:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">[ =C2=A0=C2=A031.593095] Task dump for CPU 3:</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:tr=
ansparent;vertical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.59=
3741] swapper/3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R running =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A01 0x00000000</span></p><span style=3D"font-family:arial;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>[ =C2=A0=C2=A031.596279] rcu_sched kthread starved for 2102 jiffies! g4294=
967009 c4294967008 f0x0 s3 -&gt;state=3D0x0</span></span><br></div><div><sp=
an><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:trans=
parent;vertical-align:baseline;white-space:pre-wrap"><br></span></span></di=
v><div><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap">It happens in </sp=
an><font color=3D"#000000" face=3D"arial"><span style=3D"white-space:pre-wr=
ap">target-arm.for-upstream from Peter&#39; repository and <a href=3D"http:=
//git.qemu-project.org/qemu.git/">http://git.qemu-project.org/qemu.git/</a>=
 branch master as well.</span></font></div><div><font color=3D"#000000" fac=
e=3D"arial"><span style=3D"white-space:pre-wrap"><br></span></font></div><d=
iv><font color=3D"#000000" face=3D"arial"><span style=3D"white-space:pre-wr=
ap">Best regards,</span></font></div><div><font color=3D"#000000" face=3D"a=
rial"><span style=3D"white-space:pre-wrap">Vinicius</span></font></div></di=
v>

--f403045dd850cf5b7e0549ec691f--
