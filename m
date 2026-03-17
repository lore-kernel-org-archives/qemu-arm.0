Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46A4FED9F6
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:49:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YX4-0003Tg-Sm; Tue, 17 Mar 2026 13:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YWr-0003Pg-OF
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:48:29 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YWk-00070y-M1
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:48:25 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-1274204434bso145852c88.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769699; x=1774374499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoJVdciZFaewroq0cySKl+vu/S+aD/kerrA4/hB7jSw=;
 b=KZkr2scUo54xUN9lA3vRtfPwnGaFUgdFaNdmYUkhRiWtasMcZJp/Vq5wMMzqVUonPh
 C1cDuE+WJa/BlVdlI33yoeOuNldGFozkjlvJXsNffDmcy1C1rkuCZuq+C+ZGsUQr4S9x
 OGgqjZnN4z9qccQPH7ih2Je8iQqi9rfRk09+eoTyIO9W1/Bz64aWXd5PQj10BmrhuM5Q
 lAYqVDUIQ3EqCtTydbjJbTaouq383Opion5YHFDTbuzrVQMZY0NfxyBY3V/jqC6QDSFz
 UCuc6PmzAakp/TuFN4aM+vfzVifRqiLJKImRkvirkmTj/GgngsZLWXN2BI0kj76AhnaL
 NjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769699; x=1774374499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VoJVdciZFaewroq0cySKl+vu/S+aD/kerrA4/hB7jSw=;
 b=FvQeESZH6XSbJ5SQ131A52uyPpwJNBQq2CLl+YccSTSLW9aMC+AuJYZl8abjCvyO77
 E7WoefyyrLo+ju7NbSR3cczMiff14/dsbTmFMUK8i+ZKXdf9dj8SdbdQ0qXg4fY+O8eN
 xF3LNZmBC0cfGqZ1VkrCrdYTVJd3YBWQLQksd7F/b2VbYf39F99CJsxOh7/7fV9uX1ZD
 a3++0KolRehuNp+mtSBlkjF2x6DKJvqHbMppiYyXWMGFLOo3GCfXGv+9bXhLGgT8sE1T
 z5gN6a3Q5hTvEAVi0KAfpT7V6pcJFCAmcroaHNfUooVUeVpQfgxlw4AeJMEn+y/cibng
 CNfA==
X-Gm-Message-State: AOJu0YymWH/xd2gEXI0I6e+d6KyIEtSTvcGIhdhNbXSqWIyj5d8bf8Jw
 gPDM1dDxn4gQLq3bweZOSjJqBTc4XQyDb9yDnmh7wTE5Tn5GA3AqJziO
X-Gm-Gg: ATEYQzxA8vcrYfamKzs6dD8+GQUx6rVtIE1+U9fSY/p6lT98+UWKUdsqXACtSsdRpnL
 5bJ90kYxTT8e23KWnHkcBbKnV8+HvpEw1p3Cb7VXvPvo7/pI3fcy8wxuiTBhZ7LmvmTm+gmGVfV
 HtlrkdOlTdfC+boz9agIY+6U05AXRdHErAIXfHxSPkXbUEcsgWnJ997Nqwr/FPyUnBFx4yoBZ0d
 7mrCtDWGCSAw+d37hGw0A+BNMw5wgF5tHOWQ7+H/IOJQMyA6BTnnzxxpGc7gD1INZ0QFBVWCyMh
 fftKFUzhPSRk0WQA/+A3wTUt0KOA4YmPR4wwQGSytAAnA1LTXjv020LNK/kMkjl2j2+okWFU4CH
 t2L01yKXy7BXSf51sNETJ6Rs16o7ueilUNSrb1pvH8K85V/ILTG0p6mwICijIyKA9pWa0BLAabG
 wBIA8moJY8GU9Rl4UqjSi9uGXdI50SIalFnTpY45Z5l1Q1UbVkc3lh
X-Received: by 2002:a05:7022:6885:b0:128:cedb:33b0 with SMTP id
 a92af1059eb24-12991046c67mr228677c88.22.1773769699056; 
 Tue, 17 Mar 2026 10:48:19 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-129b4147522sm281844c88.15.2026.03.17.10.48.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:48:18 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, alex.bennee@linaro.org,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 6/6] target/arm/hvf,
 whpx: wire ISV=0 emulation for data aborts
Date: Tue, 17 Mar 2026 14:47:40 -0300
Message-ID: <20260317174740.31674-7-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317174740.31674-1-lucaaamaral@gmail.com>
References: <20260317174740.31674-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x122b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
  4. On success, advance PC past the emulated instruction

