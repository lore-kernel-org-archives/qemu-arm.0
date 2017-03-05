Received: by 10.25.0.147 with SMTP id 141csp1127745lfa;
        Sun, 5 Mar 2017 13:49:35 -0800 (PST)
X-Received: by 10.55.73.147 with SMTP id w141mr8254388qka.205.1488750575062;
        Sun, 05 Mar 2017 13:49:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n62si14152063qkf.156.2017.03.05.13.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 13:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cke20-00064i-84
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 16:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cke1v-00064Z-67
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:49:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cke1r-0007QI-VA
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:49:27 -0500
Received: from mail.kernel.org ([198.145.29.136]:56794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cke1r-0007Pp-L9; Sun, 05 Mar 2017 16:49:23 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 9329320212;
	Sun,  5 Mar 2017 21:49:21 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CC89120125;
	Sun,  5 Mar 2017 21:49:15 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  5 Mar 2017 23:48:55 +0200
Message-Id: <20170305214857.9510-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Convert fprintf to
 error_report()
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzdzCgReS187

error_report() is preferred over fprintf() for logging errors.  Also
remove square brackets [] and additional new line characters in printed
messages.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/arm/exynos4_boards.c   |  6 +++---
 hw/timer/exynos4210_mct.c |  5 +++--
 hw/timer/exynos4210_pwm.c | 11 +++++------
 hw/timer/exynos4210_rtc.c | 16 +++++++---------
 4 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 0efa19405409..5cd94d402b52 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
-        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring smp_cpus"
-                " value.\n",
-                mc->name, EXYNOS4210_NCPUS);
+        error_report("%s board supports only %d CPU cores. Ignoring smp_cpus value.",
+                     mc->name, EXYNOS4210_NCPUS);
     }
 
     exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 6069116942a4..48041ab036a6 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -53,6 +53,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "qemu/main-loop.h"
@@ -1364,8 +1365,8 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
     case L0_TCNTO: case L1_TCNTO:
     case L0_ICNTO: case L1_ICNTO:
     case L0_FRCNTO: case L1_FRCNTO:
-        fprintf(stderr, "\n[exynos4210.mct: write to RO register "
-                TARGET_FMT_plx "]\n\n", offset);
+        error_report("exynos4210.mct: write to RO register " TARGET_FMT_plx,
+                     offset);
         break;
 
     case L0_INT_CSTAT: case L1_INT_CSTAT:
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index f5765075c720..f8826e24e63d 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "qemu-common.h"
@@ -252,9 +253,8 @@ static uint64_t exynos4210_pwm_read(void *opaque, hwaddr offset,
         break;
 
     default:
-        fprintf(stderr,
-                "[exynos4210.pwm: bad read offset " TARGET_FMT_plx "]\n",
-                offset);
+        error_report("exynos4210.pwm: bad read offset " TARGET_FMT_plx,
+                     offset);
         break;
     }
     return value;
@@ -343,9 +343,8 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        fprintf(stderr,
-                "[exynos4210.pwm: bad write offset " TARGET_FMT_plx "]\n",
-                offset);
+        error_report("exynos4210.pwm: bad write offset " TARGET_FMT_plx,
+                     offset);
         break;
 
     }
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index 1a648c5d9e67..f4548cd555f4 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "qemu-common.h"
@@ -370,9 +371,8 @@ static uint64_t exynos4210_rtc_read(void *opaque, hwaddr offset,
         break;
 
     default:
-        fprintf(stderr,
-                "[exynos4210.rtc: bad read offset " TARGET_FMT_plx "]\n",
-                offset);
+        error_report("exynos4210.rtc: bad read offset " TARGET_FMT_plx,
+                     offset);
         break;
     }
     return value;
@@ -433,9 +433,8 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
         if (value > TICNT_THRESHOLD) {
             s->reg_ticcnt = value;
         } else {
-            fprintf(stderr,
-                    "[exynos4210.rtc: bad TICNT value %u ]\n",
-                    (uint32_t)value);
+            error_report("exynos4210.rtc: bad TICNT value %u",
+                         (uint32_t)value);
         }
         break;
 
@@ -500,9 +499,8 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        fprintf(stderr,
-                "[exynos4210.rtc: bad write offset " TARGET_FMT_plx "]\n",
-                offset);
+        error_report("exynos4210.rtc: bad write offset " TARGET_FMT_plx,
+                     offset);
         break;
 
     }
-- 
2.9.3

