Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5412631wrt;
        Mon, 26 Nov 2018 03:34:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XVc+zE0UA3+yi0QdYFQPmzHp9VQm5Ubzh9wDcVnX27h3Bgw3Ma2Xh7v4UfefHBC41jJ0eY
X-Received: by 2002:a25:8809:: with SMTP id c9-v6mr14079701ybl.322.1543232076860;
        Mon, 26 Nov 2018 03:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232076; cv=none;
        d=google.com; s=arc-20160816;
        b=O0may2Vsja5sPNGFjvbhlflcHT7HHB0fWWhWnTlkQWlniHiLx8aYv8E2H6TG63X3uo
         jxI0TynYBdgUmmZI7RhkUccIIUR0DVnKhIe27ChzQBDvl9g8418hoREZftOpJoCnMAQS
         anGSTFkU8+v1PoId/5oA6CDLNZd4CK2MOFKKqU9aGOzq4RbeqYMyQOuSsPEhGN+OkSw3
         Jj+RWlwBbN+PcL+fgpo5st+eTdHG5bSn9PdHjBdwOyK0tLLzfwRoyZsS3lrHubEnBZTi
         HTzqSLrDlQsa7FEzOS1uDf9mWQWA+aCCCioiUNC85l8j+qrvEMpbGOCDv10GhitrB7VQ
         P0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gq/FE9HfbLNYJOzjxZPi46LwEmhOmPTVZyO9wCAnN84=;
        b=FP8Wxzd72jmoAcpQGD897I5GpcozsNU09L3STBVY6vtwLKN7vSRrRsR+N25tCXeNGb
         +Vk2zISMlXUytbEdPj1iF6MPCo9TRWpn88RoB7Qs2AJUzGGbpJvt8NwvYNIuvU2f5bCT
         c/MokYxbyEOaDa873xrwt/IOFeDm5PrcK5ltGzZGB7OhQEF6dqPjtFcW1fxpncaVEeTF
         AiowymvDacCiClwiDmd5PM4JUYCeS39XillyvN/PxVFEEGWqsJKERNx57kd2QAUDk3jK
         P5+U0eI82aiKdsiP96GlRSIpRDIzRxx1K5erFYdhYIBO0u5YzERbCnN4X2IdBIJcqK5g
         lSBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si43321ywe.22.2018.11.26.03.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF9w-00012q-3a
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:34:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8d-0000Em-Vx
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0001vd-4U
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:39722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8Y-0001ro-Ds; Mon, 26 Nov 2018 06:33:12 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3B39AD33C8E1A9C43870;
	Mon, 26 Nov 2018 19:33:08 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBX1Vl031808;
	Mon, 26 Nov 2018 19:33:01 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330892-13057786 ;
	Mon, 26 Nov 2018 19:33:08 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:56:00 +0800
Message-Id: <1543262162-6351-8-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:08,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:33:00,
	Serialize complete at 2018-11-26 19:33:00
X-MAIL: mse01.zte.com.cn wAQBX1Vl031808
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V9 7/9] hw/misc/pvpanic: preparing for adding
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
X-TUID: BJ0RcD58LsT3

Prepare for pvpanic-mmio configure interface.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/sysbus-fdt.c |  2 ++
 hw/arm/virt.c       |  1 +
 hw/misc/pvpanic.c   | 10 +++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

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
index f2cb5de..bb756a6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1783,6 +1783,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PVPANIC_MMIO);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index c9382a8..08263ed 100644
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
@@ -151,10 +151,18 @@ static void pvpanic_mmio_initfn(Object *obj)
     sysbus_init_mmio(sbd, &s->mr);
 }
 
+static Property pvpanic_mmio_properties[] = {
+    DEFINE_PROP_UINT32("mmio", PVPanicMMIOState, base, 0x09070000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+
 static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
+    dc->props = pvpanic_mmio_properties;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
-- 
1.8.3.1

