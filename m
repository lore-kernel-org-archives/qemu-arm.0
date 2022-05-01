Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp464474lfu;
        Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:1dc:4aeb:be5d with SMTP id kb10-20020a17090ae7ca00b001dc4aebbe5dmr1880013pjb.185.1651384233892;
        Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384233; cv=none;
        d=google.com; s=arc-20160816;
        b=OvMiKWk6ARa06QfRRhEfhFNqL9f+zDmn8AhXRbd3RqPwtHzrVeQtREcC+SGDJnVhsW
         oRXL014Su5ICDiRcR0ulRchmNJ2sotvejr9D20IzjZnGuiP81XvLFKnohQQWiiVxXNJ/
         yq7PrA0MYMCNTCA1vMejZ0mwU2+53XfMD56XqZFCVO/VDrTKpXu1GIdfc2gY4BKEa6lk
         tBlnT0O/mqXyIhSJd3v+HO5bzD/+txO1v4/ANiTWFxY6yj33nWBTUQgp4GGO6JMe2U4i
         0xTUKKe9x2xl+XcWk0To2CJn7tfPwJRTyeK0ILkiKpWd2qkEnzlCARIZ5LDw9bvXotzg
         VLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wV+QCHMFrqB6itk4REdnMai7JMqQfYR/Z9HiCHLOVwA=;
        b=N72jhVIxjOi5f6fPKpUDPLktWFh/dQ9ZOGCnPcjwcSjTGgk5HT+ToclV3/Ved8j+WJ
         A8uUP9/L7Jn8akyWmtD7eXxqyQ+EvKEignoPD9EqPERgfleMZyeZVaFY5KhfyTTWjk4C
         DSuGjVSwPdOwkXnSwe8vr2O+CKXLh9GFOZImO4ua4baoCKI8uP0kcLL+doZMmza1EW4k
         KdIJz4wlWbxWlEjsYmee5F6hGfxxSZqdwvlm2vMrs+vPVlOo+sC4c1fMHhQ09rvtD7Ut
         HZwrxbwxRuN3bSfq62qsbFLTe/AafwGMJtVzJFrd87xiwULAtTwQz03cuTD55NNwzF4H
         bYXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6TlpK01;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o5-20020a17090a420500b001d7d1d4b88bsor6309224pjg.1.2022.04.30.22.50.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6TlpK01;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wV+QCHMFrqB6itk4REdnMai7JMqQfYR/Z9HiCHLOVwA=;
        b=y6TlpK01BrqpYxMw3u0ve2oNY5166uq6zVNamVq6EWVk4tFblKb5FQW3Iepb5DxjP5
         Wf1JAUF0/QAbITee2DbCmRWivbiXbwGclGP+pMJsO9/j5+eF3bCInXSJZkY87drhKA/R
         9SJjK3+Re0UMnFE5TZTPp7VBMn28iL754bjRyS1ffdVfOA1xzpg3vTzgnLe3LbogO3np
         pGww8f8CMZjtpE4ME/z6eAMzTSuBLzMoAo0HQNQZcjrUsNfuXHwyrdIhV9yPHwkEEUHT
         DosOIeL7FqsaqdCxzpbJowgeDKIJnpuqDBqzeAZVmWfrzxWEg8C2b2vZC6G7JE2ap3uV
         LP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wV+QCHMFrqB6itk4REdnMai7JMqQfYR/Z9HiCHLOVwA=;
        b=RAxx0+sseUNVD3TUpBShyfARy9J2MAeYCoU/9/S0AZFv2nSiWuevXkGZ8yiglVmY8f
         e3woKT8GzIJ56qrrMzQzw2fixTr2dH0I/fXsOUtVfi/62WHgrLBllnQDri2VD1TwVrPh
         sllDZPR8h3hMoRuntW3gTPvXcAlhnJTjCA4fPaj0E3H1ozMAUbTfOEdTyIRk7uh7bH0E
         JbMdHXBok4Gb+QCbqcVpNvo2Pcb6Fr83qGq6+YGHM4rDqfJ/Tm/4kLPhiLyEJyutmsdK
         R8vPg4QFfcsQr8ioLOlqG7WnvDHBAd/BF04zN/B1v4g9G+qCVFyn8/Nz30EqE5UMaP5M
         /Xyw==
X-Gm-Message-State: AOAM532DPlfGs9HDcNtaGx9uB2HSQ5xnUkkHyAAQYo2LElGQJW6eKZUp
	4FuJqHFskt+MT/3w6GQEYrMheEhV
