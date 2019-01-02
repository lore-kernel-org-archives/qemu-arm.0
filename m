Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp110564wrt;
        Wed, 2 Jan 2019 04:53:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4Mv5PJ8kWEEkz+wHkJWZcmGX+EgGRaQKgmWlX9vzgWZbFLAhSiqEbwBFjA2L4v33l0LitT
X-Received: by 2002:a37:66c1:: with SMTP id a184mr40111085qkc.314.1546433604547;
        Wed, 02 Jan 2019 04:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546433604; cv=none;
        d=google.com; s=arc-20160816;
        b=nh2pSQYIYHSrL978Q7T2C9bqK9v3ZJfjLGzp+7AScCmksZm3ygqksGPLLf+Mu9FIZT
         7bW+V7pDjrm/E/uljXHlxSe+wRXFURfFPHOJLa2LclBjggrzHaqwrAMTCqAvQ0SKr2Uc
         VcBQaV3gWgkbZK9bnrGSYDPpoC6mU0zoywzzZ9V0AqBCzyUNrPI0wtcRhg37Av3kaSO6
         nZ2eZHrgZ1Ljt4ykQpdKAkaXPfjGc5J+4X646MHbshp2612TjLNW9HpuW+KW5cED3GVX
         5BE1QJJ+GWVnYYEHyB8HzFhQkEzsNXZe+Nyg5YKYeCG7hUsHdBuf9BYSo7QGDSK7pHRG
         YchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=Mb1juxaX34GFVFe+KNn/bmr7KhXMwYIpk5EW5COUREA=;
        b=X5XqerGtklI8fiesy0KVMkUahqqj+6Mv0ni0ZhiOASsPiBZ5tvhQYcbZyFXyWvH40E
         jHIgsx0l/m4wHo6J6mG6yQIZ/wV1snUOXqdmNFfNonfL9P7zb2FgMxwL2r8c2Ij8s/9O
         rtviQHjZQiGoQvrbpFY2+yebZndq6jjvjSnsaXuk7LWdNhpu34e28xzbMhIS/lo7s25w
         zb0jHfXfxxQ4aLLAyCJXI0TH0rgDoiLC8/O++EtKbOIM8/lz152cAvWw+2ctM+0d2pfV
         Cg1itOHOUZgUcsbHdXkt/QNKhR1VUEteGzLbGCFxbBQUOS2zjYDt5EhD2u+zAy5oUHTs
         CYCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b48si1885141qtk.45.2019.01.02.04.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Jan 2019 04:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1geg1U-0007Tv-3D
	for alex.bennee@linaro.org; Wed, 02 Jan 2019 07:53:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1geg1M-0007Tl-99
	for qemu-arm@nongnu.org; Wed, 02 Jan 2019 07:53:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1geg1I-0000r2-QX
	for qemu-arm@nongnu.org; Wed, 02 Jan 2019 07:53:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1geg1I-0000q0-Lf; Wed, 02 Jan 2019 07:53:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DED08804E9;
	Wed,  2 Jan 2019 12:53:09 +0000 (UTC)
Received: from thuth.com (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83609608DC;
	Wed,  2 Jan 2019 12:53:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  2 Jan 2019 13:53:03 +0100
Message-Id: <1546433583-18397-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 02 Jan 2019 12:53:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Add ARM-related files for
 hw/[misc|input|timer]/
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6zHvPwbkDkhV

Some of the files in hw/input/, hw/misc/ and hw/timer/ are only
used by one of the ARM machines, so we can assign these files to
the corresponding boards.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 180695f..693abdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -510,6 +510,7 @@ F: hw/intc/arm*
 F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
+F: hw/misc/arm_l2x0.c
 F: hw/timer/a9gtimer*
 F: hw/timer/arm*
 F: include/hw/arm/arm*.h
@@ -582,6 +583,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
+F: include/hw/misc/arm_integrator_debug.h
 
 MCIMX6UL EVK / i.MX6ul
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -601,7 +603,9 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/mcimx7d-sabre.c
 F: hw/arm/fsl-imx7.c
+F: hw/misc/imx7_*.c
 F: include/hw/arm/fsl-imx7.h
+F: include/hw/misc/imx7_*.h
 F: hw/pci-host/designware.c
 F: include/hw/pci-host/designware.h
 
@@ -635,6 +639,10 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
+F: hw/input/lm832x.c
+F: hw/input/tsc2005.c
+F: hw/misc/cbus.c
+F: hw/timer/twl92230.c
 
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
@@ -642,6 +650,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/palm.c
+F: hw/input/tsc210x.c
 
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -678,6 +687,7 @@ F: hw/display/tc6393xb.c
 F: hw/gpio/max7310.c
 F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
+F: hw/misc/max111x.c
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 
@@ -688,10 +698,10 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/sabrelite.c
 F: hw/arm/fsl-imx6.c
-F: hw/misc/imx6_src.c
+F: hw/misc/imx6_*.c
 F: hw/ssi/imx_spi.c
 F: include/hw/arm/fsl-imx6.h
-F: include/hw/misc/imx6_src.h
+F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h
 
 Sharp SL-5500 (Collie) PDA
@@ -802,7 +812,9 @@ R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/*aspeed*
+F: hw/misc/pca9552.c
 F: include/hw/*/*aspeed*
+F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 
-- 
1.8.3.1

