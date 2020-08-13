Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp387936lfy;
        Thu, 13 Aug 2020 03:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxM6KKA/6Z07FvmtZ4nfox2CXfy4MDPpe/P9gBeoDoSHgjfeDJmhw8shBQe/+T5FSAl6bI
X-Received: by 2002:a25:e00e:: with SMTP id x14mr5487884ybg.263.1597314783767;
        Thu, 13 Aug 2020 03:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597314783; cv=none;
        d=google.com; s=arc-20160816;
        b=TAMk7DQ6N8P86EgOrwKjKSvIeVoslmo/zJ7omCkBKOq7XgDpsW5VrtJKt+D8eB6bIt
         y2DOF14u2V6bOgjyx2vr6t6o9wdcjiqEJJwQbJ3SbzftTrQlRh1umzYAfc+al5JUZgBz
         f+NZw69AnXMbmVoYeKPGfe7EDSXJInoqzRoaAEGMQdhJdIDi1JWreOUfkXdtTlXyRfM4
         jhWIAo9P5bTW163Q3Bz08/rZp88MIWqsk5M1k4xDRdvgghUrJTuPVqBAza04NNea8MD+
         Oo1/pw+MeIsWEDhGyxYMpVOFdkzqA1KmP6KHLdtTDoedcqKZvuh+NJeU4x5ycnvx4MFU
         SkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=naQV7UCDuxbaiGwzmUtndRVgrbfs96kvxRV8gsE1I78=;
        b=hFUlfri1xX20h3gie02v9LGQ07sJBvDnQ0ulahcNFwNd/9HIzU1M3B2/DNDv2pHZ0D
         PLaTD+4KX7WNbAn3WHOKWK4KPp8nty6w6tAsw4uzQMutBJPfuYwt4VWjE5M9yEXt9qkQ
         cXPdE/JR8ormpeC22c90+iNibIFcoaT3b/Q1AZpIY87Y/CKGrFwlzHxyMGD3Eev0OqjF
         OP/mrAha09qsln3ogaNY5VIURvcKC2kNz6FgvSknCxXLUW049gFpt/vNpqu/AopLf4K7
         ZoQi6FQF2M5GZv6Mtv3MCh5nUrJh10aTiLYfFvrNKbVrxw24dqtasK7AodC7EVZ2lHSq
         2Bbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y124si4833359ybe.458.2020.08.13.03.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6AXf-00009C-4N
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXC-0008V6-0E; Thu, 13 Aug 2020 06:32:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4184 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AX8-0006p2-PZ; Thu, 13 Aug 2020 06:32:33 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 24EFB428727448D1A081;
 Thu, 13 Aug 2020 18:32:27 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:20 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 4/9] target/arm: Allow ID registers to synchronize to KVM
Date: Thu, 13 Aug 2020 18:26:52 +0800
Message-ID: <20200813102657.2588720-5-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ni7+ijayQttL

There are 2 steps to synchronize the values of system registers from
CPU state to KVM:
1. write to the values of system registers from CPU state to
   (index,value) list by write_cpustate_to_list;
2. write the values in (index,value) list to KVM by
   write_list_to_kvmstate;

In step 1, the values of constant system registers are not allowed to
write to (index,value) list.  However, a constant system register is
CONSTANT for guest but not for QEMU, which means, QEMU can set/modify
the value of constant system registers that is different from phsical
registers when startup.  But if KVM is enabled, guest can not read the
values of the system registers which QEMU set unless they can be written
to (index,value) list.  And why not try to write to KVM if kvm_sync is
true?

At the moment we call write_cpustate_to_list, all ID registers are
contant, including ID_PFR1_EL1 and ID_AA64PFR0_EL1 because GIC has been
initialized.  Hence, let's give all ID registers a chance to write to
KVM.  If the write is successful, then write to (index,value) list.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/helper.c  | 31 ++++++++++++++++++++-----------
 target/arm/kvm.c     | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  3 +++
 3 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9208ec046c..1cac269ef1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #endif
+#include "kvm_arm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -369,30 +370,38 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
             ok = false;
             continue;
         }
-        if (ri->type & ARM_CP_NO_RAW) {
+        /*
+         * (Op0, Op1, CRn, CRm, Op2) of ID registers is (3, 0, 0, crm, op2),
+         * where 1<=crm<8, 0<=op2<8.  Let's give ID registers a chance to
+         * synchronize to kvm.
+         */
+        if ((ri->type & ARM_CP_NO_RAW) && !(kvm_sync &&
+            ri->opc0 == 3 && ri->opc1 == 0 && ri->crn == 0 && ri->crm > 0)) {
             continue;
         }
 
         newval = read_raw_cp_reg(&cpu->env, ri);
         if (kvm_sync) {
-            /*
-             * Only sync if the previous list->cpustate sync succeeded.
-             * Rather than tracking the success/failure state for every
-             * item in the list, we just recheck "does the raw write we must
-             * have made in write_list_to_cpustate() read back OK" here.
-             */
-            uint64_t oldval = cpu->cpreg_values[i];
+            /* Only sync if we can sync to KVM successfully. */
+            uint64_t oldval;
+            uint64_t kvmval;
 
+            if (kvm_arm_get_one_reg(cpu, cpu->cpreg_indexes[i], &oldval)) {
+                continue;
+            }
             if (oldval == newval) {
                 continue;
             }
 
-            write_raw_cp_reg(&cpu->env, ri, oldval);
-            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
+            if (kvm_arm_set_one_reg(cpu, cpu->cpreg_indexes[i], &newval)) {
+                continue;
+            }
+            if (kvm_arm_get_one_reg(cpu, cpu->cpreg_indexes[i], &kvmval) ||
+                kvmval != newval) {
                 continue;
             }
 
-            write_raw_cp_reg(&cpu->env, ri, newval);
+            kvm_arm_set_one_reg(cpu, cpu->cpreg_indexes[i], &oldval);
         }
         cpu->cpreg_values[i] = newval;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bb7318378..6a40e7da61 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -490,6 +490,44 @@ out:
     return ret;
 }
 
+int kvm_arm_get_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *target)
+{
+    uint32_t v32;
+    int ret;
+
+    switch (regidx & KVM_REG_SIZE_MASK) {
+    case KVM_REG_SIZE_U32:
+        ret = kvm_get_one_reg(CPU(cpu), regidx, &v32);
+        if (ret == 0) {
+            *target = v32;
+        }
+        return ret;
+    case KVM_REG_SIZE_U64:
+        return kvm_get_one_reg(CPU(cpu), regidx, target);
+    default:
+        return -1;
+    }
+}
+
+int kvm_arm_set_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *source)
+{
+    uint32_t v32;
+
+    switch (regidx & KVM_REG_SIZE_MASK) {
+    case KVM_REG_SIZE_U32:
+        v32 = *source;
+        if (v32 != *source) {
+            error_report("the value of source is too large");
+            return -1;
+        }
+        return kvm_set_one_reg(CPU(cpu), regidx, &v32);
+    case KVM_REG_SIZE_U64:
+        return kvm_set_one_reg(CPU(cpu), regidx, source);
+    default:
+        return -1;
+    }
+}
+
 bool write_kvmstate_to_list(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf..99035494ae 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -478,4 +478,7 @@ static inline const char *its_class_name(void)
     }
 }
 
+int kvm_arm_get_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *target);
+int kvm_arm_set_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *source);
+
 #endif
-- 
2.18.4

