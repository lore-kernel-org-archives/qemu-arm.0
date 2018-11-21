Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1493123wrt;
        Tue, 20 Nov 2018 22:43:10 -0800 (PST)
X-Google-Smtp-Source: AJdET5dzCg61kibpR02zgFvF4tBqq9kCoCCXXlEu+RGEqGakcPSRlrJ/SGkJ5X3qrMo3yC6xpx6z
X-Received: by 2002:a81:5482:: with SMTP id i124-v6mr4908109ywb.205.1542782590711;
        Tue, 20 Nov 2018 22:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542782590; cv=none;
        d=google.com; s=arc-20160816;
        b=RiLuQRHRQk/kVj4NUs3S1aSLUhpJcy90WxSmL7kd4cuM21WtY6gdbVok3NuIct1kBF
         uurfjUQqqJwj4fsedon9cw5BxEvcoe6fFJt2VH6Vx9lAn3U7pJFLpxMc3aHze2VV00Vl
         PiOj185742Armq0dLZlesgJKUedFzmcw+lxRf4RK2qFJCu1LwSkMt1MKMfmL7U2TgeB9
         dG1oogT/gFrTXURq/7/I5ntP6U5mUfKR7npYFuyPk9HPOrfScdn9fa3ywK9y2shPKa+O
         Lh2un1PUCUF+iFwa46QMOG3+8eq7cczDckxz8l0mFHk/myTDpMQM4/Lp14+7kjG1ui6f
         HRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=im5hAo0jTPJmDspoitHbBWYRkDodvEl2DWvSP0ELC/0=;
        b=twWSMDxJomkueVkFUPuG5eYsJYWJhl/V8v1GystM5pwSwYL9xD3vHjHJXLDcDMLd3e
         RNKQOS9FG5HDLlWOp19aVUVxkpzLz+iqYAkBzMLNYZ6PZGMSThvIpZET8E56ka4w/lfL
         qvSy0coZCdZNJTSt72R879lmpHqXwo9Z9Tye6Yf/G36BqrgJGapshIb5+VZW7MOap8Fk
         DB4aJYpnj/7yz0WGjqpi58VTbqjdb46+luh9rbbFd0Ispc/4T7FdhYXLcI9FkG4xLJrW
         6o95EVhlfxUrTlU6Kge50/sYzyeM2j4FYsiITnbWRGeBu2WYlK0XEo3BPZFkjNH4vZWi
         cKRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m71-v6si2897664ybf.359.2018.11.20.22.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 22:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPMEA-00018u-6j
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 01:43:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPMDz-00017b-Ln
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 01:43:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPMDw-0002FK-FX
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 01:42:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPMDw-0002Ck-AH; Wed, 21 Nov 2018 01:42:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E9C13DDB5;
	Wed, 21 Nov 2018 06:42:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-140.ams2.redhat.com [10.36.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3ACB604A3;
	Wed, 21 Nov 2018 06:42:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Nov 2018 07:42:48 +0100
Message-Id: <1542782568-20059-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 21 Nov 2018 06:42:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] MAINTAINERS: Assign some more files in the
 hw/arm/ directory
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mx3uL1lCCkn2

I apparently missed some more files and even a complete machine (the
"imx25-pdk") in my previous patch... but now we should hopefully have
a completely coverage for all available ARM boards.

Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v3: Dropped "ds1338-test.c", added some more pxa2xx related files instea=
d

 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406..63c88e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -533,6 +533,17 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/gumstix.c
=20
+i.MX25 PDK
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Jean-Christophe Dubois <jcd@tribudubois.net>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/fsl-imx25.c
+F: hw/arm/imx25_pdk.c
+F: hw/misc/imx25_ccm.c
+F: include/hw/arm/fsl-imx25.h
+F: include/hw/misc/imx25_ccm.h
+
 i.MX31 (kzm)
 M: Peter Chubb <peter.chubb@nicta.com.au>
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -615,6 +626,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
+F: hw/arm/raspi.c
 F: hw/arm/raspi_platform.h
 F: hw/*/bcm283*
 F: include/hw/arm/raspi*
@@ -639,8 +651,12 @@ F: hw/arm/spitz.c
 F: hw/arm/tosa.c
 F: hw/arm/z2.c
 F: hw/*/pxa2xx*
+F: hw/display/tc6393xb.c
+F: hw/gpio/max7310.c
+F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
+F: include/hw/arm/sharpsl.h
=20
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
--=20
1.8.3.1

