Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1694308wrt;
        Thu, 27 Sep 2018 01:52:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63fqqcu9g6Vfqxl1TUT7OYCHvO2kmkGaTcTFsZjWO9mTQK+lIN3IYbwVjARJhjcdJpThcgk
X-Received: by 2002:a0c:cd82:: with SMTP id v2-v6mr7299420qvm.84.1538038344517;
        Thu, 27 Sep 2018 01:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538038344; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+3hGoQgk4RZrVViqk1FZSifFgn6b/8PfH1XGqkzH03A0tsEZKypMqOnW7ePXKEqT4
         7bEAdzizJFvKMMTafyuba0F/sKmDm0XYhNEwra5T68Bt9yALpEyUzQJ2+bUImWifdzao
         rQhykcL+XbVBJOMsqvVr78VwTeIGrwRq3323xlL/M5p9rH9jgx+oYXj7iJUvwzo2XNur
         FbYONMvo25DFDTndCNssE+lhm0bETt2cBehG3eViuTLXLWxYKod92rv1pRSc27YoARG8
         V3je0yyu7mQaIULdH73QV7JUiRrD0wOEvymgROzy3dhB64Hy92pNZNFLxt7hLCuv9m3M
         TQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=M8/4tEg0FcAFOPEL4+KzVgWqh4/cu6RwXzGsVEW9nng=;
        b=E7HT+lHQnEBykiTYYRVR5fT1pLLO6tn2SExO+X1/aSMZrnO+0sEGMUXMe5RIrkgDBg
         Uc1tZNmTZ0mERHnVxWfhxbQH6ztql0VBzm4CMmRZC37On14jXSC/RN9AcBFOSGvTkc4t
         a88l2E1VyRHa5Qe0Ttlg/sDQznrUFQ5HHdBWHqVCQO9VMlqeBr7HGoVIm8BmI1BxmZ07
         sjHGuC2Q4QN5rhWiI3khLOR/X2H7zqx9YhiqvS4qhX4KSS9UV24EvyVa1C1iqj7W5pWD
         pPZNpvLP2HDFybundAS7o843482NGAHb1wG3/4EhcgYuIteexoamFUBLr0r+N+uxG3/i
         9qtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x44-v6si1078558qtj.211.2018.09.27.01.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 01:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5S24-0007MW-1Q
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 04:52:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5S1h-0007D9-AS
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 04:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5S1e-0004oj-20
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 04:52:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2568 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g5S1d-0004fY-Ld; Thu, 27 Sep 2018 04:51:57 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 2906C1571D732;
	Thu, 27 Sep 2018 16:51:52 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.399.0; Thu, 27 Sep 2018 16:51:45 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <zhengxiang9@huawei.com>
Date: Thu, 27 Sep 2018 12:55:50 -0400
Message-ID: <1538067351-23931-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH RFC v11 1/2] linux-headers: Update to linux
 kernel 4.19-rc5
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
X-TUID: 7HiyhJpjGepd

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

