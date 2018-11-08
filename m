Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199318wrw;
        Thu, 8 Nov 2018 02:18:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5c833Dc6EgCqtenw+qEFjZzJt/lb6VBP8d6iCt+EbteCG23Kr9HP8I0jWxQrajl8jhqlVxt
X-Received: by 2002:a62:8d92:: with SMTP id p18-v6mr4077680pfk.217.1541672329684;
        Thu, 08 Nov 2018 02:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672329; cv=none;
        d=google.com; s=arc-20160816;
        b=EAE89nRekQfzy4oysDCF9Ke2nVxLpaCyBx3BjWtrq7oz9m/vFOaD2j3BVrdRbgOqEa
         LH4GIF5915E/vZoLFeGXT6e9mz+hg+HkWMyUG7yNWzbMr72VRYjQ9BUj1tE+D5V4p6Pw
         mmrAMDDE3hHn759cqQjqWfyyQmqrrfxe6hKOKhigTbXYXcm+I+Zal44pJ5w3m+w7d2h3
         Rg/VFIfpzoC3qobddnEw1B0tHvoYIg3dPJLy6s50Uo5c3CeYJtncO+1jD3fINsg3Jgyq
         Tss/w3i4UiiQIQ0u9SccsJ4Xo3fz/62QgYvC57lB9NB6BgwRK/MV4vJLXl21jm0MfBsd
         7MAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=dy2bkBZ9d6tCd+8UIkoeQ8b33fxziJLCDkTGG53P2Qo=;
        b=mq1BIbqQe9B2mpzBiT/ybfquNvpeme8ZnD5/vgwA2y2CCX4krRl9LLCNOPO68lkJ+g
         +cnbANtIPU5dx/sP8H2ATZaducfFCQMJRldsM1de8kzFPwA5PICw/dX7pmjsPw/JApsX
         kQIbFoKk2rQ/pDeClhC8CwgFSKwe8VXod7P6mh73NuMKX4XnX2podEr73XXVKdWWcwAQ
         60NB9mnEbJ/S1VfM0RSDuMoc69ek4XEMgVUc8WZYPgVaAh9XQGF6kKKFoef3+SdC+hY6
         cFtQ0fUdrpbg1Iaf5Qol/JjxKVqyLLONVCjE3Ot2uls2Mjj5ZU9V1ILe1SwCNbI+Joc7
         IGWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.49;
        Thu, 08 Nov 2018 02:18:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbeKHTxd (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14620 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727083AbeKHTxd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:33 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3F12F941E61D9;
        Thu,  8 Nov 2018 18:18:44 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:37 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 08/10] target-arm: kvm64: inject synchronous External Abort
Date:   Thu, 8 Nov 2018 02:15:51 -0800
Message-ID: <1541672153-15529-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bLUP83JTsnAO

Add synchronous external abort injection logic, setup
exception type and syndrome value. When switch to guest,
guest will jump to the synchronous external abort vector
table entry.

The ESR_ELx.DFSC is set to synchronous external abort(0x10),
and ESR_ELx.FnV is set to not valid(0x1), which will tell
guest that FAR is not valid and holds an UNKNOWN value.
These value will be set to KVM register structures through
KVM_SET_ONE_REG IOCTL.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Marc is against that KVM inject the synchronous external abort(SEA) in [1],
so user space how to inject it. The test result that injection SEA to guest by Qemu
is shown in [2].