X-Google-Smtp-Source: ABdhPJxi9xT1Chf+HDK7bDQaUdW4SMkdzrlhHu+N3I93PA8bJuPFgp0K8hHypiIDOL7yn4wtxcw3EQ==
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id gx12-20020a17090b124c00b001bc369b7db5mr11885956pjb.179.1651384233188;
        Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 03/45] target/arm: Replace sentinels with ARRAY_SIZE in cpregs.h
Date: Sat, 30 Apr 2022 22:49:45 -0700
Message-Id: <20220501055028.646596-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zKfiDoQbzc00

Remove a possible source of error by removing REGINFO_SENTINEL
and using ARRAY_SIZE (convinently hidden inside a macro) to
find the end of the set of regs being registered or modified.

The space saved by not having the extra array element reduces
the executable's .data.rel.ro section by about 9k.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Drop special case for array size 1.
---
 target/arm/cpregs.h       |  53 +++++++++---------
 hw/arm/pxa2xx.c           |   1 -
 hw/arm/pxa2xx_pic.c       |   1 -
 hw/intc/arm_gicv3_cpuif.c |   5 --
 hw/intc/arm_gicv3_kvm.c   |   1 -
 target/arm/cpu64.c        |   1 -
 target/arm/cpu_tcg.c      |   4 --
 target/arm/helper.c       | 111 ++++++++------------------------------
 8 files changed, 48 insertions(+), 129 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7f2c30eab1..a5231504d5 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -71,8 +71,6 @@
 #define ARM_CP_NO_GDB            0x4000
 #define ARM_CP_RAISES_EXC        0x8000
 #define ARM_CP_NEWEL             0x10000
-/* Used only as a terminator for ARMCPRegInfo lists */
-#define ARM_CP_SENTINEL          0xfffff
 /* Mask of only the flag bits in a type field */
 #define ARM_CP_FLAG_MASK         0x1f0ff
 
@@ -108,18 +106,6 @@ enum {
     ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
 };
 
-/*
- * Return true if cptype is a valid type field. This is used to try to
- * catch errors where the sentinel has been accidentally left off the end
- * of a list of registers.
- */
-static inline bool cptype_valid(int cptype)
-{
-    return ((cptype & ~ARM_CP_FLAG_MASK) == 0)
-        || ((cptype & ARM_CP_SPECIAL) &&
-            ((cptype & ~ARM_CP_FLAG_MASK) <= ARM_LAST_SPECIAL));
-}
-
 /*
  * Access rights:
  * We define bits for Read and Write access for what rev C of the v7-AR ARM ARM
@@ -346,20 +332,27 @@ struct ARMCPRegInfo {
 #define CPREG_FIELD64(env, ri) \
     (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
 
-#define REGINFO_SENTINEL { .type = ARM_CP_SENTINEL }
+void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu, const ARMCPRegInfo *reg,
+                                       void *opaque);
 
-void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
-                                    const ARMCPRegInfo *regs, void *opaque);
-void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
-                                       const ARMCPRegInfo *regs, void *opaque);
-static inline void define_arm_cp_regs(ARMCPU *cpu, const ARMCPRegInfo *regs)
-{
-    define_arm_cp_regs_with_opaque(cpu, regs, 0);
-}
 static inline void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs)
 {
-    define_one_arm_cp_reg_with_opaque(cpu, regs, 0);
+    define_one_arm_cp_reg_with_opaque(cpu, regs, NULL);
 }
+
+void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
+                                        void *opaque, size_t len);
+
+#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
+    do {                                                                \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
+        define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,           \
+                                           ARRAY_SIZE(REGS));           \
+    } while (0)
+
+#define define_arm_cp_regs(CPU, REGS) \
+    define_arm_cp_regs_with_opaque(CPU, REGS, NULL)
+
 const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp);
 
 /*
@@ -382,9 +375,17 @@ typedef struct ARMCPRegUserSpaceInfo {
     uint64_t fixed_bits;
 } ARMCPRegUserSpaceInfo;
 
-#define REGUSERINFO_SENTINEL { .name = NULL }
+void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
+                                 const ARMCPRegUserSpaceInfo *mods,
+                                 size_t mods_len);
 
-void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods);
+#define modify_arm_cp_regs(REGS, MODS)                                  \
+    do {                                                                \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(MODS) == 0);                       \
+        modify_arm_cp_regs_with_len(REGS, ARRAY_SIZE(REGS),             \
+                                    MODS, ARRAY_SIZE(MODS));            \
+    } while (0)
 
 /* CPWriteFn that can be used to implement writes-ignored behaviour */
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 0683714733..f4f687df68 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -384,7 +384,6 @@ static const ARMCPRegInfo pxa_cp_reginfo[] = {
     { .name = "PWRMODE", .cp = 14, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_IO,
       .readfn = arm_cp_read_zero, .writefn = pxa2xx_pwrmode_write },
-    REGINFO_SENTINEL
 };
 
 static void pxa2xx_setup_cp14(PXA2xxState *s)
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index b80d75d839..47132ab982 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -257,7 +257,6 @@ static const ARMCPRegInfo pxa_pic_cp_reginfo[] = {
     REGINFO_FOR_PIC_CP("ICLR2", 8),
     REGINFO_FOR_PIC_CP("ICFP2", 9),
     REGINFO_FOR_PIC_CP("ICPR2", 0xa),
-    REGINFO_SENTINEL
 };
 
 static const MemoryRegionOps pxa2xx_pic_ops = {
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 2d5959db94..9efba798f8 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2428,7 +2428,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_igrpen1_el3_read,
       .writefn = icc_igrpen1_el3_write,
     },
