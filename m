Received: by 10.80.166.35 with SMTP id d32csp1781255edc;
        Sat, 29 Oct 2016 14:10:50 -0700 (PDT)
X-Received: by 10.55.220.130 with SMTP id v124mr17534692qki.232.1477775450754;
        Sat, 29 Oct 2016 14:10:50 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u9si3559070qtc.143.2016.10.29.14.10.50;
        Sat, 29 Oct 2016 14:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E11E9406C9;
	Sat, 29 Oct 2016 17:10:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lxrg2t0p+Z5v; Sat, 29 Oct 2016 17:10:40 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 344F6406BE;
	Sat, 29 Oct 2016 17:10:40 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B06DB406A4
 for <kvmarm@lists.cs.columbia.edu>; Sat, 29 Oct 2016 17:10:38 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnDfADFO7L1k for <kvmarm@lists.cs.columbia.edu>;
 Sat, 29 Oct 2016 17:10:37 -0400 (EDT)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8FB0A406A8
 for <kvmarm@lists.cs.columbia.edu>; Sat, 29 Oct 2016 17:10:37 -0400 (EDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20D35ABFB;
 Sat, 29 Oct 2016 21:10:42 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 1/2] linux-headers: update
Date: Sat, 29 Oct 2016 23:10:48 +0200
Message-Id: <1477775449-115472-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
Cc: qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 pbonzini@redhat.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: USzjgwX8Xk8a

This patch updates the Linux headers to include the in-progress user
space ARM timer patches. It is explicitly RFC, as the patches are not
merged yet.
---
 linux-headers/asm-arm/kvm.h   | 1 +
 linux-headers/asm-arm64/kvm.h | 1 +
 linux-headers/linux/kvm.h     | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 541268c..5d58ec2 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -105,6 +105,7 @@ struct kvm_debug_exit_arch {
 };
 
 struct kvm_sync_regs {
+	__u8 timer_irq_level;
 };
 
 struct kvm_arch_memory_slot {
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index fd5a276..0e1cbd1 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -143,6 +143,7 @@ struct kvm_debug_exit_arch {
 #define KVM_GUESTDBG_USE_HW		(1 << 17)
 
 struct kvm_sync_regs {
+	__u8 timer_irq_level;
 };
 
 struct kvm_arch_memory_slot {
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 4806e06..737113c 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -870,6 +870,7 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_S390_USER_INSTR0 130
 #define KVM_CAP_MSI_DEVID 131
 #define KVM_CAP_PPC_HTM 132
+#define KVM_CAP_ARM_TIMER 133
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1327,4 +1328,9 @@ struct kvm_assigned_msix_entry {
 #define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
 #define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
 
+/* Available with KVM_CAP_ARM_TIMER */
+
+/* Bits for run->arm_timer.timesource */
+#define KVM_ARM_TIMER_VTIMER           (1 << 0)
+
 #endif /* __LINUX_KVM_H */
-- 
1.8.5.6

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
