Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10478711wrt;
        Thu, 6 Dec 2018 03:04:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V1mv0nZnB8ExuXwjyBWoa/x+G5NFSTvqKS99AyI70eT9+weFGvGoJhB+wJ91G2LgNFuVF9
X-Received: by 2002:ac8:76c3:: with SMTP id q3mr26780305qtr.48.1544094294816;
        Thu, 06 Dec 2018 03:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544094294; cv=none;
        d=google.com; s=arc-20160816;
        b=JlEe7sX0Z/d7o0fMU7ztB3nHZ6FiRR3BeposvN77UF4gOj5DIR9gwadtFkte4e3oPF
         aDXDhIETRIWUtnMj8WxgqO6enCpa0h3MembaQDI74odH5tCOmwc188UV3dHGahxVYJHj
         Q/Mx+X+7hgc/oRdQUWu4jNa2dlbvjwMii+DQiO1hKlD72N6eFrN80UBAgP9HolCgOKbm
         MhsHbnSTX8kPg+V6DpS1im1uI0iY5/ZM5F5pSNMzjukeL7bkkBjzAplVP5lc+V/emzGU
         Y5ueo1YJ99te7HfcaP95WtnfD9SUAAdzrL+KGHnfYwlbLSje3LJ2+FyFsV8t4VmVb5/Z
         +/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=pdgWrx47Auqw/rwXTXOl/yTPivTKvbm774Htaa8mZuE=;
        b=k/ms9iL6z5S9za6O2ee5qnMHKofNkBpl05GCb0HS71xmtcUtWB2Ag5buKFEhqGI9I4
         3z1oc8y/I8DWlgkOwq/NbzoHD34qgOaCbb6th5c012zOgV808qom2rxMujkde9MUbgKh
         q/okPY0/aaSmrN2q/vi9oOE31OjVbP+rYMio6SD/cM2elKhgmw7y04SWiEL2Lwymb2o1
         dMVrhQhA27qRmWXV2LjAO8kLBr7or6ebu6s1wbZ39ZS22LJpR8dDei4p/anSSIAKtOqA
         fg3dMirXy+Zn+cgeaCM2VdggAmU8jJv51mQw8DHj+nrVK2wJa4ruRGG3PMnJhJ1sBQbI
         XEXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si8632qvo.206.2018.12.06.03.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 03:04:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUrSf-000312-LS
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 06:04:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSK-0002xL-Fi
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSG-0000Ex-3A
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:32 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:41282 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUrSF-00008r-EI; Thu, 06 Dec 2018 06:04:27 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 49F1B9EA645449850BCA;
	Thu,  6 Dec 2018 19:04:13 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB6B3x9L072804;
	Thu, 6 Dec 2018 19:03:59 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120619043131-15124399 ;
	Thu, 6 Dec 2018 19:04:31 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Thu, 6 Dec 2018 19:25:58 +0800
Message-Id: <1544095560-70807-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-06 19:04:31,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-06 19:03:48,
	Serialize complete at 2018-12-06 19:03:48
X-MAIL: mse01.zte.com.cn wB6B3x9L072804
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V12 3/5] hw/misc/pvpanic: Add the PCI interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: req+23u2f7KX

Add pvpanic new type "TYPE_PVPANIC_PCI"

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/pvpanic.c         | 62 ++++++++++++++++++++++++++++++++++++++++++++---
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 3 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 0f23a67..9fb9168 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -2,10 +2,12 @@
  * QEMU simulated pvpanic device.
  *
  * Copyright Fujitsu, Corp. 2013
+ * Copyright (c) 2018 ZTE Ltd.
  *
  * Authors:
  *     Wen Congyang <wency@cn.fujitsu.com>
  *     Hu Tao <hutao@cn.fujitsu.com>
+ *     Peng Hao <peng.hao2@zte.com.cn>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -18,6 +20,7 @@
 
 #include "hw/nvram/fw_cfg.h"
 #include "hw/misc/pvpanic.h"
+#include "hw/pci/pci.h"
 
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
@@ -27,6 +30,8 @@
 
 #define PVPANIC_ISA_DEVICE(obj)    \
     OBJECT_CHECK(PVPanicISAState, (obj), TYPE_PVPANIC)
+#define PVPANIC_PCI_DEVICE(obj)    \
+    OBJECT_CHECK(PVPanicPCIState, (obj), TYPE_PVPANIC_PCI)
 
 static void handle_event(int event)
 {
@@ -56,21 +61,31 @@ typedef struct PVPanicISAState {
     MemoryRegion mr;
 } PVPanicISAState;
 
+/* PVPanicPCIState for PCI device and
+ * use mmio.
+ */
+typedef struct PVPanicPCIState {
+    /*< private>*/
+    PCIDevice dev;
+
+    /*<public>*/
+    MemoryRegion mr;
+} PVPanicPCIState;
 /* return supported events on read */
-static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
+static uint64_t pvpanic_read(void *opaque, hwaddr addr, unsigned size)
 {
     return PVPANIC_PANICKED;
 }
 
-static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
+static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
                                  unsigned size)
 {
     handle_event(val);
 }
 
 static const MemoryRegionOps pvpanic_ops = {
-    .read = pvpanic_ioport_read,
-    .write = pvpanic_ioport_write,
+    .read = pvpanic_read,
+    .write = pvpanic_write,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
@@ -125,9 +140,48 @@ static TypeInfo pvpanic_isa_info = {
     .class_init    = pvpanic_isa_class_init,
 };
 
+/* pvpanic pci device*/
+
+static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
+{
+    PVPanicPCIState *s = DO_UPCAST(PVPanicPCIState, dev, dev);
+
+    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
+                          TYPE_PVPANIC_PCI, 2);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mr);
+}
+
+static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
+
+    pc->realize = pvpanic_pci_realizefn;
+    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
+    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
+    pc->revision = 1;
+    pc->class_id = PCI_CLASS_SYSTEM_OTHER;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_pci_info = {
+    .name          = TYPE_PVPANIC_PCI,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PVPanicPCIState),
+    .class_init    = pvpanic_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+
 static void pvpanic_register_types(void)
 {
     type_register_static(&pvpanic_isa_info);
+    type_register_static(&pvpanic_pci_info);
 }
 
 type_init(pvpanic_register_types)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 1ee071a..477cc36 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -15,6 +15,7 @@
 #define HW_MISC_PVPANIC_H
 
 #define TYPE_PVPANIC "pvpanic"
+#define TYPE_PVPANIC_PCI "pvpanic-pci"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e6514bb..92622f7 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -103,6 +103,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
+#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0101
 
 #define FMT_PCIBUS                      PRIx64
 
-- 
1.8.3.1

