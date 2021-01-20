Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp399777lfq;
        Wed, 20 Jan 2021 14:54:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYQ+4Dgaa/ltDh1o8wxKT+20IktDbuvhB3bdk3IUbtjiWijDYsuVhz71HFpywzA1qTiy2P
X-Received: by 2002:a25:9746:: with SMTP id h6mr16615104ybo.81.1611183252345;
        Wed, 20 Jan 2021 14:54:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611183252; cv=none;
        d=google.com; s=arc-20160816;
        b=hfptcgcJp62zgfux7zk0djFdh8uR91Yjt0pdy9zhbLxQ5oRpj6vXRupdoIz00oYIhA
         j/Fzv2r57pOnxC/rLPEgjaHZN59OjD6MfgFsMiYrvavJHliCFUF0bMMNEk4hZ16KjjlL
         W4xZRq5OXDLwElxqJ9szIfi+3VtS9Q7g90VW7R3ICj0I7qpJDnqg+ZntTPIAycHiRuGP
         vM48FEftEfBlW/OBEUz4ftwxM45xNv62LjVYkQH4+mvFYbLLMP4b64eWp5HH9oMK3Xa2
         3XuHkomJ/h7omttBONDYyxn81R/B4/XcnxNnu3O0ZI3DlmNWhMVwVpyTls+g5zFoOtRt
         R2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qgrGzpxaiQYIa5XffmkzWvupF+SxqwfXnVOaJOYl4lA=;
        b=GguuNxQsgQMAOeRktvpJjkiAdzA7uivC0jM6bLzkXMwZdEpDbK5LipEtvlOpx1MUHa
         R3Mq7/OuQn+auP9/D2v0lSRBjVRwBVF29mm6e0kXWsmAXdOu7jDK/49uHSiVlC+svG4C
         BAnscDe4rg0IHw1/L8Xkvo43nf7qeXXbdxwbviolWfA79QWw6vLdb11SA2GDyyna9uxt
         +j2i4hZQ27IxAzSIzRWI+SXsyNJIbUVsPVXWeTW718P0g9quwPz5XrRzF4e9UqIdzK1f
         HRi3nH4I+OGA4IwSnTQ4aZqcoTojlEmmojkVqufT05z9z5If2OmaY5CB7Zd0oEakeEEZ
         fxrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e197si2994882ybb.269.2021.01.20.14.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 14:54:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2MMd-0003o6-NV
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 17:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l2MDk-0003vn-4z; Wed, 20 Jan 2021 17:45:00 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45230
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l2MDg-0001WS-Ux; Wed, 20 Jan 2021 17:44:59 -0500
Received: from localhost.localdomain
 (dynamic-077-002-091-253.77.2.pool.telefonica.de [77.2.91.253])
 by csgraf.de (Postfix) with ESMTPSA id 81B0B390057D;
 Wed, 20 Jan 2021 23:44:51 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/11] arm/hvf: Add a WFI handler
Date: Wed, 20 Jan 2021 23:44:42 +0100
Message-Id: <20210120224444.71840-10-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
References: <20210120224444.71840-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/bw6Iar5NO3

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
[agraf: Remove unused 'set' variable, always advance PC on WFX trap]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 accel/hvf/hvf-cpus.c     |  5 ++--
 include/sysemu/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 6d70ee742e..abef6a58f7 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -322,15 +322,14 @@ static int hvf_init_vcpu(CPUState *cpu)
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
index c2ac6c8f97..7a397fe85a 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -51,6 +51,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8f18efe856..f0850ab14a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -17,6 +18,8 @@
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
 
+#include <mach/mach_time.h>
+
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
@@ -411,6 +414,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -466,6 +470,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
     return 0;
 }
 
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
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -577,6 +593,46 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
         case EC_WFX_TRAP:
             advance_pc = true;
+            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
+                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+
+                uint64_t ctl;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                                        &ctl);
+                assert_hvf_ok(r);
+
+                if (!(ctl & 1) || (ctl & 2)) {
+                    /* Timer disabled or masked, just wait for an IPI. */
+                    hvf_wait_for_ipi(cpu, NULL);
+                    break;
+                }
+
+                uint64_t cval;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                                        &cval);
+                assert_hvf_ok(r);
+
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
+                }
+
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+
+                /*
+                 * Don't sleep for less than 2ms. This is believed to improve
+                 * latency of message passing workloads.
+                 */
+                if (!seconds && nanos < 2000000) {
+                    break;
+                }
+
+                struct timespec ts = { seconds, nanos };
+                hvf_wait_for_ipi(cpu, &ts);
+            }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-- 
2.24.3 (Apple Git-128)

