Received: by 10.80.163.71 with SMTP id 65csp199839edn;
        Fri, 9 Sep 2016 09:30:40 -0700 (PDT)
X-Received: by 10.55.195.77 with SMTP id a74mr4816577qkj.165.1473438640913;
        Fri, 09 Sep 2016 09:30:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si2550345qtc.58.2016.09.09.09.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOhM-0008Nm-9w
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObP-0003IQ-BQ
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObN-00064P-4T
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:30 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:54491)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biObM-00064G-VL
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:29 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 81B49FFC929
	for <qemu-devel@nongnu.org>; Fri,  9 Sep 2016 18:24:28 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 436BF3C0065;
	Fri,  9 Sep 2016 18:24:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:55 +0200
Message-Id: <1473438177-26079-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16301904753980312337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.74.227
Subject: [Qemu-devel] [PATCH v5 12/14] aspeed: use error_report instead of
 LOG_GUEST_ERROR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9sL3wVAcH0w+

Also change the default value used in case of an error. The minimum
size is a bit severe, so let's just use an average RAM size.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 1d2825237728..20bcdb52c4df 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -9,6 +9,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/misc/aspeed_scu.h"
 #include "hw/qdev-properties.h"
@@ -151,13 +152,13 @@ static int ast2400_rambits(void)
     case 512:
         return ASPEED_SDMC_DRAM_512MB;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x"
-                      RAM_ADDR_FMT "\n", __func__, ram_size);
         break;
     }
=20
-    /* set a minimum default */
-    return ASPEED_SDMC_DRAM_64MB;
+    /* use a common default */
+    error_report("warning: Invalid RAM size 0x" RAM_ADDR_FMT
+                 ". Using default 256M", ram_size);
+    return ASPEED_SDMC_DRAM_256MB;
 }
=20
 static int ast2500_rambits(void)
@@ -172,13 +173,13 @@ static int ast2500_rambits(void)
     case 1024:
         return ASPEED_SDMC_AST2500_1024MB;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x"
-                      RAM_ADDR_FMT "\n", __func__, ram_size);
         break;
     }
=20
-    /* set a minimum default */
-    return ASPEED_SDMC_AST2500_128MB;
+    /* use a common default */
+    error_report("warning: Invalid RAM size 0x" RAM_ADDR_FMT
+                 ". Using default 512M", ram_size);
+    return ASPEED_SDMC_AST2500_512MB;
 }
=20
 static void aspeed_sdmc_reset(DeviceState *dev)
--=20
2.7.4

