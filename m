Received: by 10.25.27.66 with SMTP id b63csp2667721lfb;
        Wed, 8 Jun 2016 11:25:15 -0700 (PDT)
X-Received: by 10.237.35.250 with SMTP id k55mr6311131qtc.0.1465410315782;
        Wed, 08 Jun 2016 11:25:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p44si1389486qgd.76.2016.06.08.11.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 11:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAiAF-0003z6-7c
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 14:25:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA6-0003pG-Ul
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAi9z-0008Lw-PA
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAi9z-0008Lk-J9; Wed, 08 Jun 2016 14:24:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A088C049D60;
	Wed,  8 Jun 2016 18:24:59 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u58IOtQm006939; Wed, 8 Jun 2016 14:24:57 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  8 Jun 2016 20:24:47 +0200
Message-Id: <1465410291-2971-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1465410291-2971-1-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Jun 2016 18:24:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/5] hw/arm/virt: separate versioned type-init
 code
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vaMxzozrp4dG

Rename machvirt_info (which is specifically for 2.6 TypeInfo)
to machvirt_2_6_info, and separate the type registration of the
abstract machine type from the versioned type.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8e46137e9be71..a0d35d0826590 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1387,6 +1387,12 @@ static const TypeInfo virt_machine_info = {
     .class_init    = virt_machine_class_init,
 };
 
+static void machvirt_machine_init(void)
+{
+    type_register_static(&virt_machine_info);
+}
+type_init(machvirt_machine_init);
+
 static void virt_2_6_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1428,17 +1434,15 @@ static void virt_2_6_class_init(ObjectClass *oc, void *data)
     mc->alias = "virt";
 }
 
-static const TypeInfo machvirt_info = {
+static const TypeInfo machvirt_2_6_info = {
     .name = MACHINE_TYPE_NAME("virt-2.6"),
     .parent = TYPE_VIRT_MACHINE,
     .instance_init = virt_2_6_instance_init,
     .class_init = virt_2_6_class_init,
 };
 
-static void machvirt_machine_init(void)
+static void machvirt_machine_2_6_init(void)
 {
-    type_register_static(&virt_machine_info);
-    type_register_static(&machvirt_info);
+    type_register_static(&machvirt_2_6_info);
 }
-
-type_init(machvirt_machine_init);
+type_init(machvirt_machine_2_6_init);
-- 
2.4.11

