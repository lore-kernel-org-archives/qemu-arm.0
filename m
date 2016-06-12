Received: by 10.25.85.209 with SMTP id j200csp826293lfb;
        Sun, 12 Jun 2016 08:52:06 -0700 (PDT)
X-Received: by 10.140.230.200 with SMTP id a191mr9069170qhc.11.1465746723559;
        Sun, 12 Jun 2016 08:52:03 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h3si10240796qkf.92.2016.06.12.08.52.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jun 2016 08:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5AB4E8B1C;
	Sun, 12 Jun 2016 15:52:02 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5CFpu6X014651;
	Sun, 12 Jun 2016 11:52:01 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, wei@redhat.com
Subject: [PATCH v2 2/4] hw/arm/virt: introduce DEFINE_VIRT_MACHINE
Date: Sun, 12 Jun 2016 17:51:51 +0200
Message-Id: <1465746713-30414-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1465746713-30414-1-git-send-email-drjones@redhat.com>
References: <1465746713-30414-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sun, 12 Jun 2016 15:52:02 +0000 (UTC)
X-TUID: N9CpdrSRYEt1

Use DEFINE_VIRT_MACHINE to generate versioned machine type info.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57eb7fef251bd..054c31006aa2a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -98,6 +98,28 @@ typedef struct {
 #define VIRT_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
+
+#define DEFINE_VIRT_MACHINE(major, minor) \
+    static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
+                                                    void *data) \
+    { \
+        MachineClass *mc = MACHINE_CLASS(oc); \
+        virt_machine_##major##_##minor##_options(mc); \
+        mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+    } \
+    static const TypeInfo machvirt_##major##_##minor##_info = { \
+        .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
+        .parent = TYPE_VIRT_MACHINE, \
+        .instance_init = virt_##major##_##minor##_instance_init, \
+        .class_init = virt_##major##_##minor##_class_init, \
+    }; \
+    static void machvirt_machine_##major##_##minor##_init(void) \
+    { \
+        type_register_static(&machvirt_##major##_##minor##_info); \
+    } \
+    type_init(machvirt_machine_##major##_##minor##_init);
+
+
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
  * address space unallocated and free for future use between 256G and 512G.
@@ -1426,23 +1448,8 @@ static void virt_2_6_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
-static void virt_2_6_class_init(ObjectClass *oc, void *data)
+static void virt_machine_2_6_options(MachineClass *mc)
 {
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "QEMU 2.6 ARM Virtual Machine";
     mc->alias = "virt";
 }
-
-static const TypeInfo machvirt_2_6_info = {
-    .name = MACHINE_TYPE_NAME("virt-2.6"),
-    .parent = TYPE_VIRT_MACHINE,
-    .instance_init = virt_2_6_instance_init,
-    .class_init = virt_2_6_class_init,
-};
-
-static void machvirt_machine_2_6_init(void)
-{
-    type_register_static(&machvirt_2_6_info);
-}
-type_init(machvirt_machine_2_6_init);
+DEFINE_VIRT_MACHINE(2, 6)
-- 
2.4.11
