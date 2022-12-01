Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp273880ejx;
        Thu, 1 Dec 2022 02:33:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7NVI3cKmYue92KTojuRG2DNcWa9apZZos2P8E1SXnm+MmFxPGz+GGYZKWbsuZbIVE3aAj4
X-Received: by 2002:a05:620a:34f:b0:6fa:19c6:3f76 with SMTP id t15-20020a05620a034f00b006fa19c63f76mr44160709qkm.461.1669890831316;
        Thu, 01 Dec 2022 02:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669890831; cv=none;
        d=google.com; s=arc-20160816;
        b=AHeXY220L04jFcHaEsMyD54qd+Agcoy8EZ9eOhoOmkVjw8aLnS5EW47vm3FA9pYWd2
         EGoAJCDZ7CRdhGOuC1wgz7JHLQ/vSGmhQ1rI3iII6Dp91uCnZRrE12ImIY+AwtGxZS9O
         2RVcAwHgraWou2BmRyWc7wp5/Mjo3ujsEAteOTKnJ8DelwR8EQMR78r8OjnT6fIRlXOJ
         keyS61VtRLbtVpYz/K2soB+bTtc7IrRXL/IU4g5JsAA6Dh3a+grhDd7RaRkDqcB4q+4u
         vpLvdyLycunP55LZLWsW87lhQY+DEFcAK5KP3ctIpS3Xfrhu7g8Axbv3bBoYlWryeR2z
         0yUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uh5vklaDIaIg0E7Mn51RCtOAsyBHikcVipH+NCl7KLQ=;
        b=Cf4tmTZ0E37SeIlfxLba4RKPMYQiMxxGVKD2Gr7iqGiiCt+vwKXIPN+J8kQt+EQwUq
         hHtvTWB/ksYsz46X2sejap2F+OG47FwmVvzWQv+E02qI5ISdj7Ht/uD6Z/v370IWCNm9
         RAaGBjdCE3014D7F5QnGZ8D6VOYNC+V0WsQiP7yQxauW0vqIwh2e3bsyQqrfY8z/2R1j
         Ej0YmNAGp+9oQguoKkU3ZGvOu0NtmXRQlrq+nMJKXYm9o9RwS5ofbn6chGPMr65c9Mwj
         ++n+pzXoBK0A0TZesPt3Gl5PAP7zmz8rRTyaNJy2rSI27fkl7WnXoJ79i6lGYLQG/SeR
         a1Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="MCYdv72/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05620a0bd300b006eebf6f2e6asi2190138qki.409.2022.12.01.02.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 02:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="MCYdv72/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0gsj-0004vj-Ij; Thu, 01 Dec 2022 05:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gsh-0004td-CA
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:33:27 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gse-000481-B2
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:33:27 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y17so1244613plp.3
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uh5vklaDIaIg0E7Mn51RCtOAsyBHikcVipH+NCl7KLQ=;
 b=MCYdv72/SEE9pYLrRB4MMqijiskrQu1JplbAnz8btw08J8CmJoEyI1p8RBc3IFD62I
 isl4DYkSTALpIvdjI0U4D7INXPEMSTCqGuW0d+/Vv6ghfbx+87KOVVNngJMsAH3Zo4FB
 IUJNv8kx8l6z12mzh6tfZJZTn3/Mso/MBn/69UbO+QQKacXCn2F/6H5P6g+Wp3fodZ5U
 F4b/qW9Uch667yZ7eT/Qy0JgXW627QibzCE4OQs2O/L+kHG/fSPDKT1e4fkdohHAS4zJ
 qGYrw/FF9gKeS4Q91HISsYAu1QtaqM3iPFWV+MyPYU20WKxOOEk8YU1pvyQdOyD4b3g8
 t35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uh5vklaDIaIg0E7Mn51RCtOAsyBHikcVipH+NCl7KLQ=;
 b=zZ+Hn4riFXiL4yMd+3aAJgYnpq4eA/XC8KH9YRLCSmw+tw3Dq9fqDErZDZDcW7yUw9
 GPcjjHcAq6c4Pu734Rws1E6vPF/vDqCx6mRN49BHXyakFTvY3ao5RvNqUrQKIhTb/WGH
 zc11Re/tss9DphnlTE7HohTjmdQrE8Wc2olfbPhDic4I4y074gcG/mDSeaeEFAjMOHeS
 iEv5Ov4cK4jzJBFyhaatG3e2Lzgf4y1ING+eLMF62jvN/iNFGt+I//3jyhPeEIS8IpG8
 ce5cn2ZIvpvsLKOmqywmiqdVXvJllWIABAwcBOgjAHhSESXvHeQ3jB9UZIyIHGoAP3jR
 9+Gg==
X-Gm-Message-State: ANoB5pmpMxHmj/PdhfQFh/elZGq3Fn/xtvjp+Truv7S6UplYt2kCuk8N
 A8jZOzSrRH4fb8NDLvZSPeS7LQ==
X-Received: by 2002:a17:90a:fb4e:b0:219:5a12:e1eb with SMTP id
 iq14-20020a17090afb4e00b002195a12e1ebmr10545612pjb.88.1669890802668; 
 Thu, 01 Dec 2022 02:33:22 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa79dd2000000b005752496094bsm2936725pfq.40.2022.12.01.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:33:22 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] target/arm: Propagate errno when writing list
Date: Thu,  1 Dec 2022 19:33:12 +0900
Message-Id: <20221201103312.70720-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OeVo4zB/ailB

