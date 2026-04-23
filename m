Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A271FDEE2B
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:05:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxTu-0002lY-7H; Thu, 23 Apr 2026 13:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxTL-0001ho-TB
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxTI-0005lX-JV
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so32295715e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963850; x=1777568650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrWv8gw/u68HSJbd/POGgEkEDudbWbGUOlVbg7Qyl6w=;
 b=nGn0SSrqsxYb4gNkZgaYMe8+7TeYcPVj3TR2+XSGmx7IqWNwkvXjKTgo0oJtgIAXxi
 jG5KigKuBhE+vj1+Is/2oWCISvfER6yzrsSFO+Y1d2bAPaV6Kh/wrgude5Vlehi2OSX8
 p2E/PR5WjOPb+jC87we0K0EOD4xyOqWLn5SmJ0cGpjEn82DYzDMFHcOLkLH8mve14tHN
 tCyieQJMkSa79t2u6Prj1lf8+QIGGev7UWmSCGVJkcGIGZ65zGcIQPyO2PcjHwnZBcRa
 qYA0zfWnXWz356rI1j1p9dztt2DVdrKXBr12wwSry5lY5fhJ2p/4PdN2/d7aw35dVKJD
 QqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963850; x=1777568650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RrWv8gw/u68HSJbd/POGgEkEDudbWbGUOlVbg7Qyl6w=;
 b=qXFQhendg7/Ezl52L814NqlVs4WJAy6NIoFcUed29J9piBzcV81v33thwa8Td3pAVw
 BH7FFrOXXFri9zFPYh0MCnsHLMOgqgdQQXkZADMIWdGpp59EOl+Qxfp+xe3J3l8dzK9F
 0X7HLuYbs3bLd/ZtsysDSmR78CZuaMqzcMVDPCEweQO5UuIjOfTbA22eELlCaWVjKqnd
 MKAULKd2l5+wv/ZFtCNS3mvrOUKfWD4nD1xTmTbu85fk6RJMPIPVsmCZiKLh4SajSRCu
 5wNfEhCGQteL95nT9S6fOIYmSTHjZO7RmQqR0VFlruq+Yof5LIf8Ee5o/9sufZx7pJvn
 crqQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8i+SZwwTdNDez2hK3b5YfVjrzXSOR/CyZmJWEYWfpnQUjcuNiFjjckhtpipxTCU4OIg2wAMW6Isg==@nongnu.org
X-Gm-Message-State: AOJu0YxstKz3rb2DQgKqxb0zPI8RmrlQVDcFMUbZbT4PqSLYexuz1IDQ
 5Qkxg51RGFaIJr1fFZJaJmqOMkIYEy3yEl+pQCY/j6HR0ssNs3RDNFMrLwdDIAAQEbo=
X-Gm-Gg: AeBDieuUHgZjfjbHkpPWCju4RNr8neUoRgi8el1QRzrVdLF/f/745krO5vz1NxMAfgo
 FZrdNXUAUvjTeugt28kxR/Gkwb02M5+OCYBZWAnpNKOpmZBHsP93dVseiWczU3cB7pUH5PKt4Fx
 wU6vxRI6V/quqkdw20YpEfUuGhYpzOOAWIZuaOIJAp3iOSadi61RxXyallsOwf7xay/uiIJ6N0M
 03+Zzaw8x3u4OXHw7uKBqfNtTgJlQVx7SfO7JFzAfeVaNI9efNkK9exGh87mQSAts8ISdl1MIsQ
 WTOAO7h8lzk5ynoW13VK8cZVf1X+2kdWiss6FQhY4AL+dy1aXCNMZpLUQ9SrXX2f24uVs0PLQPR
 w7zlDtC5dHHY4edBl9XjMXJdZYZnQ5VltTCRAyOsn5BVhlUn5ZvYGeAIcqZYMEWdxg0k4kc6QTY
 NvM/I1g3GqIXQjDJmAisEcA2+VtrjBL4ElF7+g5KuPHn0M9C8D+JIWLnW9WsXmjFxNJLihhe4pT
 UXMXzhwTqs=
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id
 5b1f17b1804b1-488fb8b9deamr320043925e9.13.1776963849896; 
 Thu, 23 Apr 2026 10:04:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891b46cffasm353820325e9.13.2026.04.23.10.04.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 "Scott J. Goldman" <scottjgo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 13/16] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
Date: Thu, 23 Apr 2026 19:02:25 +0200
Message-ID: <20260423170229.64655-14-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: "Scott J. Goldman" <scottjgo@gmail.com>

Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
changed hvf_wfi() from blocking the vCPU thread with pselect() to
returning EXCP_HLT, intending QEMU's main event loop to handle the
idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
always returns false and the vCPU thread spins at 100% CPU per core
while the guest is idle.

