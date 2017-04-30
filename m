Received: by 10.25.0.144 with SMTP id 138csp829194lfa;
        Sat, 29 Apr 2017 22:28:10 -0700 (PDT)
X-Received: by 10.55.40.100 with SMTP id o97mr18184721qkh.257.1493530090771;
        Sat, 29 Apr 2017 22:28:10 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id r24si10624319qtc.121.2017.04.29.22.28.10;
        Sat, 29 Apr 2017 22:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 075C249BFD;
	Sun, 30 Apr 2017 01:25:12 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZ6d37vcuKqE; Sun, 30 Apr 2017 01:25:10 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0AF6749C01;
	Sun, 30 Apr 2017 01:25:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AC78340F7D
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:08 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnUTGCV9pssH for <kvmarm@lists.cs.columbia.edu>;
 Sun, 30 Apr 2017 01:25:07 -0400 (EDT)
Received: from dggrg02-dlp.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id BA91640FA5
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:05 -0400 (EDT)
Received: from 172.30.72.54 (EHLO DGGEML404-HUB.china.huawei.com)
 ([172.30.72.54])
 by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id AMQ72313; Sun, 30 Apr 2017 13:27:33 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server id
 14.3.301.0; Sun, 30 Apr 2017 13:27:20 +0800
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
Subject: [PATCH v3 2/3] arm64: kvm: inject SError with virtual syndrome
Date: Sun, 30 Apr 2017 13:37:56 +0800
Message-ID: <1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020204.590575C9.0050, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 81dc9f3ba5dc7c74450c91c79f658fed
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
X-TUID: C1bJ+jrp3IbF

when SError happen, kvm notifies kvmtool to generate GHES table
to record the error, then kvmtools inject the SError with specified
virtual syndrome. when switch to guest, a virtual SError will happen with
this specified syndrome.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 arch/arm64/include/asm/esr.h         |  2 ++
 arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
 arch/arm64/include/asm/kvm_host.h    |  1 +
 arch/arm64/include/asm/sysreg.h      |  3 +++
 arch/arm64/kvm/handle_exit.c         | 25 +++++++++++++++++++------
 arch/arm64/kvm/hyp/switch.c          | 15 ++++++++++++++-
 include/uapi/linux/kvm.h             |  5 +++++
 7 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index 22f9c90..d009c99 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -127,6 +127,8 @@
 #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
 #define ESR_ELx_xVC_IMM_MASK	((1UL << 16) - 1)
 
+#define VSESR_ELx_IDS_ISS_MASK    ((1UL << 25) - 1)
+
 /* ESR value templates for specific events */
 
 /* BRK instruction trap from AArch64 state */
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index f5ea0ba..a3259a9 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -148,6 +148,16 @@ static inline u32 kvm_vcpu_get_hsr(const struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault.esr_el2;
 }
 