Before this change, write_kvmstate_to_list() and
write_list_to_kvmstate() tolerated even if it failed to access some
register, and returned a bool indicating whether one of the register
accesses failed. However, it does not make sen not to fail early as the
the callers check the returned value and fail early anyway.

So let write_kvmstate_to_list() and write_list_to_kvmstate() fail early
too. This will allow to propagate errno to the callers and log it if
appropriate.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/kvm-stub.c |  4 ++--
 target/arm/kvm.c      | 27 +++++++++++----------------
 target/arm/kvm64.c    | 10 ++++++----
 target/arm/kvm_arm.h  | 15 ++++-----------
 target/arm/machine.c  | 13 ++++++++-----
 5 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 965a486b32..f659afd7b8 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -13,12 +13,12 @@
 #include "cpu.h"
 #include "kvm_arm.h"
 
-bool write_kvmstate_to_list(ARMCPU *cpu)
+int write_kvmstate_to_list(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
 
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
+int write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..4cef0efc96 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -501,12 +501,12 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
     }
     assert(cpu->cpreg_array_len == arraylen);
 
-    if (!write_kvmstate_to_list(cpu)) {
+    ret = write_kvmstate_to_list(cpu);
+    if (ret) {
         /* Shouldn't happen unless kernel is inconsistent about
          * what registers exist.
          */
         fprintf(stderr, "Initial read of kernel register state failed\n");
-        ret = -EINVAL;
         goto out;
     }
 
@@ -515,11 +515,10 @@ out:
     return ret;
 }
 
-bool write_kvmstate_to_list(ARMCPU *cpu)
+int write_kvmstate_to_list(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     int i;
-    bool ok = true;
 
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
@@ -545,17 +544,16 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
             g_assert_not_reached();
         }
         if (ret) {
-            ok = false;
+            return ret;
         }
     }
-    return ok;
+    return 0;
 }
 
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
+int write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
     CPUState *cs = CPU(cpu);
     int i;
-    bool ok = true;
 
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
@@ -581,14 +579,10 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
         }
         ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
         if (ret) {
-            /* We might fail for "unknown register" and also for
-             * "you tried to set a register which is constant with
-             * a different value from what it actually contains".
-             */
-            ok = false;
+            return ret;
         }
     }
-    return ok;
+    return 0;
 }
 
 void kvm_arm_cpu_pre_save(ARMCPU *cpu)
@@ -620,8 +614,9 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
     }
-    if (!write_kvmstate_to_list(cpu)) {
-        fprintf(stderr, "write_kvmstate_to_list failed\n");
+    ret = write_kvmstate_to_list(cpu);
+    if (ret < 0) {
+        fprintf(stderr, "write_kvmstate_to_list failed: %s\n", strerror(-ret));
         abort();
     }
     /*
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..f7879194f9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1202,8 +1202,9 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
     write_cpustate_to_list(cpu, true);
 
-    if (!write_list_to_kvmstate(cpu, level)) {
-        return -EINVAL;
+    ret = write_list_to_kvmstate(cpu, level);
+    if (ret) {
+        return ret;
     }
 
    /*
@@ -1418,8 +1419,9 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
-    if (!write_kvmstate_to_list(cpu)) {
-        return -EINVAL;
+    ret = write_kvmstate_to_list(cpu);
+    if (ret) {
+        return ret;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..05fce74baf 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -106,13 +106,9 @@ int kvm_arm_cpreg_level(uint64_t regidx);
  * This updates KVM's working data structures from TCG data or
  * from incoming migration state.
  *
- * Returns: true if all register values were updated correctly,
- * false if some register was unknown to the kernel or could not
- * be written (eg constant register with the wrong value).
- * Note that we do not stop early on failure -- we will attempt
- * writing all registers in the list.
+ * Returns: 0 if success, else < 0 error code
  */
-bool write_list_to_kvmstate(ARMCPU *cpu, int level);
+int write_list_to_kvmstate(ARMCPU *cpu, int level);
 
 /**
  * write_kvmstate_to_list:
@@ -123,12 +119,9 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level);
  * copy info from KVM's working data structures into TCG or
  * for outbound migration.
  *
- * Returns: true if all register values were read correctly,
- * false if some register was unknown or could not be read.
- * Note that we do not stop early on failure -- we will attempt
- * reading all registers in the list.
+ * Returns: 0 if success, else < 0 error code
  */
-bool write_kvmstate_to_list(ARMCPU *cpu);
+int write_kvmstate_to_list(ARMCPU *cpu);
 
 /**
  * kvm_arm_cpu_pre_save:
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433..8a5f3d53ff 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -686,15 +686,16 @@ static const VMStateInfo vmstate_powered_off = {
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
+    int ret;
 
     if (!kvm_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
     if (kvm_enabled()) {
-        if (!write_kvmstate_to_list(cpu)) {
-            /* This should never fail */
-            g_assert_not_reached();
+        ret = write_kvmstate_to_list(cpu);
+        if (ret) {
+            return ret;
         }
 
         /*
@@ -752,7 +753,7 @@ static int cpu_post_load(void *opaque, int version_id)
 {
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
-    int i, v;
+    int i, v, ret;
 
     /*
      * Handle migration compatibility from old QEMU which didn't
@@ -796,7 +797,9 @@ static int cpu_post_load(void *opaque, int version_id)
     }
 
     if (kvm_enabled()) {
-        if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
+        ret = write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE);
+        if (ret) {
+            error_report("Failed to set KVM register: %s", strerror(-ret));
             return -1;
         }
         /* Note that it's OK for the TCG side not to know about
-- 
2.38.1

