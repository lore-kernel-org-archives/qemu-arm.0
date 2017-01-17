Received: by 10.25.205.13 with SMTP id d13csp753505lfg;
        Tue, 17 Jan 2017 15:50:11 -0800 (PST)
X-Received: by 10.55.106.193 with SMTP id f184mr350266qkc.36.1484697011511;
        Tue, 17 Jan 2017 15:50:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x134si17418337qka.1.2017.01.17.15.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 15:50:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTdVw-0002hp-Pm
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 18:50:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1cTdH9-0007Om-Ir
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 18:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1cTdH8-0001TW-SR
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 18:34:51 -0500
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:33547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <viniciusfre@gmail.com>)
	id 1cTdH8-0001Rj-NM
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 18:34:50 -0500
Received: by mail-ua0-x231.google.com with SMTP id i68so114884625uad.0
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 15:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=NM1zRAtLHqdstjUnjiIOzBIM8eXBj+yQ1wS3aFX6P6w=;
	b=qmXkCUnS9MJvUtu6xDEZuvtFeRcpdzc01gq2tTgkm7fa+pAOqWHQezmTZiyLPwU48o
	Z7Ak5/SpwqYpUZ8MiEbKMQJGqrHRglZLfpNDYtDcZ575MSHZ+0cBMp22jDlzcA4IjxQD
	nxVtzCyRao3RCzLwBsmjYFu2QToCsdhbdPw5jQY3odNzFNfzWYfMvVueFUp+p+aZcoTz
	2P+IlFo62SMxAr1L4T96KDGaI0b7VRJ6rtVmdeAM2yeR7fVvbTuD0jhOlpzXw/WLuFlF
	iZKuc9Bf4EE7/vW2h1/J8eOQUdFMQoVRKVuo3S5RKcJDINv5yDV57APc6GkfYBJmpwnr
	hPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=NM1zRAtLHqdstjUnjiIOzBIM8eXBj+yQ1wS3aFX6P6w=;
	b=LzVM+4b2lLxHoQ1o8l0N6dlcZzmvv0vOEVPzOu/yoy8TZ6zfUdv+Rc2Y+DWpUynB1m
	rgFFLKI3CsJQ6FllGgceFuWGYoKwTR1f/2/1jEr/I4XZhqXoI3+osovZ5nPl4aqYraEi
	uf7jW7sahz910SZVH/IEHBybZYgPPae8zmLGKdIAPxBfTh2wICxheTXXkxrVhtOY1Pjo
	krOp2IRBbFdltDlcbSDOk7U4xEVd4KW8acRfYxmcSQQggKwkE6ZJZ+ajNprSPIPhMgEP
	tnr7DKCLoiYkfNyc+GcMaP5DpnvQXnEPmdp1Aqired2tbLvkbRIoykHOuXln5nzDwus1
	PRLQ==
X-Gm-Message-State: AIkVDXJEqn71251lx4sY1Au4/cjg/9Gqz3wi0WaLvQ2hw4L1G3OT5njDWMihRIN1/V4BEE1yo5jxZXfD38Xg+A==
X-Received: by 10.159.41.5 with SMTP id t5mr141192uat.142.1484696088637; Tue,
	17 Jan 2017 15:34:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.163 with HTTP; Tue, 17 Jan 2017 15:34:48 -0800 (PST)
From: Vinicius Maciel <viniciusfre@gmail.com>
Date: Tue, 17 Jan 2017 20:34:48 -0300
Message-ID: <CAEz5UgE5aoLFGaTaJXM0br3+oU0ohcJ9H=OsW5RuUMqo87jsCA@mail.gmail.com>
To: qemu-arm@nongnu.org, shannon.zhao@linaro.org
Content-Type: multipart/alternative; boundary=001a114bc200f67696054652be58
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
X-Mailman-Approved-At: Tue, 17 Jan 2017 18:50:03 -0500
Subject: [Qemu-arm]  ARM64: KVM: Cross type vCPU support
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
X-TUID: i+RVpUvgwRif

--001a114bc200f67696054652be58
Content-Type: text/plain; charset=UTF-8

Hello,

With this new feature, am I able to run KVM ARMv8/ARMv7-A host with a
ARMv7m guest? For example, could a Raspberry Pi 3 emulate a stm32
microcontroller using KVM Cross type?

Thanks,
Vinicius

--001a114bc200f67696054652be58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hello,<br></div><div><br></div>With th=
is new feature, am I able to run KVM ARMv8/ARMv7-A host with a ARMv7m guest=
?=C2=A0For example, could a Raspberry Pi 3 emulate a stm32 microcontroller =
using KVM Cross type?<div><br></div><div>Thanks,<br></div><div>Vinicius</di=
v></div>

--001a114bc200f67696054652be58--
