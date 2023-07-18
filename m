Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6292180eje;
        Tue, 18 Jul 2023 04:15:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF0JpWibr6iJvCxyPFS5e1YEwECSBTWB9bstcLg5xEQg6qHFttN3UhKqwqRKoL9ZrlItj4v
X-Received: by 2002:a05:6a20:3206:b0:131:4d40:3c9d with SMTP id hl6-20020a056a20320600b001314d403c9dmr13159366pzc.9.1689678913502;
        Tue, 18 Jul 2023 04:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689678913; cv=none;
        d=google.com; s=arc-20160816;
        b=IAxPoPcoHkg7iKjDrgAZIuovocMZI+ENfPW0JMEBB+RDYkmD9lbgNczT07ryAeubEE
         1vCv9cQKBRvWRx9v+3vM6PDcNpL9fMe/KwewvjrZwoMR/ivCMqVwlIloJph6WAlsD8ZY
         kDjb1hZ+wQvP8eup3GY19Jaaopyllk84JQd3vG/6eD2GfRkwfGtdST78mCk04q/unr8H
         HjqgljPNUCa/qZAe2Lh3XdLQqQ9I5M60001GMcQcokfV1pWf7qaQh6iNDg6SucZm6VOY
         YoWMqgps4OQ8nsIbsD098+OvzVY60Y0PSTPQIu6yIHKWh+ufTqe7eNaNVENzl9qeVK59
         3/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=i2OD4smg/ZvktuylTs1UWQ6Kcn05ZJ4begnPzWgRGK4=;
        fh=uQr7pjt/ibS5vnjZSmQ1WGiQFIRklh5YUHGxKidwOlo=;
        b=N4fGmXQlslCnpmwqMrms3+Ukfn1UPMzjX20SVK/WU6mevgzRsvrIWy8JI6DO4l+OYh
         BvJCtc0lvrROcn+swaU2n2pu4VP8f5Q3T50giLhNUSpCQeO70H0uRFi0YZDUs9X6eoaV
         ESvU4Yzq5oknfH37bfyN0Q7sWSG2j/2XUsge+GRfCoh73soPX+VdT8u5ysymEyQ2vdjR
         YxCjDkZS/dKetyUiZG+Qh5e9fqpQjmAB+GNb9mRkukX0PpyTTK4p1sazpdi7A8xLTdey
         7scCoCeUkbbCcxB1rzR1/BSxTBJUlar6xvW/sT6qcMogtfsiSuLTl7qWqI/VOBnkx3xA
         DPuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igWPbHG9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id h12-20020a63574c000000b0055337ca9ce9si1387803pgm.248.2023.07.18.04.15.13;
        Tue, 18 Jul 2023 04:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igWPbHG9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjGRLPM (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 18 Jul 2023 07:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjGRLPK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Jul 2023 07:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D907FFF
        for <kvm@vger.kernel.org>; Tue, 18 Jul 2023 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689678863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2OD4smg/ZvktuylTs1UWQ6Kcn05ZJ4begnPzWgRGK4=;
        b=igWPbHG9g0GoIV5JFQwWUASuPRNNSl8uB2uXb6RaqLB9WiMBu6HiD+vKIJrzZOdScif4B8
        6xX8xEng6EtQAyD+gKchKChS68DIEypXcRH0QLWIC0UZ/r+AvYffTgKFBGJV5juaI5x17G
        257RC4TSb7/FnkC+ULiBXb2KqUttrv0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-Uhqf_xZxO7SMb70xkQYFgw-1; Tue, 18 Jul 2023 07:14:18 -0400
X-MC-Unique: Uhqf_xZxO7SMb70xkQYFgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD0738060ED;
        Tue, 18 Jul 2023 11:14:18 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6ED40C6CCD;
        Tue, 18 Jul 2023 11:14:17 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-8.2 1/2] arm/kvm: convert to kvm_set_one_reg
Date:   Tue, 18 Jul 2023 13:14:03 +0200
Message-ID: <20230718111404.23479-2-cohuck@redhat.com>
In-Reply-To: <20230718111404.23479-1-cohuck@redhat.com>
References: <20230718111404.23479-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mPqrJ0KG8h6w

We can neaten the code by switching to the kvm_set_one_reg function.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c   | 13 +++------
 target/arm/kvm64.c | 66 +++++++++++++---------------------------------
 2 files changed, 21 insertions(+), 58 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b4c7654f4980..cdbffc3c6e0d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -561,7 +561,6 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
     bool ok = true;
 
     for (i = 0; i < cpu->cpreg_array_len; i++) {
-        struct kvm_one_reg r;
         uint64_t regidx = cpu->cpreg_indexes[i];
         uint32_t v32;
         int ret;
@@ -570,19 +569,17 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
             continue;
         }
 
