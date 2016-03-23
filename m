Received: by 10.25.208.211 with SMTP id h202csp2263965lfg;
        Tue, 22 Mar 2016 22:34:02 -0700 (PDT)
X-Received: by 10.140.179.134 with SMTP id z128mr1045167qhz.40.1458711242603;
        Tue, 22 Mar 2016 22:34:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 101si828918qgh.16.2016.03.22.22.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibQg-0004nB-1Y
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:34:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPu-0003ci-Th
	for qemu-devel@nongnu.org; Wed, 23 Mar 2016 01:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPu-0001PO-4P
	for qemu-devel@nongnu.org; Wed, 23 Mar 2016 01:33:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibPq-0001Mf-1H; Wed, 23 Mar 2016 01:33:10 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A8BEB46A;
	Wed, 23 Mar 2016 05:33:09 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (dhcp-14-238.nay.redhat.com
	[10.66.14.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5WeSH011002; Wed, 23 Mar 2016 01:33:02 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 13:32:32 +0800
Message-Id: <1458711153-15988-4-git-send-email-peterx@redhat.com>
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, libvir-list@redhat.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v6 3/4] kvm: add kvm_support_device() helper
	function
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
X-TUID: pwkC5URHtF1K

This can be used when probing whether KVM support specific device. Here,
a raw vmfd is used.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/sysemu/kvm.h |  9 +++++++++
 kvm-all.c            | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6695fa7..8738fa1 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
  */
 int kvm_create_device(KVMState *s, uint64_t type, bool test);
 
+/**
+ * kvm_support_device - probe whether KVM support specific device
+ *
+ * @vmfd: The fd handler for VM
+ * @type: type of device
+ *
+ * @return: true if supported, otherwise false.
+ */
+bool kvm_support_device(int vmfd, uint64_t type);
 
 /* Arch specific hooks */
 
diff --git a/kvm-all.c b/kvm-all.c
index 44c0464..77deccc 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2339,6 +2339,21 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test)
     return test ? 0 : create_dev.fd;
 }
 
+bool kvm_support_device(int vmfd, uint64_t type)
+{
+    struct kvm_create_device create_dev = {
+        .type = type,
+        .fd = -1,
+        .flags = KVM_CREATE_DEVICE_TEST,
+    };
+
+    if (ioctl(vmfd, KVM_CHECK_EXTENSION, KVM_CAP_DEVICE_CTRL) <= 0) {
+        return false;
+    }
+
+    return (ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev) >= 0);
+}
+
 int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source)
 {
     struct kvm_one_reg reg;
-- 
2.4.3

