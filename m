Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B5AC44500
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:38:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEcU-0005G0-5t; Sun, 05 Jul 2026 00:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbx-0004n7-44
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbn-00043i-Q3
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cc80b585bfso2696865ad.0
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226254; x=1783831054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOLBFbN0uOhvFbQGnMluLfThJPMU4L7hEEZlVe52VyI=;
 b=J8+4iAwUSOzyiEobgLUyIIP8HviJ3PzRh0Rlyh5fpvpzzAcXox2JhYcIw9V62we0vE
 0649N4GEcAE5dmQY38jXy+OEiREQnNZw2Lf2YEQZTQjkSpaulwNH+DhmqPYeCp0Sk/up
 oNh+5W6E92TwbaKGE1ybyhxeyZRSzHeq8XMNPlLSme08DkAKplM/GMzzDI+kt6naVGUd
 KAk5qZ3G5GxPqRHzK3vgjCYvjW/49vSHfNI/CgXahZJiOL7LIuhdvCU4iqBoaO4yDMjv
 u/rG7JKkB7aINosgK3ElzSBStLhrfwZmB6yoG4i96i6AJh5hVDg9AdWmJ870R00IR4pl
 FNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226254; x=1783831054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HOLBFbN0uOhvFbQGnMluLfThJPMU4L7hEEZlVe52VyI=;
 b=pMPwbtiAZZxKpxOj93mpbSB8RiGrxJ2QsVkg1dZ3Sf6pK0otE0g+jjs3XDMTzQ5rGx
 P5JO6MBdG66Crq6smIHt+oJ759z7WX9m+AyJu51aNgzoBPFVgLCEl5kEaaoACuvz/7v9
 Nhm4W3EJx3WCEMTuixUpdMmUq6PkkTvXiTUePFtH5/p6f02mI+PBDoktPO7SgotqI2un
 OIZsHheTXuOs1Q9sB4vv7FBHu/Q3roWER1CMM71ri7b2t430E9JEKkFIqUhuxqSd5yxD
 jz3oSGiwNLmNa3tOgnhZEYNrYDsZAkDoGVdMXa59wEozh5Rlx5gIqi5FSDQjxeLWmHMC
 jJLw==
X-Gm-Message-State: AOJu0YxsVhDhQ/8wSmiS4bc/Ax5LScTeOYFh9isMhk9SpiXZ+POITJO8
 iHKMD1Ij57ODpN3nCitl43w6m3zMHahcTZh6eLjcM+ahHIVo67kcEjxfW1Bxti/lnT0=
X-Gm-Gg: AfdE7cnX8G/NgAneVPUSGsMye4KUJtbqDBE4dXjhxZrfNgLNe8OIkBYjAXUedVG8du6
 X8OwXtatfzta6ZJOK4uMHWjmq7C95UydSBENlKMBqHRY2A4S6lsvgQyMRRzoz4IfJuSrCwnRXzA
 7Eaf6vXXkzOA+F/kCPyUVJL0gtLKmBrBteEX4p7+d/zm4aHR459Alv2N0wiAx7dnTJhi870Hsk7
 sgdQ4AGo4qSsmyNVgE3wUcguD0F6V7idEhGosxt3bay2oC0bu2Xlu7XHDfDX/GPBxBfYeOytSGn
 iSmeLVfv5S2cb2hwmyvAriWC6tpkQmQ9b/l4aGcwelH49MIMJc7UEv7wdFHg4Ib7Accm8Ne7ckO
 N2yIhU6gqVIg/Ls9GgS6cBgzC2IPRLSW3/ko/WBHXE3xoNjHJYaH6etPvA8dSiGuHChgMJO3cyt
 gtRb9zTBEPfoSN8r22smkf8B2YicRimQgTqJaOuQRdOLULdK0=
X-Received: by 2002:a17:903:2c8:b0:2c8:25c8:85a6 with SMTP id
 d9443c01a7336-2cbb83679b2mr51676015ad.2.1783226254013; 
 Sat, 04 Jul 2026 21:37:34 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 08/46] qemu/typedefs: Declare CPUBreakpoint and
 CPUWatchpoint globally
Date: Sat,  4 Jul 2026 21:36:47 -0700
Message-ID: <20260705043725.1373137-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Adjust all uses of 'struct' in the uses of this type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 8 ++++----
 include/hw/core/cpu.h     | 2 --
 include/qemu/typedefs.h   | 2 ++
 target/arm/cpu.h          | 4 ++--
 target/i386/cpu.h         | 4 ++--
 target/ppc/cpu.h          | 4 ++--
 target/riscv/cpu.h        | 4 ++--
 target/xtensa/cpu.h       | 4 ++--
 target/riscv/debug.c      | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 4a025edc96..1a3391ac09 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -27,20 +27,20 @@ typedef int BreakpointFlags;
 #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
 #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
 
-typedef struct CPUBreakpoint {
+struct CPUBreakpoint {
     vaddr pc;
     BreakpointFlags flags;
     QTAILQ_ENTRY(CPUBreakpoint) entry;
-} CPUBreakpoint;
+};
 
