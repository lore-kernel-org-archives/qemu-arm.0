Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5230770wrd;
        Mon, 27 Aug 2018 06:03:19 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYHtcJmjMU2G8EoET+wusyARrOmp9eJc99Yx0pPyItFGuBlljL76gIGVmwzhaliy+UzFPDu
X-Received: by 2002:a0c:cd82:: with SMTP id v2-v6mr13368016qvm.84.1535374999573;
        Mon, 27 Aug 2018 06:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535374999; cv=none;
        d=google.com; s=arc-20160816;
        b=0sECtQm4hLbf40H5nuFZMaAsO3u7E9H97yzz7Vgr9Y6JjybcyDCdRavdH/u40zrCnW
         QhCqggRj/DtesSWKl1Fo5aOq1X7AfzKEiH+oDjzc+YlymVSBBLNbN52nIzeWEi4tsVGD
         f7/JeCw4+4dJ624Gkw5iZXOYPH0MsOPIMJs82kx/NvyEPtwqmcvTxt9jTugocPFGmsB2
         gOkRDz5Th0l0UMPbd4+L6UnCqpM+CJvnkkwEwp1uQyXnpbM6kv+nniU8FRZ5P7qY+/L1
         klTZEoKZ+HBdzgFGzWYSX4D202AM5CtduyXw9uyZJGGLQOfWJ7FnoBx3p5EC7FVDu4ON
         AolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=NIjXylQSFODzFkr6Cjt6zF1etzrrtJ9yeOX7D2s6iw0=;
        b=R5dpua6DekA0JWAHhTuR5FWs9hS6MEKIKuYRWgHsBqO7UEobCWGiX3AXd//Y8FejfB
         /K3MO28t8Q/EKZzHeB/1zGmo4Kutlm6UogvlwuP3qLxh7XmKoTEdzf7ktcjtzBRqp5yU
         2E4YewwgKps8yZf/aYaM6aEU9s/0BEeZoht5oiVACqteOG620v/7SaDDVDHwx8O8OjhD
         2lz9zcjbjUMthwPAZid4yVgFTmdR9Za9L7Wj7EeKLThmcM9ekNXhTaYOxR6KW/nLQRH3
         3ptOAZPxMCglhKeDRYyLYrDHA7YY9sUBS5gtnulrVjDNHSQjjxdTlyIWWOxxiCvjW6ar
         qLUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f42-v6si14282981qtk.237.2018.08.27.06.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Aug 2018 06:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fuHAt-0007BG-3H
	for alex.bennee@linaro.org; Mon, 27 Aug 2018 09:03:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuH6q-0003Zp-EY
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 08:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuGqC-0002j9-FZ
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 08:41:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2644 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fuGq8-0002cP-Lt; Mon, 27 Aug 2018 08:41:53 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 63AB93EA3C53D;
	Mon, 27 Aug 2018 20:41:44 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.399.0; Mon, 27 Aug 2018 20:41:37 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 27 Aug 2018 16:46:16 -0400
Message-ID: <1535402777-46620-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
References: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v7 1/2] linux-headers: Update to kernel
 mainline commit 815f0ddb3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EkdwIqh9HThy

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

