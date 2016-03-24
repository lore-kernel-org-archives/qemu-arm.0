Received: by 10.25.208.211 with SMTP id h202csp369058lfg;
        Wed, 23 Mar 2016 19:57:34 -0700 (PDT)
X-Received: by 10.55.22.162 with SMTP id 34mr7651040qkw.63.1458788252914;
        Wed, 23 Mar 2016 19:57:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 189si4794986qhy.63.2016.03.23.19.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 19:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aivSm-0003zN-Ho
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 22:57:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRU-0001Wu-OW
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRT-0000w9-U1
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:56:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aivRT-0000w5-Or; Wed, 23 Mar 2016 22:56:11 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B64F7F6D0;
	Thu, 24 Mar 2016 02:56:11 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2O2tlUK013405; Wed, 23 Mar 2016 22:56:06 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 10:55:41 +0800
Message-Id: <1458788142-17509-4-git-send-email-peterx@redhat.com>
In-Reply-To: <1458788142-17509-1-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [PATCH v7 3/4] kvm: add kvm_device_supported() helper
	function
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
X-TUID: KAX/st3Ch+Sv

This can be used when probing whether KVM support specific device. Here,
a raw vmfd is used.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/sysemu/kvm.h |  9 +++++++++
 kvm-all.c            | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6695fa7..0e18f15 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
  */
 int kvm_create_device(KVMState *s, uint64_t type, bool test);
 
+/**
+ * kvm_device_supported - probe whether KVM supports specific device
+ *
+ * @vmfd: The fd handler for VM
+ * @type: type of device
+ *
+ * @return: true if supported, otherwise false.
+ */
+bool kvm_device_supported(int vmfd, uint64_t type);
 
 /* Arch specific hooks */
 
diff --git a/kvm-all.c b/kvm-all.c
index 44c0464..e7b66df 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2339,6 +2339,21 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test)
     return test ? 0 : create_dev.fd;
 }
 
+bool kvm_device_supported(int vmfd, uint64_t type)
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

