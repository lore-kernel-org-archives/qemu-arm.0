Received: by 2002:a17:906:3503:b0:a46:a4a7:8772 with SMTP id r3csp5590eja;
        Tue, 26 Mar 2024 11:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWM4upxsvH3+/nJyHTGc/RcaIeyTHiByj4tDooxGGX6RNw9jX/NCF4WX2c/vL/3Qd6eBRWQ5mP7tY7c/0+0rjuOmlwHOROA
X-Google-Smtp-Source: AGHT+IHg/gbcDPFU7zqQSso5iiXmuVKLfbJrPkLd0TJ4YPm1uSg+wJlc3aPvGYw9vFqrONLomtYh
X-Received: by 2002:a05:6870:a353:b0:222:90a1:596f with SMTP id y19-20020a056870a35300b0022290a1596fmr358052oak.49.1711477515744;
        Tue, 26 Mar 2024 11:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711477515; cv=none;
        d=google.com; s=arc-20160816;
        b=P4mWhMBkDY63Dkz27+nvfz/KwRs3KjFgjdgVeKNPsZKDrqSdN87XqHAEy/RUdQ85Ka
         qxVN14YYdTQsH3qx+GiVh8443Ot5DNrK/51uBVMPKscJkcGFvUJOrvBGoYDHmxHMkySA
         KNDO1dGajYdHCtBLHUbWPP+nzjgCHdam5rC/vQjjTUP0hQIVlvAyncvu30P/upoSMxyl
         BV/91VjgEu9ElQzAxn4oLqDuT1hv7XKzP2VVFTKh/75us1f/b3O/3YP0kybSFox5NHKG
         Bse5/uNSg6nxRby39xoHJGEFHe/ayLCbriWXJe1YsiNSNIHqfssdCeHIo6LOCWHLwzEV
         aZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cGNMybOMlxCJGZODy6nvWYCZ1N19oqz26jzzbl0BxdA=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=uBib0fJIu80e6Uww5/3DWAr3G0XzRM/Ba3WHpFxYSwVa126FBWD1QUj7fYra1wSNs2
         meoLeW3uu0EYV85ygTjmFdkLV7EQhacDH9bGWX43c2OtiJiY20Nxif6K9Tfw0Ev0eUZK
         jp1g1HRP5vp7SGe0nM0vXGS0aZQPOxrglm0kiJzUZmwOTYlHdv8jXGcn6xbUlM+rGA0y
         ia9R1s8d9TpYsWYQH4bJU+S9HnDd8Km/j0KI0TGKPCjEK4dlBsAFzA4bYeTl+zKfpCmP
         Zc9ZHSftJwZ3c+aVTG7bA0F/AYGav9DdZiU5cNgIuPieCLDPrnoICn2PuWbSXbQ8hIQ/
         x1mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ApOVY9df;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv25-20020a05622a0a1900b00430ef625c07si8255206qtb.328.2024.03.26.11.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 11:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ApOVY9df;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rpBT4-0007dg-Nj; Tue, 26 Mar 2024 14:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBSz-0007Yu-CR
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 14:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBSx-0000FD-Eb
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 14:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711477446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGNMybOMlxCJGZODy6nvWYCZ1N19oqz26jzzbl0BxdA=;
 b=ApOVY9dfOfvWVSBfZ0PIVagxTm50U6Yg1QOPcc/+zdxdxBPxLOKsCVvGjgiDwrTLMS3DVM
 lHTRjWrZA3ra2Dne66C4ykTBTb57rZXMBTJYUpNFMguccnn8OsDOOId+vuG2PHs2RvWbAQ
 Zv81yTZkaEQ7Qf2PJttcj15WC8mpfXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-wRuEh6sxNZSaYbUWeNeBYw-1; Tue, 26 Mar 2024 14:23:59 -0400
X-MC-Unique: wRuEh6sxNZSaYbUWeNeBYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24C99101A523;
 Tue, 26 Mar 2024 18:23:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C3D610E47;
 Tue, 26 Mar 2024 18:23:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v3 2/5] hw/arm: Allow setting KVM vGIC maintenance IRQ
Date: Tue, 26 Mar 2024 19:22:36 +0100
Message-ID: <20240326182345.326758-3-eric.auger@redhat.com>
In-Reply-To: <20240326182345.326758-1-eric.auger@redhat.com>
References: <20240326182345.326758-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DJy/CobeXu3Q

From: Haibo Xu <haibo.xu@linaro.org>

Allow virt arm machine to set the interrupt ID for the KVM
GIC maintenance interrupt.

This setting must be done before the KVM_DEV_ARM_VGIC_CTRL_INIT
hence the choice to perform the setting in the GICv3 realize
instead of proceeding the same way as kvm_arm_pmu_set_irq().

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- tweak the commit message and explain why we do not proceed
  the same way as kvm_arm_pmu_set_irq (Peter)

v1 -> v2:
- [Miguel] replaced the has_virt_extensions by the maintenance irq
  intid property. [Eric] restored kvm_device_check_attr and
  kvm_device_access standard usage and conditionally call those
  if the prop is set.
---
 hw/arm/virt.c                      |  3 +++
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 4 files changed, 26 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9a913aead..b20b20edf4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -795,6 +795,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                          OBJECT(mem), &error_fatal);
                 qdev_prop_set_bit(vms->gic, "has-lpi", true);
             }
+        } else {
+       qdev_prop_set_uint32(vms->gic, "maintenance-interrupt-id",
+                            ARCH_GIC_MAINT_IRQ);
         }
     } else {
         if (!kvm_irqchip_in_kernel()) {
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index cb55c72681..df056dc35c 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -564,6 +564,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_UINT32("maintenance-interrupt-id", GICv3State, maint_irq, 0),
     /*
      * Compatibility property: force 8 bits of physical priority, even
      * if the CPU being emulated should have fewer.
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77eb37e131..23fad60515 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/arm/virt.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
@@ -820,6 +821,26 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->maint_irq) {
+        int ret;
+
+        ret = kvm_device_check_attr(s->dev_fd,
+                                    KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
+        if (!ret) {
+            error_setg_errno(errp, errno,
+                             "VGICv3 setting maintenance IRQ is not "
+                             "supported by this host kernel");
+            return;
+        }
+
+        ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0,
+                                &s->maint_irq, true, errp);
+        if (ret) {
+            error_setg_errno(errp, errno, "Failed to set VGIC maintenance IRQ");
+            return;
+       }
+    }
+
     multiple_redist_region_allowed =
         kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
                               KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4e2fb518e7..4ff421a165 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -246,6 +246,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    uint32_t maint_irq;
     bool lpi_enable;
     bool security_extn;
     bool force_8bit_prio;
-- 
2.41.0

