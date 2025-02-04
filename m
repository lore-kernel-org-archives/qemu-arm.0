Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183722njb;
        Tue, 4 Feb 2025 04:50:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI87RnTmdnuosHRitW31VYtSvz94tkYs5JZVXij4+Xp/zLXc/IBQnYj5E42JcTzF8PNbWC9S0y+FZXKQ==@linaro.org
X-Received: by 2002:a05:6000:2a8:b0:385:efc7:932d with SMTP id ffacd0b85a97d-38c520af4demr22059676f8f.46.1738673418449;
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673418; cv=none;
        d=google.com; s=arc-20240605;
        b=GFp/s8oBa46HLt0U2U75ItCnBmoIetrSMRFihE1mzPjdILtPvxm9tUqPprTcliD20e
         0wL5Ff3QbQLN3aItp0N6BpnFgPoq55wBDaqXRhV2qspvCeDJN+K+71hQC0FTZYB4mhdB
         VgSqTMe7ZrQSLEBc3XpXg5VOSe+sFseR4E6bYLGwdETKDUFzi4cVzS+FocgbK0B7EWmV
         Td8n0qntBbCGWBvWldPLjzhbvJF30JU0Su4MuxamKTHxDZbIr0okC9CrMnQdyJhIDo7j
         aneVlcYTvw3cUJnXRMyNMMIKpo3Qmt+NZke3vy2XZJL1Z5iWmxu5hFa8ukcgI7oPq68q
         F3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tMCLVG75imhon3JRh2v3hSuL1igLHDGnXzv1AZpRurg=;
        fh=+EdJbzDty/t22bx/m5BUtT73S8KM9VncygJlbeV3XHI=;
        b=aymMlNpg/EuCyySNZ/XssAVwODGHzxZVQvH52G+H7YWdLFd9vOd8l+NsF7uFJ4CSco
         ykXociwxxZXYdoZs8o15C+cNSaxUO39fF3nm0X5YmTBtbsaqw1SvOuCal7owrscFUUEo
         5fQVAG/KhV4pLDSOOKjOeQ6hWKV+DVLT3kRkV97RuRYjPuWcBkf+ciOV8F9aoeMzvfEy
         D3QQk1U3HXzehjLB7q5mhFniqOsrq9b7XolDKrePBIA7XAC5Y1d5gCRqgFQV0wdJMq9r
         tXUbg8uWYNVUc/l4eaNCX3BlbfubCWDZqPRWnOLHAIrP8sslNJkTg4BK5HMKYvgw4DQd
         yqtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC9RtVrw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1f81cesor4479823f8f.8.2025.02.04.04.50.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC9RtVrw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673418; x=1739278218; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMCLVG75imhon3JRh2v3hSuL1igLHDGnXzv1AZpRurg=;
        b=AC9RtVrwCNbJa/8750FxMR4tHgrL27C61YWNBwmjNhYn9Cnajp3uYa5CusiGyYkbji
         vWCAq+KcdmWQC11cDVcJmMt5B+SmsDmSJ91tGeKKv6Caj3/wkrqHTSUUUIH3VeYnf3mP
         HP1KrtKurYtOJjGaaX/9i/kIwgz2ky81F/uGt2eR1aa6QVVnatb6cEwXuFhFt3PM/WhW
         9SR3omdVNBgJDj0cp3A+BtU54HsvMp7taf77SJDHzG83CiBxIdaTVQor7cEm8Iu0S/Z/
         8GjjJ0OUavybrONrGVumVnqEOyxfiEDJAwPBdVH4K5BSs56J7yX74eAYEh1zjTHMutYz
         J4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673418; x=1739278218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMCLVG75imhon3JRh2v3hSuL1igLHDGnXzv1AZpRurg=;
        b=JrpQva6N6xvwVMVaEDMHehuj3/Z/a9qYuSYVhqEOGC1e/LziUmdhEFFSbDPaGN8Er6
         3/vfghcyUjcC82/+Un8jUt//DMwq45B3ojU0jefWqwfSj28Q4rLJUe2hC3C0gybZ8gum
         OBYtc4pbfQgYfQLB++GNcf9HNN6CsZq9hsZ7AS8Vxqjn8S/MiaPctPTIFvCgcxoWRv0Q
         5nbiHkfW8dm1eHTTNjSxZUy3Whe2YEZQtK3nvixmmL+TjLyR98hbPKLNzKZB/IxnT9k1
         LBOaEZijedfCCaRSKesiqIjV6E6dehsNU6bI/bf6kk0YNx/obbNbrgot5jtMNvrg5lIE
         2nPg==
