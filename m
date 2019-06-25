Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4852218wrg;
        Tue, 25 Jun 2019 04:35:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0q6QEbyA92X9t0UqivpWs9YOONXtbMBg3/DAeZrm3BlPezWY4xRJ/RFOjTPFp97K4ceJE
X-Received: by 2002:a50:9451:: with SMTP id q17mr107569988eda.119.1561462558573;
        Tue, 25 Jun 2019 04:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561462558; cv=none;
        d=google.com; s=arc-20160816;
        b=sBRfWhe65tDwjLa611KFZDO7vhL3xsUiGPVvR9U2xzuZaZcrcIIsHskUUuykCaniwN
         bqZMCc73WXLpYbEwhte4qqcM92ZgH5lPM76yoY+VZ8DzSUalQmfIgYS64MidqUFU33Oz
         AZ/eYcZm0FrYZYGnftsVBzsQNXn7IsrJUMPbYE0E7XPvSQyXA9c8zkwWqFF4rD1g5onu
         fISAD8x9gi2Ooc/aJE7gPCcmCLwAFfdcY7dR3Kc8B4BrloHQH3pj7gJN10HbRkgvYXOP
         5BbC0EePrObThgclKlB6p4S+T0k/NdiU9FJqQyEQLx2SxxG4DYBtPt78pifnvZuVla24
         M+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vny0JeLY8068lnZq3ri7O4TG7cP/R0bH/2O5Tk6SOxU=;
        b=PfbmXaCIiPIQGs21kI8hQoxWQtc4/ry0NNWodfBF9E87N7gHBv0YjgnixQ12rcRSzK
         djIju/cJOR7fxxXQP5Ja94LTS3TkJP/wbIFysIno0DFUKcKaGEgpE3qw7bzlhN/TtKzE
         vPLMS9BvR3xORYPnPZ8pwnEDKrwNJ3niMxadcv+gDrvgecKvjHM8/Vl8t8nPTIIOUa5J
         cwFs2JlDVP/WgG8Kw6ZnPJ/us29AgSgCw2Qe5ceLtk18OVmx+QWzz7p74EiibFKxhyAa
         Xer+tVeVSsz5MZEAzeSj4SMBfjCKSqM7o5uLbMDx2g07dnvrl3jay5rHkFIF+qQL02fP
         BeCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si162907eji.22.2019.06.25.04.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 04:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfjjx-0005al-Lr
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 07:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53697)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjdD-0006yn-0Z
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjdB-0004Az-5s
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43142 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hfjdA-000472-LJ; Tue, 25 Jun 2019 07:28:57 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 46FF97BF38E2C0BCB813;
 Tue, 25 Jun 2019 19:28:53 +0800 (CST)
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 19:28:44 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Jun 2019 19:27:51 +0800
Message-ID: <20190625112752.83188-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC PATCH 6/7] misc: CCIX endpoint function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jcm@redhat.com,
 linuxarm@huawei.com, Auger Eric <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxCxkIH0EZKD

This handles the case where a given function is not also a
PCIe topology upstream or downstream port.

This include, non function 0 functions on upstream ports and
any function on a device without a PCIe switch.  Note that
this doesn't exclude the possibility of this being the upstream
port of a CCIX layer switch.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/misc/Kconfig       |   5 ++
 hw/misc/Makefile.objs |   1 +
 hw/misc/ccix-ep.c     | 112 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 385e1b0cec..7aba167999 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -118,3 +118,8 @@ config AUX
     select I2C
=20
 source macio/Kconfig
