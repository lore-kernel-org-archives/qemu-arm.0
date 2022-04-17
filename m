Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1284559lfk;
        Sun, 17 Apr 2022 11:44:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV6OxCHkYiZIdpyRirC7qiA6C3DhSSUj9jFv7FZXIm2zDfTyYBR+Hcuq1KFTV1xe32bOxW
X-Received: by 2002:ae9:ed4b:0:b0:69e:7169:7f35 with SMTP id c72-20020ae9ed4b000000b0069e71697f35mr4031876qkg.69.1650221086172;
        Sun, 17 Apr 2022 11:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650221086; cv=none;
        d=google.com; s=arc-20160816;
        b=eexQTRZVfQEt8khcv/eK5CYXjvIrGsabKtlPcm5pIAsClucJElANJAH2Cxucg7KmcF
         4cYtMD6xsD8Zlxwz/wFAZSUH0PJ0xGFD5AC17M3u9U0vE4TrI2Uf73lN0g8lnLc/eAei
         0hMee/ztkRdJj+th9U/txBJMcngcgXdhm8wI5TQcMFA2BMePr+NeiXUdx26roBrN8TBG
         LDvEWDKDvCHY8ZfSPv84xgSw14Gxv1RXkf3zCX8AxRSVugH4njJbweZghSGDlz8fnuNm
         sC4rzfYEFncxWSC2OUbNNsdNc5QjMI412qpCQml0ZYOHCJYWffCYoklVtIQXLcFikC1E
         7uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WEUJ3ZdOA9PTVRw0mKKElsPVyH1qTnSIppSOTeNDGHQ=;
        b=pVNkr/TDZ7iLDx+7dWmsVi4zs5f4zdGCMiMX1EGfWpAZrLm1dtsdL4hYjSMSTCTClG
         PFRFipZ8MsNKCxN+sYsyq8GN6lMFutb0izQ07Q+VPpFD7gF8E4xAcALBj066ngvgzjkl
         8Voz3jAZ8w81DRiva3p2N81TSC1JifGUcxsN7fFcSAdlip3P2uvKtdImDuRsfIWZel21
         fi57ANWhpTCMfVnvW2jmmNPIOj6po64zu/zFLywrXwCtYxPqJh3ossgJNRm2vQ54g1og
         sn0BqiqugisCh5cSGxCuM9CysvDznrlHETYk2M3Tmn2lkAu/v4bGL5sYJUITwanDrJro
         JzkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sg/tHhaY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05620a240300b0069c7468c579si2835270qkn.440.2022.04.17.11.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sg/tHhaY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9t7-0003RP-Kg
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90T-0004e0-D1
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90R-00044p-Es
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so12268511pja.0
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WEUJ3ZdOA9PTVRw0mKKElsPVyH1qTnSIppSOTeNDGHQ=;
 b=sg/tHhaYw20Yi24QuT+JA7WdAWfTB/c9E+mdzrCNstCM3Gw+MchIIXfTKf/VtswOQ9
 8915hSAumOR7rli6v3TZtkJniUNVCCFShM0suWnlrjmvT6hQGhaVoNgi8+fp8wGUBRuf
 GDJIOmdEM7L2Y3UVjk5s0RQ7DV9mpDG1D4t20nBX2yTJ3htOMjBaGbO553vUjNkWkF3m
 pIMvCjKPOevRkKqXojAZLFaop2wGxuUKDzcOQ7TMw6OUX3rulfU1I1oZcsHV8o0Sdl1H
 xPZ5PDeWBlrL5AKf7peIwacuzyA3/XU43DIR/aPKHOcgHxSonHuacsMfAUBW16/FBWG3
 vd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEUJ3ZdOA9PTVRw0mKKElsPVyH1qTnSIppSOTeNDGHQ=;
 b=yk3fAM3ap4aH2RcTNfO+CB4EGQm06umGOOuXwg1LHoxMvkUOwdmvbvMiGgUf2m1n1X
 +GZ2dnTvge/Kh3DSmZmUNx8ZvSkZpHQiHalcvscq+kg67Vol3djyuc38cH8wpIL4z9V+
 0wsiK8drvQOgPhgck+GPtt+PNGxKmmn+0bvf1Cmqbi5JgsFFs3Y76xVOjI7xW1wvyeT7
 pie3a/CBqrw4zpv0XoN+jwzdaooKFeVQRmq5WFtaK9+EqWycrM5ZO3t/za+PTdXb4UQz
 ZZVU6QHTjjaE/dTbvLTbaW7WdD4MEidBRzyomPiUv56kFBhpFiNFIe0Vy9vn0U1B1DDc
 jsOA==
X-Gm-Message-State: AOAM532G5mODEuM4mWCk3mQtzUrv3T9GgRSIP/b6ODRaIsBJo6L+STaA
 wfCY2WB+QUBVuNxqvEjTFH3jWA==
