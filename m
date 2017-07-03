Received: by 10.25.227.6 with SMTP id a6csp2293210lfh;
        Mon, 3 Jul 2017 07:15:13 -0700 (PDT)
X-Received: by 10.55.26.104 with SMTP id a101mr42927881qka.202.1499091313748;
        Mon, 03 Jul 2017 07:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499091313; cv=none;
        d=google.com; s=arc-20160816;
        b=yJBqnEex+YzEIhqLBV6+iacv81AFGGd7qyxqYOHyUFPdLE0xjTlzIC+1ecL4RB3wap
         VsvPeaNt6dz4+/43pi6s934tGQB5qXvAGiMaYAO2lRgrrDYnfzTW//DhVXA7acTXKTAV
         8XUKHOMGaCyfQGHnIeD9flRYPXxSUI5Z8J7fB1vWhjKHAAu8fcA/AdzKDhRB4UA8tRqV
         RGiSJIp+HfNAcxJu3cG9i55A7VpTHv1DEG5frZLLm/qA6eMcAWd2jqeA8o0mMCxy6t+o
         qAwwpJQeQPmzHTBXnm6+pnsi+XDq8aJK/4Dyzyhqhd9r3lDRiqE9JlfzNJ56Qd2m5V9I
         f34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Y0ovZzlFPrFztUVUfVAv49gKS5qJI4bRyYYLW56tRU0=;
        b=kZ9xMlNBzUVRDPTkLNyixj8D2U13TG7WACL25+5nK7vws/YZW21XefD3/Vbsf+oD49
         vbSTqugOggmiLxhBbBy6k5bdXtr3YZmYvsZM1xQ+T5YCqdZOZj5jZLeH9xj0KgfaNhzl
         OEhopOEQlaWq94eK7Lo2VmVLTlQhmfaJM4AOEbl6hM4W15pzP7xK1YtSlW//1fMUGa9t
         /nNEA0fTf6LQazFr7oc33yNynlQkQtAJADomIx6dYRbNbKXlnt+U1KMWRUcoKoBq96+f
         JzMQftUFZx4gAc/XEU/QkatSRauwj/XkG0SjMW2YTeew9HUXIqzDFzfREzpWKiSPZRLs
         /r0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=es00FgP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si15131843qkb.86.2017.07.03.07.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jul 2017 07:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=es00FgP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dS287-0001cS-11
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 10:15:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gavin.wang.cd@gmail.com>) id 1dRvPW-0004w2-7j
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 03:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gavin.wang.cd@gmail.com>) id 1dRvPV-00042z-FB
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 03:04:42 -0400
Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230]:33924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gavin.wang.cd@gmail.com>)
	id 1dRvPV-0003xj-5A
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 03:04:41 -0400
Received: by mail-lf0-x230.google.com with SMTP id l13so97165062lfl.1
	for <qemu-arm@nongnu.org>; Mon, 03 Jul 2017 00:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Y0ovZzlFPrFztUVUfVAv49gKS5qJI4bRyYYLW56tRU0=;
	b=es00FgP9wt7KNMFw0hq7TtCeCG9PjcLTvA45RhbSMJxvTnMzpGXoqd9mwkZ85bqUb8
	o+y84H9J4OV9YSNin+m1DRambEGmLNrCiykzb5RfV5IIhsIOXuu1vq4EzinX/S68Mpst
	5Rad1X+hyfS+Cj8yROOuyfOu5E3fdtGP11MA0KoB/nHFgk2oAOeNsEtcInpy4AlyVLo5
	6u9ziudt1omJqDrcLb4K+8b+0J9MJUeXrHh01s5rCtixDiWnCHUEX2VzMDYgso9vY+Oy
	0AmXyUVGj1KdCuOL5NCZUh2PqbC5LnImJvAzaURF0hwPvKQE3pYq52OYCNdA8mItPobE
	1Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Y0ovZzlFPrFztUVUfVAv49gKS5qJI4bRyYYLW56tRU0=;
	b=bvJkMxVJf71mzL1znMspoeMFmS1kEtpOvn/TUW0osSXLx0JzjZfKxrlqNrlkQWH5Un
	Hi8z0J0Cnsjq7K43uTa3GimOjT0PGycSsNvAuL4u0H/OYZjMbtc0PIBLtwGH3884GdTX
	OO9ZgSf7y9Bp4z1KMSqwUQs2c5DB6YRQ4ngbS2PsbcWKAGc5m+LTRZF26wI51yhlPaPq
	G0/4Qtp+1EytosRs0wWAr3P004MDUy80EK3bxm+Ga3VgIRBRAW8Ba3zC6G6ispGwevUW
	zCWYIfUw8g3kVd3CxL/b5UvKBi6yFOSgkqUKh7PwOOsvSrLeBkyn/p1IDxO3/Gikcg1s
	DfmQ==
