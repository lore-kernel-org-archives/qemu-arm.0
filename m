Received: by 10.25.0.144 with SMTP id 138csp1835826lfa;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
X-Received: by 10.223.164.153 with SMTP id g25mr4393826wrb.103.1493122038325;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n29si29853513wra.31.2017.04.25.05.07.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFV-0003Zg-Qh; Tue, 25 Apr 2017 13:07:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 10/13] arm: All M profile cores are PMSA
Date: Tue, 25 Apr 2017 13:07:07 +0100
Message-Id: <1493122030-32191-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Hd/M6FLvX7eB

All M profile CPUs are PMSA, so set the feature bit.
(We haven't actually implemented the M profile MPU register
interface yet, but setting this feature bit gives us closer
to correct behaviour for the MPU-disabled case.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8e57498..df8b835 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -543,6 +543,14 @@ static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+    /* M profile implies PMSA. We have to do this here rather than
+     * in realize with the other feature-implication checks because
+     * we look at the PMSA bit to see if we should add some properties.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
+        set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
         arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property,
-- 
2.7.4
