Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200969wrv;
        Sat, 3 Aug 2019 11:48:16 -0700 (PDT)
X-Received: by 2002:a63:7b18:: with SMTP id w24mr129189808pgc.328.1564858096551;
        Sat, 03 Aug 2019 11:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858096; cv=none;
        d=google.com; s=arc-20160816;
        b=0M+X3+I3r81NVFiWIEuFh/3qkFiMFDIv+xzKtLeEZsaCWmXdPkTbbDlDb17x63dLHc
         dO8Jd0DRmItNSylKjGt1ZusEhmUUYRSneTvoLJHwkcQb2LYqAM9i7A+UlF+oGkBXLGJ7
         pL881FRuo+aP3EbDbwvSd8Y0ToSpbtSo41lpvvz0yMAda4toclVtPjuXzVVlNjoOSMkD
         c2oKocUPBXkE5DOFNHudWfPGLAHFyL1zVyJTbpazez25bOV8+wzHOI4mBEyqJa/H01E1
         loSPmgOoA4+3Vm+Xz0weiGybdalDoPkZxrpGUo5e8CPD0waGfzfRsnYIGYJJBTmPPoz1
         SxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XQAThtHXgFyxyKRl2tP3DLgR3ROFgj6xArwRDkS66hw=;
        b=SaumNDjLxqvORIchs2pqqWfvw3NQFUBtWHF7vT9hJLWakQu2SeFcmVzl5GDW0uqk1S
         OmrZyMD+VMimeolwF8JUi1HZD587AkE3mvUls0X1z/CoYjibfRj9dAvo6CZQdih4ocQk
         ZByqxrHeyoeUVvHhRj3U3XGaNs/SBPUa8tQ0jSzk4fv4TUdMoXRFgLMZwWCOgL4gp7gi
         sj4KvC3+bClczNtE0qpv6nKgO4U1rWDdBZ5AQeEyXGGIuGEUFxKPae6UH36eAt7CEPqh
         LUAbzMvzuAlydkFd8GKyW/xWd7KN1phF2udAlZ+jJ66LkavZvlLoEJJviDUXpsznbIcS
         /Dxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYzJtc4U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e79sor59856347pfh.26.2019.08.03.11.48.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYzJtc4U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQAThtHXgFyxyKRl2tP3DLgR3ROFgj6xArwRDkS66hw=;
        b=HYzJtc4UILsYqHR3YMKJ2c7daYwFs9zPhg1eV7Vi3ygCUyRnRaa+lx3zvB/6jGWc9m
         7XWhIeW7l7bq3zr103Lm1lmY0xHzB4UkCej5+WuiIMpY9qHPs3EdhEMsgyqCqhTj2dHY
         +j2AssPsadGFSRo8gYavQ7kqEpfVer3Up2+R2ylIzJKdGbBg91DkbEJo80ixMASFFP15
         KjE8cs5rqFJ6epB/Ns0k8ol004Ii6zOgbEpSnHFGw4KxEAN9D2bB2kuh0bISBmBSlhFH
         hvtvr9m7D3gRupu/E207j72Q7X7b8iAsFAMW9Co+hPP4DNjON0RqMyRBOg44xR+RH8yr
         J3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQAThtHXgFyxyKRl2tP3DLgR3ROFgj6xArwRDkS66hw=;
        b=qti8gczKO7X0nb9Py0Hzi8R/5Y9e1/J3KbJH4TrnbaVhRoXzOL+PF/I4BTrATcdc88
         GGW8VYECRauvO0JTVFUoDXiYcCvCyT1Sf0Cqaa0hhpONK9bGCH3/XCXgbUNRrXKWPVVE
         p6VTUyxoLFslkhI69v9pxg5FRMloOz9uO1jXGiHmpRBEO/qV277XSFzkK8EGgLA1rCQO
         z7bUXUmKxw5IVDt/W8UhIyj4WOp813B9PpYoQFVv6isjO8ewwxfrc1il+bksOSFBflQP
         PRfsANGS2ZQlvkIsQAOuKqUGMoyU8h4eeOo+M6b7JNQNi4C7KfxdNG4zOliCor8Rx6WD
         cT7A==
X-Gm-Message-State: APjAAAUEHvto7ZiMEM3v2kUzjx1Fzm9FcbEGF1A5V8iUBSf7IrM1ULcR
	B8hsHh0EfQ1Wng7TnYVk4nzrZSAb
