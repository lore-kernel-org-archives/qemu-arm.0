Received: by 10.25.0.144 with SMTP id 138csp829963lfa;
        Sat, 29 Apr 2017 22:31:32 -0700 (PDT)
X-Received: by 10.98.31.90 with SMTP id f87mr20428539pff.264.1493530292434;
        Sat, 29 Apr 2017 22:31:32 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r75si10901454pfb.362.2017.04.29.22.31.32;
        Sat, 29 Apr 2017 22:31:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1426296AbdD3Fba (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Sun, 30 Apr 2017 01:31:30 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5816 "EHLO
        dggrg01-dlp.huawei.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S939133AbdD3Fb2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 30 Apr 2017 01:31:28 -0400
Received: from 172.30.72.55 (EHLO DGGEML404-HUB.china.huawei.com) ([172.30.72.55])
        by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id ANP74825;
        Sun, 30 Apr 2017 13:24:40 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server id
 14.3.301.0; Sun, 30 Apr 2017 13:24:28 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <james.morse@arm.com>, <marc.zyngier@arm.com>,
        <christoffer.dall@linaro.org>, <rkrcmar@redhat.com>,
        <linux@armlinux.org.uk>, <tbaicar@codeaurora.org>,
        <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <lersek@redhat.com>, <ard.biesheuvel@linaro.org>,
        <mtsirkin@redhat.com>, <drjones@redhat.com>,
        <ben@skyportsystems.com>, <kvm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>
CC:     <xiexiuqi@huawei.com>, <wangxiongfeng2@huawei.com>,
        <songwenjun@huawei.com>, <wuquanming@huawei.com>,
        <huangshaoyu@huawei.com>, <gengdongjiu@huawei.com>
Subject: [PATCH v3 2/4] target-arm: kvm64: detect guest RAS EXTENSION feature
Date:   Sun, 30 Apr 2017 13:35:04 +0800
Message-ID: <1493530506-26833-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020205.5905751B.00D6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 77361359a30c7c2a8f847e8672266b2b
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: b85uCoXLTDU4

check if kvm supports guest RAS EXTENSION. if so, set
corresponding feature bit for vcpu.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/asm-arm64/kvm.h | 1 +
 linux-headers/linux/kvm.h     | 1 +
 target/arm/cpu.h              | 3 +++
 target/arm/kvm64.c            | 8 ++++++++
 4 files changed, 13 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 651ec30..acb5c4d 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -97,6 +97,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
 #define KVM_ARM_VCPU_PSCI_0_2		2 /* CPU uses PSCI v0.2 */
 #define KVM_ARM_VCPU_PMU_V3		3 /* Support guest PMUv3 */
+#define KVM_ARM_VCPU_RAS_EXTENSION	4
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 4e082a8..e0fa5b8 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -883,6 +883,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_MMU_RADIX 134
 #define KVM_CAP_PPC_MMU_HASH_V3 135
 #define KVM_CAP_IMMEDIATE_EXIT 136
+#define KVM_CAP_ARM_RAS_EXTENSION 137
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8aabce..1cf4a5b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -610,6 +610,8 @@ struct ARMCPU {
 
     /* CPU has memory protection unit */
     bool has_mpu;
+    /* CPU has ras extension unit */
+    bool has_ras_extension;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
 
@@ -1216,6 +1218,7 @@ enum arm_features {
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
     ARM_FEATURE_PMU, /* has PMU support */
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
+    ARM_FEATURE_RAS_EXTENSION, /*has RAS extension support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6111109..fd30a5a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -518,6 +518,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_RAS_EXTENSION)) {
+        cpu->has_ras_extension = true;
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_RAS_EXTENSION;
+    } else {
+        cpu->has_ras_extension = false;
+        unset_feature(&env->features, ARM_FEATURE_RAS_EXTENSION);
+    }
+
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
     if (ret) {
-- 
1.8.3.1
