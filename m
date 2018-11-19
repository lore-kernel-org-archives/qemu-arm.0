Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1277063wrt;
        Mon, 19 Nov 2018 11:58:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5cmqlA5KyHtkCd8+yfX0FDqnI7tFqUSC2rvg2/JYBTGhs9RvdFI8UeRu/oNpDlntodKTgiO
X-Received: by 2002:a81:5a89:: with SMTP id o131-v6mr22946979ywb.121.1542657492152;
        Mon, 19 Nov 2018 11:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542657492; cv=none;
        d=google.com; s=arc-20160816;
        b=N1GCH/jP4gRwxcEDFtAPSG97pMw1vjVMwwWAjF1aw5xnXql7POgPQ6sBLYes03W/SE
         kQUm2jn3tls1zX8UtN3XoN+PTtF/2IRqqVxnyZXbXgXxTgB+c5kh64iNImeW57saX07U
         814EoAsylF/ljDZWRNTWX8vwuILgfDKjONTuCqMsFamU84ZG83ElevfT1BQ6UzsWGZ97
         0FkbNXGnpB8jtW5QqMICYRx9hQK4c17JvosN/g0ox0D3aJioHS+CDrzZND+WM8Fa0k5/
         JNEFZMamk69WPuIZmqPunrPZV70D3xBOpkcmz+8Hm1+1cADByFSOmJP+lO5nagaswjgD
         sRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=2JLDnyrBSf/c1aoIoreeMImi4I+X76Kguqo109zP2do=;
        b=b5C9OkQ1m/XLyZ3H7SF3kmWn5dh6z81Hwh5oz8R1+utFJ1PS39xa7bH0T+5U18WkjY
         Z9lp3G8ubfkN8T7UNx+L0Qrq/kEo49qq7dIt9RPZAh028mFY/GLFUodYTKX/UXyUU4FK
         uTQ2AjN26+XPi2TwsQEu9vHNBqWcscGwRZbRkKcfouNs2mkrh6XN+BgyVmWbamLBmQtT
         7/JfdEtJPtYQYkK7q7KBaMplZPTD8fR3kJl/RWRAZD3vRWq0glRv8JnoAYAGDpDZQR/S
         jDC5zdlWdupLp9HB6ScJE5fY8Dk1aEom/72p8p7Ay3fclVGRbX4Im/8+23x+AvjMl43O
         p58g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6-v6si25349845ywa.116.2018.11.19.11.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 11:58:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOpgR-0000Rf-LF
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 14:58:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gOpgK-0000RZ-W9
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 14:58:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gOpgF-0001Fm-Cn
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 14:58:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1gOpgF-00018Y-2o
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 14:57:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77C69307EA8A;
	Mon, 19 Nov 2018 19:57:56 +0000 (UTC)
Received: from thuth.com (ovpn-116-124.ams2.redhat.com [10.36.116.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 136F4608EC;
	Mon, 19 Nov 2018 19:57:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Nov 2018 20:57:53 +0100
Message-Id: <1542657473-9196-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 19 Nov 2018 19:57:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Assign some more files in the
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aPR6+9TSfAsN

I apparently missed some more files and even a complete machine (the
"imx25-pdk") in my previous patch... but now we should hopefully have
a completely coverage for all available ARM boards.

Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406..ac20dc8 100644
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
@@ -686,7 +700,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt*
+F: hw/arm/smmu*
 F: include/hw/arm/virt.h
+F: include/hw/arm/smmu*
=20
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
--=20
1.8.3.1

