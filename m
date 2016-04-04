Received: by 10.25.208.211 with SMTP id h202csp1138146lfg;
        Mon, 4 Apr 2016 06:29:40 -0700 (PDT)
X-Received: by 10.140.88.202 with SMTP id t68mr13241382qgd.86.1459776580838;
        Mon, 04 Apr 2016 06:29:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si22204456qhc.78.2016.04.04.06.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 06:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an4ZY-0005Al-Ao
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 09:29:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1amx5s-0002zz-V0
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 01:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1amx5r-0002Gx-LI
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 01:30:32 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:36782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1amx5r-0002Gt-E0
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 01:30:31 -0400
Received: by mail-vk0-x241.google.com with SMTP id x190so5163570vka.3
	for <qemu-arm@nongnu.org>; Sun, 03 Apr 2016 22:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=XO9a3VfNZ1ne7bAt+I49H07pNNtfrtjZHM1dWqQ8Xhc=;
	b=J/p7UXrmtNaVDaToqXhRJd7/GWhsEBEhT1nYVoOzBofa8e0la3fs+UccNJMGAl4n7i
	j+svryZrdhVmYU1cwtpUL9RSRCdU8x9ZPUQfo7tItuLzx0lnejsB58bARczZgXv7B1/u
	NSdcFgc8MAH4/Memiy8RgEcXSp8vSNzNmiq8hRV+lF6Dbw4IOSJttzgmugr7FNo527ve
	QIMDeCDh+iEuddfojg56plIW+/5QOYcncYrrz+CcFtxkLfEqBabE4+dhDc7rxno52Z0/
	GE2o3BrPbX/+cGAz4dTlKUCL2nceltlntzT2KEhm7PTyWFYwSJT7m/YCp9jpyAqrtCGI
	fa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=XO9a3VfNZ1ne7bAt+I49H07pNNtfrtjZHM1dWqQ8Xhc=;
	b=UDVmu4I4IYX6dbiVMX51d6vg0LbhAh1wLodCdhuIa4XzbcO967TsrMub8aYgtjVijv
	iMg9K914eUL2/DkXcVBtkTB9orjT9f2W1E21VlSgyPpczy8ANmT58DTvGsOl8OkpOhNt
	en48muS7x70Y5q2ek1/8XuJVSIsm/PGxKFkHcJMskqqx2mGg5wafOcT2pHMOyUF+m9gC
	Mef9mIjNKOumlUh+XNZo3WDnWkqXkC2QpX2mZchbMv77hLZLuHKzbS83EoaFuzkblVvS
	BNm2I7WMxWNN2Ut3QWcj9aPU+AEaBB8ITyg/rMp79YBZ9wjU8ALWIqQtjJaMFV52v8tF
	ktTQ==
X-Gm-Message-State: AD7BkJIGFbbNE7npIPErO78SUZOtuIcf+DVUG1T0FFq3TTTenV8LvyiCcLtkPFsXWnQJJWZ4FObWmvhtUSsZTQ==
MIME-Version: 1.0
X-Received: by 10.176.2.56 with SMTP id 53mr8703872uas.101.1459747830462; Sun,
	03 Apr 2016 22:30:30 -0700 (PDT)
Received: by 10.103.13.7 with HTTP; Sun, 3 Apr 2016 22:30:30 -0700 (PDT)
Date: Mon, 4 Apr 2016 11:00:30 +0530
Message-ID: <CAOw6FiiPvuAx8=+DOptEFcnk4otm7M=eVxNB0VXfTihfQf1KzA@mail.gmail.com>
From: dharmik thakkar <dharmikthakkar16@gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a113d1986e57f09052fa206c6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::241
X-Mailman-Approved-At: Mon, 04 Apr 2016 09:29:37 -0400
Subject: [Qemu-arm] Unable to run QEMU with ubuntu ARM image on mac.
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
X-TUID: FWftRp1gLW8a

--001a113d1986e57f09052fa206c6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to run ubuntu for arm using qemu. I have tried using different
images for ubuntu but have ended up with same error =E2=80=98Trying to exec=
ute code
outside RAM or ROM at 0x08000000=E2=80=99.

Below are the steps I have followed to run ubuntu on qemu -


1. qemu-img create -f qcow2 linuxarm.qcow2 10G.

2. qemu-system-arm -hda linuxarm.qcow2 -cdrom
~/Downloads/2015-04-06-ubuntu-trusty.zip -boot d -m 512 -M virt

I have also tried using different images from
http://cdimage.ubuntu.com/ubuntu-core/releases/14.04/release/.


