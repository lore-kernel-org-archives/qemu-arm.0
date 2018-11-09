Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp123644wrw;
        Fri, 9 Nov 2018 09:36:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5fM9RJapR9aThiw3lFvyeD0nGcneM7D4otG2AdA4Le18C9ZktyT7iuIU8XEISXbqx5MCueS
X-Received: by 2002:ae9:f80f:: with SMTP id x15mr8543642qkh.341.1541785016033;
        Fri, 09 Nov 2018 09:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541785016; cv=none;
        d=google.com; s=arc-20160816;
        b=wIF2DjYXtRNq91I0p2mKBG7QIzSy41GXLm2t2W5O3nLSexlpozwGDXpDucBQhxTKr2
         eA2EhvyYMio8QFV+jF3lbP/Gq2c8u8KRjP5KIVytDx3deXclBhO//CP1sT/bUypaIELf
         /OGsmkYwDMaa0ZzgQ/tgoRbh2ioH4yn7E2DodnFn8PagOEoEnaWIuVyFmVS6ZWzQmz8J
         cZZgCE1JS6ENkhjge5McqI+a/ypIkaLiTAPGAyt07ijZdsXSFIc/kl2snlcwanKLMkys
         lOSlKo3s99DgpcTiq3OZJwAneDjo+y1aQPLnmyoLlYEUejbf2tJCi/jsKHujtND6l/2A
         lAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ObYzzbmzmdWqsRirHZfYYi1kb17kykDLqlyRGJxdafI=;
        b=S6IIQCOk53POsNMNR6E3WnLa/YEb0VSoHOBXYVp4HpVh0wsWybj9zyeKA2Rvr2L4g4
         e0r1Cetw6KCxcwGehwUxuHjF8VpDashmq3GszLMxst3oEbos30ueCiZxIemm4TVT7d8U
         0kywOsrVIamG5mqyqMH3Uu90//PtTGvP26xpHZdQF45+DJv1Se2O/7ssWEygXv+gPlag
         M0H4nPO17LPc1Owt2vykguUWKD+h7TyCmXxlcaMBzVTfRZL3gK6DSdlgMaVlfEcuFydf
         8D2gh7zDn9DfIF95ZOIRtUaNAI68GHv1atIRLxC2AG7y5DyxOyM5gLdKlHdVaPYm3oiB
         Udqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si5641298qkl.183.2018.11.09.09.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 09:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLAiF-0004MQ-GR
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 12:36:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAhd-00041T-4j
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAhb-0001Et-Nt
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:16 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gLAhb-000169-Cs; Fri, 09 Nov 2018 12:36:15 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gLAhJ-0002tE-El; Fri, 09 Nov 2018 17:35:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 17:35:52 +0000
Message-Id: <20181109173553.22341-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181109173553.22341-1-peter.maydell@linaro.org>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Hyp mode R14 is shared with User
 and System
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: unyL8JL9g5tI

Hyp mode is an exception to the general rule that each AArch32
mode has its own r13, r14 and SPSR -- it has a banked r13 and
SPSR but shares its r14 with User and System mode. We were
incorrectly implementing it as banked, which meant that on
entry to Hyp mode r14 was 0 rather than the USR/SYS r14.

We provide a new function r14_bank_number() which is like
the existing bank_number() but provides the index into
env->banked_r14[]; bank_number() provides the index to use
for env->banked_r13[] and env->banked_cpsr[].

All the points in the code that were using bank_number()
to index into env->banked_r14[] are updated for consintency:
 * switch_mode() -- this is the only place where we fix
   an actual bug
 * aarch64_sync_32_to_64() and aarch64_sync_64_to_32():
   no behavioural change as we already special-cased Hyp R14
 * kvm32.c: no behavioural change since the guest can't ever
   be in Hyp mode, but conceptually the right thing to do
 * msr_banked()/mrs_banked(): we can never get to the case
   that accesses banked_r14[] with tgtmode == ARM_CPU_MODE_HYP,
   so no behavioural change

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 16 ++++++++++++++++
 target/arm/helper.c    | 29 +++++++++++++++--------------
 target/arm/kvm32.c     |  4 ++--
 target/arm/op_helper.c |  2 +-
 4 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c2bb2deebd..e5341f21f6f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -145,6 +145,22 @@ static inline int bank_number(int mode)
     g_assert_not_reached();
 }
 
+/**
+ * r14_bank_number: Map CPU mode onto register bank for r14
+ *
+ * Given an AArch32 CPU mode, return the index into the saved register
+ * banks to use for the R14 (LR) in that mode. This is the same as
+ * bank_number(), except for the special case of Hyp mode, where
+ * R14 is shared with USR and SYS, unlike its R13 and SPSR.
+ * This should be used as the index into env->banked_r14[], and
+ * bank_number() used for the index into env->banked_r13[] and
+ * env->banked_spsr[].
+ */
+static inline int r14_bank_number(int mode)
+{
+    return (mode == ARM_CPU_MODE_HYP) ? BANK_USRSYS : bank_number(mode);
+}
+
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96301930cc8..6fb1ddc5506 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6455,13 +6455,14 @@ static void switch_mode(CPUARMState *env, int mode)
 
     i = bank_number(old_mode);
     env->banked_r13[i] = env->regs[13];
