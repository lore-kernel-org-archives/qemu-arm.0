Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568B8CCA476
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 12:48:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Hvt-0005AW-6T; Mon, 13 Oct 2025 08:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v8HvY-0004uh-CA
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 08:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v8HvM-0008CE-Sq
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 08:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760359511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0QrLhBvqbk7rYuSeyggsaT9tykkvaYvB/E9Wk1LPEc=;
 b=T4PnNOR4wVYoptnWfG8LM1ypkpzfNFqhCE2dXe6szaYKQCMfQ1nCVjco2/kWoB+PiYqcMk
 XCmkTNnSNV+Rujf6ke0MY+xgeVjinD66QNbfdC2yKSqrdSnq7A5WHI0nJxtG9yxW5mHjDi
 k56GudZYScUXxLIVa999Ydki1d6Wn/c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-5jQPuWBCMnOTVeJfpENnCg-1; Mon,
 13 Oct 2025 08:45:09 -0400
X-MC-Unique: 5jQPuWBCMnOTVeJfpENnCg-1
X-Mimecast-MFC-AGG-ID: 5jQPuWBCMnOTVeJfpENnCg_1760359508
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C78141956086; Mon, 13 Oct 2025 12:45:08 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.225.105])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 541171800446; Mon, 13 Oct 2025 12:45:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 22/29] hw/arm/aspeed: Introduce AspeedCoprocessor class and
 base implementation
Date: Mon, 13 Oct 2025 14:44:13 +0200
Message-ID: <20251013124421.71977-23-clg@redhat.com>
In-Reply-To: <20251013124421.71977-1-clg@redhat.com>
References: <20251013124421.71977-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add a new AspeedCoprocessor class that defines the foundational structure for
ASPEED coprocessor models. This class encapsulates a base DeviceState with
links to system memory, clock, and peripheral components such as SCU, SCUIO,
Timer Controller, and UARTs.

Introduce the corresponding implementation file
aspeed_coprocessor_common.c, which provides the aspeed_coprocessor_realize()
method, property registration, and QOM type registration. The class is marked
as abstract and intended to serve as a common base for specific coprocessor
variants (e.g. SSP/TSP subsystems).

This establishes a reusable and extensible framework for modeling ASPEED
coprocessor devices.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20251013054334.955331-10-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_coprocessor.h | 44 ++++++++++++++++++++++++++
 hw/arm/aspeed_coprocessor_common.c  | 49 +++++++++++++++++++++++++++++
 hw/arm/meson.build                  |  3 +-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/arm/aspeed_coprocessor.h
 create mode 100644 hw/arm/aspeed_coprocessor_common.c

diff --git a/include/hw/arm/aspeed_coprocessor.h b/include/hw/arm/aspeed_coprocessor.h
new file mode 100644
index 000000000000..793c7b1f8be9
--- /dev/null
+++ b/include/hw/arm/aspeed_coprocessor.h
@@ -0,0 +1,44 @@
+/*
+ * ASPEED Coprocessor
+ *
+ * Copyright (C) 2025 ASPEED Technology Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ASPEED_COPROCESSOR_H
+#define ASPEED_COPROCESSOR_H
+
+#include "qom/object.h"
+#include "hw/arm/aspeed_soc.h"
+
+struct AspeedCoprocessorState {
+    DeviceState parent;
+
+    MemoryRegion *memory;
+    MemoryRegion sram;
+    Clock *sysclk;
+
+    AspeedSCUState scu;
+    AspeedSCUState scuio;
+    AspeedTimerCtrlState timerctrl;
+    SerialMM uart[ASPEED_UARTS_NUM];
+};
+
+#define TYPE_ASPEED_COPROCESSOR "aspeed-coprocessor"
+OBJECT_DECLARE_TYPE(AspeedCoprocessorState, AspeedCoprocessorClass,
+                    ASPEED_COPROCESSOR)
+
+struct AspeedCoprocessorClass {
+    DeviceClass parent_class;
+
+    /** valid_cpu_types: NULL terminated array of a single CPU type. */
+    const char * const *valid_cpu_types;
+    uint32_t silicon_rev;
+    const hwaddr *memmap;
+    const int *irqmap;
+    int uarts_base;
+    int uarts_num;
+};
+
+#endif /* ASPEED_COPROCESSOR_H */
diff --git a/hw/arm/aspeed_coprocessor_common.c b/hw/arm/aspeed_coprocessor_common.c
new file mode 100644
index 000000000000..8a94b44f07f2
--- /dev/null
+++ b/hw/arm/aspeed_coprocessor_common.c
@@ -0,0 +1,49 @@
+/*
+ * ASPEED Coprocessor
+ *
+ * Copyright (C) 2025 ASPEED Technology Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "system/memory.h"
+#include "hw/qdev-properties.h"
+#include "hw/arm/aspeed_coprocessor.h"
+
+static void aspeed_coprocessor_realize(DeviceState *dev, Error **errp)
+{
+    AspeedCoprocessorState *s = ASPEED_COPROCESSOR(dev);
+
+    if (!s->memory) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    }
+}
+
+static const Property aspeed_coprocessor_properties[] = {
+    DEFINE_PROP_LINK("memory", AspeedCoprocessorState, memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+};
+
+static void aspeed_coprocessor_class_init(ObjectClass *oc, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = aspeed_coprocessor_realize;
+    device_class_set_props(dc, aspeed_coprocessor_properties);
+}
+
+static const TypeInfo aspeed_coprocessor_types[] = {
+    {
+        .name           = TYPE_ASPEED_COPROCESSOR,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(AspeedCoprocessorState),
+        .class_size     = sizeof(AspeedCoprocessorClass),
+        .class_init     = aspeed_coprocessor_class_init,
+        .abstract       = true,
+    },
+};
+
+DEFINE_TYPES(aspeed_coprocessor_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index dc68391305fe..56bdb88b1175 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -52,7 +52,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'fby35.c'))
 arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files(
   'aspeed_ast27x0.c',
-  'aspeed_ast27x0-fc.c',))
+  'aspeed_ast27x0-fc.c',
+  'aspeed_coprocessor_common.c'))
 arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_common_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-- 
2.51.0