I am seeing the following error -

*qemu: fatal: Trying to execute code outside RAM or ROM at 0x08000000*


*R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000*

*R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000*

*R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000*

*R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D08000000*

*PSR=3D400001d3 -Z-- A svc32*

*s00=3D00000000 s01=3D00000000 d00=3D0000000000000000*

*s02=3D00000000 s03=3D00000000 d01=3D0000000000000000*

*s04=3D00000000 s05=3D00000000 d02=3D0000000000000000*

*s06=3D00000000 s07=3D00000000 d03=3D0000000000000000*

*s08=3D00000000 s09=3D00000000 d04=3D0000000000000000*

*s10=3D00000000 s11=3D00000000 d05=3D0000000000000000*

*s12=3D00000000 s13=3D00000000 d06=3D0000000000000000*

*s14=3D00000000 s15=3D00000000 d07=3D0000000000000000*

*s16=3D00000000 s17=3D00000000 d08=3D0000000000000000*

*s18=3D00000000 s19=3D00000000 d09=3D0000000000000000*

*s20=3D00000000 s21=3D00000000 d10=3D0000000000000000*

*s22=3D00000000 s23=3D00000000 d11=3D0000000000000000*

*s24=3D00000000 s25=3D00000000 d12=3D0000000000000000*

*s26=3D00000000 s27=3D00000000 d13=3D0000000000000000*

*s28=3D00000000 s29=3D00000000 d14=3D0000000000000000*

*s30=3D00000000 s31=3D00000000 d15=3D0000000000000000*

*s32=3D00000000 s33=3D00000000 d16=3D0000000000000000*

*s34=3D00000000 s35=3D00000000 d17=3D0000000000000000*

*s36=3D00000000 s37=3D00000000 d18=3D0000000000000000*

*s38=3D00000000 s39=3D00000000 d19=3D0000000000000000*

*s40=3D00000000 s41=3D00000000 d20=3D0000000000000000*

*s42=3D00000000 s43=3D00000000 d21=3D0000000000000000*

*s44=3D00000000 s45=3D00000000 d22=3D0000000000000000*

*s46=3D00000000 s47=3D00000000 d23=3D0000000000000000*

*s48=3D00000000 s49=3D00000000 d24=3D0000000000000000*

*s50=3D00000000 s51=3D00000000 d25=3D0000000000000000*

*s52=3D00000000 s53=3D00000000 d26=3D0000000000000000*

*s54=3D00000000 s55=3D00000000 d27=3D0000000000000000*

*s56=3D00000000 s57=3D00000000 d28=3D0000000000000000*

*s58=3D00000000 s59=3D00000000 d29=3D0000000000000000*

*s60=3D00000000 s61=3D00000000 d30=3D0000000000000000*

*s62=3D00000000 s63=3D00000000 d31=3D0000000000000000*

*FPSCR: 00000000*

*Abort trap: 6*


I am using the following qemu version -

*qemu-system-arm --version*

*QEMU emulator version 2.5.0, Copyright (c) 2003-2008 Fabrice Bellard*


I tried using the uboot method -

*qemu-system-arm -hda linuxarm1.qcow2 -kernel uImage -initrd uInitrd -dtb
apm-mustang.dtb -m 512 -M virt*


Please help me with the issue and point out if I am missing something.


Regards

Dharmik

--001a113d1986e57f09052fa206c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">







