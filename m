Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2760702wrg;
        Mon, 13 May 2019 05:46:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxO6lnqYaUhsqR+iIgMYeJejDLTjtMkiFeqf82WUINKUrurWK5/ibrOQPuldh8jivS/McEr
X-Received: by 2002:a62:200f:: with SMTP id g15mr32617210pfg.7.1557751619752;
        Mon, 13 May 2019 05:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751619; cv=none;
        d=google.com; s=arc-20160816;
        b=kGiWmNmxqzXYi6sJCx02B7hNwRIz/MYYFBVEFQOU9XaV4C6szNNA5R/bL7XNCsVgrU
         L9XsAMzNj0hUUjsW3sE2Vw+f89wowZmnRokE5yWrCgJsfqmqQ0gJd1WycStC63CxpD9u
         9oa+/dZjlXCd5e3Knhs7EAlMwKDaVFtWKoUFExMVKb76RrwuBUpmWm0FF+apoCadcNk5
         oP4LYtP7jCMis/+2wHHf1Yx91lg9s7Le/xSTD7S6dmusb7peQD0vrZhNJAm5CbqHfzX+
         R0iL920v2MyCsl50Um+Br0kp+icSua9+VegBGmm3iZ8J2OwYwNBdVtqmCejzdKDLRHHf
         OQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8GpOIZJ+22epmPDM+ain2r7rEQu7xs1sJiYe5oUPSnQ=;
        b=oO2dS63l0bULiY+TpuQzmGrIgZesti/XLBrNEiBflfXCGDjFd3iANP173qIJA9Qkdq
         YnWnm/zVZt9RzgH/xgz0jZP+ZwLNqbiheEyDMOGTQfKTi0xJSgK8q7bd8vDtA40Og4sh
         3MYlaLD1COEfmYgBzCT59TwieFY81ZllvA28KoyN0yalTEAvp4+TwUXrBv4pFlRuRzgV
         6oAezHKN/x8jNUNZdnvYD2V4T35UgIxdYwWxbIAimulgwk5cbRe4Qw4kOoVpNkG2jDZ8
         8sHf5xK/huDr5sKDA3NQ5Nc9zwAKRh1y3vvMWQ8mWIMJcFlEx5PRb53AhcqdSZSQHk8L
         Rm5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s23si16032343pga.580.2019.05.13.05.46.59;
        Mon, 13 May 2019 05:46:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfEMMqv (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Mon, 13 May 2019 08:46:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7635 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729497AbfEMMqu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 May 2019 08:46:50 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 64B96A929D6EF2512CA3;
        Mon, 13 May 2019 20:46:48 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 May 2019 20:46:40 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v16 09/10] target-arm: kvm64: inject synchronous External Abort
Date:   Mon, 13 May 2019 05:43:07 -0700
Message-ID: <1557751388-27063-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
References: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: hFwkV7Pcx79A

Add synchronous external abort injection logic, setup
exception type and syndrome value. When switch to guest,
it will jump to the synchronous external abort vector
table entry.

The ESR_ELx.DFSC is set to synchronous external abort(0x10),
and ESR_ELx.FnV is set to not valid(0x1), which will tell
guest that FAR is not valid and hold an UNKNOWN value.
These value will be set to KVM register structures through
KVM_SET_ONE_REG IOCTL.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 target/arm/internals.h |  5 +++--
 target/arm/kvm64.c     | 34 ++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 587a1dd..4d67a91 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -451,13 +451,14 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
         | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
-static inline uint32_t syn_data_abort_no_iss(int same_el,
+static inline uint32_t syn_data_abort_no_iss(int same_el, int fnv,
                                              int ea, int cm, int s1ptw,
                                              int wnr, int fsc)
 {
     return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
            | ARM_EL_IL
-           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+           | (fnv << 10) | (ea << 9) | (cm << 8) | (s1ptw << 7)
+           | (wnr << 6) | fsc;
 }
 
 static inline uint32_t syn_data_abort_with_iss(int same_el,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e3ba149..c7bdc6a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -697,6 +697,40 @@ int kvm_arm_cpreg_level(uint64_t regidx)
     return KVM_PUT_RUNTIME_STATE;
 }
 
+/* Inject synchronous external abort */
+static void kvm_inject_arm_sea(CPUState *c)
+{
+    ARMCPU *cpu = ARM_CPU(c);
+    CPUARMState *env = &cpu->env;
+    CPUClass *cc = CPU_GET_CLASS(c);
+    uint32_t esr;
+    bool same_el;
+
+    /**
+     * set the exception type to synchronous data abort
+     * and the target exception Level to EL1.
+     */
+    c->exception_index = EXCP_DATA_ABORT;
+    env->exception.target_el = 1;
+
+    /*
+     * Set the DFSC to synchronous external abort and set FnV to not valid,
+     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
+     */
+
+    /* This exception comes from lower or current exception level. */
+    same_el = arm_current_el(env) == env->exception.target_el;
+    esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, 0, 0x10);
+
+    env->exception.syndrome = esr;
+
+    /**
+     * The vcpu thread already hold BQL, so no need hold again when
+     * calling do_interrupt
+     */
+    cc->do_interrupt(c);
+}
+
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8698b4d..d43134a 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -109,7 +109,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * ISV field.
      */
     if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
-        syn = syn_data_abort_no_iss(same_el,
+        syn = syn_data_abort_no_iss(same_el, 0,
                                     ea, 0, s1ptw, is_write, fsc);
     } else {
         /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
-- 
1.8.3.1
