Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp863854ejb;
        Fri, 9 Feb 2024 08:02:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT6YFTptFIYtdiaKJHUG0Tsky0L0UyjBOpB59mlCQ+ONV7CZGnA7my8P8WizMgY5ikfKXb
X-Received: by 2002:a05:620a:b89:b0:785:751e:c395 with SMTP id k9-20020a05620a0b8900b00785751ec395mr1779273qkh.8.1707494533388;
        Fri, 09 Feb 2024 08:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707494533; cv=none;
        d=google.com; s=arc-20160816;
        b=wUxvzaCc4RLSo1sdIgzQsclmRvCBBdgUCl6hFYpb/EjL3grw4x232cOA/kM/4xQnKz
         F0eGwE+YIFy3/ercyS6IqfoBDNauimd6tDZbrmkq5jMkDF/R9L2xXCMZLzhS+57Q+32g
         TMv5ygzIeKc9+ZN1w42amS1r3cqB5wocPWV7MCeG6+2zi6tciB6y0CINJ3DyGeynGywW
         YWJRwlxVz4PqKpKcIricTt11cfWpakR+MQRq4SKJdU0G+vt7I+cyTS6/fUalVZwnB05R
         ATYesqEGnZ9C9b3jFrOtWJwiAW98/m57dehseqwAJyufU1PCM9MZ9aTYCeMuPiERCiPx
         6uKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LSraTH6/x1G27qzZu+/i75s2Ywz/KLneIkIzuuu8C04=;
        fh=Xgll91V4I7bu3dzeOoi8gux7JWUC3HV/t8NmthsZkvw=;
        b=WU3wd6rIA2adOb48EvhFRn2QhBz5URPknZva9ZR91yHpl2OxHJK+aGoeaKdhthO8g/
         47qa+FPxhazROHuPq2SWPA669+QwbykQJYieslhWB3Ny6OmqnA6kMDS0k/ImLkFhQops
         fDzaoFVOkmrES+TkaOFGZFSFBalNhvCCiSlzSvZ5zHYvNZ/d6D+acRRPJuTquSf+TDGD
         tWEejs+rGrhyuz7LM/DbwThA28p7+6SrYIl2scbdMig9OfwMEm/FvgZEMqJlstqtckZh
         1vZ0e5/e3M7io4o8P/Z061ccGTw2gg+sn4v6aH7IVQxgD7m+b+4MJsLMHzkQ4D2vMpG6
         XWMw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PynSJDOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVDTLgM+kkZ6ew2LUuH0/zdnPad9AkP2Cj5xvgbbmN8WFqa39QRUtqoQeNbmDjLn5JPlef3lUOtWnZ1iVlPBIDjmkUTHzaS
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a118200b00783527e4a6csi2150773qkk.593.2024.02.09.08.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 08:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PynSJDOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYTJK-000130-Gv; Fri, 09 Feb 2024 11:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJG-00012E-Gb
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJ8-00064W-CJ
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707494453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSraTH6/x1G27qzZu+/i75s2Ywz/KLneIkIzuuu8C04=;
 b=PynSJDOUy7OlabuQz2A87KMwqQmw4sO9bLiMBD0iXl9A1MxrSROCz8Do2nOSRCoamJo9jq
 vdoo2ZTtEwalswyEL3ZWkQmkun3JKszJvHPL9d0VpIM9gkAQpgYe73wxXj0W1m9vG66BfV
 KBAVAHS6pJnHU2zou1QEBmmcMZ8ONK0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-r70eBU54NbOjlUKPUPlYXw-1; Fri,
 09 Feb 2024 11:00:49 -0500
X-MC-Unique: r70eBU54NbOjlUKPUPlYXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63B133C1E9DC;
 Fri,  9 Feb 2024 16:00:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DCF492BC6;
 Fri,  9 Feb 2024 16:00:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, haibo.xu@linaro.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com
Subject: [RFC v2 2/5] hw/arm: Allow setting KVM vGIC maintenance IRQ
Date: Fri,  9 Feb 2024 16:59:14 +0100
Message-ID: <20240209160039.677865-3-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
References: <20240209160039.677865-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.269,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9QAAiHc476GT

From: Haibo Xu <haibo.xu@linaro.org>

Allow virt arm machine to set the intid for the KVM GIC maintenance
interrupt.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
index 368c2a415a..5214aca898 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -750,6 +750,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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

