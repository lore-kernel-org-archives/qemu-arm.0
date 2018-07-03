Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp697176wrq;
        Tue, 3 Jul 2018 00:28:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfzvS8cxEbVFaSCScmV8fr8PhY7CahE52FFBwLEXh1BPjXHeFcsE0OBrkVnt4qmBmtYPK7m
X-Received: by 2002:aed:3f7c:: with SMTP id q57-v6mr26116991qtf.256.1530602900341;
        Tue, 03 Jul 2018 00:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602900; cv=none;
        d=google.com; s=arc-20160816;
        b=rvPXUFu6gV4+x9hAONCs1uGxJBvmEe9OrHn/Zjd2c9Ccg+4LZim+mnTFTsysXS3m3t
         MU0tvYGqv5PeSbuQL829bMA8wAgu7A2aasZgLlFdeUx3G4KO5naaYU2XpDvHsJMKc38A
         mezfA1R3L8aZbepilFAF6xT7yCQ97EPpFWHsjw95abeqAoVJ6sxlXYB/+8xfkAKQvohx
         qBZNUvCdajnC+nZUQlnCxriY+YE/wnwyVOjeC8QNNsUENuqwMpDfikj/wIQ6spccEgN4
         jeQsKtFrTGocm1l7GafoA2ECFxcScvo67Z1UjJ6TOw1crgwzhtsokHeQkQ3mhnq1ITm8
         ClMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5ihKmth+ZfmbKazNAhC9SE9+YyKxaJuZjIO5l/yxZeI=;
        b=clUZxP7UAlXfEEGaZkOMMpOdVrvA284NomZo2SMS6qRzodZZGGs3Xfsn+a1/1zTwsN
         ji++67WrjJ40PzmTQ2z+7LN8GjQv1ZR0Yvjbyup++iDIi+tOnxDi4+neL+Zw28hKmNoc
         8CbiYyDKRGPxQDpFFSOq9MKDN02GRY1AG5WfbxVFcBeYN5vo0NmxEcUBbPANAKh13T/w
         2hX2Y3Smp0NOlUt75b09iSjEZxWMpZMNWEtFaUP2xF5OsSZTPXk4MgLx7OcvzxdRh+AI
         ELzGg0BdhimQWNCxmKEOEt6jLFybmjcV/pkAcFwBLbEVmlCBHg+h4hvsRMwVRoMc29Ww
         /jVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v36-v6si473360qvc.168.2018.07.03.00.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFjX-0004rg-Rl
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:28:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFg3-0003oO-W7
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFbr-00050c-Gx
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:24:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46742 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFbq-0004zT-Th; Tue, 03 Jul 2018 03:20:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AED39857AB;
	Tue,  3 Jul 2018 07:20:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BADA21C5A3;
	Tue,  3 Jul 2018 07:20:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:44 +0200
Message-Id: <1530602398-16127-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:21 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 01/15] linux-headers: header update for KVM/ARM
 KVM_ARM_GET_MAX_VM_PHYS_SHIFT
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PxitZWBAhocH

This is a header update against

git://linux-arm.org/linux-skp.git ipa52/v3

to get the KVM_ARM_GET_MAX_VM_PHYS_SHIFT ioctl. This allows to retrieve
the IPA address range KVM supports.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/virtio_config.h | 16 ++++++++++++----
 linux-headers/asm-mips/unistd.h                | 18 ++++++++++++------
 linux-headers/asm-powerpc/kvm.h                |  1 +
 linux-headers/linux/kvm.h                      | 16 ++++++++++++++++
 4 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index b777069..0b19436 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -45,11 +45,14 @@
 /* We've given up on this device. */
 #define VIRTIO_CONFIG_S_FAILED		0x80
 
-/* Some virtio feature bits (currently bits 28 through 32) are reserved for the
- * transport being used (eg. virtio_ring), the rest are per-device feature
- * bits. */
+/*
+ * Virtio feature bits VIRTIO_TRANSPORT_F_START through
+ * VIRTIO_TRANSPORT_F_END are reserved for the transport
+ * being used (e.g. virtio_ring, virtio_pci etc.), the
+ * rest are per-device feature bits.
+ */
 #define VIRTIO_TRANSPORT_F_START	28
