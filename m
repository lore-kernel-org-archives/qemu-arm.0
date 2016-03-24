Received: by 10.25.208.211 with SMTP id h202csp368825lfg;
        Wed, 23 Mar 2016 19:56:47 -0700 (PDT)
X-Received: by 10.140.128.21 with SMTP id 21mr8133023qha.59.1458788207702;
        Wed, 23 Mar 2016 19:56:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si4786748qhv.74.2016.03.23.19.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 19:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aivS3-0002KM-AI
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 22:56:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRR-0001Pr-Fo
	for qemu-devel@nongnu.org; Wed, 23 Mar 2016 22:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRQ-0000vN-H7
	for qemu-devel@nongnu.org; Wed, 23 Mar 2016 22:56:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aivRO-0000v3-Fs; Wed, 23 Mar 2016 22:56:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 04F87C049D5C;
	Thu, 24 Mar 2016 02:56:06 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2O2tlUJ013405; Wed, 23 Mar 2016 22:55:59 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 10:55:40 +0800
Message-Id: <1458788142-17509-3-git-send-email-peterx@redhat.com>
In-Reply-To: <1458788142-17509-1-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, libvir-list@redhat.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, serge.fdrv@gmail.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [PATCH v7 2/4] arm: enhance
	kvm_arm_create_scratch_host_vcpu
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
X-TUID: AUQvhS0voZlg

Some more lines to make sure we allow NULL for 1st/3rd parameter.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/kvm.c     | 14 +++++++++++++-
 target-arm/kvm_arm.h |  6 ++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index 969ab0b..bb6935e 100644
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
@@ -85,8 +89,16 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         if (ret < 0) {
             goto err;
         }
+    } else {
+        /*
+         * Here, we got init != NULL but cpus_to_retry == NULL,
+         * meanwhile, we failed to probe one preferred target type
+         * (no matter what). So we fail.
+         */
+        goto err;
     }
 
+finish:
     fdarray[0] = kvmfd;
     fdarray[1] = vmfd;
     fdarray[2] = cpufd;
diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 07f0c72..4f01a99 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -124,9 +124,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
  * kvm_arm_create_scratch_host_vcpu:
  * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
  * QEMU_KVM_ARM_TARGET_NONE) to try as fallback if the kernel does not
- * know the PREFERRED_TARGET ioctl
+ * know the PREFERRED_TARGET ioctl. If NULL is provided, will try
+ * to use perferred target, and fail if no preferred found.
  * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
- * @init: filled in with the necessary values for creating a host vcpu
+ * @init: filled in with the necessary values for creating a host
+ * vcpu. If NULL is provided, will not init the vCPU.
  *
  * Create a scratch vcpu in its own VM of the type preferred by the host
  * kernel (as would be used for '-cpu host'), for purposes of probing it
-- 
2.4.3

