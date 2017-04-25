Received: by 10.25.0.144 with SMTP id 138csp1835797lfa;
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
X-Received: by 10.223.138.237 with SMTP id z42mr10481539wrz.66.1493122035180;
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w197si4650134wmd.1.2017.04.25.05.07.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFS-0003XZ-JK; Tue, 25 Apr 2017 13:07:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 05/13] arm: Don't clear ARM_FEATURE_PMSA for no-mpu configs
Date: Tue, 25 Apr 2017 13:07:02 +0100
Message-Id: <1493122030-32191-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 2/sMhRYz/XhA

Fix the handling of QOM properties for PMSA CPUs with no MPU:

Allow no-MPU to be specified by either:
 * has-mpu = false
 * pmsav7_dregion = 0
and make setting one imply the other. Don't clear the PMSA
feature bit in this situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f17e279..8e57498 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -757,8 +757,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_pfr1 &= ~0xf000;
     }
 
+    /* MPU can be configured out of a PMSA CPU either by setting has-mpu
+     * to false or by setting pmsav7-dregion to 0.
+     */
     if (!cpu->has_mpu) {
-        unset_feature(ARM_FEATURE_PMSA);
+        cpu->pmsav7_dregion = 0;
+    }
+    if (cpu->pmsav7_dregion == 0) {
+        cpu->has_mpu = false;
     }
 
     if (arm_feature(env, ARM_FEATURE_PMSA) &&
-- 
2.7.4
