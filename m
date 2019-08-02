Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782609wrv;
        Fri, 2 Aug 2019 05:26:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywH9TjLZeMT4PTYRavJSQwYuRWbclVDll0/zjjM2j08HHo3LyazCjMulr2DFvKHbxd64ZK
X-Received: by 2002:ad4:5283:: with SMTP id v3mr96994200qvr.207.1564748801914;
        Fri, 02 Aug 2019 05:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748801; cv=none;
        d=google.com; s=arc-20160816;
        b=Boevb2v2xm/KT0lNaM3sgkVQmahshzQ52lTYxTB2m2ZyrZTLIeca7DHMxmKwXl5DlH
         rnGpuXhKh9TeY0Ev9zXsLdvQLcoZ1adVxMOo3shhu9C6ZM4TkmPU0pCyyH8SIpVVUtvU
         tOQ6V153yYiKwwzL2hnppu7sIG/D0/WuQdRiqcqUG6QHje18dQXjumBSTTeUBcwbAHtB
         9jfKPjlC/4eNaQp0yKz1pqLcapUb23nrKzrn9Y4Hcp1ECf+4MGwsJjZYiAzkGqBxVZtR
         v2KZZZo3csWRSEYhnmGAqjMlES0L7VbZ5VHQYSrDzm8dD7k2ojNPN41cVUTlkNgFubSe
         R0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=945jIeWsBSKlco1a+/r9wbLkKKznPp6GILmrgoPYL8Q=;
        b=gUrriFVDzygi01XKeNszl6cXAIUvKEtfDshTZYeph3F6RUiTi29q4xMounW4fCRf21
         oMll+5/2S86An2mXuDNYOigo539q5xtXnbxnWdqoHaO2Q1DTTT3wQbP19YYCnGyUkXEv
         y+nwbWMefg4d+lOZjKk7H9h45JWyVrTmb2Zcyh74noNYu1lVx1vBk9+Ui9TDH4cgvEXq
         fNS+Yzuw1Nu6lqTMxz15h43hXmcR2kor6UTRRH/SANMFbYbxGv20ShB/yji5IJay9Yzx
         0o1y4ppq+I3aGvO5NbWgg6YvJIvSXosK00fJZ4ymmBELAPN2YC1m2gFa8JINmyZPCJTB
         2CIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c20si36919992qkm.334.2019.08.02.05.26.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F20F0A13E4;
	Fri,  2 Aug 2019 12:26:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8325C219;
	Fri,  2 Aug 2019 12:26:36 +0000 (UTC)
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
Subject: [PATCH v3 13/15] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Fri,  2 Aug 2019 14:25:38 +0200
Message-Id: <20190802122540.26385-14-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 02 Aug 2019 12:26:41 +0000 (UTC)
X-TUID: msQoV3osqc1p

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
index ce4e362b3476..4bf6664a2d63 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -64,7 +64,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
-    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
+    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
 
     kvmfd = qemu_open("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -84,7 +84,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
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
@@ -96,10 +103,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
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
@@ -107,6 +116,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         if (ret < 0) {
             goto err;
         }
+        init->target = try.target;
     } else {
         /* Treat a NULL cpus_to_try argument the same as an empty
          * list, which means we will fail the call since this must
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 51f78f722b18..d007f6bd34d7 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -54,7 +54,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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
index a6871017d375..48adfc16b3d7 100644
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
