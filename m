Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1981556eje;
        Tue, 11 Jul 2023 08:36:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGa9rSWXFQrqZgCLZGiHajYgZ+6ubmi+sV8CEL95zHLApiYJb5TZL6TzcAorTjntnDOEM1w
X-Received: by 2002:a05:622a:1703:b0:403:b2d9:fbbb with SMTP id h3-20020a05622a170300b00403b2d9fbbbmr6478229qtk.7.1689089790984;
        Tue, 11 Jul 2023 08:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689089790; cv=none;
        d=google.com; s=arc-20160816;
        b=A4wDrftkO0QICjb5aeGZWo0DOcxmwuEvpn+Pp7SN/i3EILPYKhqO5hfp7+uNnGcy1n
         r3I8LajV36EP/+V5mlh2el5S0D644xhqWbE9FnVOPlkaEX0LdEIitSHDXAmNBmbwlcD4
         BAU48mF98cURHve0Txcye1lM/u9yT4e1I+KfoV2rjQ7PUdK4fHJ8oeu/sAcevZ9kDyel
         ehg6aNFaoL8ZLXqyFCZYN8ALWAcM723/SlTeEP0U58/TjU1v68c/IwRVzNeY8m/W4yfH
         5nJ9wuizkFwvlJ6Jc0ags8onKKn9bkHQMVqekXyOJozWMVraXk0605ORJooQM1AU4Z6W
         /GZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RxEnr9OgTsaxRnNcqrFO9mwEThypEltoPLodmgEnhOw=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=hMRuWy+IZC9kgApyJVN6DR6BEZxjsV61x7GSuLh7pBvBeynsoSzP1OJRKIfZGiUGoV
         y5qDGmYl2ObcuzMWwLYj0cvs888uRZmnsxH7R4tyVJpvA78enFqF/DRiVpsN0YMIB0a7
         VVgfMws4viKGX9UQQryB1nnY4CgvXetx61l0V/haN1aU/hrFdeAceolfF99FjllP9SFb
         y8SQulajtkmSRmvbbZHibUqH0AvprKrJ7P39551PIVmjp52OM0FdRk8oaq0EYFdIV1Od
         79geC5+F07LIshe6q8XA4+q4sTTJwKwmBsv77UEguTA1qqW/qTMwC4vaZkobzZ8R+5Ec
         HemA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgCz2QOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020a05622a024b00b004038ab64d10si933466qtx.210.2023.07.11.08.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 08:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgCz2QOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJFOf-0007zh-JP; Tue, 11 Jul 2023 11:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFOa-0007vK-08
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFOW-0005qy-AE
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689089714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxEnr9OgTsaxRnNcqrFO9mwEThypEltoPLodmgEnhOw=;
 b=ZgCz2QOjqDnTZRPgvDjDowZy2Id0+VGue3w1ab3B4d+rOrehDtSSXqCEx/kRIBfj87/JsF
 H/lDc9MD80uIIu65tRw0HsfEUnnCbAKi9xYDWzc34PupAbfCoqLhjbidngo8c0041cwedg
 ly+EGGFIxxpdhhTmWkQ/19ln/CaLV8g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-oaGRBzSlOIiVLgU8Ndupew-1; Tue, 11 Jul 2023 11:35:11 -0400
X-MC-Unique: oaGRBzSlOIiVLgU8Ndupew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DA03848185;
 Tue, 11 Jul 2023 15:18:03 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D024FC09A09;
 Tue, 11 Jul 2023 15:34:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: [PATCH v4 1/7] virtio-md-pci: New parent type for virtio-mem-pci and
 virtio-pmem-pci
Date: Tue, 11 Jul 2023 17:34:39 +0200
Message-ID: <20230711153445.514112-2-david@redhat.com>
In-Reply-To: <20230711153445.514112-1-david@redhat.com>
References: <20230711153445.514112-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: jiU+uxQ2KpaY

Let's add a new abstract "virtio memory device" type, and use it as
parent class of virtio-mem-pci and virtio-pmem-pci.