If the instruction is unhandled or a memory error occurs, a synchronous
external abort is injected into the guest via syn_data_abort_no_iss()
with fnv=1 and fsc=0x10, matching the syndrome that KVM uses in
kvm_inject_arm_sea().  The guest kernel's fault handler then reports
the error through its normal data abort path.

WHPX adds a whpx_inject_data_abort() helper and adjusts the
whpx_handle_mmio() return convention so the caller skips PC advancement
when an exception has been injected.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/hvf/hvf.c       | 46 ++++++++++++++++++++++++++--
 target/arm/whpx/whpx-all.c | 61 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bb..000e54bd 100644
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
@@ -2175,10 +2176,49 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         assert(!s1ptw);
 
         /*
-         * TODO: ISV will be 0 for SIMD or SVE accesses.
-         * Inject the exception into the guest.
+         * ISV=0: syndrome doesn't carry access size/register info.
+         * Fetch and emulate via target/arm/emulate/.
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
+                bool same_el = arm_current_el(env) == 1;
+                uint32_t esr = syn_data_abort_no_iss(same_el,
+                    1, 0, 0, 0, iswrite, 0x10);
+
+                error_report("HVF: cannot read insn at pc=0x%" PRIx64,
+                             (uint64_t)env->pc);
+                env->exception.vaddress = excp->virtual_address;
+                hvf_raise_exception(cpu, EXCP_DATA_ABORT, esr, 1);
+                break;
+            }
+
+            r = arm_emul_insn(env, insn);
+            if (r == ARM_EMUL_UNHANDLED || r == ARM_EMUL_ERR_MEM) {
+                bool same_el = arm_current_el(env) == 1;
+                uint32_t esr = syn_data_abort_no_iss(same_el,
+                    1, 0, 0, 0, iswrite, 0x10);
+
+                error_report("HVF: ISV=0 %s insn 0x%08x at "
+                             "pc=0x%" PRIx64 ", injecting data abort",
+                             r == ARM_EMUL_UNHANDLED ? "unhandled"
+                                                     : "memory error",
+                             insn, (uint64_t)env->pc);
+                env->exception.vaddress = excp->virtual_address;
+                hvf_raise_exception(cpu, EXCP_DATA_ABORT, esr, 1);
+                break;
+            }
+
+            advance_pc = true;
+            break;
+        }
 
         /*
          * Emulate MMIO.
diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 513551be..0c04073e 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -29,6 +29,7 @@
 #include "syndrome.h"
 #include "target/arm/cpregs.h"
 #include "internals.h"
+#include "emulate/arm_emulate.h"
 
 #include "system/whpx-internal.h"
 #include "system/whpx-accel-ops.h"
@@ -352,6 +353,27 @@ static void whpx_set_gp_reg(CPUState *cpu, int rt, uint64_t val)
     whpx_set_reg(cpu, reg, reg_val);
 }
 
+/*
+ * Inject a synchronous external abort (data abort) into the guest.
+ * Used when ISV=0 instruction emulation fails.  Matches the syndrome
+ * that KVM uses in kvm_inject_arm_sea().
+ */
+static void whpx_inject_data_abort(CPUState *cpu, bool iswrite)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    bool same_el = arm_current_el(env) == 1;
+    uint32_t esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, iswrite, 0x10);
+
+    cpu->exception_index = EXCP_DATA_ABORT;
+    env->exception.target_el = 1;
+    env->exception.syndrome = esr;
+
+    bql_lock();
+    arm_cpu_do_interrupt(cpu);
+    bql_unlock();
+}
+
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     uint64_t syndrome = ctx->Syndrome;
@@ -366,7 +388,40 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
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
+            whpx_inject_data_abort(cpu, iswrite);
+            return 1;
+        }
+
+        r = arm_emul_insn(env, insn);
+        if (r == ARM_EMUL_UNHANDLED || r == ARM_EMUL_ERR_MEM) {
+            error_report("WHPX: ISV=0 %s insn 0x%08x at "
+                         "pc=0x%" PRIx64 ", injecting data abort",
+                         r == ARM_EMUL_UNHANDLED ? "unhandled"
+                                                 : "memory error",
+                         insn, (uint64_t)env->pc);
+            whpx_inject_data_abort(cpu, iswrite);
+            return 1;
+        }
+
+        return 0;
+    }
 
     if (iswrite) {
         val = whpx_get_gp_reg(cpu, srt);
@@ -451,6 +506,10 @@ int whpx_vcpu_run(CPUState *cpu)
             }
 
             ret = whpx_handle_mmio(cpu, &vcpu->exit_ctx.MemoryAccess);
+            if (ret > 0) {
+                advance_pc = false;
+                ret = 0;
+            }
             break;
         case WHvRunVpExitReasonCanceled:
             cpu->exception_index = EXCP_INTERRUPT;
-- 
2.52.0


