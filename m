Received: by 10.182.158.201 with SMTP id ww9csp6966529obb;
        Mon, 28 Dec 2015 12:25:17 -0800 (PST)
X-Received: by 10.140.151.145 with SMTP id 139mr76898743qhx.95.1451334317740;
        Mon, 28 Dec 2015 12:25:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si16131975qkh.5.2015.12.28.12.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 12:25:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDeM1-0007wa-Bs
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 15:25:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <davisjf@gmail.com>) id 1aDL3c-0002W8-Sa
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 18:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <davisjf@gmail.com>) id 1aDL3b-0007iq-NE
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 18:49:00 -0500
Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a]:34724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <davisjf@gmail.com>) id 1aDL3b-0007il-JJ
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 18:48:59 -0500
Received: by mail-ig0-x22a.google.com with SMTP id m11so110554075igk.1
	for <qemu-arm@nongnu.org>; Sun, 27 Dec 2015 15:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=I7wUNUQhKjoRZPU9qr+Tt2M6zBCPH/rbikuQtT7lmpM=;
	b=f5mYwpzdoD4y5IszsO6PbazOtKd6ssPHkGRfcYQcSmC3RKuBkH+EIpjO8C3RHa8EAE
	i8/IfFcoMRoYy/GBnMJ1WI0/geePKXJoQHnn2STW/vQJaKRBkDMYKBAUD8eLPjTni+D3
	EYamcyNDJ0oR55CAmgDEIn3Fg/VFA3OdI2G/2ReBDKc1N+j09XRfv8lucBfa71qjIDYE
	ApzrkiBwhP9TPkUkSdEkUCZXl0H4rfWJmyH9OpaDKWOoBYlohyVrwkXlwpJpq7in1wBc
	mppBhDmS/356dZWlLlNksRWnPSaoQoSfHqdNqIA5TxtdqtjIc274BqL2g6mU+EltA7WY
	K2nA==
MIME-Version: 1.0
X-Received: by 10.50.40.70 with SMTP id v6mr48185903igk.29.1451260138788; Sun,
	27 Dec 2015 15:48:58 -0800 (PST)
Received: by 10.36.111.76 with HTTP; Sun, 27 Dec 2015 15:48:58 -0800 (PST)
Date: Sun, 27 Dec 2015 18:48:58 -0500
Message-ID: <CAEaoPMgwvktPWr4z-qjy3chyYdkEdEGFg+P0Ood5JdOgED6-tw@mail.gmail.com>
From: John Davis <davisjf@gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=089e0112c43c0ca0660527e9d511
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::22a
X-Mailman-Approved-At: Mon, 28 Dec 2015 15:25:16 -0500
Subject: [Qemu-arm] command line args for qemu-test image
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
X-TUID: MFnNuptfc12p

--089e0112c43c0ca0660527e9d511
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello

I am trying to test my build from source to see if I have a working
qemu-system-arm build.  I pulled the test image from this page:
http://wiki.qemu.org/Testing

It has a readme in the archive which says to use this syntax
./qemu-system-arm -kernel zImage.integrator -initrd arm_root.img
but when I run it I do not get a console.  The version of qemu I am using
requires a -M option and I have  tried some of the available options
but none work.

--=20
John F. Davis
6 Kandes Court
Durham, NC 27713
919-888-8358

=E7=8B=AC=E6=A0=91=E4=B8=80=E5=B8=9C

--089e0112c43c0ca0660527e9d511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>I am trying to test my build from=
 source to see if I have a working qemu-system-arm build.=C2=A0 I pulled th=
e test image from this page:</div><div><a href=3D"http://wiki.qemu.org/Test=
ing">http://wiki.qemu.org/Testing</a></div><div><br></div><div>It has a rea=
dme in the archive which says to use this syntax</div><div><div>./qemu-syst=
em-arm -kernel zImage.integrator -initrd arm_root.img</div></div><div>but w=
hen I run it I do not get a console.=C2=A0 The version of qemu I am using</=
div><div>requires a -M option and I have =C2=A0tried some of the available =
options</div><div>but none work.</div><div><div><br></div>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr">John F. Davis<div>6 Kandes Court</div=
><div>Durham, NC 27713</div><div>919-888-8358</div><div><br>=E7=8B=AC=E6=A0=
=91=E4=B8=80=E5=B8=9C<br><br><br></div></div></div>
</div></div>

--089e0112c43c0ca0660527e9d511--
