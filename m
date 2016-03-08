Received: by 10.25.208.211 with SMTP id h202csp1783250lfg;
        Mon, 7 Mar 2016 23:37:53 -0800 (PST)
X-Received: by 10.140.162.213 with SMTP id i204mr20394568qhi.85.1457422673194;
        Mon, 07 Mar 2016 23:37:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si1827464qgj.71.2016.03.07.23.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 23:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adCDI-0007Ld-Mn
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 02:37:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCCh-0006TB-1f
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 02:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCCd-0005WM-1I
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 02:37:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1adCCX-0005Vg-KS; Tue, 08 Mar 2016 02:37:05 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 424C4C0005D0;
	Tue,  8 Mar 2016 07:37:05 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-232.pek2.redhat.com [10.72.5.232])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u287aSmI024053; Tue, 8 Mar 2016 02:36:57 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Mar 2016 15:36:22 +0800
Message-Id: <1457422582-28799-4-git-send-email-peterx@redhat.com>
In-Reply-To: <1457422582-28799-1-git-send-email-peterx@redhat.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v4 3/3] arm: implement query-gic-capabilities
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
X-TUID: T4rjrn3oL9e1

For emulated GIC capabilities, currently only gicv2 is supported. We
need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
VM, we detect the capability bits using ioctls.

When probing the KVM capabilities, we cannot leverage existing helper
functions like kvm_create_device() since QEMU might be using TCG while
probing (actually this is the case for libvirt probing). So, one
temporary VM is created to do the probing.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/machine.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 813909e..8f52f74 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -1,3 +1,5 @@
+#include <linux/kvm.h>
+#include <sys/ioctl.h>
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/boards.h"
@@ -347,7 +349,97 @@ const char *gicv3_class_name(void)
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
+#ifdef CONFIG_KVM
+/* Test whether KVM support specific device. */
+static inline int kvm_support_device(int vmfd, uint64_t type)
+{
+    struct kvm_create_device create_dev = {
+        .type = type,
+        .fd = -1,
+        .flags = KVM_CREATE_DEVICE_TEST,
+    };
+    return ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev);
+}
+#endif
+
 GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 {
-    return NULL;
+    GICCapabilityList *head = NULL;
+    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
+
+    v2->emulated = true;
+    /* FIXME: we'd change to true after we get emulated GICv3. */
+    v3->emulated = false;
+
+#ifdef CONFIG_KVM
+    {
+        int kvm_fd = -1;
+        int vmfd = -1;
+        /*
+         * HACK: here we create one temporary VM, do the probing,
+         * then release it properly.
+         */
+        kvm_fd = qemu_open("/dev/kvm", O_RDWR);
+        if (kvm_fd == -1) {
+            /* KVM may not enabled on host, which is fine. */
+            goto out;
+        }
+
+        do {
+            /* For ARM, VM type could only be zero now. */
+            vmfd = ioctl(kvm_fd, KVM_CREATE_VM, 0);
+        } while (vmfd == -EINTR);
+
+        if (vmfd < 0) {
+            goto kvm_fd_close;
+        }
+
+        if (ioctl(kvm_fd, KVM_CHECK_EXTENSION,
+                  KVM_CAP_DEVICE_CTRL) <= 0) {
+            /* older version of KVM possibly */
+            goto kvm_vmfd_close;
+        }
+
+        /* Test KVM GICv2 */
+        if (kvm_support_device(vmfd, KVM_DEV_TYPE_ARM_VGIC_V2) >= 0) {
+            v2->kernel = true;
+        }
+
+        /* Test KVM GICv3 */
+        if (kvm_support_device(vmfd, KVM_DEV_TYPE_ARM_VGIC_V3) >= 0) {
+            v3->kernel = true;
+        }
+
+kvm_vmfd_close:
+        close(vmfd);
+kvm_fd_close:
+        close(kvm_fd);
+out:
+        ;
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

