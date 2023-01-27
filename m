Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232445ejc;
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr40651628wmn.9.1674832557380;
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832557; cv=none;
        d=google.com; s=arc-20160816;
        b=gn5GepIFw83bsvW/kyjHzDlawFfje0NXmdPsXXlWelZAwhHfN1EsJ43ZJN1w1stymS
         c4VKYnZynqQiTzUS4v7sEgh5LEuu15NqoHv8+oQYrJWOBtZIwaoIzDtD2mThMhQ+CYfF
         bxGw1RvVRGkZ9W8XJReBUfPx4e0aLoVNRRtnnYZFxHu+8RXqv80x6VZ7DDINdkKaPmAH
         eJj7w8lUdsZ5vZX93Ylq3t8n18NruoKEYXvb1pkL1PjF5XGJygbBs0NrLAQqtKAE9UvZ
         Yri8rXYOEHB1dBrOVMaHfIUG11/P8mF2QHqwY5Yxx59OaGuLWV8lIkRobYP/xFiSv1qi
         imwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m0U+Il4a8T/dt0WAsDkDpCQXyx0Semr+BKbPY7DEyoM=;
        b=fyujl36e0nxgtouEOg1432XJpqKYNl4Di71hhApQiF6939uQLWyeGdUHHKK5d5jr+E
         K/LgecJ14KdnmPsWLM6fPavAwuzWi6gTdDjB1c6VyY0frMrws/tvccOds5tZZlEKvphf
         7euDg2Fbi2RPs4btNXozLGZ/JI8yjrcUZ557Di49qWZ9P95oF2GqaNYUSMhgAG3LQzp/
         g9d755OnQqe31Tf3OW6MvOCzczSAD9x/xmfJQmudZqzR5xyrr5FsWExZBuLzIfViC5zc
         eabV8jMjnrKcaNXewtrzQ4bOg00An9djrMo514rLgIvtbfy1gv5mM8dvdhDX8f3jO9vR
         velQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VymtPy1v;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r8-20020a05600c2f0800b003db1907aac5sor1652564wmn.8.2023.01.27.07.15.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VymtPy1v;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0U+Il4a8T/dt0WAsDkDpCQXyx0Semr+BKbPY7DEyoM=;
        b=VymtPy1vqq9lWXq1GSLgTqwgTd8ke878s7+J7RHyeCuINeCQxQBJcgs3WXjzx76FIq
         1y69/U9CMrqKCr1v2jKDSZYMZV/c3rYNYrsN+JSMm6q8O8uH7f2NzfW1DYtUjVk0zBj/
         fwtIJi+MhV+NWIjw+8RlS3HrGKctvKheyFOaHHwwHQYQCj908OU7chkFHAbbuUkI+hhS
         +wW+Lrdqi/NgRMWGJD7FcaL/C+hgE+K3PEFKpoDeOAk9fx7b2e7owxlMjcdBk76f8EEY
         b7f9t0+AFrH/OBvnN2Mcf4SXi2YTf1PFYTlmVdE4/u9GcV6u8dhcKtKl6CEAwDBfVGuu
         VVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0U+Il4a8T/dt0WAsDkDpCQXyx0Semr+BKbPY7DEyoM=;
        b=k03QoN5xer8/5lQVDQ6FmnD5/VJOtIp/9NsqPjgSvwPVxbrukl0cycWdJ+tLjhDFbB
         bNcuDGaOQ1dQzbXEAihCQirp7h6CBM04A9h0N4zL3R/yZmypkd24HmhL60cgrnA3BzLB
         ah1AqfOtYRIRm3nCQe+u6qId53TgTBI6DXALE0e/A1PhtQCt6DSCzzjrR2JAmCx5ux4B
         K2PC3bUJLVd2e8eHK8rMRRDc+OY5j6G7SAYuFbAWvu41etRNGTxmQtn/0ZHbLGNyf/Wq
         72/mq6onru54iTBrNnvh5JC9JjNVESpuDdFuXxri2IF2QlatS6iX9Eurfad6A1QbDCFu
         TYzw==
X-Gm-Message-State: AFqh2kqaLjfwvd7Gn0CmWZI8lhv8yNvtMHNWSDjLtSDsOWd8X4yxvRpM
	uI33Mt+NnPzKsYrB848a9+BZyrR9
