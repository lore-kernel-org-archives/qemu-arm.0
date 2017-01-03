Received: by 10.25.205.13 with SMTP id d13csp8775985lfg;
        Tue, 3 Jan 2017 03:52:27 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr58421102qka.262.1483444347088;
        Tue, 03 Jan 2017 03:52:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x93si25541553qte.247.2017.01.03.03.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jan 2017 03:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cONdg-0005Iq-GZ
	for alex.bennee@linaro.org; Tue, 03 Jan 2017 06:52:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cONdc-0005IX-I0
	for qemu-arm@nongnu.org; Tue, 03 Jan 2017 06:52:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cONdb-0004g6-AR
	for qemu-arm@nongnu.org; Tue, 03 Jan 2017 06:52:20 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cONdb-0004g0-5h
	for qemu-arm@nongnu.org; Tue, 03 Jan 2017 06:52:19 -0500
Received: by mail-qk0-x243.google.com with SMTP id u25so49540864qki.2
	for <qemu-arm@nongnu.org>; Tue, 03 Jan 2017 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jO/sE3sU0Gbv7HREV2ZMRTnS4r0EBMUhkzvsfM5fFKU=;
	b=eSgaHMaUrvuTGlFIr4paZdmsx1W8eh8OKXR2ZpOGcyOIcs6L+AaPni64p6LGBCfZUe
	qYLCT4tWDzEh36BjinZ/HNKwGglvyPuoQGkSvv1BTX3Qg+6dn/clp1USF51boq7yz7xn
	+ocY+LPcOxdV4R8cnbCTMhBjeGZ2V/nIAHraQ8Ouu4DUlc5ZX68CtcN6+HrOpNEAoDa2
	dChYZXSQakpVGCRq1izlptWBQKqXL6sCgzR44XlWFZzclVdeOau6fw+rvowal0ervHgg
	gcBKZU/STCTSuJpX70ES2KaqEkuAZ3lWyFQoX1QiYSCpj2ghyOTs5lNNFJ6YaNAxIBBS
	VmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jO/sE3sU0Gbv7HREV2ZMRTnS4r0EBMUhkzvsfM5fFKU=;
	b=YEfsW8RzO4LyCJlxMJa2pdhl/cENH7VHdmXXni6ocExhoMDqRjLc2IdgDp0SU2ddxt
	04c2eg0o1lV0e5jN1sEfEAIY/4LuguDsCEGI/eFChWO16mLBJUAZmvZXitsSPdX07r5T
	ekUTJcT4px5oPOooI0ZjJRQPQo8RQibuHh6UhcN1cGokhz44KW+EFMwcvH8L7lhFrtqj
	Ml4/BwL1rJRyYGhCBdi/gQsmvjZE4yG270duVKhI9b9unyiIfJt/XcgtW+Go1MJbYMwf
	r4YxF90Ie9LWge0UclnWLSzRppJAcmEOnQQ52A81eZVv4jShPlfe9f/x0NdLnBCx5MgI
	LTBQ==
X-Gm-Message-State: AIkVDXLmteCeSM8DsJPyH/Yal3jMUkBBBHWmaRzlw6MpZalFHB5+/NJw4kEtPghsvjIZ0ZgwDf6waVzjutg0hg==
X-Received: by 10.55.97.204 with SMTP id v195mr57743784qkb.158.1483444336818; 
	Tue, 03 Jan 2017 03:52:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.139 with HTTP; Tue, 3 Jan 2017 03:52:16 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Tue, 3 Jan 2017 12:52:16 +0100
Message-ID: <CAJy91Cax4FC4dNPnF8j0NCZGVkNUh33VPThm8XC9L8oTQkM3dA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c05c7cabd7fdc05452f4c0b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] bare-metal atmel board dbugging
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
X-TUID: Xg8WrxgXUDi3

--94eb2c05c7cabd7fdc05452f4c0b
Content-Type: text/plain; charset=UTF-8

Hi everyone,

I am emulating the atmel at91sam9261 board in QEMU, and testing and
debugging the emulated hardware by the atmel software package for this
board.

However, I always get this problem. See the info attached below. No matter
how large I set the ram size, it will always "

qemu: fatal: Trying to execute code outside RAM or ROM

" at the last address of the ram size.

Does anyone have any suggestion to solve it?

Best regards,

Jiahuan


 MINGW64 ~/test/basic-rtt-project-at91sam9261-ek/basic-rtt-project/bin



$ ~/test/qemu/build/arm-softmmu/qemu-system-arm -M at91sam9261 -kernel
basic-rtt-project-at91sam9261-ek-at91sam9261-sram.bin -serial stdio
-nographic -s -S


QEMU 2.6.2 monitor - type 'help' for more information


(qemu)


qemu: fatal: Trying to execute code outside RAM or ROM at 0x08000000


R00=00000000 R01=00000000 R02=00000100 R03=00000000


R04=00000000 R05=00000000 R06=00000000 R07=00000000


R08=00000000 R09=00000000 R10=00000000 R11=00000000


R12=00000000 R13=00000000 R14=00000000 R15=08000000


PSR=400001d3 -Z-- A svc32


s00=00000000 s01=00000000 d00=0000000000000000


s02=00000000 s03=00000000 d01=0000000000000000


s04=00000000 s05=00000000 d02=0000000000000000


s06=00000000 s07=00000000 d03=0000000000000000


