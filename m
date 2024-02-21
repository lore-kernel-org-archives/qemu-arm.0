Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1985593ejb;
        Wed, 21 Feb 2024 07:21:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUt0M0Z476rxvHoRdy3NsZZsCfH0+aZyCeS9CwFRTLRARQFqzpvV8RTcFTTM6kj927QY+IVkuDp/zoxonRgTQG7L1jn9DXb
X-Google-Smtp-Source: AGHT+IFp9f4pNNMcv2O2Xl1agZ0EQRq7KnP+l1pokHbWzR2BWW6HXwN5Wyys0sV1wopjIPNBK7dh
X-Received: by 2002:a05:6830:14c:b0:6e2:f274:3deb with SMTP id j12-20020a056830014c00b006e2f2743debmr17438939otp.31.1708528903946;
        Wed, 21 Feb 2024 07:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528903; cv=none;
        d=google.com; s=arc-20160816;
        b=K2WOuWC59OjYy6CivSvgos6MXLHSpvOOkalr1cM9xWET+OT7g7mhaEyMZieuQSoF6h
         8XW552EhWDpHjnl+4vLO5QnqOatcArIF7tO08yfrw5tIykfeeiaJqZmwBlRrTDsBFjNi
         NMggya5zyM8QrpAyOdsWL9yQKn9PkuPb15Ne8YKoakn3iKMIl/cwiyBElgw4YLyGOvjD
         e+tJ6LqN9z3LHlFrGAkqeXYo2LXH4KPPDoMCdZSCQo3cFFnbXpGTR7BfOWoUjvjUHVmK
         vCMaXm2ciA3w7xhcv8gjac/39JU12EyS7ulQ6Au778Cdu1mh5LmCSfUTVCfE7175Lo9l
         dd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=NRA9JDVh2earMqNOS/wj86lbDqLT8isJrTaRbQsC+ow=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ydlOobe9ev9zaHD6osCGlqlM3kjNq7So2vHICCmMY+JviyxIPCh3S+p0dfhSiyQmfo
         a+NEi8UJ47RObac1QtfeYhuoyMsLfR1nUII6PTWsgIBvEZT4HqShh/o6JkbQW/DQY3eN
         NKkp1NOWhQzVl5l8rMgu8kx/iIS06hw72PFmGGsAL3xDsnOHbdM6GZt49yZiXUPTToOx
         6vRwY3p+pNwq6bbIKb4U4RR+c5MWOBitKJDfAlxOWMEyIPZLUIpV6xezTtwz1jeyM9r7
         f1zx+AP9Zw58WcvBGO8bVhbhz9Yg+YD12QeJGvnt2pk+J6nRb4ZWxWDm12nCGuOyyv1H
         EOsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ac86059000000b0042dad24d7c5si9911828qtm.477.2024.02.21.07.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoNm-00088C-Fa; Wed, 21 Feb 2024 10:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJv-00010D-2b; Wed, 21 Feb 2024 10:15:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004pX-Lo; Wed, 21 Feb 2024 08:09:42 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQr4FQPz1xnx5;
 Wed, 21 Feb 2024 21:08:04 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4E4A11402CC;
 Wed, 21 Feb 2024 21:09:27 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:26 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 06/22] target/arm: Add support for Non-maskable
 Interrupt
Date: Wed, 21 Feb 2024 13:08:07 +0000
Message-ID: <20240221130823.677762-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uv93z3SmSwtf

This only implements the external delivery method via the GICv3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/cpu-qom.h |  3 ++-
 target/arm/cpu.c     | 39 ++++++++++++++++++++++++++++++++++-----
 target/arm/cpu.h     |  2 ++
 target/arm/helper.c  |  1 +
 4 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 8e032691db..66d555a605 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -36,11 +36,12 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
