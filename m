Received: by 10.25.85.209 with SMTP id j200csp826276lfb;
        Sun, 12 Jun 2016 08:52:03 -0700 (PDT)
X-Received: by 10.200.47.212 with SMTP id m20mr10593426qta.53.1465746721843;
        Sun, 12 Jun 2016 08:52:01 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s189si12412391qhs.103.2016.06.12.08.52.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jun 2016 08:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 109F4C0ED3EE;
	Sun, 12 Jun 2016 15:52:01 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5CFpu6W014651;
	Sun, 12 Jun 2016 11:51:59 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, wei@redhat.com
Subject: [PATCH v2 1/4] hw/arm/virt: separate versioned type-init code
Date: Sun, 12 Jun 2016 17:51:50 +0200
Message-Id: <1465746713-30414-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1465746713-30414-1-git-send-email-drjones@redhat.com>
References: <1465746713-30414-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sun, 12 Jun 2016 15:52:01 +0000 (UTC)
X-TUID: /CUYAZWb4mJO

Rename machvirt_info (which is specifically for 2.6 TypeInfo)
to machvirt_2_6_info, and separate the type registration of the
abstract machine type from the versioned type.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73113cfc4d9c9..57eb7fef251bd 100644
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
