Received: by 10.223.172.38 with SMTP id v35csp3284956wrc;
        Fri, 22 Sep 2017 09:19:03 -0700 (PDT)
X-Received: by 10.237.36.165 with SMTP id t34mr9019797qtc.65.1506097143468;
        Fri, 22 Sep 2017 09:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506097143; cv=none;
        d=google.com; s=arc-20160816;
        b=qSmQmoD/P4rmt/UXi4Wv4M+Dhm8RWoHzhYekcj6Kk2v4zF5jOvoENZaOwMEfBiBtXf
         /RhQoIAQ1nnPGcTiNvWRT/DlZZK5SA9Fd/std526vts9vpkrkvwqNnzX4t4cX4AHw6nu
         jep+gIjy0sgy/KXz1xrkUEUmadhvKKDYfPMsuPW5hfDjepJypBWgws76N//zyMA+TTA+
         k0f5bSsB+C4ow1xvh6tXg0fTFJD9L7QQIuxSIXViet9vjyW4jH6my7/Ibbk6VZ+CQgfr
         5FAgaqRAgeWR4ZgzsblzEiLCq2cuTFV7OlphPSyLW9MllP/9LLWs9dCWfuz3c1HvEr66
         WPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wB9cQWZ63jBoxAPIWOrQ2/o89ItltycECfcVfEDTyjQ=;
        b=AN+VFefge3XdlQlY9YCEZRTgZ1/pu6gYrFEssakRTRwIITUHzy5z1lbtWuGWEje0dO
         njLPeEfsh8bsfUmJEXwqhvRCBWhMhi4sxdZBFYctXwkYMzd1MTWgL0fNL0maWzpg0zAt
         JrpuODOPgq3T8u0h6QyKjwiKj9yNECa3R5FTmASNeJMW2/glAUcmehu57GUOZBDe9L2S
         xle08hsCb5gv7fe4d9ouuZ5yU5xJ1RGSQxJa8iA1CaH1AxDhWS5Tq95qQXxQMNI30ZQO
         uYIoK4cXQ19sIpGyZkBvCJzG/mb4n0UVxWFLDSuZUMIrlhmVICkOTbZ7IG6Tubwf29kO
         jEag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lhldpALc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127si126233qkc.406.2017.09.22.09.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 09:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lhldpALc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvQfN-0004gN-3V
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 12:19:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOv-0006Kr-U7
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 12:02:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOu-00007P-B6
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 12:02:02 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOo-0008Ua-0a; Fri, 22 Sep 2017 12:01:54 -0400
Received: by mail-qk0-x242.google.com with SMTP id i14so908191qke.3;
	Fri, 22 Sep 2017 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wB9cQWZ63jBoxAPIWOrQ2/o89ItltycECfcVfEDTyjQ=;
	b=lhldpALcRSql0uZYm52aXhsWNTvMsD+W6ubYEFrDV6+bdw3wPR2vtvt39jkUstDHDW
	giRGamRumbLO2su4tvlsKcXZ45PQX/IRGpR9IW3e0fIpEQiXKKJwRtVfleFZtWMAf45a
	tI0sC1pgMA09BqS3XsmgWovxAq8j9Xnr6Eum1Yu6PenAx/ZJaO/LHFAUYmCHvytk6pDz
	yXQJIWr/0eDJfVQqaaBuDxX+DrabsIm9VmuexbyIn6eE+DUKwTLxLQnpycN7qLps506G
	SGOw0x6YYGJYlRdV4okmI6RjbbPW2i3n3tiLzHSFMwMn678+xQSsbpTkgCB65x2QQlyj
	RfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wB9cQWZ63jBoxAPIWOrQ2/o89ItltycECfcVfEDTyjQ=;
	b=f4l7lfd1ZLEFKHWE9c6Sh95eSGLQ9lFcYpy+BHCoTwtZ8zoVZbNUuBjRhUJ304RG7g
	jfpDQUzODwHbQwpPsJ4Fgknsqs/zFM0SjqiOpAfdqkeg0+IhU/4oq9O887jC/PtD08JD
	ImDY2u0O5UjkhVZyCYHm6TdW8qnygPc+OR+kqpADV4GsYd+2jPpDxrFg0MixodpSEU4U
	f982CZPUE3zkc0nnEszO8abft+sgvbnb2bPIp78Fl6B+nRk3oguudiS+wWB4kf5u8crI
	yfKvQsTXp9e+P5z9JRuA8XIu3es5KFD3TF/MdL0QvIXJmHb0NU+XVRKSoXh4B6RrTDSo
	zoBg==
