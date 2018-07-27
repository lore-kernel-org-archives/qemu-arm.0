Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp782520wru;
        Fri, 27 Jul 2018 07:43:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeAIF4iPQ0RLL5SztjPMlIi0In2qNcvWzYGvaqjLyvpkYyOvlPQpzCPneezyssqUOAophd+
X-Received: by 2002:aed:3bc5:: with SMTP id s5-v6mr6542320qte.225.1532702580950;
        Fri, 27 Jul 2018 07:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702580; cv=none;
        d=google.com; s=arc-20160816;
        b=iOGQAJw9CDNgNIAh0ixxh2a2IkXBKM4qB45DawM48r7v83Vmce2TlGimkcSTIhteIX
         YsTCYbaUzOXmg67FfnkA7K9DuUVpyMsw/bscOgaHPxQTJXfCOuanaAJHTZdg9+QicAAz
         Lk7jWWdi+2TDwwsGpRDuIL5YJFOhZcuxqdA1Z1Rys/gpvfJ6cvI82r0RjQW8wKkb1YDE
         KPV+5HkFAYmc9CvyReZfLUAvublvPsxvkrJuf22Gy0+eszYQTaCbCB3jEiZRtru0n8bw
         XQl26CYn9Ev9RU4TOQqgdQnU/j/n+RMOpGuIzfInni+QlW869BivOVARspydTsklxBh1
         3CJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=qvraLByO/kTFGXNIHQTq+FBy7LriVYzywtvp9ciXh88=;
        b=P3jitVa/iOlwYGGCsMlPv9zNZGKW/DtmRixBLw9a7jp30kUJiagiQH9CZAa137Bb5g
         rrjDSp5DZJ1jM3k32A0fZjbShpKwgxLFsBbQYbKukBqLjqbMFKHSxVHG5wXjBvBKKsJZ
         YYIOde8r1Id6f+laSxh1vwVmD4DHZP2i3sih0t83xIFQM1rW27KAD2nk6dGm59Jc0jB7
         OwwOyCfDBYW3ISn+PZq74/s8jiUI/4V3gt5Bjg0AkZ8wrqmTAz/eZO9o4iHie3KaLbh1
         t6QjKseB8OhpRz+5L23YDCo/vWORtnM/e3hniE/CQJZ4//Fv6AVRNyHQTPqYHiTygUYE
         Xt8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=oDk74vel;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U8Jd9xDc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U8Jd9xDc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n54-v6si938200qtb.25.2018.07.27.07.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=oDk74vel;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U8Jd9xDc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U8Jd9xDc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3xM-0006qK-F8
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sH-0003FE-SQ
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sG-0008Ib-IY
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:45 -0400
Received: from greensocs.com ([193.104.36.180]:50605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sB-0008Ac-FY; Fri, 27 Jul 2018 10:37:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D5D2642899A;
	Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=TBvJXPPgCFdfbLN9eDsNvJN9V0c/E9DoiD6BK2AxeaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oDk74velvNhby1mpSLcDpIMB+YUEtflCOlVW/a1yguBNsoSjzep3YaBLOrvsrdhMr
	A2XnwqVRmexaOAEaMNSNSDfvtNuTTrTWhtlnDo1NleEKoE3p+lw/twv2Hnquuhz2SJ
	gPTRrIAgGyi1yveHv35LgxEAAOTygZKsWH1MZtes=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U8Jd9xDc;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U8Jd9xDc
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgjokB7tLjZZ; Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id ECCE9443482; Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702249;
	bh=TBvJXPPgCFdfbLN9eDsNvJN9V0c/E9DoiD6BK2AxeaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U8Jd9xDcAKoH2UmbN7e+dfA/4zBqKdoNHPGwVuSRiCiK05JVZz4Lr4plmU7ladfRe
	06ccZ0Gn/USTy2Yg3Ar5/e6DabZNrNDTKcJBt/n8ic8vpJnUYeFzwZ9eNe7jxeWyrw
	t7aBbT2LukrH+8VrnltWApsWDcW3nU0F+YGmTkec=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8C1D3400DC8;
	Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702249;
	bh=TBvJXPPgCFdfbLN9eDsNvJN9V0c/E9DoiD6BK2AxeaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U8Jd9xDcAKoH2UmbN7e+dfA/4zBqKdoNHPGwVuSRiCiK05JVZz4Lr4plmU7ladfRe
	06ccZ0Gn/USTy2Yg3Ar5/e6DabZNrNDTKcJBt/n8ic8vpJnUYeFzwZ9eNe7jxeWyrw
	t7aBbT2LukrH+8VrnltWApsWDcW3nU0F+YGmTkec=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:20 +0200
Message-Id: <0379e54aecc5534d68e1ac3bdf61fda79916396e.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 1/6] qdev: add a power and clock gating
 support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+FkNjhniejy

Add two boolean new fields _powered_ and _clocked_ to hold the gating
state. Also add methods to act on each gating change.
The power/clock gating is controlled by 2 functions *device_set_power* and
*device_set_clock*.

