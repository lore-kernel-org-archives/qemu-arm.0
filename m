Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B5CEFD1E
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 23:19:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdGL4-0005Rx-Ub; Tue, 06 Jan 2026 18:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vdGL2-0005NC-Pi
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 18:19:45 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vdGKy-0001I1-3G
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 18:19:44 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-477632d9326so8846135e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jan 2026 15:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767741575; x=1768346375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oG31mHt5hAIZAFs8E2PvTGlNRu+jO6SBveBnHl2PbaQ=;
 b=KDsowzACBzNDP1btWKFX6Crj4B+d6KUej2Fw5vX6HeA+oN2wYXFarJhxxXkVJAo86d
 razN6GdbmJ06zMrXoGs1kdg1ODDPSNfpgsqdO+Ryb1smFjonw/TX97vvGjnDJxL9YCvh
 FgFZDCHCdQC6r5/QlPtT7Izn+LRi+IoIvbF0hXr9QBTiHDqZvBVuR23x+iDHyUzVds6D
 ANnTwogi8z7bbir+nFV2o2XZrxZiM9JksPUbGt1A7iAgMiOq7gzCcljMa4tWKrpY+bmk
 T0alW2+qNgtzVxkHWh0KLAwzJiGEABQclyfbGEwZ7KUflUCiyDvqEIJGev9xv4jNajD9
 JEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767741575; x=1768346375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oG31mHt5hAIZAFs8E2PvTGlNRu+jO6SBveBnHl2PbaQ=;
 b=MQnykVBYuedtfjlQ+YQGucG6El8mugVzBEQcmKdL/y7/RlBtn95derJHgWC8voeRcj
 tfqgETIZsT+0o1ZK4G/vLr+gcdeGPZ16B+e6QIYZq7f2mkKT0SsXUrxmWF3hhcuQPONh
 +oOmQj08ORMdopLWomV9yw17aqx9wTE4kW4y3inTeGGVmFwiPwWcAr46eS2NFL5ga9bb
 DmwOBLDWgjrtfoIhdhPSi50OuLOuh4torGQXa+VR/Psg63PQ0aHUCDfL8GPR/WFVSEy1
 UKYXMfecwBeifNaEQJ/yG3R+RlFI563CZ5Zv+skmoUTWRzxaHePIn7TLbXZe6X3kXDAu
 1wcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjiIS/g40F6b+f79GMQxhD/Zu4DAFvl/W/E1HuweV+yZrrhyUElkODkv/KsOoNM9DF7d4zLY1gZA==@nongnu.org
X-Gm-Message-State: AOJu0YynFVk5XHnYiRlS9mlIpyaCWCnJnbQYnLzeYrKZuHERDQJ2/HyH
 IITfqc5DJLNBjodkDJONDl60Ia1W/E0VukVuoORmMENwO17kHjdQcTRtfT5WztD2dlQ=
X-Gm-Gg: AY/fxX6zMeIbUQvSy5D/vIOVTbhBiCFmWpNBREQb1gJ6PA07gJXK0rr8i/jCvqj38aI
 e2n2HGwQnC4+SRURgLXVQfgvf7oNKJG+vJQUB9yQ5e1I+gkpNyQLiOMz/Ryf3VRgJb4Rpqx7YgC
 CkK88jhdzS67Qyglzh8B+YSDrkVH3d4suLhB0Drls9snW84ZcipzX1gkRR7HgQJ+r5GTcnqbg7b
 bbGpGXYPlYj7ioesw3Lz24rroj92+UngtlRVTcy7kqsWjU0PlvOz3Bhb5Adjci3UQK5wAI19RMB
 ufkAmUFexknEXHtQJjGBivc6Zewvq2kt5pFNvsUScyziYQpazYjLyuyOrdkbcY+iQrSYKCv5f2B
 4WXqXgSEuAk/GqfoPgsP0d3SwsXlx1bIaY8aozSr4D2q1O4uqStr/jWo6oSMK3ryyoCwamb6qNL
 Fg5Ue3vTYLZd5T9Jlbgl7GLbPAunpcPfhR92tQBjbkc1ZNMc4d5mLSkTNnKFQb
