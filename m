Received: by 10.25.0.144 with SMTP id 138csp1835820lfa;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
X-Received: by 10.46.1.106 with SMTP id 103mr11028458ljb.97.1493122038076;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w6si581179ljd.152.2017.04.25.05.07.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFV-0003ZR-3J; Tue, 25 Apr 2017 13:07:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 09/13] armv7m: Implement M profile default memory map
Date: Tue, 25 Apr 2017 13:07:06 +0100
Message-Id: <1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: dRO2YuKagiLJ

From: Michael Davidsaver <mdavidsaver@gmail.com>

Add support for the M profile default memory map which is used
if the MPU is not present or disabled.

The main differences in behaviour from implementing this
correctly are that we set the PAGE_EXEC attribute on
the right regions of memory, such that device regions
are not executable.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: rephrased comment and commit message; don't mark
 the flash memory region as not-writable]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9e1ed1c..51662ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8129,18 +8129,35 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
                                                 ARMMMUIdx mmu_idx,
                                                 int32_t address, int *prot)
 {
-    *prot = PAGE_READ | PAGE_WRITE;
-    switch (address) {
-    case 0xF0000000 ... 0xFFFFFFFF:
-        if (regime_sctlr(env, mmu_idx) & SCTLR_V) { /* hivecs execing is ok */
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        *prot = PAGE_READ | PAGE_WRITE;
+        switch (address) {
+        case 0xF0000000 ... 0xFFFFFFFF:
+            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
+                /* hivecs execing is ok */
+                *prot |= PAGE_EXEC;
+            }
+            break;
+        case 0x00000000 ... 0x7FFFFFFF:
             *prot |= PAGE_EXEC;
+            break;
+        }
+    } else {
+        /* Default system address map for M profile cores.
+         * The architecture specifies which regions are execute-never;
+         * at the MPU level no other checks are defined.
+         */
+        switch (address) {
+        case 0x00000000 ... 0x1fffffff: /* ROM */
+        case 0x20000000 ... 0x3fffffff: /* SRAM */
+        case 0x60000000 ... 0x7fffffff: /* RAM */
+        case 0x80000000 ... 0x9fffffff: /* RAM */
+            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            break;
+        default: /* Peripheral, 2x Device, and System */
+            *prot = PAGE_READ | PAGE_WRITE;
         }
-        break;
-    case 0x00000000 ... 0x7FFFFFFF:
-        *prot |= PAGE_EXEC;
-        break;
     }
-
 }
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-- 
2.7.4
