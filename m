Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9832035wrt;
        Wed, 5 Dec 2018 12:59:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vgvg9KT8EyGv71RAgJe0Hdbozgzur4vtlcSyWghJuarBiqVktgNNJOlRQabOktKyncCEE7
X-Received: by 2002:a37:f706:: with SMTP id q6mr22945112qkj.96.1544043550883;
        Wed, 05 Dec 2018 12:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043550; cv=none;
        d=google.com; s=arc-20160816;
        b=Vvy04cisv0eLEUqv9afO8PDCAZ70EBsCT5eVKCnP8bjIfc486q1uLtAoFgpH4BiBNm
         iKEcjiiO7tKwhecUMvwit6+TkAgZYyS0Vba2wwJdbSsckGk8056+PLZLqGyPyk9V6eOx
         5TGri2K+JKodBL6solgEQ0g5Rp6nIk/vieMONyPbY/I9sd29KpR5EMzNZ7F9PMq8MwKD
         SDrr4hz3Wnaileizvsu2uZtJj7IDhUecnL1rG8/I2gqPSlLMllUVe3KRoRaC657Y7WxD
         JebiD2+HeI1gn3T9BL3vzb6O/xjKHrMnLyRXvBnGTOHcMaa+KQXGvXVJOUTqpADNhEet
         1d8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=+1HdToDEQaNJuUnxc0nX0aar6Espog2MQir0SK0s+Wc=;
        b=e1Q3vjTtrFL+BEk+7u38T7XyAY1LpqPAMsASh/pIVrpbe/QZaILvBEeqhnzJF5IccQ
         6lt0e2wG0NBp/evVEUjrHTP/KwCJ6T42OQ8wI6k/8UHAAPIHXRs1tU6MVOuzovxpAA1e
         O64nqQil0BGb9TBT+cZhk21bT1JIC6c8ZgnLeVGOZA+SAO5hckjxYlJYHGNynX2VnLm5
         kOHzNPK8oO1Rpo9rPyPdjetma5M0u8bL4vwgEKNl85eqYBaSdTmkXidsqjo5dRBGByVe
         tki/vVVJUkplxUYqYe2OlN/TdyatgJcD5BJUo7802UQo0O1VNVJqEBfpqXFjZ0+TaUok
         /sOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f196si3016492qka.61.2018.12.05.12.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 12:59:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeGE-0007v8-6z
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 15:59:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFs-0007ql-SZ
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFr-000227-Ss
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47154)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeFr-0001xz-Hk; Wed, 05 Dec 2018 15:58:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B338A30820F3;
	Wed,  5 Dec 2018 20:58:46 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D38885C7C0;
	Wed,  5 Dec 2018 20:58:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:23 -0200
Message-Id: <20181205205827.19387-2-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-1-ehabkost@redhat.com>
References: <20181205205827.19387-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 05 Dec 2018 20:58:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.0 1/5] virt: Eliminate separate
 instance_init functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X90Hw20VBjm2

All instance_init functions for all virt machine-types run
exactly the same code, so we don't need separate functions.  We
only need to set instance_init for TYPE_VIRT_MACHINE.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 87 +++++++++++++--------------------------------------
 1 file changed, 21 insertions(+), 66 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index beaf6bc439..17f1b49d11 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -74,7 +74,6 @@
     static const TypeInfo machvirt_##major##_##minor##_info = { \
         .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
         .parent = TYPE_VIRT_MACHINE, \
-        .instance_init = virt_##major##_##minor##_instance_init, \
         .class_init = virt_##major##_##minor##_class_init, \
     }; \
     static void machvirt_machine_##major##_##minor##_init(void) \
@@ -1778,26 +1777,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
 }
 
