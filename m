Received: by 10.25.159.19 with SMTP id i19csp1948768lfe;
        Thu, 14 Jan 2016 10:34:13 -0800 (PST)
X-Received: by 10.194.113.102 with SMTP id ix6mr6488272wjb.143.1452796453742;
        Thu, 14 Jan 2016 10:34:13 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 8si11311158wjx.165.2016.01.14.10.34.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mI-ED; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/8] target-arm: Fix wrong AArch64 entry offset for EL2/EL3 target
Date: Thu, 14 Jan 2016 18:34:08 +0000
Message-Id: <1452796451-2946-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: tzJge6k/zOxY

The entry offset when taking an exception to AArch64 from a lower
exception level may be 0x400 or 0x600. 0x400 is used if the
implemented exception level immediately lower than the target level
is using AArch64, and 0x600 if it is using AArch32. We were
incorrectly implementing this as checking the exception level
that the exception was taken from. (The two can be different if
for example we take an exception from EL0 to AArch64 EL3; we should
in this case be checking EL2 if EL2 is implemented, and EL1 if
EL2 is not implemented.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index d37c82c..196c111 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5866,7 +5866,26 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
 
     if (arm_current_el(env) < new_el) {
-        if (env->aarch64) {
+        /* Entry vector offset depends on whether the implemented EL
+         * immediately lower than the target level is using AArch32 or AArch64
+         */
+        bool is_aa64;
+
+        switch (new_el) {
+        case 3:
+            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
+            break;
+        case 2:
+            is_aa64 = (env->cp15.hcr_el2 & HCR_RW) != 0;
+            break;
+        case 1:
+            is_aa64 = is_a64(env);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (is_aa64) {
             addr += 0x400;
         } else {
             addr += 0x600;
-- 
1.9.1
