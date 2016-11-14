Received: by 10.25.150.194 with SMTP id y185csp1026753lfd;
        Mon, 14 Nov 2016 06:32:14 -0800 (PST)
X-Received: by 10.99.189.1 with SMTP id a1mr29226406pgf.142.1479133934737;
        Mon, 14 Nov 2016 06:32:14 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d124si22421151pga.215.2016.11.14.06.32.14;
        Mon, 14 Nov 2016 06:32:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752396AbcKNOcK (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Mon, 14 Nov 2016 09:32:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:57069 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752009AbcKNOcI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Nov 2016 09:32:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CA6C9AAB7;
        Mon, 14 Nov 2016 14:32:06 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     QEMU Developers <qemu-devel@nongnu.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: [PATCH RFC v2 1/2] linux-headers: update
Date:   Mon, 14 Nov 2016 15:32:14 +0100
Message-Id: <1479133935-63848-2-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1479133935-63848-1-git-send-email-agraf@suse.de>
References: <1479133935-63848-1-git-send-email-agraf@suse.de>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: I3k/MWN+Gk/n

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

