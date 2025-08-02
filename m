Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB253C87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:03:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLw3-0002Is-94; Sat, 02 Aug 2025 19:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoS-0005yh-O4
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:03 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoQ-0006Qx-Tz
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:52 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-741a5e8fa94so126845a34.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177929; x=1754782729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lflJ+SmP9/WjBOPLau+3bavo7afA8IIGWLBMr9HKB4c=;
 b=tHevbo9/aQzb/+shwL+6MtCZE24uMlWonxndulCq0V4/h/cWYvTmuT5oPVw21FJNYm
 XNRMaOo6SBVKWkuUc/2BVel1eydGKvSnt//o1luqxNtUL4vF2SFIOG1u2yoTBdbYzz4b
 MfQnI6WWKc50EganVM0jUQ2tbJTfa6G3A6ljoxCTXrcyA005g3+5duZgQJxmB+yJRb1r
 mHB8rEBHyBrNn2MZLfoseCkXUi3Izg8mZPBPk3qR5I4Dp3iVP658NtQpIQ90SUosjuGF
 +/CdSdqQlLb+lZAIWRMpcrw4Neg6Rmp8cfLRXUijGVuV2THnf3IBcWO/oXq99cwEOeKA
 6KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177929; x=1754782729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lflJ+SmP9/WjBOPLau+3bavo7afA8IIGWLBMr9HKB4c=;
 b=KDVJ0k8ObiJQHJijkDbXYXDi/deNnLMrHmyOTvbyPdJMerGnZ2Ale3WPAEdEmUurvO
 NALNkP0k6GQcDm3apuuynFvx+zpLmbIJfxwI1itDoYx7fKFhCbjc2n2z8213ekct5HBr
 Oq2BD2VAXWsSvJHgaTWMk5agdvVd/RFsoWVsyVLwXE6XVDV7yz659M1Gm+otQ5TETFAt
 bPvH3tz9u2+2VSnkeb4hjBNWFrtZ5KxNXEHmru2QyvWbpb3mJmLorKKxqqvUWJiKCIu0
 B1PtPfVQBNsppl+ik6lR0uOTC4RpPUiOsqXO86+tBNx8q2x1NWA+LGzLdRofeQImInhG
 91uA==
X-Gm-Message-State: AOJu0YyVLXJpuRK/Rht9RsSr86D1iIEYJaLFusPjDM48tnEFKxZ6ztEp
 DR7Cv00B3Fgu3Hb9+C2rJnZfPrf3FqY1jlT+tJb6TQS62Ycabjn7pD1hB3OiDGDYbLY=
X-Gm-Gg: ASbGncvKShSmzmoxYkiAbYBtoSVm88Mq+I78K9/BXcB5TosK2nnh0CAof2f+RRmb1BF
 m/AbL5Hwzghxhij7dYZxpRQ7HymVBr5JTBi6AllQTyd+T9FLUUQg1SE2xHewt4TJ7ARSGEZVNBM
 1UObdqKe1ijT36fd/G4pqb/zIca5+ZY6ymhLNxThd3W6Jm5EnEHDKA7AOgHdwjKG14nPQl3HvLM
 X5x4PQH+YMe43W/RBY5N0Je9F/MMO8c+cVQsWz60T432bykKKcE9soS5Nr2dtmyJ9DSAiUpPxp1
 4BPsjL70wVwBkVpSivou9yHxL2rDx6QQb5FgbsxpCOao/TGwxhMHzw6iL9D6TdpsuJh7avIi17M
 y6O07CidGgacX2bnoAzQujxi9IYziFiejSeOVIA4904kFDTSouwVzI4aY1v2My1w=
X-Google-Smtp-Source: AGHT+IHUnvNoLk3MlLa8ec3EshU7F7ZOyeck/zWtKVfShr+3m2JlXLKZvKrO+UmRReCToudBPx5sCA==
X-Received: by 2002:a05:6830:6308:b0:73e:9cdc:a6d3 with SMTP id
 46e09a7af769-7419d24f11emr2553239a34.25.1754177929534; 
 Sat, 02 Aug 2025 16:38:49 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 74/85] linux-user/aarch64: Implement prctls for GCS
Date: Sun,  3 Aug 2025 09:29:42 +1000
Message-ID: <20250802232953.413294-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

