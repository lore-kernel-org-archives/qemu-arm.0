Received: by 10.25.21.156 with SMTP id 28csp336042lfv;
        Tue, 2 Aug 2016 11:07:48 -0700 (PDT)
X-Received: by 10.129.92.6 with SMTP id q6mr42360382ywb.271.1470161268444;
        Tue, 02 Aug 2016 11:07:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z35si477371ybh.112.2016.08.02.11.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 11:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUe6V-0003Te-QL
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 14:07:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6R-0003R2-DL
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6P-0000vR-9M
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bUe6P-0000vG-3N; Tue, 02 Aug 2016 14:07:41 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A613C550B1;
	Tue,  2 Aug 2016 18:07:40 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-58.ams2.redhat.com
	[10.36.7.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72I7UL5024790; Tue, 2 Aug 2016 14:07:37 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Tue,  2 Aug 2016 20:07:22 +0200
Message-Id: <1470161247-10251-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 02 Aug 2016 18:07:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 2/7] target-arm: move gicv3_class_name from
 machine to kvm_arm.h
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w87/FhSay/LW

Machine.c contains code related to migration. Let's move
gicv3_class_name to kvm_arm.h instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>

---

v4 -> v5:
- add #include "qemu/error-report.h"
- rebased on target-arm: Fix unreachable code in gicv3_class_name()

v4: creation

Conflicts:
	target-arm/machine.c
---
 target-arm/kvm_arm.h | 16 +++++++++++++++-
 target-arm/machine.c | 15 ---------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 544e404..633d088 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -13,6 +13,7 @@
 
 #include "sysemu/kvm.h"
 #include "exec/memory.h"
+#include "qemu/error-report.h"
 
 /**
  * kvm_arm_vcpu_init:
@@ -223,7 +224,20 @@ static inline const char *gic_class_name(void)
  *
  * Returns: class name to use
  */
-const char *gicv3_class_name(void);
+static inline const char *gicv3_class_name(void)
+{
+    if (kvm_irqchip_in_kernel()) {
+#ifdef TARGET_AARCH64
+        return "kvm-arm-gicv3";
+#else
+        error_report("KVM GICv3 acceleration is not supported on this "
+                     "platform");
+        exit(1);
+#endif
+    } else {
+        return "arm-gicv3";
+    }
+}
 
 /**
  * kvm_arm_handle_debug:
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 7a6ca31..d90943b 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -331,18 +331,3 @@ const VMStateDescription vmstate_arm_cpu = {
         NULL
     }
 };
-
-const char *gicv3_class_name(void)
-{
-    if (kvm_irqchip_in_kernel()) {
-#ifdef TARGET_AARCH64
-        return "kvm-arm-gicv3";
-#else
-        error_report("KVM GICv3 acceleration is not supported on this "
-                     "platform");
-        exit(1);
-#endif
-    } else {
-        return "arm-gicv3";
-    }
-}
-- 
2.5.5