Add a default behavior to do a device_reset at power-up.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/qdev-core.h | 30 ++++++++++++++++++++++++
 hw/core/qdev.c         | 52 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f1fd0f8736..659287e185 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -34,6 +34,7 @@ typedef void (*DeviceUnrealize)(DeviceState *dev, Error **errp);
 typedef void (*DeviceReset)(DeviceState *dev);
 typedef void (*BusRealize)(BusState *bus, Error **errp);
 typedef void (*BusUnrealize)(BusState *bus, Error **errp);
+typedef void (*DeviceGatingUpdate)(DeviceState *dev);
 
 struct VMStateDescription;
 
@@ -109,6 +110,8 @@ typedef struct DeviceClass {
     DeviceReset reset;
     DeviceRealize realize;
     DeviceUnrealize unrealize;
+    DeviceGatingUpdate power_update;
+    DeviceGatingUpdate clock_update;
 
     /* device state */
     const struct VMStateDescription *vmsd;
@@ -151,6 +154,9 @@ struct DeviceState {
     int num_child_bus;
     int instance_id_alias;
     int alias_required_for_version;
+
+    bool powered;
+    bool clocked;
 };
 
 struct DeviceListener {
@@ -404,6 +410,12 @@ void device_class_set_parent_realize(DeviceClass *dc,
 void device_class_set_parent_unrealize(DeviceClass *dc,
                                        DeviceUnrealize dev_unrealize,
                                        DeviceUnrealize *parent_unrealize);
+void device_class_set_parent_power_update(DeviceClass *dc,
+                                          DeviceGatingUpdate dev_power_update,
+                                          DeviceGatingUpdate *parent_power_update);
+void device_class_set_parent_clock_update(DeviceClass *dc,
+                                          DeviceGatingUpdate dev_clock_update,
+                                          DeviceGatingUpdate *parent_clock_update);
 
 const struct VMStateDescription *qdev_get_vmsd(DeviceState *dev);
 
@@ -434,4 +446,22 @@ static inline bool qbus_is_hotpluggable(BusState *bus)
 void device_listener_register(DeviceListener *listener);
 void device_listener_unregister(DeviceListener *listener);
 
+/**
+ * device_set_power:
+ * Enable/Disable the power of a device
+ *
+ * @dev: device to update
+ * @en: true to enable, false to disable
+ */
+void device_set_power(DeviceState *dev, bool en);
+
+/**
+ * device_set_clock:
+ * Enable/Disable the clock of a device
+ *
+ * @dev: device to update
+ * @en: true to enable, false to disable
+ */
+void device_set_clock(DeviceState *dev, bool en);
+
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 529b82de18..bb6d36eab9 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -950,6 +950,8 @@ static void device_initfn(Object *obj)
 
     dev->instance_id_alias = -1;
     dev->realized = false;
+    dev->powered = true;
+    dev->clocked = true;
 
     object_property_add_bool(obj, "realized",
                              device_get_realized, device_set_realized, NULL);
@@ -1038,6 +1040,13 @@ static void device_unparent(Object *obj)
     }
 }
 
+static void device_power_update(DeviceState *dev)
+{
+    if (dev->powered) {
+        device_reset(dev);
+    }
+}
+
 static void device_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
@@ -1052,6 +1061,8 @@ static void device_class_init(ObjectClass *class, void *data)
      */
     dc->hotpluggable = true;
     dc->user_creatable = true;
+
+    dc->power_update = device_power_update;
 }
 
 void device_class_set_parent_reset(DeviceClass *dc,
@@ -1078,6 +1089,22 @@ void device_class_set_parent_unrealize(DeviceClass *dc,
     dc->unrealize = dev_unrealize;
 }
 
+void device_class_set_parent_power_update(DeviceClass *dc,
+                                       DeviceGatingUpdate dev_power_update,
+                                       DeviceGatingUpdate *parent_power_update)
+{
+    *parent_power_update = dc->power_update;
+    dc->power_update = dev_power_update;
+}
+
+void device_class_set_parent_clock_update(DeviceClass *dc,
+                                       DeviceGatingUpdate dev_clock_update,
+                                       DeviceGatingUpdate *parent_clock_update)
+{
+    *parent_clock_update = dc->clock_update;
+    dc->clock_update = dev_clock_update;
+}
+
 void device_reset(DeviceState *dev)
 {
     DeviceClass *klass = DEVICE_GET_CLASS(dev);
@@ -1087,6 +1114,31 @@ void device_reset(DeviceState *dev)
     }
 }
 
+void device_set_power(DeviceState *dev, bool en)
+{
+    DeviceClass *klass = DEVICE_GET_CLASS(dev);
+
+    if (en != dev->powered) {
+        dev->powered = en;
+        if (klass->power_update) {
+            klass->power_update(dev);
+        }
+    }
+}
+
+void device_set_clock(DeviceState *dev, bool en)
+{
+    DeviceClass *klass = DEVICE_GET_CLASS(dev);
+
+    if (en != dev->clocked) {
+        dev->clocked = en;
+        if (klass->clock_update) {
+            klass->clock_update(dev);
+        }
+    }
+}
+
+
 Object *qdev_get_machine(void)
 {
     static Object *dev;
-- 
2.18.0

