Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67CE606A325
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EnKBr0QC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuL-0005b3-6x; Mon, 09 Nov 2026 17:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtb-0005Bb-Cz
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:27 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtW-0003lb-9q
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:22 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8a4c72951b8so837151b3a.3
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263475; x=1794868275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+xgS/5jGpPMPPTrDvm4re8WWZpblsiEqi8yKxKF/m60=;
 b=EnKBr0QCG9mvSusgo/Ry0e1POvcpYFnoRQcnMCWDMgayhxd2IUdvSatvQae5RcaG1T
 hrRRWYZlW+dYJM2yYFVCA1D+D9wlIjzvGqFVjs4oadhgiXGaVcz4bCgpPFTWgwT7Q4w0
 vFyloSsRHUfh0h/4NTnW9eksQohkY1ZdK44AKla2wMVhUgDdpmYYT73Mx0LlKC1FdmEd
 8RkFxnd34JksRG1gqgZu1wjfLvYRLQiGuRRthV1dwgCeg1mqgDSPafGEQ3cEkmWskOYb
 UvmlY1CaTF/4edVLzEuWznSl2ioG5X2MmMLeVGifL3b2V2Pm9GriN3K+wE5i+I8yGwjl
 ST7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263475; x=1794868275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+xgS/5jGpPMPPTrDvm4re8WWZpblsiEqi8yKxKF/m60=;
 b=SOnIGa03+vjMohqeQFUQ7UKiRl3umzJByzGUStn01InYWpa/UPNt7Ulg9uuofvI3Of
 bXEqQaA1DQiL9ZYregBDO7pnYf9Tjks9J0am7P5/oyEyPE8Wd5+pJRyN+5m+EMih6Su+
 3I7ePdsbC27gRa1lwu0iKJ9bbG+//v1rqpHbvIkL/TmK0zccirga6wltUmNF/7iL9KYe
 hR8F6qjrAvRaVZkwJFXa4cY1Nm6FqP5vo1UdltcFDYxsQGxsbEWZNrc/kn/+OQ0hCtsr
 2iZkgpTsjvHc9kGuZq1l7hbypA51buwf95zPmVARaVfAoRcZiNypLBpIyD0XALV8hokv
 EEmQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGVdt79q5KWCPVZttE/NQQWbjrhyzelzb2xyrXZGHs1HTJ/e/Qb8eaaIxQJnmM6aTKtsxZ2bB9rig==@nongnu.org
X-Gm-Message-State: APuU4Z8GZBN5XmQhk2HvK3nEUYTrggc+xRV9Rq8ukFm2OIpuubCPUgb2
 L+/yMljQ8+I23cKRZZkuywbCCjhiY7ZA7pTYBDJy82WLdLaaFJIQzu6kIHuM3f9goDc=
X-Gm-Gg: AYBFou2VsdgaNLs2I68cox7FazID6FHaQ0shO+9YGTCqR1zfl1LfctB5SIiQDq5Mke8
 elaVpzBlMhgUJL30fUqDsf4GE4Z2goXGQc4qZChYHrR6Unr5spV1zLHr6OdQ1AO/F63OkSW7hfe
 /JCUas2pK/0p8nCyaBVtVmzfR3/bYMLf/SkzXzfG0XfvVjQ7AjQ04HRmFlOUMZycnTkk13yonME
 I/9j0Vm5CBCiGbBz2JcPFy+1w0634rBjgCZ0oZkSgOOFnGog0KKCXS7F7TSLElpOltt3J6oS92x
 7+lo0mVz8M18dYsKMj0J7FJCVjg3aSeNkh7ggsTi1LKPsnHy4kv73RbQ/Uvw0wBy4rcdxVSqOee
 cMrCcJjnOyAsKtI5y9/Xu+73mHGL0UbDTdpHi83yNYOpP2vXzPM+1iaEUYEbPuiAijdFi2iqxh8
 JTu+toCzCH4O0n4Zxv4GG//5Hg3CBccXKDmx5Mz/G0MPx8oU51NqmJbL1EYkpiUBz2meORCtRvH
 FF77iLjNCjxFM+TD6VOEgKm8U9WaLpCyAWaIfJzfzFfLZk7TUotazeB8/ryIgBuevo5wOEqNUdo
 G5yy/l9dAJC0iEy/dN+E3+ukgniro+eVbbZ2ftKgUPFTcmY60GOWlRWx+Dxl7mUQs5y6lfq0v7I
 =
X-Received: by 2002:a05:6a00:3c86:b0:893:8a6:3801 with SMTP id
 d2e1a72fcca58-8ba867aaca6mr892139b3a.24.1794263474712; 
 Mon, 09 Nov 2026 14:31:14 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:13 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 01/23] [NOT-FOR-MERGE] linux-headers: Add RME related
 definitions
Date: Mon,  9 Nov 2026 16:30:48 -0600
Message-ID: <20261109223110.1619504-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.53.0


