Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D2E106FD68
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 02:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0s7I-0000St-VO; Thu, 12 Mar 2026 22:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w0s7G-0000RX-O5
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 22:19:06 -0400
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w0s7E-00080a-Sd
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 22:19:06 -0400
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-2bea8a1c040so280559eec.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 19:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773368343; x=1773973143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEo0bmu07ao6NQM9T5TABIQ6ozlil21ERYceiCcmYxE=;
 b=Fs6PD1kx7/LvqGOy3XUhrzN7Ve2ZexHs3pUx4uTF/tQh7MkixnjlRjv62T+LEXUFOz
 sqQxLepdHhtHXT8aODFB4TJHUS8k+uQE+2AJYfmg7OTwXF6NVwOe9nujsaAL1j3I+ZcI
 6UhnGr27Jc1bPeIkGXkzAp2IB+Ij745VmU/0iKa6mAZm4atuMMosNzdrnB2BIJMgR38v
 yIWMLnTzj1mU68muLu7MTGZE5HEsVImJunMuTp6SzJ/ORcZCE03Jxt/dNAWiXqEV/QgF
 m2RG+YTKEcoO4gC/GOGi5uBs+3c6o3xDdkYrgaux9NyaWNUhMvIq6JprtW2I5bEFSnPx
 zjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773368343; x=1773973143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NEo0bmu07ao6NQM9T5TABIQ6ozlil21ERYceiCcmYxE=;
 b=nJNV/+hAps2NXuLQecthc+O1hEVTXB5+W5Y1JMACmFkaBVHVa63YgqPuY2kmGWgI0R
 4yrGl7Qxme6adaYH4ChiRyX8QUrbZMfyII3CYLyc5Qc7sJIRY4i0MAWMxyPFO6aJ5JJ4
 7LewBjxkJp2JK8+3sTM0Ji839rzxWa/mMSo9bFQWM5FSCCMEZNp4VESMXlnwCSopkRYV
 OvCPzvzwd0bCMhCKU0qlv8o8iyw5hSlJ8INbY+3tY++he/0Zc39lZXMgpCt+gsGQpmOJ
 4L86UVNr27o5LmzgpbIOi16keOHrV3hyDRQCKYPvNiyvr7VyepjkX5MsdUqUIs7diCxD
 2pPw==
X-Gm-Message-State: AOJu0YxbgMY2NqqFfllWe3tfNy74m7FYPbOAd2/74Um/SINS8JSbQ+jt
 62ycPcexOQpzTmyDjMUKDkRw1fs9yatk97MiWv3fzhByKzlaSv2EB6+4
X-Gm-Gg: ATEYQzxkf2N1pHdbIPMaWBNKoWpPR4Lu5RfPePM/RWBvUimkYDubRBJav9CCGRlU5Hp
 MOazmbhQzfyvlh67Z9l+JiEjf/4S5JzJ8FDZ4to7RZOcByIvlBLK0UKpG5x2MdMYr4ZGIDVQ5qJ
 zaOC5uW+dUSi1ZdXxxEZZsHqGruy8glG9pTgRr/qbmSjHk0hSwctKWa0qJykKw4PX7ixWuIYBs0
 feMNSjuHkzZC0QIRNah5f74P/SOe17MC03DpY/7njpVagcjJEWiME29PV0MsB8LC/bgnNkHagwo
 RUXwNObWc7L8SGzYiDqvc7FwE6zNBZgnFzdtAdqVE8DZLS4QiKfKKit4E8lEpZItj26Hp/1hfnu
 AKZdXpNjvRaIrHA9qUDHLmlRa9AgwLqsZoWTNlzGzIqasiigSadGe32b7L8EkOZZR84h27wuBaN
 b6vzjWFhHu4Fxp9cLiEW/cgdM43zMvTaJ5B7dRq7a0anOqf1c6Q4I=
X-Received: by 2002:a05:7300:a987:b0:2be:2645:af00 with SMTP id
 5a478bee46e88-2bea5508c4cmr827278eec.32.1773368343165; 
 Thu, 12 Mar 2026 19:19:03 -0700 (PDT)
Received: from 192.168.0.29 ([2804:14d:4c71:86dd:588a:39d7:d008:37c2])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3eec52sm796218eec.14.2026.03.12.19.19.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Mar 2026 19:19:02 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v2 3/3] target/arm: wire ISV=0 emulation into HVF and WHPX
Date: Thu, 12 Mar 2026 23:18:50 -0300
Message-ID: <20260313021850.42379-4-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313021850.42379-1-lucaaamaral@gmail.com>
References: <20260309214852.92545-1-lucaaamaral@gmail.com>
 <20260313021850.42379-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132e.google.com
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

Connect the ISV=0 emulation library to the HVF and WHPX backends.
Each implements arm_emul_ops callbacks over CPUARMState and
cpu_memory_rw_debug().  Replaces the assert(isv) with instruction
fetch, decode, and emulation via arm_emul_insn().

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/hvf/hvf.c       | 94 ++++++++++++++++++++++++++++++++++++--
 target/arm/whpx/whpx-all.c | 86 +++++++++++++++++++++++++++++++++-
 2 files changed, 176 insertions(+), 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d79469c..2a57b97 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -30,6 +30,7 @@
 #include "qemu/main-loop.h"
 #include "system/cpus.h"
 #include "arm-powerctl.h"
