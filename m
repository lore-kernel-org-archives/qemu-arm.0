Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id az11-20020a05600c600b00b003b4cba4ef71sm22407183wmb.41.2022.11.15.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C7E891FFBA;
	Tue, 15 Nov 2022 13:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Tue, 15 Nov 2022 13:40:48 +0000
Message-Id: <20221115134048.2352715-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115134048.2352715-1-alex.bennee@linaro.org>
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WohQ1xSt5MYB

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Lightly re-factor this region of registers and also add a comment to
the function in case anyway was under the illusion we only return
bytes from a function called readb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes.
v3
  - re-base on re-flow with if
---
 hw/intc/arm_gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 1a04144c38..7a34bc0998 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* GICD_TYPER byte 1 */
             return (s->security_extn << 2);
         }
-        if (offset < 0x08)
+        if (offset == 8) {
+            /* GICD_IIDR byte 0 */
+            return 0x3b; /* Arm JEP106 identity */
+        }
+        if (offset == 9) {
+            /* GICD_IIDR byte 1 */
+            return 0x04; /* Arm JEP106 identity */
+        }
+        if (offset < 0x0c) {
+            /* All other bytes in this range are RAZ */
             return 0;
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.34.1