X-Forwarded-Encrypted: i=1; AJvYcCWdaoFXoZNA4WPawISDO/P0iUFOY+XmyqsRH5lxCKPfMgpnRBSeX4Pf2BWjKjLKge2laCGnWqkxRYhoqA==@linaro.org
X-Gm-Message-State: AOJu0Ywz0Ubvm5ZuAnsi2HGJH55x6sSEuCbhbMN/Wor4HfFC2EyX+JQo
	ZhrmNc+DByZjKdjCzMRxG2fyG/s2N/MVef4ylGZIxM8TzuPdJqGF7CmkW/JB7JCu8uyR12zef5G
	Rqmg=
X-Gm-Gg: ASbGncspc5phfzeUHNqag9ETa2NH6vG3wru/xH1z3qlcvMyREi5QQjKseSQVW/qdfIt
	kdacm+ezAieh6zOYROT+7Y6xhpGhatgF1GpzbKaQHLJXGcO3yjcNgRPFI9jfDeQp/qNwODRIeTg
	xW0CM1UlMOyM8fkd0flIbxQFPEsfSDaEmMmUo0Mqxrr5mTXhPD5uD86w722UwtyXwPQBfyC2ajS
	HEkIAKVEQcSGPs6PJuoe/0Rirf12jrNZshvH3SzjQ2ETHShlXZXi4P67tIG6cj5IfPVN2xoYOpL
	R5ZvDtzruk9EJ+2ejG2lfw==
X-Google-Smtp-Source: AGHT+IEP4iz2ZMMvy7N7WT7YPobyS75l1byrMXRCtZuqxLR0kt8EHFB2iJpRnHHigF9kRhw9AZqFqg==
X-Received: by 2002:adf:ee8b:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38c51943ddemr18794462f8f.16.1738673417826;
        Tue, 04 Feb 2025 04:50:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 6/9] target/arm: Implement SEL2 physical and virtual timers
Date: Tue,  4 Feb 2025 12:50:06 +0000
Message-Id: <20250204125009.2281315-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7iXy06MxcbhI

From: Alex Bennée <alex.bennee@linaro.org>

When FEAT_SEL2 was implemented the SEL2 timers were missed. This
shows up when building the latest Hafnium with SPMC_AT_EL=2. The
actual implementation utilises the same logic as the rest of the
timers so all we need to do is:

  - define the timers and their access functions
  - conditionally add the correct system registers
  - create a new accessfn as the rules are subtly different to the
    existing secure timer

Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
Cc: Andrei Homescu <ahomescu@google.com>
Cc: Arve Hjønnevåg <arve@google.com>
Cc: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
[PMM: CP_ACCESS_TRAP_UNCATEGORIZED -> CP_ACCESS_UNDEFINED;
 offset logic now in gt_{indirect,direct}_access_timer_offset() ]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/bsa.h |   2 +
 target/arm/cpu.h     |   2 +
 target/arm/gtimer.h  |   4 +-
 target/arm/cpu.c     |   4 ++
 target/arm/helper.c  | 163 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/bsa.h b/include/hw/arm/bsa.h
