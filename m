Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp110708wrs;
        Mon, 11 Mar 2019 23:10:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrB3yOdZa3x0Jc1/UulkhtUVSBWzHOxVOX1UnSO9T7M1itLk2p8Piewc5IyMY5DwPbP6Y6
X-Received: by 2002:a81:66d6:: with SMTP id a205mr17665410ywc.156.1552371059866;
        Mon, 11 Mar 2019 23:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552371059; cv=none;
        d=google.com; s=arc-20160816;
        b=rCuCTNU9XFski/RQ/r1SGBHqEzgXR+GfU4wPD+eoTuFT+aRW6YGaoHBol0HeGllswe
         mksMB5gNtnbRN1ekDdw66gB62EF6UCGQyKLz+Tzg+23/sYfqBd9pBAMWh5IPtEHBQukV
         hQvHuIYH3P/9nR97MyCeCV8pOJX/Bb0u7BO+ksNIqwlDZMTooNB7CGCNW1gIga9J8Q3a
         eEksbs3bXWoOvYwD9JL9PibSOJn0C/H/Ud+V08z3EK9AvfNGks1/k+VIZGmNkO3GtpqY
         PDH5ic84HTw/rqZOLS2iHjfj0Ti+vN3nOdRU+HelmcYMnPTtAOvlT7nbDNz4gY2YH89S
         TzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=Xp6gTZNEH8x6mzCJkxt7ePeafiB2dGk/rKh2fH0ZR3U=;
        b=YY/xyN6Xys1a4EZu+5iAxTsZPgo+rxkI+gbV9nU71vN9UxtXDUePd1diI0EKPCsvYY
         pvc1lBJju3NCZDnwLvODmxpPqJRlWtTbRuEXPVpoRnQz57pB9OeGnSxo1n/gpkdt8crN
         DcKeyAxwWQKLtCeAyraYOGgWTm85RpJWkb6nTBadYLZr1J3lnr7kVys1E11+KBZKa4uY
         7HPt9ykzgwasjofyiAE0XrJVqU+8jKvg2Q2uxYo+31htDDsmYvHju2KAyf9+mbx7FCMy
         kbIjGMN8C94X7gC1WhOUG2bWUpZWBdMg2wlOax0YGPhgJB0S1O17EZl1mvMBDYH6CsXQ
         /Gsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si4278281ywa.284.2019.03.11.23.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 23:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3act-0002Gu-AC
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 02:10:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3ack-0002Ge-RR
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 02:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3ach-0008Hp-Dm
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 02:10:50 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2247 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h3acg-0008Dh-W1; Tue, 12 Mar 2019 02:10:47 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id A3701D17258761CE2A13;
	Tue, 12 Mar 2019 14:10:38 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 12 Mar 2019 14:10:30 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Tue, 12 Mar 2019 14:09:20 +0800
Message-ID: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
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
X-TUID: ep+f5xR6H+zf

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
 target/arm/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 96f0ff0..7bbba3d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -896,6 +896,60 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
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
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -906,6 +960,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
+    /*
+     * Only add change state handler for arch timer once, for KVM will help to
+     * synchronize virtual timer of all VCPUs.
+     */
+    static bool arch_timer_change_state_handler_added;
+
     /* If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
@@ -1181,6 +1241,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     init_cpreg_list(cpu);
 
+    if (!arch_timer_change_state_handler_added && kvm_enabled()) {
+        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
+        arch_timer_change_state_handler_added = true;
+    }
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         cs->num_ases = 2;
-- 
1.8.3.1

