Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp671877lfa;
        Thu, 15 Oct 2020 08:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7AEzX+Wa2QI9yrEAsEMtbEAtI4U/f5NX9c+pwQp7MzpJ8/aN6UhFh/1w4gU5G4BxYzoVU
X-Received: by 2002:a05:620a:21da:: with SMTP id h26mr4410375qka.123.1602775129068;
        Thu, 15 Oct 2020 08:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602775129; cv=none;
        d=google.com; s=arc-20160816;
        b=qkYoKNlqJfX3aOLkeQCYyXA6uHlJ/BP5K8tfXIQZm25zPA8YeU/11s98J+YUmzJU/n
         f8LrdFw7DtSw4FVUjUnZZCpHHGxgTlgumDc0u1L8GsJqmNNma7Y98bzPQc+lPu1inYa1
         JPRkv7spMziBc2zICRkL2iek7xGPwwtYrYZbqNNW/hwI8MzMhFrgC+S7ic6WDqY4WB6A
         43ZBY5HVPWuG/xe7rc1UlIABxnp2LQCHj10OEQ494IAc0VTWO1GkIXmbt+rmfzfSdSYW
         IM/ZT9vZcKNmVbw26JN463pKPzMztN9A260Sdyrl2H1CDiR3AyN7+lcG78bnJxNo/dtz
         Z6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K5iqhaoBhm+BUIzunqt9IAhyHHRHwxEr8NDWFaL6LdQ=;
        b=Q0nOZDKjBMBdue76cBuzFto96jICuxrhI+tWWEThwPTT1Wx8Vip4IxofQMYN0+0dSD
         8SlaRXzv30wMtgF1nSFOL4dsRUAQtuxz12d2Q8YxzV/2+QP9Gkk2RZq34eBc7cyg8+nt
         t4joU7jUtXYoP/bRGN7siWhH/p/yJdCbHHhLUDSlEai2/vQgoCg4yzeHMgBphmmEv69b
         S7d6j+u8gYCQpE7Pbowk1O4Tjpo54G2pf9s5pmEWTcX5tOheJFeld4xrxWM3TTbz2RhT
         6CJtznxn5rVojp9QLlXM+fNdE7BZz0dOz3lxEusWViZIT3/UlyC/oXeTjLCDQmhcb0/H
         opzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcqPxRhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si1600100qvx.189.2020.10.15.08.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 08:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcqPxRhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT51k-0003no-Dz
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 11:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT51Z-0003iK-Ax
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 11:18:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT51X-0005bD-Az
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 11:18:37 -0400
Received: by mail-wm1-x344.google.com with SMTP id l15so2076489wmh.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K5iqhaoBhm+BUIzunqt9IAhyHHRHwxEr8NDWFaL6LdQ=;
 b=jcqPxRhznjSN+r6hbhr2J6PVqR6Y0Muu39a6Mlbv39tMxJQjDPXken67Gj6C1s3Ak2
 TusEWl92UbXsaIxhe0huuRgz0JUWzMpDjySB3jhJqMCeSxXOKbeztECK4wK4Fi2RgOde
 rGM37BCeoUUcQRnNy5+okOg0bYTHvxa2CIJuvNeRGloKn0F2oeT8Cv/DQEpSWoqaNGrG
 u7G7GUXrhHCulmhIuRsZLRw/foxoAVoJM4ZT2RnOWgRkHJtF99mFSMUs5qV0R7cEJecb
 H5VIDgH8nr+Y2AO2IsP7jLya4viqT9KrscoA8d1PB/5IYVtwr1WIxFBC3qk2lQwbTokn
 u57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5iqhaoBhm+BUIzunqt9IAhyHHRHwxEr8NDWFaL6LdQ=;
 b=UJwEBK/3s1JCVGrTXqMx3B4RNgk/Kjmlb9YboiBQouN02YOaFWEUVkM7JZuJsga/aZ
 9aTOWW2WOtPzNjSVxKFjHtJR59+CuNGCdkmOJQ0w8os6D6JQaubtJq4DttcODWHLRPqZ
 aoFtvRy7wlOvhWo0e/MdOWS4pzfUO/piF3I1Dw/GYiiRVz4FsbeaEft5qgxJOykVNjDu
 P5adenE/y0lPcdqsB1GxoSuPPKMh6WSsT5yrS2jrc4W5ddjrpUg1q9tTUkWG9/tfAumW
 GaL1nl1ibj2S4aiymiSuI2CtrM9a4283mPfDhnp4lls2W4ApgZYfDaNxJZECkRZsz5VI
 rpzA==
