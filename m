Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp877529ejc;
        Fri, 26 Jan 2024 05:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+IlDJ3N2IIfMRdvQ/Nf9/Sjb/JRMZaIiMSFO9rbGkzENrAmau3rHPXQKLn8KEL279+tyF
X-Received: by 2002:a05:620a:4142:b0:783:cf8e:3fd1 with SMTP id k2-20020a05620a414200b00783cf8e3fd1mr1280780qko.20.1706276056236;
        Fri, 26 Jan 2024 05:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276056; cv=none;
        d=google.com; s=arc-20160816;
        b=gWFSGZD69t7lGrGbYQF3ct5ycxmDoX5yO1+Ho5uy2LLj6DTwp5FsFGasfuTgm3EzsU
         0xqg1xKJKJX1s1lN/SbYH7O1Ew77OyHFhBBxlh4J3cuCWPsiQcPvmJeYyK+9MRebZbsY
         BMYvY5NZ8WbVW6yKLg63ft0s7XPFcaYt13hcn+lZzN0TE+HHGh9o+f23pbexOBvRwM/u
         n9JcY9+gBhm4bs5PlGInXXmcQNjeWfUuFXKx8oXvUWzQBpoWpsF9G9G2SnZuUMMtG5He
         Z71DFehPJ+rIrkyqJH5K6NA9sbqtZlvRweH0UJKcqJbQtldMDdElFdhoO83Gkkbgfbk6
         99aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=dQBuliXqHi7P1NG5Gy67g9SNPRSb2Jwv9ldeLNgoNDI=;
        fh=za8d50mC5rkhZmLzbgC0DovKQfedkIjGsi2wxbrkWZ8=;
        b=Fl90IGl6fiDwtF2HnmGe8ePuDDx27iIGToB/nWwEV3FdlNhnIp2P+8RyuvdMr3h+A4
         /XY5uhaSnmxygMAmu+XdDV5NWzebEe9PEBeTHrlZX1x185KsZS76zY5m8fZ6LYzLASU8
         Z8/IJiFEBxCL9ui3trI5ggEyQ+gq9ZzP7i0fTzh9Nj8bIguecnOyhHz8j5YqXo7KrPlN
         5uNyMhX9IRcYOrwxX2XcwaUgMsp6ZNt56F4iMGEbDIUgJuRh1CVY4/Mnh/aFsFhFcGvr
         D2LZ7+euKn21Me2xYwYZ/iPO00ZUSYROtRBYsFesnBTEeQUSdBt2AD9NtI46LGOJ3ubq
         qfnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020ae9f50d000000b007833f260edesi1282519qkg.487.2024.01.26.05.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTMKC-0003zA-H2; Fri, 26 Jan 2024 08:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMK6-0003RT-4t; Fri, 26 Jan 2024 08:32:46 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMK3-00080V-Eo; Fri, 26 Jan 2024 08:32:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzCG2KrGz4wxx;
 Sat, 27 Jan 2024 00:32:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzCC6wvQz4wny;
 Sat, 27 Jan 2024 00:32:39 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/17] hw/fsi: Introduce IBM's Local bus
Date: Fri, 26 Jan 2024 14:32:06 +0100
Message-ID: <20240126133217.996306-8-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K8vrlx3qld89

From: Ninad Palsule <ninad@linux.ibm.com>

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS is modelled to maintain mapped memory for the devices. The
memory is mapped after CFAM config, peek table and FSI slave registers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - removed lbus_add_device() bc unused
       - removed lbus_create_device() bc used only once
       - removed "address" property
       - updated meson.build to build fsi dir
       - included an empty hw/fsi/trace-events ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 meson.build           |  1 +
 hw/fsi/trace.h        |  1 +
 include/hw/fsi/lbus.h | 32 ++++++++++++++++++++++++++++++++
 hw/fsi/lbus.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
 hw/Kconfig            |  1 +
 hw/fsi/Kconfig        |  2 ++
 hw/fsi/meson.build    |  1 +
 hw/fsi/trace-events   |  0
 hw/meson.build        |  1 +
 9 files changed, 82 insertions(+)
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

diff --git a/meson.build b/meson.build
index d0329966f1b4..7d926c6e8270 100644
--- a/meson.build
+++ b/meson.build
@@ -3290,6 +3290,7 @@ if have_system
     'hw/char',
     'hw/display',
     'hw/dma',
+    'hw/fsi',
     'hw/hyperv',
     'hw/i2c',
     'hw/i386',
diff --git a/hw/fsi/trace.h b/hw/fsi/trace.h
new file mode 100644
index 000000000000..ee67c7fb04da
--- /dev/null
+++ b/hw/fsi/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_fsi.h"
diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
new file mode 100644
index 000000000000..e8a22e22a8fa
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,32 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Local bus and connected device structures.
+ */
+#ifndef FSI_LBUS_H
+#define FSI_LBUS_H
+
+#include "hw/qdev-core.h"
+#include "qemu/units.h"
+#include "exec/memory.h"
+
+#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
+OBJECT_DECLARE_SIMPLE_TYPE(FSILBusDevice, FSI_LBUS_DEVICE)
+
+typedef struct FSILBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+} FSILBusDevice;
+
+#define TYPE_FSI_LBUS "fsi.lbus"
+OBJECT_DECLARE_SIMPLE_TYPE(FSILBus, FSI_LBUS)
+
+typedef struct FSILBus {
+    BusState bus;
+
+    MemoryRegion mr;
+} FSILBus;
+
+#endif /* FSI_LBUS_H */
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
new file mode 100644
index 000000000000..44d2319087a8
--- /dev/null
+++ b/hw/fsi/lbus.c
@@ -0,0 +1,43 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Local bus where FSI slaves are connected
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/fsi/lbus.h"
+
+#include "hw/qdev-properties.h"
+
+#include "trace.h"
+
+static void fsi_lbus_init(Object *o)
+{
+    FSILBus *lbus = FSI_LBUS(o);
+
+    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS, 1 * MiB);
+}
+
+static const TypeInfo fsi_lbus_info = {
+    .name = TYPE_FSI_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = fsi_lbus_init,
+    .instance_size = sizeof(FSILBus),
+};
+
+static const TypeInfo fsi_lbus_device_type_info = {
+    .name = TYPE_FSI_LBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(FSILBusDevice),
+    .abstract = true,
+};
+
+static void fsi_lbus_register_types(void)
+{
+    type_register_static(&fsi_lbus_info);
+    type_register_static(&fsi_lbus_device_type_info);
+}
+
+type_init(fsi_lbus_register_types);
diff --git a/hw/Kconfig b/hw/Kconfig
index 9ca7b38c31f1..2c00936c28e8 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -9,6 +9,7 @@ source core/Kconfig
 source cxl/Kconfig
 source display/Kconfig
 source dma/Kconfig
+source fsi/Kconfig
 source gpio/Kconfig
 source hyperv/Kconfig
 source i2c/Kconfig
diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
new file mode 100644
index 000000000000..9c34a418d700
--- /dev/null
+++ b/hw/fsi/Kconfig
@@ -0,0 +1,2 @@
+config FSI
+    bool
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
new file mode 100644
index 000000000000..93ba19dd0411
--- /dev/null
+++ b/hw/fsi/meson.build
@@ -0,0 +1 @@
+system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/hw/meson.build b/hw/meson.build
index f01fac4617c9..463d70268304 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -44,6 +44,7 @@ subdir('virtio')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
+subdir('fsi')
 
 subdir('alpha')
 subdir('arm')
-- 
2.43.0

