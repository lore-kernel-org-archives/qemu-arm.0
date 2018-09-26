Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp626962wrt;
        Wed, 26 Sep 2018 05:44:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62myhLE1XbfsKvHIyits8kO1C5t2ivwUPvyoJtGmy8jTKqum0TJvxMPmGYXdiWi0Tg2MLZM
X-Received: by 2002:a37:7347:: with SMTP id o68-v6mr4107577qkc.291.1537965849372;
        Wed, 26 Sep 2018 05:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537965849; cv=none;
        d=google.com; s=arc-20160816;
        b=fAL41QWx/1CLWnMIy+CDtnpFUHXWwNan2y/SDW3Hlyheu+cpSnwJOEXja1IsgRuIPe
         iFADoiXgy4VWshqvqSz1lRrS0DDQ9oLGVpqjD43ap+ksGnaaRJlVgmrwTP+T62XUvPMK
         z+vHWHcRCnMd544an1wnr/8zecfQ4/Z3cyrf7SuMgs7oJ5ew+jk9jX7RzOP6LiW/zAdA
         p0juJjK/Zmyc+Vbi+Sth3fxvsEe3ZFrQPzFvtxLd0JpYrlPbekkOPtZflcZuvJ5vK8DJ
         GawUknzABw1RT4lZHGkHC5slWGEzvKpW9o9U/Pt4JE7YPl3XgaRKlr4v2ajd/0qUxzCd
         31AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=M8/4tEg0FcAFOPEL4+KzVgWqh4/cu6RwXzGsVEW9nng=;
        b=0gXcMHHUAElURau3mOe/BShd4HzLqno9oDRdFYJ+pUDq2UBrUxDhyPwMoHBd4nNmqM
         stj0P6iILXamrbPLiSFNy56bThdUqRpN12CvzgoDdsyOq9ILYHgXKSazjdi7RBMIZ0wK
         /y7lZyIpLvH33I8xgvUc/HfNlbQPKLYyeWWpTcqwDMVnROY81FqklQ/8nf2oM6xkLygZ
         VdoMMPOF3rBjrN6zo4FeYCtggBa/3aisDmC9cTgdEUIGIn53pp9xG30LiosrNSxF8C8A
         Cng2Ff48iSV6+czrAzbWpZVSEmMLGknWYIDNAUlSNq78fkldGX2XJJIi2U7giVOeL+dJ
         HV7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10-v6si4066562qvl.54.2018.09.26.05.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g59Am-0002U3-R7
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AN-0002J1-Nd
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AI-0003Vy-V2
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2651 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g59AI-0003U8-Eu; Wed, 26 Sep 2018 08:43:38 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4908E529372AE;
	Wed, 26 Sep 2018 20:43:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.399.0; Wed, 26 Sep 2018 20:43:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Date: Wed, 26 Sep 2018 16:47:30 -0400
Message-ID: <1537994851-36254-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
References: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v10 1/2] linux-headers: Update to linux kernel
 4.19-rc5
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bp17aCEyvsid

Update our kernel headers to upstream 4.19-rc5
(kernel commit 6bf4ca7fbc85d80446ac0)

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/standard-headers/linux/input.h |  9 +++++----
 linux-headers/asm-arm/kvm.h            | 13 +++++++++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++++++++
 linux-headers/asm-x86/kvm.h            |  1 +
 linux-headers/linux/kvm.h              |  2 ++
 linux-headers/linux/vhost.h            |  2 +-
 6 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/include/standard-headers/linux/input.h b/include/standard-headers/linux/input.h
index 6d6128c..c0ad9fc 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -267,10 +267,11 @@ struct input_mask {
 /*
  * MT_TOOL types
  */
-#define MT_TOOL_FINGER		0
-#define MT_TOOL_PEN		1
-#define MT_TOOL_PALM		2
-#define MT_TOOL_MAX		2
+#define MT_TOOL_FINGER		0x00
+#define MT_TOOL_PEN		0x01
+#define MT_TOOL_PALM		0x02
+#define MT_TOOL_DIAL		0x0a
+#define MT_TOOL_MAX		0x0f
 
 /*
  * Values describing the status of a force-feedback effect
diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 72aa226..e1f8b74 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -27,6 +27,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -125,6 +126,18 @@ struct kvm_sync_regs {
 struct kvm_arch_memory_slot {
 };
 
+/* for KVM_GET/SET_VCPU_EVENTS */
+struct kvm_vcpu_events {
+	struct {
+		__u8 serror_pending;
+		__u8 serror_has_esr;
+		/* Align it to 8 bytes */
+		__u8 pad[6];
+		__u64 serror_esr;
+	} exception;
+	__u32 reserved[12];
+};
+
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
 #define KVM_REG_ARM_COPROC_SHIFT	16
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 99cb9ad..e6a98c1 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -39,6 +39,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -154,6 +155,18 @@ struct kvm_sync_regs {
 struct kvm_arch_memory_slot {
 };
 
+/* for KVM_GET/SET_VCPU_EVENTS */
+struct kvm_vcpu_events {
+	struct {
+		__u8 serror_pending;
+		__u8 serror_has_esr;
+		/* Align it to 8 bytes */
+		__u8 pad[6];
+		__u64 serror_esr;
+	} exception;
+	__u32 reserved[12];
+};
+
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
 #define KVM_REG_ARM_COPROC_SHIFT	16
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 86299ef..fd23d57 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -377,6 +377,7 @@ struct kvm_sync_regs {
 
 #define KVM_X86_QUIRK_LINT0_REENABLED	(1 << 0)
 #define KVM_X86_QUIRK_CD_NW_CLEARED	(1 << 1)
+#define KVM_X86_QUIRK_LAPIC_MMIO_HOLE	(1 << 2)
 
 #define KVM_STATE_NESTED_GUEST_MODE	0x00000001
 #define KVM_STATE_NESTED_RUN_PENDING	0x00000002
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 6679072..83ba4eb 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -951,6 +951,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_HYPERV_TLBFLUSH 155
 #define KVM_CAP_S390_HPAGE_1M 156
 #define KVM_CAP_NESTED_STATE 157
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 158
+#define KVM_CAP_MSR_PLATFORM_INFO 159
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 94726cb..c8a8fbe 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -176,7 +176,7 @@ struct vhost_memory {
 #define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
 
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
-#define VHOST_GET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x26, __u64)
+#define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
 
 /* VHOST_NET specific defines */
 
-- 
2.7.4

