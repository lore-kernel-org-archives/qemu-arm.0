Received: by 10.223.188.70 with SMTP id a6csp409775wrh;
        Fri, 18 Aug 2017 07:01:47 -0700 (PDT)
X-Received: by 10.200.45.82 with SMTP id o18mr11933455qta.303.1503064907028;
        Fri, 18 Aug 2017 07:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503064907; cv=none;
        d=google.com; s=arc-20160816;
        b=f9sNSPjJ2qZs3BdKeeQpD1GjaKNjSIiXJr6JvYSjn+qZDZl2Gga+UTi40iGBgY2CzU
         9hyMWCTIRHtuyh9DgBQMFPwnvzLmGLGAaEqcFbVztJGjUrAuSsy5akAw1zKUvm3cIV3L
         lCfmmfeoOCVJ94wiXpU8Gtb1B5w9ogujCukPuRcDprs9PGkJ6YghmqAQe7zXOF1uTn6v
         w0fmwOF4FoUfNhs7ukFdR9gO8VabRXSJzOUJYxZSSqJDY3hP+Rq56bhfuWFKyM2m7AcB
         QGg7Mr8uvYhIVgQWsMpQdqMtbcT+gRUOWRvKVdaLcxKijBXY5S6r/MBFQUy4iHdL1qLv
         jcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :arc-authentication-results;
        bh=/DXl7kQFcoDM3nZZy0Mj/p/VfEUXlqakHeixualBPaI=;
        b=PveGh6CcjVRnd2tu9yqA2CCDVXZ/1SAkSJhN0NgWQF90l1ZfUdAo1tTfHU+o+Car2C
         q6nqJ2Nzx6mdet3abG9dj9NHdZu4XG2a3e4DB4HaSzGljVodFK3fRroNVzG1Cdni/fb/
         4QT7pmrf/qjs67zhISdvRHjZwC9Swq6Arpk6hHiwjAzaZ/AxgcAy74VIq8U+8OaqiI0H
         gzaucQ47ZU0YOtbpPZlcOBGdwY+cJfNerk91jOS25GxlMajRbyY79Fil252GalbUKKGo
         lI9wjSh/MKUCR6kYwi4Xq0whB2e0DyEOd6r8b4ti91MAKyiy29bRU7gfxQ6oxzdYEpR5
         APcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id s29si5440492qts.355.2017.08.18.07.01.46;
        Fri, 18 Aug 2017 07:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8B5C749CC3;
	Fri, 18 Aug 2017 09:59:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QclPxpaqKEo6; Fri, 18 Aug 2017 09:59:56 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6020849CCD;
	Fri, 18 Aug 2017 09:59:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E67C949CA7
 for <kvmarm@lists.cs.columbia.edu>; Fri, 18 Aug 2017 09:59:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74376klblYAw for <kvmarm@lists.cs.columbia.edu>;
 Fri, 18 Aug 2017 09:59:53 -0400 (EDT)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 04D5149CB6
 for <kvmarm@lists.cs.columbia.edu>; Fri, 18 Aug 2017 09:59:51 -0400 (EDT)
Received: from 172.30.72.58 (EHLO DGGEMS411-HUB.china.huawei.com)
 ([172.30.72.58])
 by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id DFM74412; Fri, 18 Aug 2017 22:00:48 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.301.0; Fri, 18 Aug 2017 22:00:14 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <mst@redhat.com>, <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>,
 <edk2-devel@lists.01.org>, <christoffer.dall@linaro.org>,
 <marc.zyngier@arm.com>, <will.deacon@arm.com>, <james.morse@arm.com>,
 <tbaicar@codeaurora.org>, <ard.biesheuvel@linaro.org>,
 <mingo@kernel.org>, <bp@suse.de>, <shiju.jose@huawei.com>,
 <zjzhang@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
 <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
 <wangzhou1@hisilicon.com>
Subject: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for the
 guest OS
Date: Fri, 18 Aug 2017 22:23:47 +0800
Message-ID: <1503066227-18251-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A0B0207.5996F310.019D, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a2fc3c2d8f4dd5ae8c41d992041e0951
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
 linuxarm@huawei.com, gengdongjiu@huawei.com
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
X-TUID: uw//xIboBJse

When guest OS happens SError interrupt(SEI), it will trap to host.
Host firstly calls memory failure to deal with this error and decide
whether it needs to deliver SIGBUS signal to userspace. The advantage
that using signal to notify is that it can make the notification method
is general, non-KVM user can also use it. when userspace gets this
signal and knows this is SError interrupt, it will translate the
delivered host VA to PA and record this PA to GHES.

Because ARMv8.2 adds an extension to RAS to allow system software insert
implicit Error Synchronization Barrier operations to isolate the error and
allow passes specified syndrome to guest OS, so after record the CPER, user
space calls IOCTL to pass a specified syndrome to KVM, then switch to guest
OS, guest OS can use the recorded CPER record and syndrome information to
do the recovery.

The steps are shown below:
1. translate the host VA to guest OS PA and record this error PA to HEST table.
2. set specified virtual SError syndrome and pass the value to KVM.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>
---
 linux-headers/linux/kvm.h |  1 +
 target/arm/internals.h    |  1 +
 target/arm/kvm64.c        | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 2aa176e..10dfcab 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1356,6 +1356,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_S390_CMMA_MIGRATION */
 #define KVM_S390_GET_CMMA_BITS      _IOWR(KVMIO, 0xb8, struct kvm_s390_cmma_log)
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
+#define KVM_ARM_SEI                 _IO(KVMIO,   0xb10)
 
 #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
 #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fc0ad6d..18b1cbc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -237,6 +237,7 @@ enum arm_exception_class {
 #define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
 #define ARM_EL_EC_MASK  ((0x3F) << ARM_EL_EC_SHIFT)
 #define ARM_EL_FSC_TYPE (0x3C)
+#define ARM_EL_ISS_MASK ((1 << ARM_EL_IL_SHIFT) - 1)
 
 #define FSC_SEA         (0x10)
 #define FSC_SEA_TTW0    (0x14)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d3bdab2..b84cb49 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -616,6 +616,22 @@ static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
     return -EINVAL;
 }
 
+static int kvm_inject_arm_sei(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    unsigned long syndrome = env->exception.vaddress;
+    /* set virtual SError syndrome */
+    if (arm_feature(env, ARM_FEATURE_RAS_EXTENSION)) {
+        syndrome = syndrome & ARM_EL_ISS_MASK;
+    } else {
+        syndrome = 0;
+    }
+
+    return  kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_SEI, &syndrome);
+}
+
 /* Inject synchronous external abort */
 static int kvm_inject_arm_sea(CPUState *c)
 {
@@ -1007,6 +1023,15 @@ static bool is_abort_sea(unsigned long syndrome)
     }
 }
 
+static bool is_abort_sei(unsigned long syndrome)
+{
+    uint8_t ec = ((syndrome & ARM_EL_EC_MASK) >> ARM_EL_EC_SHIFT);
+    if ((ec != EC_SERROR))
+        return false;
+    else
+        return true;
+}
+
 void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
@@ -1024,6 +1049,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
             if (is_abort_sea(env->exception.syndrome)) {
                 ghes_update_guest(ACPI_HEST_NOTIFY_SEA, paddr);
                 kvm_inject_arm_sea(c);
+            } else if (is_abort_sei(env->exception.syndrome)) {
+                ghes_update_guest(ACPI_HEST_NOTIFY_SEI, paddr);
+                kvm_inject_arm_sei(c);
             }
             return;
         }
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