-    env->banked_r14[i] = env->regs[14];
     env->banked_spsr[i] = env->spsr;
 
     i = bank_number(mode);
     env->regs[13] = env->banked_r13[i];
-    env->regs[14] = env->banked_r14[i];
     env->spsr = env->banked_spsr[i];
+
+    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
+    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
 }
 
 /* Physical Interrupt Target EL Lookup Table
@@ -8040,7 +8041,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
         if (mode == ARM_CPU_MODE_HYP) {
             env->xregs[14] = env->regs[14];
         } else {
-            env->xregs[14] = env->banked_r14[bank_number(ARM_CPU_MODE_USR)];
+            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
         }
     }
 
@@ -8054,7 +8055,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
         env->xregs[16] = env->regs[14];
         env->xregs[17] = env->regs[13];
     } else {
-        env->xregs[16] = env->banked_r14[bank_number(ARM_CPU_MODE_IRQ)];
+        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
         env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
     }
 
@@ -8062,7 +8063,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
         env->xregs[18] = env->regs[14];
         env->xregs[19] = env->regs[13];
     } else {
-        env->xregs[18] = env->banked_r14[bank_number(ARM_CPU_MODE_SVC)];
+        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
         env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
     }
 
@@ -8070,7 +8071,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
         env->xregs[20] = env->regs[14];
         env->xregs[21] = env->regs[13];
     } else {
-        env->xregs[20] = env->banked_r14[bank_number(ARM_CPU_MODE_ABT)];
+        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
         env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
     }
 
@@ -8078,7 +8079,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
         env->xregs[22] = env->regs[14];
         env->xregs[23] = env->regs[13];
     } else {
-        env->xregs[22] = env->banked_r14[bank_number(ARM_CPU_MODE_UND)];
+        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
         env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
     }
 
@@ -8095,7 +8096,7 @@ void aarch64_sync_32_to_64(CPUARMState *env)
             env->xregs[i] = env->fiq_regs[i - 24];
         }
         env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
-        env->xregs[30] = env->banked_r14[bank_number(ARM_CPU_MODE_FIQ)];
+        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
     }
 
     env->pc = env->regs[15];
@@ -8145,7 +8146,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         if (mode == ARM_CPU_MODE_HYP) {
             env->regs[14] = env->xregs[14];
         } else {
-            env->banked_r14[bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
+            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
         }
     }
 
@@ -8159,7 +8160,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         env->regs[14] = env->xregs[16];
         env->regs[13] = env->xregs[17];
     } else {
-        env->banked_r14[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
         env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
     }
 
@@ -8167,7 +8168,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         env->regs[14] = env->xregs[18];
         env->regs[13] = env->xregs[19];
     } else {
-        env->banked_r14[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
         env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
     }
 
@@ -8175,7 +8176,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         env->regs[14] = env->xregs[20];
         env->regs[13] = env->xregs[21];
     } else {
-        env->banked_r14[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
         env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
     }
 
@@ -8183,7 +8184,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         env->regs[14] = env->xregs[22];
         env->regs[13] = env->xregs[23];
     } else {
-        env->banked_r14[bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
         env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
     }
 
@@ -8200,7 +8201,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
             env->fiq_regs[i - 24] = env->xregs[i];
         }
         env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
-        env->banked_r14[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
     }
 
     env->regs[15] = env->pc;
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 0f1e94c7b5e..cb3fb73a961 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -318,8 +318,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
     }
     env->banked_r13[bn] = env->regs[13];
-    env->banked_r14[bn] = env->regs[14];
     env->banked_spsr[bn] = env->spsr;
+    env->banked_r14[r14_bank_number(mode)] = env->regs[14];
 
     /* Now we can safely copy stuff down to the kernel */
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
@@ -430,8 +430,8 @@ int kvm_arch_get_registers(CPUState *cs)
         memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
     }
     env->regs[13] = env->banked_r13[bn];
-    env->regs[14] = env->banked_r14[bn];
     env->spsr = env->banked_spsr[bn];
+    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
 
     /* VFP registers */
     r.id = KVM_REG_ARM | KVM_REG_SIZE_U64 | KVM_REG_ARM_VFP;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 90741f6331d..2b62c53f5b5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -694,7 +694,7 @@ void HELPER(msr_banked)(CPUARMState *env, uint32_t value, uint32_t tgtmode,
         env->banked_r13[bank_number(tgtmode)] = value;
         break;
     case 14:
-        env->banked_r14[bank_number(tgtmode)] = value;
+        env->banked_r14[r14_bank_number(tgtmode)] = value;
         break;
     case 8 ... 12:
         switch (tgtmode) {
-- 
2.19.1

