Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1682789wrd;
        Sat, 15 Sep 2018 02:28:37 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYsx0wTmd71Oa0P1y74g1oL+/F1nAYCZ/xaXEdwwKwnQrMfjy5Lp0A6fYYqXC9Trz3cbAn2
X-Received: by 2002:ac8:4807:: with SMTP id g7-v6mr10836123qtq.301.1537003717407;
        Sat, 15 Sep 2018 02:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537003717; cv=none;
        d=google.com; s=arc-20160816;
        b=Va5CKnIZQRm/AFOa9HVOLvaicnF1ETO1/WTXxHzbMqu9Kmr8h+Z4mP5hcNlsjWHpB2
         AbwxO7AoINHTCohiblq6XjMG+Kc4Q0v8QcDTmWJKjiTrEXAegjWR0OQoP2WUhDJLbSP/
         1bnQLj0tYo4ALi94n0lDFsbmO01ysfxWBacO5pP8hnjYl4K7iG8Y0Pnxo5ml6fGBbEnw
         sjoJMEHsOZ7g1e2wyE1y85KPP/ayxbIPeHnFCEBZujO4iLqBOdkJ52hUGNkAMBqrk/l0
         5MAqPHZEsgDMMwWMYYNmiflRzfUEwNLnl0Vg8fdhRWuMFSE+P7oMKJlnnlSUI1nxtPNG
         usWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=NIjXylQSFODzFkr6Cjt6zF1etzrrtJ9yeOX7D2s6iw0=;
        b=Es5hRxtuqozOMNowXXbb9FuQ5hWn2eVvSdahJkk3aXKRP1O748R3F8jIrWd3em5pmS
         mKi4OlDAfKnTdx2XkZ5PTAr0yUez3Xsj4ikmPMmLd91HF9TudPiXdqYs+kmQ7u0cXxqy
         4WMvQBC8MuA86ngBo74T75EQaAXBMxIWTPbhi3xlKhaiNiAKweFvj4w8yjh1E4QBhM2N
         evmV1FNb3eUpcQqd/GCxqzUOKof570GoLDb11foYd1XVaVHxJ+KMPFvAHEJhDI/anJM7
         z4Hv0esJ4q7tnxqCBjf9FBrBFQSgs027ineOLIYBIyiPyi/UIJmqt1sDa2H/Ih4gFwuL
         OBlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si1828562qvw.194.2018.09.15.02.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 15 Sep 2018 02:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g16sW-0007Hz-NZ
	for alex.bennee@linaro.org; Sat, 15 Sep 2018 05:28:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16sF-0007HU-37
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16s1-0004Hl-I7
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2649 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g16s1-00047H-1Q; Sat, 15 Sep 2018 05:28:05 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id B4DD3E126384;
	Sat, 15 Sep 2018 17:27:53 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.399.0; Sat, 15 Sep 2018 17:27:47 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 15 Sep 2018 13:32:06 -0400
Message-ID: <1537032727-29397-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
References: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v9 1/2] linux-headers: Update to kernel mainline
 commit 815f0ddb3
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
Cc: gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHjUaJxmKuoP

Update our kernel headers to mainline commit
815f0ddb346c196018d4d8f8f55c12b83da1de3f
(include/linux/compiler*.h: make compiler-*.h mutually exclusive)

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/standard-headers/linux/input.h |  9 +++++----
 linux-headers/asm-arm/kvm.h            | 13 +++++++++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++++++++
 linux-headers/linux/kvm.h              |  1 +
 4 files changed, 32 insertions(+), 4 deletions(-)

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
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 6679072..bae1c89 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -951,6 +951,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_HYPERV_TLBFLUSH 155
 #define KVM_CAP_S390_HPAGE_1M 156
 #define KVM_CAP_NESTED_STATE 157
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 158
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
1.8.3.1