+static inline u32 kvm_vcpu_get_vsesr(const struct kvm_vcpu *vcpu)
+{
+		return vcpu->arch.fault.vsesr_el2;
+}
+
+static inline void kvm_vcpu_set_vsesr(struct kvm_vcpu *vcpu, unsigned long val)
+{
+		vcpu->arch.fault.vsesr_el2 = val;
+}
+
 static inline int kvm_vcpu_get_condition(const struct kvm_vcpu *vcpu)
 {
 	u32 esr = kvm_vcpu_get_hsr(vcpu);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e7705e7..84ed239 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -86,6 +86,7 @@ struct kvm_vcpu_fault_info {
 	u32 esr_el2;		/* Hyp Syndrom Register */
 	u64 far_el2;		/* Hyp Fault Address Register */
 	u64 hpfar_el2;		/* Hyp IPA Fault Address Register */
+	u32 vsesr_el2;		/* Virtual SError Exception Syndrome Register */
 };
 
 /*
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 32964c7..b6afb7a 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -125,6 +125,9 @@
 #define REG_PSTATE_PAN_IMM		sys_reg(0, 0, 4, 0, 4)
 #define REG_PSTATE_UAO_IMM		sys_reg(0, 0, 4, 0, 3)
 
+#define VSESR_EL2			sys_reg(3, 4, 5, 2, 3)
+
+
 #define SET_PSTATE_PAN(x) __emit_inst(0xd5000000 | REG_PSTATE_PAN_IMM |	\
 				      (!!x)<<8 | 0x1f)
 #define SET_PSTATE_UAO(x) __emit_inst(0xd5000000 | REG_PSTATE_UAO_IMM |	\
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index c89d83a..3d024a9 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -180,7 +180,11 @@ static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
 
 static int kvm_handle_guest_sei(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
-	unsigned long fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
+	unsigned long hva, fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
+	struct kvm_memory_slot *memslot;
+	int hsr, ret = 1;
+	bool writable;
+	gfn_t gfn;
 
 	if (handle_guest_sei((unsigned long)fault_ipa,
 				kvm_vcpu_get_hsr(vcpu))) {
@@ -190,9 +194,20 @@ static int kvm_handle_guest_sei(struct kvm_vcpu *vcpu, struct kvm_run *run)
 				(unsigned long)kvm_vcpu_get_hsr(vcpu));
 
 		kvm_inject_vabt(vcpu);
+	} else {
+		hsr = kvm_vcpu_get_hsr(vcpu);
+
+		gfn = fault_ipa >> PAGE_SHIFT;
+		memslot = gfn_to_memslot(vcpu->kvm, gfn);
+		hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
+
+		run->exit_reason = KVM_EXIT_INTR;
+		run->intr.syndrome_info = hsr;
+		run->intr.address = hva;
+		ret = 0;
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
@@ -218,8 +233,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			*vcpu_pc(vcpu) -= adj;
 		}
 
-		kvm_handle_guest_sei(vcpu, run);
-		return 1;
+		return kvm_handle_guest_sei(vcpu, run);
 	}
 
 	exception_index = ARM_EXCEPTION_CODE(exception_index);
@@ -228,8 +242,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case ARM_EXCEPTION_IRQ:
 		return 1;
 	case ARM_EXCEPTION_EL1_SERROR:
-		kvm_handle_guest_sei(vcpu, run);
-		return 1;
+		return kvm_handle_guest_sei(vcpu, run);
 	case ARM_EXCEPTION_TRAP:
 		/*
 		 * See ARM ARM B1.14.1: "Hyp traps on instructions
diff --git a/arch/arm64/kvm/hyp/switch.c b/arch/arm64/kvm/hyp/switch.c
index aede165..ded6211 100644
--- a/arch/arm64/kvm/hyp/switch.c
+++ b/arch/arm64/kvm/hyp/switch.c
@@ -86,6 +86,13 @@ static void __hyp_text __activate_traps(struct kvm_vcpu *vcpu)
 		isb();
 	}
 	write_sysreg(val, hcr_el2);
+    /* If virtual System Error or Asynchronous Abort is pending. set
+     * the virtual exception syndrome information
+     */
+	if (cpus_have_cap(ARM64_HAS_RAS_EXTN) &&
+			(vcpu->arch.hcr_el2 & HCR_VSE))
+		write_sysreg_s(vcpu->arch.fault.vsesr_el2, VSESR_EL2);
+
 	/* Trap on AArch32 cp15 c15 accesses (EL1 or EL0) */
 	write_sysreg(1 << 15, hstr_el2);
 	/*
@@ -139,9 +146,15 @@ static void __hyp_text __deactivate_traps(struct kvm_vcpu *vcpu)
 	 * the crucial bit is "On taking a vSError interrupt,
 	 * HCR_EL2.VSE is cleared to 0."
 	 */
-	if (vcpu->arch.hcr_el2 & HCR_VSE)
+	if (vcpu->arch.hcr_el2 & HCR_VSE) {
 		vcpu->arch.hcr_el2 = read_sysreg(hcr_el2);
 
+		if (cpus_have_cap(ARM64_HAS_RAS_EXTN)) {
+			/* set vsesr_el2[24:0] with esr_el2[24:0] */
+			kvm_vcpu_set_vsesr(vcpu, read_sysreg_el2(esr)
+					& VSESR_ELx_IDS_ISS_MASK);
+		}
+	}
 	__deactivate_traps_arch()();
 	write_sysreg(0, hstr_el2);
 	write_sysreg(0, pmuserenr_el0);
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 27fe556..bb02909 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -360,6 +360,11 @@ struct kvm_run {
 		struct {
 			__u8 vector;
 		} eoi;
+		/* KVM_EXIT_INTR */
+		struct {
+			__u32 syndrome_info;
+			__u64 address;
+		} intr;
 		/* KVM_EXIT_HYPERV */
 		struct kvm_hyperv_exit hyperv;
 		/* Fix the size of the union. */
-- 
2.10.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
