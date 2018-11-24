Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3064574wrt;
        Sat, 24 Nov 2018 00:42:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VEadOLMCtvagShyen55G/2S3EFKGCHnI7ePVrtrzSsf2/uZeuVNhlsFYDuT2Fnce+spHN1
X-Received: by 2002:a25:be8f:: with SMTP id i15-v6mr18639862ybk.441.1543048949230;
        Sat, 24 Nov 2018 00:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048949; cv=none;
        d=google.com; s=arc-20160816;
        b=FG3qeklQoMBwI0SsprTc5lHzZEM1HzP0+mmZOmB6mSue90NQnzr77OV41Zj73nNqks
         z9rMPLtgHCsRz7iMBrC6NiyByigOESf+yKZdQLalv8aMnmX6gL7tEpO13BKoMyCnIRx2
         RCHKbkeATWM+24piHSIdDjsQbAwskAEkAf15oJ3URXjVPNEQbyoR1ZY688DacTcjcb8s
         CqxErLaAgjOyIEDx8eBTAleOLVX0fb18lvkcmnkKVUn57nUji4TnXm49ATiYWQMiqE+2
         4kletY1xmaS9ZAFXO8KJNFIpcmf16ZFp9xVt/Q3r3X5SDH32fmDKJZHMGqqG9kDXaSp3
         Egxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=RyjwoAET1gPQz1fa1CGhEy41cBZ8V102TlFCFSVWlww=;
        b=y7TXYL8DVe9Un47VH2tx8NsbjFqdjNUz+GF3DvKYavx8MJ97OvaKmXAvL27ulO5wYh
         dQzgaTqprMF9f5GzIA409M6cut2L+OZ9ocGPFGG0vp3j7gGYvi3JxWKwm7x2FLsWWFqG
         X5ju3sSeO2nmMK5KuicT8n64MJoEoVl+wTSIdSE7QbKPwria4yAQWx+Kp9z0Yy9DOYG4
         pKReLuGvHrJkq4zEWxg5XkwvIs/YVIrkrBnpJL+57OuGl4xd0eBut+e7aXHBDEqReuBN
         huQN7igvYH/ditSE2QY09t+0lNuZfhIr5hO+zQftsd0FPf5PG4M5Wc0w1ogJnLhhzyUO
         6DwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k204-v6si35967667ywb.115.2018.11.24.00.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:42:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTWG-0003lq-Ix
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:42:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTU8-0002Xf-Bf
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:40:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSe-0000QF-G6
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:38:45 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:63222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSc-0000HV-Pu; Sat, 24 Nov 2018 03:38:43 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id A58A4B003B75C3F63BC8;
	Sat, 24 Nov 2018 16:38:40 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cVvd035049;
	Sat, 24 Nov 2018 16:38:31 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391793-12702423 ;
	Sat, 24 Nov 2018 16:39:17 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:19 +0800
Message-Id: <1543078821-16636-9-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:17,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:11,
	Serialize complete at 2018-11-24 16:38:11
X-MAIL: mse01.zte.com.cn wAO8cVvd035049
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-devel] [PATCH V8 08/10] hw/misc/pvpanic: preparing for adding
 configure interface
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2rSqhr6WsEIc

Prepare for pvpanic-mmio configure interface.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/sysbus-fdt.c       | 2 ++
 hw/arm/virt.c             | 1 +
 hw/misc/pvpanic.c         | 7 +++++++
 include/hw/misc/pvpanic.h | 2 +-
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index ad698d4..34577f3 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -38,6 +38,7 @@
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
 #include "hw/arm/fdt.h"
+#include "hw/misc/pvpanic.h"
 
 /*
  * internal struct that contains the information to create dynamic
@@ -459,6 +460,7 @@ static const BindingEntry bindings[] = {
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING(TYPE_PVPANIC_MMIO, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 899131a..921220a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1785,6 +1785,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PVPANIC_MMIO);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index aaa8b0c..6fea162 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -121,10 +121,17 @@ static void pvpanic_mmio_initfn(Object *obj)
     sysbus_init_mmio(sbd, &s->mr);
 }
 
+static Property pvpanic_mmio_properties[] = {
+    DEFINE_PROP_UINT32("mmio", PVPanicMMIOState, base, 0x09070000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
+    dc->props = pvpanic_mmio_properties;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 1f20775..e733e1e 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -37,7 +37,7 @@ typedef struct PVPanicISAState {
 typedef struct PVPanicMMIOState {
     SysBusDevice parent_obj;
     /*<private>*/
-
+    uint32_t base;
     /* public */
     MemoryRegion mr;
 } PVPanicMMIOState;
-- 
1.8.3.1