-/* Meanings of the ARMCPU object's four inbound GPIO lines */
+/* Meanings of the ARMCPU object's five inbound GPIO lines */
 #define ARM_CPU_IRQ 0
 #define ARM_CPU_FIQ 1
 #define ARM_CPU_VIRQ 2
 #define ARM_CPU_VFIQ 3
+#define ARM_CPU_NMI 4
 
 /* For M profile, some registers are banked secure vs non-secure;
  * these are represented as a 2-element array where the first element
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e5978c302..055670343e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -128,7 +128,7 @@ static bool arm_cpu_has_work(CPUState *cs)
 
     return (cpu->power_state != PSCI_OFF)
         && cs->interrupt_request &
-        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
+        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
@@ -668,6 +668,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     CPUARMState *env = cpu_env(cs);
     bool pstate_unmasked;
     bool unmasked = false;
+    bool nmi_unmasked = false;
 
     /*
      * Don't take exceptions if they target a lower EL.
@@ -678,13 +679,29 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         return false;
     }
 
+    nmi_unmasked = (!(env->allint & PSTATE_ALLINT)) &
+                   (!((env->cp15.sctlr_el[target_el] & SCTLR_SPINTMASK) &&
+                   (env->pstate & PSTATE_SP) && cur_el == target_el));
+
     switch (excp_idx) {
+    case EXCP_NMI:
+        pstate_unmasked = nmi_unmasked;
+        break;
+
     case EXCP_FIQ:
-        pstate_unmasked = !(env->daif & PSTATE_F);
+        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+            pstate_unmasked = (!(env->daif & PSTATE_F)) & nmi_unmasked;
+        } else {
+            pstate_unmasked = !(env->daif & PSTATE_F);
+        }
         break;
 
     case EXCP_IRQ:
-        pstate_unmasked = !(env->daif & PSTATE_I);
+        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+            pstate_unmasked = (!(env->daif & PSTATE_I)) & nmi_unmasked;
+        } else {
+            pstate_unmasked = !(env->daif & PSTATE_I);
+        }
         break;
 
     case EXCP_VFIQ:
@@ -804,6 +821,16 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
 
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+        if (interrupt_request & CPU_INTERRUPT_NMI) {
+            excp_idx = EXCP_NMI;
+            target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
+            if (arm_excp_unmasked(cs, excp_idx, target_el,
+                                  cur_el, secure, hcr_el2)) {
+                goto found;
+            }
+        }
+    }
     if (interrupt_request & CPU_INTERRUPT_FIQ) {
         excp_idx = EXCP_FIQ;
         target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
@@ -929,7 +956,8 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
         [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
         [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
         [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
-        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
+        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ,
+        [ARM_CPU_NMI] = CPU_INTERRUPT_NMI
     };
 
     if (!arm_feature(env, ARM_FEATURE_EL2) &&
@@ -957,6 +985,7 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
         break;
     case ARM_CPU_IRQ:
     case ARM_CPU_FIQ:
+    case ARM_CPU_NMI:
         if (level) {
             cpu_interrupt(cs, mask[irq]);
         } else {
@@ -1358,7 +1387,7 @@ static void arm_cpu_initfn(Object *obj)
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
     } else {
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
+        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 5);
     }
 
     qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f9646dbbfb..5257343bcb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -60,6 +60,7 @@
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
 #define EXCP_VSERR          24
 #define EXCP_GPC            25   /* v9 Granule Protection Check Fault */
+#define EXCP_NMI            26
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -79,6 +80,7 @@
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
 #define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
 #define CPU_INTERRUPT_VSERR CPU_INTERRUPT_TGT_INT_0
+#define CPU_INTERRUPT_NMI   CPU_INTERRUPT_TGT_EXT_4
 
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 211156d640..bd7858e02e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10626,6 +10626,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
             [EXCP_VSERR] = "Virtual SERR",
             [EXCP_GPC] = "Granule Protection Check",
+            [EXCP_NMI] = "NMI"
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
-- 
2.34.1

