Received: by 10.223.150.237 with SMTP id u100csp3629301wrb;
        Fri, 10 Nov 2017 03:14:50 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RQ7zfRb3E4P2ELFbXfPpfZzUDDawzQowKWkZntTNmpTjEKQkR92TxB1py41gkYVPHexbdN
X-Received: by 10.101.65.69 with SMTP id x5mr3786638pgp.102.1510312490361;
        Fri, 10 Nov 2017 03:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312490; cv=none;
        d=google.com; s=arc-20160816;
        b=cchyB7gfb+13z7+PHR4pdZglszcVUW6e53hCYcjBOERKEb5yTfXjd38SaCahRoSUF7
         5mqjgU9/h/kO+p1tp/P2HIJzHcK4bc6T/oGFlfk7R3ZTOkTL2SJFA7u6aA0p7KJRCOga
         y/xPhhcjaDHoffBhYDpz4nPKsUHzcOrPMU6WgsceEMYUK06FpA5rWWPqilDWoyIhehv7
         DCPG6Vc4d+R2eL0oQpY+pmz6wEMzWnpXYPpe036LHPDeNs3IUvtt2YQDZ3rB5pxx5RM5
         Vfr4bupoFYAu5wiAn7t8nM/YLDhFzNkXt1vWM7SGbMdqE/9JV8R2g+QGwwkymhfIebhw
         voSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=ljIS4qYR3lEpApqyXeNEqD3m4FjDpk2TXVQeYDMafIY=;
        b=jbSNtR3xOL2taNbsvz2h0m1+Tqaxyl7gPsvqhemU6i2wjTIxI4louTEn4IwhvpvJWq
         /7uLKjYydrNadlk5KO0L8mVigfRnmi2kvoOtbu6HVXVqCCmd3jmS+SJMCPhYNTjByti1
         NEudQkQvWqr+Z6tmuJAyB/mRKwxZwewNF0jPlnjSOT3gar8sASudmrwsVRelnis04Ef7
         GLbIeMsGelID+aGjPTfj9Lp0Q42ISCU2E/ZiIAtk7MtfyWlotKGNrlW2WbfYRvM26KUo
         icV83ZnRzxDNsR/3PLN+4gJRAkv08DBST8hMWYHbWIoYQEBcOUZIgiP+0jajhI8UvKHa
         qb1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.50;
        Fri, 10 Nov 2017 03:14:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752978AbdKJLOa (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:30 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10504 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdKJLO2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:28 -0500
Received: from 172.30.72.60 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKR46788;
        Fri, 10 Nov 2017 19:14:16 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:04 +0800
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
Subject: [PATCH v12 07/12] target-arm: handle SError interrupt exception from the guest OS
Date:   Sat, 11 Nov 2017 03:19:46 +0800
Message-ID: <1510341591-22817-8-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090201.5A058A08.023F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 76c3e24c3094dd316989216882e89799
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9GYQX4dASMPF

When guest OS happens SError interrupt(SEI), it will trap to
host. Host check the Asynchronous Error Type(ESR_ELx.AET). If
it the error has not been propagated and has not (yet) been
architecturally consumed by the PE, it will return to use space
with error code KVM_SEI_SEV_RECOVERABLE.

Qemu receive this exception exit, check whether KVM support to
set ESR(exception syndrome registers) value. If support, it sets
the ESR value using a new IOCTL.

This handling is only supported in AArch64 platform, not supported
in AArch32 platform.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>

---
set ESR and inject SEI by userspace are suggested here:
https://lkml.org/lkml/2017/3/20/441
https://lkml.org/lkml/2017/3/20/516

Below is the log that Qemu inject SError with specify ESR and guest happen exception:

 Bad mode in Error handler detected, code 0xbe000c11 -- SError
 CPU: 0 PID: 539 Comm: devmem Tainted: G      D         4.1.0+ #20
 Hardware name: linux,dummy-virt (DT)
 task: ffffffc019aad600 ti: ffffffc008134000 task.ti: ffffffc008134000
 PC is at 0x405cc0
 LR is at 0x40ce80
 pc : [<0000000000405cc0>] lr : [<000000000040ce80>] pstate: 60000000
 sp : ffffffc008137ff0
 x29: 0000007fd9e80790 x28: 0000000000000000
 x27: 00000000000000ad x26: 000000000049c000
 x25: 000000000048904b x24: 000000000049c000
 x23: 0000000040600000 x22: 0000007fd9e808d0
 x21: 0000000000000002 x20: 0000000000000000
 x19: 0000000000000020 x18: 0000000000000000
 x17: 0000000000405cc0 x16: 000000000049c698
 x15: 0000000000005798 x14: 0000007f93875f1c
 x13: 0000007f93a8ccb0 x12: 0000000000000137
 x11: 0000000000000000 x10: 0000000000000000
 x9 : 0000000000000000 x8 : 00000000000000de
 x7 : 0000000000000000 x6 : 0000000000002000
 x5 : 0000000040600000 x4 : 0000000000000003
 x3 : 0000000000000001 x2 : 00000000000f123b
 x1 : 0000000000000008 x0 : 000000000047a048
---
 target/arm/internals.h |  4 ++++
 target/arm/kvm.c       |  3 +++
 target/arm/kvm32.c     |  6 ++++++
 target/arm/kvm64.c     | 34 ++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h   |  8 ++++++++
 5 files changed, 55 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1f6efef..cd26a9d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -233,9 +233,13 @@ enum arm_exception_class {
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
+#define ARM_EL_AET_SHIFT 10
 #define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
 #define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
 
+/* Asynchronous Error Type */
+#define KVM_SEI_SEV_RECOVERABLE 1
+
 /* Utility functions for constructing various kinds of syndrome value.
  * Note that in general we follow the AArch64 syndrome values; in a
  * few cases the value in HSR for exceptions taken to AArch32 Hyp
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7c17f0d..d85e36a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -593,6 +593,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_EXCEPTION:
+        kvm_arm_handle_exception(cs, run);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 069da0c..8ce56fd 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -493,6 +493,12 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     return false;
 }
 
+bool kvm_arm_handle_exception(CPUState *cs, struct kvm_run *run)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
+    return false;
+}
+
 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
                                   target_ulong len, int type)
 {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index af8ebc9..2d0eb32 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -986,3 +986,37 @@ static bool kvm_can_set_vcpu_esr(struct KVMState *state)
     int ret = kvm_check_extension(state, KVM_CAP_ARM_INJECT_SERROR_ESR);
     return (ret) ? true : false;
 }
+
+static bool kvm_inject_arm_sei(CPUState *cs, unsigned int error_code)
+{
+    int ret;
+    /* IMPLEMENTATION DEFINED syndrome by default */
+    uint32_t syndrome = ARM_EL_ISV;
+
+    if (kvm_can_set_vcpu_esr(cs->kvm_state)) {
+        if (error_code == KVM_SEI_SEV_RECOVERABLE) {
+            /* Set Recoverable Asynchronous SError interrupt Type */
+            syndrome = (3 << ARM_EL_AET_SHIFT) | 0x11;
+        }
+        ret = kvm_vcpu_ioctl(cs, KVM_ARM_INJECT_SERROR_ESR, &syndrome);
+        if (ret < 0) {
+            fprintf(stderr, "KVM_ARM_SET_SERROR_ESR failed: %s\n",
+                    strerror(-ret));
+            abort();
+        }
+
+        return true;
+    }
+
+    return false;
+}
+
+bool kvm_arm_handle_exception(CPUState *cs, struct kvm_run *run)
+{
+    int exception = run->ex.exception;
+    unsigned int error_code = run->ex.error_code;
+    if (exception == EC_SERROR) {
+        return kvm_inject_arm_sei(cs, error_code);
+    }
+    return false;
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 633d088..b2a7933 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -288,4 +288,12 @@ static inline const char *its_class_name(void)
     }
 }
 
+/**
+ * kvm_arm_handle_exception:
+ * @cs: CPUState
+ * @run: KVM RUN structure
+ *
+ * Returns: TRUE if the SError exception was successfully handled
+ */
+bool kvm_arm_handle_exception(CPUState *cs, struct kvm_run *run);
 #endif
-- 
1.8.3.1
