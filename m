Received: by 10.25.21.156 with SMTP id 28csp192382lfv;
        Wed, 24 Aug 2016 01:03:38 -0700 (PDT)
X-Received: by 10.200.56.90 with SMTP id r26mr1737114qtb.37.1472025818575;
        Wed, 24 Aug 2016 01:03:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j124si5555561qkc.104.2016.08.24.01.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 01:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcT9u-0000wc-4n
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 04:03:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9g-0000m8-Ju
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9a-0003wj-Pb
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:03:23 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:48789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bcT9J-0003kj-U4; Wed, 24 Aug 2016 04:03:02 -0400
Received: from 172.24.1.60 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMC33639; Wed, 24 Aug 2016 16:02:48 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml430-hub.china.huawei.com (10.82.67.185) with Microsoft SMTP
	Server id 14.3.235.1; Wed, 24 Aug 2016 16:02:39 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2016 16:02:22 +0800
Message-ID: <1472025743-11484-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
References: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.57BD54A8.00E4, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5a315524558e38539e6a08c2359f3a9a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [RFC PATCH 2/3] target-arm/kvm64: Add cortex-a72 cpu
 support
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
Cc: qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ad09ipEdXWvD

From: Shannon Zhao <shannon.zhao@linaro.org>

Enable cortex-a72 cpu support for KVM.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 3 ++-
 target-arm/cpu64.c            | 1 +
 target-arm/kvm-consts.h       | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..1e9ef4b 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -65,8 +65,9 @@ struct kvm_regs {
 #define KVM_ARM_TARGET_CORTEX_A53	4
 /* Generic ARM v8 target */
 #define KVM_ARM_TARGET_GENERIC_V8	5
+#define KVM_ARM_TARGET_CORTEX_A72	6
 
-#define KVM_ARM_NUM_TARGETS		6
+#define KVM_ARM_NUM_TARGETS		7
 
 /* KVM_ARM_SET_DEVICE_ADDR ioctl id encoding */
 #define KVM_ARM_DEVICE_TYPE_SHIFT	0
diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index 1a4ecf5..dc9beaf 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -219,6 +219,7 @@ static void aarch64_a72_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A72;
     cpu->midr = 0x410fd081;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034080;
diff --git a/target-arm/kvm-consts.h b/target-arm/kvm-consts.h
index a2c9518..93f2eec 100644
--- a/target-arm/kvm-consts.h
+++ b/target-arm/kvm-consts.h
@@ -128,6 +128,7 @@ MISMATCH_CHECK(QEMU_PSCI_RET_DISABLED, PSCI_RET_DISABLED)
 #define QEMU_KVM_ARM_TARGET_CORTEX_A57 2
 #define QEMU_KVM_ARM_TARGET_XGENE_POTENZA 3
 #define QEMU_KVM_ARM_TARGET_CORTEX_A53 4
+#define QEMU_KVM_ARM_TARGET_CORTEX_A72 6
 
 /* There's no kernel define for this: sentinel value which
  * matches no KVM target value for either 64 or 32 bit
@@ -140,6 +141,7 @@ MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_FOUNDATION_V8, KVM_ARM_TARGET_FOUNDATION_V8)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A57, KVM_ARM_TARGET_CORTEX_A57)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_XGENE_POTENZA, KVM_ARM_TARGET_XGENE_POTENZA)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A53, KVM_ARM_TARGET_CORTEX_A53)
+MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A72, KVM_ARM_TARGET_CORTEX_A72)
 #else
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A15, KVM_ARM_TARGET_CORTEX_A15)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A7, KVM_ARM_TARGET_CORTEX_A7)
-- 
2.0.4


