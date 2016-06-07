Received: by 10.25.27.66 with SMTP id b63csp1783980lfb;
        Mon, 6 Jun 2016 19:51:29 -0700 (PDT)
X-Received: by 10.55.89.131 with SMTP id n125mr19776868qkb.143.1465267889634;
        Mon, 06 Jun 2016 19:51:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k47si12857576qgd.21.2016.06.06.19.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 19:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA773-00080A-2D
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 22:51:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA738-0004R2-P9
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 22:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA736-0003eT-Qu
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 22:47:25 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:14589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA72z-0003Z3-1w; Mon, 06 Jun 2016 22:47:17 -0400
Received: from 172.24.1.137 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCU77799; Tue, 07 Jun 2016 10:46:42 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 7 Jun 2016 10:46:31 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 10:46:15 +0800
Message-ID: <1465267577-1808-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
References: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.57563594.0101, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6740b56701c6ae0dee0b12ec249d6f47
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v5 1/3] target-arm: kvm64: set guest PMUv3
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uj5tAa5iHaG/

From: Shannon Zhao <shannon.zhao@linaro.org>

Check if kvm supports guest PMUv3. If so, set the corresponding feature
bit for vcpu.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 target-arm/cpu.h   | 2 ++
 target-arm/kvm64.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 401955f..fa6388f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -574,6 +574,8 @@ struct ARMCPU {
     bool powered_off;
     /* CPU has security extension */
     bool has_el3;
+    /* CPU has PMU (Performance Monitor Unit) */
+    bool has_pmu;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index e2a34f6..75383c8 100644
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


