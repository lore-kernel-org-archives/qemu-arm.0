Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3065700wrt;
        Sat, 24 Nov 2018 00:44:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XA4hCBuPvAKm9e1OB3PxcDTRiVfAWgjrSTGpfLbO8he3E9SlZXAy4PJqfUVX78jsJ/rTbX
X-Received: by 2002:a81:5250:: with SMTP id g77mr16578884ywb.95.1543049047738;
        Sat, 24 Nov 2018 00:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049047; cv=none;
        d=google.com; s=arc-20160816;
        b=UoZUh1WGyuRXdw/LHtpmw6/HAaVrhArH1MDo9CqghxsI7oE8kM6E8xD2yKZ4X1qhjz
         Q+dZBAcNMU6RMvaUqmzEdVeNZgbhkiiaV2qtqAwBEdklGwBx5X1++NI7qfakQDAcN2vo
         T9Irt802wO4WskSM8nK6zjt2hJ5F5FYWH1knPZpQso7qGbtGlzEChN7Ln2RW+xWdZUTJ
         cJp0wSzP+cUztcnM+68PlZeNsvA3cd1LRAqea8c5MfpAf3QI39TpG7xAIaUOcpw2n2+Q
         6Cx2JeOSZ4em3F4WkqIGPvA9i845yf/t8PkexCD6geOAit3Jzk6EXCOuYiyI1JRRNVIQ
         Eq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=cKojKVRZRlS1mdmEYs6wZmQn4N4RMJTLPk4p28VeD94=;
        b=zflfQm2iFy851oFCjG6bERNUHJhbtukvxu9RyteQV9KxNiLTNJ+4GQbXVxaQZraNSZ
         icnuS+ttiz9Wx02K+k2IE52ViSsP3AMsecUWogLNDRLJ4mUKwv4vkrTXb/u7Wkqh3NUG
         inXx6cpxJxteZeeOXNQNhJXIs6H6e8hFQL1Tp8EX0kYKUiSOwgY4Ab8AegoHYBv5OvCW
         bNJXQCizXrHwxp92yXAIEkq7+CX/fRGbwK7FEnxlb+vNQcIh5JoH98LXX4CyLkI+3gH5
         XtH04/4n9LagVi3bLvIAP1Qm3ROvcNUg4BbRo17Gc/wSD1IwzWw3zTib5auTI9a3uX7Z
         UuPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s64si295672ywc.265.2018.11.24.00.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTXr-0005hM-4a
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:44:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUJ-0002j7-O5
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSY-0000CM-1G
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:38:41 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55462 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSX-000089-NF; Sat, 24 Nov 2018 03:38:37 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id C7832307DCA893A365BA;
	Sat, 24 Nov 2018 16:38:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cTIA035005;
	Sat, 24 Nov 2018 16:38:29 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391548-12702400 ;
	Sat, 24 Nov 2018 16:39:15 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:14 +0800
Message-Id: <1543078821-16636-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:15,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:09,
	Serialize complete at 2018-11-24 16:38:09
X-MAIL: mse01.zte.com.cn wAO8cTIA035005
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V8 03/10] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: C/ReSaT79PSb

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

