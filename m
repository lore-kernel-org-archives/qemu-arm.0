Received: by 10.25.0.144 with SMTP id 138csp829174lfa;
        Sat, 29 Apr 2017 22:28:07 -0700 (PDT)
X-Received: by 10.55.147.67 with SMTP id v64mr15223997qkd.39.1493530086912;
        Sat, 29 Apr 2017 22:28:06 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f25si10782971qte.11.2017.04.29.22.28.06;
        Sat, 29 Apr 2017 22:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 81D1C40F8A;
	Sun, 30 Apr 2017 01:25:07 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5sGQLtsHacn; Sun, 30 Apr 2017 01:25:06 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BF1054122C;
	Sun, 30 Apr 2017 01:25:06 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DFF8440F8A
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:05 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOB633T6zY1J for <kvmarm@lists.cs.columbia.edu>;
 Sun, 30 Apr 2017 01:25:04 -0400 (EDT)
Received: from dggrg02-dlp.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C1A4340F7D
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:03 -0400 (EDT)
Received: from 172.30.72.54 (EHLO DGGEML404-HUB.china.huawei.com)
 ([172.30.72.54])
 by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id AMQ72312; Sun, 30 Apr 2017 13:27:32 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server id
 14.3.301.0; Sun, 30 Apr 2017 13:27:19 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <james.morse@arm.com>, <marc.zyngier@arm.com>,
 <christoffer.dall@linaro.org>, <rkrcmar@redhat.com>,
 <linux@armlinux.org.uk>, <tbaicar@codeaurora.org>,
 <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <lersek@redhat.com>,
 <ard.biesheuvel@linaro.org>, <mtsirkin@redhat.com>,
 <drjones@redhat.com>, <ben@skyportsystems.com>, <kvm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS extension
 feature
Date: Sun, 30 Apr 2017 13:37:55 +0800
Message-ID: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020203.590575C8.00D5, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f8c2fccb48e12eb4d2821e9a7f967bb
Cc: songwenjun@huawei.com, wuquanming@huawei.com, gengdongjiu@huawei.com,
 huangshaoyu@huawei.com, wangxiongfeng2@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: AQ2eOsgMS7VP

Handle kvmtool's detection for RAS extension, because sometimes
the APP needs to know the CPU's capacity

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 arch/arm64/kvm/reset.c   | 11 +++++++++++
 include/uapi/linux/kvm.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index d9e9697..1004039 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -64,6 +64,14 @@ static bool cpu_has_32bit_el1(void)
 	return !!(pfr0 & 0x20);
 }
 
+static bool kvm_arm_support_ras_extension(void)
+{
+	u64 pfr0;
+
+	pfr0 = read_system_reg(SYS_ID_AA64PFR0_EL1);
+	return !!(pfr0 & 0x10000000);
+}
+
 /**
  * kvm_arch_dev_ioctl_check_extension
  *
@@ -87,6 +95,9 @@ int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PMU_V3:
 		r = kvm_arm_support_pmu_v3();
 		break;
+	case KVM_CAP_ARM_RAS_EXTENSION:
+		r = kvm_arm_support_ras_extension();
+		break;
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 		r = 1;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index f51d508..27fe556 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -883,6 +883,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_MMU_RADIX 134
 #define KVM_CAP_PPC_MMU_HASH_V3 135
 #define KVM_CAP_IMMEDIATE_EXIT 136
+#define KVM_CAP_ARM_RAS_EXTENSION 137
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.10.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
