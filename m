Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411745wrt;
        Mon, 26 Nov 2018 03:33:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5e3XnN9rnQrqdiYGt528E5/+qhdXXk30SwUHFPiAQQAYFUomV4SIxbraFt2UzCbTgH7lWkm
X-Received: by 2002:a81:3051:: with SMTP id w78mr27720759yww.236.1543232029257;
        Mon, 26 Nov 2018 03:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232029; cv=none;
        d=google.com; s=arc-20160816;
        b=lTDnoIk+56hlD5n+Gvw3zdw6GchNDxNR3MV/Lg9rKE5O9k9Tdw+GsV8gB4zFuhVhvT
         sUsECGCIAXMJpRmknyQjVocStRNLfzu3CJCG0bPpHB2CR8HrI1UMjEPga5cgBbLWXacl
         2hs7R4T/r8AKqWogcE2xADstmFJV5XhvYbXh522wpND9UtMp+29QV4lZnftZBzFD0QRL
         LTX5jS3s/HByWyTDCx4nN8TzYhs5UJ7RMpYefrkHtXgfZheglbqQxetEHYm124Ru+Lro
         vHpvSfdEVTbey87C4+fRdDbbppJwBZap0YcUHduxKnyFnZ9qo9jQTBilha5kYCiizb8D
         PltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=QSPhJ9EPOMLzUZBNID27CJyK+LPnRas/xhFcFCwWp9Y=;
        b=jmii5Ux57ZrsNGFdkC2sQX82mmFNFc6AWaxPsQROddZYWPQ2J9VOygi6SAGiOLLRvh
         mzcodx8csrqovKx8wlTJKBevnNSp1z3guTuWboue9zy+DRIV7cjrzqSwksMDgqBswpFl
         UgMcyH7qzWh7Um7kgIbrmdqpaDQEFyeBfzY6b7QJVfFuLER1GUrzLM8gA4+vXJrbRfzi
         vT0t+HvOVAhFJGP7/V4rzDYu2l6TWIC8zh0tZi9xlxKDlctnKhNgmsGlqMsIdiiYT1TY
         VDMljqww8lJY2A9dZp0/cGSzDOIHbuIaWgYOMbhca5lUEps1Ex4JubVMzyftdrL5fLy1
         GHlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6-v6si23978ybg.273.2018.11.26.03.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF9A-0000Qx-G4
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0000DT-4J
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8W-0001rj-Ha
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:14 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56444 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8U-0001pH-Gm; Mon, 26 Nov 2018 06:33:08 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 87A554590BFC74BD5CA6;
	Mon, 26 Nov 2018 19:33:04 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWu0H031666;
	Mon, 26 Nov 2018 19:32:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330377-13057778 ;
	Mon, 26 Nov 2018 19:33:03 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:56 +0800
Message-Id: <1543262162-6351-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:03,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:55,
	Serialize complete at 2018-11-26 19:32:55
X-MAIL: mse01.zte.com.cn wAQBWu0H031666
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 3/9] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: 2MDw/bsgdZMt

Add pvpanic new type "TYPE_PVPANIC_MMIO"

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/pvpanic.c         | 50 +++++++++++++++++++++++++++++++++++++++++++----
 include/hw/misc/pvpanic.h |  1 +
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 0f23a67..c9382a8 100644
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
@@ -28,6 +30,9 @@
 #define PVPANIC_ISA_DEVICE(obj)    \
     OBJECT_CHECK(PVPanicISAState, (obj), TYPE_PVPANIC)
 
+#define PVPANIC_MMIO_DEVICE(obj)    \
+    OBJECT_CHECK(PVPanicMMIOState, (obj), TYPE_PVPANIC_MMIO)
+
 static void handle_event(int event)
 {
     static bool logged;
@@ -56,21 +61,32 @@ typedef struct PVPanicISAState {
     MemoryRegion mr;
 } PVPanicISAState;
 
+/* PVPanicMMIOState for sysbus device and
+ * use mmio.
+ */
+typedef struct PVPanicMMIOState {
+    SysBusDevice parent_obj;
+    /*<private>*/
+
+    /* public */
+    MemoryRegion mr;
+} PVPanicMMIOState;
+
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
@@ -125,9 +141,35 @@ static TypeInfo pvpanic_isa_info = {
     .class_init    = pvpanic_isa_class_init,
 };
 
+static void pvpanic_mmio_initfn(Object *obj)
+{
+    PVPanicMMIOState *s = PVPANIC_MMIO_DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
+                          TYPE_PVPANIC_MMIO, 2);
+    sysbus_init_mmio(sbd, &s->mr);
+}
+
+static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_mmio_info = {
+    .name          = TYPE_PVPANIC_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PVPanicMMIOState),
+    .instance_init = pvpanic_mmio_initfn,
+    .class_init    = pvpanic_mmio_class_init,
+};
+
 static void pvpanic_register_types(void)
 {
     type_register_static(&pvpanic_isa_info);
+    type_register_static(&pvpanic_mmio_info);
 }
 
 type_init(pvpanic_register_types)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 1ee071a..f1a05b2 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -15,6 +15,7 @@
 #define HW_MISC_PVPANIC_H
 
 #define TYPE_PVPANIC "pvpanic"
+#define TYPE_PVPANIC_MMIO "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-- 
1.8.3.1

