Received: by 10.25.21.96 with SMTP id l93csp754297lfi;
        Wed, 6 Jul 2016 02:49:17 -0700 (PDT)
X-Received: by 10.55.170.147 with SMTP id t141mr29714742qke.100.1467798557122;
        Wed, 06 Jul 2016 02:49:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h190si1844685qkc.51.2016.07.06.02.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 02:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKjSG-0003oI-Fd
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 05:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPg-0000Ot-UB
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 05:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPg-00072o-2Q
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 05:46:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bKjPd-00070I-5K; Wed, 06 Jul 2016 05:46:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A620A3F725;
	Wed,  6 Jul 2016 09:46:32 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-81.ams2.redhat.com
	[10.36.6.81])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u669kPEH013861; Wed, 6 Jul 2016 05:46:30 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Wed,  6 Jul 2016 11:46:00 +0200
Message-Id: <1467798364-9049-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Jul 2016 09:46:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 2/6] target-arm: move gicv3_class_name from
 machine to kvm_arm.h
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
Cc: diana.craciun@freescale.com, shlomopongratz@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4L5mRDl/Hkct

Machine.c contains code related to migration. Let's move
gicv3_class_name to kvm_arm.h instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>

---

v4: creation
---
 target-arm/kvm_arm.h | 16 +++++++++++++++-
 target-arm/machine.c | 16 ----------------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 544e404..4fb6d15 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -223,7 +223,21 @@ static inline const char *gic_class_name(void)
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
+#endif
+    } else {
+        return "arm-gicv3";
+    }
+
+    exit(1);
+}
 
 /**
  * kvm_arm_handle_debug:
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 2dbeb82..d90943b 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -331,19 +331,3 @@ const VMStateDescription vmstate_arm_cpu = {
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
-#endif
-    } else {
-        return "arm-gicv3";
-    }
-
-    exit(1);
-}
-- 
2.5.5

