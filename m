Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FC8D58B0A
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMN-0004t0-9t; Sat, 14 Mar 2026 23:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cML-0004rz-Nv
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:45 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMK-0003eL-14
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:45 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-2b4520f6b32so5139394eec.0
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546103; x=1774150903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAox7KuzEjN6uMKR15HpaLwREkZOhi+MKGAAIeeTYzk=;
 b=CxfzrHsJPlwMjgbdE0AMHaOHdGCxlBg5xwdsoPe5FIK9KqwAiVV0S4pSRXwZ22J/Ka
 aXWDjdO666n38AswVtxqrcqjPvQm67HaBSU4Ns7VYxrd6/cnJu6VIVxfdmofx9ihaICe
 bXXMgx5Kto13rSqDPZsyCCqXFgxlqgbgi0S3lfZzCSjVpUT4aKsAx7L3cjYqrYLeTans
 s/JD7LC6mjck+EXTIP8IicDANORW0P4NytrJ005TznWChF3YUUHADTOeD2/5RTvLg63V
 RNJGQVDn8eOBs3v0r/MuH9m+aj2umg4u7BvJu/TDJtOPGLSY6E/Xf65OqZNHmN1Ba/kG
 98IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546103; x=1774150903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FAox7KuzEjN6uMKR15HpaLwREkZOhi+MKGAAIeeTYzk=;
 b=qX5lwTjQ+yCFoTcQxpQKezcVuI/bN1yzfNQ+oBFx3/GKZTOnTis7zkXwoKWpP6lUYx
 bJy0XD+RKgpshqcN4dfcfHYhbIT7U5JZixmoFTBLAT/K5w7zS2x6C3D/VWjNJ8I/iSfK
 pj87U8sPO+8lekqUKj9gcj/BhxAQZtxw1AQadRrNA2ZNSgiNV/JW37R8DZ9ZlXSkZM20
 x+gEH8wCGI/cNzZBSBsYwX//gZbzlvm5E1uMQ7iSEK/EEq5g5PWwfhJkEMnuJ6VRJGqC
 giVprDJ0zJcIsrC+8BleI9HmV2LOrTniXvv1FnQ7srR8nLiOqrSgUyYR0+raetJpCPfQ
 9XBQ==
X-Gm-Message-State: AOJu0YyJ4cyqPUGsB6WCdPeAKcADHEfdDnobplj9ItoSGwpsxD4zb9Dy
 tYKAC9mbT6Yr2Qy4nvekka3G4y9SnFjG4DIW+5fi8mBZTcVPGtXGc5yTMZ1UHl5A
X-Gm-Gg: ATEYQzwr+NzQbEnpbWw+oFK4LjLH2rTNPpP8MNp4j9BUrxPITe91tszAb/yQgOA4fwo
 sVUq8EhmKk7Q7iCOI9sTYhxIh/W0DuDH26Q3Lhty/zIe5b0TvIyhChO+2LRIONoIbqw8q88p6Yf
 duQnPIjXQuJG3D6EPaBehAhDP6FUTepqk+VL19eqNyuKzDDE4onoSDTmZM2JdmakQ6eYeKOhlOF
 BsoVWa3BGqUAGjvyc32Ai3Gfvrm/Rcc96UnubOabo6k8tpc7NqQnMxZjmS3EjxCXbagbSS5RAaO
 CbX9M0Hct4bMplPb4XtNifLteOdQHftXi1kwKaS8OKTrxkRbTMvS9cwnPDMSylI3QlrTgVWaiUH
 hkEJiEKvp12i1Rx7MSmGkLB2f9nQuTsHegPf9sr6T38pGygDgjNwDty+Zr3dToKiXTPeuGbQmdM
 uX+we/UmwXsB2gn+JJxMfM7gdfuDnfyEsIkSQSpDY=
X-Received: by 2002:a05:7300:190f:b0:2be:7885:31df with SMTP id
 5a478bee46e88-2bea54adff6mr4233975eec.17.1773546102517; 
 Sat, 14 Mar 2026 20:41:42 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3eec8fsm8886424eec.13.2026.03.14.20.41.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:41:42 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v3 6/6] target/arm/hvf,
 whpx: wire ISV=0 emulation for data aborts
Date: Sun, 15 Mar 2026 00:41:23 -0300
Message-ID: <20260315034123.41921-7-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034123.41921-1-lucaaamaral@gmail.com>
References: <20260313021850.42379-1-lucaaamaral@gmail.com>
 <20260315034123.41921-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

When a data abort with ISV=0 occurs during MMIO emulation, the
syndrome register does not carry the access size or target register.
Previously this hit an assert(isv) and killed the VM.

Replace the assert with instruction fetch + decode + emulate using the
shared library in target/arm/emulate/.  The faulting instruction is read
from guest memory via cpu_memory_rw_debug(), decoded by the decodetree-
generated decoder, and emulated against the vCPU register file.