X-Gm-Message-State: AOAM531+oHIaGRAsaRK7A5yhSIZvvm4B3zSiiOFdzpujZmUc3M7hW9zy
 teC3dWSrD6ICXf+vE9uwB9SdvXMdXnx8obR5
X-Received: by 2002:a1c:6743:: with SMTP id b64mr4359265wmc.157.1602775113650; 
 Thu, 15 Oct 2020 08:18:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j13sm5193286wru.86.2020.10.15.08.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 08:18:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/timer/armv7m_systick: Rewrite to use ptimers
Date: Thu, 15 Oct 2020 16:18:29 +0100
Message-Id: <20201015151829.14656-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015151829.14656-1-peter.maydell@linaro.org>
References: <20201015151829.14656-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M4SFwGzmw6Sd

The armv7m systick timer is a 24-bit decrementing, wrap-on-zero,
clear-on-write counter. Our current implementation has various
bugs and dubious workarounds in it (for instance see
https://bugs.launchpad.net/qemu/+bug/1872237).

We have an implementation of a simple decrementing counter
and we put a lot of effort into making sure it handles the
interesting corner cases (like "spend a cycle at 0 before
reloading") -- ptimer.

Rewrite the systick timer to use a ptimer rather than
a raw QEMU timer.

Unfortunately this is a migration compatibility break,
which will affect all M-profile boards.

Among other bugs, this fixes
https://bugs.launchpad.net/qemu/+bug/1872237 :
now writes to SYST_CVR when the timer is enabled correctly
do nothing; when the timer is enabled via SYST_CSR.ENABLE,
the ptimer code will (because of POLICY_NO_IMMEDIATE_RELOAD)
arrange that after one timer tick the counter is reloaded
from SYST_RVR and then counts down from there, as the
architecture requires.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/armv7m_systick.h |   3 +-
 hw/timer/armv7m_systick.c         | 124 +++++++++++++-----------------
 2 files changed, 54 insertions(+), 73 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 97cb345ddb4..84496faaf96 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -14,6 +14,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "hw/ptimer.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
 
@@ -27,7 +28,7 @@ struct SysTickState {
     uint32_t control;
     uint32_t reload;
     int64_t tick;
-    QEMUTimer *timer;
+    ptimer_state *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
 };
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index a8cec7eb56b..2f192011eb0 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -39,26 +39,6 @@ static inline int64_t systick_scale(SysTickState *s)
     }
 }
 
-static void systick_reload(SysTickState *s, int reset)
-{
-    /* The Cortex-M3 Devices Generic User Guide says that "When the
-     * ENABLE bit is set to 1, the counter loads the RELOAD value from the
-     * SYST RVR register and then counts down". So, we need to check the
-     * ENABLE bit before reloading the value.
-     */
-    trace_systick_reload();
-
-    if ((s->control & SYSTICK_ENABLE) == 0) {
-        return;
-    }
-
-    if (reset) {
-        s->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    }
-    s->tick += (s->reload + 1) * systick_scale(s);
-    timer_mod(s->timer, s->tick);
-}
-
 static void systick_timer_tick(void *opaque)
 {
     SysTickState *s = (SysTickState *)opaque;
@@ -70,10 +50,12 @@ static void systick_timer_tick(void *opaque)
         /* Tell the NVIC to pend the SysTick exception */
         qemu_irq_pulse(s->irq);
     }
-    if (s->reload == 0) {
-        s->control &= ~SYSTICK_ENABLE;
-    } else {
-        systick_reload(s, 0);
+    if (ptimer_get_limit(s->ptimer) == 0) {
+        /*
+         * Timer expiry with SYST_RVR zero disables the timer
+         * (but doesn't clear SYST_CSR.ENABLE)
+         */
+        ptimer_stop(s->ptimer);
     }
 }
 
@@ -94,30 +76,11 @@ static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
         s->control &= ~SYSTICK_COUNTFLAG;
         break;
     case 0x4: /* SysTick Reload Value.  */
-        val = s->reload;
+        val = ptimer_get_limit(s->ptimer);
         break;
     case 0x8: /* SysTick Current Value.  */
