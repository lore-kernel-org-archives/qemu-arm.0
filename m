Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1941147lfq;
        Thu, 10 Sep 2020 22:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7f3pz8RJcMUCxT2HWIa5AMuMgw579859gW0Xlp4sbKNYU5p5QnbU5PSNQk9sw+NkZFw8x
X-Received: by 2002:a25:1d0b:: with SMTP id d11mr217832ybd.84.1599801837489;
        Thu, 10 Sep 2020 22:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599801837; cv=none;
        d=google.com; s=arc-20160816;
        b=CvIa2MHg64c/P0aM08HS6C2+F92NcCdvamMg4cxyqo8iacYMQrkyaoZ8KwXlaGzu3B
         R9eL5L6bs45Wrv1rNazKEyyFEjx0itg8cKIYqgZDGkjYYkR6Bh9uo7NzpInyXZzT5vSt
         krS4S5cWKouJaOXvQ8k8TCUe30EoVykjyep+A5r8D5TK0k1wOKUaMpFiGTRY2WT4bgoO
         JzIkRprjNfd4uijkKQDNU0TKCr8fJcChF4GTuyogZToLV2+AMI0b7R5bAXOf3WcDo3aK
         JVrQogk99JiSkNX1l32aHD8UUtYcvhIPbLmMXXBhM5xvGdfPTCrNNphigVYUURMP+Qoh
         bQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=AGflmra11J6VsIaTzmiNoPPtBTdfwyzIN4ocz8oUUQ0=;
        b=olfyYbepKIfS2I9sDL56hGSJc2EA0pUhY0Jq1N/o0hVxOX8p4jfURk0Ji+BHRtLMzr
         5HL9sVxdbAvycp1s5COew5PHH8kIJYqwvlyJAOzIbdea1Haa6EeeaHRSfHfHJdKiJqZY
         jiq5UpRPTSCFU6blxckgUVKLhC8Zy+SgTXdAUQ+g+lKO3jgCy1kcmYuHp430Nl6zM2iA
         NPiADthrulh8+f6TC0ez4wgbnqoGK4gGypucCoCNj/f4VwKdR32SJr99vMKyk7CjA8rE
         NrCZisD0dYymkCxzTkn+ceYGutQyRg03tEd9oj1maqJOFe/TnHoj21YU23ay9eICVxfj
         nqOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=H4UBg7Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e194si1176620yba.368.2020.09.10.22.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=H4UBg7Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbXQ-00028R-Qm
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SglbXwsKCMkw7zx22t13t2v33v0t.r315t19-p61232v29.36v@flex--hskinnemoen.bounces.google.com>)
 id 1kGbUv-0006H4-Cy
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:21 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SglbXwsKCMkw7zx22t13t2v33v0t.r315t19-p61232v29.36v@flex--hskinnemoen.bounces.google.com>)
 id 1kGbUr-0002Kw-0b
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:21 -0400
Received: by mail-pg1-x54a.google.com with SMTP id g18so5338560pgl.10
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=AGflmra11J6VsIaTzmiNoPPtBTdfwyzIN4ocz8oUUQ0=;
 b=H4UBg7KgAkQJBGl9jA50ehv2IJw53kVbeBTCg+LXPXHjXph6I+ETlYlW9cIuwk+dlp
 s6IRBUPnFRNox4HFNzUNduHZeHP2ZKfrSaUqP+MaGfX+ge9g90PGCxJfUi1TTeYzO8oe
 FFRfqS1AJaBPX1C2ThtXSp2VG1UHdjD+U8v94H37ioZlaLLh8JT0aasHwfKkMX3E+VAi
 gByckFzR927L/FCGQOimMt61hVUAI+P1wItIaxI2t+0Qv8LTa+TRKN1tvlpRTsEPlktb
 +iRennTzv+K01R9XhJl8TtrAZMMutC7f+noSaBhTra2ubiCMetBBLsv4b5s6x8GM3j0q
 Qo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=AGflmra11J6VsIaTzmiNoPPtBTdfwyzIN4ocz8oUUQ0=;
 b=jk/GxrGZrnXfYaoHwEgqmH4FO7OPsi6dGrW1KQt5rNBjUo/KRAHD8kqGsrc6Sy+olw
 bxKNpYNRYocoR57xvS7ejmSjE66CkmHGzE4H1ggQVnmi/wSkKMpS3u4pw3wlb/x2Au0s
 r9vFlP0k6COYzmMDgF0guTKMZnfa7dmrE49ZS7NG+wXgw6bbSIrCb7C2DYomyI5Fdv62
 Nz9F/8J+SClbu6y5/aiGU1WzEzwbonpXoGzc0FTXyFp5gLZIt7UwGUw5ynS+JojgrBS0
 ZcDs77tzncJB3tGUU4rQ/j4zjrrgE5x5i2EWAtHW8iy6QzvRoPdIk3xKg3x4Kdg+r2VW
 oRsg==
