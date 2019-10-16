Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6858242wrm;
        Wed, 16 Oct 2019 01:54:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT5qQsJuaqf0rkmt69IIpkqzoOho4luHPPbbQG5pSkPb/LP1Mv7TodgQ6xEnzQA0bP+YRX
X-Received: by 2002:a5e:9816:: with SMTP id s22mr14936249ioj.149.1571216076742;
        Wed, 16 Oct 2019 01:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571216076; cv=none;
        d=google.com; s=arc-20160816;
        b=XRlvhu6a9vaSr7i9lEeCe6i7cgkJ2thA0AL7NgjdCda+Cu4RCPvLFPgvICx4FylqoY
         L3j/4HQvxDrH2jj//2m5LexPc7lT0+sSlp5/uQ/E9C+W7ihiGASuluFb1gV+Ri/J9Ysr
         da8r+NYXSAcEJQVij/cgBzBPv93F9VXgBGmNBpLXq83qFytS/L16ba0Ery+lrTGq4Dcl
         S8u6kW+KoDfEcxzravCIPujZDIkmXzoe2X7tXVyRsnToJC09Lk09qystaPlzwkQcaz8d
         /fbBKvmVdCT6xmfIA1vzlP3A7wDXK48vSnJMv9ipkKFtRif9w1k3S09KcXn+ZLnC44fo
         pSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=VxziU0Kvz3wi2p47839a2XOzYf2tJHwMiW9EYpAywMg=;
        b=hBbEX66ma2Q6mIi+AOE6ejBYW9ID+7WrVEzpigUE3yQwOKE5O+SlLpVw3KlsSL6V0M
         MaoyvsL+ekCMZfk/2H6jsdww13r5MryXa7FUyFPR4wiTPjioaHRMXqxZF1DQvhRt//Ef
         UgYLufu0SoM3c0t1ZjqHGl3Tge8NPl0/CdjrqCG6z7nSbZaXkqifntc0N1wOHbZaGDmD
         /1HBO2BDyjPrD1yPyWgnYXceVgowrn1xbJq3HpAFA9LyWEfgxjTuHhY5nhhuDIjcpTc2
         xDtgwaCys7cTabfdeFMy7XQh6fdMJGwKTMDjISh/+7yi0kj9bScB9V3UTyY0sAyw66Qb
         tf7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a17si10494962ilm.20.2019.10.16.01.54.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E278730860DA;
	Wed, 16 Oct 2019 08:54:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C83325D9CD;
	Wed, 16 Oct 2019 08:54:33 +0000 (UTC)
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
Subject: [PATCH v6 7/9] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Wed, 16 Oct 2019 10:54:06 +0200
Message-Id: <20191016085408.24360-8-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-1-drjones@redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 16 Oct 2019 08:54:35 +0000 (UTC)
X-TUID: QvYUXSTga76u

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
index f07332bbda30..5b82cefef608 100644
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
index 850da1b5e6aa..c7ecefbed720 100644
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
2.21.0