-    REGINFO_SENTINEL
 };
 
 static uint64_t ich_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2682,7 +2681,6 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
       .readfn = ich_vmcr_read,
       .writefn = ich_vmcr_write,
     },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
@@ -2700,7 +2698,6 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
     },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
@@ -2732,7 +2729,6 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
     },
-    REGINFO_SENTINEL
 };
 
 static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
@@ -2807,7 +2803,6 @@ void gicv3_init_cpuif(GICv3State *s)
                       .readfn = ich_lr_read,
                       .writefn = ich_lr_write,
                     },
-                    REGINFO_SENTINEL
                 };
                 define_arm_cp_regs(cpu, lr_regset);
             }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 611085e98d..2922c516e5 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -735,7 +735,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
        */
       .resetfn = arm_gicv3_icc_reset,
     },
-    REGINFO_SENTINEL
 };
 
 /**
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index af5ba1d0b3..c841d55d0e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -91,7 +91,6 @@ static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
     { .name = "L2MERRSR",
       .cp = 15, .opc1 = 3, .crm = 15,
       .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void aarch64_a57_initfn(Object *obj)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0e693b182e..9338088b22 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -264,7 +264,6 @@ static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a8_initfn(Object *obj)
@@ -332,7 +331,6 @@ static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
     { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a9_initfn(Object *obj)
@@ -398,7 +396,6 @@ static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
 #endif
     { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a7_initfn(Object *obj)
@@ -686,7 +683,6 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
       .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static void cortex_r5_initfn(Object *obj)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f2e555d6f..a68f14fe8e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -673,7 +673,6 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_s),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v8_cp_reginfo[] = {
@@ -702,7 +701,6 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
     { .name = "CACHEMAINT", .cp = 15, .crn = 7, .crm = CP_ANY,
       .opc1 = 0, .opc2 = CP_ANY, .access = PL1_W,
       .type = ARM_CP_NOP | ARM_CP_OVERRIDE },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v6_cp_reginfo[] = {
@@ -711,7 +709,6 @@ static const ARMCPRegInfo not_v6_cp_reginfo[] = {
      */
     { .name = "WFI_v5", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = 2,
       .access = PL1_W, .type = ARM_CP_WFI },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v7_cp_reginfo[] = {
@@ -760,7 +757,6 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
       .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
     { .name = "NMRR", .cp = 15, .crn = 10, .crm = 2,
       .opc1 = 0, .opc2 = 1, .access = PL1_RW, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -889,7 +885,6 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
       .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
-    REGINFO_SENTINEL
 };
 
 typedef struct pm_event {
@@ -2135,7 +2130,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
@@ -2152,7 +2146,6 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_is_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
@@ -2170,7 +2163,6 @@ static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsset_write,
       .raw_writefn = raw_write },
-    REGINFO_SENTINEL
 };
 
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2211,7 +2203,6 @@ static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     { .name = "TEEHBR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, teehbr),
       .accessfn = teehbr_access, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo v6k_cp_reginfo[] = {
@@ -2243,7 +2234,6 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidrprw_s),
                              offsetoflow32(CPUARMState, cp15.tpidrprw_ns) },
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -3091,7 +3081,6 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC].cval),
       .writefn = gt_sec_cval_write, .raw_writefn = raw_write,
     },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3132,7 +3121,6 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .readfn = gt_virt_cnt_read,
     },