X-Google-Smtp-Source: AMrXdXuueF8x1/095lgRiyv5ga6qoHBW+FOlCa5j8xkrhQp8jza46g8uUqvznRohdxh29dMX7SFAPA==
X-Received: by 2002:a05:600c:31a3:b0:3da:6a6:739d with SMTP id s35-20020a05600c31a300b003da06a6739dmr40093483wmp.19.1674832557082;
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:56 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 01/16] NOMERGE: Add KVM Arm RME definitions to Linux headers
Date: Fri, 27 Jan 2023 15:07:14 +0000
Message-Id: <20230127150727.612594-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RIK3kliD3OrM

Copy the KVM definitions for Arm RME from the development branch.
Don't merge, they will be added from the periodic Linux header sync.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 63 +++++++++++++++++++++++++++++++++++
 linux-headers/linux/kvm.h     | 21 +++++++++---
 2 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4bf2d7246e..8e04d6f7ff 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -108,6 +108,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_SVE		4 /* enable SVE for this CPU */
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
+#define KVM_ARM_VCPU_REC		7 /* VCPU REC state as part of Realm */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -391,6 +392,68 @@ enum {
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
 #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
+/* KVM_CAP_ARM_RME on VM fd */
+#define KVM_CAP_ARM_RME_CONFIG_REALM		0
+#define KVM_CAP_ARM_RME_CREATE_RD		1
+#define KVM_CAP_ARM_RME_INIT_IPA_REALM		2
+#define KVM_CAP_ARM_RME_POPULATE_REALM		3
+#define KVM_CAP_ARM_RME_ACTIVATE_REALM		4
+
+#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256		0
+#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512		1
+
+#define KVM_CAP_ARM_RME_RPV_SIZE 64
+
+/* List of configuration items accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
+#define KVM_CAP_ARM_RME_CFG_RPV			0
+#define KVM_CAP_ARM_RME_CFG_HASH_ALGO		1
+#define KVM_CAP_ARM_RME_CFG_SVE			2
+#define KVM_CAP_ARM_RME_CFG_DBG			3
+#define KVM_CAP_ARM_RME_CFG_PMU			4
+
+struct kvm_cap_arm_rme_config_item {
+	__u32 cfg;
+	union {
+		/* cfg == KVM_CAP_ARM_RME_CFG_RPV */
+		struct {
+			__u8	rpv[KVM_CAP_ARM_RME_RPV_SIZE];
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_HASH_ALGO */
+		struct {
+			__u32	hash_algo;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_SVE */
+		struct {
+			__u32	sve_vq;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_DBG */
+		struct {
+			__u32	num_brps;
+			__u32	num_wrps;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_PMU */
+		struct {
+			__u32	num_pmu_cntrs;
+		};
+		/* Fix the size of the union */
+		__u8	reserved[256];
+	};
+};
+
+struct kvm_cap_arm_rme_populate_realm_args {
+	__u64 populate_ipa_base;
+	__u64 populate_ipa_size;
+};
+
+struct kvm_cap_arm_rme_init_ipa_args {
+	__u64 init_ipa_base;
+	__u64 init_ipa_size;
+};
+
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
 #define   KVM_ARM_VCPU_PMU_V3_IRQ	0
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa576d..9d5affc98a 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -901,14 +901,25 @@ struct kvm_ppc_resize_hpt {
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
 /*
- * On arm64, machine type can be used to request the physical
- * address size for the VM. Bits[7-0] are reserved for the guest
- * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
- * value 0 implies the default IPA size, 40bits.
+ * On arm64, machine type can be used to request both the machine type and
+ * the physical address size for the VM.
+ *
+ * Bits[11-8] are reserved for the ARM specific machine type.
+ *
+ * Bits[7-0] are reserved for the guest PA size shift (i.e, log2(PA_Size)).
+ * For backward compatibility, value 0 implies the default IPA size, 40bits.
  */
+#define KVM_VM_TYPE_ARM_SHIFT		8
+#define KVM_VM_TYPE_ARM_MASK		(0xfULL << KVM_VM_TYPE_ARM_SHIFT)
+#define KVM_VM_TYPE_ARM(_type)		\
+	(((_type) << KVM_VM_TYPE_ARM_SHIFT) & KVM_VM_TYPE_ARM_MASK)
+#define KVM_VM_TYPE_ARM_NORMAL		KVM_VM_TYPE_ARM(0)
+#define KVM_VM_TYPE_ARM_REALM		KVM_VM_TYPE_ARM(1)
+
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
 /*
  * ioctls for /dev/kvm fds:
  */
@@ -1176,6 +1187,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
 
+#define KVM_CAP_ARM_RME 300 // FIXME: Large number to prevent conflicts
+
 #ifdef KVM_CAP_IRQ_ROUTING
 
 struct kvm_irq_routing_irqchip {
-- 
2.39.0
