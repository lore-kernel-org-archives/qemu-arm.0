Received: by 10.25.208.211 with SMTP id h202csp2263660lfg;
        Tue, 22 Mar 2016 22:33:07 -0700 (PDT)
X-Received: by 10.140.93.44 with SMTP id c41mr964554qge.74.1458711186895;
        Tue, 22 Mar 2016 22:33:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si815409qgd.43.2016.03.22.22.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibPm-0003J0-Cb
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:33:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPj-0003Ef-3z
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPi-0001Hl-5K
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:33:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibPh-0001Hb-Vj; Wed, 23 Mar 2016 01:33:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B733461D6;
	Wed, 23 Mar 2016 05:33:01 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (dhcp-14-238.nay.redhat.com
	[10.66.14.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5WeSG011002; Wed, 23 Mar 2016 01:32:56 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 13:32:31 +0800
Message-Id: <1458711153-15988-3-git-send-email-peterx@redhat.com>
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v6 2/4] arm: enhance
	kvm_arm_create_scratch_host_vcpu
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
X-TUID: pi3lcRebH+yh

Some more lines to make sure we allow NULL for 1st/3rd parameter.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/kvm.c     | 10 +++++++++-
 target-arm/kvm_arm.h |  6 ++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index 969ab0b..0a7f9a6 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -62,13 +62,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         goto err;
     }
 
+    if (!init) {
+        goto finish;
+    }
+
     ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
     if (ret >= 0) {
         ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
         if (ret < 0) {
             goto err;
         }
-    } else {
+    } else if (cpus_to_try) {
         /* Old kernel which doesn't know about the
          * PREFERRED_TARGET ioctl: we know it will only support
          * creating one kind of guest CPU which is its preferred
@@ -85,8 +89,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         if (ret < 0) {
             goto err;
         }
+    } else {
+        /* Not providing cpus_to_try, do nothing. */
+        ;
     }
 
+finish:
     fdarray[0] = kvmfd;
     fdarray[1] = vmfd;
     fdarray[2] = cpufd;
diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 07f0c72..6bcfe6c 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -124,9 +124,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
  * kvm_arm_create_scratch_host_vcpu:
  * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
  * QEMU_KVM_ARM_TARGET_NONE) to try as fallback if the kernel does not
- * know the PREFERRED_TARGET ioctl
+ * know the PREFERRED_TARGET ioctl. If NULL is provided, will try
+ * nothing.
  * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
- * @init: filled in with the necessary values for creating a host vcpu
+ * @init: filled in with the necessary values for creating a host
+ * vcpu. If NULL is provided, will not init the vCPU.
  *
  * Create a scratch vcpu in its own VM of the type preferred by the host
  * kernel (as would be used for '-cpu host'), for purposes of probing it
-- 
2.4.3

