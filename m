Received: by 10.223.150.237 with SMTP id u100csp3628950wrb;
        Fri, 10 Nov 2017 03:14:30 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SufEB/a7Oi39zhEPyq36F8otp1VjKolGl/R8trFyR6wtIZdRLlBwz4sOBklnzsEm5YVPN8
X-Received: by 10.98.87.207 with SMTP id i76mr4118633pfj.134.1510312470443;
        Fri, 10 Nov 2017 03:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312470; cv=none;
        d=google.com; s=arc-20160816;
        b=gljC8ZUDqQiegZEeSMnpJnwKohpKiJdA49QtMlXeYMWovXMsh5XWMPex/yCV3XczMX
         pxfZXpl/g82vAHl7x676DVaIKdpdKhi1mnewDAZ/OrXQW0wtAZ+fqbWENStYX3DBhQkv
         ts78YxxrsA1+jTDUVrLT0tfbgNOLVPY/x8a4b9yefZ2Vpcl5nxCaxh6rTgNKTcrwN/fT
         ixH4c36JjcwygBuBT54l+m5KfoLiEHpiNXcg4MGT6SDBRC5p0nC0R0I3SSI3tVArr1KE
         Sgtxe2qiZaTWNhlAIdg6DHJOEnZSPUsSb3QZO9/Rf0npqwhj4okL/pMN5dcvhm32S1jT
         e+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=0nCL0eTxK5xxFIMNBexDEUbONnhKeGRvdgnN1jepICs=;
        b=EFE/AWY+jlANZ7dlmlJpOSvyTF6RBD8Rx+gGPRe4otOuRzwkemte5ja5q4lQ2ZsOGU
         pk900h5Sa8dCkZuZTwv5oRaLPftDtqDM2FjorSgv96LzbD1BzlqL1+4OG88UoF9WO9Rp
         1xDEEN018DzbMMfuW2a42lU0cj8RrMY8iB5pnm/EFf18Z2SJIDboBw5saGCy7WIaLMKa
         owREQ3vcdUZdLTStLRozPSdxqN81GWrDt+vyxA7ScW/8S9GNwXee7eEkXCMTS2d/m98u
         /PynE58EHaxfmZdRh0FEsZHeesAU3o/yiwq/Ba4izmOnhBCWm/PHl9YDxOdhPy6C2ymV
         htCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.30;
        Fri, 10 Nov 2017 03:14:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752943AbdKJLO2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10505 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751664AbdKJLO0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:26 -0500
Received: from 172.30.72.60 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKR46776;
        Fri, 10 Nov 2017 19:14:15 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:05 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 08/12] target-arm: kvm64: inject synchronous External Abort
Date:   Sat, 11 Nov 2017 03:19:47 +0800
Message-ID: <1510341591-22817-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.5A058A08.01E4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7d825eee9438cc6fdcbef3c470c26578
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: r6PySSrNt2ZT

Add synchronous external abort injection logic, setup
spsr_elx, esr_elx, PSTATE, elr_elx etc, when switch to
guest, guest will jump to the synchronous external abort
vector table entry.

The ESR_ELx.DFSC is set to Synchronous external abort(0x10),
and ESR_ELx.FnV is set to not valid(0x1), which will tell
guest that FAR is not valid and holds an UNKNOWN value.

These value will be set to KVM related structure through
KVM_SET_ONE_REG IOCTL.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>

---
People is against that KVM inject the SEA, so userspace how to
inject it:

https://lkml.org/lkml/2017/3/2/110

Below is the log that Qemu injects SEA and guest happen synchronous external abort

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
 target/arm/kvm64.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 2d0eb32..7f662e9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -582,6 +582,70 @@ int kvm_arm_cpreg_level(uint64_t regidx)
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
+    c->exception_index = EXCP_DATA_ABORT;
+    /* Inject the exception to El1 */
+    env->exception.target_el = 1;
+    CPUClass *cc = CPU_GET_CLASS(c);
+
+    /* Set the DFSC to Synchronous external abort and FnV to not valid,
+     * this will tell guest the FAR_EL1 is UNKNOWN.
+     */
+    esr = (0x10 | (1 << 10));
+
+    /* This exception is EL0 or EL1 fault. */
+    if ((cpsr & 0xf) == PSTATE_MODE_EL0t) {
+        esr |= (EC_DATAABORT << ARM_EL_EC_SHIFT);
+    } else {
+        esr |= (EC_DATAABORT_SAME_EL << ARM_EL_EC_SHIFT);
+    }
+
+    /* In the aarch64, there is only 32-bit instruction*/
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
