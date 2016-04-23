Received: by 10.25.208.194 with SMTP id h185csp1207492lfg;
        Sat, 23 Apr 2016 03:05:08 -0700 (PDT)
X-Received: by 10.55.117.5 with SMTP id q5mr8536397qkc.195.1461405908593;
        Sat, 23 Apr 2016 03:05:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si5334383qkb.7.2016.04.23.03.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 03:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atuR2-0006Co-40
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 06:05:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQy-00067U-2S
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 06:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQx-0005vi-63
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 06:05:03 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atuQr-0005tn-DC; Sat, 23 Apr 2016 06:04:58 -0400
Received: from 172.24.1.47 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DJI66788; Sat, 23 Apr 2016 18:04:38 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml422-hub.china.huawei.com (10.82.67.152) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 18:04:26 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 18:04:13 +0800
Message-ID: <1461405855-15576-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571B48B7.0191, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1323616837cadf6aa8f61f82ba3ea05d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: [Qemu-arm] [PATCH v2 1/3] target-arm: kvm64: set guest PMUv3
 feature bit if supported
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/cNV+7KXSUU

From: Shannon Zhao <shannon.zhao@linaro.org>

Check if kvm supports guest PMUv3. If so, set the corresponding feature
bit for vcpu.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 target-arm/cpu-qom.h | 2 ++
 target-arm/kvm64.c   | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 1061c08..93aa6a4 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -105,6 +105,8 @@ typedef struct ARMCPU {
     bool powered_off;
     /* CPU has security extension */
     bool has_el3;
+    /* CPU has PMU (Performance Monitor Unit) */
+    bool has_pmu;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index e8527bf..b364789 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -461,6 +461,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
+    if (kvm_irqchip_in_kernel() &&
+        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
+        cpu->has_pmu = true;
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.0.4