X-Received: by 2002:a17:903:11c7:b0:151:9769:3505 with SMTP id
 q7-20020a17090311c700b0015197693505mr7727181plh.72.1650217694204; 
 Sun, 17 Apr 2022 10:48:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 51/60] target/arm: Implement virtual SError exceptions
Date: Sun, 17 Apr 2022 10:44:17 -0700
Message-Id: <20220417174426.711829-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l50jYf0zQVkD

Virtual SError exceptions are raised by setting HCR_EL2.VSE,
and are routed to EL1 just like other virtual exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Honor EAE for reporting VSERR to aa32.
---
 target/arm/cpu.h       |  2 ++
 target/arm/internals.h |  8 ++++++++
 target/arm/syndrome.h  |  5 +++++
 target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 40 +++++++++++++++++++++++++++++++++++++++-
 5 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a6d1923a78..b90b6d91bd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -55,6 +55,7 @@
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
+#define EXCP_VSERR          24
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -88,6 +89,7 @@ enum {
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
 #define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_VSERR CPU_INTERRUPT_TGT_INT_0
 
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
diff --git a/target/arm/internals.h b/target/arm/internals.h
index baa2a7e1f4..2e55c9a8ae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -935,6 +935,14 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_cpu_update_vserr: Update CPU_INTERRUPT_VSERR bit
+ *
+ * Update the CPU_INTERRUPT_VSERR bit in cs->interrupt_request,
+ * following a change to the HCR_EL2.VSE bit.
+ */
+void arm_cpu_update_vserr(ARMCPU *cpu);
+
 /**
  * arm_mmu_idx_el:
  * @env: The cpu environment
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 8cde8e7243..0cb26dde7d 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -287,4 +287,9 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_serror(uint32_t extra)
+{
+    return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fc0d74b4d1..20ae69e83b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -85,7 +85,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     return (cpu->power_state != PSCI_OFF)
         && cs->interrupt_request &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
+         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
 
@@ -509,6 +509,12 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
             return false;
         }
         return !(env->daif & PSTATE_I);
+    case EXCP_VSERR:
+        if (!(hcr_el2 & HCR_AMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_A);
     default:
         g_assert_not_reached();
     }
@@ -630,6 +636,17 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             goto found;
         }
     }
+    if (interrupt_request & CPU_INTERRUPT_VSERR) {
+        excp_idx = EXCP_VSERR;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            /* Taking a virtual abort clears HCR_EL2.VSE */
+            env->cp15.hcr_el2 &= ~HCR_VSE;
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+            goto found;
+        }
+    }
     return false;
 
  found:
@@ -682,6 +699,25 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     }
 }
 
+void arm_cpu_update_vserr(ARMCPU *cpu)
+{
+    /*
+     * Update the interrupt level for VSERR, which is the HCR_EL2.VSE bit.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    bool new_state = env->cp15.hcr_el2 & HCR_VSE;
+
+    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VSERR) != 0)) {
+        if (new_state) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VSERR);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6468fed43..7e4178c594 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1864,7 +1864,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    /* External aborts are not possible in QEMU so A bit is always clear */
+    if (hcr_el2 & HCR_AMO) {
+        if (cs->interrupt_request & CPU_INTERRUPT_VSERR) {
+            ret |= CPSR_A;
+        }
+    }
+
     return ret;
 }
 
@@ -5175,6 +5180,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     g_assert(qemu_mutex_iothread_locked());
     arm_cpu_update_virq(cpu);
     arm_cpu_update_vfiq(cpu);
+    arm_cpu_update_vserr(cpu);
 }
 
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -9325,6 +9331,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+            [EXCP_VSERR] = "Virtual SERR",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -9837,6 +9844,31 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         mask = CPSR_A | CPSR_I | CPSR_F;
         offset = 4;
         break;
+    case EXCP_VSERR:
+        {
+            /*
+             * Note that this is reported as a data abort, but the DFAR
+             * has an UNKNOWN value.  Construct the SError syndrome from
+             * AET and ExT fields.
+             */
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
+
+            if (extended_addresses_enabled(env)) {
+                env->exception.fsr = arm_fi_to_lfsc(&fi);
+            } else {
+                env->exception.fsr = arm_fi_to_sfsc(&fi);
+            }
+            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
+            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
+            qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x\n",
+                          env->exception.fsr);
+
+            new_mode = ARM_CPU_MODE_ABT;
+            addr = 0x10;
+            mask = CPSR_A | CPSR_I;
+            offset = 8;
+        }
+        break;
     case EXCP_SMC:
         new_mode = ARM_CPU_MODE_MON;
         addr = 0x08;
@@ -10057,6 +10089,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_VFIQ:
         addr += 0x100;
         break;
+    case EXCP_VSERR:
+        addr += 0x180;
+        /* Construct the SError syndrome from IDS and ISS fields. */
+        env->exception.syndrome = syn_serror(env->cp15.vsesr_el2 & 0x1ffffff);
+        env->cp15.esr_el[new_el] = env->exception.syndrome;
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
     }
-- 
2.25.1