This is PR_GET_SHADOW_STACK_STATUS, PR_SET_SHADOW_STACK_STATUS,
and PR_LOCK_SHADOW_STACK_STATUS.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/gcs-internal.h | 38 ++++++++++++
 linux-user/aarch64/target_prctl.h | 96 +++++++++++++++++++++++++++++++
 linux-user/qemu.h                 |  5 ++
 linux-user/syscall.c              | 29 ++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 linux-user/aarch64/gcs-internal.h

diff --git a/linux-user/aarch64/gcs-internal.h b/linux-user/aarch64/gcs-internal.h
new file mode 100644
index 0000000000..e586c7e80e
--- /dev/null
+++ b/linux-user/aarch64/gcs-internal.h
@@ -0,0 +1,38 @@
+/*
+ * AArch64 gcs functions for linux-user
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef AARCH64_GCS_INTERNAL_H
+#define AARCH64_GCS_INTERNAL_H
+
+#ifndef PR_SHADOW_STACK_ENABLE
+# define PR_SHADOW_STACK_ENABLE  (1U << 0)
+# define PR_SHADOW_STACK_WRITE   (1U << 1)
+# define PR_SHADOW_STACK_PUSH    (1U << 2)
+#endif
+
+static inline uint64_t gcs_get_el0_mode(CPUArchState *env)
+{
+    uint64_t cr = env->cp15.gcscr_el[0];
+    abi_ulong flags = 0;
+
+    flags |= cr & GCSCR_PCRSEL ? PR_SHADOW_STACK_ENABLE : 0;
+    flags |= cr & GCSCR_STREN ? PR_SHADOW_STACK_WRITE : 0;
+    flags |= cr & GCSCR_PUSHMEN ? PR_SHADOW_STACK_PUSH : 0;
+
+    return flags;
+}
+
+static inline void gcs_set_el0_mode(CPUArchState *env, uint64_t flags)
+{
+    uint64_t cr = GCSCRE0_NTR;
+
+    cr |= flags & PR_SHADOW_STACK_ENABLE ? GCSCR_RVCHKEN | GCSCR_PCRSEL : 0;
+    cr |= flags & PR_SHADOW_STACK_WRITE ? GCSCR_STREN : 0;
+    cr |= flags & PR_SHADOW_STACK_PUSH ? GCSCR_PUSHMEN : 0;
+
+    env->cp15.gcscr_el[0] = cr;
+}
+
+#endif
diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index ed75b9e4b5..621be5727f 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,8 +6,10 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
+#include "qemu/units.h"
 #include "target/arm/cpu-features.h"
 #include "mte_user_helper.h"
+#include "gcs-internal.h"
 
 static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
@@ -206,4 +208,98 @@ static abi_long do_prctl_get_tagged_addr_ctrl(CPUArchState *env)
 }
 #define do_prctl_get_tagged_addr_ctrl do_prctl_get_tagged_addr_ctrl
 
+static abi_long do_prctl_get_shadow_stack_status(CPUArchState *env,
+                                                 abi_long arg2)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    if (!cpu_isar_feature(aa64_gcs, cpu)) {
+        return -TARGET_EINVAL;
+    }
+    return put_user_ual(gcs_get_el0_mode(env), arg2);
+}
+#define do_prctl_get_shadow_stack_status do_prctl_get_shadow_stack_status
+
+static abi_long gcs_alloc(abi_ulong hint, abi_ulong size)
+{
+    /*
+     * Without softmmu, we cannot protect GCS memory properly.
+     * Make do with normal read/write permissions.  This at least allows
+     * emulation of correct programs which don't access the gcs stack
+     * with normal instructions.
+     */
+    return target_mmap(hint, size, PROT_READ | PROT_WRITE,
+                       MAP_PRIVATE | MAP_ANONYMOUS |
+                       (hint ? MAP_FIXED_NOREPLACE : 0), -1, 0);
+}
+
+static abi_ulong gcs_new_stack(TaskState *ts)
+{
+    /* Use guest_stack_size as a proxy for RLIMIT_STACK. */
+    abi_ulong size = MIN(MAX(guest_stack_size / 2, TARGET_PAGE_SIZE), 2 * GiB);
+    abi_ulong base = gcs_alloc(0, size);
+
+    if (base == -1) {
+        return -1;
+    }
+
+    ts->gcs_base = base;
+    ts->gcs_size = size;
+    return base + size - 8;
+}
+
+static abi_long do_prctl_set_shadow_stack_status(CPUArchState *env,
+                                                 abi_long new_mode)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    TaskState *ts = get_task_state(env_cpu(env));
+    abi_long cur_mode;
+
+    if (!cpu_isar_feature(aa64_gcs, cpu)) {
+        return -TARGET_EINVAL;
+    }
+    if (new_mode & ~(PR_SHADOW_STACK_ENABLE |
+                     PR_SHADOW_STACK_WRITE |
+                     PR_SHADOW_STACK_PUSH)) {
+        return -TARGET_EINVAL;
+    }
+
+    cur_mode = gcs_get_el0_mode(env);
+    if ((new_mode ^ cur_mode) & ts->gcs_el0_locked) {
+        return -TARGET_EBUSY;
+    }
+
+    if (new_mode & ~cur_mode & PR_SHADOW_STACK_ENABLE) {
+        abi_long gcspr;
+
+        if (ts->gcs_base || env->cp15.gcspr_el[0]) {
+            return -EINVAL;
+        }
+        gcspr = gcs_new_stack(ts);
+        if (gcspr == -1) {
+            return -TARGET_ENOMEM;
+        }
+        env->cp15.gcspr_el[0] = gcspr;
+    }
+
+    gcs_set_el0_mode(env, new_mode);
+    arm_rebuild_hflags(env);
+    return 0;
+}
+#define do_prctl_set_shadow_stack_status do_prctl_set_shadow_stack_status
+
+static abi_long do_prctl_lock_shadow_stack_status(CPUArchState *env,
+                                                  abi_long arg2)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    TaskState *ts = get_task_state(env_cpu(env));
+
+    if (!cpu_isar_feature(aa64_gcs, cpu)) {
+        return -EINVAL;
+    }
+    ts->gcs_el0_locked |= arg2;
+    return 0;
+}
+#define do_prctl_lock_shadow_stack_status do_prctl_lock_shadow_stack_status
+
 #endif /* AARCH64_TARGET_PRCTL_H */
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 0b19fa43e6..6f0bfa83db 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -126,6 +126,11 @@ struct TaskState {
     /* Extra fields for semihosted binaries.  */
     abi_ulong heap_base;
     abi_ulong heap_limit;
+#endif
+#if defined(TARGET_AARCH64)
+    vaddr gcs_base;
+    abi_ulong gcs_size;
+    abi_ulong gcs_el0_locked;
 #endif
     abi_ulong stack_base;
     int used; /* non zero if used */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 91360a072c..2f1e881046 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6351,6 +6351,11 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_SME_VL_LEN_MASK  0xffff
 # define PR_SME_VL_INHERIT   (1 << 17)
 #endif
+#ifndef PR_GET_SHADOW_STACK_STATUS
+# define PR_GET_SHADOW_STACK_STATUS  74
+# define PR_SET_SHADOW_STACK_STATUS  75
+# define PR_LOCK_SHADOW_STACK_STATUS 76
+#endif
 
 #include "target_prctl.h"
 
@@ -6397,6 +6402,15 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_sme_set_vl
 #define do_prctl_sme_set_vl do_prctl_inval1
 #endif
+#ifndef do_prctl_get_shadow_stack_status
+#define do_prctl_get_shadow_stack_status do_prctl_inval1
+#endif
+#ifndef do_prctl_set_shadow_stack_status
+#define do_prctl_set_shadow_stack_status do_prctl_inval1
+#endif
+#ifndef do_prctl_lock_shadow_stack_status
+#define do_prctl_lock_shadow_stack_status do_prctl_inval1
+#endif
 
 static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
                          abi_long arg3, abi_long arg4, abi_long arg5)
@@ -6467,6 +6481,21 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             return -TARGET_EINVAL;
         }
         return do_prctl_get_tagged_addr_ctrl(env);
+    case PR_GET_SHADOW_STACK_STATUS:
+        if (arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_get_shadow_stack_status(env, arg2);
+    case PR_SET_SHADOW_STACK_STATUS:
+        if (arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_set_shadow_stack_status(env, arg2);
+    case PR_LOCK_SHADOW_STACK_STATUS:
+        if (arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_lock_shadow_stack_status(env, arg2);
 
     case PR_GET_UNALIGN:
         return do_prctl_get_unalign(env, arg2);
-- 
2.43.0