+#include "emulate/arm_emulate.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
@@ -797,6 +798,59 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     return val;
 }
 
+/*
+ * arm_emul_ops callbacks for HVF
+ *
+ * State must already be synchronized (cpu_synchronize_state) before
+ * calling arm_emul_insn().  Reads/writes env->xregs[] directly to
+ * correctly handle register 31 as SP and avoid redundant HVF API calls.
+ */
+
+static uint64_t hvf_emul_read_gpr(CPUState *cpu, int reg)
+{
+    return ARM_CPU(cpu)->env.xregs[reg];
+}
+
+static void hvf_emul_write_gpr(CPUState *cpu, int reg, uint64_t val)
+{
+    ARM_CPU(cpu)->env.xregs[reg] = val;
+    cpu->vcpu_dirty = true;
+}
+
+static void hvf_emul_read_fpreg(CPUState *cpu, int reg, void *buf, int size)
+{
+    memcpy(buf, &ARM_CPU(cpu)->env.vfp.zregs[reg], size);
+}
+
+static void hvf_emul_write_fpreg(CPUState *cpu, int reg,
+                                 const void *buf, int size)
+{
+    CPUARMState *env = &ARM_CPU(cpu)->env;
+    memset(&env->vfp.zregs[reg], 0, sizeof(env->vfp.zregs[reg]));
+    memcpy(&env->vfp.zregs[reg], buf, size);
+    cpu->vcpu_dirty = true;
+}
+
+static int hvf_emul_read_mem(CPUState *cpu, uint64_t va, void *buf, int size)
+{
+    return cpu_memory_rw_debug(cpu, va, buf, size, false);
+}
+
+static int hvf_emul_write_mem(CPUState *cpu, uint64_t va,
+                              const void *buf, int size)
+{
+    return cpu_memory_rw_debug(cpu, va, (void *)buf, size, true);
+}
+
+static const struct arm_emul_ops hvf_arm_emul_ops = {
+    .read_gpr    = hvf_emul_read_gpr,
+    .write_gpr   = hvf_emul_write_gpr,
+    .read_fpreg  = hvf_emul_read_fpreg,
+    .write_fpreg = hvf_emul_write_fpreg,
+    .read_mem    = hvf_emul_read_mem,
+    .write_mem   = hvf_emul_write_mem,
+};
+
 static void clamp_id_aa64mmfr0_parange_to_ipa_size(ARMISARegisters *isar)
 {
     uint32_t ipa_size = chosen_ipa_bit_size ?
@@ -1871,10 +1925,44 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
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
+            r = arm_emul_insn(cpu, &hvf_arm_emul_ops, insn);
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
index 40ada2d..c57abef 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -37,6 +37,7 @@
 #include "whpx_arm.h"
 #include "hw/arm/bsa.h"
 #include "arm-powerctl.h"
+#include "emulate/arm_emulate.h"
 
 #include <winhvplatform.h>
 #include <winhvplatformdefs.h>
@@ -377,6 +378,53 @@ static void whpx_set_gp_reg(CPUState *cpu, int rt, uint64_t val)
     whpx_set_reg(cpu, reg, reg_val);
 }
 
+/* arm_emul_ops callbacks for WHPX */
+
+static uint64_t whpx_emul_read_gpr(CPUState *cpu, int reg)
+{
+    return ARM_CPU(cpu)->env.xregs[reg];
+}
+
+static void whpx_emul_write_gpr(CPUState *cpu, int reg, uint64_t val)
+{
+    ARM_CPU(cpu)->env.xregs[reg] = val;
+    cpu->vcpu_dirty = true;
+}
+
+static void whpx_emul_read_fpreg(CPUState *cpu, int reg, void *buf, int size)
+{
+    memcpy(buf, &ARM_CPU(cpu)->env.vfp.zregs[reg], size);
+}
+
+static void whpx_emul_write_fpreg(CPUState *cpu, int reg,
+                                  const void *buf, int size)
+{
+    CPUARMState *env = &ARM_CPU(cpu)->env;
+    memset(&env->vfp.zregs[reg], 0, sizeof(env->vfp.zregs[reg]));
+    memcpy(&env->vfp.zregs[reg], buf, size);
+    cpu->vcpu_dirty = true;
+}
+
+static int whpx_emul_read_mem(CPUState *cpu, uint64_t va, void *buf, int size)
+{
+    return cpu_memory_rw_debug(cpu, va, buf, size, false);
+}
+
+static int whpx_emul_write_mem(CPUState *cpu, uint64_t va,
+                               const void *buf, int size)
+{
+    return cpu_memory_rw_debug(cpu, va, (void *)buf, size, true);
+}
+
+static const struct arm_emul_ops whpx_arm_emul_ops = {
+    .read_gpr    = whpx_emul_read_gpr,
+    .write_gpr   = whpx_emul_write_gpr,
+    .read_fpreg  = whpx_emul_read_fpreg,
+    .write_fpreg = whpx_emul_write_fpreg,
+    .read_mem    = whpx_emul_read_mem,
+    .write_mem   = whpx_emul_write_mem,
+};
+
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     uint64_t syndrome = ctx->Syndrome;
@@ -391,7 +439,43 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
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
+        r = arm_emul_insn(cpu, &whpx_arm_emul_ops, insn);
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


