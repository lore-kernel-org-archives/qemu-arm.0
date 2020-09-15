Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2795919lfq;
        Mon, 14 Sep 2020 20:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygSxxmP/yuRZUjN6C6ouNppWUus09tS02BIXgc8PnVUZGuxHXgvNbZvwxGtuWWMUSfZMEE
X-Received: by 2002:a25:cf8b:: with SMTP id f133mr19041633ybg.121.1600139587257;
        Mon, 14 Sep 2020 20:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139587; cv=none;
        d=google.com; s=arc-20160816;
        b=Pdt3xaGFMYA6IdyQTR4IljAWG1ZRsP0oEFW/17BjECbVhWXYnrNugqUWEZEVBftuR1
         90zvOygB9L/vA6jE/Q0Na2+IHtjgVL5g8ktomq2iWRmdXgdlWK6KG5R87Pw5jxhg8P7o
         RZcXrEvKZ2KsetM0Apuz2gAAaEOqtRg5Ko7jV7CVuYrGFDQpC/EVXC492uhV81SyIRP5
         5Ja3ws0QTTNDTkAX0VxrK6TbkFK21yKZBjkD9CdmIZTxOj5notVCw1c7i/cTxMafWZqd
         2fjphqgIF4JmtTwiZ0cTBoh6/O7Y+T90VJcQeb6xAPzRjG/1J/CJocsVmcpiwATGqFiL
         FIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IjQ8g3LVUwEAgUjJBblk9Y/d1f1AL0wZ+pGopoHSfcE=;
        b=0MFF0gzKABnqOVa+wMVbzl2bAB6diSl0qND9hFP3ATlN9FBKT/GWlcfd8oYhvCvqvp
         p9bhWEJWwGCpJEJ8zXGZHC9GJL/r0qWcSyAZN4h73SBBmlLk7A1aIAiSTR9wjjOpBuct
         ozKiHZG7ZvcQPBTsP0Vm/PLZMMl7rRmPyTnrFRhvnFH/kN4KlVFQwsI08QZz1Eoizg0g
         zLRfsUkq3/j3cVXGJfCjB78cZB/riUp257TPkPd8EMP5KWS06GIt4fic7oXTWdZlP+Kl
         tNebYTo3vppyZcGUiGoZ6K3Ji58nP3PWUEkOHGhMXDU1tD3CJzRhz0H4Tauy+5lSLZRS
         bNDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="I0C/8ayV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si5828385ybh.453.2020.09.14.20.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="I0C/8ayV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1P0-0001kO-JX
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OH-0000eX-FR
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:21 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OE-0001kf-2u
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:21 -0400
Received: by mail-pl1-x641.google.com with SMTP id r19so595379pls.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjQ8g3LVUwEAgUjJBblk9Y/d1f1AL0wZ+pGopoHSfcE=;
 b=I0C/8ayV1IjvUs+Fnv4IIKt5QWMTeMrvtp422fKJvVrTSv132J81oXoq9LDk80s9M/
 JYpqDZ++pJY3GjYF1+3FTZayBauAARIysxHDBKVtIta8j5HipuvjitWX/Vo2H8o5otZw
 V5LW/LfNCURIXWZRLfsW1rblckc0CRiITPRXwOtblVQETcxtyqZ55fU+gH2YK5A1Jctq
 zaGRi5zxxdtIfexEOckuKE2Np+zsYAF40kVQCRxJH6JTTGJQO8pyKszZQTYjAqzwYeBp
 z3+sFjbbRSzG+//nSr0uPg7rYeF5eVsFigNr116nqt4baE4tN8wV+M4wkj26N4Zr7HIP
 p9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjQ8g3LVUwEAgUjJBblk9Y/d1f1AL0wZ+pGopoHSfcE=;
 b=AjIUjfAa5EDx22KsqnvpQkslGUsuX6ymE2RcE+/rRvfCHvjazCVqnkOnClq/cOXqgH
 9UNbw5Del6IBWcNa6Uj9TMhuLe5yZdQUc8YtiLfX66hXga85cb/rKs2RJ2Is3c2XSd38
 dHoFPKX7gyM1bAAXUYbCXUn4Rm3fFla/nMlOfxroI0qdXgOoASLpOU62/blOPuFv04HK
 ybU0fi72em1nrh/abhHsyEmdA/wDGonHdVCOzOaWPw5t+fOP276UFXdBnJLsB0TPfaai
 hPRe190LsAOJAVQ/ELXZglBsO7UqLbkS6ZaEASkPBPkkdVqKygoxcbz+xbQw01aszjqF
 hq+g==
X-Gm-Message-State: AOAM532yQgqi3H1+jm2nipZrqMjS0r84qQGojEjzvfh+YsYTP525VYkH
 8yCQEzFIhpZ043/He2c74xj2
X-Received: by 2002:a17:902:bd8d:b029:d1:cbfc:6137 with SMTP id
 q13-20020a170902bd8db02900d1cbfc6137mr6159093pls.23.1600139536711; 
 Mon, 14 Sep 2020 20:12:16 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:16 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 10/12] target/arm/cpu: spe: Enable spe to work with host cpu
Date: Tue, 15 Sep 2020 03:11:46 +0000
Message-Id: <b9c848142d25ce4556fe14fc60a4bc73dd1683d2.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=haibo.xu@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8fvyiRit8jal

Turn on the spe cpu property by default if host cpu
support it, i.e. we can now do '-cpu max|host' to add
the vSPE, and '-cpu max|host,spe=off' to remove it.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/cpu.c   |  1 +
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c | 10 +++++++---
 target/arm/kvm64.c | 12 ++++++++++++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 786cc6134c..05a4b7d208 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2271,6 +2271,7 @@ static void arm_host_initfn(Object *obj)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
+        aarch64_add_spe_properties(obj);
     }
     arm_cpu_post_init(obj);
 }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 395a1e5df8..5a3ea876c8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1040,6 +1040,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
+void aarch64_add_spe_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
@@ -1071,6 +1072,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
 static inline void aarch64_add_sve_properties(Object *obj) { }
+static inline void aarch64_add_spe_properties(Object *obj) { }
 #endif
 
 #if !defined(CONFIG_TCG)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4997c4a3c0..04daeb901d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -621,6 +621,12 @@ static void arm_spe_set(Object *obj, bool value, Error **errp)
     ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
 }
 
+void aarch64_add_spe_properties(Object *obj)
+{
+    ARM_CPU(obj)->has_spe = ON_OFF_AUTO_AUTO;
+    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -632,6 +638,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        aarch64_add_spe_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
@@ -770,9 +777,6 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
-
-    cpu->has_spe = ON_OFF_AUTO_AUTO;
-    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5a2032fc9e..20269efeff 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -515,6 +515,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool spe_supported;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -655,6 +656,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    spe_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION,
+                                      KVM_CAP_ARM_SPE_V1) > 0;
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -668,6 +671,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
     }
+    if (spe_supported) {
+        t = ahcf->isar.id_aa64dfr0;
+        t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, 1);
+        ahcf->isar.id_aa64dfr0 = t;
+    }
 
     /*
      * We can assume any KVM supporting CPU is at least a v8
@@ -830,6 +838,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (cpu_isar_feature(aa64_spe, cpu)) {
+        assert(kvm_arm_spe_supported());
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.17.1

