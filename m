Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709386ejc;
        Thu, 23 Feb 2023 05:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set91tGQLzQ72K7VJAZJHDWlFCGeSMHyO8RDfPGXUOOk1IQG7jt5chm1bGbdCVapXloNf6hw2
X-Received: by 2002:a5d:4a48:0:b0:2c5:598a:dd0f with SMTP id v8-20020a5d4a48000000b002c5598add0fmr10007531wrs.0.1677157867193;
        Thu, 23 Feb 2023 05:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157867; cv=none;
        d=google.com; s=arc-20160816;
        b=NXEkDrFe4+K+kqBgx3iJWQP7gdgPkHCIylQ5Ai0gsGjdwFjR1smNloiznMY/qkS5sd
         z81RQdG6m5Oe2hs9MXj/GIWNG00hBLeawYv17mI9b9o1Jmt9+ReTLX+WojgygAcISumv
         lS9RAYxE5r4Ueq4GitXscVE1/tfjwIPkzUNxOFZaxlgDGwPX/EBGPTg9ZWdvCNqrJiZs
         TkYx/Jl//ZfeZQA8SUN994cpqK3qugcH7fs2tlo2u3+hJSY2dy+tcDWIz7heHzAsF987
         9h1CgXdopj/Hg/oaW+Oi3kEZCDGdqG06b/pvQVLOFmLoz3+hCLHcbTjgTLQLMEiG3hc6
         d0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ltVkXlTcJj+xMHIhuR6EkcSfuzzBhFd48Rnh3Uumkgc=;
        b=wv1+xqZBSog584M+ITm8VokG19BzZ2AoKbuhqlSAr9dgGnNClZTfmuu1GcZvk+6xY3
         Fdvl0JaARUPB7Kzb6KG90TJBz0dPwL4XYntuzb8ThV9z9PO+IOeD0cDJvkAI/sBjbYwI
         I3DMaSF7yS61xIxulQDIBsZYlBQAXOCR1tCGmc/dH57AtLxd3Ou9Dd74sgBpuyTmhUuJ
         qmcJHgO+E1lqQH0Pt7unFA0VVvEKk2w6F+vD7Trt8BZD5MBVRh++wb/zeVK9X8vZMcgY
         YeF9KZhDEjnhJ8+1gaAMWY+VKe9Lsgq+kqb9K0w8jIgAalzRK5MW1YUjETbM0EWLIRvC
         UTgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VVhFfC77;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id z8-20020a5d6548000000b002c54c35c4casi9464655wrv.315.2023.02.23.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:07 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VVhFfC77;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD79D33817;
	Thu, 23 Feb 2023 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltVkXlTcJj+xMHIhuR6EkcSfuzzBhFd48Rnh3Uumkgc=;
	b=VVhFfC77tqPGoS+1tVxocTh5qTJPT0W9/oG6La0OigmLMGcD2JECNmYl+3fXXQO3Df7auT
	1w3uf2WGOKS8fI9AlWACGNdK7Sw4+mtRCtPWl6O7OquSBv7JSQ4VAZ4Cgbi8D1DmiPYAed
	sOvLq8ZaBGsKgg7ioBGZW73UDjZ2rkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157866;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltVkXlTcJj+xMHIhuR6EkcSfuzzBhFd48Rnh3Uumkgc=;
	b=5YKjP9EpkUqPD+knBc0asHLds8zLqKknmfhAqHhcyqJYD1m95lXSpLjuG9Jaxks1X5MoU/
	3dvZXZGdKAHCqfAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3010139B5;
	Thu, 23 Feb 2023 13:11:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WCdhLudl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:03 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 06/20] target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
Date: Thu, 23 Feb 2023 10:08:27 -0300
Message-Id: <20230223130841.25916-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i6gMsTf9vRX3

This is in preparation to moving the hflags code into its own file
under the tcg/ directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c             |  6 +++++-
 hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
 target/arm/arm-powerctl.c |  7 +++++--
 target/arm/cpu.c          |  3 ++-
 target/arm/helper.c       | 18 +++++++++++++-----
 target/arm/machine.c      |  5 ++++-
 6 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..1e021c4a34 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -15,6 +15,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "hw/boards.h"
@@ -827,7 +828,10 @@ static void do_cpu_reset(void *opaque)
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
-        arm_rebuild_hflags(env);
+
+        if (tcg_enabled()) {
+            arm_rebuild_hflags(env);
+        }
     }
 }
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index e54553283f..8e289051a4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,7 @@
 #include "hw/intc/armv7m_nvic.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/tcg.h"
 #include "sysemu/runstate.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
@@ -2454,8 +2455,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
     /* This is UNPREDICTABLE; treat as RAZ/WI */
 
  exit_ok:
-    /* Ensure any changes made are reflected in the cached hflags.  */
-    arm_rebuild_hflags(&s->cpu->env);
+    if (tcg_enabled()) {
+        /* Ensure any changes made are reflected in the cached hflags. */
+        arm_rebuild_hflags(&s->cpu->env);
+    }
     return MEMTX_OK;
 }
 
@@ -2636,11 +2639,14 @@ static void armv7m_nvic_reset(DeviceState *dev)
         }
     }
 
-    /*
-     * We updated state that affects the CPU's MMUidx and thus its hflags;
-     * and we can't guarantee that we run before the CPU reset function.
-     */
-    arm_rebuild_hflags(&s->cpu->env);
+    if (tcg_enabled()) {
+        /*
+         * We updated state that affects the CPU's MMUidx and thus its
+         * hflags; and we can't guarantee that we run before the CPU
+         * reset function.
+         */
+        arm_rebuild_hflags(&s->cpu->env);
+    }
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..326a03153d 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/tcg.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
@@ -127,8 +128,10 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }
 
-    /* CP15 update requires rebuilding hflags */
-    arm_rebuild_hflags(&target_cpu->env);
+    if (tcg_enabled()) {
+        /* CP15 update requires rebuilding hflags */
+        arm_rebuild_hflags(&target_cpu->env);
+    }
 
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index da416f7b1c..0b333a749f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -542,8 +542,9 @@ static void arm_cpu_reset_hold(Object *obj)
     if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
+
+        arm_rebuild_hflags(env);
     }
-    arm_rebuild_hflags(env);
 }
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..af72e6d16c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5173,7 +5173,7 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+    if (tcg_enabled() && ri->type & ARM_CP_SUPPRESS_TB_END) {
         /*
          * Normally we would always end the TB on an SCTLR write; see the
          * comment in ARMCPRegInfo sctlr initialization below for why Xscale
@@ -6841,7 +6841,9 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -9886,7 +9888,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-    if (rebuild_hflags) {
+    if (tcg_enabled() && rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
 }
@@ -10445,7 +10447,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
-    arm_rebuild_hflags(env);
+
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -11001,7 +11006,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-    helper_rebuild_hflags_a64(env, new_el);
+
+    if (tcg_enabled()) {
+        helper_rebuild_hflags_a64(env, new_el);
+    }
 
     env->pc = addr;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index fd6323f6d8..fc4a4a4064 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -871,7 +871,10 @@ static int cpu_post_load(void *opaque, int version_id)
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
+
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(&cpu->env);
+    }
 
     return 0;
 }
-- 
2.35.3