X-Google-Smtp-Source: AGHT+IGBPiN9OqBj4AH4ZXKOokhRaGavV0ccTGCcgU3wTU3oFvnnQPhzCH6bETDOH9hik64M1OyyWw==
X-Received: by 2002:a05:600c:8506:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-47d849bd201mr4901385e9.0.1767741575049; 
 Tue, 06 Jan 2026 15:19:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7faedd57sm27435795e9.5.2026.01.06.15.19.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jan 2026 15:19:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>
Subject: [PATCH 3/5] target/s390x: Restrict WatchPoint API to TCG
Date: Wed,  7 Jan 2026 00:19:05 +0100
Message-ID: <20260106231908.16756-4-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106231908.16756-1-philmd@linaro.org>
References: <20260106231908.16756-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

By inverting the 'tcg_enabled()' check in s390_cpu_set_psw()
we can let the compiler elide the s390_cpu_recompute_watchpoints()
call when TCG is not available. Move it to a TCG specific
file to avoid compiling dead code on KVM. This restricts the
WatchPoint API calls to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h |  1 -
 target/s390x/tcg/tcg_s390x.h  |  4 +++
 target/s390x/cpu.c            | 30 ++++++++++----------
 target/s390x/helper.c         | 38 -------------------------
 target/s390x/tcg/debug.c      | 53 +++++++++++++++++++++++++++++++++++
 target/s390x/tcg/meson.build  |  3 ++
 6 files changed, 75 insertions(+), 54 deletions(-)
 create mode 100644 target/s390x/tcg/debug.c

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 9691366ec91..c4cd17d4d7d 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -317,7 +317,6 @@ void s390_cpu_gdb_init(CPUState *cs);
 void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void do_restart_interrupt(CPUS390XState *env);
 #ifndef CONFIG_USER_ONLY
-void s390_cpu_recompute_watchpoints(CPUState *cs);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
 void s390_handle_wait(S390CPU *cpu);
diff --git a/target/s390x/tcg/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
index 78558912f99..33f26f26c0f 100644
--- a/target/s390x/tcg/tcg_s390x.h
+++ b/target/s390x/tcg/tcg_s390x.h
@@ -21,4 +21,8 @@ G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
 G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
                                           uintptr_t ra);
 
+#ifndef CONFIG_USER_ONLY
+void s390_cpu_recompute_watchpoints(CPUState *cs);
+#endif
+
 #endif /* TCG_S390X_H */
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 6c4198eb1b1..f68b288e364 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -40,6 +40,7 @@
 #include "system/reset.h"
 #endif
 #include "hw/s390x/cpu-topology.h"
+#include "tcg/tcg_s390x.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
@@ -74,26 +75,25 @@ void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
     env->psw.mask = mask;
 
     /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait */
-    if (!tcg_enabled()) {
-        return;
-    }
-    env->cc_op = (mask >> 44) & 3;
+    if (tcg_enabled()) {
+        env->cc_op = (mask >> 44) & 3;
 
 #ifndef CONFIG_USER_ONLY
-    if (is_early_exception_psw(mask, addr)) {
-        env->int_pgm_ilen = 0;
-        trigger_pgm_exception(env, PGM_SPECIFICATION);
-        return;
-    }
+        if (is_early_exception_psw(mask, addr)) {
+            env->int_pgm_ilen = 0;
+            trigger_pgm_exception(env, PGM_SPECIFICATION);
+            return;
+        }
 
-    if ((old_mask ^ mask) & PSW_MASK_PER) {
-        s390_cpu_recompute_watchpoints(env_cpu(env));
-    }
+        if ((old_mask ^ mask) & PSW_MASK_PER) {
+            s390_cpu_recompute_watchpoints(env_cpu(env));
+        }
 
-    if (mask & PSW_MASK_WAIT) {
-        s390_handle_wait(env_archcpu(env));
-    }
+        if (mask & PSW_MASK_WAIT) {
+            s390_handle_wait(env_archcpu(env));
+        }
 #endif
+    }
 }
 
 uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 184428c6d9d..8d1e03f6768 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -143,41 +143,3 @@ void do_restart_interrupt(CPUS390XState *env)
 
     s390_cpu_set_psw(env, mask, addr);
 }
