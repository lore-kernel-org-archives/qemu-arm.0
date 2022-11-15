Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d554d000000b002366e3f1497sm13055736wrw.6.2022.11.15.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0C8711FFBA;
	Tue, 15 Nov 2022 16:17:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Tue, 15 Nov 2022 16:17:36 +0000
Message-Id: <20221115161736.2425584-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZXIj1HEPJ1Hx

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes.
v3
  - re-base on re-flow with if
v4
  - fix the commit message
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