Tested-by: Mario Casquero <mcasquer@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS                       |  6 ++++++
 hw/virtio/Kconfig                 |  8 +++++--
 hw/virtio/meson.build             |  1 +
 hw/virtio/virtio-md-pci.c         | 33 +++++++++++++++++++++++++++++
 hw/virtio/virtio-mem-pci.c        |  5 +----
 hw/virtio/virtio-mem-pci.h        |  6 +++---
 hw/virtio/virtio-pmem-pci.c       |  5 +----
 hw/virtio/virtio-pmem-pci.h       |  6 +++---
 include/hw/virtio/virtio-md-pci.h | 35 +++++++++++++++++++++++++++++++
 9 files changed, 89 insertions(+), 16 deletions(-)
 create mode 100644 hw/virtio/virtio-md-pci.c
 create mode 100644 include/hw/virtio/virtio-md-pci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e158a25cfe..bb4626faf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2229,6 +2229,12 @@ F: hw/virtio/virtio-crypto.c
 F: hw/virtio/virtio-crypto-pci.c
 F: include/hw/virtio/virtio-crypto.h
 
+virtio based memory device
+M: David Hildenbrand <david@redhat.com>
+S: Supported
+F: hw/virtio/virtio-md-pci.c
+F: include/hw/virtio/virtio-md-pci.h
+
 virtio-mem
 M: David Hildenbrand <david@redhat.com>
 S: Supported
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index a9ee09062f..92c9cf6c96 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -35,6 +35,10 @@ config VIRTIO_CRYPTO
     default y
     depends on VIRTIO
 
+config VIRTIO_MD
+    bool
+    select MEM_DEVICE
+
 config VIRTIO_PMEM_SUPPORTED
     bool
 
@@ -43,7 +47,7 @@ config VIRTIO_PMEM
     default y
     depends on VIRTIO
     depends on VIRTIO_PMEM_SUPPORTED
-    select MEM_DEVICE
+    select VIRTIO_MD
 
 config VIRTIO_MEM_SUPPORTED
     bool
@@ -54,7 +58,7 @@ config VIRTIO_MEM
     depends on VIRTIO
     depends on LINUX
     depends on VIRTIO_MEM_SUPPORTED
-    select MEM_DEVICE
+    select VIRTIO_MD
 
 config VHOST_VSOCK_COMMON
     bool
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index c4f4fe05fa..13e7c6c272 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -63,6 +63,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md-pci.c'))
 
 specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
diff --git a/hw/virtio/virtio-md-pci.c b/hw/virtio/virtio-md-pci.c
new file mode 100644
index 0000000000..6b02ff908e
--- /dev/null
+++ b/hw/virtio/virtio-md-pci.c
@@ -0,0 +1,33 @@
+/*
+ * Abstract virtio based memory device
+ *
+ * Copyright (C) 2023 Red Hat, Inc.
+ *
+ * Authors:
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-md-pci.h"
+#include "hw/mem/memory-device.h"
+
+static const TypeInfo virtio_md_pci_info = {
+    .name = TYPE_VIRTIO_MD_PCI,
+    .parent = TYPE_VIRTIO_PCI,
+    .instance_size = sizeof(VirtIOMDPCI),
+    .class_size = sizeof(VirtIOMDPCIClass),
+    .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_MEMORY_DEVICE },
+        { }
+    },
+};
+
+static void virtio_md_pci_register(void)
+{
+    type_register_static(&virtio_md_pci_info);
+}
+type_init(virtio_md_pci_register)
diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index b85c12668d..2ef0f07630 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -142,14 +142,11 @@ static void virtio_mem_pci_instance_init(Object *obj)
 
 static const VirtioPCIDeviceTypeInfo virtio_mem_pci_info = {
     .base_name = TYPE_VIRTIO_MEM_PCI,
+    .parent = TYPE_VIRTIO_MD_PCI,
     .generic_name = "virtio-mem-pci",
     .instance_size = sizeof(VirtIOMEMPCI),
     .instance_init = virtio_mem_pci_instance_init,
     .class_init = virtio_mem_pci_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_MEMORY_DEVICE },
-        { }
-    },
 };
 
 static void virtio_mem_pci_register_types(void)
diff --git a/hw/virtio/virtio-mem-pci.h b/hw/virtio/virtio-mem-pci.h
index e636e1a48d..c50b51d608 100644
--- a/hw/virtio/virtio-mem-pci.h
+++ b/hw/virtio/virtio-mem-pci.h
@@ -13,21 +13,21 @@
 #ifndef QEMU_VIRTIO_MEM_PCI_H
 #define QEMU_VIRTIO_MEM_PCI_H
 
-#include "hw/virtio/virtio-pci.h"
+#include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-mem.h"
 #include "qom/object.h"
 
 typedef struct VirtIOMEMPCI VirtIOMEMPCI;
 
 /*
- * virtio-mem-pci: This extends VirtioPCIProxy.
+ * virtio-mem-pci: This extends VirtIOMDPCI.
  */
 #define TYPE_VIRTIO_MEM_PCI "virtio-mem-pci-base"
 DECLARE_INSTANCE_CHECKER(VirtIOMEMPCI, VIRTIO_MEM_PCI,
                          TYPE_VIRTIO_MEM_PCI)
 
 struct VirtIOMEMPCI {
-    VirtIOPCIProxy parent_obj;
+    VirtIOMDPCI parent_obj;
     VirtIOMEM vdev;
     Notifier size_change_notifier;
 };
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index 197d219204..cfe7f3b67c 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -110,13 +110,10 @@ static void virtio_pmem_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo virtio_pmem_pci_info = {
     .base_name             = TYPE_VIRTIO_PMEM_PCI,
     .generic_name          = "virtio-pmem-pci",
+    .parent                = TYPE_VIRTIO_MD_PCI,
     .instance_size = sizeof(VirtIOPMEMPCI),
     .instance_init = virtio_pmem_pci_instance_init,
     .class_init    = virtio_pmem_pci_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_MEMORY_DEVICE },
