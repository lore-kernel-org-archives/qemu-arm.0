Received: by 10.25.208.211 with SMTP id h202csp1190292lfg;
        Sun, 6 Mar 2016 20:25:58 -0800 (PST)
X-Received: by 10.55.78.131 with SMTP id c125mr26110607qkb.71.1457324758182;
        Sun, 06 Mar 2016 20:25:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si15160914qhi.95.2016.03.06.20.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 20:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acmk1-0000Zc-Mj
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 23:25:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmiI-0006Zg-GI
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmiH-0005aq-Aa
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:24:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1acmiH-0005am-3E; Sun, 06 Mar 2016 23:24:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id BE9CE63144;
	Mon,  7 Mar 2016 04:24:08 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-200.pek2.redhat.com [10.72.5.200])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u274NYnU001687; Sun, 6 Mar 2016 23:24:01 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 12:23:28 +0800
Message-Id: <1457324608-11434-4-git-send-email-peterx@redhat.com>
In-Reply-To: <1457324608-11434-1-git-send-email-peterx@redhat.com>
References: <1457324608-11434-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 07 Mar 2016 04:24:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v3 3/3] arm: implement query-gic-capability
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3IPDRg1TY/Vh

For emulated GIC capabilities, currently only gicv2 is supported. We
need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
VM, we detect the capability bits using ioctls.

When probing the KVM capabilities, we cannot leverage existing helper
functions like kvm_create_device() since QEMU might be using TCG while
probing (actually this is the case for libvirt probing). So, one
temporary VM is created to do the probing.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/machine.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 60bd5c1..ff50411 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -1,3 +1,5 @@
+#include <linux/kvm.h>
+#include <sys/ioctl.h>
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/boards.h"
@@ -347,7 +349,108 @@ const char *gicv3_class_name(void)
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
+/*
+ * This is merely the same as kvm_create_device(). The only
+ * difference is we are using raw fds rather than KVMState, so that
+ * we can use it even without kvm_state initialized.
+ */
+static int kvm_create_device_fds(int kvm_fd, int vmfd,
+                                 uint64_t type, bool test)
+{
+    int ret;
+    struct kvm_create_device create_dev;
+
+    create_dev.type = type;
+    create_dev.fd = -1;
+    create_dev.flags = test ? KVM_CREATE_DEVICE_TEST : 0;
+
+    if (ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DEVICE_CTRL) <= 0) {
+        return -ENOTSUP;
+    }
+
+    ret = ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev);
+    if (ret) {
+        return ret;
+    }
+
+    return test ? 0 : create_dev.fd;
+}
+#endif
+
 GICCapabilityList *qmp_query_gic_capability(Error **errp)
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
+        /*
+         * HACK: here we create one temporary VM, do the probing,
+         * then release it properly.
+         */
+        int kvm_fd = -1;
+        int vmfd = -1;
+
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
+        /* Test KVM GICv2 */
+        if (kvm_create_device_fds(kvm_fd, vmfd, KVM_DEV_TYPE_ARM_VGIC_V2,
+                                  true) >= 0) {
+            v2->kernel = true;
+        }
+
+        /* Test KVM GICv3 */
+        if (kvm_create_device_fds(kvm_fd, vmfd, KVM_DEV_TYPE_ARM_VGIC_V3,
+                                  true) >= 0) {
+            v3->kernel = true;
+        }
+
+        close(vmfd);
+kvm_fd_close:
+        close(kvm_fd);
+    }
+#endif
+
+out:
+    head = gic_cap_list_add(head, v2);
+    head = gic_cap_list_add(head, v3);
+
+    return head;
 }
-- 
2.4.3

