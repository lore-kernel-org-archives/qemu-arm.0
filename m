Received: by 10.223.159.82 with SMTP id f18csp507546wrg;
        Tue, 21 Nov 2017 02:32:29 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaEGbWB1ny5+GWDQxKQaa7xb35todwKFwc+6xJA5T2AVA0P0t7RG9NaToJ0lv0hhFWemo+s
X-Received: by 10.84.194.228 with SMTP id h91mr8692803pld.177.1511260349489;
        Tue, 21 Nov 2017 02:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260349; cv=none;
        d=google.com; s=arc-20160816;
        b=EnxyHhyBkfB8/rMbU5DmwKExpKIjqSlSLpqN1ZpNuWgiTAoGawK7xPuzCSxfONcjAo
         WVyAQb+8AMCtZMp2yb0TGruR1e4Pf1Iqmbb7v/eJiEf5phZ0zfkJ3IN/eFJRNKdzY+io
         SonCQy7v1tmSdzPAaMkdW2Wt/VlcViNeeKmWbv/1QIeRrNPnFmVEa/z/HUzQDkLZnTxJ
         8SGEHerH8MjrWklnDM1LWkT4D4b9qyC+swery+Klg3Tep7uzom7ADIz4HMVnz0DJ6SR4
         VRyv6oogUzDs+y23EiwjayzlEeTKJjm3f8+/eVvbbi3A9LLy9in2DD2AIq3uCwqrwy92
         JChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=zVen2lGUqU6FJcJmH0QesOrbdZceaJnNzs/UFPrhH0E=;
        b=o9RrVayz8CX3F8JS/Yvb2NVKfCbHjCFZHDT0NADkpBzRADY0WHioj9yntaq57nHG/D
         21gUyXeqOb+wks4mR0jQe+b6D8SJ/pSCcDQwcgBxpet27V42OY04bMlZ+13/GkHLilYk
         4yFnu8cwebXl5BE/ZP3BZqtRxBQ2+kkGP8nWX2/MN0VvQLxjP/705kELCwc5CEHHUOgV
         pqUaFd/4vTHGMbSJN1RX139TDyfuvB/hRPCTXZbNzDlXOypd8UPnHXXcPlw9Zu0sjXWw
         eNGaUwHFdOcHZkz41XS37Krt2DuPHTKpxWhB4zOtDPTssiC9coWX8IPa2RncTwtY9CPY
         LADA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.29;
        Tue, 21 Nov 2017 02:32:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752035AbdKUKcS (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:32:18 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10966 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752000AbdKUKby (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:54 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39790;
        Tue, 21 Nov 2017 18:31:45 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:37 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 08/12] target-arm: kvm64: inject synchronous External Abort
Date:   Wed, 22 Nov 2017 02:37:10 +0800
Message-ID: <1511289434-1551-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020203.5A140091.0133,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 80a448c21535b32b5437eea9fc9bb299
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1uUOAvuo2mV3

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
Marc is against that KVM inject the synchronous external abort(SEA) in [1],
so user space how to inject it. The log that Qemu injects SEA to guest is
shown in [2].

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
