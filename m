Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1c27sm152889575e9.15.2025.06.16.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 13:10:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2E3705F7D7;
	Mon, 16 Jun 2025 21:10:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [RFC PATCH] target/arm: clamp value to account for RES0 fields
Date: Mon, 16 Jun 2025 21:10:42 +0100
Message-ID: <20250616201042.2196127-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9Tn6R5LCOzrD

If the user writes a large value to the register but with the bottom
bits unset we could end up with something illegal. By clamping ahead
of the check we at least assure we won't assert(bpr > 0) later in the
GIC interface code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 4b4cf09157..165f7e9c2f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1797,6 +1797,9 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icc_bpr_write(ri->crm == 8 ? 0 : 1,
                               gicv3_redist_affid(cs), value);
 
+    /* clamp the value to 2:0, the rest os RES0 */
+    value = deposit64(0, 0, 3, value);
+
     if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
         grp = GICV3_G1NS;
     }
@@ -1820,7 +1823,7 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         value = minval;
     }
 
-    cs->icc_bpr[grp] = value & 7;
+    cs->icc_bpr[grp] = value;
     gicv3_cpuif_update(cs);
 }
 
-- 
2.47.2
