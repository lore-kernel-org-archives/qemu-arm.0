Received: by 10.223.134.117 with SMTP id 50csp5137046wrw;
        Wed, 27 Dec 2017 21:27:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBovYF+Z5qbt5Yodyglt/C36do+rrMC/prlIoC7FfKwuVfwElASivJ5mh9pMV/JQTcUsOphVx
X-Received: by 10.98.73.79 with SMTP id w76mr30419667pfa.148.1514438875774;
        Wed, 27 Dec 2017 21:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438875; cv=none;
        d=google.com; s=arc-20160816;
        b=LMgDhHyRT8+2aRu1Eh9qZnFybjsw8Y1dawIEbA5OCKSenzwWo0IOY3fYDWT7xoP/Z4
         q8zkvuDEyv2GqKABdMF94oh7JhjP0tw9K6TcCrenyo7Ge1DEiTnuPWh43NGj4zRCRE/u
         BP3Mc/MUyDBp8WJGRT59K+AFw8m+gkTvz3YeClETDUifmq9NLPt+JPIe4XdHRPBfqOXi
         CkCwiQuCi86nuiQcX4OkTkWTgBjBJ8HcHEY/V2YU2AQnVqO4DLyE6QLr5S53EvlvTz/r
         ISzXK7iV57S1rNQKYMGcvj8yE3NtPzUR9xz9lh7tZ84vQaO1wFjKz6AYfe0jlsAosXAr
         eYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=WXWVyo4DzTtPsGSq4hzbaC4LHT+tojL//9P4XeEDfvc=;
        b=IzQl1YCm33avCqAeClHDdC2eKzkul3prmsrNSOnRZEiJcvJ0ZlySSdorgSI0NHGS+S
         IU1o1NWHJOElTKpc27I6qgDPowiDJrH7CkswobAAHo2iMjQhspHXL3/bwz2Vb/1spZVY
         Eq5X8ScpJ0+sMqO8VmY4SCrXGnQDX1cbh/yFaGcTcvaHzKFhsloo1oWMwbjxgL61r2HZ
         FdKHNzyXtTFjsAWQ7zIX8DAKOs8Br0SzBs2Y0gceCHItqBQd+RmBS0Zw/Ns0XAxJy6u4
         Xvi3GELfPKd+iG/b0IAmFExCmV+QM/F4Pr6kDcpR+gwuwUX7kimjW0ZZoF3j6n2elC7d
         3jXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.27.55;
        Wed, 27 Dec 2017 21:27:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751386AbdL1F1x (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:27:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3180 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751338AbdL1F1v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E7C2357E84DAD;
        Thu, 28 Dec 2017 13:27:37 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:31 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 5/9] target-arm: kvm64: inject synchronous External Abort
Date:   Thu, 28 Dec 2017 13:54:14 +0800
Message-ID: <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: sSXOJdCGwjW5

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
---
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
 target/arm/kvm64.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a16abc8..c00450d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -582,6 +582,71 @@ int kvm_arm_cpreg_level(uint64_t regidx)
     return KVM_PUT_RUNTIME_STATE;
 }
 
+static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
+{
+    int i;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        const ARMCPRegInfo *ri;
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            continue;
+        }
+
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+
+        if (ri->fieldoffset == fieldoffset) {
+            cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
+            return 0;
+        }
+    }
+    return -EINVAL;
+}
+
+/* Inject synchronous external abort */
+static void kvm_inject_arm_sea(CPUState *c)
+{
+    ARMCPU *cpu = ARM_CPU(c);
+    CPUARMState *env = &cpu->env;
+    unsigned long cpsr = pstate_read(env);
+    uint32_t esr, ret;
+
+    /* This exception is synchronous data abort*/
+    c->exception_index = EXCP_DATA_ABORT;
+    /* Inject the exception to guest El1 */
+    env->exception.target_el = 1;
+    CPUClass *cc = CPU_GET_CLASS(c);
+
+    /* Set the DFSC to synchronous external abort and set FnV to not valid,
+     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
+     */
+    esr = (0x10 | (1 << 10));
+
+    /* This exception comes from lower or current exception level. */
+    if ((cpsr & 0xf) == PSTATE_MODE_EL0t) {
+        esr |= (EC_DATAABORT << ARM_EL_EC_SHIFT);
+    } else {
+        esr |= (EC_DATAABORT_SAME_EL << ARM_EL_EC_SHIFT);
+    }
+
+    /* For the AArch64, instruction length is 32-bit */
+    esr |= ARM_EL_IL;
+    env->exception.syndrome = esr;
+
+    cc->do_interrupt(c);
+
+    /* set ESR_EL1 */
+    ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.esr_el[1]));
+
+    if (ret) {
+        fprintf(stderr, "<%s> failed to set esr_el1\n", __func__);
+        abort();
+    }
+}
+
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
-- 
1.8.3.1