-    REGINFO_SENTINEL
 };
 
 #endif
@@ -3496,7 +3484,6 @@ static const ARMCPRegInfo vapa_cp_reginfo[] = {
       .access = PL1_W, .accessfn = ats_access,
       .writefn = ats_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
 #endif
-    REGINFO_SENTINEL
 };
 
 /* Return basic MPU access permission bits.  */
@@ -3619,7 +3606,6 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, pmsav7.rnr[M_REG_NS]),
       .writefn = pmsav7_rgnr_write,
       .resetfn = arm_cp_reset_ignore },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
@@ -3670,7 +3656,6 @@ static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
     { .name = "946_PRBS7", .cp = 15, .crn = 6, .crm = 7, .opc1 = 0,
       .opc2 = CP_ANY, .access = PL1_RW, .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.c6_region[7]) },
-    REGINFO_SENTINEL
 };
 
 static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3824,7 +3809,6 @@ static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .fieldoffset = offsetof(CPUARMState, cp15.far_el[1]),
       .resetvalue = 0, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo vmsa_cp_reginfo[] = {
@@ -3857,7 +3841,6 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
                              offsetof(CPUARMState, cp15.tcr_el[1])} },
-    REGINFO_SENTINEL
 };
 
 /* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
@@ -3942,7 +3925,6 @@ static const ARMCPRegInfo omap_cp_reginfo[] = {
     { .name = "C9", .cp = 15, .crn = 9,
       .crm = CP_ANY, .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_RW,
       .type = ARM_CP_CONST | ARM_CP_OVERRIDE, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void xscale_cpar_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3975,7 +3957,6 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
     { .name = "XSCALE_UNLOCK_DCACHE",
       .cp = 15, .opc1 = 0, .crn = 9, .crm = 2, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
@@ -3989,7 +3970,6 @@ static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
       .access = PL1_RW,
       .type = ARM_CP_CONST | ARM_CP_NO_RAW | ARM_CP_OVERRIDE,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
@@ -3997,7 +3977,6 @@ static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
     { .name = "CDSR", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 6,
       .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
@@ -4018,7 +3997,6 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
       .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
     { .name = "CIDCR", .cp = 15, .crm = 14, .opc1 = 0,
       .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
@@ -4031,7 +4009,6 @@ static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
     { .name = "TCI_DCACHE", .cp = 15, .crn = 7, .crm = 14, .opc1 = 0, .opc2 = 3,
       .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = (1 << 30) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo strongarm_cp_reginfo[] = {
@@ -4040,7 +4017,6 @@ static const ARMCPRegInfo strongarm_cp_reginfo[] = {
       .crm = CP_ANY, .opc1 = CP_ANY, .opc2 = CP_ANY,
       .access = PL1_RW, .resetvalue = 0,
       .type = ARM_CP_CONST | ARM_CP_OVERRIDE | ARM_CP_NO_RAW },
-    REGINFO_SENTINEL
 };
 
 static uint64_t midr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -4107,7 +4083,6 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
       .writefn = vmsa_ttbr_write, },
-    REGINFO_SENTINEL
 };
 
 static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -5126,7 +5101,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
-    REGINFO_SENTINEL
 };
 
 /* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
@@ -5237,7 +5211,6 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .type = ARM_CP_CONST,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
       .access = PL2_RW, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 /* Ditto, but for registers which exist in ARMv8 but not v7 */
@@ -5246,7 +5219,6 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
@@ -5679,7 +5651,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .cp = 15, .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.hstr_el2) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
@@ -5689,7 +5660,6 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_writehigh },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5710,7 +5680,6 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 2,
       .access = PL2_RW, .accessfn = sel2_access,
       .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5836,7 +5805,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae3_write },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -6122,7 +6090,6 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
