Received: by 10.25.159.19 with SMTP id i19csp1949084lfe;
        Thu, 14 Jan 2016 10:34:45 -0800 (PST)
X-Received: by 10.66.197.131 with SMTP id iu3mr8336205pac.57.1452796458824;
        Thu, 14 Jan 2016 10:34:18 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ym10si10752998pab.146.2016.01.14.10.34.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:18 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mR-Hg; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 7/8] target-arm: Implement remaining illegal return event checks
Date: Thu, 14 Jan 2016 18:34:10 +0000
Message-Id: <1452796451-2946-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Uf1zhRRy0lYu

We already implement almost all the checks for the illegal
return events from AArch64 state described in the ARM ARM section
D1.11.2. Add the two missing ones:
 * return to EL2 when EL3 is implemented and SCR_EL3.NS is 0
 * return to Non-secure EL1 when EL2 is implemented and HCR_EL2.TGE is 1

(We don't implement external debug, so the case of "debug state exit
from EL0 using AArch64 state to EL0 using AArch32 state" doesn't apply
for QEMU.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 38d46d8..5789ccb 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -718,6 +718,17 @@ void HELPER(exception_return)(CPUARMState *env)
         goto illegal_return;
     }
 
+    if (new_el == 2 && arm_is_secure_below_el3(env)) {
+        /* Return to the non-existent secure-EL2 */
+        goto illegal_return;
+    }
+
+    if (new_el == 1 &&
+        arm_feature(env, ARM_FEATURE_EL2) && (env->cp15.hcr_el2 & HCR_TGE)
+        && !arm_is_secure_below_el3(env)) {
+        goto illegal_return;
+    }
+
     if (!return_to_aa64) {
         env->aarch64 = 0;
         env->uncached_cpsr = spsr & CPSR_M;
-- 
1.9.1