X-Gm-Message-State: AOAM5323kdfib/wdY3TyJcC/o77I1dVOjkaFTKLJPlOzg8q945h7MQo8
 f9nY1XaxTqUo0lw+REPWsDqXAPYRp9o/PVGIBQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:90b:941:: with SMTP id
 dw1mr633225pjb.1.1599801674967;
 Thu, 10 Sep 2020 22:21:14 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:20:50 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-4-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 03/14] hw/timer: Add NPCM7xx Timer device model
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Joel Stanley <joel@jms.id.au>, Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3SglbXwsKCMkw7zx22t13t2v33v0t.r315t19-p61232v29.36v@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: NNCKEQzpgEYq

The NPCM730 and NPCM750 SoCs have three timer modules each holding five
timers and some shared registers (e.g. interrupt status).

Each timer runs at 25 MHz divided by a prescaler, and counts down from a
configurable initial value to zero. When zero is reached, the interrupt
flag for the timer is set, and the timer is disabled (one-shot mode) or
reloaded from its initial value (periodic mode).

This implementation is sufficient to boot a Linux kernel configured for
NPCM750. Note that the kernel does not seem to actually turn on the
interrupts.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 include/hw/timer/npcm7xx_timer.h |  78 +++++
 hw/timer/npcm7xx_timer.c         | 543 +++++++++++++++++++++++++++++++
 hw/timer/meson.build             |   1 +
 hw/timer/trace-events            |   5 +
 4 files changed, 627 insertions(+)
 create mode 100644 include/hw/timer/npcm7xx_timer.h
 create mode 100644 hw/timer/npcm7xx_timer.c

diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_ti=
mer.h
new file mode 100644
index 0000000000..878a365a79
--- /dev/null
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -0,0 +1,78 @@
+/*
+ * Nuvoton NPCM7xx Timer Controller
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM7XX_TIMER_H
+#define NPCM7XX_TIMER_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+
+/* Each Timer Module (TIM) instance holds five 25 MHz timers. */
+#define NPCM7XX_TIMERS_PER_CTRL (5)
+
+/*
+ * Number of registers in our device state structure. Don't change this wi=
thout
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM7XX_TIMER_NR_REGS (0x54 / sizeof(uint32_t))
+
+typedef struct NPCM7xxTimerCtrlState NPCM7xxTimerCtrlState;
+
+/**
+ * struct NPCM7xxTimer - Individual timer state.
+ * @irq: GIC interrupt line to fire on expiration (if enabled).
+ * @qtimer: QEMU timer that notifies us on expiration.
+ * @expires_ns: Absolute virtual expiration time.
+ * @remaining_ns: Remaining time until expiration if timer is paused.
+ * @tcsr: The Timer Control and Status Register.
+ * @ticr: The Timer Initial Count Register.
+ */
+typedef struct NPCM7xxTimer {
+    NPCM7xxTimerCtrlState *ctrl;
+
+    qemu_irq    irq;
+    QEMUTimer   qtimer;
+    int64_t     expires_ns;
+    int64_t     remaining_ns;
+
+    uint32_t    tcsr;
+    uint32_t    ticr;
+} NPCM7xxTimer;
+
+/**
+ * struct NPCM7xxTimerCtrlState - Timer Module device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @tisr: The Timer Interrupt Status Register.
+ * @wtcr: The Watchdog Timer Control Register.
+ * @timer: The five individual timers managed by this module.
+ */
+struct NPCM7xxTimerCtrlState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint32_t    tisr;
+    uint32_t    wtcr;
+
+    NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];
+};
+
+#define TYPE_NPCM7XX_TIMER "npcm7xx-timer"
+#define NPCM7XX_TIMER(obj)                                              \
+    OBJECT_CHECK(NPCM7xxTimerCtrlState, (obj), TYPE_NPCM7XX_TIMER)
+
+#endif /* NPCM7XX_TIMER_H */
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
new file mode 100644
index 0000000000..5703e43d40
--- /dev/null
+++ b/hw/timer/npcm7xx_timer.c
@@ -0,0 +1,543 @@
+/*
+ * Nuvoton NPCM7xx Timer Controller
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/irq.h"
+#include "hw/misc/npcm7xx_clk.h"
+#include "hw/timer/npcm7xx_timer.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+/* 32-bit register indices. */
+enum NPCM7xxTimerRegisters {
+    NPCM7XX_TIMER_TCSR0,
+    NPCM7XX_TIMER_TCSR1,
+    NPCM7XX_TIMER_TICR0,
+    NPCM7XX_TIMER_TICR1,
+    NPCM7XX_TIMER_TDR0,
+    NPCM7XX_TIMER_TDR1,
+    NPCM7XX_TIMER_TISR,
+    NPCM7XX_TIMER_WTCR,
+    NPCM7XX_TIMER_TCSR2,
+    NPCM7XX_TIMER_TCSR3,
+    NPCM7XX_TIMER_TICR2,
+    NPCM7XX_TIMER_TICR3,
+    NPCM7XX_TIMER_TDR2,
+    NPCM7XX_TIMER_TDR3,
+    NPCM7XX_TIMER_TCSR4         =3D 0x0040 / sizeof(uint32_t),
+    NPCM7XX_TIMER_TICR4         =3D 0x0048 / sizeof(uint32_t),
+    NPCM7XX_TIMER_TDR4          =3D 0x0050 / sizeof(uint32_t),
+    NPCM7XX_TIMER_REGS_END,
+};
+
+/* Register field definitions. */
+#define NPCM7XX_TCSR_CEN                BIT(30)
+#define NPCM7XX_TCSR_IE                 BIT(29)
+#define NPCM7XX_TCSR_PERIODIC           BIT(27)
+#define NPCM7XX_TCSR_CRST               BIT(26)
+#define NPCM7XX_TCSR_CACT               BIT(25)
+#define NPCM7XX_TCSR_RSVD               0x01ffff00
+#define NPCM7XX_TCSR_PRESCALE_START     0
+#define NPCM7XX_TCSR_PRESCALE_LEN       8
+
+/*
+ * Returns the index of timer in the tc->timer array. This can be used to
+ * locate the registers that belong to this timer.
+ */
+static int npcm7xx_timer_index(NPCM7xxTimerCtrlState *tc, NPCM7xxTimer *ti=
mer)
+{
+    int index =3D timer - tc->timer;
+
+    g_assert(index >=3D 0 && index < NPCM7XX_TIMERS_PER_CTRL);
+
+    return index;
+}
+
+/* Return the value by which to divide the reference clock rate. */
+static uint32_t npcm7xx_tcsr_prescaler(uint32_t tcsr)
+{
+    return extract32(tcsr, NPCM7XX_TCSR_PRESCALE_START,
+                     NPCM7XX_TCSR_PRESCALE_LEN) + 1;
+}
+
+/* Convert a timer cycle count to a time interval in nanoseconds. */
+static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
+{
+    int64_t ns =3D count;
+
+    ns *=3D NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
+    ns *=3D npcm7xx_tcsr_prescaler(t->tcsr);
+
+    return ns;
+}
+
+/* Convert a time interval in nanoseconds to a timer cycle count. */
+static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
+{
+    int64_t count;
+
+    count =3D ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
+    count /=3D npcm7xx_tcsr_prescaler(t->tcsr);
+
+    return count;
+}
+
+/*
+ * Raise the interrupt line if there's a pending interrupt and interrupts =
are
+ * enabled for this timer. If not, lower it.
+ */
+static void npcm7xx_timer_check_interrupt(NPCM7xxTimer *t)
+{
+    NPCM7xxTimerCtrlState *tc =3D t->ctrl;
+    int index =3D npcm7xx_timer_index(tc, t);
+    bool pending =3D (t->tcsr & NPCM7XX_TCSR_IE) && (tc->tisr & BIT(index)=
);
+
+    qemu_set_irq(t->irq, pending);
+    trace_npcm7xx_timer_irq(DEVICE(tc)->canonical_path, index, pending);
+}
+
+/* Start or resume the timer. */
+static void npcm7xx_timer_start(NPCM7xxTimer *t)
+{
+    int64_t now;
+
+    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    t->expires_ns =3D now + t->remaining_ns;
+    timer_mod(&t->qtimer, t->expires_ns);
+}
+
+/*
+ * Called when the counter reaches zero. Sets the interrupt flag, and eith=
er
+ * restarts or disables the timer.
+ */
+static void npcm7xx_timer_reached_zero(NPCM7xxTimer *t)
+{
+    NPCM7xxTimerCtrlState *tc =3D t->ctrl;
+    int index =3D npcm7xx_timer_index(tc, t);
+
+    tc->tisr |=3D BIT(index);
+
+    if (t->tcsr & NPCM7XX_TCSR_PERIODIC) {
+        t->remaining_ns =3D npcm7xx_timer_count_to_ns(t, t->ticr);
+        if (t->tcsr & NPCM7XX_TCSR_CEN) {
+            npcm7xx_timer_start(t);
+        }
+    } else {
+        t->tcsr &=3D ~(NPCM7XX_TCSR_CEN | NPCM7XX_TCSR_CACT);
+    }
+
+    npcm7xx_timer_check_interrupt(t);
+}
+
+/* Stop counting. Record the time remaining so we can continue later. */
+static void npcm7xx_timer_pause(NPCM7xxTimer *t)
+{
+    int64_t now;
+
+    timer_del(&t->qtimer);
+    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    t->remaining_ns =3D t->expires_ns - now;
+    if (t->remaining_ns <=3D 0) {
+        npcm7xx_timer_reached_zero(t);
+    }
+}
+
+/*
+ * Restart the timer from its initial value. If the timer was enabled and =
stays
+ * enabled, adjust the QEMU timer according to the new count. If the timer=
 is
+ * transitioning from disabled to enabled, the caller is expected to start=
 the
+ * timer later.
+ */
+static void npcm7xx_timer_restart(NPCM7xxTimer *t, uint32_t old_tcsr)
+{
+    t->remaining_ns =3D npcm7xx_timer_count_to_ns(t, t->ticr);
+
+    if (old_tcsr & t->tcsr & NPCM7XX_TCSR_CEN) {
+        npcm7xx_timer_start(t);
+    }
+}
+
+/* Register read and write handlers */
+
+static uint32_t npcm7xx_timer_read_tdr(NPCM7xxTimer *t)
+{
+    if (t->tcsr & NPCM7XX_TCSR_CEN) {
+        int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+        return npcm7xx_timer_ns_to_count(t, t->expires_ns - now);
+    }
+
+    return npcm7xx_timer_ns_to_count(t, t->remaining_ns);
+}
+
+static void npcm7xx_timer_write_tcsr(NPCM7xxTimer *t, uint32_t new_tcsr)
+{
+    uint32_t old_tcsr =3D t->tcsr;
+    uint32_t tdr;
+
+    if (new_tcsr & NPCM7XX_TCSR_RSVD) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: reserved bits in 0x%08x ignore=
d\n",
+                      __func__, new_tcsr);
+        new_tcsr &=3D ~NPCM7XX_TCSR_RSVD;
+    }
+    if (new_tcsr & NPCM7XX_TCSR_CACT) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read-only bits in 0x%08x ignor=
ed\n",
+                      __func__, new_tcsr);
+        new_tcsr &=3D ~NPCM7XX_TCSR_CACT;
+    }
+    if ((new_tcsr & NPCM7XX_TCSR_CRST) && (new_tcsr & NPCM7XX_TCSR_CEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: both CRST and CEN set; ignoring CEN.\n",
+                      __func__);
+        new_tcsr &=3D ~NPCM7XX_TCSR_CEN;
+    }
+
+    /* Calculate the value of TDR before potentially changing the prescale=
r. */
+    tdr =3D npcm7xx_timer_read_tdr(t);
+
+    t->tcsr =3D (t->tcsr & NPCM7XX_TCSR_CACT) | new_tcsr;
+
+    if (npcm7xx_tcsr_prescaler(old_tcsr) !=3D npcm7xx_tcsr_prescaler(new_t=
csr)) {
+        /* Recalculate time remaining based on the current TDR value. */
+        t->remaining_ns =3D npcm7xx_timer_count_to_ns(t, tdr);
+        if (old_tcsr & t->tcsr & NPCM7XX_TCSR_CEN) {
+            npcm7xx_timer_start(t);
+        }
+    }
+
+    if ((old_tcsr ^ new_tcsr) & NPCM7XX_TCSR_IE) {
+        npcm7xx_timer_check_interrupt(t);
+    }
+    if (new_tcsr & NPCM7XX_TCSR_CRST) {
+        npcm7xx_timer_restart(t, old_tcsr);
+        t->tcsr &=3D ~NPCM7XX_TCSR_CRST;
+    }
+    if ((old_tcsr ^ new_tcsr) & NPCM7XX_TCSR_CEN) {
+        if (new_tcsr & NPCM7XX_TCSR_CEN) {
+            t->tcsr |=3D NPCM7XX_TCSR_CACT;
+            npcm7xx_timer_start(t);
+        } else {
+            t->tcsr &=3D ~NPCM7XX_TCSR_CACT;
+            npcm7xx_timer_pause(t);
+        }
+    }
+}
+
+static void npcm7xx_timer_write_ticr(NPCM7xxTimer *t, uint32_t new_ticr)
+{
+    t->ticr =3D new_ticr;
+
+    npcm7xx_timer_restart(t, t->tcsr);
+}
+
+static void npcm7xx_timer_write_tisr(NPCM7xxTimerCtrlState *s, uint32_t va=
lue)
+{
+    int i;
+
+    s->tisr &=3D ~value;
+    for (i =3D 0; i < ARRAY_SIZE(s->timer); i++) {
+        if (value & (1U << i)) {
+            npcm7xx_timer_check_interrupt(&s->timer[i]);
+        }
+    }
+}
+
+static hwaddr npcm7xx_tcsr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_TIMER_TCSR0:
+        return 0;
+    case NPCM7XX_TIMER_TCSR1:
+        return 1;
+    case NPCM7XX_TIMER_TCSR2:
+        return 2;
+    case NPCM7XX_TIMER_TCSR3:
+        return 3;
+    case NPCM7XX_TIMER_TCSR4:
+        return 4;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_ticr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_TIMER_TICR0:
+        return 0;
+    case NPCM7XX_TIMER_TICR1:
+        return 1;
+    case NPCM7XX_TIMER_TICR2:
+        return 2;
+    case NPCM7XX_TIMER_TICR3:
+        return 3;
+    case NPCM7XX_TIMER_TICR4:
+        return 4;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_tdr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_TIMER_TDR0:
+        return 0;
+    case NPCM7XX_TIMER_TDR1:
+        return 1;
+    case NPCM7XX_TIMER_TDR2:
+        return 2;
+    case NPCM7XX_TIMER_TDR3:
+        return 3;
+    case NPCM7XX_TIMER_TDR4:
+        return 4;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t npcm7xx_timer_read(void *opaque, hwaddr offset, unsigned s=
ize)
+{
+    NPCM7xxTimerCtrlState *s =3D opaque;
+    uint64_t value =3D 0;
+    hwaddr reg;
+
+    reg =3D offset / sizeof(uint32_t);
+    switch (reg) {
+    case NPCM7XX_TIMER_TCSR0:
+    case NPCM7XX_TIMER_TCSR1:
+    case NPCM7XX_TIMER_TCSR2:
+    case NPCM7XX_TIMER_TCSR3:
+    case NPCM7XX_TIMER_TCSR4:
+        value =3D s->timer[npcm7xx_tcsr_index(reg)].tcsr;
+        break;
+
+    case NPCM7XX_TIMER_TICR0:
+    case NPCM7XX_TIMER_TICR1:
+    case NPCM7XX_TIMER_TICR2:
+    case NPCM7XX_TIMER_TICR3:
+    case NPCM7XX_TIMER_TICR4:
+        value =3D s->timer[npcm7xx_ticr_index(reg)].ticr;
+        break;
+
+    case NPCM7XX_TIMER_TDR0:
+    case NPCM7XX_TIMER_TDR1:
+    case NPCM7XX_TIMER_TDR2:
+    case NPCM7XX_TIMER_TDR3:
+    case NPCM7XX_TIMER_TDR4:
+        value =3D npcm7xx_timer_read_tdr(&s->timer[npcm7xx_tdr_index(reg)]=
);
+        break;
+
+    case NPCM7XX_TIMER_TISR:
+        value =3D s->tisr;
+        break;
+
+    case NPCM7XX_TIMER_WTCR:
+        value =3D s->wtcr;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    trace_npcm7xx_timer_read(DEVICE(s)->canonical_path, offset, value);
+
+    return value;
+}
+
+static void npcm7xx_timer_write(void *opaque, hwaddr offset,
+                                uint64_t v, unsigned size)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxTimerCtrlState *s =3D opaque;
+    uint32_t value =3D v;
+
+    trace_npcm7xx_timer_write(DEVICE(s)->canonical_path, offset, value);
+
+    switch (reg) {
+    case NPCM7XX_TIMER_TCSR0:
+    case NPCM7XX_TIMER_TCSR1:
+    case NPCM7XX_TIMER_TCSR2:
+    case NPCM7XX_TIMER_TCSR3:
+    case NPCM7XX_TIMER_TCSR4:
+        npcm7xx_timer_write_tcsr(&s->timer[npcm7xx_tcsr_index(reg)], value=
);
+        return;
+
+    case NPCM7XX_TIMER_TICR0:
+    case NPCM7XX_TIMER_TICR1:
+    case NPCM7XX_TIMER_TICR2:
+    case NPCM7XX_TIMER_TICR3:
+    case NPCM7XX_TIMER_TICR4:
+        npcm7xx_timer_write_ticr(&s->timer[npcm7xx_ticr_index(reg)], value=
);
+        return;
+
+    case NPCM7XX_TIMER_TDR0:
+    case NPCM7XX_TIMER_TDR1:
+    case NPCM7XX_TIMER_TDR2:
+    case NPCM7XX_TIMER_TDR3:
+    case NPCM7XX_TIMER_TDR4:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n"=
,
+                      __func__, offset);
+        return;
+
+    case NPCM7XX_TIMER_TISR:
+        npcm7xx_timer_write_tisr(s, value);
+        return;
+
+    case NPCM7XX_TIMER_WTCR:
+        qemu_log_mask(LOG_UNIMP, "%s: WTCR write not implemented: 0x%08x\n=
",
+                      __func__, value);
+        return;
+    }
+
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                  __func__, offset);
+}
+
+static const struct MemoryRegionOps npcm7xx_timer_ops =3D {
+    .read       =3D npcm7xx_timer_read,
+    .write      =3D npcm7xx_timer_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid      =3D {
+        .min_access_size        =3D 4,
+        .max_access_size        =3D 4,
+        .unaligned              =3D false,
+    },
+};
+
+/* Called when the QEMU timer expires. */
+static void npcm7xx_timer_expired(void *opaque)
+{
+    NPCM7xxTimer *t =3D opaque;
+
+    if (t->tcsr & NPCM7XX_TCSR_CEN) {
+        npcm7xx_timer_reached_zero(t);
+    }
+}
+
+static void npcm7xx_timer_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxTimerCtrlState *s =3D NPCM7XX_TIMER(obj);
+    int i;
+
+    for (i =3D 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        NPCM7xxTimer *t =3D &s->timer[i];
+
+        timer_del(&t->qtimer);
+        t->expires_ns =3D 0;
+        t->remaining_ns =3D 0;
+        t->tcsr =3D 0x00000005;
+        t->ticr =3D 0x00000000;
+    }
+
+    s->tisr =3D 0x00000000;
+    s->wtcr =3D 0x00000400;
+}
+
+static void npcm7xx_timer_hold_reset(Object *obj)
+{
+    NPCM7xxTimerCtrlState *s =3D NPCM7XX_TIMER(obj);
+    int i;
+
+    for (i =3D 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        qemu_irq_lower(s->timer[i].irq);
+    }
+}
+
+static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxTimerCtrlState *s =3D NPCM7XX_TIMER(dev);
+    SysBusDevice *sbd =3D &s->parent;
+    int i;
+
+    for (i =3D 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        NPCM7xxTimer *t =3D &s->timer[i];
+        t->ctrl =3D s;
+        timer_init_ns(&t->qtimer, QEMU_CLOCK_VIRTUAL, npcm7xx_timer_expire=
d, t);
+        sysbus_init_irq(sbd, &t->irq);
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_timer_ops, s,
+                          TYPE_NPCM7XX_TIMER, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_npcm7xx_timer =3D {
+    .name =3D "npcm7xx-timer",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_TIMER(qtimer, NPCM7xxTimer),
+        VMSTATE_INT64(expires_ns, NPCM7xxTimer),
+        VMSTATE_INT64(remaining_ns, NPCM7xxTimer),
+        VMSTATE_UINT32(tcsr, NPCM7xxTimer),
+        VMSTATE_UINT32(ticr, NPCM7xxTimer),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_timer_ctrl =3D {
+    .name =3D "npcm7xx-timer-ctrl",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(tisr, NPCM7xxTimerCtrlState),
+        VMSTATE_UINT32(wtcr, NPCM7xxTimerCtrlState),
+        VMSTATE_STRUCT_ARRAY(timer, NPCM7xxTimerCtrlState,
+                             NPCM7XX_TIMERS_PER_CTRL, 0, vmstate_npcm7xx_t=
imer,
+                             NPCM7xxTimer),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
+
+    dc->desc =3D "NPCM7xx Timer Controller";
+    dc->realize =3D npcm7xx_timer_realize;
+    dc->vmsd =3D &vmstate_npcm7xx_timer_ctrl;
+    rc->phases.enter =3D npcm7xx_timer_enter_reset;
+    rc->phases.hold =3D npcm7xx_timer_hold_reset;
+}
+
+static const TypeInfo npcm7xx_timer_info =3D {
+    .name               =3D TYPE_NPCM7XX_TIMER,
+    .parent             =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size      =3D sizeof(NPCM7xxTimerCtrlState),
+    .class_init         =3D npcm7xx_timer_class_init,
+};
+
+static void npcm7xx_timer_register_type(void)
+{
+    type_register_static(&npcm7xx_timer_info);
+}
+type_init(npcm7xx_timer_register_type);
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 9f0a267c83..be343f68fe 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -23,6 +23,7 @@ softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_=
timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.=
c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_timer.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gptimer.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 447b7c405b..ee66d8c84f 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,6 +66,11 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data,=
 unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "=
CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
=20
+# npcm7xx_timer.c
+npcm7xx_timer_read(const char *id, uint64_t offset, uint64_t value) " %s o=
ffset: 0x%04" PRIx64 " value 0x%08" PRIx64
+npcm7xx_timer_write(const char *id, uint64_t offset, uint64_t value) "%s o=
ffset: 0x%04" PRIx64 " value 0x%08" PRIx64
+npcm7xx_timer_irq(const char *id, int timer, int state) "%s timer %d state=
 %d"
+
 # nrf51_timer.c
 nrf51_timer_read(uint8_t timer_id, uint64_t addr, uint32_t value, unsigned=
 size) "timer %u read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nrf51_timer_write(uint8_t timer_id, uint64_t addr, uint32_t value, unsigne=
d size) "timer %u write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
--=20
2.28.0.526.ge36021eeef-goog

