Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2860518njb;
        Tue, 18 Mar 2025 04:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXmI2NCFYViM5HN8yhhfFgjyRelMKUi4PdHSuSrd8LX9SSM3Cyx5+HVE+pbjmV77Bswhq5A460K7LDrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGctRmuGsY8B9ILLQfUdewiZsRKx46NifZwteukVKhdP3LAnM7zKd6/gXM3hgA24AkDAMnP
X-Received: by 2002:a05:6214:5084:b0:6e4:42c2:dd91 with SMTP id 6a1803df08f44-6eaeaabadbcmr302972666d6.37.1742298190223;
        Tue, 18 Mar 2025 04:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742298190; cv=none;
        d=google.com; s=arc-20240605;
        b=b/UmBIfjy0K+2nnDudQ8BdztAf2ZW0Mk0yG6JQT95x77ZR+Fetdyyd3OCBKWPhv0l9
         aZ9QWGpllDG1K9DXRE3h9q0fkq1eXY4QDdYlZxWXDQikHdUV+JU2IFZlYYzFVJx+7sSg
         KQOSYhqNPstUomDo5RMRms/A7VrBsakj7rcD0zmf7Si/epCCvnb+rlAmpeE2fE5YDjg6
         jod5qwZ9uQEGCeT/NVeyJvdI1m4uiWYILSmLpqxFoAvAOX2sj/nmUD11tTMZ20IF33G1
         G2OuAs9dtzCw13663ZmqjpCCOIDuWNBC6SgmvecaAm4c8OqrStMH/W0qfbaAZHx7IIcA
         YxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ny5Q8iZtuoRdzdW7TydI30as0SJ5q+BAUtft5Hm6rtM=;
        fh=RSX5RkXq4RG8KON+qVJyw6zu06Q6aV+StctqNe1ZuAk=;
        b=lAlm3zAnEA67ITZPF0USeXOBxIT7Vj/a3431uKjlxjECZqOVoQPI9BztQ0Z1GXks5X
         COyP+OlLWBHwlJnr+TunL/bLUAWLcrv6NlPovTpF3XvQjwhgJbj8maiC12VqrtU7heaz
         h6EygFCxKiQne2Udq/tEFEJIixmtLXUMVnWkz/2S2rRRtfWgiTvItIIHrWTdlCUcdmjj
         MuoF8YoyqhJX5NqHfkrM6JroZIL9HDwfJsJn8epzEXkXfyhPTqchPIrk4O1N2lQHVm4Y
         0jgOUfDD+4Ufnom5PUdKeQ76/IOdUpQyiYgMOFl+Qjuc24BYvFgn/z6/1QccuVAaVwnM
         JHmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eXdOiGI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33c875si120496266d6.188.2025.03.18.04.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 04:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eXdOiGI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuVL7-0000rr-KU; Tue, 18 Mar 2025 07:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuVL2-0000q5-Lm
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 07:42:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuVL0-0001G5-J9
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 07:42:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39127512371so3320268f8f.0
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742298144; x=1742902944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ny5Q8iZtuoRdzdW7TydI30as0SJ5q+BAUtft5Hm6rtM=;
 b=eXdOiGI/8XELtjNn4e4j7ABElaryhzYXjIf7idukmH4cY7SJ4Q5lDx+wjL3uUY1jKU
 PIv1yrwl3u/Jy7r021W5IfVYFZhy24xZDwprXzWg0vdWxtJuRLJkXn5UsWS4vxosOShT
 1ZgHRT1+cL7QNAio1d2mlOMLlV+QNIfRhgvoeqtp4Ft19NKHP0AbqGSKMLZQnqyu6P1I
 LKK3xrWFYAVUqW4BRE6uElf/hV/r2X/zglE43sBfSglqyvNbpWLxqAGfciEzahH92cE7
 BhhDDP5SeHILlQ0idIAtJMSRWdeFBulz3n2PsmnyZSf7LmFzph5mpC1TQigTgWKABzqc
 YFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742298144; x=1742902944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ny5Q8iZtuoRdzdW7TydI30as0SJ5q+BAUtft5Hm6rtM=;
 b=OxYWEBM0omOWE9Z4AHrtX2urQfI7z+/0+eJU0MhS6MahMaKe4rlnEGlMxZSqA30LCL
 cFebFp394NFV6BuXy22I1Wn8+N39ziemisbLqDV9Hl8iAFal+l4jAy5bMxRqss3hWMMW
 d5VFuuSfDf+Y7hetxQuorLzBDg+O5DeFW5PQfuvj5NB0878gqvF3LmowZWvKYnurZh/y
 Eeyc96ooo8w4kxRgEmZXFvXKe7LVfB3AQMFgavZKXxgqdATKuPEwssKq19uCuYcXBZAB
 pi3Da1Umovyg7PZLXy21cvP3UdFJhGSlpb6YYiuFL4U/b9sRt7r5Do4BxeUb/xWXO7BZ
 LeyQ==
X-Gm-Message-State: AOJu0Yy3+FsB4QFFLoczDoYKToUhdx2QYbJVCnBhPQaZfoUpWuyiyTtg
 f6DOf3iNR0186G37t1ju8s6A3yjOGcm6j30xkyZc7G+n8Ig2/LJelWyKsM3ZIZUjDy2vilUJYMN
 Y