-        { }
-    },
 };
 
 static void virtio_pmem_pci_register_types(void)
diff --git a/hw/virtio/virtio-pmem-pci.h b/hw/virtio/virtio-pmem-pci.h
index 63cfe727f7..88b01ce2db 100644
--- a/hw/virtio/virtio-pmem-pci.h
+++ b/hw/virtio/virtio-pmem-pci.h
@@ -14,21 +14,21 @@
 #ifndef QEMU_VIRTIO_PMEM_PCI_H
 #define QEMU_VIRTIO_PMEM_PCI_H
 
-#include "hw/virtio/virtio-pci.h"
+#include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-pmem.h"
 #include "qom/object.h"
 
 typedef struct VirtIOPMEMPCI VirtIOPMEMPCI;
 
 /*
- * virtio-pmem-pci: This extends VirtioPCIProxy.
+ * virtio-pmem-pci: This extends VirtIOMDPCI.
  */
 #define TYPE_VIRTIO_PMEM_PCI "virtio-pmem-pci-base"
 DECLARE_INSTANCE_CHECKER(VirtIOPMEMPCI, VIRTIO_PMEM_PCI,
                          TYPE_VIRTIO_PMEM_PCI)
 
 struct VirtIOPMEMPCI {
-    VirtIOPCIProxy parent_obj;
+    VirtIOMDPCI parent_obj;
     VirtIOPMEM vdev;
 };
 
diff --git a/include/hw/virtio/virtio-md-pci.h b/include/hw/virtio/virtio-md-pci.h
new file mode 100644
index 0000000000..a241b54fcd
--- /dev/null
+++ b/include/hw/virtio/virtio-md-pci.h
@@ -0,0 +1,35 @@
+/*
+ * Abstract virtio based memory device
+ *
+ * Copyright (C) 2023 Red Hat, Inc.
+ *
+ * Authors:
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_VIRTIO_MD_PCI_H
+#define HW_VIRTIO_MD_PCI_H
+
+#include "hw/virtio/virtio-pci.h"
+#include "qom/object.h"
+
+/*
+ * virtio-md-pci: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_MD_PCI "virtio-md-pci"
+
+OBJECT_DECLARE_TYPE(VirtIOMDPCI, VirtIOMDPCIClass, VIRTIO_MD_PCI)
+
+struct VirtIOMDPCIClass {
+    /* private */
+    VirtioPCIClass parent;
+};
+
+struct VirtIOMDPCI {
+    VirtIOPCIProxy parent_obj;
+};
+
+#endif
-- 
2.41.0