@@ -6131,7 +6098,6 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 /* Return the exception level to which exceptions should be taken
@@ -6617,7 +6583,6 @@ static void define_debug_regs(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
               .writefn = dbgbcr_write, .raw_writefn = raw_write
             },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
@@ -6636,7 +6601,6 @@ static void define_debug_regs(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
               .writefn = dbgwcr_write, .raw_writefn = raw_write
             },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
@@ -6699,7 +6663,6 @@ static void define_pmu_regs(ARMCPU *cpu)
               .type = ARM_CP_IO,
               .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
               .raw_writefn = pmevtyper_rawwrite },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, pmev_regs);
         g_free(pmevcntr_name);
@@ -6717,7 +6680,6 @@ static void define_pmu_regs(ARMCPU *cpu)
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
               .resetvalue = extract64(cpu->pmceid1, 32, 32) },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
     }
@@ -6814,7 +6776,6 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
       .access = PL1_R, .accessfn = access_lor_ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 #ifdef TARGET_AARCH64
@@ -6877,7 +6838,6 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo tlbirange_reginfo[] = {
@@ -6989,7 +6949,6 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae3_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo tlbios_reginfo[] = {
@@ -7061,7 +7020,6 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae3is_write },
-    REGINFO_SENTINEL
 };
 
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -7100,7 +7058,6 @@ static const ARMCPRegInfo rndr_reginfo[] = {
       .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END | ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
       .access = PL0_R, .readfn = rndr_readfn },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7136,7 +7093,6 @@ static const ARMCPRegInfo dcpop_reg[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo dcpodp_reg[] = {
@@ -7144,7 +7100,6 @@ static const ARMCPRegInfo dcpodp_reg[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
-    REGINFO_SENTINEL
 };
 #endif /*CONFIG_USER_ONLY*/
 
@@ -7246,14 +7201,12 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
     { .name = "TCO", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_CONST, .access = PL0_RW, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
@@ -7305,7 +7258,6 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
       .accessfn = aa64_zva_access,
 #endif
     },
-    REGINFO_SENTINEL
 };
 
 #endif
@@ -7351,7 +7303,6 @@ static const ARMCPRegInfo predinv_reginfo[] = {
     { .name = "CPPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 7,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
-    REGINFO_SENTINEL
 };
 
 static uint64_t ccsidr2_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -7366,7 +7317,6 @@ static const ARMCPRegInfo ccsidr2_reginfo[] = {
       .access = PL1_R,
       .accessfn = access_aa64_tid2,
       .readfn = ccsidr2_read, .type = ARM_CP_NO_RAW },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult access_aa64_tid3(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -7427,7 +7377,6 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
       .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo vhe_reginfo[] = {
@@ -7492,7 +7441,6 @@ static const ARMCPRegInfo vhe_reginfo[] = {
       .access = PL2_RW, .accessfn = e2h_access,
       .writefn = gt_virt_cval_write, .raw_writefn = raw_write },
 #endif
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7505,7 +7453,6 @@ static const ARMCPRegInfo ats1e1_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo ats1cp_reginfo[] = {
@@ -7517,7 +7464,6 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write },
-    REGINFO_SENTINEL
 };
 #endif
 
@@ -7539,7 +7485,6 @@ static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 void register_cp_regs_for_features(ARMCPU *cpu)
@@ -7646,7 +7591,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
               .resetvalue = cpu->isar.id_isar6 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, v6_idregs);
         define_arm_cp_regs(cpu, v6_cp_reginfo);
@@ -7914,7 +7858,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 7,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmceid1 },
-            REGINFO_SENTINEL
         };
 #ifdef CONFIG_USER_ONLY
         ARMCPRegUserSpaceInfo v8_user_idregs[] = {
@@ -7944,7 +7887,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .exported_bits = 0x000000f0ffffffff },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true                     },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
@@ -7984,7 +7926,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL2_RW,
               .resetvalue = vmpidr_def,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
@@ -8023,7 +7964,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                   .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_NO_RAW,
                   .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
-                REGINFO_SENTINEL
             };
             define_arm_cp_regs(cpu, vpidr_regs);
             define_arm_cp_regs(cpu, el3_no_el2_cp_reginfo);
@@ -8046,7 +7986,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .raw_writefn = raw_write, .writefn = sctlr_write,
               .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
               .resetvalue = cpu->reset_sctlr },
-            REGINFO_SENTINEL
         };
 
         define_arm_cp_regs(cpu, el3_regs);
@@ -8181,7 +8120,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "DUMMY",
               .cp = 15, .crn = 0, .crm = 7, .opc1 = 0, .opc2 = CP_ANY,
               .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         ARMCPRegInfo id_v8_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
@@ -8201,7 +8139,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R,
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
-            REGINFO_SENTINEL
         };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
