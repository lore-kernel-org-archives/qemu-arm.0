Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6438901wrd;
        Tue, 28 Aug 2018 06:50:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdab+za0+q5Sig2UZvLLAofbBniGBx94hGlXxyYgDU+qV9ywwepQc40OQyq4WBpPQhX7w+sn
X-Received: by 2002:a17:902:145:: with SMTP id 63-v6mr1707320plb.103.1535464259188;
        Tue, 28 Aug 2018 06:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535464259; cv=none;
        d=google.com; s=arc-20160816;
        b=rFTpTs3KAfDPrEovS9kgHaW7OxXLq7p5TdQ2sFcHrNqePyxOZDsmEzSQjxfCeniksv
         GtW2u0Q0iaN2AUTgp81hjMTp8zypZDL/OWKoo6k/gsSRAS5Wm8HU62pGXIb/TNUTEH6v
         6CIzUsd0F1rt9RysVBbk+5l10b997ouypOiptGEvIEsn9U78MUuBg4+utUD1Q7Rs3FpY
         hkXkcjrHaGJ3SHs9WiME2dGv2Y9bIQWdFIZPoFcvrRoAp/zBsoIb1qtY61seBHu5MrSc
         zDeYulNcxMYWTaJ71oED2Ximp70I7lwVptxelD+63HeGyjuQdW7LiUThE51fl2gpTvBK
         3J8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=VRDQaULeyRgMJEwbSqxejhDrzJqZtb3D3LyMWwraO+0=;
        b=CuJejNphFVRgI285/dS/B/6yZAic6+f3BYiL1vdGTaiM9MoXx8G3n4C7rj7+7mRsZ9
         j15LAQLD6yuDcN7xfAfa5lBaHwZLsHMcylm2c5Q6GzKvNcRxX+pNVHTeC2MFxBRGKb8P
         sjNPA802MIiVuugroJqGQUfJAw8gV46F63f+Yz244tHTwiWLgolFH4vkWNXHvwbu2fjB
         Hc9Q2ucvRjdPSM3Wu7y7WFGICOj26L3pJoYGrOry4p7OYJwEu1fVIwDcUAzzedXeMn0o
         Cq0Qm9Xkj5jnOUcSsIi9O0EJQZ2LKBhbRhlyp7DS8sU9HkacgVscSuViv8zysJ8KpdLW
         8DuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g10-v6si1004613plt.468.2018.08.28.06.50.58;
        Tue, 28 Aug 2018 06:50:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbeH1Rmn (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 28 Aug 2018 13:42:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11610 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727284AbeH1Rmn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Aug 2018 13:42:43 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 6D4C02C38C43;
        Tue, 28 Aug 2018 21:50:51 +0800 (CST)
Received: from SHA150392835-N.china.huawei.com (10.45.52.187) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.399.0; Tue, 28 Aug 2018 21:50:45 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Subject: [PATCH v8 1/2] linux-headers: Update to kernel mainline commit 815f0ddb3
Date:   Tue, 28 Aug 2018 21:49:14 +0800
Message-ID: <20180828134915.8744-2-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.11.0.windows.1
In-Reply-To: <20180828134915.8744-1-gengdongjiu@huawei.com>
References: <20180828134915.8744-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.45.52.187]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dQ1oYGH2f7ui

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
1.9.1