Both HVF (macOS) and WHPX (Windows Hyper-V) use the same pattern:
  1. cpu_synchronize_state() to flush hypervisor registers
  2. Fetch 4-byte instruction at env->pc
  3. arm_emul_insn(env, insn)
  4. Log errors for unhandled/memory-fault cases, advance PC

This makes ISV=0 data aborts non-fatal, enabling MMIO access from
SIMD/FP loads, load/store pairs, atomics, and other instructions
that hardware does not decode into the syndrome.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/hvf/hvf.c       | 41 +++++++++++++++++++++++++++++++++++---
 target/arm/whpx/whpx-all.c | 39 +++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bb..219dbbca 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -32,6 +32,7 @@
 #include "arm-powerctl.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
+#include "emulate/arm_emulate.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
 #include "target/arm/trace.h"
@@ -2175,10 +2176,44 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         assert(!s1ptw);
 
         /*
-         * TODO: ISV will be 0 for SIMD or SVE accesses.
-         * Inject the exception into the guest.
+         * ISV=0: syndrome doesn't carry access size/register info.
+         * Fetch and emulate via target/arm/emulate/.
+         * Unhandled instructions log an error and advance PC.
          */
-        assert(isv);
+        if (!isv) {
+            ARMCPU *arm_cpu = ARM_CPU(cpu);
+            CPUARMState *env = &arm_cpu->env;
+            uint32_t insn;
+            ArmEmulResult r;
+
+            cpu_synchronize_state(cpu);
+
+            if (cpu_memory_rw_debug(cpu, env->pc,
+                                    (uint8_t *)&insn, 4, false) != 0) {
+                error_report("HVF: cannot read insn at pc=0x%" PRIx64,
+                             (uint64_t)env->pc);
+                advance_pc = true;
+                break;
+            }
+
+            r = arm_emul_insn(env, insn);
+            if (r == ARM_EMUL_UNHANDLED) {
+                /*
+                 * TODO: Inject data abort into guest instead of
+                 * advancing PC.  Requires setting ESR_EL1/FAR_EL1/
+                 * ELR_EL1/SPSR_EL1 and redirecting to VBAR_EL1.
+                 */
+                error_report("HVF: ISV=0 unhandled insn 0x%08x at "
+                             "pc=0x%" PRIx64, insn, (uint64_t)env->pc);
+            } else if (r == ARM_EMUL_ERR_MEM) {
+                error_report("HVF: ISV=0 memory error emulating "
+                             "insn 0x%08x at pc=0x%" PRIx64,
+                             insn, (uint64_t)env->pc);
+            }
+
+            advance_pc = true;
+            break;
+        }
 
         /*
          * Emulate MMIO.
diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 513551be..2f8ffc7f 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -29,6 +29,7 @@
 #include "syndrome.h"
 #include "target/arm/cpregs.h"
 #include "internals.h"
+#include "emulate/arm_emulate.h"
 
 #include "system/whpx-internal.h"
 #include "system/whpx-accel-ops.h"
@@ -366,7 +367,43 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
     uint64_t val = 0;
 
     assert(!cm);
-    assert(isv);
+
+    /*
+     * ISV=0: syndrome doesn't carry access size/register info.
+     * Fetch and decode the faulting instruction via the emulation library.
+     */
+    if (!isv) {
+        ARMCPU *arm_cpu = ARM_CPU(cpu);
+        CPUARMState *env = &arm_cpu->env;
+        uint32_t insn;
+        ArmEmulResult r;
+
+        cpu_synchronize_state(cpu);
+
+        if (cpu_memory_rw_debug(cpu, env->pc,
+                                (uint8_t *)&insn, 4, false) != 0) {
+            error_report("WHPX: cannot read insn at pc=0x%" PRIx64,
+                         (uint64_t)env->pc);
+            return 0;
+        }
+
+        r = arm_emul_insn(env, insn);
+        if (r == ARM_EMUL_UNHANDLED) {
+            /*
+             * TODO: Inject data abort into guest instead of
+             * advancing PC.  Requires setting ESR_EL1/FAR_EL1/
+             * ELR_EL1/SPSR_EL1 and redirecting to VBAR_EL1.
+             */
+            error_report("WHPX: ISV=0 unhandled insn 0x%08x at "
+                         "pc=0x%" PRIx64, insn, (uint64_t)env->pc);
+        } else if (r == ARM_EMUL_ERR_MEM) {
+            error_report("WHPX: ISV=0 memory error emulating "
+                         "insn 0x%08x at pc=0x%" PRIx64,
+                         insn, (uint64_t)env->pc);
+        }
+
+        return 0;
+    }
 
     if (iswrite) {
         val = whpx_get_gp_reg(cpu, srt);
-- 
2.52.0