s08=00000000 s09=00000000 d04=0000000000000000


s10=00000000 s11=00000000 d05=0000000000000000


s12=00000000 s13=00000000 d06=0000000000000000


s14=00000000 s15=00000000 d07=0000000000000000


s16=00000000 s17=00000000 d08=0000000000000000


s18=00000000 s19=00000000 d09=0000000000000000


s20=00000000 s21=00000000 d10=0000000000000000


s22=00000000 s23=00000000 d11=0000000000000000


s24=00000000 s25=00000000 d12=0000000000000000


s26=00000000 s27=00000000 d13=0000000000000000


s28=00000000 s29=00000000 d14=0000000000000000


s30=00000000 s31=00000000 d15=0000000000000000


FPSCR: 00000000


This application has requested the Runtime to terminate it in an unusual
way.


Please contact the application's support team for more information.

--94eb2c05c7cabd7fdc05452f4c0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>I am emulating =
the atmel at91sam9261 board in QEMU, and=C2=A0testing and debugging=C2=A0th=
e emulated hardware by=C2=A0the atmel software package=C2=A0for this board.=
</div><div><br></div><div>However, I=C2=A0always get this problem. See the =
info attached below. No matter how large I set the ram size, it will always=
 &quot;<font size=3D"1"><p>qemu: fatal: Trying to execute code outside RAM =
or ROM </p></font><p><span><span>&quot; at the last address of the ram size=
.</span></span></p><p><span><span>Does anyone have any suggestion to solve =
it?</span></span></p><p><span><span>Best regards,</span></span></p><p><span=
><span>Jiahuan</span></span></p><p><span><span><br></span></span></p><span>=
<span><p><font color=3D"#00bf00" size=3D"1"><font color=3D"#00bf00" size=3D=
"1">=C2=A0</font></font><font color=3D"#bf00bf" size=3D"1"><font color=3D"#=
bf00bf" size=3D"1">MINGW64</font></font><font size=3D"1"> </font><font colo=
r=3D"#bfbf00" size=3D"1"><font color=3D"#bfbf00" size=3D"1">~/test/basic-rt=
t-project-at91sam9261-ek/basic-rtt-project/bin</font></font></p><p><font co=
lor=3D"#bfbf00" size=3D"1"><font color=3D"#bfbf00" size=3D"1"><br></font></=
font></p><font size=3D"1"><p><br></p><p>$ ~/test/qemu/build/arm-softmmu/qem=
u-system-arm -M at91sam9261 -kernel basic-rtt-project-at91sam9261-ek-at91sa=
m9261-sram.bin -serial stdio -nographic -s -S</p><p>
<br></p><p>QEMU 2.6.2 monitor - type &#39;help&#39; for more information</p=
><p>
<br></p><p>(qemu) </p><p>
<br></p><p>qemu: fatal: Trying to execute code outside RAM or ROM at 0x0800=
0000</p><p>

<br></p><p>R00=3D00000000 R01=3D00000000 R02=3D00000100 R03=3D00000000</p><=
p>
<br></p><p>R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000</p><=
p>
<br></p><p>R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000</p><=
p>
<br></p><p>R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D08000000</p><=
p>
<br></p><p>PSR=3D400001d3 -Z-- A svc32</p><p>
<br></p><p>s00=3D00000000 s01=3D00000000 d00=3D0000000000000000</p><p>
<br></p><p>s02=3D00000000 s03=3D00000000 d01=3D0000000000000000</p><p>
<br></p><p>s04=3D00000000 s05=3D00000000 d02=3D0000000000000000</p><p>
<br></p><p>s06=3D00000000 s07=3D00000000 d03=3D0000000000000000</p><p>
<br></p><p>s08=3D00000000 s09=3D00000000 d04=3D0000000000000000</p><p>
<br></p><p>s10=3D00000000 s11=3D00000000 d05=3D0000000000000000</p><p>
<br></p><p>s12=3D00000000 s13=3D00000000 d06=3D0000000000000000</p><p>
<br></p><p>s14=3D00000000 s15=3D00000000 d07=3D0000000000000000</p><p>
<br></p><p>s16=3D00000000 s17=3D00000000 d08=3D0000000000000000</p><p>
<br></p><p>s18=3D00000000 s19=3D00000000 d09=3D0000000000000000</p><p>
<br></p><p>s20=3D00000000 s21=3D00000000 d10=3D0000000000000000</p><p>
<br></p><p>s22=3D00000000 s23=3D00000000 d11=3D0000000000000000</p><p>
<br></p><p>s24=3D00000000 s25=3D00000000 d12=3D0000000000000000</p><p>
<br></p><p>s26=3D00000000 s27=3D00000000 d13=3D0000000000000000</p><p>
<br></p><p>s28=3D00000000 s29=3D00000000 d14=3D0000000000000000</p><p>
<br></p><p>s30=3D00000000 s31=3D00000000 d15=3D0000000000000000</p><p>
<br></p><p>FPSCR: 00000000</p><p>

<br></p><p>This application has requested the Runtime to terminate it in an=
 unusual way.</p><p>
<br></p><p>Please contact the application&#39;s support team for more infor=
mation.</p></font><p><br></p></span><p><span><span><br></span></span></p></=
span><p><br></p><p><span><span><br></span></span></p></div></div>

--94eb2c05c7cabd7fdc05452f4c0b--