index 8eaab603c03..13ed2d2ac19 100644
--- a/include/hw/arm/bsa.h
+++ b/include/hw/arm/bsa.h
@@ -22,6 +22,8 @@
 #define QEMU_ARM_BSA_H
 
 /* These are architectural INTID values */
+#define ARCH_TIMER_S_EL2_VIRT_IRQ  19
+#define ARCH_TIMER_S_EL2_IRQ       20
 #define VIRTUAL_PMU_IRQ            23
 #define ARCH_GIC_MAINT_IRQ         25
 #define ARCH_TIMER_NS_EL2_IRQ      26
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ae1e8b1c779..3011595b3d0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1148,6 +1148,8 @@ void arm_gt_vtimer_cb(void *opaque);
 void arm_gt_htimer_cb(void *opaque);
 void arm_gt_stimer_cb(void *opaque);
 void arm_gt_hvtimer_cb(void *opaque);
+void arm_gt_sel2timer_cb(void *opaque);
+void arm_gt_sel2vtimer_cb(void *opaque);
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
index b992941bef1..0e89b8e58d0 100644
--- a/target/arm/gtimer.h
+++ b/target/arm/gtimer.h
@@ -15,7 +15,9 @@ enum {
     GTIMER_HYP      = 2,
     GTIMER_SEC      = 3,
     GTIMER_HYPVIRT  = 4,
-#define NUM_GTIMERS   5
+    GTIMER_S_EL2_PHYS = 5, /* CNTHPS_* ; only if FEAT_SEL2 */
+    GTIMER_S_EL2_VIRT = 6, /* CNTHVS_* ; only if FEAT_SEL2 */
+#define NUM_GTIMERS   7
 };
 
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7a83b9ee34f..97acd230298 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2091,6 +2091,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                               arm_gt_stimer_cb, cpu);
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
+        cpu->gt_timer[GTIMER_S_EL2_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                                     arm_gt_sel2timer_cb, cpu);
+        cpu->gt_timer[GTIMER_S_EL2_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                                     arm_gt_sel2vtimer_cb, cpu);
     }
 #endif
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c021c237b9b..bc820b0de76 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2404,6 +2404,45 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     }
 }
 
+static CPAccessResult gt_sel2timer_access(CPUARMState *env,
+                                          const ARMCPRegInfo *ri,
+                                          bool isread)
+{
+    /*
+     * The AArch64 register view of the secure EL2 timers are mostly
+     * accessible from EL3 and EL2 although can also be trapped to EL2
+     * from EL1 depending on nested virt config.
+     */
+    switch (arm_current_el(env)) {
+    case 0: /* UNDEFINED */
+        return CP_ACCESS_UNDEFINED;
+    case 1:
+        if (!arm_is_secure(env)) {
+            /* UNDEFINED */
+            return CP_ACCESS_UNDEFINED;
+        } else if (arm_hcr_el2_eff(env) & HCR_NV) {
+            /* Aarch64.SystemAccessTrap(EL2, 0x18) */
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* UNDEFINED */
+        return CP_ACCESS_UNDEFINED;
+    case 2:
+        if (!arm_is_secure(env)) {
+            /* UNDEFINED */
+            return CP_ACCESS_UNDEFINED;
+        }
+        return CP_ACCESS_OK;
+    case 3:
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_OK;
+        } else {
+            return CP_ACCESS_UNDEFINED;
+        }
+    default:
+        g_assert_not_reached();
+    }
+}
+
 uint64_t gt_get_countervalue(CPUARMState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2475,6 +2514,8 @@ static uint64_t gt_indirect_access_timer_offset(CPUARMState *env, int timeridx)
     case GTIMER_HYP:
     case GTIMER_SEC:
     case GTIMER_HYPVIRT:
+    case GTIMER_S_EL2_PHYS:
+    case GTIMER_S_EL2_VIRT:
         return 0;
     default:
         g_assert_not_reached();
@@ -2521,6 +2562,8 @@ uint64_t gt_direct_access_timer_offset(CPUARMState *env, int timeridx)
     case GTIMER_HYP:
     case GTIMER_SEC:
     case GTIMER_HYPVIRT:
+    case GTIMER_S_EL2_PHYS:
+    case GTIMER_S_EL2_VIRT:
         return 0;
     default:
         g_assert_not_reached();
@@ -2953,6 +2996,62 @@ static void gt_sec_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, GTIMER_SEC, value);
 }
 