[1]: https://lkml.org/lkml/2017/3/2/110
[2]:
Taking exception 4 [Data Abort]
...from EL0 to EL1
...with ESR 0x24/0x92000410
...with FAR 0x0
...with ELR 0x40cf04
...to EL1 PC 0xffffffc000084c00 PSTATE 0x3c5
after kvm_inject_arm_sea
Unhandled fault: synchronous external abort (0x92000410) at 0x0000007fa234c12c
CPU: 0 PID: 536 Comm: devmem Not tainted 4.1.0+ #20
Hardware name: linux,dummy-virt (DT)
task: ffffffc019ab2b00 ti: ffffffc008134000 task.ti: ffffffc008134000
PC is at 0x40cf04
LR is at 0x40cdec
pc : [<000000000040cf04>] lr : [<000000000040cdec>] pstate: 60000000
sp : 0000007ff7b24130
x29: 0000007ff7b24260 x28: 0000000000000000
x27: 00000000000000ad x26: 000000000049c000
x25: 000000000048904b x24: 000000000049c000
x23: 0000000040600000 x22: 0000007ff7b243a0
x21: 0000000000000002 x20: 0000000000000000
x19: 0000000000000020 x18: 0000000000000000
x17: 000000000049c6d0 x16: 0000007fa22c85c0
x15: 0000000000005798 x14: 0000007fa2205f1c
x13: 0000007fa241ccb0 x12: 0000000000000137
x11: 0000000000000000 x10: 0000000000000000
x9 : 0000000000000000 x8 : 00000000000000de
x7 : 0000000000000000 x6 : 0000000000002000
x5 : 0000000040600000 x4 : 0000000000000003
x3 : 0000000000000001 x2 : 0000000000000000
x1 : 0000000000000000 x0 : 0000007fa2418000
---
 target/arm/cpu.h       |  2 ++
 target/arm/helper.c    | 23 +++++++++++++++++++++++
 target/arm/internals.h |  5 +++--
 target/arm/kvm64.c     | 39 +++++++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c |  2 +-
 5 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b5eff79..502507d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2331,6 +2331,8 @@ bool write_list_to_cpustate(ARMCPU *cpu);
  */
 bool write_cpustate_to_list(ARMCPU *cpu);
 
+bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset);
+
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9630193..df078ff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -263,6 +263,29 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
+bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset)
+{
+    const ARMCPRegInfo *ri;
+    uint32_t regidx, i;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            continue;
+        }
+
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+        if (ri->fieldoffset == fieldoffset) {
+            cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
+            return true;
+        }
+    }
+    return false;
+}
+
 bool write_cpustate_to_list(ARMCPU *cpu)
 {
     /* Write the coprocessor state from cpu->env to the (index,value) list. */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c2bb2d..04ea074 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -415,13 +415,14 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
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
index 5de8ff0..0ca2b29 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -594,6 +594,45 @@ int kvm_arm_cpreg_level(uint64_t regidx)
     return KVM_PUT_RUNTIME_STATE;
 }
 
+/* Inject synchronous external abort */
+static void kvm_inject_arm_sea(CPUState *c)
+{
+    ARMCPU *cpu = ARM_CPU(c);
+    CPUARMState *env = &cpu->env;
+    CPUClass *cc = CPU_GET_CLASS(c);
+    uint32_t esr;
+    int ret;
+
+    /* This exception is synchronous data abort */
+    c->exception_index = EXCP_DATA_ABORT;
+    /* Inject the exception to guest EL1 */
+    env->exception.target_el = 1;
+
+    /* Set the DFSC to synchronous external abort and set FnV to not valid,
+     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
+     */
+
+    /* This exception comes from lower or current exception level. */
+    if (arm_current_el(env) == PSTATE_MODE_EL0t) {
+        esr = syn_data_abort_no_iss(0, 1, 0, 0, 0, 0, 0x10);
+    } else {
+        esr = syn_data_abort_no_iss(1, 1, 0, 0, 0, 0, 0x10);
+    }
+
+    env->exception.syndrome = esr;
+
+    cc->do_interrupt(c);
+    if (kvm_enabled()) {
+        /* write ESR_EL1 from cpustate to list*/
+        ret = write_part_cpustate_to_list(cpu,
+                    offsetof(CPUARMState, cp15.esr_el[1]));
+        if (!ret) {
+            fprintf(stderr, "<%s> failed to set esr_el1\n", __func__);
+            abort();
+        }
+    }
+}
+
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 90741f6..3f1d656 100644
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