X-Gm-Gg: ASbGncui7lzdJFohmiWsf5z4RYlI/xZ7gsI2/N9HAXn5YX9Q2Mq/V3i8KiiZBJ0pgQo
 z8AN8A68ajnbPaJAtyOUkRIU93cVUU6F6tGIvWTYKV4tL8H2g/Fe3GphknvFKi/1hrxmW/bFNgf
 jRViPh4oOwFUCM7W1SxYJvOObNru6DvhvOPe9tAIMbgW12/kC9Edpj0jwDJpmL0NYoRL+MLc6ic
 zSVF1KLce0QjFwLRh0syHECZV+V27BlJkEj4Mo0GIPZg7852yPDHPje3mKqTD0jrriEJrIZkeC+
 rUkzHS0aWNEVYC0GCZRRIxORgPMt250VltrtMDmtoX3pSMi22Ww=
X-Received: by 2002:a05:6000:400d:b0:394:d0c3:da5e with SMTP id
 ffacd0b85a97d-3971f5114b2mr15155734f8f.47.1742298144374; 
 Tue, 18 Mar 2025 04:42:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39965410600sm5895203f8f.50.2025.03.18.04.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 04:42:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-10.1] target/arm/kvm: Drop support for kernels without
 KVM_ARM_PREFERRED_TARGET
Date: Tue, 18 Mar 2025 11:42:22 +0000
Message-ID: <20250318114222.1018200-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kPlE7oXOuS9V

Our KVM code includes backwards compatibility support for ancient
kernels which don't support the KVM_ARM_PREFERRED_TARGET ioctl.  This
ioctl was introduced in kernel commit 42c4e0c77ac91 in September
2013 and is in v3.12, so it's reasonable to assume it's present.

(We already dropped support for kernels without KVM_CAP_DEVICE_CTRL,
a feature added to the kernel in April 2013, in our commit
84f298ea3e; so there are only about six months' worth of kernels,
from v3.9 to v3.11, that we don't already fail to run on and that
this commit is dropping handling for.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm_arm.h      |  7 +----
 target/arm/arm-qmp-cmds.c |  2 +-
 target/arm/kvm.c          | 55 ++++++---------------------------------
 3 files changed, 10 insertions(+), 54 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 05c3de8cd46..5f17fc2f3d5 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -97,10 +97,6 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
 #ifdef CONFIG_KVM
 /**
  * kvm_arm_create_scratch_host_vcpu:
- * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
- * QEMU_KVM_ARM_TARGET_NONE) to try as fallback if the kernel does not
- * know the PREFERRED_TARGET ioctl. Passing NULL is the same as passing
- * an empty array.
  * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
  * @init: filled in with the necessary values for creating a host
  * vcpu. If NULL is provided, will not init the vCPU (though the cpufd
@@ -113,8 +109,7 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
  * Returns: true on success (and fdarray and init are filled in),
  * false on failure (and fdarray and init are not valid).
  */
-bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
-                                      int *fdarray,
+bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
                                       struct kvm_vcpu_init *init);
 
 /**
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 883c0a0e8cc..a1a944adb43 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -46,7 +46,7 @@ static inline void gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 #ifdef CONFIG_KVM
     int fdarray[3];
 
-    if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
+    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
         return;
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb234..568561c6d54 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -100,8 +100,7 @@ static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_FINALIZE, &feature);
 }
 
-bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
-                                      int *fdarray,
+bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
@@ -150,40 +149,13 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         struct kvm_vcpu_init preferred;
 
         ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
-        if (!ret) {
-            init->target = preferred.target;
+        if (ret < 0) {
+            goto err;
         }
+        init->target = preferred.target;
     }
-    if (ret >= 0) {
-        ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
-        if (ret < 0) {
-            goto err;
-        }
-    } else if (cpus_to_try) {
-        /* Old kernel which doesn't know about the
-         * PREFERRED_TARGET ioctl: we know it will only support
-         * creating one kind of guest CPU which is its preferred
-         * CPU type.
-         */
-        struct kvm_vcpu_init try;
-
-        while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
-            try.target = *cpus_to_try++;
-            memcpy(try.features, init->features, sizeof(init->features));
-            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
-            if (ret >= 0) {
-                break;
-            }
-        }
-        if (ret < 0) {
-            goto err;
-        }
-        init->target = try.target;
-    } else {
-        /* Treat a NULL cpus_to_try argument the same as an empty
-         * list, which means we will fail the call since this must
-         * be an old kernel which doesn't support PREFERRED_TARGET.
-         */
+    ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
+    if (ret < 0) {
         goto err;
     }
 
@@ -259,17 +231,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     uint64_t features = 0;
     int err;
 
-    /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
-     * we know these will only support creating one kind of guest CPU,
-     * which is its preferred CPU type. Fortunately these old kernels
-     * support only a very limited number of CPUs.
-     */
-    static const uint32_t cpus_to_try[] = {
-        KVM_ARM_TARGET_AEM_V8,
-        KVM_ARM_TARGET_FOUNDATION_V8,
-        KVM_ARM_TARGET_CORTEX_A57,
-        QEMU_KVM_ARM_TARGET_NONE
-    };
     /*
      * target = -1 informs kvm_arm_create_scratch_host_vcpu()
      * to use the preferred target
@@ -300,7 +261,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         features |= 1ULL << ARM_FEATURE_PMU;
     }
 
-    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
+    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
         return false;
     }
 
@@ -1835,7 +1796,7 @@ uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
 
         probed = true;
 
-        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
+        if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
             error_report("failed to create scratch VCPU with SVE enabled");
             abort();
         }
-- 
2.43.0

