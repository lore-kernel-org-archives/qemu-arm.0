Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0324EC61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:01:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzCp-0003GM-QH; Tue, 25 Aug 2026 18:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCg-0002qv-TN
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCe-00018Z-FI
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38e42560ebcso394815a91.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695267; x=1788300067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ndrOCsdwllHKG3R8sNfPufN5ST5eyC5FSUsoL8k0SoY=;
 b=jBOXoj8QEHYMTYq7aPhNTURfflySBF6RNsehMtGG/xItQv5XI/z/g2WQXTjZnc8jK2
 X6aDISAbzWjL8CXSh2mQqHEoeA6pjf88d3A2mIdsH+RvD9IMdRiyGFNah3KUvd59YU3x
 ABxOluajnASrbGkxXJrK/XRioaViNXsglPP12OA7ly+4zpL+3NbJsotfEdyrL0Am8Qc/
 7MksxtgIiTw482sd9yjGnO4oJXQfSwrL8nMMV9h5+hubqsB6Nh+ivzmNEnGzr64PWmgS
 a8eQ+xPxTuJGgWh58nvlgpY6f97QrIyOyE+hApY7V6cEznBR6iAenfNYNKOauJqlIuk/
 CBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695267; x=1788300067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ndrOCsdwllHKG3R8sNfPufN5ST5eyC5FSUsoL8k0SoY=;
 b=ZiSn1oPS3TtVOOPy8XhX5POIYfqi3nLvlvDwgN6mJjIBXxgN4zFvaUnQC0S/B6v8Mh
 i2V3mHd3L5DdshgLEk85v6y07jDrPWvUK9tYEyLto+EUNjhM80nYIpD5bxYJXtXf55fE
 HbU3dIBTnrduCK8wAoPTgVhSJ3/oRjsgDGpggd0i/+eBZqMKeDp/7Lg4DvFq5km16cAI
 cZFE3bsfTgGOv+J9wWby/8dGzdVYoFSbX01YY5L4tl0H6yrVP+pvWFHhKsYTFgDSqyLU
 g/bwO7/6IgBcsK6UPtq4wuaZJKBmGTvZ+rclNWAlojjsf0k8F5IzUycQVgefWcYAezLO
 +wJA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqs+K9oYNWsRqnF+PmHHXsU0y2MgmziGxXjY+sfjPJxrAsrzvPzLk1E+xpor74fbXUlHuJpoC4uDg==@nongnu.org
X-Gm-Message-State: AFuF++mhNy/EIx5mH5KKgkV77ErawJ113Mv7rHda+JPGmJSKJonHyqMe
 itmPCJtZvZlmNwFkrLii/aV3d/NMviUlTsttFsD+BgEEcMVGzlZAT5BpnITuczbCt+I=
X-Gm-Gg: AR+sD11OOM2uKhZrPyEU0H9Se+uuAFHksr8X34jthbyNA5hcL8Yj/dBx5HKNdGd7Jck
 UF006R8Eaz5SDqFfLscpizOse35esy1Hm2gh+BbFF/jLGeiVN9Ah4X96MdbX2juLBgcTT+U4yAZ
 C8+DT6x5SbTqcfCC5uqcqg3QULdHmlmbaazx2/DnbufOOi2T2UtesRRUdytkFzRCC2702gCVVOj
 TUsBqy/DgSdAsAaFTnqLhLiiQpBzjFBgBLWiKrCQWwhDOb2sgEjP7A59ez61jU8of8R3+UPBvPK
 E23r+vI78fBSBXtmsIOTVjM5xaklcG7aBRoKs/vC3pG2jx9bqbIookzLTVB6/gtTw8xTcXqofDN
 juDwoiaPOL82W1ywi9AUNNxnaa2gSoUH7EX8Bpu8nhADM2qsYvaC58wJIC3wyGppwk2L0at+2Xq
 iWlT05ZLUdKuC1J+Q3QpDFm3f614NvlBYH9pK8r5LSJscgUDMaMMRKSnxujOEDuMF/jX2FZ+lSf
 1ut6Pvlh3IZnPM=
X-Received: by 2002:a17:90b:4a87:b0:38f:efed:5445 with SMTP id
 98e67ed59e1d1-3966d18f5a4mr4066265a91.4.1787695266606; 
 Tue, 25 Aug 2026 15:01:06 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 01/24] linux-headers: Add RME related definitions
Date: Tue, 25 Aug 2026 16:00:38 -0600
Message-ID: <20260825220101.3443954-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

This is a temporary patch intended for testing purposes only. It provides
definitions related to supporting Realms by the QEMU-VMM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 linux-headers/asm-arm64/kvm.h |  9 +++++++++
 linux-headers/linux/kvm.h     | 12 ++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 6aefe7973814..4c08631ec7d2 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -208,6 +208,15 @@ struct kvm_arm_counter_offset {
 	__u64 reserved;
 };
 
+#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE     (1 << 0)
+struct kvm_arm_rmi_populate {
+	__u64 base;
+	__u64 size;
+	__u64 source_uaddr;
+	__u32 flags;
+	__u32 reserved;
+};
+
 #define KVM_ARM_TAGS_TO_GUEST		0
 #define KVM_ARM_TAGS_FROM_GUEST		1
 
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index c1baca430277..cd09c7a4a60f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -689,14 +689,19 @@ struct kvm_enable_cap {
  * address size for the VM. Bits[7-0] are reserved for the guest
  * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
  * value 0 implies the default IPA size, 40bits.
+ *
+ * Bits[30-31] are reserved for the VM type
  */
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
 
+#define KVM_VM_TYPE_ARM_NORMAL		0
+#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
 #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
 #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
-					 KVM_VM_TYPE_ARM_PROTECTED)
+					 KVM_VM_TYPE_ARM_PROTECTED | \
+					 KVM_VM_TYPE_ARM_REALM)
 
 /*
  * ioctls for /dev/kvm fds:
@@ -719,6 +724,8 @@ struct kvm_enable_cap {
 #define KVM_GET_EMULATED_CPUID	  _IOWR(KVMIO, 0x09, struct kvm_cpuid2)
 #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
 
+#define KVM_ARM_RMI_POPULATE	  _IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
+
 /*
  * Extension capability list.
  */
@@ -985,7 +992,8 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
 #define KVM_CAP_S390_VSIE_ESAMODE 248
-#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 249
+#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 250
+#define KVM_CAP_ARM_RMI 251
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.43.0


