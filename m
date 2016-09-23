Received: by 10.80.163.71 with SMTP id 65csp319372edn;
        Fri, 23 Sep 2016 01:56:06 -0700 (PDT)
X-Received: by 10.55.108.6 with SMTP id h6mr6073123qkc.289.1474620966822;
        Fri, 23 Sep 2016 01:56:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 91si4433456qkz.220.2016.09.23.01.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnMH8-0004Kb-6J
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:56:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9U-0008Mv-TR
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9Q-0000Tb-4E
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:44:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bnL9P-0000TT-Tm; Fri, 23 Sep 2016 03:44:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F10872D04;
	Fri, 23 Sep 2016 07:44:03 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-207.ams2.redhat.com
	[10.36.6.207])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N7hled032551; Fri, 23 Sep 2016 03:43:59 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri, 23 Sep 2016 09:43:32 +0200
Message-Id: <1474616617-366-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 23 Sep 2016 07:44:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 3/8] target-arm: move gicv3_class_name from
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
X-TUID: pIC8NH2eicxZ

Machine.c contains code related to migration. Let's move
gicv3_class_name to kvm_arm.h instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v5 -> v6:
- add Peter's R-b

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

