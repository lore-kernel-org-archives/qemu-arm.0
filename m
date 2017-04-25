Received: by 10.25.0.144 with SMTP id 138csp1835805lfa;
        Tue, 25 Apr 2017 05:07:16 -0700 (PDT)
X-Received: by 10.28.95.67 with SMTP id t64mr1892039wmb.140.1493122036405;
        Tue, 25 Apr 2017 05:07:16 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 194si4202968wmt.32.2017.04.25.05.07.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFT-0003Yl-Qj; Tue, 25 Apr 2017 13:07:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 07/13] arm: Remove unnecessary check on cpu->pmsav7_dregion
Date: Tue, 25 Apr 2017 13:07:04 +0100
Message-Id: <1493122030-32191-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: dkMpX2o+9OcG

Now that we enforce both:
 * pmsav7_dregion == 0 implies has_mpu == false
 * PMSA with has_mpu == false means SCTLR.M cannot be set
we can remove a check on pmsav7_dregion from get_phys_addr_pmsav7(),
because we can only reach this code path if the MPU is enabled
(and so region_translation_disabled() returned false).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f0f25c8..5c044d0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8227,8 +8227,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
 
         if (n == -1) { /* no hits */
-            if (cpu->pmsav7_dregion &&
-                (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR))) {
+            if (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
                 /* background fault */
                 *fsr = 0;
                 return true;
-- 
2.7.4
