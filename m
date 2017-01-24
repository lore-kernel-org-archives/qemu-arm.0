Received: by 10.25.77.65 with SMTP id a62csp1918336lfb;
        Tue, 24 Jan 2017 11:16:28 -0800 (PST)
X-Received: by 10.28.11.135 with SMTP id 129mr18693328wml.111.1485285388199;
        Tue, 24 Jan 2017 11:16:28 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id q80si19375831wmg.80.2017.01.24.11.16.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zr-0000Oz-EM; Tue, 24 Jan 2017 19:16:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 05/10] armv7m: honour CCR.STACKALIGN on exception entry
Date: Tue, 24 Jan 2017 19:16:15 +0000
Message-Id: <1485285380-10565-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: G4jd5GJnipmw

From: Michael Davidsaver <mdavidsaver@gmail.com>

The CCR.STACKALIGN bit controls whether the CPU is supposed to force
8-alignment of the stack pointer on entry to the exception handler.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: commit message and comment tweaks]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce7e43b..7dc30f5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6110,10 +6110,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
-    /* Align stack pointer.  */
-    /* ??? Should only do this if Configuration Control Register
-       STACKALIGN bit is set.  */
-    if (env->regs[13] & 4) {
+    /* Align stack pointer if the guest wants that */
+    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
         env->regs[13] -= 4;
         xpsr |= 0x200;
     }
-- 
2.7.4
