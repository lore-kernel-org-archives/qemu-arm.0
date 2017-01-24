Received: by 10.25.77.65 with SMTP id a62csp1918320lfb;
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
X-Received: by 10.28.169.209 with SMTP id s200mr18796471wme.9.1485285386247;
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id m87si19394175wmc.35.2017.01.24.11.16.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zt-0000Qz-PK; Tue, 24 Jan 2017 19:16:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 10/10] armv7m: R14 should reset to 0xffffffff
Date: Tue, 24 Jan 2017 19:16:20 +0000
Message-Id: <1485285380-10565-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: WLVg6sxvJ5AS

For M profile (unlike A profile) the reset value of R14 is specified
as 0xffffffff.  (The rationale is that this is an illegal exception
return value, so if guest code tries to return to it it will result
in a helpful exception.)

Registers r0 to r12 and the flags are architecturally UNKNOWN on
reset, so we leave those at zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0814f73..e9f10f7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -196,6 +196,9 @@ static void arm_cpu_reset(CPUState *s)
          */
         env->v7m.ccr = R_V7M_CCR_STKALIGN_MASK;
 
+        /* Unlike A/R profile, M profile defines the reset LR value */
+        env->regs[14] = 0xffffffff;
+
         /* Load the initial SP and PC from the vector table at address 0 */
         rom = rom_ptr(0);
         if (rom) {
-- 
2.7.4