X-Gm-Message-State: AKS2vOxh84hgpSaLLeKv0iJMKb7vq/iK/h40r9Zjb7phPT1r5+R0UkGx
	yIBB7pLpIgvPnIPRLMm1DzbfKDeWV3a+
X-Received: by 10.46.87.65 with SMTP id r1mr9883371ljd.4.1499065477907; Mon,
	03 Jul 2017 00:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.29.81 with HTTP; Mon, 3 Jul 2017 00:04:37 -0700 (PDT)
From: =?UTF-8?B?546L5bmz?= <gavin.wang.cd@gmail.com>
Date: Mon, 3 Jul 2017 15:04:37 +0800
Message-ID: <CAEQo2v5TC9QkLeanB-FHiwb2VSM_CvR1_rfKgztwHzeQTUeVDQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="f403045f88c84e507805536461ff"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::230
X-Mailman-Approved-At: Mon, 03 Jul 2017 10:15:07 -0400
Subject: [Qemu-arm] qemu-system-arm for Exynos4210
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
X-TUID: eCkyXWZonVae

--f403045f88c84e507805536461ff
Content-Type: text/plain; charset="UTF-8"

Dears


because qemu is supporting for "Samsung SMDKC210 board (Exynos4210)". so ,i
got the linux kernel v4.9 and qemu-v2.8 version to do this work.

the zImage used the default exynos_defconfig config file.

launched as :
qemu-system-arm -M smdkc210  -m 512M -kernel
./lts4.9.33/arch/arm/boot/zImage -initrd  ./ramdisk.img  -append
"root=/dev/ram0 rw rootfstype=ext4 init=/linuxrc  console=ttySAC0
loglevel=8" -dtb
./lts4.9.33/arch/arm/boot/dts/exynos4210-universal_c210.dtb  -nographic

but i got this error message and the system is not started : "smdkc210
board supports only 2 CPU cores. Ignoring smp_cpus value".

also I tried masked some kernel config feature,still the same error. so
please help me ?  hope to heard form u?


-- 
BR,
Gavin

--f403045f88c84e507805536461ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Dears<br><br><br>because qemu is supporting=
 for &quot;Samsung SMDKC210 board (Exynos4210)&quot;. so ,i got the linux k=
ernel v4.9 and qemu-v2.8 version to do this work.<br><br></div><div>the zIm=
age used the default exynos_defconfig config file.<br></div><div><br></div>=
launched as :<br>qemu-system-arm -M smdkc210=C2=A0 -m 512M -kernel ./lts4.9=
.33/arch/arm/boot/zImage -initrd=C2=A0 ./ramdisk.img=C2=A0 -append &quot;ro=
ot=3D/dev/ram0 rw rootfstype=3Dext4 init=3D/linuxrc=C2=A0 console=3DttySAC0=
 loglevel=3D8&quot; -dtb ./lts4.9.33/arch/arm/boot/dts/exynos4210-universal=
_c210.dtb=C2=A0 -nographic<br><br></div>but i got this error message and th=
e system is not started : &quot;smdkc210=20
board supports only 2 CPU cores. Ignoring smp_cpus value&quot;.<br><br></di=
v>also I tried masked some kernel config feature,still the same error. so p=
lease help me ?=C2=A0 hope to heard form u?<br><div><div><div><br clear=3D"=
all"><div><br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr"><div>B=
R,<br></div>Gavin<br></div></div>
</div></div></div></div></div>

--f403045f88c84e507805536461ff--
