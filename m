Received: by 10.25.15.230 with SMTP id 99csp2639226lfp;
        Thu, 30 Mar 2017 09:29:34 -0700 (PDT)
X-Received: by 10.55.17.35 with SMTP id b35mr567062qkh.275.1490891374409;
        Thu, 30 Mar 2017 09:29:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f50si2222477qtc.47.2017.03.30.09.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 09:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctcx3-0000QG-S9
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 12:29:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1ctcvm-0007rS-63
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 12:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1ctcvl-0001FI-7G
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 12:28:14 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1ctcvl-0001EL-0v
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 12:28:13 -0400
Received: by mail-vk0-x22d.google.com with SMTP id d188so60619064vka.0
	for <qemu-arm@nongnu.org>; Thu, 30 Mar 2017 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=nAmondgvSSU+Slhc+McqK6juBHJXxAuR+vell1I6w/A=;
	b=gCbScFyrEwn0rrPw8skKDDQ4KjMa8s8vzIB96NlbYE+y9t2s4Kteo1juKxE2BGjQZx
	V+WUmElm6EFVpqrt1YEkf7gExu1mgtVwYMjZd5bPA0iJK8pJGVnbmtIriPqIXSYyWBqP
	B6mmlSUnwAlXeAb06q3G86BsOev5yxQnowy8wioSorM5s3GoQjSJY0T3NAgcfc9P2K+o
	iKyM3N543dWBwVhHN2EJhN18IkoOsLlNRfVoDVOa+oaAtsXF1DhNiAZt3r9hjBsbB37e
	1B0ICfZwy+jcxOU2uZsykE8yE5zuieXSX2QFuLSzFAeAuWJy1sWnHFXUSaoOAaBQS42B
	+9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nAmondgvSSU+Slhc+McqK6juBHJXxAuR+vell1I6w/A=;
	b=aYULNwk5hyxq0zbNtl3KRLn5nsNG8OqahnyxH27wy5Qyf74DgCP+3N9/7iSIH5KX0/
	C8ct43BY1MV4jQbPkykC7EmZNk4Ep4/KjAET5wLTdeO9Gu+9Krml+eR8h+tIcmBBNCF0
	jKZtnEi8glbA8Dx9hdpQnuJ8/j7Ir+apqRd+VwPk3Blo21qWOUqSbIZQtb9k3SrbKXEM
	Rt2le6a/871wVcCHu9Z5XCJniyNYZIzvCNsE32A2FqjWB69hWkF53w0GRkHN5092sc2r
	gicVIl7HohKlKyo0Cb71u7tmDs/J1esUxyYRhLQ0SiTmGS2CPh6eq7F2DB+ASekwxpld
	X3Ug==
X-Gm-Message-State: AFeK/H1lm6Wuseld6xyYmgolVy1Zz8VsCTH/d3g0H7sh49woISbb+v2idd6Z/o5FXhyovQkFL/BI2IxOfYI30g==
X-Received: by 10.176.74.222 with SMTP id t30mr331181uae.132.1490891291855;
	Thu, 30 Mar 2017 09:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.86.88 with HTTP; Thu, 30 Mar 2017 09:28:11 -0700 (PDT)
From: James Hanley <jhanley@dgtlrift.com>
Date: Thu, 30 Mar 2017 12:28:11 -0400
Message-ID: <CAF++6ANmUc8GxjJqZ01ow=VBeEh2q1pXk+NSe71WJy=+bu5T4g@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss@nongnu.org, 
	qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=f403045f8a94d9ff55054bf52d1a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: [Qemu-arm] Loading microcode to ROM for new Arm based CPU type
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
X-TUID: 5fzPc/Oqln/S

--f403045f8a94d9ff55054bf52d1a
Content-Type: text/plain; charset=UTF-8

I've been trying to develop a Atmel SAM4 series support for CPU support as
an MCU, mimicking implementation layout of the STM support.   Part of the
ATSAM4 die series is ROM microcode used for referencing details such as NMI
located at 0x00800000.   I've loaded our own application at 0x00400000,
which is the reset vector for the chip... when I try to add it via

qemu-system-arm -M ourBoard ... \
-device loader,addr=0x00400000,file=${imageApplication} \
-kernel ${imageApplication} \
-device loader,addr=0x00800000,file=ATSAM4_ROM.img \
...

It loads the imageApplication at the proper address location, mindful that
in order for the to work I needed to specify the kernel option as well for
the same file. For the microcode file ATSAM4_ROM.img, it does not show any
data at that address location (0x00800000) even when I specify a second
-kernel option specifying the ATSAM_ROM.img...  is there something I'm
doing wrong with the command line to make it available?

Thanks in advance,
-Jim

--f403045f8a94d9ff55054bf52d1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>I&#39;ve been trying to develop a Atme=
l SAM4 series support for CPU support as an MCU, mimicking implementation l=
ayout of the STM support. =C2=A0 Part of the ATSAM4 die series is ROM micro=
code used for referencing details such as NMI located at 0x00800000. =C2=A0=
 I&#39;ve loaded our own application at 0x00400000, which is the reset vect=
or for the chip... when I try to add it via</div><div><br></div><div>qemu-s=
ystem-arm -M ourBoard ... \</div>-device loader,addr=3D0x00400000,file=3D${=
imageApplication} \<div>-kernel=C2=A0${imageApplication} \<br><div>-device =
loader,addr=3D0x00800000,file=3DATSAM4_ROM.img \</div></div><div>...</div><=
div><br></div><div>It loads the imageApplication at the proper address loca=
tion, mindful that in order for the to work I needed to specify the kernel =
option as well for the same file. For the microcode file ATSAM4_ROM.img, it=
 does not show any data at that address location (0x00800000) even when I s=
pecify a second -kernel option specifying the ATSAM_ROM.img... =C2=A0is the=
re something I&#39;m doing wrong with the command line to make it available=
?</div><div><br></div><div>Thanks in advance,</div><div>-Jim</div></div>

--f403045f8a94d9ff55054bf52d1a--
