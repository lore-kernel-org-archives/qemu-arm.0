Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp197900wrs;
        Tue, 12 Mar 2019 01:09:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzmd15/69MVLOap8vEf1f4CtOCvGDZjM7XKLZVNNfyQ/fWMDhr1F4AqrKTzsTKwlN674nC
X-Received: by 2002:a25:2b09:: with SMTP id r9mr27206430ybr.353.1552378185502;
        Tue, 12 Mar 2019 01:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552378185; cv=none;
        d=google.com; s=arc-20160816;
        b=caAlE7h+i/rZZIOlddUPh3SM3x6zAKUpxu32d+EKm9G+dEqLaPACZYbr6jpbqta02a
         8ebrTqet1WEVG745RjUqh/3iZzUdam6eHGoC6//wwDSXmc0zRwTx46Q9/nc9v11+JtmB
         T0PtS9J1/bUG6xK5PFXl3BZFz2GurlKeJZ1nxzzRiI1U8WxdD7VhBCdvvuTH4zPuYl8O
         NKPMtwJVmHuFcAulwmD4iVehsumP6oYtmvXTqq1+8LVOpgr1efDb9mBAM0Kv8sVkteaS
         E9phqcZ5/0wCo+ijqN8MIgNaNOca8qdUwbzhcQRp8eZHzqQk2bCeIVt+CUA8MhnuxJDo
         BbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=6Q5joQEK5LNLiUeZiEuIsf2qyLz6LFHSIFSkgFtGA9I=;
        b=WXxFduCGws0659bAYDtTfhC6pBntf8ilWW3FVm3v3zcGOP7HjG0bZxxw9gpCW+gGuH
         XhMfsXm5aUBSboFtOe7G4V9uI0qurs3f2wvLUUABD+OaDJTskSZIVKtMFpyRhLlo1FTJ
         Mb3mwKC3GPTECcciSY7f3Uyp2s9O37Yvec1KJMF4vUlBbRVD6aRjjpYoRNVn9NxYBUdb
         WggWfSf77zUCE3HRJo6tqoPTNQNopxBKspPzNHactouZmvsRHEgfi6XO1GOf3Z+0sVjD
         v0K995TXSfTs8Ao4Zl07c3jAtCrR01UU6Ptwly0zurnZekgDgS0sIzWFKMYbyf6x0XNV
         UCdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si4310904ybg.326.2019.03.12.01.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 01:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3cTo-0006qf-PD
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 04:09:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3cTW-0006hs-MB
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 04:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3cJG-000879-Rk
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:58:54 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2248 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h3cJG-00084J-FS; Tue, 12 Mar 2019 03:58:50 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 17827E147CC62515C01F;
	Tue, 12 Mar 2019 15:58:47 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 12 Mar 2019 15:58:37 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Tue, 12 Mar 2019 15:57:19 +0800
Message-ID: <1552377439-24640-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC] arm/cpu: fix soft lockup panic after resuming from
 stop
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2O+n4hobhh3C

When we stop a VM for more than 30 seconds and then resume it, by qemu
monitor command "stop" and "cont", Linux on VM will complain of "soft
lockup - CPU#x stuck for xxs!" as below:

[ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
[ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
[ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
[ 2783.809563] Modules linked in...

This is because Guest Linux uses generic timer virtual counter as
a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
by qemu.

This patch is to fix this issue by saving the value of CNTVCT_EL0 when
stopping and restoring it when resuming.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 target/arm/kvm.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 79a79f0..73b9ecb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -39,11 +39,77 @@ static bool cap_has_inject_serror_esr;
 
 static ARMHostCPUFeatures arm_host_cpu_features;
 
+static int get_vcpu_timer_tick(CPUState *cs, uint64_t *tick_at_pause)
+{
+    int err;
+    struct kvm_one_reg reg;
+
+    reg.id = KVM_REG_ARM_TIMER_CNT;
+    reg.addr = (uintptr_t) tick_at_pause;
+
+    err = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    return err;
+}
+
+static int set_vcpu_timer_tick(CPUState *cs, uint64_t tick_at_pause)
+{
+    int err;
+    struct kvm_one_reg reg;
+
+    reg.id = KVM_REG_ARM_TIMER_CNT;
+    reg.addr = (uintptr_t) &tick_at_pause;
+
+    err = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    return err;
+}
+
+static void arch_timer_change_state_handler(void *opaque, int running,
+                                            RunState state)
+{
+    static uint64_t hw_ticks_at_paused;
+    static RunState pre_state = RUN_STATE__MAX;
+    int err;
+    CPUState *cs = (CPUState *)opaque;
+
+    switch (state) {
+    case RUN_STATE_PAUSED:
+        err = get_vcpu_timer_tick(cs, &hw_ticks_at_paused);
+        if (err) {
+            error_report("Get vcpu timer tick failed: %d", err);
+        }
+        break;
+    case RUN_STATE_RUNNING:
+        if (pre_state == RUN_STATE_PAUSED) {
+            err = set_vcpu_timer_tick(cs, hw_ticks_at_paused);
+            if (err) {
+                error_report("Resume vcpu timer tick failed: %d", err);
+            }
+        }
+        break;
+    default:
+        break;
+    }
+
+    pre_state = state;
+}
+
 int kvm_arm_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_vcpu_init init;
 
+    /*
+     * Only add change state handler for arch timer once, for KVM will help to
+     * synchronize virtual timer of all VCPUs.
+     */
+    static bool arch_timer_change_state_handler_added;
+
+
+    if (!arch_timer_change_state_handler_added) {
+        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
+        arch_timer_change_state_handler_added = true;
+    }
+
     init.target = cpu->kvm_target;
     memcpy(init.features, cpu->kvm_init_features, sizeof(init.features));
 
-- 
1.8.3.1