X-Gm-Message-State: AHPjjUie9uxoI5gZ3NP9JZSfFzggtZ+kGOsjlwvfOI/YJTZWzKA49Utw
	NDTRwH0/esUMfKF36Br7hic=
X-Google-Smtp-Source: AOwi7QBXhTISXJx2mHKlC8twiPktg6QBjr5KgqPlAeHQ4CRPKKuDQpwS1hd9VoWF4NjX8aGuSQ3ggg==
X-Received: by 10.55.54.12 with SMTP id d12mr7884240qka.20.1506096113283;
	Fri, 22 Sep 2017 09:01:53 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.01.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:01:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Sep 2017 13:01:04 -0300
Message-Id: <20170922160111.31885-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH 27/34] hw/pci: declare pci_nic_init_nofail() in
 "hw/net/pci.h"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tLw85xQLCy6X

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_internal.h | 16 +++++++++++
 include/hw/net/pci.h  | 20 +++++++++++++
 include/hw/pci/pci.h  |  4 ---
 hw/arm/virt.c         |  1 +
 hw/mips/mips_malta.c  |  1 +
 hw/pci/pci.c          | 67 ++------------------------------------------
 hw/pci/pci_nic.c      | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/e500.c         |  1 +
 hw/ppc/spapr.c        |  1 +
 hw/pci/Makefile.objs  |  1 +
 10 files changed, 120 insertions(+), 69 deletions(-)
 create mode 100644 hw/pci/pci_internal.h
 create mode 100644 include/hw/net/pci.h
 create mode 100644 hw/pci/pci_nic.c

