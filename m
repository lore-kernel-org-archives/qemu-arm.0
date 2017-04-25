Received: by 10.25.0.144 with SMTP id 138csp1835834lfa;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
X-Received: by 10.28.152.80 with SMTP id a77mr12693022wme.116.1493122038795;
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id v105si22765336wrb.306.2017.04.25.05.07.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFW-0003aI-9W; Tue, 25 Apr 2017 13:07:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 11/13] armv7m: Classify faults as MemManage or BusFault
Date: Tue, 25 Apr 2017 13:07:08 +0100
Message-Id: <1493122030-32191-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: ULUNFEex3wRo

From: Michael Davidsaver <mdavidsaver@gmail.com>

General logic is that operations stopped by the MPU are MemManage,
and those which go through the MPU and are caught by the unassigned
handle are BusFault. Distinguish these by looking at the
exception.fsr values, and set the CFSR bits and (if appropriate)
fill in the BFAR or MMFAR with the exception address.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: i-side faults do not set BFAR/MMFAR, only d-side;
 added some CPU_LOG_INT logging]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 51662ad..49b6d01 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6342,10 +6342,49 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         break;
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
-        /* TODO: if we implemented the MPU registers, this is where we
-         * should set the MMFAR, etc from exception.fsr and exception.vaddress.
+        /* Note that for M profile we don't have a guest facing FSR, but
+         * the env->exception.fsr will be populated by the code that
+         * raises the fault, in the A profile short-descriptor format.
          */
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
+        switch (env->exception.fsr & 0xf) {
+        case 0x8: /* External Abort */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr |= R_V7M_CFSR_PRECISERR_MASK;
+                qemu_log_mask(CPU_LOG_INT, "...with CFSR.PRECISERR\n");
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr |=
+                    (R_V7M_CFSR_IBUSERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
+                env->v7m.bfar = env->exception.vaddress;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...with CFSR.IBUSERR and BFAR 0x%x\n",
+                              env->v7m.bfar);
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS);
+            break;
+        default:
+            /* All other FSR values are either MPU faults or "can't happen
+             * for M profile" cases.
+             */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr |= R_V7M_CFSR_IACCVIOL_MASK;
+                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IACCVIOL\n");
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr |=
+                    (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MASK);
+                env->v7m.mmfar = env->exception.vaddress;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...with CFSR.DACCVIOL and MMFAR 0x%x\n",
+                              env->v7m.mmfar);
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
+            break;
+        }
         break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
-- 
2.7.4