-static const TypeInfo virt_machine_info = {
-    .name          = TYPE_VIRT_MACHINE,
-    .parent        = TYPE_MACHINE,
-    .abstract      = true,
-    .instance_size = sizeof(VirtMachineState),
-    .class_size    = sizeof(VirtMachineClass),
-    .class_init    = virt_machine_class_init,
-    .interfaces = (InterfaceInfo[]) {
-         { TYPE_HOTPLUG_HANDLER },
-         { }
-    },
-};
-
-static void machvirt_machine_init(void)
-{
-    type_register_static(&virt_machine_info);
-}
-type_init(machvirt_machine_init);
-
-static void virt_4_0_instance_init(Object *obj)
+static void virt_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1867,6 +1847,26 @@ static void virt_4_0_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static const TypeInfo virt_machine_info = {
+    .name          = TYPE_VIRT_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .abstract      = true,
+    .instance_size = sizeof(VirtMachineState),
+    .class_size    = sizeof(VirtMachineClass),
+    .class_init    = virt_machine_class_init,
+	.instance_init = virt_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
+};
+
+static void machvirt_machine_init(void)
+{
+    type_register_static(&virt_machine_info);
+}
+type_init(machvirt_machine_init);
+
 static void virt_machine_4_0_options(MachineClass *mc)
 {
 }
@@ -1875,11 +1875,6 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 0)
 #define VIRT_COMPAT_3_1 \
     HW_COMPAT_3_1
 
-static void virt_3_1_instance_init(Object *obj)
-{
-    virt_4_0_instance_init(obj);
-}
-
 static void virt_machine_3_1_options(MachineClass *mc)
 {
     virt_machine_4_0_options(mc);
@@ -1890,11 +1885,6 @@ DEFINE_VIRT_MACHINE(3, 1)
 #define VIRT_COMPAT_3_0 \
     HW_COMPAT_3_0
 
-static void virt_3_0_instance_init(Object *obj)
-{
-    virt_3_1_instance_init(obj);
-}
-
 static void virt_machine_3_0_options(MachineClass *mc)
 {
     virt_machine_3_1_options(mc);
@@ -1905,11 +1895,6 @@ DEFINE_VIRT_MACHINE(3, 0)
 #define VIRT_COMPAT_2_12 \
     HW_COMPAT_2_12
 
-static void virt_2_12_instance_init(Object *obj)
-{
-    virt_3_0_instance_init(obj);
-}
-
 static void virt_machine_2_12_options(MachineClass *mc)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
@@ -1924,11 +1909,6 @@ DEFINE_VIRT_MACHINE(2, 12)
 #define VIRT_COMPAT_2_11 \
     HW_COMPAT_2_11
 
-static void virt_2_11_instance_init(Object *obj)
-{
-    virt_2_12_instance_init(obj);
-}
-
 static void virt_machine_2_11_options(MachineClass *mc)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
@@ -1942,11 +1922,6 @@ DEFINE_VIRT_MACHINE(2, 11)
 #define VIRT_COMPAT_2_10 \
     HW_COMPAT_2_10
 
-static void virt_2_10_instance_init(Object *obj)
-{
-    virt_2_11_instance_init(obj);
-}
-
 static void virt_machine_2_10_options(MachineClass *mc)
 {
     virt_machine_2_11_options(mc);
@@ -1959,11 +1934,6 @@ DEFINE_VIRT_MACHINE(2, 10)
 #define VIRT_COMPAT_2_9 \
     HW_COMPAT_2_9
 
-static void virt_2_9_instance_init(Object *obj)
-{
-    virt_2_10_instance_init(obj);
-}
-
 static void virt_machine_2_9_options(MachineClass *mc)
 {
     virt_machine_2_10_options(mc);
@@ -1974,11 +1944,6 @@ DEFINE_VIRT_MACHINE(2, 9)
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
 
-static void virt_2_8_instance_init(Object *obj)
-{
-    virt_2_9_instance_init(obj);
-}
-
 static void virt_machine_2_8_options(MachineClass *mc)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
@@ -1995,11 +1960,6 @@ DEFINE_VIRT_MACHINE(2, 8)
 #define VIRT_COMPAT_2_7 \
     HW_COMPAT_2_7
 
-static void virt_2_7_instance_init(Object *obj)
-{
-    virt_2_8_instance_init(obj);
-}
-
 static void virt_machine_2_7_options(MachineClass *mc)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
@@ -2016,11 +1976,6 @@ DEFINE_VIRT_MACHINE(2, 7)
 #define VIRT_COMPAT_2_6 \
     HW_COMPAT_2_6
 
-static void virt_2_6_instance_init(Object *obj)
-{
-    virt_2_7_instance_init(obj);
-}
-
 static void virt_machine_2_6_options(MachineClass *mc)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-- 
2.18.0.rc1.1.g3f1ff2140

