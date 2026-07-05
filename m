Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B16C44501
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:45:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdp-00087e-Ox; Sun, 05 Jul 2026 00:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcI-00054L-Nr
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:07 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc0-0004Gi-FS
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c9b1edf2bdso19453555ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226267; x=1783831067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4K8RhxfUacDFKhHYVq83mau4+fuBNq23ZKV7DxrKlc=;
 b=JqIIH0xvJUuj0PZb7pAIjQs08WClc6QUfiVN2ofEpufs+8sCDHVKaok8YMD9JofRMB
 o43SdnVkuoBuKZ7814aqAkAVsJfs1ITPP95FAHgBxSmAZtjnxLPjmc9bZi0rYEPXgdc1
 T2QJXSGIEuhmX695Ho4+laau0gpkSL1JICNVfKIkSN9+lxwotGZCx+9IRslAnIHsmNXc
 rdjEvqKLE37iJcGUfKdTpfEiPmyhjFO3lc3uO8Cz0BDQ8XHqzj5ToPzFlzhHsaEF4dek
 A8Dn4DhgQPokhHLgFSbLZQO7ddH+0TCwkjxiLqjcYmyu4nfP3yu5qXBxQyYGETqmJDNy
 h6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226267; x=1783831067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e4K8RhxfUacDFKhHYVq83mau4+fuBNq23ZKV7DxrKlc=;
 b=Bhh0MCtnTHTf3wYirppZN2uVeRi+FJYZBpUh9qInr3kZG+PVbvpieFv9LbnA/+RDEC
 o7TUyBE1tSDWUMKp7z9z0Eg2Is21/WfahUWkqKoWAqlE4ZmgpsXHA4dD99zVNnJOHDFq
 kLtxK6pQ5TBCb//I6KeTRe7C9B3ZICTnYUx/luDYdTerJ9hNiiXhaPEbJk+srj81YpwW
 vBjQFvflndPFxkLKd+Ja0vCV6b4Nhcfrv1lP1fAF1cOLIqnXts+HYSwoZmddoQ5STA8f
 nTqgXiRAFo+ih2fBdMdbaWemIWqNskkWy+NP47XTmSgZAuFqyM08EDg8LjWVsA6mRK1/
 oJ8A==
X-Gm-Message-State: AOJu0YxbBJHO/jPlQvueCTPCBDrOOIN+XnvWKVaZo5lwH+eN5Mef6bjK
 fZoztNwVtB+alC8SM/rBeHaF95LhT7bB/m2Z5lDsUe8eh+bkO2w4iXPsdxbJX2Xf3/0=
X-Gm-Gg: AfdE7cl2MTT0UL1jKLiuQrn8YNSklGHX6NlPPnjFJhEnA6rPl98X3CPYSGriFiBWT7o
 R3e/5ExWzwi4tvt2CvtDwA3Gy6Gv2E5hfXbvaVlAEKlLOhGgNjlBp25PznBPBtIoWYhSEowOFeY
 5v37NIsnD33eg0wRBOTYwGaq1kNT+F8we5OLNjsmsWsuMh/WD79ZlBS9lDt5UJXgxq+EIF/Djg8
 TvaC18RelqmcodH2IaohqUlMyccB6+7eBbLLbZXhU9+V9+RbClSTfifrLxdxSPt6F6ZP7hVikt5
 QTABDiZL9zGo46GNsxRlRD2wpPfN4JJnCe5Ck95waA2Pq8YHr9G+NT58pwNiZQtl0L6jM77GKzv
 +hHH+DB7mqPSB+wk7lFTrOgWC/DXOrX1W7GBBggS818FvenToMeXVgPxY0gx258L1xBrs2HsFTX
 arcYj9+kvcX7QOkGZFmEoolY4TvQsQQ3+Tc8Vqvz+5KypraSA=
X-Received: by 2002:a17:902:d585:b0:2c7:f2c6:89e0 with SMTP id
 d9443c01a7336-2cb97e5405emr54895295ad.4.1783226266934; 
 Sat, 04 Jul 2026 21:37:46 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 23/46] exec/breakpoint: Return the new bp from
 cpu_breakpoint_insert
Date: Sat,  4 Jul 2026 21:37:02 -0700
Message-ID: <20260705043725.1373137-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

