Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp531964lfq;
        Thu, 17 Sep 2020 05:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO3EvOLrRvBOO3Z4nfHN6ANsu9Ybev49cEtoazrehXiRCXI1NksW1wDopmYCloPDuw8PwH
X-Received: by 2002:a25:b952:: with SMTP id s18mr1863162ybm.471.1600345523898;
        Thu, 17 Sep 2020 05:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345523; cv=none;
        d=google.com; s=arc-20160816;
        b=PyUYAHKKPy5uq+k6b9qX97oH6tkLk9PBUQwNcpe/O3q5jcKXLHoVCulrj4+Hld8mfl
         G51Ig9G5Z24X5NAuf9NPEdsVUAFK97bUb8dIHIEexaBq9yUy2NwsRUBp7ayAOJfX+AXV
         q4gPcP3v7ZT6MP2pktwTQEckQ5vyuUFj182RK3/GvOPiviyrSt9C1dekbbZgfd8fx8nX
         p9QuEwtA2+uT4MnrmzUOLlEp14egCw2+NDqqVggrSEGONcNTiKllt/vF0hAAWvMtfvSB
         PCJgonMfKTVfs87NcTPspCFx/0m+IkJJrGY7/HIJXMLjo38ZhDCTKH4x7gnUmy8mTxli
         qJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YzqNiHtyU9/7G3Dqg6UiE9qMzo7Ctbhlp8zMg37mrV4=;
        b=HO8FMHGeN0sPnli/KeoPngw5avco+g2P5C4ohddDcn/CeUL4AAw01ET7C9DROB/cv1
         MEod36uTiOkptk8fniPEMk4Rj2yTXZlAGXkN04VloQgmtP+R9TJ0yFIBP+ygYt29eLnj
         SBC9jCRE7ilURJ/vje148xENdw7v8878NXAUAGdM+vMgQs+8D6fG9oSqLcJYzjoK47Gc
         deLgLW5lV79SURo1Mwsjxmf2beBcp6uLYNYH0w2rboRLCNT9Fz5YOa8clg7d1JoRk1JY
         ng1fhUR1S1JolhCx61qrnyZQ86rb71NHdDdt6jerj2PFIwISbR9BNwsxd2nNjOPHgy90
         GM3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si4090456ybr.198.2020.09.17.05.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIsyZ-00018s-98
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswq-0008Vl-Ak; Thu, 17 Sep 2020 08:23:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4763 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswm-0003Q6-O9; Thu, 17 Sep 2020 08:23:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9F85A6E678F74860A763;
 Thu, 17 Sep 2020 20:23:26 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:17 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 07/10] target/arm: Allow ID registers to synchronize to KVM
Date: Thu, 17 Sep 2020 20:14:46 +0800
Message-ID: <20200917121449.3442059-8-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:14
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: mC3ogNG1/xnr

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
 target/arm/kvm_arm.h |  3 +++
 target/arm/helper.c  | 46 +++++++++++++++++++++++++++++++++-----------
 target/arm/kvm.c     | 38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 33b3f107b47d..cf1c9c9cdb4c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -479,4 +479,7 @@ static inline const char *its_class_name(void)
     }
 }
 
+int kvm_arm_get_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *target);
+int kvm_arm_set_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *source);
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26fef7424904..e489d744f15a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #endif
+#include "kvm_arm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -353,6 +354,16 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
+static inline bool is_id_register(const ARMCPRegInfo *ri)
+{
+    /*
+     * (Op0, Op1, CRn, CRm, Op2) of ID registers is (3, 0, 0, crm, op2),
+     * where 1<=crm<8, 0<=op2<8.
+     */
+    return ri->opc0 == 3 && ri->opc1 == 0 && ri->crn == 0 &&
+        ri->crm > 0 && ri->crm < 8;
+}
+
 bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
 {
     /* Write the coprocessor state from cpu->env to the (index,value) list. */
@@ -369,30 +380,43 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
             ok = false;
             continue;
         }
-        if (ri->type & ARM_CP_NO_RAW) {
+        /* Let's give ID registers a chance to synchronize to kvm. */
+        if ((ri->type & ARM_CP_NO_RAW) && !(kvm_sync && is_id_register(ri))) {
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
+                if (is_id_register(ri)) {
+                    ok = false;
+                    error_report("Cannot set ID regsiter %s: %s", ri->name,
+                                 strerror(errno));
+                }
+                continue;
+            }
+            if (kvm_arm_get_one_reg(cpu, cpu->cpreg_indexes[i], &kvmval) ||
+                kvmval != newval) {
+                if (is_id_register(ri)) {
+                    ok = false;
+                    error_report("Setting ID register %s doesn't effect",
+                                 ri->name);
+                }
                 continue;
             }
 
-            write_raw_cp_reg(&cpu->env, ri, newval);
+            kvm_arm_set_one_reg(cpu, cpu->cpreg_indexes[i], &oldval);
         }
         cpu->cpreg_values[i] = newval;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 2eae73315d6e..5b5cde5e821e 100644
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
-- 
2.26.2

