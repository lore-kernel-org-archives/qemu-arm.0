Received: by 10.25.159.19 with SMTP id i19csp1949026lfe;
        Thu, 14 Jan 2016 10:34:39 -0800 (PST)
X-Received: by 10.107.155.146 with SMTP id d140mr5881257ioe.92.1452796458126;
        Thu, 14 Jan 2016 10:34:18 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id o23si749403ioi.147.2016.01.14.10.34.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:18 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000m3-99; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in arm_el_is_aa64()
Date: Thu, 14 Jan 2016 18:34:04 +0000
Message-Id: <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: OI125Rcmw9mQ

Support EL2 and EL3 in arm_el_is_aa64() by implementing the
logic for checking the SCR_EL3 and HCR_EL2 register-width bits
as appropriate to determine the register width of lower exception
levels.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 5f81342..b8b3364 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -969,18 +969,33 @@ static inline bool arm_is_secure(CPUARMState *env)
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
 {
-    /* We don't currently support EL2, and this isn't valid for EL0
-     * (if we're in EL0, is_a64() is what you want, and if we're not in EL0
-     * then the state of EL0 isn't well defined.)
+    /* This isn't valid for EL0 (if we're in EL0, is_a64() is what you want,
+     * and if we're not in EL0 then the state of EL0 isn't well defined.)
      */
-    assert(el == 1 || el == 3);
+    assert(el >= 1 && el <= 3);
+    bool aa64 = arm_feature(env, ARM_FEATURE_AARCH64);
 
-    /* AArch64-capable CPUs always run with EL1 in AArch64 mode. This
-     * is a QEMU-imposed simplification which we may wish to change later.
-     * If we in future support EL2 and/or EL3, then the state of lower
-     * exception levels is controlled by the HCR.RW and SCR.RW bits.
+    /* The highest exception level is always at the maximum supported
+     * register width, and then lower levels have a register width controlled
+     * by bits in the SCR or HCR registers.
      */
-    return arm_feature(env, ARM_FEATURE_AARCH64);
+    if (el == 3) {
+        return aa64;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
+    }
+
+    if (el == 2) {
+        return aa64;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL2) && !arm_is_secure_below_el3(env)) {
+        aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
+    }
+
+    return aa64;
 }
 
 /* Function for determing whether guest cp register reads and writes should
-- 
1.9.1
