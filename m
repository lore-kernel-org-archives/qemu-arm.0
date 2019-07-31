Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071281wrv;
        Wed, 31 Jul 2019 13:38:29 -0700 (PDT)
X-Received: by 2002:aa7:8dd2:: with SMTP id j18mr48614756pfr.88.1564605509448;
        Wed, 31 Jul 2019 13:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605509; cv=none;
        d=google.com; s=arc-20160816;
        b=rtPL+xEJuHwPrRaK6vaGyC2gcAIhsQGT7CraEKhTkn9+F/bMZ2MbElWFOG3CSO4FiL
         0k96AU/igWSVJWh4pJeZ6QREl7Iotg96gS8mw48Cca3MzRnGWj2snEutdDUg59AW5CNI
         mhPg2OIaj2h+EjV61scHOtpGTx/sB6DGRHACK3eNXT4vbTyLl3SDTzG0Jz0mOKKx4Rrq
         qvQGpoTAZej//SprviWx5W9bYQfd///fQ6zEUpqxTFxMGiZjkyfyLeqI4nZKo7IDYlSY
         bR2XpzFeklhY+lImvwa497NUNrewh1QPPcc8xlAxdb/jTuyETcN2F5Tfx42kVigYSDhj
         YEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CFTl19ZF5edhUenxmEwmpn5Y/VYa/1WL6bwC0O5YAUU=;
        b=cEIitjp7eZfiAqbWzbN3YJswLgoCQ28rqMQKDJgaYLJ3gf4W89JwJADUDkCFPkXErE
         5gp8yDbYQVKJWWG0UdkOE9UtuhldORR8CnzJlxMBs/qb40DxQQqlFkiYqTCipVLKS+47
         8ACwaNcD37uNj/Y9YkG1Ma/oX959P8rtQy5nwzN5kEq4bbXQHqdFdwIaL+0dVgGuxHN2
         QmVNHAvQWwbC4f3XAvfzOdSZnUq9eCbjYm+6xQfNOHpvhWkh24VvyKXrhe6LJ6X8FKKG
         sL+QfJH2f+WMUg76A2nGXcPDqi6Pj3ul9uTE3u4DB8yVunFfrfMH5JnK0bqgkiLt9ejE
         WfqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amuUyuNw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b64sor3493616pjc.24.2019.07.31.13.38.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amuUyuNw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CFTl19ZF5edhUenxmEwmpn5Y/VYa/1WL6bwC0O5YAUU=;
        b=amuUyuNwDci6gXi5XG1g/VwjnH2iPNi7yLWFwNScGq65RDwAoi1nJAx+bRS0q49EN5
         oK8W2K/TN2nqy7CVzonuNVUM+JIITKfOG98/TCzvh0qNE/5HUHTEcKWDHY+FQxVCvYf3
         B12VxhY/wLtFJj7v1fkdvPULody89gFCTh2UOaJ0cpDRbdLVrMb01o6/FeA2a+OgjPPA
         o+QTwKVmcBEfzSi6tcyetU2ubXGsd7xC7M1Km/POBvW4rvsa9hJYImXfTFTPIJWeSl4M
         RLDvQ3r5WBeYo1ZY8wZJbqKQ8Gy2XL8dk/5bYFMAXb9kW6zqdiUfSKPIBz5QYYKJ1cBY
         WHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFTl19ZF5edhUenxmEwmpn5Y/VYa/1WL6bwC0O5YAUU=;
        b=l8HPimscx90LlgC3A1GsyeL8gt85mzNV8uqxxT6PbOQNOwL6RpBSyrdndcVt68SfKX
         jC/o89EhSuBcbqVin7HHXYu5PXnershcPBuJuPIU2WP4iMiYnJx/BlUBJjplMvGJUmEG
         6GIB1qKZk8pJaxhhsCzhCzJFNip1DoKgKtOwpKfflagzX/aaIEE7LPuI77MWFGOBbEve
         f+DWF0/KT6t+QKL52sHWZ4zkrlLuuX3+hJtEvxM1DKp/4ksOidGfGNrKZcAu0C6JqFYR
         JjQ9VDRkEk2WPHLnEFmqAOc3ayo3cug3ek+5isxYgwUmW3YEdp7RgC7XpDslUeRLgW4I
         tOHg==
X-Gm-Message-State: APjAAAUVFEJlDea0RuJ6fd70GYuVV2RjU0WPSA7wDITnBMFrsNG1PaxI
	TeLnbmvkD0T4/YZoWU+WQD/jbZDN
X-Google-Smtp-Source: APXvYqyGLOOxqQiryuyFxgUVwuW7mgaPqKiJOD2c2zGANGfK5om39sexJYEq4WObtiteKWKW8qlNng==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr4754846pjs.101.1564605508954;
        Wed, 31 Jul 2019 13:38:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 11/32] target/arm: Add the hypervisor virtual counter
Date: Wed, 31 Jul 2019 13:37:52 -0700
Message-Id: <20190731203813.30765-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A1QgABgesCtc

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
index 9eb40ff755..e10b510c0b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1218,6 +1218,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
