Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3786632wrp;
        Tue, 24 Sep 2019 04:31:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKHsj8hWMRH9/WIwnMn3bAR5ehG8AJ9EILJDSyxzkc/eRZAOXrgUfmEBEwnC7tFt5lak1t
X-Received: by 2002:a6b:7b01:: with SMTP id l1mr559519iop.292.1569324694628;
        Tue, 24 Sep 2019 04:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324694; cv=none;
        d=google.com; s=arc-20160816;
        b=wL3ShliZzjlFk2FzwMc0Boa++AXQHxNb9c0dpG+Hp79LFR/RxNL7+BLHxUX7T1B+ml
         yPyadevBtIzAkFx4qbI9ufjyiOxlPV+/+ZVITCK8Ab+/SKjAZHMZYZTC0aqwI1qEf+Ei
         IkDq7JG3InuWDW1385jfYkvHqCnYRHMxsFwu1jPCUxd6QW5oY4mysPwechJucFccEItr
         KqWmT+1zKp3BlQeOZK21mGJRTkQtwf4u+RSOPoZOxVLddg31hhvQ846KztMjN1Z5bbu+
         NPmtLDT0kIQfp7GKJEx+uMqKjO0e+JkTz4xNoKIo7hzfA9GnrYrKM+w+Q3Ewa8shcoJp
         R3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=B95xfQTPOxvRQ3gzn+E4HpjOIAUux+T6X4OmoaSrOrA=;
        b=TSg/8NCISjYDTBXwHCcXf5AMfHftpHqsZPGwwRA6ZyBVZkZw1Ph7nQLG3k++zDlCUU
         LfobInaG1pcf+qErKTBj9+1gRgWcXApVrHdZzaCUewlxZymYjs8PB2+rOBKe4XiEZ7t9
         avFmYIP2Dh4IxUCjgCoctvIln3ZbAak+yxowB5xKl/iUsnqCcUtpigu5yUUl5t/iCm+9
         lOTzxga12F5kAS5hyZu5ZNEIeCW1xPwQy3y3zTsaL4eoZ18mMO8IPYVk4RvSjoA2jjxk
         O8ks3GQrGznu4V8zDuTLhLiRj7bMJOqy7ar/5jSG6ZDyHo6NS8b+r4/cj09rGz6b3ETB
         CAPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h205si1766463iof.63.2019.09.24.04.31.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:31:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE3798830A;
	Tue, 24 Sep 2019 11:31:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B72661F21;
	Tue, 24 Sep 2019 11:31:29 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 7/9] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Tue, 24 Sep 2019 13:31:03 +0200
Message-Id: <20190924113105.19076-8-drjones@redhat.com>
In-Reply-To: <20190924113105.19076-1-drjones@redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 24 Sep 2019 11:31:33 +0000 (UTC)
X-TUID: vTnwG6lZdyg8

kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
parameter. Rather than just using it as an output parameter to
pass back the preferred target, use it also as an input parameter,
allowing a caller to pass a selected target if they wish and to
also pass cpu features. If the caller doesn't want to select a
target they can pass -1 for the target which indicates they want
to use the preferred target and have it passed back like before.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm.c   | 20 +++++++++++++++-----
 target/arm/kvm32.c |  6 +++++-
 target/arm/kvm64.c |  6 +++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 72569f71236e..7a540d9591f9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -66,7 +66,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
-    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
+    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
 
     kvmfd = qemu_open("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -86,7 +86,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         goto finish;
     }
 
-    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
+    if (init->target == -1) {
+        struct kvm_vcpu_init preferred;
+
+        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
+        if (!ret) {
+            init->target = preferred.target;
+        }
+    }
     if (ret >= 0) {
         ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
         if (ret < 0) {
@@ -98,10 +105,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
          * creating one kind of guest CPU which is its preferred
          * CPU type.
          */
+        struct kvm_vcpu_init try;
+
         while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
-            init->target = *cpus_to_try++;
-            memset(init->features, 0, sizeof(init->features));
-            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
+            try.target = *cpus_to_try++;
+            memcpy(try.features, init->features, sizeof(init->features));
+            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
             if (ret >= 0) {
                 break;
             }
@@ -109,6 +118,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         if (ret < 0) {
             goto err;
         }
+        init->target = try.target;
     } else {
         /* Treat a NULL cpus_to_try argument the same as an empty
          * list, which means we will fail the call since this must
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 2451a2d4bbef..32bf8d6757c4 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -53,7 +53,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         QEMU_KVM_ARM_TARGET_CORTEX_A15,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init = { .target = -1, };
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index fc62bab8684e..f96649ae0349 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         KVM_ARM_TARGET_CORTEX_A57,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init = { .target = -1, };
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
-- 
2.20.1