The cpu_breakpoint_insert function cannot fail, so the error
return value isn't actually used.  Instead of returning the
new breakpoint by reference, return it directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h           |  4 ++--
 accel/tcg/tcg-accel-ops.c           |  7 ++-----
 cpu-common.c                        | 11 +++--------
 gdbstub/user.c                      |  8 ++------
 linux-user/main.c                   |  2 +-
 target/arm/tcg/debug.c              |  2 +-
 target/i386/tcg/system/bpt_helper.c |  3 +--
 target/ppc/cpu.c                    |  2 +-
 target/riscv/debug.c                |  5 ++---
 target/xtensa/dbg_helper.c          |  6 +++---
 10 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 3ea6e26fa4..90bfe5e237 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -41,8 +41,8 @@ struct CPUWatchpoint {
     unsigned id;
 };
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          unsigned id, CPUBreakpoint **breakpoint);
+CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
+                                     BreakpointFlags flags, unsigned id);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 37cdd354f0..9d9ecf542c 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -141,12 +141,9 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
-            if (err) {
-                break;
-            }
+            cpu_breakpoint_insert(cpu, addr, BP_GDB, 0);
         }
-        return err;
+        return 0;
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
diff --git a/cpu-common.c b/cpu-common.c
index 0287022de4..fcc9bc77a3 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -405,8 +405,8 @@ bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
 }
 
 /* Add a breakpoint.  */
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          unsigned id, CPUBreakpoint **breakpoint)
+CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
+                                     BreakpointFlags flags, unsigned id)
 {
     CPUBreakpoint *bp;
 
@@ -422,13 +422,8 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
     bp->id = id;
 
     interval_tree_insert(&bp->itree, &cpu->breakpoints);
-
-    if (breakpoint) {
-        *breakpoint = bp;
-    }
-
     trace_breakpoint_insert(cpu->cpu_index, pc, flags);
-    return 0;
+    return bp;
 }
 
 /* Remove a specific breakpoint.  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index abcb2ec5f0..9abe42280e 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -806,18 +806,14 @@ bool gdb_supports_guest_debug(void)
 int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
-    int err = 0;
 
     switch (type) {
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
-            if (err) {
-                break;
-            }
+            cpu_breakpoint_insert(cpu, addr, BP_GDB, 0);
         }
-        return err;
+        return 0;
     default:
         /* user-mode doesn't support watchpoints */
         return -ENOSYS;
diff --git a/linux-user/main.c b/linux-user/main.c
index 4372d0b5a6..54d39627f6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -265,7 +265,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
              n = interval_tree_iter_next(n, 0, -1)) {
             CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
             cpu_breakpoint_insert(new_cpu, bp->itree.start,
-                                  bp->flags, bp->id, NULL);
+                                  bp->flags, bp->id);
         }
     }
 
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index daad2ac440..2c73ca1080 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -685,7 +685,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
         return;
     }
 
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, n, &env->cpu_breakpoint[n]);
+    env->cpu_breakpoint[n] = cpu_breakpoint_insert(CPU(cpu), addr, flags, n);
 }
 
 void hw_breakpoint_update_all(ARMCPU *cpu)
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 662ffbacfc..23f2d05126 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -62,8 +62,7 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU, index,
-                                        &env->cpu_breakpoint[index]);
+            env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, drN, BP_CPU, index);
         }
         break;
 
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index cf4d97285e..c91e60940a 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -121,7 +121,7 @@ void ppc_update_ciabr(CPUPPCState *env)
     }
 
     if (priv) {
-        cpu_breakpoint_insert(cs, ciea, BP_CPU, 0, &env->ciabr_breakpoint);
+        env->ciabr_breakpoint = cpu_breakpoint_insert(cs, ciea, BP_CPU, 0);
     }
 }
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 56ae1e6107..d6bba24c81 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -488,7 +488,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, 0, &env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, addr, flags, 0);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -613,8 +613,7 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE6_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, index,
-                              &env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, addr, flags, index);
     }
 
     if (ctrl & TYPE6_LOAD) {
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index b08bd03435..9df0c519b3 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -42,8 +42,8 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
     for (i = 0; i < env->config->nibreak; ++i) {
         if (change & (1 << i)) {
             if (v & (1 << i)) {
-                cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
-                                      BP_CPU, i, &env->cpu_breakpoint[i]);
+                env->cpu_breakpoint[i] =
+                    cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i], BP_CPU, i);
             } else {
                 cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
                 env->cpu_breakpoint[i] = NULL;
@@ -59,7 +59,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
         CPUState *cs = env_cpu(env);
 
         cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
-        cpu_breakpoint_insert(cs, v, BP_CPU, i, &env->cpu_breakpoint[i]);
+        env->cpu_breakpoint[i] = cpu_breakpoint_insert(cs, v, BP_CPU, i);
     }
     env->sregs[IBREAKA + i] = v;
 }
-- 
2.43.0


