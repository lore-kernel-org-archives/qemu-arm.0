Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548570wrt;
        Tue, 27 Nov 2018 19:50:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5f7fdtNC+lhmUt1np7TjdoQBXCOVeS95f32vpqeMNQU5YhbAOd6XRORDZn16fGLlNiTywmA
X-Received: by 2002:a81:a311:: with SMTP id a17-v6mr37270178ywh.240.1543377045705;
        Tue, 27 Nov 2018 19:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377045; cv=none;
        d=google.com; s=arc-20160816;
        b=STBvZOpKxuR3c+iKmHJ0nxyffxIh8kt7BkIwx/PC1ojyUaj3yk/ARcJJjpbVULvmvn
         5zaltyRDD2Jf8gTijtTaEB+8BChmr8cl1Izneg0i937ue7a9yzVht06jsUZ0uBijGtZY
         r+X9QMQS+sWXS6/c5pd9GtHbQSs3Dv/MpxIlcVGljxsm29BV13fKmNU770WjBJ59Ja1C
         IY2fLLrY48/USycOHK8uWOMprQcaAAo8+SIqbYRJ5PjGEwAwbUaM2c9aGj6+/KL47HyC
         E7fEvmkXgdioiLQLqlm/8yzgd0003ZZ/iyOXJu5bSkkbKkchOH4QI3FNmzSFocQtssTh
         o5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=QSPhJ9EPOMLzUZBNID27CJyK+LPnRas/xhFcFCwWp9Y=;
        b=l7CMlSEwyE+qU17SByRqWaXekMwXO1pE2jZH3cy6rTw/Cx8m0Z/g2m1noGTSsiKe1t
         fM1bbMC4IXjSu7yElp0D8O0lThqFkNC3m2xOFWnsEwRh1ELYYDFwmYbpOF7bs/YwqnIY
         KlhewiFzZOBHdMhTjcwf3X2LLBH/8DCuRlseZ+xAba/3+zHgwlDZ28F5APd59hgEFLts
         HkEJD9y1I52/Bx0+Y4VZZDOTrVTHKVp71yzUxPehe4ZD//qCEkXA2VbLkW+DATIxINPN
         NDhPwytjC1m/Dc2o0alSA2Vh1CVHCOoWU8xhYAll3ORWwaAx5LIaJYDrf/VUYaf0c9IN
         SaKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r144si4352895ywe.157.2018.11.27.19.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqs9-0002to-1j
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrY-0002YD-1I
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrV-0003W8-0c
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33888 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqrU-0003Tj-MJ; Tue, 27 Nov 2018 22:50:04 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 7FEC06A9E58A0E7E1F62;
	Wed, 28 Nov 2018 11:49:59 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3npBE058620;
	Wed, 28 Nov 2018 11:49:51 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501179-13417656 ;
	Wed, 28 Nov 2018 11:50:11 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:46 +0800
Message-Id: <1543407172-16175-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:12,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:43,
	Serialize complete at 2018-11-28 11:49:43
X-MAIL: mse01.zte.com.cn wAS3npBE058620
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V10 3/9] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: 3odPa1xjoesV

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

