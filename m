Received: by 10.25.21.156 with SMTP id 28csp1637019lfv;
        Tue, 26 Jul 2016 03:44:24 -0700 (PDT)
X-Received: by 10.200.54.107 with SMTP id n40mr37480695qtb.44.1469529864196;
        Tue, 26 Jul 2016 03:44:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si92157qtb.124.2016.07.26.03.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 03:44:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRzqZ-0002CV-OA
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 06:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bRzqU-0002CC-NG
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 06:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bRzqS-0006w8-Il
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 06:44:17 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bRzqS-0006uj-AT; Tue, 26 Jul 2016 06:44:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bRzqJ-0002NW-7W; Tue, 26 Jul 2016 11:44:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 26 Jul 2016 11:44:06 +0100
Message-Id: <1469529846-10451-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] imx: Use 'const char', not 'char const'
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdQoedqJKCg7

'char const' means the same thing as 'const char', but we
use the former in only a handful of places and we use the
latter over six thousand times. Switch the imx reg_name()
functions to bring them in line with everything else.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Just a minor style nit I noticed. The only other uses of
'char const' in the codebase are all in qga/commands-posix.c.

 hw/misc/imx25_ccm.c | 2 +-
 hw/misc/imx31_ccm.c | 2 +-
 hw/misc/imx6_ccm.c  | 4 ++--
 hw/misc/imx6_src.c  | 2 +-
 hw/ssi/imx_spi.c    | 2 +-
 hw/timer/imx_epit.c | 2 +-
 hw/timer/imx_gpt.c  | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index 5cd8c0a..19e948a 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -27,7 +27,7 @@
         } \
     } while (0)
 
-static char const *imx25_ccm_reg_name(uint32_t reg)
+static const char *imx25_ccm_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 1c03e52..b890c38 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -29,7 +29,7 @@
         } \
     } while (0)
 
-static char const *imx31_ccm_reg_name(uint32_t reg)
+static const char *imx31_ccm_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 17e15d4..1b42101 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -26,7 +26,7 @@
         } \
     } while (0)
 
-static char const *imx6_ccm_reg_name(uint32_t reg)
+static const char *imx6_ccm_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
@@ -99,7 +99,7 @@ static char const *imx6_ccm_reg_name(uint32_t reg)
     }
 }
 
-static char const *imx6_analog_reg_name(uint32_t reg)
+static const char *imx6_analog_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 8bb6829..55b817b 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -27,7 +27,7 @@
         } \
     } while (0)
 
-static char const *imx6_src_reg_name(uint32_t reg)
+static const char *imx6_src_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4226199..e4e395f 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -25,7 +25,7 @@
         } \
     } while (0)
 
-static char const *imx_spi_reg_name(uint32_t reg)
+static const char *imx_spi_reg_name(uint32_t reg)
 {
     static char unknown[20];
 
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index eddf348..9832fe0 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -30,7 +30,7 @@
         } \
     } while (0)
 
-static char const *imx_epit_reg_name(uint32_t reg)
+static const char *imx_epit_reg_name(uint32_t reg)
 {
     switch (reg) {
     case 0:
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 82bc73c..214c056 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -29,7 +29,7 @@
         } \
     } while (0)
 
-static char const *imx_gpt_reg_name(uint32_t reg)
+static const char *imx_gpt_reg_name(uint32_t reg)
 {
     switch (reg) {
     case 0:
-- 
1.9.1

