Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp210502lfq;
        Wed, 16 Sep 2020 20:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxucYZpHS9cWRZ58ZRQ0X389smwZy23+pqSvDEwE9pNbULrN+qhO3st2PfC7cW8uMa0tCt7
X-Received: by 2002:a25:b321:: with SMTP id l33mr28840717ybj.31.1600313052417;
        Wed, 16 Sep 2020 20:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313052; cv=none;
        d=google.com; s=arc-20160816;
        b=dQ6f49yb6My1TouA+PJwoGsHpVuHWW0SRBA+4YUb7VSpfyf8niJ1CVD8i8/sUeO46y
         CjouR8aV+lNTq0kUBQdNJgnWSzCoG8D3Ubl+Yec4QEcj8kZvQixZOFx52Mqfcb7XMMID
         8QNxytQv8k2r2tLaE0/+yyrZ9SP0eGhhSxc2705t8hxjiSNVrJq+bkYffs8v2eyaBrzt
         mrBouf7zAUoXh6fZAryBFlWY8NaOY1WU4uDgwCTpIx/L7ZPgm530EWffV9ukTHFCS7lD
         iCtqzbG9c/nQ8qPPLJ/eBWrct/EdIpxFy4jUgq/8+ctAZldH/0a2bMim/3hSlOfZS7g5
         CsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=jgeVGYbshpWer2hDY/pFw1nhul3o+auLHbF/R3jccv4=;
        b=Knmxl7Fi/vBPQlsBdBa6Luch9xTivG9hVSkFGmwrnY3jw6+cJf0mWSBTyJ0kNZ7nKW
         dbW7tBfQ1r2jtMmN9J15vA5GCT21JutU5PdoOdY6NkRsefDyqk9/f/wsLDLdECuuU41R
         lc25uUqm1TrADT7O5agS59bsdLlTnVUVze3/mhVIZz1Ixo7M5f0EuliusIUG8dvZUUUj
         vN6hCi5cykouvG1dgi9ugiGHEUiUMR37JadB5n4YK4rNPEMXcs6vy4FBFANyZ0voTFYl
         i+wIhZ6Tv5kM2VN67trU1nueVFZqJPMOFGJxW5JyakwRR0SDfZZNyZ0hVuGoayRqc6Vy
         ifJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si3681678ybs.37.2020.09.16.20.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkWp-00080m-Ol
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUQ-00052P-Ef; Wed, 16 Sep 2020 23:21:42 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4700 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004Qc-F4; Wed, 16 Sep 2020 23:21:42 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 31AAEAEDCE52875C0B5F;
 Thu, 17 Sep 2020 11:20:58 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:20:47 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 03/12] target/arm/kvm32: make MPIDR consistent with CPU
 Topology
Date: Thu, 17 Sep 2020 11:20:24 +0800
Message-ID: <20200917032033.2020-4-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: suEohZFRrXGl

MPIDR helps to provide an additional PE identification in a multiprocessor
system. This patch adds support for setting MPIDR from userspace, so that
MPIDR is consistent with CPU topology configured.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 target/arm/kvm32.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 0af46b41c8..85694dc8bf 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -201,11 +201,47 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 
 #define ARM_CPU_ID_MPIDR       0, 0, 0, 5
 
+static int kvm_arm_set_mp_affinity(CPUState *cs)
+{
+    uint32_t mpidr;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_MP_AFFINITY)) {
+        /* Make MPIDR consistent with CPU topology */
+        MachineState *ms = MACHINE(qdev_get_machine());
+
+        mpidr = (kvm_arch_vcpu_id(cs) % ms->smp.threads) << ARM_AFF0_SHIFT;
+        mpidr |= ((kvm_arch_vcpu_id(cs) / ms->smp.threads % ms->smp.cores)
+                                        & 0xff) << ARM_AFF1_SHIFT;
+        mpidr |= (kvm_arch_vcpu_id(cs) / (ms->smp.cores * ms->smp.threads)
+                                       & 0xff) << ARM_AFF2_SHIFT;
+
+        /* Override mp affinity when KVM is in use */
+        cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
+
+        /* Bit 31 is RES1 indicates the ARMv7 Multiprocessing Extensions */
+        mpidr |= (1ULL << 31);
+        return kvm_vcpu_ioctl(cs, KVM_ARM_SET_MP_AFFINITY, &mpidr);
+    } else {
+        /*
+         * When KVM_CAP_ARM_MP_AFFINITY is not supported, it means KVM has its
+         * own idea about MPIDR assignment, so we override our defaults with
+         * what we get from KVM.
+         */
+        int ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
+        if (ret) {
+            error_report("failed to set MPIDR");
+            return ret;
+        }
+        cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
+        return ret;
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret;
     uint64_t v;
-    uint32_t mpidr;
     struct kvm_one_reg r;
     ARMCPU *cpu = ARM_CPU(cs);
 
@@ -244,16 +280,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return -EINVAL;
     }
 
-    /*
-     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
-     * Currently KVM has its own idea about MPIDR assignment, so we
-     * override our defaults with what we get from KVM.
-     */
-    ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
+    ret = kvm_arm_set_mp_affinity(cs);
     if (ret) {
         return ret;
     }
-    cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
 
     /* Check whether userspace can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
-- 
2.23.0

