Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp848537wrt;
        Tue, 20 Nov 2018 09:43:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XDIm78KDfUu4Atz+73gmM6WO7Aa2rQtn71jWSOUmfI9BpgVHpRQh3TzAzD6oJpRjQ+aDqg
X-Received: by 2002:a25:5a0b:: with SMTP id o11-v6mr1771393ybb.52.1542735781836;
        Tue, 20 Nov 2018 09:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542735781; cv=none;
        d=google.com; s=arc-20160816;
        b=cg2akNh2QUkEg0CwmM71FYGqCm7dlYCK4/LcdrtI+U1EmaoU3lSHtSYT0PsQeRxWHJ
         KFHOnDmeYZaEHwgJQAp3oKUA8AJM0/1jON4Kn7jEdrQPgZKGUu6PzBbfPhD2IWsLVWBj
         fGXkImKpn8HaM2uJXAfIn8NNe0aHCe3QBseCaUTK0J5EYV648amv+F0yRxGSJZHx1y1L
         eWD3RhyUVPf1WC+v3N8UuqduVNALf4I+Yc4uHpBiiblOL7Nv0McrxThOQwUTpWpi8rgj
         NhVD+orVJCR+1Hkc/cdKW+PmBWlj0hwMy6MeaMAqMfvHZMNdKz7quXRBuWKk5Tv3ImXS
         dJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=YP5qitKgTj1Sa5UjWJwTWg8QZye/IypawmKvLpdTr7Y=;
        b=q+YPhuzLTYOXXzchpS/c42q450G0mpa2B9UmK9C0f28ujJ0iaDvZ+qlAFiic+Db1e1
         253fzx8BYljTxLcGTaOZKxHDAqcWaRjH2/Iw2l1WZVOjVyjnCqeK40rrRM7QuLLAUzAD
         0ED/p1iTfEfpF4I6qbgOGCDp5Fa+1vDQ+HiA8gkOxCnhA1oTcVs5F/IsMpjjGYtRCDL9
         sznfoZacaw0lfWt2TuBbqZX8tyLhq5EYWvgjLQ5mh2+Sc0VvADI2iuN3xSoYKkMC9xH+
         wKDxj/GgoZzDp/hMByJqCTCvfWF9OGILOn/LAPrzVTvgHie3hxKLlcOSJ09LUiON4EZz
         +ZNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17-v6si10298990ybj.396.2018.11.20.09.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 09:43:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPA3A-0006kd-Te
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 12:43:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPA2x-0006jJ-Dd
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 12:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPA2w-0000l9-Hm
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 12:42:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21511)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPA2w-0000kJ-Aj; Tue, 20 Nov 2018 12:42:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71B5A81DEA;
	Tue, 20 Nov 2018 17:42:45 +0000 (UTC)
Received: from thuth.com (ovpn-116-184.ams2.redhat.com [10.36.116.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4675F6A6A4;
	Tue, 20 Nov 2018 17:42:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 18:42:41 +0100
Message-Id: <1542735761-16176-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 20 Nov 2018 17:42:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] MAINTAINERS: Assign some more files in the
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
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XROP66CFblnF

I apparently missed some more files and even a complete machine (the
"imx25-pdk") in my previous patch... but now we should hopefully have
a completely coverage for all available ARM boards.

Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Dropped smmu* files from this patch

 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406..36ffc01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
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
+F: tests/ds1338-test.c
+
 i.MX31 (kzm)
 M: Peter Chubb <peter.chubb@nicta.com.au>
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
+F: hw/arm/raspi.c
 F: hw/arm/raspi_platform.h
 F: hw/*/bcm283*
 F: include/hw/arm/raspi*
@@ -641,6 +654,7 @@ F: hw/arm/z2.c
 F: hw/*/pxa2xx*
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
+F: include/hw/arm/sharpsl.h
=20
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
--=20
1.8.3.1

