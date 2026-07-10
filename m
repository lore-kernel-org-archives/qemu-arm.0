Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F89C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIEo-0001F1-7p; Fri, 10 Jul 2026 16:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEl-0001BW-LZ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEe-0000do-2u
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8484a0b998fso2000476b3a.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716851; x=1784321651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5Sl9CN/SnyE3WUHBhyqJEZay/mST/u8iTGy3+RgSrEA=;
 b=tRm92BI1vqqrL39ziWegKow6j+2YDaxNoSjL3xAdqmTrO47+8czJNZb4OE7QZtGsnQ
 0ix9CbPe8C1cnEfPvD15eBjOxkUbX8pwsSJPznE3FspOWFdJikfgD3G0C8nJ3jMS/tT2
 fmUHGpJMoNFDypJwUU9KzGJyJd+mRN2vsHHLePxlSc4gnk6GS1F4S/+Hv48gesxBBS/N
 wmnvM4r/AVVUMRIiUXUQ3TxCUJAk75kGiNEeJzTBNOSlgYXSZMjoG97MOcSHI9L5IYek
 Gwn6NuhiFBrt/BlAwT1/hOtztI22xCA6bmAhSiMQ+r7Q97M3eORz3OOAHopvS/5wEF04
 UDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716851; x=1784321651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5Sl9CN/SnyE3WUHBhyqJEZay/mST/u8iTGy3+RgSrEA=;
 b=FUijXJqxHPUEUbIUIaFtmr9XYJD6u1ScudjYgKYyGqcA+1CkQweEsO3ZOpt/cssNMm
 Ipkzt+jfGVTxo6/0rRzhvNiftZOqw1O0VkQDY373RtI3/CVkgRrPXkjadXdgB073P44a
 ahCqjBqhPydLI4o07krp+eMHfO7cY/EVs6Ei5FZbCGyGQW/bZgRcHS2+RMzYYxPeBBI+
 0u0z4ysaRYHpk5MBjOI7CPLXFlPqb8ShNHaazCX4YUzJOBDXotxHdL/NenxCWz5g+cxg
 nHEGFpUafdQvTqkNb3Rhx3SHLKFAzNUkkKJBsxfQACXmK9U7qOFUnlYRcd1tGduQEuwh
 dU4w==
X-Gm-Message-State: AOJu0YzDIrwLoNASurO4CrLrCcGoUJYR7JNefvrb0fbVb2qVdltaSqx6
 a00p19Ca/9T4hjWNzjO0vH4co1DRbBIN4ShQ01TXvB0uXhg+3QSxJp+I1plJYS+26B0=
X-Gm-Gg: AfdE7cmbIiIsrPUZjA4akuEveIAg3OO9vnlFAYHUwASOvyOeGvLgnH1brv91d1/XkFF
 b+NQFnaMZMBd9rIpsvnKsnZ+Afqq5Yjr9sAmJYQCezmQPCnDfrL0LNVOYGFs+SqbY6O6TRAC0ku
 2QJyMUh1aFq+T7FawattcvIkzs6H2RYGLECqeU8XUwljCGbp27I7cjZnMSjPPBrJmt0e/sV11wM
 MThlwzER3wOylXvYhqRHzEe3SY/RQ5+htJmTO/wH1Ug1sEHDbQGm6OFVctAEbHSeu80s7O4h0o2
 dGMq6sucqUntqc6lgtKn7Xnp/xh7bBx+NAs6I25NfvaFy9oW7hYrROb9KV1DT3D/7BiPQPHPVvf
 tkxUBvz9l78bVUGzRJErdPcgH1MTjyjyJ5wEP2Fd5vRqugflDtDVaS9LX8kGi2RIUjo/whM7/d0
 T+EBFK3IkRqsuZuahohw==
X-Received: by 2002:a05:6a00:234b:b0:845:d284:9e14 with SMTP id
 d2e1a72fcca58-84889758af8mr621526b3a.59.1783716850689; 
 Fri, 10 Jul 2026 13:54:10 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 06/51] exec/breakpoint: Add CPUBreakpoint.id