+
+config CCIX_EP
+    bool
+    select CCIX_LIB
+   =20
\ No newline at end of file
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 77b9df9796..56a6cb3591 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_ISA_DEBUG) +=3D debugexit.o
 common-obj-$(CONFIG_SGA) +=3D sga.o
 common-obj-$(CONFIG_ISA_TESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
+common-obj-$(CONFIG_CCIX_EP) +=3D ccix-ep.o
 common-obj-$(CONFIG_EDU) +=3D edu.o
 common-obj-$(CONFIG_PCA9552) +=3D pca9552.o
=20
diff --git a/hw/misc/ccix-ep.c b/hw/misc/ccix-ep.c
new file mode 100644
index 0000000000..40a5b22dd8
--- /dev/null
+++ b/hw/misc/ccix-ep.c
@@ -0,0 +1,112 @@
+/*
+ * CCIX EP configuration space test device
+ *
+ * Copyright (c) 2019 Huawei
+ * Author: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
+ *
+ * Portions copied from pci-testdev.c
+ * Copyright (c) 2012 Red Hat Inc.
+ * Author: Michael S. Tsirkin <mst@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/pci/pci.h"
+#include "qemu/event_notifier.h"
+#include "sysemu/kvm.h"
+#include "hw/misc/ccix.h"
+#include "qemu/module.h"
+
+typedef struct CCIXEpState {
+    PCIDevice parent_obj;
+    struct CCIXState s;
+
+} CCIXEpState;
+
+#define TYPE_CCIX_EP "ccix-ep"
+#define CCIX_EP_DEV(obj) OBJECT_CHECK(CCIXEpState, (obj), TYPE_CCIX_EP)
+
+static void ccix_ep_write_config(PCIDevice *pci_dev, uint32_t addr,
+                                 uint32_t val_in, int l)
+{
+    CCIXEpState *s =3D CCIX_EP_DEV(pci_dev);
+
+    ccix_write_config(pci_dev, &s->s, addr, val_in, l);=20
+    pci_default_write_config(pci_dev, addr, val_in, l);
+}
+
+static void ccix_ep_realize(PCIDevice *pci_dev, Error **errp)
+{
+    CCIXEpState *s =3D CCIX_EP_DEV(pci_dev);
+    int offset =3D PCI_CONFIG_SPACE_SIZE;
+
+    if (PCI_FUNC(pci_dev->devfn) =3D=3D 0)
+        ccix_set_port(&s->s);
+    initialize_ccixstate(&s->s, pci_dev);
+    pci_dev->config_write =3D ccix_ep_write_config;
+    pcie_endpoint_cap_init(pci_dev, 0);
+    offset =3D ccix_add_prldvsec(pci_dev, &s->s, offset);
+    if (s->s.flags & (1 << CCIX_IS_PORT))
+        ccix_add_tdldvsec(pci_dev, offset);
+
+    pci_dev->config[PCI_INTERRUPT_PIN] =3D 0; /* no interrupt pin */
+    ccix_register(&s->s);
+}
+
+static Property ccix_props[] =3D {
+    DEFINE_PROP_STRING("ccix_device", CCIXEpState, s.ccix_dev_name),
+    DEFINE_PROP_BIT("primaryport", CCIXEpState, s.flags, PRIMARY_PORT_BI=
T, true),
+    DEFINE_PROP_UINT8("port_id", CCIXEpState, s.port_id, 0),
+    DEFINE_PROP_UINT8("num_links", CCIXEpState, s.num_links, 1),
+    DEFINE_PROP_UINT8("psam_entries", CCIXEpState, s.psam_entries, 0),
+    DEFINE_PROP_UINT8("request_agents", CCIXEpState, s.num_ras, 0),
+    DEFINE_PROP_UINT8("home_agents", CCIXEpState, s.num_has, 0),
+    DEFINE_PROP_UINT8("hsam_entries", CCIXEpState, s.hsam_entries, 0),
+    DEFINE_PROP_UINT8("rsam_entries", CCIXEpState, s.rsam_entries, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ccix_ep_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
+
+    k->realize =3D ccix_ep_realize;
+    k->vendor_id =3D PCI_VENDOR_ID_HUAWEI;
+    k->device_id =3D PCI_DEVICE_ID_HUAWEI_CCIX_EP;
+    k->revision =3D 0x00;
+    k->class_id =3D PCI_CLASS_OTHERS;
+    dc->desc =3D "CCIX EP Test Device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->props =3D ccix_props;
+}
+
+static const TypeInfo ccix_ep_info =3D {
+    .name          =3D TYPE_CCIX_EP,
+    .parent        =3D TYPE_PCI_DEVICE,
+    .instance_size =3D sizeof(CCIXEpState),
+    .class_init    =3D ccix_ep_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { },
+    },
+};
+
+static void ccix_register_types(void)
+{
+    type_register_static(&ccix_ep_info);
+}
+
+type_init(ccix_register_types)
--=20
2.20.1

