Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849593wrg;
        Fri, 21 Jun 2019 09:35:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/a1SzMAew93o+5BUSrzJdVmV8JUsh2PxtE5kWiU4qRh49LfqI4PgXoJ6Aue6Kiv+ldz20
X-Received: by 2002:a37:8c45:: with SMTP id o66mr21116797qkd.317.1561134931856;
        Fri, 21 Jun 2019 09:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134931; cv=none;
        d=google.com; s=arc-20160816;
        b=0J/X/CRJRAs/3LdKB5YvxuQo7v4jZekFB4MtX5sQ0ytHbTpfxNcqnUg2vElcSeznOg
         yh6JMWhg0N8XJ3BwGShpxiOg55X346pIrkXLhNj0OsFhH2yucLSQfVU1hXK3Hn6YNsZN
         y8hr88/El2oGa2GChMgfd6fwNAw+rtKHzN/r8ZxAyhuOnsfdXxTkJSqnw/ooS9L1e6JN
         lqnBQ33NdkuiHsJsNpfqYAeKlJ0NfniAYlCRYqlxJsuBypnpp4WGp3Aqnc6XdMpdbDnP
         L8t0Ic9nt0sjyD9SFci5/2/pJxKvxnzypXAgQ7kXXa00s+pN6o9RSrqVQdkQrDMy2H3s
         2IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1WTcvH1P1rnREnBbhl6qCYYbsIN6F9FQA4QqzRdEFng=;
        b=vnS4u00Q+UzystukSzXnRU8SYwY4sUSi6uKXWWeJungKI9IbfOURhq6mUGCp5eUJMs
         rKvLcPuC4YCoVt4CuhaawRmSPjrHVrJt4DN+Ho4t9WnWH+9P/QrdruOG2vdfSc/H8ljw
         xiYPllL45JeJ0XcqNwcUUpeS8za80kxdNBJsJrM2d87h8rJuFmhDVhPennICv3Y19vVf
         qh3GW8G6SeyYyNGcsjGw7O7JsM4UmNtxBSeyghi23C0LIjypRT0Up9JSAVsThQZpgOMV
         t6k2TkvXf5IhajiWGwCrPc5NidHYHqot7DT/RQNaWHhPedA+WI7mq/sUpG91F+FzMYZc
         Hmwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n68si1914818qke.321.2019.06.21.09.35.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBCEB30C62A8;
	Fri, 21 Jun 2019 16:35:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE0A21001B3F;
	Fri, 21 Jun 2019 16:35:22 +0000 (UTC)
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
Subject: [PATCH v2 12/14] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Fri, 21 Jun 2019 18:34:20 +0200
Message-Id: <20190621163422.6127-13-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 16:35:26 +0000 (UTC)
X-TUID: TgZMvPj93d6R

kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
parameter. Rather than just using it as an output parameter to
pass back the preferred target, use it also as an input parameter,
allowing a caller to pass a selected target if they wish and to
also pass cpu features. If the caller doesn't want to select a
target they can pass -1 for the target which indicates they want
to use the preferred target and have it passed back like before.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm.c   | 20 +++++++++++++++-----
 target/arm/kvm32.c |  6 +++++-
 target/arm/kvm64.c |  6 +++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 60645a196d3d..66c0c198604a 100644
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
index 9fc7f078cf68..2821135a4d0e 100644
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