-#define VIRTIO_TRANSPORT_F_END		34
+#define VIRTIO_TRANSPORT_F_END		38
 
 #ifndef VIRTIO_CONFIG_NO_LEGACY
 /* Do we get callbacks when the ring is completely used, even if we've
@@ -71,4 +74,9 @@
  * this is for compatibility with legacy systems.
  */
 #define VIRTIO_F_IOMMU_PLATFORM		33
+
+/*
+ * Does the device support Single Root I/O Virtualization?
+ */
+#define VIRTIO_F_SR_IOV			37
 #endif /* _LINUX_VIRTIO_CONFIG_H */
diff --git a/linux-headers/asm-mips/unistd.h b/linux-headers/asm-mips/unistd.h
index 9bfef7f..d4a85ef 100644
--- a/linux-headers/asm-mips/unistd.h
+++ b/linux-headers/asm-mips/unistd.h
@@ -388,17 +388,19 @@
 #define __NR_pkey_alloc			(__NR_Linux + 364)
 #define __NR_pkey_free			(__NR_Linux + 365)
 #define __NR_statx			(__NR_Linux + 366)
+#define __NR_rseq			(__NR_Linux + 367)
+#define __NR_io_pgetevents		(__NR_Linux + 368)
 
 
 /*
  * Offset of the last Linux o32 flavoured syscall
  */
-#define __NR_Linux_syscalls		366
+#define __NR_Linux_syscalls		368
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
 
 #define __NR_O32_Linux			4000
-#define __NR_O32_Linux_syscalls		366
+#define __NR_O32_Linux_syscalls		368
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64
 
@@ -733,16 +735,18 @@
 #define __NR_pkey_alloc			(__NR_Linux + 324)
 #define __NR_pkey_free			(__NR_Linux + 325)
 #define __NR_statx			(__NR_Linux + 326)
+#define __NR_rseq			(__NR_Linux + 327)
+#define __NR_io_pgetevents		(__NR_Linux + 328)
 
 /*
  * Offset of the last Linux 64-bit flavoured syscall
  */
-#define __NR_Linux_syscalls		326
+#define __NR_Linux_syscalls		328
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
 
 #define __NR_64_Linux			5000
-#define __NR_64_Linux_syscalls		326
+#define __NR_64_Linux_syscalls		328
 
 #if _MIPS_SIM == _MIPS_SIM_NABI32
 
@@ -1081,15 +1085,17 @@
 #define __NR_pkey_alloc			(__NR_Linux + 328)
 #define __NR_pkey_free			(__NR_Linux + 329)
 #define __NR_statx			(__NR_Linux + 330)
+#define __NR_rseq			(__NR_Linux + 331)
+#define __NR_io_pgetevents		(__NR_Linux + 332)
 
 /*
  * Offset of the last N32 flavoured syscall
  */
-#define __NR_Linux_syscalls		330
+#define __NR_Linux_syscalls		332
 
 #endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
 
 #define __NR_N32_Linux			6000
-#define __NR_N32_Linux_syscalls		330
+#define __NR_N32_Linux_syscalls		332
 
 #endif /* _ASM_UNISTD_H */
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 833ed9a..1b32b56 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -633,6 +633,7 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_PSSCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xbd)
 
 #define KVM_REG_PPC_DEC_EXPIRY	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xbe)
+#define KVM_REG_PPC_ONLINE	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0xbf)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 98f389a..0a90115 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -751,6 +751,16 @@ struct kvm_ppc_resize_hpt {
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
 /*
+ * On arm/arm64, machine type can be used to request the physical
+ * address size for the VM. Bits [7-0] have been reserved for the
+ * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
+ * value 0 implies the default IPA size, which is 40bits.
+ */
+#define KVM_VM_TYPE_ARM_PHYS_SHIFT_MASK	0xff
+#define KVM_VM_TYPE_ARM_PHYS_SHIFT(x)		\
+	((x) & KVM_VM_TYPE_ARM_PHYS_SHIFT_MASK)
+
+/*
  * ioctls for /dev/kvm fds:
  */
 #define KVM_GET_API_VERSION       _IO(KVMIO,   0x00)
@@ -775,6 +785,12 @@ struct kvm_ppc_resize_hpt {
 #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
 
 /*
+ * Get the maximum physical address size supported by the host.
+ * Returns log2(Max-Physical-Address-Size)
+ */
+#define KVM_ARM_GET_MAX_VM_PHYS_SHIFT	_IO(KVMIO, 0x0b)
+
+/*
  * Extension capability list.
  */
 #define KVM_CAP_IRQCHIP	  0
-- 
2.5.5

