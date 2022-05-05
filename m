Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1303099lfj;
        Thu, 5 May 2022 12:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEYAKFeb6otj6sNRmb5H2jZWmIfcjahbCLM9Et/lJQ/QmjGKKl+IUVA37ZYiwww0GVl5Ve
X-Received: by 2002:a05:622a:5d1:b0:2f3:c5fc:68fc with SMTP id d17-20020a05622a05d100b002f3c5fc68fcmr8675qtb.284.1651778454026;
        Thu, 05 May 2022 12:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778454; cv=none;
        d=google.com; s=arc-20160816;
        b=0C7U6V0xdHMRnnqpz2EW2YvjBFyBmtpFegdSp6sHhXfR2wTYtHI0Z7QKF/QTHyHsbb
         y67sZ42HStdp+sNFiRgwJzMydLrPHIVFLT02FHWqwFUOCxHU52MiaHBWf//r9Dk02qzO
         GG6cOaidFbS3NzddReDiVw6pqAmQOufIo9h1zH7+WDa5yS08FqNwYBHi8Sj3PwKU+8rm
         Aed/Nh5P/H4sQj3Lcmw2klxUqp+CETW9fQfXoqWh9z9N7lnyXPnwyGYzAK3OBv0Pde22
         c6yk3HtNHEekJdBvg9cRn7hcIu05tM1x8dwg77oKpSnupiB9WzQtZW3NKEppFl1MdTLt
         pttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MSyilv8jVM9t8fnclodxH6fJ9HoPV9SxyemQYeCb+qg=;
        b=eCbRo7i7KYAZPra1MGntcQ6yjcy/IWV0nlNzhDttENB2Cu/KIibIm4oRFQkNiJ/+yM
         nMBIEqhhOPigRq2u7FOSKg/SXJlaJKj92/eEzobJ9PSWy7n6Fk9C8K0snr75YpYCuJxw
         iTiO5ilVkUHR5MBWlOG6DZm/UveHc56tVBFFQVZ46TAJXYRSWMY/EW/qvXzNW1FXQX2g
         PUZmoShU5Nu0E6h8Vcl4eOi1sCCUR0PJ4ymkwGBMpYy7HFQjsBsl6GinUotk1p7tufDC
         Ukupxt4SH/FC/OMwq38qxqmKSi1/d9oNtAEGQGKi4HyC3bR31EWf68jBP0q62W9q7afk
         dBhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7YTC0XB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o193-20020a37a5ca000000b0069f9b071230si1247522qke.182.2022.05.05.12.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T7YTC0XB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh1x-000507-DH
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYd-00030P-42
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:35 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYZ-0004Mr-EO
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:34 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r185so435403oih.5
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSyilv8jVM9t8fnclodxH6fJ9HoPV9SxyemQYeCb+qg=;
 b=T7YTC0XBYMOF8Mbn4s4wHWKiO6W04GiSBp0/5cGx/cSTh99RtpDxXn+Bm9nAjQiELt
 6w9U6n96wMRoygA8UwGuUyZRAJJGSOQCxYR7klTh0auNQNeVT0bMbPZCIYP8FSKDRC7N
 qloZBNbHu5Fx6Mz4qItTQtT7Y6iVc0Ff5mqb0j0NGihvlWiRUt0RmB9pla6dpxdCR71T
 qGtgIwOV7MjDYhJIIHS1eZ/LpKoCFkCITY4Jsw6uWmYG2vr9hSjkBDqwDJeAweBuNWWW
 SKE08SMZUD5A0fzHuNvgDwQ1V75Q6cqoh7p20tzqqsMn5+6dXC7dgJDJu/rKcPsNtrF3
 4aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSyilv8jVM9t8fnclodxH6fJ9HoPV9SxyemQYeCb+qg=;
 b=emn/97mFjcwXAhsBdsv2XawbrA8HmOKvnM7qybWKqHM2Cw+xj7127bcL04ILnudkhK
 NMIbxXhXt2m75yawr6XuVJ/9kn/TAKwwOVLHrPa3MbCZKrFDXhq315Zz+ppfFMxo2vPY
 1SIRddLA8+m2LZjF3Y8NXOdALnDKgGp8K6v6auoZEI84G1Hsy9Gj809GEmDYeqNSHyOY
 V+5zFLWdHEvxbxcCdh86nkYMn3shpyo9q3SJGGyJKHey0DKnmnOnobOa1nzk0DPFlezK
 do7WJbBRzp6t+SxK6aTtaYN+72Td2CzDad9PZxqdpCwQGvK/Is9SRDlvVoTxek81U/s8
 7cDA==
X-Gm-Message-State: AOAM5311A9xdUUzhV5dc/RF2VmoKrElYoY3pDD27Qkfpx6GEFW2ZjEtI
 0epLv3HUSeD61GhWrzh2/w+9hA==
X-Received: by 2002:a05:6808:140a:b0:326:5fa8:a66b with SMTP id
 w10-20020a056808140a00b003265fa8a66bmr3268530oiv.164.1651776630621; 
 Thu, 05 May 2022 11:50:30 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 15/24] target/arm: Implement virtual SError exceptions
Date: Thu,  5 May 2022 13:49:57 -0500
Message-Id: <20220505185006.200555-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n1Ryb4N7wJ+l

Virtual SError exceptions are raised by setting HCR_EL2.VSE,
and are routed to EL1 just like other virtual exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index a55980d66d..aade9237bd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -56,6 +56,7 @@
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
+#define EXCP_VSERR          24
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -89,6 +90,7 @@ enum {
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
 #define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_VSERR CPU_INTERRUPT_TGT_INT_0
 
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c563b3735f..6ca0e95746 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -947,6 +947,14 @@ void arm_cpu_update_virq(ARMCPU *cpu);
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
index 2667aaf28b..652a84cf84 100644
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
 
@@ -511,6 +511,12 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
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
@@ -632,6 +638,17 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
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
@@ -684,6 +701,25 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
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
index b6faebf4a7..4857d2dbb8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1863,7 +1863,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -9331,6 +9337,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+            [EXCP_VSERR] = "Virtual SERR",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -9843,6 +9850,31 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
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
@@ -10063,6 +10095,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
2.34.1

