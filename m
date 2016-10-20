Received: by 10.80.166.35 with SMTP id d32csp1019834edc;
        Thu, 20 Oct 2016 13:18:12 -0700 (PDT)
X-Received: by 10.200.52.151 with SMTP id w23mr2327526qtb.115.1476994692026;
        Thu, 20 Oct 2016 13:18:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si12805284qkd.184.2016.10.20.13.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 13:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ufrgs.br
Received: from localhost ([::1]:56939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxJn1-0002Wg-9f
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 16:18:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cristiano.matte@inf.ufrgs.br>) id 1bxIzK-0002D4-Cg
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 15:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cristiano.matte@inf.ufrgs.br>) id 1bxIzH-0003iR-7h
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 15:26:50 -0400
Received: from smtp.inf.ufrgs.br ([143.54.11.23]:38699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cristiano.matte@inf.ufrgs.br>)
	id 1bxIzG-0003hM-VG; Thu, 20 Oct 2016 15:26:47 -0400
Received: from webmail.inf.ufrgs.br (webmail.inf.ufrgs.br [143.54.11.45])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 5AF4A120D61;
	Thu, 20 Oct 2016 17:26:39 -0200 (BRST)
Received: from [200.142.189.2] by webmail.inf.ufrgs.br
	with HTTP (HTTP/1.1 POST); Thu, 20 Oct 2016 17:26:39 -0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 20 Oct 2016 17:26:39 -0200
From: Cristiano Carlos Matte <cristiano.matte@inf.ufrgs.br>
To: qemu-arm@nongnu.org, qemu-discuss@nongnu.org
Message-ID: <eb7adc69121743797315d5cd65879c27@inf.ufrgs.br>
X-Sender: cristiano.matte@inf.ufrgs.br
User-Agent: Roundcube Webmail/0.9.5
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 143.54.11.23
X-Mailman-Approved-At: Thu, 20 Oct 2016 16:18:04 -0400
Subject: [Qemu-arm] Problem using qemu on an ARM environment
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
X-TUID: kUouhprfZVax

Hi everyone,

I have an ARM environment with the Linux Kernel 3.19, Ubuntu 12.04 filesy=
stem=20
and Xen 4.4 for ARM. This environment is running on a Cubietruck. My inte=
nt=20
is to run virtual machines using Xen, which relies on qemu to emulate dis=
ks.

I can successfully instantiate virtual machines if I use a 'phy' disk in =
Xen,=20
as it does not use qemu for emulation. The problem is that I need to use =
.img=20
disks, Xen is failing because qemu is failing.

In fact, Xen on ARM uses qemu-system-i386, as stated in=20
https://wiki.xen.org/wiki/Xen_ARM_with_Virtualization_Extensions#Use_of_q=
emu-system-i386_on_ARM.

But, if I try to execute qemu-dm from /usr/bin/qemu-system-i386 it output=
s=20
the following error:
Could not initialize SDL (No available video device) - exiting

The thing is that the environment I am using has no video device and I do=
 not=20
need it from qemu. But I also don't know if Xen is facing the same proble=
m=20
with qemu or if another problem is happening, because it does not log it =
for=20
me. What Xen is logging is:
=E2=80=8B
libxl: error: libxl_dm.c:1393:device_model_spawn_outcome: domain 16 devic=
e=20
model: spawn failed (rc=3D-3)
libxl: error: libxl_create.c:1189:domcreate_devmodel_started: device mode=
l=20
did not start: -3
libxl: error: libxl_dm.c:1497:kill_device_model: Device Model already exi=
ted

Which is not very helpful.

Does anyone have any idea about what can be occurring with qemu?

Regards
Cristiano
