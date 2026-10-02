Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF50BCA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkM-0007GA-AE; Fri, 02 Oct 2026 16:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkB-00078G-4P
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:35 -0400
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjk9-0005jf-Ea
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:34 -0400
Received: by mail-pz2-x29.google.com with SMTP id
 41be03b00d2f7-cc7d27b7410so2338295a12.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972430; x=1791577230; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iODePatmvGNDBqYJx04Bbg2cZsIs56+xqllvlfLUyUI=;
 b=LgRjcC+nPL/Ck4yZS4uU8jnbGxRfbY03KDPtynE7DjI+n0QvjfA3sHHXxHsnXqrVpl
 OYSEsQYMlhkGwTQ4Q51Ap0VvkpscSWi7rup/Q8T53ctB/daM39MR8kAqBCQiCritGsQT
 HHVAIJn5ca6KgCd5qDbuG07b59X+UNJdga6pcuih6NyzljWioIPiVCzu9ccf/KYRy1kF
 AI3njr5j+y/r//jSNmM43s+PvvXJLrnryX7AxdQkpIIzzcLN/hqoMQ3IM2kCzRzlL3/l
 wuzJSPXUHngiNYZIqzLd+G820SDpQFUTDyS8qOpNSTVPZarLNhQRsmzToJ4T0ioocdto
 QzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972430; x=1791577230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iODePatmvGNDBqYJx04Bbg2cZsIs56+xqllvlfLUyUI=;
 b=wrbn5/sibJNb30zbFXamc7+FdXpTocB5mMjErb+nYP1jywmbi/wUIhu4qh6Lkaw11/
 I19Bh+zlObZeMOs2BHwMwhasv1vgKd2+077E99CiBknIt1kbWRKEFyac1ApkMAr/WQem
 kgl1QYmuYCabPEV2WnopYd2FSAzTLJFtvKGugpavmO5oDal+eoex9qwx+geI5EBsw8FW
 Uri0soDuVzyFZqQ++TtKlRSJI4re5Y65IbKboWIa7ywPNbbjG5/nr7LGBfP+VlasWMe7
 lGF1fEbKgnL28EQbeAJGaTYXFtT80A9Cj04+g9uQQDWgGOa+xN6PA3eX5U0eOaAWyDss
 eV0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBO4+Xj6SBbDnp2/UnzW5FP7K92LCmf3DSBgK6jnVqcgZrdYBBhJUvFGi5EmldDO6pouvOEQzNog==@nongnu.org
X-Gm-Message-State: AFq9FYL0LlHQHB15laSUj234fzU+fBfBFy4qc5uYx8jKs4C0pZDH8Gmq
 9kl1TFlpCAN8ddv3YEp3IQDOQnSVQSsqYiPlexWG6Anzbc9ysJD960y8cLZxPBTMOj6llnVZ9Sy
 1RmC7
X-Gm-Gg: AYBFou1H2IwI7PXdTndPYC/lmnmLnIsAHDWf24AvrzhSPa6QbuPylKzvIw8scrgO5A2
 OkmtDt6k36oaTdNw4Lb6xzpk1uUpUPBspoYXqOm00QPXjT1a70rtuBRLFjHxqJ9V731sLzEiscR
 WCodcsv1pkySwrEs6jmZYxF0ZkXGi34S5NzaD+KY0n0/FUQfFiJnh4ovyAdZBuA3Y7aMuJNZUq5
 IR/4AYmO3LZiW7Znfgu8kgdIOv4MQMNTmHibXH7DWttgb8NXTqR8cg84SMm97IGmd5ncamolru/
 auU2GgydZ7t/+sJKtp9k1Qu7Auc2e+OT+YvPBi2mAjfzyDBL5xQXj444OYeAT6R3PCTqm7YztYJ
 bLufr0cfA3Xfb1MwjwK6IJjcga61vw8b19H58UTq9AbQhoQBz8KExjywZUObO692oBV5h1nVdBr
 UYtsm00c47V/9mNtuGIgzLlCj+kpeYSqM54ql1pycSXsv9IbKo0GrjlR9RK34P7hcc2k0rVdfDe
 CdWzZisVMFBdfXG9tbbFA9zIw==
X-Received: by 2002:a17:90b:3b41:b0:3a7:a34:6f94 with SMTP id
 98e67ed59e1d1-3a70a3476c5mr1235372a91.65.1790972430400; 
 Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:29 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 01/22] linux-headers: Add RME related definitions
Date: Fri,  2 Oct 2026 14:20:05 -0600
Message-ID: <20261002202026.1204110-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::29;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pz2-x29.google.com
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
 linux-headers/linux/kvm.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 7850bd464222..686c199e2558 100644
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
@@ -988,6 +993,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_HPAGE_2G 249
 #define KVM_CAP_PPC_COMPAT_CAPS 250
 #define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 252
+#define KVM_CAP_ARM_RMI 253
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1674,4 +1680,14 @@ struct kvm_pre_fault_memory {
 	__u64 padding[5];
 };
 
+#define KVM_ARM_RMI_POPULATE	  _IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
+#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE     (1 << 0)
+struct kvm_arm_rmi_populate {
+	__u64 base;
+	__u64 size;
+	__u64 source_uaddr;
+	__u32 flags;
+	__u32 reserved;
+};
+
 #endif /* __LINUX_KVM_H */
-- 
2.43.0


