Received: by 10.25.150.194 with SMTP id y185csp432082lfd;
        Wed, 16 Nov 2016 17:31:19 -0800 (PST)
X-Received: by 10.200.46.117 with SMTP id s50mr305560qta.103.1479346278975;
        Wed, 16 Nov 2016 17:31:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si397213qkb.79.2016.11.16.17.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 17:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c7BXp-00010Z-T4
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 20:31:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1c7BXj-0000zD-SF
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 20:31:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1c7BXj-0002g4-0S
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 20:31:11 -0500
Received: from bh-25.webhostbox.net ([208.91.199.152]:42611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1c7BXe-0001zt-Mj; Wed, 16 Nov 2016 20:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Message-Id:Date:Subject:Cc:To:From;
	bh=5WzAwJuTcZFUnqysYJfEziaMWFOKR1+D3eB+52llSv8=;
	b=do/ic2Ce1an5/Z5NNg0/YCp4bo
	b5zcXEiAEVODMdKP+3jkKb11RQMvXoJVUtjFJJ/Bu8i2272R2iAo8ILL7xtVC2yUJzN2n5pDKrxUv
	GD4pIQf+uj52hFBXtSWYVGiSMGs2ouP9BKlkTffMeVrKHqMx9Tss5nLqIpAPUg3bn6Fd2NcezvFHU
	X0/k9Nj4i4bXbQcC8VCaXXwD79j38fD+lvnCqxyt3Wg+sHEImBFHD+8Yo/7DEIlO5lb5O943Xes2p
	cI0WHI39VgA56KWf4aUH+9f0aksKAIOnyvEdRGpQwWPkybnscuiWgk9Lz/TngtuuiSK8wejfhRRg0
	WdKZcc9g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:59408 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.86_1)
	(envelope-from <linux@roeck-us.net>)
	id 1c7BWv-004Gxv-1M; Thu, 17 Nov 2016 01:30:21 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 16 Nov 2016 17:30:21 -0800
Message-Id: <1479346221-18474-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.5.0
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 208.91.199.152
Subject: [Qemu-arm] [PATCH] arm: Create /chosen and /memory devicetree nodes
 if necessary
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
Cc: qemu-arm@nongnu.org, Alexander Graf <agraf@suse.de>,
	Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vHKez010gik

While customary, the /chosen and /memory devicetree nodes do not have to
exist. Create if necessary. Also create the /memory/device_type property
if needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
The problem is seen with the latest version of the Linux kernel in
linux-next (next-20161116), where many of the /chosen and /memory nodes
in arm devicetree files have been removed. This results in a kernel hang
(sabrelite) or qemu abort (imx25-pdk).

 hw/arm/boot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 942416d..ff621e4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include <libfdt.h>
 #include "hw/hw.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/linux-boot-if.h"
@@ -486,6 +487,17 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
             g_free(nodename);
         }
     } else {
+        Error *err = NULL;
+
+        rc = fdt_path_offset(fdt, "/memory");
+        if (rc < 0) {
+            qemu_fdt_add_subnode(fdt, "/memory");
+        }
+
+        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
+            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
+        }
+
         rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
@@ -495,6 +507,11 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    rc = fdt_path_offset(fdt, "/chosen");
+    if (rc < 0) {
+        qemu_fdt_add_subnode(fdt, "/chosen");
+    }
+
     if (binfo->kernel_cmdline && *binfo->kernel_cmdline) {
         rc = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
-- 
2.5.0

