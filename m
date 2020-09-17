Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp209494lfq;
        Wed, 16 Sep 2020 20:22:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye73MdV6ajqjdFra5gM32fR8YU2oSBs3PvMukTblfmL0OcGlBVZZwCmCtS/M4+yRx9SM3u
X-Received: by 2002:a25:354:: with SMTP id 81mr36908930ybd.292.1600312937068;
        Wed, 16 Sep 2020 20:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600312937; cv=none;
        d=google.com; s=arc-20160816;
        b=kwckuNT1rT9yXTL1/W/XWEY9V0+Hl6eSwlyvo39hmfsu0ZLm9s/TWFNnlWQ42Ww5kf
         PAce3U5ycsvvIA/YeY+GJptS17iCJGFVvYpUT4UZV4C5VCDBCnH/p3zso2VlEaG9Sa+x
         bDMU/OVFEtukEvdQuyzEiSOyKjgrtxzZZ802T1+hV7T9yPGyl2dW9euLu2UIFLKNL16T
         1HKgzdsxkN6LJoPpQLonT/rrbc+W4bLYcnDrPMzAUQYLQCsmRm662wrzOCApaB59rOuG
         efvPYBgcq4iATTSyXlIpqwtz1R+NwEuh+/OXdgRjU4wCOK8RgTeTL8ZEt6yXaqzujSWn
         vtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BHTxxgmREGtmGscisLLMmGilfD20GxVFXKRKlDSN5Os=;
        b=LVd0mCl343YRT/eDAqHoXkIuG2pbvY4Ux8QbEAa6Tio0Tllm9AGvTxG8lPSAcKq19E
         puSct4nz6Q0boBAj+srI7ck6Mit8ymDIp8KwOz6hnO+I8NR8l4CkRgqMVlR9F5W3efwk
         3d1k/iLmUoX0kj3rKoicUHjewH/2Ssh9z7g4kPbGX6dr5xdmqO68BDd2S7+BgRXqEOhm
         myksAEBRtgrtZR7IudumDxcwE/kw7Vm8rs+ZASnI1ir0DTSQQgem+DeM99aSSDGL74q2
         gfmXWxHUShp8Y8Ye6SmdTQWhrUD0q/nh12qUqnJFKbvAd6KEwGkUCfTGOMxV/jEdKyPj
         hKlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si11186110ybs.229.2020.09.16.20.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkUy-0005Ge-CR
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUP-0004yf-1g; Wed, 16 Sep 2020 23:21:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4699 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004QM-Ev; Wed, 16 Sep 2020 23:21:40 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7A375E32711B65A2A2E3;
 Thu, 17 Sep 2020 11:20:53 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:20:45 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 02/12] target/arm/kvm64: make MPIDR consistent with CPU
 Topology
Date: Thu, 17 Sep 2020 11:20:23 +0800
Message-ID: <20200917032033.2020-3-fangying1@huawei.com>
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
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wxd0ixIlv6GP

MPIDR helps to provide an additional PE identification in a multiprocessor
system. This patch adds support for setting MPIDR from userspace, so that
MPIDR is consistent with CPU topology configured.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 target/arm/kvm64.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ef1e960285..fcce261a10 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -757,10 +757,46 @@ static int kvm_arm_sve_set_vls(CPUState *cs)
 
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
+static int kvm_arm_set_mp_affinity(CPUState *cs)
+{
+    uint64_t mpidr;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_MP_AFFINITY)) {
+        /* Make MPIDR consistent with CPU topology */
+        MachineState *ms = MACHINE(qdev_get_machine());
+
+        mpidr = (kvm_arch_vcpu_id(cs) % ms->smp.threads) << ARM_AFF0_SHIFT;
+        mpidr |= ((kvm_arch_vcpu_id(cs) / ms->smp.threads % ms->smp.cores)
+                                    & 0xff) << ARM_AFF1_SHIFT;
+        mpidr |= (kvm_arch_vcpu_id(cs) / (ms->smp.cores * ms->smp.threads)
+                                    & 0xff) << ARM_AFF2_SHIFT;
+
+        /* Override mp affinity when KVM is in use */
+        cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
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
+        int ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
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
-    uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
@@ -814,16 +850,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
-    /*
-     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
-     * Currently KVM has its own idea about MPIDR assignment, so we
-     * override our defaults with what we get from KVM.
-     */
-    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
+    ret = kvm_arm_set_mp_affinity(cs);
     if (ret) {
         return ret;
     }
-    cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
     kvm_arm_init_debug(cs);
 
-- 
2.23.0

