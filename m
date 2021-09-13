Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3606720lfb;
        Mon, 13 Sep 2021 05:10:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA/gCrx/ObPsmPzgat2/Ss1zSFzU8OVpA/BRm++19FCzHWSHlk1scrAI4pCxop8nzy2WnI
X-Received: by 2002:adf:f683:: with SMTP id v3mr8008606wrp.423.1631535036177;
        Mon, 13 Sep 2021 05:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631535036; cv=none;
        d=google.com; s=arc-20160816;
        b=xWO+QaT4LDFxpiQTWPRBHU/HjIc/xn5SHj3iYAj3pVYTZXDEeJJDaxEPjj2h2o8Ri8
         2IsSLRJcxIWpwJnrvsdAsHcFDseHXkeiiemx9NR5qH0nsmnSBENy75V3wRE/FYoLEFPl
         IMLzKhCE+lrNPuLupphdyfRyDAh1fRMO8R3vpSVJ7LW13YUxCb2O3JXWkAObyJKteqTw
         4HKgbnm7bBpSpWIKGskjJ0j86Gs8UPRzriJMIwP95b5xGmHdxjW1deA+r6o2xNiHOT9j
         XhHNT/Lm8G7pg+Lbw6zeppzFs7ZQ+jH+OPiirAQXLkgtvwf9/u1JXxo4dEMmamcIxYz/
         Yu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iPAx8/YL5hBqODvNbT1lZC6CVtwFOaHERZRoitHORgY=;
        b=m4EfKRldwPxooGVu7qgiZaHRNfWFNPbpvafI+dpC0iZkh9LaROANgJwxwC2wL9xpZQ
         wSHe7yv8Msccc8WKw2joxY39AJWgSoZh6Ch28axDYmgpMkIUf6JJSzi/PjYp27zJzEOM
         myQO7HtokAFZOPQa935qvaoM2ZRobwya2MY5ylbiEmIhiUV06EysTnm3denjyI35Nuaz
         AnOhDMKwL1rzCNFY8CiiIsODeTiuUNQ2P37IDLAP4KKx7f/0hNkId462QdTtKPIXJYcd
         SHleEL1ts6u0CPA2el0Nw1JoIvsiH1h/2p2SKJxpG+hlhLz7S7iKa2Fjm0C+s61+ZgEY
         H7Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25si1501420wmc.190.2021.09.13.05.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 05:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPknD-0005ae-4X
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 08:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPklX-0002PF-L3; Mon, 13 Sep 2021 08:08:52 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44062 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklU-0004jc-KY; Mon, 13 Sep 2021 08:08:51 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id C188B608061D;
 Mon, 13 Sep 2021 14:08:46 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 05/10] arm/hvf: Add a WFI handler
Date: Mon, 13 Sep 2021 14:08:37 +0200
Message-Id: <20210913120842.62116-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VsEPo2pDyik8

From: Peter Collingbourne <pcc@google.com>

Sleep on WFI until the VTIMER is due but allow ourselves to be woken
up on IPI.

In this implementation IPI is blocked on the CPU thread at startup and
pselect() is used to atomically unblock the signal and begin sleeping.
The signal is sent unconditionally so there's no need to worry about
races between actually sleeping and the "we think we're sleeping"
state. It may lead to an extra wakeup but that's better than missing
it entirely.

Signed-off-by: Peter Collingbourne <pcc@google.com>
[agraf: Remove unused 'set' variable, always advance PC on WFX trap,
        support vm stop / continue operations and cntv offsets]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>

---

v6 -> v7:

  - Move WFI into function
  - Improve comment wording

v8 -> v9:

  - Add support for cntv offsets
  - Improve code readability
---
 accel/hvf/hvf-accel-ops.c |  5 ++-
 include/sysemu/hvf_int.h  |  1 +
 target/arm/hvf/hvf.c      | 76 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 4f75927a8e..93976f4ece 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -370,15 +370,14 @@ static int hvf_init_vcpu(CPUState *cpu)
     cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
 
     /* init cpu signals */
-    sigset_t set;
     struct sigaction sigact;
 
     memset(&sigact, 0, sizeof(sigact));
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 7c245c7b11..6545f7cd61 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -52,6 +52,7 @@ struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
     bool vtimer_masked;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index e052a4ef27..3f7c005d35 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -490,6 +491,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -608,6 +610,77 @@ static uint64_t hvf_vtimer_val_raw(void)
     return mach_absolute_time() - hvf_state->vtimer_offset;
 }
 
+static uint64_t hvf_vtimer_val(void)
+{
+    if (!runstate_is_running()) {
+        /* VM is paused, the vtimer value is in vtimer.vtimer_val */
+        return vtimer.vtimer_val;
+    }
+
+    return hvf_vtimer_val_raw();
+}
+
+static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
+{
+    /*
+     * Use pselect to sleep so that other threads can IPI us while we're
+     * sleeping.
+     */
+    qatomic_mb_set(&cpu->thread_kicked, false);
+    qemu_mutex_unlock_iothread();
+    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    qemu_mutex_lock_iothread();
+}
+
+static void hvf_wfi(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    hv_return_t r;
+    uint64_t ctl;
+    uint64_t cval;
+    int64_t ticks_to_sleep;
+    uint64_t seconds;
+    uint64_t nanos;
+
+    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
+        /* Interrupt pending, no need to wait */
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    assert_hvf_ok(r);
+
+    if (!(ctl & 1) || (ctl & 2)) {
+        /* Timer disabled or masked, just wait for an IPI. */
+        hvf_wait_for_ipi(cpu, NULL);
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+    assert_hvf_ok(r);
+
+    ticks_to_sleep = cval - hvf_vtimer_val();
+    if (ticks_to_sleep < 0) {
+        return;
+    }
+
+    nanos = ticks_to_sleep * gt_cntfrq_period_ns(arm_cpu);
+    seconds = nanos / NANOSECONDS_PER_SECOND;
+    nanos -= (seconds * NANOSECONDS_PER_SECOND);
+
+    /*
+     * Don't sleep for less than the time a context switch would take,
+     * so that we can satisfy fast timer requests on the same CPU.
+     * Measurements on M1 show the sweet spot to be ~2ms.
+     */
+    if (!seconds && nanos < (2 * SCALE_MS)) {
+        return;
+    }
+
+    struct timespec ts = { seconds, nanos };
+    hvf_wait_for_ipi(cpu, &ts);
+}
+
 static void hvf_sync_vtimer(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -728,6 +801,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
     case EC_WFX_TRAP:
         advance_pc = true;
+        if (!(syndrome & WFX_IS_WFE)) {
+            hvf_wfi(cpu);
+        }
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-- 
2.30.1 (Apple Git-130)

