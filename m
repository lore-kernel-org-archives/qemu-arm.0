Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp553590wrt;
        Tue, 27 Nov 2018 19:58:23 -0800 (PST)
X-Google-Smtp-Source: AJdET5cLrSn+3wYsGi7k2WBOR+tDhPyK/X25QH8eUdQBlE901HK7hIp7GsEyQ+sLI/tptHveC1//
X-Received: by 2002:a25:f50e:: with SMTP id a14-v6mr35896828ybe.205.1543377503032;
        Tue, 27 Nov 2018 19:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377503; cv=none;
        d=google.com; s=arc-20160816;
        b=ti8fwJtL0MBqmCEZc9iHl7XJCk8gP/3akfzymdcsO0mksfO7DVWzcCyx8+mWbtZd3U
         BMvfwJgsgNqzbyhEZgKqjdeN0HmuDQtiS9IUl/0gGmahQMMdH17+r5cOe5J2/dn0DAX6
         k7R3gwBj5Q9/TnIbBr6W+Nbtjk/jqL6pcKPpU2nl63cWkYttRQhXTctyMFVzxx14yW5R
         9dSx8l6qy3ZmQ6DlotY91eGk0FxR564+jgi+Lh7e4Zv2C77w63F7ncGabYuvn0jZRRpr
         yL6RKJ6VSaADXEnKWK0Uc9HVS1mO6SyIUFofwDH27t7ztfjm+W5au8wW8oiTwViNXreR
         jpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=3+04snREyJsXjwStAzYAKFCdq09NwEbImEdNCLXUOgw=;
        b=daG7gBLoQKKW1w6iqUf0qKRxXUdduYWCFYexA2MrmIwmTubKW/P9FVfkO65AFPeEjx
         YXagfjw634EPOA5Cl4bBdAc2NemocXFWcPNMqHjYTm0iGAwDIQ8fOeFJD3q7lxLa0T6g
         bkbEyLx55/MpYFtLm7TgxU6aoM0uV6PUMU5F9uHIbR/uOOEczpnpt+E+npK7AkiiD0R2
         8rxPOMQV+epV4KD9qe9qARoz/LLVydaTDilKA5d1B/1WZEvTjfg2fgTmR1GDgH9qNGLl
         /7PdDECvNyI9J+v7MRUhJv4tw3QsU8IqHf+YL6zgLFBrEe+AYhfDegggR8MSWKnvsUcr
         jUag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m127-v6si4012131ywm.405.2018.11.27.19.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqzW-0002P7-HD
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:58:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs6-00032a-Or
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs2-0003sp-3K
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:42 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:64976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqs1-0003r1-Nm; Tue, 27 Nov 2018 22:50:38 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id AFE14192758B287C341F;
	Wed, 28 Nov 2018 11:50:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nuAL058748;
	Wed, 28 Nov 2018 11:49:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501631-13417757 ;
	Wed, 28 Nov 2018 11:50:16 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:50 +0800
Message-Id: <1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:16,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:47,
	Serialize complete at 2018-11-28 11:49:47
X-MAIL: mse01.zte.com.cn wAS3nuAL058748
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V10 7/9] hw/misc/pvpanic: preparing for adding
 configure interface
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
X-TUID: xsJ35RJGgoix

Prepare for pvpanic-mmio configure interface.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/sysbus-fdt.c |  2 ++
 hw/arm/virt.c       |  2 ++
 hw/misc/pvpanic.c   | 11 +++++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

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
index f2cb5de..1fd5941 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/misc/pvpanic.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1783,6 +1784,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PVPANIC_MMIO);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index c9382a8..b6b5c89 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -67,7 +67,7 @@ typedef struct PVPanicISAState {
 typedef struct PVPanicMMIOState {
     SysBusDevice parent_obj;
     /*<private>*/
-
+    uint32_t base;
     /* public */
     MemoryRegion mr;
 } PVPanicMMIOState;
@@ -151,10 +151,17 @@ static void pvpanic_mmio_initfn(Object *obj)
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
-
+
+    dc->user_creatable = true;
+    dc->props = pvpanic_mmio_properties;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
-- 
1.8.3.1