-    {
-        int64_t t;
-
-        if ((s->control & SYSTICK_ENABLE) == 0) {
-            val = 0;
-            break;
-        }
-        t = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        if (t >= s->tick) {
-            val = 0;
-            break;
-        }
-        val = ((s->tick - (t + 1)) / systick_scale(s)) + 1;
-        /* The interrupt in triggered when the timer reaches zero.
-           However the counter is not reloaded until the next clock
-           tick.  This is a hack to return zero during the first tick.  */
-        if (val > s->reload) {
-            val = 0;
-        }
+        val = ptimer_get_count(s->ptimer);
         break;
-    }
     case 0xc: /* SysTick Calibration Value.  */
         val = 10000;
         break;
@@ -149,39 +112,50 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
     switch (addr) {
     case 0x0: /* SysTick Control and Status.  */
     {
-        uint32_t oldval = s->control;
+        uint32_t oldval;
 
+        ptimer_transaction_begin(s->ptimer);
+        oldval = s->control;
         s->control &= 0xfffffff8;
         s->control |= value & 7;
+
         if ((oldval ^ value) & SYSTICK_ENABLE) {
-            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
             if (value & SYSTICK_ENABLE) {
-                if (s->tick) {
-                    s->tick += now;
-                    timer_mod(s->timer, s->tick);
-                } else {
-                    systick_reload(s, 1);
-                }
+                /*
+                 * Always reload the period in case board code has
+                 * changed system_clock_scale. If we ever replace that
+                 * global with a more sensible API then we might be able
+                 * to set the period only when it actually changes.
+                 */
+                ptimer_set_period(s->ptimer, systick_scale(s));
+                ptimer_run(s->ptimer, 0);
             } else {
-                timer_del(s->timer);
-                s->tick -= now;
-                if (s->tick < 0) {
-                    s->tick = 0;
-                }
+                ptimer_stop(s->ptimer);
             }
         } else if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
-            /* This is a hack. Force the timer to be reloaded
-               when the reference clock is changed.  */
-            systick_reload(s, 1);
+            ptimer_set_period(s->ptimer, systick_scale(s));
         }
+        ptimer_transaction_commit(s->ptimer);
         break;
     }
     case 0x4: /* SysTick Reload Value.  */
-        s->reload = value;
+        ptimer_transaction_begin(s->ptimer);
+        ptimer_set_limit(s->ptimer, value & 0xffffff, 0);
+        ptimer_transaction_commit(s->ptimer);
         break;
-    case 0x8: /* SysTick Current Value.  Writes reload the timer.  */
-        systick_reload(s, 1);
+    case 0x8: /* SysTick Current Value. */
+        /*
+         * Writing any value clears SYST_CVR to zero and clears
+         * SYST_CSR.COUNTFLAG. The counter will then reload from SYST_RVR
+         * on the next clock edge unless SYST_RVR is zero.
+         */
+        ptimer_transaction_begin(s->ptimer);
+        if (ptimer_get_limit(s->ptimer) == 0) {
+            ptimer_stop(s->ptimer);
+        }
+        ptimer_set_count(s->ptimer, 0);
         s->control &= ~SYSTICK_COUNTFLAG;
+        ptimer_transaction_commit(s->ptimer);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -210,10 +184,13 @@ static void systick_reset(DeviceState *dev)
      */
     assert(system_clock_scale != 0);
 
+    ptimer_transaction_begin(s->ptimer);
     s->control = 0;
-    s->reload = 0;
-    s->tick = 0;
-    timer_del(s->timer);
+    ptimer_stop(s->ptimer);
+    ptimer_set_count(s->ptimer, 0);
+    ptimer_set_limit(s->ptimer, 0, 0);
+    ptimer_set_period(s->ptimer, systick_scale(s));
+    ptimer_transaction_commit(s->ptimer);
 }
 
 static void systick_instance_init(Object *obj)
@@ -229,18 +206,21 @@ static void systick_instance_init(Object *obj)
 static void systick_realize(DeviceState *dev, Error **errp)
 {
     SysTickState *s = SYSTICK(dev);
-    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
+    s->ptimer = ptimer_init(systick_timer_tick, s,
+                            PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
+                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN |
+                            PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
+                            PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 }
 
 static const VMStateDescription vmstate_systick = {
     .name = "armv7m_systick",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(control, SysTickState),
-        VMSTATE_UINT32(reload, SysTickState),
         VMSTATE_INT64(tick, SysTickState),
-        VMSTATE_TIMER_PTR(timer, SysTickState),
+        VMSTATE_PTIMER(ptimer, SysTickState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1

