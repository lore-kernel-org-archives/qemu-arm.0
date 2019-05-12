Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641095wrg;
        Sun, 12 May 2019 01:37:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU0u1d/IJh6XHLGpKGzgy/LmWnBXucZ4Ht980b3+Eou1+W1+eV4uRwsjwKixXU/B4BoB0h
X-Received: by 2002:a37:a794:: with SMTP id q142mr17148736qke.36.1557650221648;
        Sun, 12 May 2019 01:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650221; cv=none;
        d=google.com; s=arc-20160816;
        b=f8SNsdhnhaOhRmNvPUqLe8r4rezy0u9azpyhnAgv9eeaNSCOEY6dmVOxnqTghhnGNc
         I9gK9O+4E5qG1zmHo1YBXdEFdyV3vfX7Ece1dgonClvCAM9HmAF4CqhLu13QSS0liXhK
         SVz7kUBqq8nFQ/IruhsqMcekr0IMHivCt7M9kjJiMxFRkAKFZpGx+KM2cyZ65DwKMxnj
         NHh/33LgfyCdsBOgUwDAs59fI/H/atXM5uJcyIow4j5tLZQ58+bBm8wmUi6Y/QfglR/t
         AJk/sSWeZYxZvNFeBD6y3yCepZXAnJmUXu3YJUs7LNmcTRSXDPUNtiZDCENvBiajSEln
         W2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=l4uZExQEzwmDugKIgWA74knTtDzga24z4SaMv9d9oGU=;
        b=RGenD9U9gyazvB6tgiCdToiYcrtAavEn04aA4u1XZ2/IFwHMXTWH3C3NFU3smUQm3o
         CIrRY5JxGfBSSuSnsCVhFPRAgouql9lJ44F53oZltQFl413zuRr0w/Upb8k97LO89ZlZ
         7tgUNTVH+gYWq3tZTCYoEhDfIm1CUUh+3Zn0dTy5WfxtbCdV26XcMuZMyPA2poEiZzew
         VC2b5yUBKLfNXbIjVDYq6b4kDkpZuk6VXkUxqkPb5S/xbuMqmjMYWEwXY/N3jaFgfqdK
         5Vw4R5FJl3Ld41wv5H9Jozqoa1PZrC0zT4ypz049beJ023RpF/AEp3b4EJeLCP7j4jAQ
         v6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l190si1665847qkf.38.2019.05.12.01.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7EFAB0AA6;
	Sun, 12 May 2019 08:37:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE2E5D706;
	Sun, 12 May 2019 08:36:55 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 06/13] target/arm/kvm: max cpu: Enable SVE when available
Date: Sun, 12 May 2019 10:36:17 +0200
Message-Id: <20190512083624.8916-7-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sun, 12 May 2019 08:37:00 +0000 (UTC)
X-TUID: o4faolVJ/bZe

Enable SVE in the KVM guest when the 'max' cpu type is configured
and KVM supports it. KVM SVE requires use of the new finalize
vcpu ioctl, so we add that now too.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c   |  1 +
 target/arm/kvm.c     |  5 +++++
 target/arm/kvm64.c   | 16 +++++++++++++++-
 target/arm/kvm_arm.h | 12 ++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 228906f26786..6c19ef6837d5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -292,6 +292,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        cpu->sve_max_vq = ARM_MAX_VQ;
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 599563461264..c51db4229d0f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -50,6 +50,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
 
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+{
+    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
+}
+
 void kvm_arm_init_serror_injection(CPUState *cs)
 {
     cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 86362f4cd7d0..c2d92df75353 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -622,13 +622,20 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
     if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-            cpu->has_pmu = false;
+        cpu->has_pmu = false;
     }
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
+    if (cpu->sve_max_vq) {
+        if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
+            cpu->sve_max_vq = 0;
+        } else {
+            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
+        }
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
@@ -636,6 +643,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    if (cpu->sve_max_vq) {
+        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        if (ret) {
+            return ret;
+        }
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2a07333c615f..c488ec3ab410 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -27,6 +27,18 @@
  */
 int kvm_arm_vcpu_init(CPUState *cs);
 
+/**
+ * kvm_arm_vcpu_finalize
+ * @cs: CPUState
+ * @feature: int
+ *
+ * Finalizes the configuration of the specified VCPU feature
+ * by invoking the KVM_ARM_VCPU_FINALIZE ioctl.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
+
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
-- 
2.20.1