-
-void s390_cpu_recompute_watchpoints(CPUState *cs)
-{
-    const int wp_flags = BP_CPU | BP_MEM_WRITE | BP_STOP_BEFORE_ACCESS;
-    CPUS390XState *env = cpu_env(cs);
-
-    /* We are called when the watchpoints have changed. First
-       remove them all.  */
-    cpu_watchpoint_remove_all(cs, BP_CPU);
-
-    /* Return if PER is not enabled */
-    if (!(env->psw.mask & PSW_MASK_PER)) {
-        return;
-    }
-
-    /* Return if storage-alteration event is not enabled.  */
-    if (!(env->cregs[9] & PER_CR9_EVENT_STORE)) {
-        return;
-    }
-
-    if (env->cregs[10] == 0 && env->cregs[11] == -1LL) {
-        /* We can't create a watchoint spanning the whole memory range, so
-           split it in two parts.   */
-        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags, NULL);
-        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags, NULL);
-    } else if (env->cregs[10] > env->cregs[11]) {
-        /* The address range loops, create two watchpoints.  */
-        cpu_watchpoint_insert(cs, env->cregs[10], -env->cregs[10],
-                              wp_flags, NULL);
-        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags, NULL);
-
-    } else {
-        /* Default case, create a single watchpoint.  */
-        cpu_watchpoint_insert(cs, env->cregs[10],
-                              env->cregs[11] - env->cregs[10] + 1,
-                              wp_flags, NULL);
-    }
-}
diff --git a/target/s390x/tcg/debug.c b/target/s390x/tcg/debug.c
new file mode 100644
index 00000000000..12ae95d4fe8
--- /dev/null
+++ b/target/s390x/tcg/debug.c
@@ -0,0 +1,53 @@
+/*
+ * QEMU S/390 debug routines
+ *
+ * Copyright (c) 2009 Ulrich Hecht
+ * Copyright (c) 2011 Alexander Graf
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ * Copyright (c) 2012 IBM Corp.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/watchpoint.h"
+#include "target/s390x/cpu.h"
+#include "tcg_s390x.h"
+
+void s390_cpu_recompute_watchpoints(CPUState *cs)
+{
+    const int wp_flags = BP_CPU | BP_MEM_WRITE | BP_STOP_BEFORE_ACCESS;
+    CPUS390XState *env = cpu_env(cs);
+
+    /* We are called when the watchpoints have changed. First
+       remove them all.  */
+    cpu_watchpoint_remove_all(cs, BP_CPU);
+
+    /* Return if PER is not enabled */
+    if (!(env->psw.mask & PSW_MASK_PER)) {
+        return;
+    }
+
+    /* Return if storage-alteration event is not enabled.  */
+    if (!(env->cregs[9] & PER_CR9_EVENT_STORE)) {
+        return;
+    }
+
+    if (env->cregs[10] == 0 && env->cregs[11] == -1LL) {
+        /* We can't create a watchoint spanning the whole memory range, so
+           split it in two parts.   */
+        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags, NULL);
+        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags, NULL);
+    } else if (env->cregs[10] > env->cregs[11]) {
+        /* The address range loops, create two watchpoints.  */
+        cpu_watchpoint_insert(cs, env->cregs[10], -env->cregs[10],
+                              wp_flags, NULL);
+        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags, NULL);
+
+    } else {
+        /* Default case, create a single watchpoint.  */
+        cpu_watchpoint_insert(cs, env->cregs[10],
+                              env->cregs[11] - env->cregs[10] + 1,
+                              wp_flags, NULL);
+    }
+}
diff --git a/target/s390x/tcg/meson.build b/target/s390x/tcg/meson.build
index ee4e8fec77c..515cb8b473d 100644
--- a/target/s390x/tcg/meson.build
+++ b/target/s390x/tcg/meson.build
@@ -12,3 +12,6 @@ s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vec_int_helper.c',
   'vec_string_helper.c',
 ))
+s390x_system_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'debug.c',
+))
-- 
2.52.0


