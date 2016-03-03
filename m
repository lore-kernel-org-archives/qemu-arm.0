Received: by 10.25.208.211 with SMTP id h202csp2571532lfg;
        Thu, 3 Mar 2016 00:23:22 -0800 (PST)
X-Received: by 10.140.168.85 with SMTP id o82mr1571799qho.10.1456993401986;
        Thu, 03 Mar 2016 00:23:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si40131423qgh.64.2016.03.03.00.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 00:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abOXZ-0003pA-GF
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 03:23:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOWM-00022A-HA
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOWL-0001qC-NO
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:22:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abOWH-0001pQ-57; Thu, 03 Mar 2016 03:22:01 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CB6941F564;
	Thu,  3 Mar 2016 08:22:00 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-147.pek2.redhat.com [10.72.5.147])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u238LKKi010446; Thu, 3 Mar 2016 03:21:52 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 Mar 2016 16:21:12 +0800
Message-Id: <1456993272-32292-4-git-send-email-peterx@redhat.com>
In-Reply-To: <1456993272-32292-1-git-send-email-peterx@redhat.com>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	Peter Xu <peterx@redhat.com>, abologna@redhat.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v2 3/3] arm: implement query-gic-capability
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jf+DV4wHH+XR

For emulated ARM VM, only gicv2 is supported. We need to add gicv3 in
when emulated gicv3 ready. For KVM accelerated ARM VM, we detect the
capability bits using ioctls.

if we want to know GIC kernel capabilities, we need to make sure we have
enabled KVM when querying (like, with "-enable-kvm").

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/machine.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index b3fa64c..98a4094 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -1,3 +1,4 @@
+#include <linux/kvm.h>
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/boards.h"
@@ -346,9 +347,54 @@ const char *gicv3_class_name(void)
     exit(1);
 }
 
+static GICCapability *gic_cap_new(int version)
+{
+    GICCapability *cap = g_new0(GICCapability, 1);
+    cap->version = version;
+    /* by default, support none */
+    cap->emulated = false;
+    cap->kernel = false;
+    return cap;
+}
+
+static GICCapabilityList *gic_cap_list_add(GICCapabilityList *head,
+                                           GICCapability *cap)
+{
+    GICCapabilityList *item = g_new0(GICCapabilityList, 1);
+    item->value = cap;
+    item->next = head;
+    return item;
+}
+
 GICCapabilityList *qmp_query_gic_capability(Error **errp);
 
 GICCapabilityList *qmp_query_gic_capability(Error **errp)
 {
-    return NULL;
+    GICCapabilityList *head = NULL;
+    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
+
+    v2->emulated = true;
+    /* FIXME: we'd change to true after we get emulated GICv3 */
+    v3->emulated = false;
+
+#ifdef CONFIG_KVM
+    if (kvm_enabled()) {
+        /* Test KVM GICv2 */
+        if (kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V2,
+                              true) >= 0) {
+            v2->kernel = true;
+        }
+
+        /* Test KVM GICv3 */
+        if (kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3,
+                              true) >= 0) {
+            v3->kernel = true;
+        }
+    }
+#endif
+
+    head = gic_cap_list_add(head, v2);
+    head = gic_cap_list_add(head, v3);
+
+    return head;
 }
-- 
2.4.3

