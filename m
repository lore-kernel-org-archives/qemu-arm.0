Received: by 10.25.0.147 with SMTP id 141csp1401908lfa;
        Mon, 6 Mar 2017 06:36:52 -0800 (PST)
X-Received: by 10.200.51.199 with SMTP id d7mr15432239qtb.94.1488811012429;
        Mon, 06 Mar 2017 06:36:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si15576967qtx.200.2017.03.06.06.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 06:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cktkn-0003l8-Rs
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 09:36:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skyfly0008@gmail.com>) id 1cklya-0003CE-1O
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 01:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skyfly0008@gmail.com>) id 1cklyY-0008IT-Pe
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 01:18:32 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skyfly0008@gmail.com>)
	id 1cklyY-0008IH-KU
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 01:18:30 -0500
Received: by mail-qk0-x231.google.com with SMTP id v125so77140638qkh.2
	for <qemu-arm@nongnu.org>; Sun, 05 Mar 2017 22:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=UuJknf5A7gZ897fRuctkY4FTL0egGCDJ8uV4K2Bossg=;
	b=GG1h2GVpDLsFp9VLqMafJoPHmbTajXjet7xo7hI8qyixvI97gkIxYrT5CT7vjIg1eO
	Y3EFGcujvT0+tbg18qBI2YzJqfkxdBsuILcyclzs3Hep6LlJbmKMND/wV0L7kSMCQQu/
	oxi860r5w01+zcnW9ri/VO8heowMN5mdKWhJ8ewfXOPUz3ormmtVgDxKz5ZNl3MW/5wI
	FTxQDwaeosB+CdI9BpwBQYYtD7tdOT9L2+FbUl9f8aQd2+tseclsbw8r+ciXd0W2MjId
	heiQNV1ii4N87xEn58r0FQdcQtzZeBqgo9jV+oL7zj77pG4cZ9b12KS0dbhYPrZVIjC/
	Hemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UuJknf5A7gZ897fRuctkY4FTL0egGCDJ8uV4K2Bossg=;
	b=cO/l4iYcfw9bg0SC9DQfhKX6y2rNrDEBvWt6jumL2DWfnHi56OcW30PVtV/tnH/Nwn
	Upxhc8uXA0LEPpffwOAzX6fNP9LtCcvnF+TMo9C12WuXoj2XORDiUt6lrsyI3l8fbmdA
	7ryLdW4fNOfwtDDf58R8RPI8+p3NH3l/1MOc2wZzuiF+FTBN45E9pGJO88SICOQvTyQV
	IeOJIM65rB0yGhvNZPw0IUx/B6mMwfeXojVcTS+V8u0viu7xttupwZUg27+hNQHOsylM
	sMPJkGY1zcX74gWOa3lF/jn7J39ePq5FsMIBsEIG7pVvZjQyu6RNo+kD/OScHGaQoixf
	Dc3Q==
X-Gm-Message-State: AMke39nyP4X20hSugfnKerhBHR0HWG5FCvQBnG2xh1nWInkRUStu3jaqA6dhOEU9vD8uno2MYojyOA8WbxEvJw==
X-Received: by 10.200.40.178 with SMTP id i47mr14127631qti.259.1488781108163; 
	Sun, 05 Mar 2017 22:18:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.36.206 with HTTP; Sun, 5 Mar 2017 22:18:27 -0800 (PST)
From: "Yasutaka, T" <skyfly0008@gmail.com>
Date: Mon, 6 Mar 2017 01:18:27 -0500
Message-ID: <CAO=Ss3VPsdseq1a6+5-MgybhRSqrdZOhLtwAd0HWcBgdaSoT-Q@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a113f20ba19bfc4054a09dd5c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
X-Mailman-Approved-At: Mon, 06 Mar 2017 09:36:47 -0500
Subject: [Qemu-arm] "Unable to find CPU definition" Error on aarch64
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
X-TUID: TZu/16rYOxC2

--001a113f20ba19bfc4054a09dd5c
Content-Type: text/plain; charset=UTF-8

Hi QEMU/ARM community,

I'm now trying to run QEMU on my aarch64 machine (Raspberry Pi 3 Model B).
I installed QEMU2.8.0 from source and the following command worked:

qemu-system-aarch64 -machine virt -cpu cortex-a53 -machine type=virt
-nographic -smp 1 -m 256 -kernel aarch64-linux-3.15rc2-buildroot.img
 --append "console=ttyAMA0"


However, when I changed "-cpu cortex-a53" to "-cpu host", it returns
"qemu-system-aarch64: Unable to find CPU definition" error message. My
lscpu says

pi@raspberrypi:~/os/guest1 $ lscpu
Architecture:          aarch64
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
Model:                 4
CPU max MHz:           1200.0000
CPU min MHz:           600.0000
BogoMIPS:              38.40
Flags:                 fp asimd evtstrm crc32

and my /proc/cpuinfo is

pi@raspberrypi:~/os/guest1 $ cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 38.40
Features        : fp asimd evtstrm crc32
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x0
CPU part        : 0xd03
CPU revision    : 4

(RPI3 has 4 cores and processor 1, 2, and 3 have the same stats)

(CPU part 0xd03 means Cortex-A53 which should supports virtualization)
Why did QEMU complains this?

The kernel image is retrieved from
https://www.bennee.com/~alex/blog/2014/05/09/running-linux-in-qemus-aarch64-system-emulation-mode/

Sincerely yours,
Yasutaka Tanaka

--001a113f20ba19bfc4054a09dd5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi QEMU/ARM community,</div><div><br></div><div>I&#39=
;m now trying to run QEMU on my aarch64 machine (Raspberry Pi 3 Model B).</=
div><div>I installed QEMU2.8.0 from source and the following command worked=
:</div><div><br></div><div>qemu-system-aarch64 -machine virt -cpu cortex-a5=
3 -machine type=3Dvirt -nographic -smp 1 -m 256 -kernel aarch64-linux-3.15r=
c2-buildroot.img =C2=A0--append &quot;console=3DttyAMA0&quot;<br></div><div=
><br></div><div><br></div><div>However, when I changed &quot;-cpu cortex-a5=
3&quot; to &quot;-cpu host&quot;, it returns &quot;qemu-system-aarch64: Una=
ble to find CPU definition&quot; error message. My lscpu says</div><div><br=
></div><div><div>pi@raspberrypi:~/os/guest1 $ lscpu</div><div>Architecture:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64</div><div>Byte Order: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Little Endian</div><div>CPU(s): =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04</div><div>On-line CPU(s) lis=
t: =C2=A0 0-3</div><div>Thread(s) per core: =C2=A0 =C2=A01</div><div>Core(s=
) per socket: =C2=A0 =C2=A04</div><div>Socket(s): =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1</div><div>Model: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 4</div><div>CPU max MHz: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1200.0000</div><div>CPU min MHz: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 600=
.0000</div><div>BogoMIPS: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03=
8.40</div><div>Flags: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fp asimd evtstrm crc32</div></div><div><br></div><div>and my /proc/cpui=
nfo is</div><div><br></div><div><div>pi@raspberrypi:~/os/guest1 $ cat /proc=
/cpuinfo</div><div>processor =C2=A0 =C2=A0 =C2=A0 : 0</div><div>BogoMIPS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: 38.40</div><div>Features =C2=A0 =C2=A0 =C2=A0 =
=C2=A0: fp asimd evtstrm crc32</div><div>CPU implementer : 0x41</div><div>C=
PU architecture: 8</div><div>CPU variant =C2=A0 =C2=A0 : 0x0</div><div>CPU =
part =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0xd03</div><div>CPU revision =C2=A0 =C2=
=A0: 4</div></div><div><br></div><div>(RPI3 has 4 cores and processor 1, 2,=
 and 3 have the same stats)</div><div><br></div><div>(CPU part 0xd03 means =
Cortex-A53 which should supports virtualization)=C2=A0</div><div>Why did QE=
MU complains this?</div><div><br></div><div>The kernel image is retrieved f=
rom=C2=A0<a href=3D"https://www.bennee.com/~alex/blog/2014/05/09/running-li=
nux-in-qemus-aarch64-system-emulation-mode/">https://www.bennee.com/~alex/b=
log/2014/05/09/running-linux-in-qemus-aarch64-system-emulation-mode/</a></d=
iv><div><br></div><div>Sincerely yours,</div><div>Yasutaka Tanaka<br></div>=
</div>

--001a113f20ba19bfc4054a09dd5c--
