Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7716C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonRy-00032m-Ke; Tue, 28 Jul 2026 15:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRo-0002rr-3R
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRl-0001Kv-AQ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so240601a91.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266796; x=1785871596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nymk/KlJTSOeG9pOLHjAQMrrwDf8dwvKcqF44jXbkLg=;
 b=NYMWMX90lEFAMt/Ev2puxcJ5GtM5qTlQj1LSuq4rGvwZWZ0N5+S2cSgyjcuTLpW/pi
 0w+csaqD0vArlB41ZV8HGzd0Y2ivcPwnlFQ1bS/DoUThdfOrcqshqF/1Xb7X57o84V7/
 hh8sdkT2JI0vUm062MKZyNXzgmBNOU+knm3hhC/U3mebVvXWT/nDNoaonwb0bmPpc3yI
 EO0HCbAlV8703HTR0QRru1sbKGWGE4D+r3L2UR/XDZ5jvCVBaUWjv5u6TwjUi10RwSyd
 kkuq5hQA+zfOkiLolasgI1V6izctISGdk6tFHbvVdTU070WuZpIVpj+uE0LAQ55A34nQ
 ukuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266796; x=1785871596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nymk/KlJTSOeG9pOLHjAQMrrwDf8dwvKcqF44jXbkLg=;
 b=C4sPZ8kKzDeI/C+Ao3YuOzT+GCKH8tlSvSPll3OVcBYSXedL/aErV1fpu5rQEmJI7d
 NFBRkpy1w2syPVA00D7cdQj2at01MTYHHDPQ2DsbI9ohPGrhHe0c0hAEn5xleT9ficrv
 eVh7AtRC5CZuxBG/h1oANMGgPRqZYP3ToT8NNzjfTQpyGngUbeet5wJhpJSPQ1XdlPp2
 AQLuGMUqL1FGPHrm7qjWNtPIG+q5o88oTHu6xCADQHz7jazX3I5lu2Mx5X69MaA47F5A
 yue1zNO+MbG2IXUQGvLxiozVmnpa+7fdFaPdt3Va54syOFG8q6TQjGSXyFbIjMQMN4Bt
 L7pQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqkTRa/tlB9hS/Xvw+LRkoLOsmDa6HSphB8XVcuBuJYp1PG0yDO2dZy0hgJgYtacmNyZXNpvxlstA==@nongnu.org
X-Gm-Message-State: AOJu0YxgemkXpi/1pdJVcLA+Gm05HV535BhU15cMKi1MZJ10E8IR2oys
 v4E4bizPgkH9S3zg04rLhdsyCAsKC58RceNxMII79k0vpDDEHZhgNEuQHCwxE3u4xgg=
X-Gm-Gg: AR+sD13sc/HV5/DALMzsOzy82JCOnJw6mpIKeGN7uzC+1wTHS+so2xkUwYYkqz+wyoS
 AKvOmj8cGTSqY+2Sz9xBGv9qWRTYjms9bNsSGwG570Bg2AjnrBj4Fe91oCT+JOsaYOxsJ0JXoPH
 OoBMzwKo+69htGwNFfGm6OgXUCQB3tQPmIs8M8YkV/2muOWM9kuBExxBjN240oBSA5lCIs1dfqZ
 +u+P1Wm6mQRwL197gazqBamB8MmeiLulTO16fXIdxoG+iXhgNKoYpM1/o5p5Bb0KmgGLurn78/T
 M+W9pKpCKQJTTRghHG/9tEi6v1gEsW276yLAZR+Jr+z8i20ddUwP47/B5XALjYkNcw29TuxYKKY
 Lwkf9bHo07mRb03UaQUO4AbxBmj2VLVYT71eM+osyGYMPNk5tiWh/dHUoMPcvXDkS0088QO7M80
 FMAykm9byROin+euNnK3rQlJNYEGRZYryR0jJP4P4ObBGqPVwfijeRkJfgM6KbYQh83/IlRrrFt
 27mE+DH4WNufNQ=
X-Received: by 2002:a17:90a:d88d:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-38f6a30eb9emr4333942a91.9.1785266795564; 
 Tue, 28 Jul 2026 12:26:35 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:35 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 01/24] linux-headers: Add RME related definitions
Date: Tue, 28 Jul 2026 13:26:07 -0600
Message-ID: <20260728192630.240375-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1034.google.com
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
 linux-headers/linux/kvm.h     | 10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

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
index dd52e2a65bfd..cdd5ad11f85a 100644
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
@@ -986,6 +993,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_KEYOP 247
 #define KVM_CAP_S390_VSIE_ESAMODE 248
 #define KVM_CAP_S390_HPAGE_2G 249
+#define KVM_CAP_ARM_RMI 250
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.43.0


