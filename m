Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3648716lfa;
        Sun, 1 Nov 2020 21:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9YLo6ApVcDPtNEySPCcs9NVNJhjfbNF7C5F8U5iKYNLQPbCMm0/B2I3SEncVLMHc1stWP
X-Received: by 2002:a5b:284:: with SMTP id x4mr18300930ybl.225.1604296021362;
        Sun, 01 Nov 2020 21:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604296021; cv=none;
        d=google.com; s=arc-20160816;
        b=BxdtKrXtgL8ArKB/tgHEfkNXlMj3hxhbgB6pspMyhjZCosPQf4+GbV4nl0NrRqOH58
         dv0QqiVLPe703twr/4dkK02zHmJySzQHlEs4l8+6Hkpqi4SWYJxyMfDr590syEgPW6p3
         BW03uTC9AiP/ux6N/YpARfvLRzNzH2PWMX/yFuIjMMTLXaNi0na+cA7UExaMrw5MGSAM
         Slw9w1gUJ0pwDHEFLTbmbxwDQMnNmuoBTMZZko8U9MXuJLGBXpMauPhO2ddlvNmV7qEF
         D7kbNOF81YDuzh+N69cejrIBlNtPTSYgcru2I5b/1OQLPZ76AyyOe3mcoKgmIVRAVkg8
         mn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=DZrH55a4/5AKUQlfom7IxXvTDt9/Ukdt2gnnGT0g+/E=;
        b=kR1ecZp/dqRl5a91qRjSCLCLxs6sJKPUorj3kxZEtpM7kBraxx1aNhagRBCfns8KWk
         0hNwUtOs+sKS6PBF2+kupafL2t26tOf7RystX9vuGO2xeYwr3DX+c1WXhTdj4VpgHTGY
         WdoNULDuVbLw5iGRrGWuZnZaBHt3fw+Iqcg6NF+3q6Z6H9wsn/7QHSJMzA0kuriwQPzB
         E/JJEC+t4xPd8A6JtBHX7xIzMwptkv2DwLoHl/GlOpPfp/Z4KtsKMnUwklEhM7ANBSLn
         Gur8zZrPRW8fPJjE6vVqicdgyffuFRgrga06ZRAGIxCOsNPPWCpWz02Rit7HLdH/6K2q
         fG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si13795041ybq.480.2020.11.01.21.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSgG-0005dq-Ji
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdT-0002X0-JB; Mon, 02 Nov 2020 00:44:08 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdM-0001Nd-9s; Mon, 02 Nov 2020 00:44:06 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhft4BnLz15Q15;
 Mon,  2 Nov 2020 13:43:50 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:45 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 07/10] target/arm: Allow ID registers to synchronize to KVM
Date: Mon, 2 Nov 2020 13:40:52 +0800
Message-ID: <20201102054055.686143-8-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: NaQhD7FXr9F7

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
 target/arm/helper.c  | 46 +++++++++++++++++++++++++++++++++-----------
 target/arm/kvm.c     | 38 ++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  3 +++
 3 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7f7100783b3a..41d912c7b8ff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -35,6 +35,7 @@
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #endif
+#include "kvm_arm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -355,6 +356,16 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
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
@@ -371,30 +382,43 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
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
index ffe186de8d19..40d01ed9e3a4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -506,6 +506,44 @@ out:
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
index a6a1df775cd2..74935e081e80 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -535,4 +535,7 @@ static inline const char *its_class_name(void)
     }
 }
 
+int kvm_arm_get_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *target);
+int kvm_arm_set_one_reg(ARMCPU *cpu, uint64_t regidx, uint64_t *source);
+
 #endif
-- 
2.26.2