<p class=3D""><span class=3D"">Hi,</span></p>
<p class=3D""><span class=3D"">I am trying to run ubuntu for arm using qemu=
. I have tried using different images for ubuntu but have ended up with sam=
e error =E2=80=98Trying to execute code outside RAM or ROM at 0x08000000=E2=
=80=99.</span></p>
<p class=3D""><span class=3D"">Below are the steps I have followed to run u=
buntu on qemu -=C2=A0</span></p>
<p class=3D""><span class=3D""></span><br></p>
<p class=3D""><span class=3D"">1.=C2=A0</span><span class=3D"">qemu-img cre=
ate -f qcow2 linuxarm.qcow2 10G.</span></p>
<p class=3D""><span class=3D"">2.=C2=A0qemu-system-arm -hda linuxarm.qcow2 =
-cdrom ~/Downloads/2015-04-06-ubuntu-trusty.zip -boot d -m 512 -M virt</spa=
n></p>
<p class=3D""><span class=3D"">I have also tried using different images fro=
m=C2=A0<a href=3D"http://cdimage.ubuntu.com/ubuntu-core/releases/14.04/rele=
ase/"><span class=3D"">http://cdimage.ubuntu.com/ubuntu-core/releases/14.04=
/release/</span></a></span><span class=3D"">.</span></p>
<p class=3D""><span class=3D""></span><br></p>
<p class=3D""><span class=3D"">I am seeing the following error -=C2=A0</spa=
n></p>
<p class=3D""><span class=3D""><b>qemu: fatal: Trying to execute code outsi=
de RAM or ROM at 0x08000000</b></span></p>
<p class=3D""><span class=3D""><b></b></span><br></p>
<p class=3D""><span class=3D""><b>R00=3D00000000 R01=3D00000000 R02=3D00000=
000 R03=3D00000000</b></span></p>
<p class=3D""><span class=3D""><b>R04=3D00000000 R05=3D00000000 R06=3D00000=
000 R07=3D00000000</b></span></p>
<p class=3D""><span class=3D""><b>R08=3D00000000 R09=3D00000000 R10=3D00000=
000 R11=3D00000000</b></span></p>
<p class=3D""><span class=3D""><b>R12=3D00000000 R13=3D00000000 R14=3D00000=
000 R15=3D08000000</b></span></p>
<p class=3D""><span class=3D""><b>PSR=3D400001d3 -Z-- A svc32</b></span></p=
>
<p class=3D""><span class=3D""><b>s00=3D00000000 s01=3D00000000 d00=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s02=3D00000000 s03=3D00000000 d01=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s04=3D00000000 s05=3D00000000 d02=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s06=3D00000000 s07=3D00000000 d03=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s08=3D00000000 s09=3D00000000 d04=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s10=3D00000000 s11=3D00000000 d05=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s12=3D00000000 s13=3D00000000 d06=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s14=3D00000000 s15=3D00000000 d07=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s16=3D00000000 s17=3D00000000 d08=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s18=3D00000000 s19=3D00000000 d09=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s20=3D00000000 s21=3D00000000 d10=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s22=3D00000000 s23=3D00000000 d11=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s24=3D00000000 s25=3D00000000 d12=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s26=3D00000000 s27=3D00000000 d13=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s28=3D00000000 s29=3D00000000 d14=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s30=3D00000000 s31=3D00000000 d15=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s32=3D00000000 s33=3D00000000 d16=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s34=3D00000000 s35=3D00000000 d17=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s36=3D00000000 s37=3D00000000 d18=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s38=3D00000000 s39=3D00000000 d19=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s40=3D00000000 s41=3D00000000 d20=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s42=3D00000000 s43=3D00000000 d21=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s44=3D00000000 s45=3D00000000 d22=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s46=3D00000000 s47=3D00000000 d23=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s48=3D00000000 s49=3D00000000 d24=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s50=3D00000000 s51=3D00000000 d25=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s52=3D00000000 s53=3D00000000 d26=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s54=3D00000000 s55=3D00000000 d27=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s56=3D00000000 s57=3D00000000 d28=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s58=3D00000000 s59=3D00000000 d29=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s60=3D00000000 s61=3D00000000 d30=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>s62=3D00000000 s63=3D00000000 d31=3D00000=
00000000000</b></span></p>
<p class=3D""><span class=3D""><b>FPSCR: 00000000</b></span></p>
<p class=3D""><span class=3D""><b>Abort trap: 6</b></span></p>
<p class=3D""><span class=3D""></span><br></p>
<p class=3D""><span class=3D"">I am using the following qemu version -=C2=
=A0</span></p>
<p class=3D""><span class=3D""><b>qemu-system-arm --version</b></span></p>
<p class=3D""><span class=3D""><b>QEMU emulator version 2.5.0, Copyright (c=
) 2003-2008 Fabrice Bellard</b></span></p>
<p class=3D""><span class=3D""><b></b></span><br></p>
<p class=3D""><span class=3D"">I tried using the uboot method -<b>=C2=A0</b=
></span></p>
<p class=3D""><span class=3D""><b>qemu-system-arm -hda linuxarm1.qcow2 -ker=
nel uImage -initrd uInitrd -dtb apm-mustang.dtb -m 512 -M virt</b></span></=
p>
<p class=3D""><span class=3D""><b></b></span><br></p>
<p class=3D""><span class=3D"">Please help me with the issue and point out =
if I am missing something.=C2=A0</span></p>
<p class=3D""><span class=3D""></span><br></p>
<p class=3D""><span class=3D"">Regards</span></p>
<p class=3D""><span class=3D"">Dharmik</span></p></div>

--001a113d1986e57f09052fa206c6--
