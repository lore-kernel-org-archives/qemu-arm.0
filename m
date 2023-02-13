Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546984ejb;
        Mon, 13 Feb 2023 12:32:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8LyV43n/Uvpt79uxXcXcYNNma2BUOJpgVyYUk/WfP2kkm0Xyl99vD2jG+b5A42rYTk0xMQ
X-Received: by 2002:a17:907:a40a:b0:889:5686:486a with SMTP id sg10-20020a170907a40a00b008895686486amr338644ejc.30.1676320337548;
        Mon, 13 Feb 2023 12:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320337; cv=none;
        d=google.com; s=arc-20160816;
        b=gKuYMOZ1pnN462rAaCGaGu4LsdJibdwRGMfxktbV/4Hyg7r6llWaDH8Nv1Tli03GR7
         0607vTDYvYtwKq9RM88JfFcHqSm6MyZRZlJZIRhtd04CHszmeNynVfJAE/wmPp9Rbfjr
         fT0pnsV1B+UUtru38xC1hX+vuVrJy0onokqdRy+cm0kE5JH6wN16qSt6TiOcWSpyUmyd
         WelfTRgOa0hiLM/ftwQJprptQP4hich8ZHEh3Y8zb4wSrF4O9Kot9ThikrfeowKeKkbZ
         A7v/TwBAV7LIhXykqHpJPTr3p8E/9fnJzvZIRbwsmhT3TEZ55+UtXbDjEZxdE7eYgO8n
         LzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=6eyT6RorHdh1FI/2D0u2qY0/HQT+13mX87hP4zUxJTE=;
        b=S+uWUhy/k2q20DzbIoxVXAJ0IyOZaiN/Lp9kvZQSTkiEIKkWCdX5sZAaqkc3WI0u00
         I50Pm9SjCEbe80T4a2fw6UWxfLtozibgzMzafJFLHpddz0KchIcnfOg+lq+TAFiVOnLj
         m61uMQbReI/JZttN7W2MF9CQUdV0CdpRSuOfjV08amOUcmlKLcuOQWtd4amPPonAk3qU
         cWOEqVHOkcApCp+tu0hHyefIfZ4y1a30+X1rmCQJ8SBuGGd2WB+KqL+YYITRmZoiLWTm
         QC4BrgUimiAijrxEy2w1zC8CAgKvKHfme9Iyn8uvfiZHgNPTxQK2c6oBPHJFwrM9GR/u
         LTzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IjjcPwmZ;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id uj42-20020a170907c9aa00b0086a16d93ef4si13402714ejc.119.2023.02.13.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IjjcPwmZ;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3524C22348;
	Mon, 13 Feb 2023 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6eyT6RorHdh1FI/2D0u2qY0/HQT+13mX87hP4zUxJTE=;
	b=IjjcPwmZ4tTHK8BuF2G+ARqbhFgpP0mOxObm80bgsVQByldiY/D8YnkdBc791Gi1hjE+Ra
	bbaHND1GSR6gFCgdevSJ/T1ZjtTWbP/9fAL3Uc/+CrXa5ojMzc/gQDPag8RKqlME2bP71q
	FP34ABdD5l5juD9qY4O03j1SfLDJluU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6eyT6RorHdh1FI/2D0u2qY0/HQT+13mX87hP4zUxJTE=;
	b=RnnYkB3zOSQScaIeNgY44HHVbMuyVnPpr4OZdr2GXM2hzVzc+8u8Okf0t76dqL7FKVE34h
	/HIs95fG2YbX6xAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27E111391B;
	Mon, 13 Feb 2023 20:32:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cAGEN02e6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:13 +0000
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
Subject: [PATCH RESEND v5 12/28] target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
Date: Mon, 13 Feb 2023 17:29:11 -0300
Message-Id: <20230213202927.28992-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rYVrEDeCtMyS

This is in preparation to moving the hflags code into its own file
under the tcg/ directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c             |  6 +++++-
 hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
 target/arm/arm-powerctl.c |  7 +++++--
 target/arm/cpregs.c       |  2 +-
 target/arm/cpu.c          |  3 ++-
 target/arm/helper.c       | 16 ++++++++++++----
 target/arm/machine.c      |  5 ++++-
 7 files changed, 42 insertions(+), 17 deletions(-)

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
index 1f7763964c..74ac8f610c 100644
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
@@ -2466,8 +2467,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
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
 
@@ -2648,11 +2651,14 @@ static void armv7m_nvic_reset(DeviceState *dev)
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
diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index 80a810e641..4b8fbeb7e9 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -5442,7 +5442,7 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+    if (tcg_enabled() && ri->type & ARM_CP_SUPPRESS_TB_END) {
         /*
          * Normally we would always end the TB on an SCTLR write; see the
          * comment in ARMCPRegInfo sctlr initialization below for why Xscale
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d7ceb626f0..ce1a425e10 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -539,8 +539,9 @@ static void arm_cpu_reset_hold(Object *obj)
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
index adbc6a1841..f05a8df7d7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -339,7 +339,9 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 #endif /* TARGET_AARCH64 */
 
@@ -608,7 +610,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-    if (rebuild_hflags) {
+    if (tcg_enabled() && rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
 }
@@ -1167,7 +1169,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
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
@@ -1723,7 +1728,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
