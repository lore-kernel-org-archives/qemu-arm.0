Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EEC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVo-0001LI-9h; Tue, 07 Jul 2026 18:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVn-0001KW-38
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVl-00049V-AJ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso16772975ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464208; x=1784069008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFExSdxFK8RfkshviK2HeeDzgoNR/sUY6pTQO70u6q8=;
 b=Clx6au72z/MhnXd/dDzx53vg3zw+KKQuDi2XRwVfOUBfX2qqTGB+Pt5cfSVsAKzxsR
 OeergP7JY0bDX5KuJbyaLGLKqLpJoY7Ws+6V/gAXkC2nC7BEqN9a5yRuUa8p9L9dAddw
 IwuTQTkYukC9u3L2ulpSldNdHOwE6R7lKg7/3ivbJzdIsoCNLGqnY38KTNe4O9QrRxZe
 vuWpcqf+W/QHeI/4NJk7aFFXBOlxXfnWBxVrE4wCdTAh2/6sA/U9LZOch6z2ROGMFyeN
 sae6muzmn8MsVagxumR62zYxMySrcQoeo0joNdJxIgUU2nERr3Cn2zaaV7poVD2DvWqF
 7GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464208; x=1784069008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eFExSdxFK8RfkshviK2HeeDzgoNR/sUY6pTQO70u6q8=;
 b=Ya+RZS7i2sjOc4QY6JUPJrXlF1efZYSH7dmoUeJgUSLmv7C8pZCo92rO4ExAplB3Yl
 GbZHvzvuBk+yYoiwLnn85QzgrLoSSqH8I7yu4kYo4bQPDaoB+y4XMUDH259Y0l/ioHsB
 g5aM+E5EuW/ga4DnnOip/Zj1Ue+ROLPSeozKXbyXiflpQjNcRdpUjdkBDy0tyip6Hp6g
 R62gQQ6RH7hWrnsiTvz2+sEu8ExdYm4eUDc0X2B8HASlX+ixYZRwCGEX3KPl87qSUS0W
 Z7DmZsDCgQF6xDqFWxCdmV8TxipLxiCGUrt7XAdyN4yeMn9t7XWyFkGgBG9jHpNB0asV
 Aftw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwB9S577GaEajgAamkTObbyvav9GRfllNtgqUlvGXRXH/7iwRtr7KVT+iayuGW2Ndy6fnHVu+BEw==@nongnu.org
X-Gm-Message-State: AOJu0YxttNQ3q8k7s3YqCfSnTDpZwm248b+iYTUfOq2lY3z7PARw54Dd
 UYvuDxYgKktEeJtZvLLGSE87Ofzu+cmmUID0Nii8ZEwZgB0CoUlX+QkJhy3AZ3dmjNA=
X-Gm-Gg: AfdE7cl0CIQCo1+5gJersAgV+wDxu2gXEFPJmPN31y4NNKgbvgWDsrQAjdHZeisXsOX
 XDjOVHp3DB7Dstzk9gMoSgaN6aQLDqlgtxlChT27tXiQloMY9VgSZNxcPA3lWgZB1YrSXDpidc4
 XW9XWnyOnvU4HEus/ptcwKkV0jWGFWhHnHYayQjbUpfcqWELHwxNyp87Kf8hg2qnKOjVLYnNx0F
 TsSsTSngKLdyLTYFh6nyZhezl/El7jP+tS9wiWaJK38hnT3PQhcig19+XZJjVByORjxN4RUrpyw
 /eeZ60uMuFkwQnOJW1NFvVhnrQmSzDPi43ByOpV/Ii39d7UOraMoeK5fRy1o0vyslP8DJJ4MV7c
 qwQdVguIgf2Kr+8xVBY2qZQcDBxAYL/n2uBVyHBjJfxZejxGBxG+qd0XodqlWA5yNmn0iZ6AYMK
 LR8wbq9/M3qrnpLpMklwVDtEJ7CfS+eMw4458KsoY=
X-Received: by 2002:a17:902:f791:b0:2ca:5023:f983 with SMTP id
 d9443c01a7336-2cccaf31b0amr41495705ad.29.1783464207883; 
 Tue, 07 Jul 2026 15:43:27 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:27 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 09/25] target/arm/kvm-rme: Initialise Realm Initial Address
 space
Date: Tue,  7 Jul 2026 16:42:50 -0600
Message-ID: <20260707224306.1202330-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62b.google.com
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

Initialise the Realm's initial physical address space based on
the VM's configuration.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/boot.c         |  4 ++++
 target/arm/kvm-rme.c  | 18 ++++++++++++++++++
 target/arm/kvm-stub.c |  4 ++++
 target/arm/kvm_arm.h  | 10 ++++++++++
 4 files changed, 36 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 9b7553dde5e1..bcab21d349b4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -32,6 +32,7 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "qemu/bswap.h"
+#include "kvm_arm.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -1210,6 +1211,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     /* We assume the CPU passed as argument is the primary CPU.  */
     info->primary_cpu = cpu;
 
+    /* Mark all Realm memory as RAM */
+    kvm_arm_rme_init_guest_ram(info->loader_start, info->ram_size);
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
         arm_setup_firmware_boot(cpu, info);
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index f763d5ed6199..697e7d507f0d 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,8 +22,16 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+#define RME_PAGE_SIZE qemu_real_host_page_size()
+
+typedef struct {
+    hwaddr base;
+    hwaddr size;
+} RmeRamRegion;
+
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
+    RmeRamRegion init_ram;
 };
 
 OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
@@ -91,6 +99,16 @@ int kvm_arm_rme_init(MachineState *ms, KVMState *s)
     return 0;
 }
 
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+    if (!rme_guest) {
+        return;
+    }
+
+    rme_guest->init_ram.base = base;
+    rme_guest->init_ram.size = size;
+}
+
 void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
 {
     if (!rme_guest) {
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 6d52f172c5df..790e1940fd8a 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -42,6 +42,10 @@ bool kvm_arm_el2_supported(void)
     return false;
 }
 
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 65ec1b970606..c7dc45595159 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -267,4 +267,14 @@ void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
  */
 int kvm_arm_rme_vm_type(void);
 
+/*
+ * kvm_arm_rme_init_guest_ram
+ * @base: base address of RAM
+ * @size: size of RAM
+ *
+ * If the user requested a Realm, set the base and size of guest RAM, in order
+ * to initialize the Realm IPA space.
+ */
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
+
 #endif
-- 
2.43.0