Date: Fri, 10 Jul 2026 13:53:16 -0700
Message-ID: <20260710205401.836304-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Add an identifier for use by targets with BP_CPU.  For all targets
the index of the hardware breakpoint resource is to hand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h           | 3 ++-
 accel/tcg/tcg-accel-ops.c           | 2 +-
 cpu-common.c                        | 3 ++-
 gdbstub/user.c                      | 2 +-
 linux-user/main.c                   | 2 +-
 target/arm/tcg/debug.c              | 2 +-
 target/i386/tcg/system/bpt_helper.c | 2 +-
 target/ppc/cpu.c                    | 2 +-
 target/riscv/debug.c                | 5 +++--
 target/xtensa/dbg_helper.c          | 4 ++--
 10 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index f1186b909f..588ff13fe1 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -31,6 +31,7 @@ typedef uint32_t BreakpointFlags;
 struct CPUBreakpoint {
     vaddr pc;
     BreakpointFlags flags;
+    unsigned id;
     QTAILQ_ENTRY(CPUBreakpoint) entry;
 };
 
@@ -44,7 +45,7 @@ struct CPUWatchpoint {
 };
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint);
+                          unsigned id, CPUBreakpoint **breakpoint);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 76af8d67c0..88d0c093eb 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -137,7 +137,7 @@ static int tcg_insert_gdbstub_breakpoint(CPUState *cs, GdbBreakpointType type,
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
+            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
             if (err) {
                 break;
             }
diff --git a/cpu-common.c b/cpu-common.c
index af64bb1126..9476bb612a 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -406,7 +406,7 @@ bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
 
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint)
+                          unsigned id, CPUBreakpoint **breakpoint)
 {
     CPUBreakpoint *bp;
 
@@ -418,6 +418,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
 
     bp->pc = pc;
     bp->flags = flags;
+    bp->id = id;
 
     /* keep all GDB-injected breakpoints in front */
     if (flags & BP_GDB) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 0a61bd7d92..ed0e88d169 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -801,7 +801,7 @@ int gdb_breakpoint_insert(CPUState *cs, GdbBreakpointType type,
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
+            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
             if (err) {
                 break;
             }
diff --git a/linux-user/main.c b/linux-user/main.c
index c08c73fd80..83b9c88ac4 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -260,7 +260,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, 0, NULL);
     }
 
     return new_env;
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index f245d5b072..73d694ca4f 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -726,7 +726,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
         return;
     }
 
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
+    cpu_breakpoint_insert(CPU(cpu), addr, flags, n, &env->cpu_breakpoint[n]);
 }
 
 void hw_breakpoint_update_all(ARMCPU *cpu)
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 0ba2f01016..d847d77d71 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -62,7 +62,7 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU,
+            err = cpu_breakpoint_insert(cs, drN, BP_CPU, index,
                                         &env->cpu_breakpoint[index]);
         }
         break;
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 7ff352b11b..020c8126b3 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -121,7 +121,7 @@ void ppc_update_ciabr(CPUPPCState *env)
     }
 
     if (priv) {
-        cpu_breakpoint_insert(cs, ciea, BP_CPU, &env->ciabr_breakpoint);
+        cpu_breakpoint_insert(cs, ciea, BP_CPU, 0, &env->ciabr_breakpoint);
     }
 }
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 67c09b1a53..bf9accf6e8 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -488,7 +488,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
+        cpu_breakpoint_insert(cs, addr, flags, 0, &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -613,7 +613,8 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE6_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
+        cpu_breakpoint_insert(cs, addr, flags, index,
+                              &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE6_LOAD) {
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index e180096b42..4cf147bbfb 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -43,7 +43,7 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
         if (change & (1 << i)) {
             if (v & (1 << i)) {
                 cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
-                                      BP_CPU, &env->cpu_breakpoint[i]);
+                                      BP_CPU, i, &env->cpu_breakpoint[i]);
             } else {
                 cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
                 env->cpu_breakpoint[i] = NULL;
@@ -59,7 +59,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
         CPUState *cs = env_cpu(env);
 
         cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
-        cpu_breakpoint_insert(cs, v, BP_CPU, &env->cpu_breakpoint[i]);
+        cpu_breakpoint_insert(cs, v, BP_CPU, i, &env->cpu_breakpoint[i]);
     }
     env->sregs[IBREAKA + i] = v;
 }
-- 
2.43.0