+static void gt_sec_pel2_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    gt_timer_reset(env, ri, GTIMER_S_EL2_PHYS);
+}
+
+static void gt_sec_pel2_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    gt_cval_write(env, ri, GTIMER_S_EL2_PHYS, value);
+}
+
+static uint64_t gt_sec_pel2_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return gt_tval_read(env, ri, GTIMER_S_EL2_PHYS);
+}
+
+static void gt_sec_pel2_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_tval_write(env, ri, GTIMER_S_EL2_PHYS, value);
+}
+
+static void gt_sec_pel2_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_ctl_write(env, ri, GTIMER_S_EL2_PHYS, value);
+}
+
+static void gt_sec_vel2_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    gt_timer_reset(env, ri, GTIMER_S_EL2_VIRT);
+}
+
+static void gt_sec_vel2_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_cval_write(env, ri, GTIMER_S_EL2_VIRT, value);
+}
+
+static uint64_t gt_sec_vel2_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return gt_tval_read(env, ri, GTIMER_S_EL2_VIRT);
+}
+
+static void gt_sec_vel2_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    gt_tval_write(env, ri, GTIMER_S_EL2_VIRT, value);
+}
+
+static void gt_sec_vel2_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_ctl_write(env, ri, GTIMER_S_EL2_VIRT, value);
+}
+
 static void gt_hv_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     gt_timer_reset(env, ri, GTIMER_HYPVIRT);
@@ -3009,6 +3108,20 @@ void arm_gt_stimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_SEC);
 }
 
+void arm_gt_sel2timer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    gt_recalc_timer(cpu, GTIMER_S_EL2_PHYS);
+}
+
+void arm_gt_sel2vtimer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    gt_recalc_timer(cpu, GTIMER_S_EL2_VIRT);
+}
+
 void arm_gt_hvtimer_cb(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -5733,6 +5846,56 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
       .access = PL2_RW, .accessfn = sel2_access,
       .nv2_redirect_offset = 0x48,
       .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
+#ifndef CONFIG_USER_ONLY
+    /* Secure EL2 Physical Timer */
+    { .name = "CNTHPS_TVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 0,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .readfn = gt_sec_pel2_tval_read,
+      .writefn = gt_sec_pel2_tval_write,
+      .resetfn = gt_sec_pel2_timer_reset,
+    },
+    { .name = "CNTHPS_CTL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 1,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_S_EL2_PHYS].ctl),
+      .resetvalue = 0,
+      .writefn = gt_sec_pel2_ctl_write, .raw_writefn = raw_write,
+    },
+    { .name = "CNTHPS_CVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 2,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_S_EL2_PHYS].cval),
+      .writefn = gt_sec_pel2_cval_write, .raw_writefn = raw_write,
+    },
+    /* Secure EL2 Virtual Timer */
+    { .name = "CNTHVS_TVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 0,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .readfn = gt_sec_vel2_tval_read,
+      .writefn = gt_sec_vel2_tval_write,
+      .resetfn = gt_sec_vel2_timer_reset,
+    },
+    { .name = "CNTHVS_CTL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 1,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_S_EL2_VIRT].ctl),
+      .resetvalue = 0,
+      .writefn = gt_sec_vel2_ctl_write, .raw_writefn = raw_write,
+    },
+    { .name = "CNTHVS_CVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 2,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_S_EL2_VIRT].cval),
+      .writefn = gt_sec_vel2_cval_write, .raw_writefn = raw_write,
+    },
+#endif
 };
 
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1
