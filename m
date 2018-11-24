Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3048958wrt;
        Sat, 24 Nov 2018 00:21:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WFcZhCL9dZCswlR/Zl7dCD5T6QVx6E6DBrOBQagQ4NTZNya09nU3NHmKHXXg8SInW6NLzY
X-Received: by 2002:a81:de0d:: with SMTP id k13mr8866538ywj.61.1543047666061;
        Sat, 24 Nov 2018 00:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047666; cv=none;
        d=google.com; s=arc-20160816;
        b=Ab0y0eSBDfHhJT79YfKt1E/u5apmmopCNNlnieIOL1sNzPepGqezcQRZBD/DuKG+dF
         hy48a/R0z9aC96eLhuTmr8LnwJPyjrsQBIwmU42FAHNf3/RZ0MPxl9n73FdpQ2RMVWMD
         /g/ZvCKb6B4cYqyxQl40dJ6dZTzaT/kYEtiIncHa4jr1ZEAdJYszrTVGKO3aVUovDdcV
         jkWzP9HGxnwWpanEbVcH5AHs7tvSIiJbvyb/y0J8rYAnHQr3j9OkG0/T/ArN1dBzFAJp
         I8J0LUbU/McZkbq4GogVhfP0jcCJwoGmcj0GMSkVmaISiAHl7mcTYPB4szVHfr19nTzW
         lcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=cKojKVRZRlS1mdmEYs6wZmQn4N4RMJTLPk4p28VeD94=;
        b=uwRFIdgQvgRk4TtUQGfZsftG2oWv7pFjd/zfY7UnAsC82WbgemvUXudx/9jYz0RKqn
         Dtpsqu0psDx7otNWYTqInMbCGzmH6mkPHcT3AslY8wPTJzIakXEMGhqrUHD83hpTcx3u
         SFyPR1Zh5J/QYW8yMqC+hbfHge6wGxOB8yZs09h2YzsL/h1xkVTVdhq8ITZ/RoWDlvNU
         rH+Ni9i31ZPB5a/raU3Gn7hblUCpFozAC9aiX1KBPXzkdDZ+TT/mpJG+V3wiCYjrESk0
         m4Qf/qJipZEqz96BKVblSQOzgEyUpsE9MhCEOwBuWJbStG+d6rJRzSmC+4Y6KfXFmZds
         yTyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4-v6si35223703ybo.465.2018.11.24.00.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:21:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTBZ-0000G5-Eo
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:21:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAq-0008VQ-PV
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT47-0005rb-TE
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:13:24 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40452 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT44-0005fT-4j; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id F10C089A5EC6AF52C1A8;
	Sat, 24 Nov 2018 16:12:56 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8CnhY023401;
	Sat, 24 Nov 2018 16:12:49 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416133560-12697201 ;
	Sat, 24 Nov 2018 16:13:35 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:26 +0800
Message-Id: <1543077273-16201-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:35,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:29,
	Serialize complete at 2018-11-24 16:12:29
X-MAIL: mse01.zte.com.cn wAO8CnhY023401
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH 03/10] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: cBgk7+JCtzy/

Add pvpanic new type "TYPE_PVPANIC_MMIO"

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/pvpanic.c         | 36 ++++++++++++++++++++++++++++++++----
 include/hw/misc/pvpanic.h | 15 +++++++++++++++
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 0f23a67..2bcbfc5 100644
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
@@ -57,20 +59,20 @@ typedef struct PVPanicISAState {
 } PVPanicISAState;
 
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
@@ -125,9 +127,35 @@ static TypeInfo pvpanic_isa_info = {
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
index 1ee071a..66dbdfe 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -15,9 +15,24 @@
 #define HW_MISC_PVPANIC_H
 
 #define TYPE_PVPANIC "pvpanic"
+#define TYPE_PVPANIC_MMIO "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
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
+#define PVPANIC_MMIO_DEVICE(obj)    \
+    OBJECT_CHECK(PVPanicMMIOState, (obj), TYPE_PVPANIC_MMIO)
+
 static inline uint16_t pvpanic_port(void)
 {
     Object *o = object_resolve_path_type("", TYPE_PVPANIC, NULL);
-- 
1.8.3.1