-        r.id = regidx;
         switch (regidx & KVM_REG_SIZE_MASK) {
         case KVM_REG_SIZE_U32:
             v32 = cpu->cpreg_values[i];
-            r.addr = (uintptr_t)&v32;
+            ret = kvm_set_one_reg(cs, regidx, &v32);
             break;
         case KVM_REG_SIZE_U64:
-            r.addr = (uintptr_t)(cpu->cpreg_values + i);
+            ret = kvm_set_one_reg(cs, regidx, cpu->cpreg_values + i);
             break;
         default:
             g_assert_not_reached();
         }
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
         if (ret) {
             /* We might fail for "unknown register" and also for
              * "you tried to set a register which is constant with
@@ -703,17 +700,13 @@ void kvm_arm_get_virtual_time(CPUState *cs)
 void kvm_arm_put_virtual_time(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    struct kvm_one_reg reg = {
-        .id = KVM_REG_ARM_TIMER_CNT,
-        .addr = (uintptr_t)&cpu->kvm_vtime,
-    };
     int ret;
 
     if (!cpu->kvm_vtime_dirty) {
         return;
     }
 
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM_TIMER_CNT, &cpu->kvm_vtime);
     if (ret) {
         error_report("Failed to set KVM_REG_ARM_TIMER_CNT");
         abort();
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 94bbd9661fd3..b4d02dff5381 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -540,14 +540,10 @@ static int kvm_arm_sve_set_vls(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
-    struct kvm_one_reg reg = {
-        .id = KVM_REG_ARM64_SVE_VLS,
-        .addr = (uint64_t)&vls[0],
-    };
 
     assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
 
-    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    return kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_VLS, &vls[0]);
 }
 
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
@@ -725,19 +721,17 @@ static void kvm_inject_arm_sea(CPUState *c)
 static int kvm_arch_put_fpsimd(CPUState *cs)
 {
     CPUARMState *env = &ARM_CPU(cs)->env;
-    struct kvm_one_reg reg;
     int i, ret;
 
     for (i = 0; i < 32; i++) {
         uint64_t *q = aa64_vfp_qreg(env, i);
 #if HOST_BIG_ENDIAN
         uint64_t fp_val[2] = { q[1], q[0] };
-        reg.addr = (uintptr_t)fp_val;
+        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]),
+                                                        &fp_val);
 #else
-        reg.addr = (uintptr_t)q;
+        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]), &q);
 #endif
-        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
         if (ret) {
             return ret;
         }
@@ -758,14 +752,11 @@ static int kvm_arch_put_sve(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint64_t tmp[ARM_MAX_VQ * 2];
     uint64_t *r;
-    struct kvm_one_reg reg;
     int n, ret;
 
     for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
         r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_ZREG(n, 0), r);
         if (ret) {
             return ret;
         }
@@ -774,9 +765,7 @@ static int kvm_arch_put_sve(CPUState *cs)
     for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
         r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
                         DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-        reg.addr = (uintptr_t)r;
-        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_PREG(n, 0), r);
         if (ret) {
             return ret;
         }
@@ -784,9 +773,7 @@ static int kvm_arch_put_sve(CPUState *cs)
 
     r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
                     DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
-    reg.addr = (uintptr_t)r;
-    reg.id = KVM_REG_ARM64_SVE_FFR(0);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_FFR(0), r);
     if (ret) {
         return ret;
     }
@@ -796,7 +783,6 @@ static int kvm_arch_put_sve(CPUState *cs)
 
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    struct kvm_one_reg reg;
     uint64_t val;
     uint32_t fpr;
     int i, ret;
@@ -813,9 +799,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     }
 
     for (i = 0; i < 31; i++) {
-        reg.id = AARCH64_CORE_REG(regs.regs[i]);
-        reg.addr = (uintptr_t) &env->xregs[i];
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
+                              &env->xregs[i]);
         if (ret) {
             return ret;
         }
@@ -826,16 +811,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
      */
     aarch64_save_sp(env, 1);
 
-    reg.id = AARCH64_CORE_REG(regs.sp);
-    reg.addr = (uintptr_t) &env->sp_el[0];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.sp), &env->sp_el[0]);
     if (ret) {
         return ret;
     }
 
-    reg.id = AARCH64_CORE_REG(sp_el1);
-    reg.addr = (uintptr_t) &env->sp_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(sp_el1), &env->sp_el[1]);
     if (ret) {
         return ret;
     }
@@ -846,23 +827,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     } else {
         val = cpsr_read(env);
     }
-    reg.id = AARCH64_CORE_REG(regs.pstate);
-    reg.addr = (uintptr_t) &val;
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pstate), &val);
     if (ret) {
         return ret;
     }
 
-    reg.id = AARCH64_CORE_REG(regs.pc);
-    reg.addr = (uintptr_t) &env->pc;
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pc), &env->pc);
     if (ret) {
         return ret;
     }
 
-    reg.id = AARCH64_CORE_REG(elr_el1);
-    reg.addr = (uintptr_t) &env->elr_el[1];
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(elr_el1), &env->elr_el[1]);
     if (ret) {
         return ret;
     }
@@ -881,9 +856,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
     /* KVM 0-4 map to QEMU banks 1-5 */
     for (i = 0; i < KVM_NR_SPSR; i++) {
-        reg.id = AARCH64_CORE_REG(spsr[i]);
-        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(spsr[i]),
+                              &env->banked_spsr[i + 1]);
         if (ret) {
             return ret;
         }
@@ -898,18 +872,14 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
-    reg.addr = (uintptr_t)(&fpr);
     fpr = vfp_get_fpsr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_SIMD_CTRL_REG(fp_regs.fpsr), &fpr);
     if (ret) {
         return ret;
     }
 
-    reg.addr = (uintptr_t)(&fpr);
     fpr = vfp_get_fpcr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_set_one_reg(cs, AARCH64_SIMD_CTRL_REG(fp_regs.fpcr), &fpr);
     if (ret) {
         return ret;
     }
-- 
2.41.0
