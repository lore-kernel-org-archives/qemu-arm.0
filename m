Received: by 10.25.85.209 with SMTP id j200csp826307lfb;
        Sun, 12 Jun 2016 08:52:09 -0700 (PDT)
X-Received: by 10.55.20.208 with SMTP id 77mr10700780qku.124.1465746725257;
        Sun, 12 Jun 2016 08:52:05 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c187si12453476qkg.13.2016.06.12.08.52.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jun 2016 08:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F72BC0ED3EE;
	Sun, 12 Jun 2016 15:52:04 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5CFpu6Y014651;
	Sun, 12 Jun 2016 11:52:02 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, wei@redhat.com
Subject: [PATCH v2 3/4] hw/arm/virt: introduce DEFINE_VIRT_MACHINE_AS_LATEST
Date: Sun, 12 Jun 2016 17:51:52 +0200
Message-Id: <1465746713-30414-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1465746713-30414-1-git-send-email-drjones@redhat.com>
References: <1465746713-30414-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sun, 12 Jun 2016 15:52:04 +0000 (UTC)
X-TUID: PhzqpwIBCXQC

Create two variants of DEFINE_VIRT_MACHINE. One, just called
DEFINE_VIRT_MACHINE, that does not set properties that only
the latest machine type should have, and another that does.
This will hopefully reduce potential for errors when adding
new versions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 054c31006aa2a..df88eeb4d2ca0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -99,13 +99,16 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
 
-#define DEFINE_VIRT_MACHINE(major, minor) \
+#define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
                                                     void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
         virt_machine_##major##_##minor##_options(mc); \
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+        if (latest) { \
+            mc->alias = "virt"; \
+        } \
     } \
     static const TypeInfo machvirt_##major##_##minor##_info = { \
         .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
@@ -119,6 +122,11 @@ typedef struct {
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+#define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
+    DEFINE_VIRT_MACHINE_LATEST(major, minor, true)
+#define DEFINE_VIRT_MACHINE(major, minor) \
+    DEFINE_VIRT_MACHINE_LATEST(major, minor, false)
+
 
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
@@ -1450,6 +1458,5 @@ static void virt_2_6_instance_init(Object *obj)
 
 static void virt_machine_2_6_options(MachineClass *mc)
 {
-    mc->alias = "virt";
 }
-DEFINE_VIRT_MACHINE(2, 6)
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
-- 
2.4.11
