Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp896581wrq;
        Tue, 5 Jun 2018 05:48:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKOSQsnyZbc/D5FhNFrDjNSxAuolr0Cnhm30VN6pYXghmm7X5Bc8Kdsy9+Y7/2To49Xh9pA
X-Received: by 2002:ac8:2db8:: with SMTP id p53-v6mr20334210qta.250.1528202891314;
        Tue, 05 Jun 2018 05:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528202891; cv=none;
        d=google.com; s=arc-20160816;
        b=t6xCxRRraS+rpKMUyRNkYrT9Exk04xOeyvtKUrHpMtDjzZoy6OhKTKKPVujATcvGg7
         V6eitub+yKVOHRgg8K36CZigKXvMPhHRQV7UlAzpFEhvzj2eztDPFGhjfqg96WSJaHSh
         2Z/+3dF7cebX/Zmsiy062dHvDnOrfJ/SH9IS62ZwG28xBpEaA14biAFI81/48iyM9uWj
         E+OHyY6If+uMtqhebTXFFzB48Zvbt+2s+gBwO/y1GcHEgcFJ/TATJIhE87+mO4X2t4aP
         5+mkH0VLlMJOSUR+PsnojRB6GLR4DcLOZCT15JAulfBlAFO06ok8FxP2hXcv8znARjc+
         BivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=novJ6G+ATjP3WzEBsoOMTJmGgS3+1Nuz4jS2pu5K0a8=;
        b=n1QzOKunNzgii91UPva+tIYpnigL5h6hAQJ2VEtvTjDkWmdyRKbAPTIihQK/GrrNSu
         Jp1itN4YP0oVVRXnpasRX6jaUB0FlH6eocA3qrwyKbwFQyRtzopvLmax3lXbgOCB7Z+R
         eB4NAUsQnCdTop9yU+wlnsCIk+64qAuhPzh1AUuDQT3D+kvRqW/3KOMPCxWqKO0MKKka
         UZ8D+U1cTkm1cxs6k7yOMRHOGh7nZNL1I099Ag9QL/sx+8g7I6un6uYGf+CSds7y6Eij
         N2dHfd+1FIwYEecJYM1wiJfoH2XsxbR5Qnu1dAwS+a7iL27GFTwodfk/c6eQgMD8imUi
         WPkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s188-v6si3506417qkd.217.2018.06.05.05.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 05:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQBNi-0007PA-RE
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 08:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNP-0007Mv-A3
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNM-0003C6-8X
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2107 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQBNL-00038t-Oe; Tue, 05 Jun 2018 08:47:48 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 90E5BD0D24901;
	Tue,  5 Jun 2018 20:47:29 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.382.0; Tue, 5 Jun 2018 20:47:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Wed, 6 Jun 2018 04:52:48 +0800
Message-ID: <1528231969-19584-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
References: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v2 1/2] kvm: sync linux headers
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
X-TUID: nW2HGhtOr6ua

Import KVM_CAP_ARM_INJECT_SERROR_ESR and struct kvm_vcpu_events
for arm64

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 linux-headers/linux/kvm.h     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 17315ab..e240afc 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -39,6 +39,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -153,6 +154,18 @@ struct kvm_sync_regs {
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
index cdb148e..cd8be47 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -948,6 +948,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_BPB 152
 #define KVM_CAP_GET_MSR_FEATURES 153
 #define KVM_CAP_HYPERV_EVENTFD 154
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 155
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.7.4