-typedef struct CPUWatchpoint {
+struct CPUWatchpoint {
     vaddr vaddr;
     vaddr len;
     vaddr hitaddr;
     MemTxAttrs hitattrs;
     int flags; /* BP_* */
     QTAILQ_ENTRY(CPUWatchpoint) entry;
-} CPUWatchpoint;
+};
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
                           CPUBreakpoint **breakpoint);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e05e261883..160db776d8 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,8 +84,6 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
     typedef struct ArchCPU CpuInstanceType; \
     OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
 
-typedef struct CPUWatchpoint CPUWatchpoint;
-
 /* see physmem.c */
 struct CPUAddressSpace;
 
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 2344c92182..919fe8ebff 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -39,9 +39,11 @@ typedef struct Chardev Chardev;
 typedef struct Clock Clock;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUArchState CPUArchState;
+typedef struct CPUBreakpoint CPUBreakpoint;
 typedef struct CPUPluginState CPUPluginState;
 typedef struct CPUState CPUState;
 typedef struct CPUTLBEntryFull CPUTLBEntryFull;
+typedef struct CPUWatchpoint CPUWatchpoint;
 typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisasContextBase DisasContextBase;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 84d33e87dc..973522cd55 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -754,8 +754,8 @@ typedef struct CPUArchState {
         ARMVectorReg za[ARM_MAX_VQ * 16];
     } za_state;
 
-    struct CPUBreakpoint *cpu_breakpoint[16];
-    struct CPUWatchpoint *cpu_watchpoint[16];
+    CPUBreakpoint *cpu_breakpoint[16];
+    CPUWatchpoint *cpu_watchpoint[16];
 
     /* Optional fault info across tlb lookup. */
     ARMMMUFaultInfo *tlb_fi;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6a197602d..9dbfa7c9b9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2185,8 +2185,8 @@ typedef struct CPUArchState {
     target_ulong exception_next_eip;
     target_ulong dr[8]; /* debug registers; note dr4 and dr5 are unused */
     union {
-        struct CPUBreakpoint *cpu_breakpoint[4];
-        struct CPUWatchpoint *cpu_watchpoint[4];
+        CPUBreakpoint *cpu_breakpoint[4];
+        CPUWatchpoint *cpu_watchpoint[4];
     }; /* break/watchpoints for dr[0..3] */
     int old_exception;  /* exception in flight */
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 057c54bbb8..d06f3dfd7f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1320,8 +1320,8 @@ struct CPUArchState {
     /* MMU context, only relevant for full system emulation */
 #if defined(TARGET_PPC64)
     ppc_slb_t slb[MAX_SLB_ENTRIES]; /* PowerPC 64 SLB area */
-    struct CPUBreakpoint *ciabr_breakpoint;
-    struct CPUWatchpoint *dawr_watchpoint[2];
+    CPUBreakpoint *ciabr_breakpoint;
+    CPUWatchpoint *dawr_watchpoint[2];
 #endif
     target_ulong sr[32];   /* segment registers */
     uint32_t nb_BATs;      /* number of BATs */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bdd28d329b..9cd38d10a3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -491,8 +491,8 @@ struct CPUArchState {
     uint64_t *tdata1;
     uint64_t *tdata2;
     uint64_t *tdata3;
-    struct CPUBreakpoint **cpu_breakpoint;
-    struct CPUWatchpoint **cpu_watchpoint;
+    CPUBreakpoint **cpu_breakpoint;
+    CPUWatchpoint **cpu_watchpoint;
     QEMUTimer **itrigger_timer;
     int64_t last_icount;
     bool itrigger_enabled;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 442e98bd1b..ab42b4be00 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -545,9 +545,9 @@ struct CPUArchState {
     unsigned static_vectors;
 
     /* Watchpoints for DBREAK registers */
-    struct CPUWatchpoint *cpu_watchpoint[MAX_NDBREAK];
+    CPUWatchpoint *cpu_watchpoint[MAX_NDBREAK];
     /* Breakpoints for IBREAK registers */
-    struct CPUBreakpoint *cpu_breakpoint[MAX_NIBREAK];
+    CPUBreakpoint *cpu_breakpoint[MAX_NIBREAK];
 };
 
 /**
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index b8fea64bec..67c09b1a53 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -1060,8 +1060,8 @@ void riscv_trigger_realize(CPURISCVState *env)
     env->tdata1 = g_new0(uint64_t, env->num_triggers);
     env->tdata2 = g_new0(uint64_t, env->num_triggers);
     env->tdata3 = g_new0(uint64_t, env->num_triggers);
-    env->cpu_breakpoint = g_new0(struct CPUBreakpoint *, env->num_triggers);
-    env->cpu_watchpoint = g_new0(struct CPUWatchpoint *, env->num_triggers);
+    env->cpu_breakpoint = g_new0(CPUBreakpoint *, env->num_triggers);
+    env->cpu_watchpoint = g_new0(CPUWatchpoint *, env->num_triggers);
     env->itrigger_timer = g_new0(QEMUTimer *, env->num_triggers);
 
     for (i = 0; i < env->num_triggers; i++) {
-- 
2.43.0


