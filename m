Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp172780lfq;
        Fri, 8 Apr 2022 17:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCNWQPoC2avNydVYE++t9h2xk0pARzvQ1ftpqXkd14wxVt/dAFIb+P04lHrjGnKhYOmW/X
X-Received: by 2002:ad4:5761:0:b0:441:3301:66af with SMTP id r1-20020ad45761000000b00441330166afmr18698462qvx.24.1649463101726;
        Fri, 08 Apr 2022 17:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463101; cv=none;
        d=google.com; s=arc-20160816;
        b=lnQ9s/p4FtaQsXuUjmigE4u23J9fEIqMPjmND0/FVP/7Q9a7MonrAGxWXGrrW/2Pak
         9uEmHYdEIKNvRNtYsctRpYEwJcNQW/8zlySqnEct20WWp+MzkKX5lF+ppoCRgqrOreDn
         jtUVdHY2kZLPJkbabk0DpWeKTpe6jYsd/y6sfPscZ7RXcZ7ZPvymuFaE0miq9wUpT77n
         u2DII95Zp0x3OUd45Ogze28InvUzl1t1hsStMnjdVG9Qt2tcYRKm7k5oepGpTqonvu1w
         V3qYUfaAXwudFWLTdtgHOT7hG6zlOPWjtMBkgRCuUiWBJ0i0aQtRAwakn/BGW2lS1r/E
         X+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ift/JdXJdiUN1/9UO2Y1HJ2r6G0V4xUYKPjDXLj7jTI=;
        b=MVjrqTw+E+oTcUq10g61ep2yd61Lq4HHufUE5gRvKBpD+ZYA1H4ebzybgZ0ryKiq+Z
         NS0mbOGFwzRkD+LSKMqVVb4PyzonzaqIS1rmACH4Zc07Yw2FU/NmAct0rjkX3NOL36m0
         Eeb151AmMva8bEa62aZ/IbY6mKRVYHRVS9ZMm6ECqDWlSFYQ59j0g5dvqFmzAgFUDlgl
         Is1SGGL/fXLR00RkFwRdtDdP/U9dRnaaJhMEPjEZDiwhcF5ZwaN+mqhwzeB6u8uXa288
         Uc9kHw/aGBiMqMeVHp4rZzeA7DqqSdo4yHGPzZgaAeuI0F2W+MCQD9CuGFsDHorVVQk+
         hU/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lm2AKhZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a0bce00b0069bdcda143bsi1419936qki.67.2022.04.08.17.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lm2AKhZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyhZ-0006jI-5q
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydy-0008WT-UE
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:59 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydw-0003V4-PV
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n9so9253770plc.4
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ift/JdXJdiUN1/9UO2Y1HJ2r6G0V4xUYKPjDXLj7jTI=;
 b=Lm2AKhZtyXLF8PyBlGCGNV3tUkzaBj0canAptmRvTyzjZ6wNWGD6Q4yuJaoYmfXl/K
 XB498e48LfRfhqmAeD9sqzZ3/8tYxE1Ndqh20Y75ddyFoeDFvl0NMK6B9qaCywjRYDcw
 avPv3/QhijmZev6ETcRfxuquy5hJAJK5HbZMsRbttaafLeTjDM/dbHfnyvenH1L103wX
 f1CCQZ84v+mnvniI+0yE+lZ8kMNzt0qGFy//ShLZ0fXUbaVCv+YPxUYS5AMh+yn3IdVy
 vIAl4Zd5CxkonhPZuKoIxNHTGRhApIN79XXcoPdrelWHhLXdzrHxV/o8H4fwx/nrExwg
 aDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ift/JdXJdiUN1/9UO2Y1HJ2r6G0V4xUYKPjDXLj7jTI=;
 b=IJUQSla4LOIu5pNc1RQ8ObMauexRfI5Rmm0vxNVTbwA4phyRYFt5Z9MwNO272Sq92l
 pM/DglwwvYui5J3n9SkNKlrZyGfr3dX/NC/MrZynhRZsYa15dWcSOoYmaa1LVUlIlY1F
 KznAMStvQ7ZfHYsqWGt3wN2TUj1ne9ZKNZUwWEvpjNG7J8SJZH607f8vypXsaihw3kCL
 C8soGSIGu40vYZwADfdGFgG1CvyxK0rlIz7nwZ4KyXW3UZszy3S+hVi0wZ5v7TkuN3xn
 6zMlPjXkeJr+vGo0HQknhNOAhoLhnHcSUkpYacnQD3FHgOxlFYHOPMBmlrwAuR+ZrKYw
 ud8Q==
X-Gm-Message-State: AOAM531zMbfPEcwTKxLSe089U+jCkMyoE1ZlDPloiIrZmvwpmmRhCdL/
 1YK8IuvFM4xVG9oMYVMD158qPA==
X-Received: by 2002:a17:90b:4c44:b0:1c7:1326:ec90 with SMTP id
 np4-20020a17090b4c4400b001c71326ec90mr24350025pjb.87.1649462875452; 
 Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/16] target/arm: Implement virtual SError exceptions
Date: Fri,  8 Apr 2022 17:07:39 -0700
Message-Id: <20220409000742.293691-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: XOYqMYg9VXwY

Virtual SError exceptions are raised by setting HCR_EL2.VSE,
and are routed to EL1 just like other virtual exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  2 ++
 target/arm/internals.h |  8 ++++++++
 target/arm/syndrome.h  |  5 +++++
 target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 29 ++++++++++++++++++++++++++++-
 5 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 66becc47f2..eb8cb738b5 100644
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
index 596fd53619..25ff9628f6 100644
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
index d815d3a397..1a1b1612a8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -84,7 +84,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     return (cpu->power_state != PSCI_OFF)
         && cs->interrupt_request &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
+         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
 
@@ -508,6 +508,12 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
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
@@ -629,6 +635,17 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
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
@@ -681,6 +698,25 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
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
index 2f6b02af7e..bd1c8e01cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1873,7 +1873,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
 
@@ -5338,6 +5343,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     g_assert(qemu_mutex_iothread_locked());
     arm_cpu_update_virq(cpu);
     arm_cpu_update_vfiq(cpu);
+    arm_cpu_update_vserr(cpu);
 }
 
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -9529,6 +9535,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+            [EXCP_VSERR] = "Virtual SERR",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -10041,6 +10048,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         mask = CPSR_A | CPSR_I | CPSR_F;
         offset = 4;
         break;
+    case EXCP_VSERR:
+        {
+            /* Construct the SError syndrome from AET and ExT fields. */
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
+            env->exception.fsr = arm_fi_to_sfsc(&fi);
+            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
+            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
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
@@ -10261,6 +10282,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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

