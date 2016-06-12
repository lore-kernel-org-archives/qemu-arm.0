Received: by 10.25.85.209 with SMTP id j200csp826323lfb;
        Sun, 12 Jun 2016 08:52:13 -0700 (PDT)
X-Received: by 10.200.48.74 with SMTP id g10mr5951950qte.40.1465746726636;
        Sun, 12 Jun 2016 08:52:06 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m3si12449023qkl.62.2016.06.12.08.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jun 2016 08:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3BD31E27;
	Sun, 12 Jun 2016 15:52:05 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5CFpu6Z014651;
	Sun, 12 Jun 2016 11:52:04 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, wei@redhat.com
Subject: [PATCH v2 4/4] hw/arm/virt: create the 2.7 machine type
Date: Sun, 12 Jun 2016 17:51:53 +0200
Message-Id: <1465746713-30414-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1465746713-30414-1-git-send-email-drjones@redhat.com>
References: <1465746713-30414-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Sun, 12 Jun 2016 15:52:05 +0000 (UTC)
X-TUID: 1tDlAfg9AzV5

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index df88eeb4d2ca0..d266ad7b943e3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/boards.h"
+#include "hw/compat.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/bitops.h"
@@ -1423,7 +1424,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_6_instance_init(Object *obj)
+static void virt_2_7_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1456,7 +1457,22 @@ static void virt_2_6_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
+static void virt_machine_2_7_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
+
+#define VIRT_COMPAT_2_6 \
+    HW_COMPAT_2_6
+
+static void virt_2_6_instance_init(Object *obj)
+{
+    virt_2_7_instance_init(obj);
+}
+
 static void virt_machine_2_6_options(MachineClass *mc)
 {
+    virt_machine_2_7_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
+DEFINE_VIRT_MACHINE(2, 6)
-- 
2.4.11