Fix this by:

1. Setting cpu->halted = 1 in hvf_wfi() so the vCPU thread sleeps on
   halt_cond in qemu_process_cpu_events().

2. Arming a host-side QEMU_CLOCK_HOST timer to fire when the guest's
   virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
   because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
   hv_vcpu_run(), which is not called while the CPU is halted. The
   timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
   vtimer IRQ through the GIC and marks vtimer_masked, causing the
   interrupt delivery chain to wake the vCPU via qemu_cpu_kick().

3. Clearing cpu->halted in hvf_arch_vcpu_exec() when cpu_has_work()
   indicates a pending interrupt, and cancelling the WFI timer.

Fixes: b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Message-ID: <20260410055045.63001-1-scottjgo@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 65 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 2621164cb22..df13cc650fd 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -48,6 +48,7 @@ struct AccelCPUState {
     hv_vcpu_exit_t *exit;
     bool vtimer_masked;
     bool guest_debug_enabled;
+    QEMUTimer *wfi_timer;
 #endif
 };
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f2c5bde5983..33595bac72c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -28,6 +28,7 @@
 #include "hw/core/boards.h"
 #include "hw/core/irq.h"
 #include "qemu/main-loop.h"
+#include "qemu/timer.h"
 #include "system/cpus.h"
 #include "arm-powerctl.h"
 #include "target/arm/cpu.h"
@@ -301,6 +302,8 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
+static void hvf_wfi_timer_cb(void *opaque);
+
 static uint32_t chosen_ipa_bit_size;
 
 typedef struct HVFVTimer {
@@ -1218,6 +1221,9 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
     hv_return_t ret;
 
+    timer_free(cpu->accel->wfi_timer);
+    cpu->accel->wfi_timer = NULL;
+
     ret = hv_vcpu_destroy(cpu->accel->fd);
     assert_hvf_ok(ret);
 }
@@ -1356,6 +1362,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    cpu->accel->wfi_timer = timer_new_ns(QEMU_CLOCK_HOST,
+                                          hvf_wfi_timer_cb, cpu);
+
     aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
@@ -2031,8 +2040,30 @@ static uint64_t hvf_vtimer_val_raw(void)
     return mach_absolute_time() - hvf_state->vtimer_offset;
 }
 
+static void hvf_wfi_timer_cb(void *opaque)
+{
+    CPUState *cpu = opaque;
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+
+    /*
+     * vtimer expired while the CPU was halted for WFI.
+     * Mirror HV_EXIT_REASON_VTIMER_ACTIVATED: raise the vtimer
+     * interrupt and mark as masked so hvf_sync_vtimer() will
+     * check and unmask when the guest handles it.
+     *
+     * The interrupt delivery chain (GIC -> cpu_interrupt ->
+     * qemu_cpu_kick) wakes the vCPU thread from halt_cond.
+     */
+    qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+    cpu->accel->vtimer_masked = true;
+}
+
 static int hvf_wfi(CPUState *cpu)
 {
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    uint64_t ctl, cval;
+    hv_return_t r;
+
     if (cpu_has_work(cpu)) {
         /*
          * Don't bother to go into our "low power state" if
@@ -2041,6 +2072,34 @@ static int hvf_wfi(CPUState *cpu)
         return 0;
     }
 
+    /*
+     * Set up a host-side timer to wake us when the vtimer expires.
+     * HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
+     * hv_vcpu_run(), which we won't call while halted.
+     */
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    assert_hvf_ok(r);
+
+    if ((ctl & TMR_CTL_ENABLE) && !(ctl & TMR_CTL_IMASK)) {
+        r = hv_vcpu_get_sys_reg(cpu->accel->fd,
+                                HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+        assert_hvf_ok(r);
+
+        uint64_t now = hvf_vtimer_val_raw();
+        if (cval <= now) {
+            /* Timer already expired, don't halt */
+            return 0;
+        }
+
+        uint64_t delta_ticks = cval - now;
+        int64_t delta_ns = delta_ticks * NANOSECONDS_PER_SECOND
+                           / arm_cpu->gt_cntfrq_hz;
+        int64_t deadline = qemu_clock_get_ns(QEMU_CLOCK_HOST) + delta_ns;
+
+        timer_mod(cpu->accel->wfi_timer, deadline);
+    }
+
+    cpu->halted = 1;
     return EXCP_HLT;
 }
 
@@ -2334,7 +2393,11 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     hv_return_t r;
 
     if (cpu->halted) {
-        return EXCP_HLT;
+        if (!cpu_has_work(cpu)) {
+            return EXCP_HLT;
+        }
+        cpu->halted = 0;
+        timer_del(cpu->accel->wfi_timer);
     }
 
     flush_cpu_state(cpu);
-- 
2.53.0


