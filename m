Received: by 10.25.205.13 with SMTP id d13csp1291796lfg;
        Mon, 16 Jan 2017 01:35:49 -0800 (PST)
X-Received: by 10.200.34.12 with SMTP id o12mr23725028qto.93.1484559349505;
        Mon, 16 Jan 2017 01:35:49 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f12si13868128qkf.134.2017.01.16.01.35.49;
        Mon, 16 Jan 2017 01:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 230D9401A1;
	Mon, 16 Jan 2017 04:33:58 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFDsO8PZeR6N; Mon, 16 Jan 2017 04:33:55 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AADE340698;
	Mon, 16 Jan 2017 04:33:47 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 49C48401A1
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:46 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfm9OA4HP4Eu for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:33:41 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C82344027C
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:39 -0500 (EST)
Received: from 172.24.1.137 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.137])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49626; Mon, 16 Jan 2017 17:35:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:51 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Date: Mon, 16 Jan 2017 17:33:33 +0800
Message-ID: <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090205.587C93C5.0123, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4148ac2e28ebdd288cfa9faa38f0df68
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com
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
X-TUID: m8/Us7uy7hpC

From: Shannon Zhao <shannon.zhao@linaro.org>

When initializing KVM, check whether physical hardware is a
heterogeneous system through the MIDR values. If so, force userspace to
set the KVM_ARM_VCPU_CROSS feature bit. Otherwise, it should fail to
initialize VCPUs.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 arch/arm/kvm/arm.c       | 26 ++++++++++++++++++++++++++
 include/uapi/linux/kvm.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
index bdceb19..21ec070 100644
--- a/arch/arm/kvm/arm.c
+++ b/arch/arm/kvm/arm.c
@@ -46,6 +46,7 @@
 #include <asm/kvm_coproc.h>
 #include <asm/kvm_psci.h>
 #include <asm/sections.h>
+#include <asm/cputype.h>
 
 #ifdef REQUIRES_VIRT
 __asm__(".arch_extension	virt");
@@ -65,6 +66,7 @@ static unsigned int kvm_vmid_bits __read_mostly;
 static DEFINE_SPINLOCK(kvm_vmid_lock);
 
 static bool vgic_present;
+static bool heterogeneous_system;
 
 static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
 
@@ -210,6 +212,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_CROSS_VCPU:
 		r = 1;
 		break;
+	case KVM_CAP_ARM_HETEROGENEOUS:
+		r = heterogeneous_system;
+		break;
 	case KVM_CAP_COALESCED_MMIO:
 		r = KVM_COALESCED_MMIO_PAGE_OFFSET;
 		break;
@@ -812,6 +817,12 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	int phys_target = kvm_target_cpu();
 	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
 
+	if (heterogeneous_system && !cross_vcpu) {
+		kvm_err("%s:Host is a heterogeneous system, set KVM_ARM_VCPU_CROSS bit\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	if (!cross_vcpu && init->target != phys_target)
 		return -EINVAL;
 
@@ -1397,6 +1408,11 @@ static void check_kvm_target_cpu(void *ret)
 	*(int *)ret = kvm_target_cpu();
 }
 
+static void get_physical_cpu_midr(void *midr)
+{
+	*(u32 *)midr = read_cpuid_id();
+}
+
 struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr)
 {
 	struct kvm_vcpu *vcpu;
@@ -1417,6 +1433,7 @@ int kvm_arch_init(void *opaque)
 {
 	int err;
 	int ret, cpu;
+	u32 current_midr, midr;
 
 	if (!is_hyp_mode_available()) {
 		kvm_err("HYP mode not available\n");
@@ -1431,6 +1448,15 @@ int kvm_arch_init(void *opaque)
 		}
 	}
 
+	current_midr = read_cpuid_id();
+	for_each_online_cpu(cpu) {
+		smp_call_function_single(cpu, get_physical_cpu_midr, &midr, 1);
+		if (current_midr != midr) {
+			heterogeneous_system = true;
+			break;
+		}
+	}
+
 	err = init_common_resources();
 	if (err)
 		return err;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 46115a2..cc2b63d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -872,6 +872,7 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_MSI_DEVID 131
 #define KVM_CAP_PPC_HTM 132
 #define KVM_CAP_ARM_CROSS_VCPU 133
+#define KVM_CAP_ARM_HETEROGENEOUS 134
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