@@ -8219,7 +8156,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R,
               .accessfn = access_aa32_tid1,
               .type = ARM_CP_CONST, .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         /* TLBTR is specific to VMSA */
         ARMCPRegInfo id_tlbtr_reginfo = {
@@ -8246,25 +8182,23 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MIDR_EL1",
               .exported_bits = 0x00000000ffffffff },
             { .name = "REVIDR_EL1"                },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(id_v8_midr_cp_reginfo, id_v8_user_midr_cp_reginfo);
 #endif
         if (arm_feature(env, ARM_FEATURE_OMAPCP) ||
             arm_feature(env, ARM_FEATURE_STRONGARM)) {
-            ARMCPRegInfo *r;
+            size_t i;
             /* Register the blanket "writes ignored" value first to cover the
              * whole space. Then update the specific ID registers to allow write
              * access, so that they ignore writes rather than causing them to
              * UNDEF.
              */
             define_one_arm_cp_reg(cpu, &crn0_wi_reginfo);
-            for (r = id_pre_v8_midr_cp_reginfo;
-                 r->type != ARM_CP_SENTINEL; r++) {
-                r->access = PL1_RW;
+            for (i = 0; i < ARRAY_SIZE(id_pre_v8_midr_cp_reginfo); ++i) {
+                id_pre_v8_midr_cp_reginfo[i].access = PL1_RW;
             }
-            for (r = id_cp_reginfo; r->type != ARM_CP_SENTINEL; r++) {
-                r->access = PL1_RW;
+            for (i = 0; i < ARRAY_SIZE(id_cp_reginfo); ++i) {
+                id_cp_reginfo[i].access = PL1_RW;
             }
             id_mpuir_reginfo.access = PL1_RW;
             id_tlbtr_reginfo.access = PL1_RW;
@@ -8287,13 +8221,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
-            REGINFO_SENTINEL
         };
 #ifdef CONFIG_USER_ONLY
         ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
@@ -8314,7 +8246,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL3_RW, .type = ARM_CP_CONST,
               .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, auxcr_reginfo);
         if (cpu_isar_feature(aa32_ac2, cpu)) {
@@ -8349,7 +8280,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                   .type = ARM_CP_CONST,
                   .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 0,
                   .access = PL1_R, .resetvalue = cpu->reset_cbar },
-                REGINFO_SENTINEL
             };
             /* We don't implement a r/w 64 bit CBAR currently */
             assert(arm_feature(env, ARM_FEATURE_CBAR_RO));
@@ -8379,7 +8309,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
                                      offsetof(CPUARMState, cp15.vbar_ns) },
               .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vbar_cp_reginfo);
     }
@@ -8833,8 +8762,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                    r->writefn);
         }
     }
-    /* Bad type field probably means missing sentinel at end of reg list */
-    assert(cptype_valid(r->type));
+
     for (crm = crmmin; crm <= crmmax; crm++) {
         for (opc1 = opc1min; opc1 <= opc1max; opc1++) {
             for (opc2 = opc2min; opc2 <= opc2max; opc2++) {
@@ -8880,13 +8808,13 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     }
 }
 
-void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
-                                    const ARMCPRegInfo *regs, void *opaque)
+/* Define a whole list of registers */
+void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
+                                        void *opaque, size_t len)
 {
-    /* Define a whole list of registers */
-    const ARMCPRegInfo *r;
-    for (r = regs; r->type != ARM_CP_SENTINEL; r++) {
-        define_one_arm_cp_reg_with_opaque(cpu, r, opaque);
+    size_t i;
+    for (i = 0; i < len; ++i) {
+        define_one_arm_cp_reg_with_opaque(cpu, regs + i, opaque);
     }
 }
 
@@ -8898,17 +8826,20 @@ void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
  * user-space cannot alter any values and dynamic values pertaining to
  * execution state are hidden from user space view anyway.
  */
-void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods)
+void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
+                                 const ARMCPRegUserSpaceInfo *mods,
+                                 size_t mods_len)
 {
-    const ARMCPRegUserSpaceInfo *m;
-    ARMCPRegInfo *r;
-
-    for (m = mods; m->name; m++) {
+    for (size_t mi = 0; mi < mods_len; ++mi) {
+        const ARMCPRegUserSpaceInfo *m = mods + mi;
         GPatternSpec *pat = NULL;
+
         if (m->is_glob) {
             pat = g_pattern_spec_new(m->name);
         }
-        for (r = regs; r->type != ARM_CP_SENTINEL; r++) {
+        for (size_t ri = 0; ri < regs_len; ++ri) {
+            ARMCPRegInfo *r = regs + ri;
+
             if (pat && g_pattern_match_string(pat, r->name)) {
                 r->type = ARM_CP_CONST;
                 r->access = PL0U_R;
-- 
2.34.1