X-Google-Smtp-Source: APXvYqwTOokRbyS+NfjWs3DSXYKxx6YLAmD/0oZmi5oWzoLtrRSnceM/71qOD6H3pVdst9yt8xCH+g==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr24660458pfi.105.1564858096083;
        Sat, 03 Aug 2019 11:48:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 11/34] target/arm: Add the hypervisor virtual counter
Date: Sat,  3 Aug 2019 11:47:37 -0700
Message-Id: <20190803184800.8221-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Jk7z2WlOmKJ3

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  1 +
 target/arm/cpu.h     | 11 +++++----
 target/arm/cpu.c     |  2 ++
 target/arm/helper.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 2049fa9612..43fc8296db 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -76,6 +76,7 @@ void arm_gt_ptimer_cb(void *opaque);
 void arm_gt_vtimer_cb(void *opaque);
 void arm_gt_htimer_cb(void *opaque);
 void arm_gt_stimer_cb(void *opaque);
+void arm_gt_hvtimer_cb(void *opaque);
 
 #define ARM_AFF0_SHIFT 0
 #define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e37008a4f7..bba4e1f984 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -144,11 +144,12 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
-#define GTIMER_PHYS 0
-#define GTIMER_VIRT 1
-#define GTIMER_HYP  2
-#define GTIMER_SEC  3
-#define NUM_GTIMERS 4
+#define GTIMER_PHYS     0
+#define GTIMER_VIRT     1
+#define GTIMER_HYP      2
+#define GTIMER_SEC      3
+#define GTIMER_HYPVIRT  4
+#define NUM_GTIMERS     5
 
 typedef struct {
     uint64_t raw_tcr;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ec2ab95dbe..4431330c2e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1226,6 +1226,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                           arm_gt_htimer_cb, cpu);
     cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
                                           arm_gt_stimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
+                                              arm_gt_hvtimer_cb, cpu);
 #endif
 
     cpu_exec_realizefn(cs, &local_err);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2fcb03da5..e0f5627218 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2527,6 +2527,7 @@ static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
 
     switch (timeridx) {
     case GTIMER_VIRT:
+    case GTIMER_HYPVIRT:
         offset = gt_virt_cnt_offset(env);
         break;
     }
@@ -2543,6 +2544,7 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     switch (timeridx) {
     case GTIMER_VIRT:
+    case GTIMER_HYPVIRT:
         offset = gt_virt_cnt_offset(env);
         break;
     }
@@ -2698,6 +2700,34 @@ static void gt_sec_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, GTIMER_SEC, value);
 }
 
+static void gt_hv_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    gt_timer_reset(env, ri, GTIMER_HYPVIRT);
+}
+
+static void gt_hv_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    gt_cval_write(env, ri, GTIMER_HYPVIRT, value);
+}
+
+static uint64_t gt_hv_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return gt_tval_read(env, ri, GTIMER_HYPVIRT);
+}
+
+static void gt_hv_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    gt_tval_write(env, ri, GTIMER_HYPVIRT, value);
+}
+
+static void gt_hv_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    gt_ctl_write(env, ri, GTIMER_HYPVIRT, value);
+}
+
 void arm_gt_ptimer_cb(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -2726,6 +2756,13 @@ void arm_gt_stimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_SEC);
 }
 
+void arm_gt_hvtimer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    gt_recalc_timer(cpu, GTIMER_HYPVIRT);
+}
+
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* Note that CNTFRQ is purely reads-as-written for the benefit
      * of software; writing it doesn't actually change the timer frequency.
@@ -6849,6 +6886,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
               .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
               .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
+#ifndef CONFIG_USER_ONLY
+            { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 3, .opc2 = 2,
+              .fieldoffset =
+                offsetof(CPUARMState, cp15.c14_timer[GTIMER_HYPVIRT].cval),
+              .type = ARM_CP_IO, .access = PL2_RW,
+              .writefn = gt_hv_cval_write, .raw_writefn = raw_write },
+            { .name = "CNTHV_TVAL_EL2", .state = ARM_CP_STATE_BOTH,
+              .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 3, .opc2 = 0,
+              .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
+              .resetfn = gt_hv_timer_reset,
+              .readfn = gt_hv_tval_read, .writefn = gt_hv_tval_write },
+            { .name = "CNTHV_CTL_EL2", .state = ARM_CP_STATE_BOTH,
+              .type = ARM_CP_IO,
+              .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 3, .opc2 = 1,
+              .access = PL2_RW,
+              .fieldoffset =
+                offsetof(CPUARMState, cp15.c14_timer[GTIMER_HYPVIRT].ctl),
+              .writefn = gt_hv_ctl_write, .raw_writefn = raw_write },
+#endif
             REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vhe_reginfo);
-- 
2.17.1