diff --git a/hw/pci/pci_internal.h b/hw/pci/pci_internal.h
new file mode 100644
index 0000000000..d967468767
--- /dev/null
+++ b/hw/pci/pci_internal.h
@@ -0,0 +1,16 @@
+/*
+ * QEMU PCI internal
+ *
+ * Copyright (c) 2005 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_HW_PCI_INTERNAL_H
+#define QEMU_HW_PCI_INTERNAL_H
+
+#include "hw/pci/pci_bus.h"
+
+PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr);
+
+#endif
diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
new file mode 100644
index 0000000000..529591b7f3
--- /dev/null
+++ b/include/hw/net/pci.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU network devices
+ *
+ * Copyright (c) 2005 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_HW_NET_PCI_H
+#define QEMU_HW_NET_PCI_H
+
+#include "net/net.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+
+PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
+                               const char *default_model,
+                               const char *default_devaddr);
+
+#endif
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index aa7ef9cf69..6a0f7b5472 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -422,10 +422,6 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
                                           PCIINTxRoutingNotifier notifier);
 void pci_device_reset(PCIDevice *dev);
 
-PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
-                               const char *default_model,
-                               const char *default_devaddr);
-
 PCIDevice *pci_vga_init(PCIBus *bus);
 
 int pci_bus_num(PCIBus *s);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b410d7..39fab3acb9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -35,6 +35,7 @@
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
 #include "hw/devices.h"
+#include "hw/net/pci.h"
 #include "net/net.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/device_tree.h"
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 6945fa47c3..fb6a2f9363 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -48,6 +48,7 @@
 #include "hw/timer/mc146818rtc.h"
 #include "hw/input/i8042.h"
 #include "hw/timer/i8254.h"
+#include "hw/net/pci.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1e6fb88eba..9b678c8fd0 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -28,7 +28,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "monitor/monitor.h"
-#include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
@@ -41,6 +40,7 @@
 #include "hw/hotplug.h"
 #include "hw/boards.h"
 #include "qemu/cutils.h"
+#include "pci_internal.h"
 
 //#define DEBUG_PCI
 #ifdef DEBUG_PCI
@@ -671,8 +671,7 @@ static int pci_parse_devaddr(const char *addr, int *domp, int *busp,
     return 0;
 }
 
-static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root,
-                                 const char *devaddr)
+PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr)
 {
     int dom, bus;
     unsigned slot;
@@ -1812,68 +1811,6 @@ PciInfoList *qmp_query_pci(Error **errp)
     return head;
 }
 
-static const char * const pci_nic_models[] = {
-    "ne2k_pci",
-    "i82551",
-    "i82557b",
-    "i82559er",
-    "rtl8139",
-    "e1000",
-    "pcnet",
-    "virtio",
-    "sungem",
-    NULL
-};
-
-static const char * const pci_nic_names[] = {
-    "ne2k_pci",
-    "i82551",
-    "i82557b",
-    "i82559er",
-    "rtl8139",
-    "e1000",
-    "pcnet",
-    "virtio-net-pci",
-    "sungem",
-    NULL
-};
-
-/* Initialize a PCI NIC.  */
-PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
-                               const char *default_model,
-                               const char *default_devaddr)
-{
-    const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
-    PCIBus *bus;
-    PCIDevice *pci_dev;
-    DeviceState *dev;
-    int devfn;
-    int i;
-
-    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
-        exit(0);
-    }
-
-    i = qemu_find_nic_model(nd, pci_nic_models, default_model);
-    if (i < 0) {
-        exit(1);
-    }
-
-    bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
-    if (!bus) {
-        error_report("Invalid PCI device address %s for device %s",
-                     devaddr, pci_nic_names[i]);
-        exit(1);
-    }
-
-    pci_dev = pci_create(bus, devfn, pci_nic_names[i]);
-    dev = &pci_dev->qdev;
-    qdev_set_nic_properties(dev, nd);
-    qdev_init_nofail(dev);
-
-    return pci_dev;
-}
-
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
     switch (vga_interface_type) {
diff --git a/hw/pci/pci_nic.c b/hw/pci/pci_nic.c
new file mode 100644
index 0000000000..fb1a10ff12
--- /dev/null
+++ b/hw/pci/pci_nic.c
@@ -0,0 +1,77 @@
+/*
+ * QEMU PCI network interface
+ *
+ * Copyright (c) 2004 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/net/pci.h"
+#include "net/net.h"
+#include "pci_internal.h"
+
+static const char *const pci_nic_models[] = {
+    "ne2k_pci",
+    "i82551",
+    "i82557b",
+    "i82559er",
+    "rtl8139",
+    "e1000",
+    "pcnet",
+    "virtio",
+    "sungem",
+    NULL
+};
+
+static const char *const pci_nic_names[] = {
+    "ne2k_pci",
+    "i82551",
+    "i82557b",
+    "i82559er",
+    "rtl8139",
+    "e1000",
+    "pcnet",
+    "virtio-net-pci",
+    "sungem",
+    NULL
+};
+
+/* Initialize a PCI NIC.  */
+PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
+                               const char *default_model,
+                               const char *default_devaddr)
+{
+    const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
+    PCIBus *bus;
+    PCIDevice *pci_dev;
+    DeviceState *dev;
+    int devfn;
+    int i;
+
+    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
+        exit(0);
+    }
+
+    i = qemu_find_nic_model(nd, pci_nic_models, default_model);
+    if (i < 0) {
+        exit(1);
+    }
+
+    bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
+    if (!bus) {
+        error_report("Invalid PCI device address %s for device %s",
+                     devaddr, pci_nic_names[i]);
+        exit(1);
+    }
+
+    pci_dev = pci_create(bus, devfn, pci_nic_names[i]);
+    dev = &pci_dev->qdev;
+    qdev_set_nic_properties(dev, nd);
+    qdev_init_nofail(dev);
+
+    return pci_dev;
+}
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index db0e49ab8f..482757ca7b 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -24,6 +24,7 @@
 #include "hw/hw.h"
 #include "hw/char/serial.h"
 #include "hw/pci/pci.h"
+#include "hw/net/pci.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 17ea77618c..96007051e2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -56,6 +56,7 @@
 #include "hw/pci-host/spapr.h"
 #include "hw/ppc/xics.h"
 #include "hw/pci/msi.h"
+#include "hw/net/pci.h"
 
 #include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
diff --git a/hw/pci/Makefile.objs b/hw/pci/Makefile.objs
index 9f905e6344..125428fd54 100644
--- a/hw/pci/Makefile.objs
+++ b/hw/pci/Makefile.objs
@@ -1,4 +1,5 @@
 common-obj-$(CONFIG_PCI) += pci.o pci_bridge.o
+common-obj-$(CONFIG_PCI) += pci_nic.o
 common-obj-$(CONFIG_PCI) += msix.o msi.o
 common-obj-$(CONFIG_PCI) += shpc.o
 common-obj-$(CONFIG_PCI) += slotid_cap.o
-- 
2.14.1

