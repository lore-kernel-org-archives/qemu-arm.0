Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4C7D1D89F
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:36:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kQ-0001NA-OT; Thu, 04 Dec 2025 04:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k1-00018G-B1
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:14 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5jv-0003NJ-Qa
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso1447787a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840906; x=1765445706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V1FaMp/q/JL2kLXBh26/LCxuSePONdt3doBm4ttYakg=;
 b=IHXPZ3s5hd6LCBUCu98YO8sQqjWixd6KGSXkXth/rfPFAFQ8dgz236XPSXlZ4iRQYW
 7JGsaUTQFt7VZHoFqtKXKGji5xHju8h6Iea0zXvzKGTmrV5u4bvrSY5HxtgRhJZxFPVp
 hIISQORqunC5QsqjqhodaCcUg5yDgCZMrEVy+E9cE0UPy0RPKUKl4le+KlyNXLAuueum
 FrNLNZ/BaOm0J4ALP1kbraHQdgL//a+FvE7NlUfbV1GYS86mto6sNBRWohL6pyRb+x3D
 BqmjtcmelY+cq95KFvXR+/Z0XMgBwKrwl3/aJqJeCojDFIxUhdgIt78Cg3FbMkHDt4tx
 mJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840906; x=1765445706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V1FaMp/q/JL2kLXBh26/LCxuSePONdt3doBm4ttYakg=;
 b=Q69IdxIH3Gd9VRhxIfKj/XtV0va/+j3y4+UL9pxUXv/KT/0HDU0ehAHHQobYwPayUb
 PxMZCGcC1ZaJf4XAxmCGRvYh1ZpW6NAM/YZAPCZQdOtP5pFQuEPzwMus+/IrJfV1GrWn
 t5lDQF9YbQCxfaaW0YRd2cUi5dbF34HWKHFecKZLaooo+hVTxMhjza/9Ni+FgwzRtfsJ
 A67tZCB9Mk7VTGIkcDxke0n4EYsqaytxIG6p0oOXYqVjxJxlzjbJM12TWz3d4uzZqZiN
 zfQoIJUEjDDZmVftOY+QXtQyMWyuPm5HiP1NvnJUUvbRDvs5IrCVzS/qXwQJ++KD21Ge
 ordQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM8TyAKVZgUecnz7lsoaApmUz61Bxg9Mm5/KyIubMayFwS5tMkp/wTRKnsEsDjSe40Lqn1qG2U7w==@nongnu.org
X-Gm-Message-State: AOJu0YzYsx6yYFj7dWgQnKq+N8nIRak2bcSI2TuT9VvLrwFEAyY4LNlt
 p56dRmNjhQp6A5OnDIxWVE4t77qhB90lXD8g7PstF1H7cTq86enqoB3P
X-Gm-Gg: ASbGncukdP0rFlOdoTo86WseOCh2/1b5D5xazra2qai1o2HV6V8asbmK8QpMWJkVbwi
 HGUvnzxxTSkaVjM3b9tQ9ZyLyWlUa7yocb38H6y2BQOSpOTyMUQFn0thK8uI9ox23b12lRp1vLE
 7oJTsl5g1bb+ThT5V7ec+s+s9nyHASfq1WO4RPbF/aNcQR4mLb6bNq4AkBBZrrKMe1wnEfzAJU3
 hfeedVYwsEqds7Fix+hgGOxxH4CZ6DJlTpftPhcGwI/iaviy4Pf3Ab+I3JmoSi/vMCuc/V5W4m0
 HzI5gXeOf1HWSAQMkAswnuVtYuxi2DjlWQ90YP48oZjS1TucM74ri1m6G2HPZ5ISme4LSIdUmud
 oi/n7glkq45oI+oNp9vCSj917cooxROJ2Ksl7uzHQGIQgXaNPCSZIgXHVaVVUjU2laWNmu4V+ej
 SXD5DXCwvzRJPBNP1kWTFNtk1+gGYXWbo=
X-Google-Smtp-Source: AGHT+IHRq32vLnXfjGTJTaruhjX4XUltJvv6j2Llyb23pMh4NpXzOx2taZeR1UpEXgy2R+erxhlA6A==
X-Received: by 2002:a05:6402:3192:b0:640:998e:4471 with SMTP id
 4fb4d7f45d1cf-647a69f7bc2mr1759622a12.5.1764840905891; 
 Thu, 04 Dec 2025 01:35:05 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:05 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 02/15] hw/timer: Make PERIPHCLK divider configurable
Date: Thu,  4 Dec 2025 10:34:49 +0100
Message-ID: <20251204093502.50582-3-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

The A9 global timer and ARM MP timer use PERIPHCLK as
their clock source. The frequency of PERIPHCLK is derived
by dividing the main clock (CLK) by a configurable
divider (must be at least 2). Previously, the PERIPHCLK
divider was not configurable, which could lead to
unexspected behavior if the application exspected a
different PERIPHCLK rate.

The property periphclk-divider specifies by which value
the main clock is divided to generate PERIPHCLK. This
allows flexible configuration of the timer clocks to
match application requirements.

Information can be found in the Zynq 7000 Soc Technical
Reference Manual under Timers.
https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/a9gtimer.c            | 19 ++++++++++++++++++-
 hw/timer/arm_mptimer.c         | 19 ++++++++++++++++++-
 include/hw/timer/a9gtimer.h    |  1 +
 include/hw/timer/arm_mptimer.h |  2 ++
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index ad9abcb4bb..8b4c6d7e6a 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -27,6 +27,7 @@
 #include "hw/timer/a9gtimer.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
@@ -62,9 +63,17 @@ static inline int a9_gtimer_get_current_cpu(A9GTimerState *s)
 
 static inline uint64_t a9_gtimer_get_conv(A9GTimerState *s)
 {
+    /*
+     * Referring to the ARM-Cortex-A9 MPCore TRM
+     *
+     * The a9 global timer relies on the PERIPHCLK as its clock source.
+     * The PERIPHCLK clock period must be configured as a multiple of the
+     * main clock CLK. The conversion from the qemu clock (1GHz) to a9
+     * gtimer ticks can be calculated like this:
+     */
     uint64_t prescale = extract32(s->control, R_CONTROL_PRESCALER_SHIFT,
                                   R_CONTROL_PRESCALER_LEN) + 1;
-    uint64_t scaled_prescaler = prescale * 10;
+    uint64_t scaled_prescaler = prescale * s->periphclk_divider;
     return muldiv64(scaled_prescaler, NANOSECONDS_PER_SECOND, s->freq_hz);
 }
 
@@ -312,6 +321,12 @@ static void a9_gtimer_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, a9_gtimer_update_no_sync, s);
 
+    if (s->periphclk_divider < 2) {
+        error_setg(errp, "Invalid periphclk-divider (%lu), must be >= 2",
+                   s->periphclk_divider);
+        return;
+    }
+
     for (i = 0; i < s->num_cpu; i++) {
         A9GTimerPerCPU *gtb = &s->per_cpu[i];
 
@@ -378,6 +393,8 @@ static const Property a9_gtimer_properties[] = {
     DEFINE_PROP_UINT64("clock-frequency", A9GTimerState, freq_hz,
                        NANOSECONDS_PER_SECOND),
     DEFINE_PROP_UINT32("num-cpu", A9GTimerState, num_cpu, 0),
+    DEFINE_PROP_UINT64("periphclk-divider", A9GTimerState,
+                       periphclk_divider, 10),
 };
 
 static void a9_gtimer_class_init(ObjectClass *klass, const void *data)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 342ca1276a..cf434ca2f4 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -27,6 +27,7 @@
 #include "hw/timer/arm_mptimer.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/core/cpu.h"
 
@@ -61,8 +62,16 @@ static inline void timerblock_update_irq(TimerBlock *tb)
 /* Return conversion factor from mpcore timer ticks to qemu timer ticks.  */
 static inline uint32_t timerblock_scale(TimerBlock *tb, uint32_t control)
 {
+    /*
+     * Referring to the ARM-Cortex-A9 MPCore TRM
+     *
+     * The arm mp timer relies on the PERIPHCLK as its clock source.
+     * The PERIPHCLK clock period must be configured as a multiple of the
+     * main clock CLK. The conversion from the qemu clock (1GHz) to arm mp
+     * timer ticks can be calculated like this:
+     */
     uint64_t prescale = (((control >> 8) & 0xff) + 1);
-    uint64_t scaled_prescaler = prescale * 10;
+    uint64_t scaled_prescaler = prescale * tb->periphclk_divider;
     return muldiv64(scaled_prescaler, NANOSECONDS_PER_SECOND, tb->freq_hz);
 }
 
@@ -273,6 +282,12 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
         tb->freq_hz = s->freq_hz;
+        if (s->periphclk_divider < 2) {
+            error_setg(errp, "Invalid periphclk-divider (%lu), must be >= 2",
+                       s->periphclk_divider);
+            return;
+        }
+        tb->periphclk_divider = s->periphclk_divider;
         tb->timer = ptimer_init(timerblock_tick, tb, PTIMER_POLICY);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
@@ -309,6 +324,8 @@ static const Property arm_mptimer_properties[] = {
     DEFINE_PROP_UINT64("clock-frequency", ARMMPTimerState, freq_hz,
                        NANOSECONDS_PER_SECOND),
     DEFINE_PROP_UINT32("num-cpu", ARMMPTimerState, num_cpu, 0),
+    DEFINE_PROP_UINT64("periphclk-divider", ARMMPTimerState,
+                       periphclk_divider, 10),
 };
 
 static void arm_mptimer_class_init(ObjectClass *klass, const void *data)
diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index 3b63d14927..ff9baf1c77 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -77,6 +77,7 @@ struct A9GTimerState {
     MemoryRegion iomem;
     /* static props */
     uint64_t freq_hz;
+    uint64_t periphclk_divider;
     uint32_t num_cpu;
 
     QEMUTimer *timer;
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index da43a3d351..061934e4b5 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -32,6 +32,7 @@ typedef struct {
     uint32_t status;
     struct ptimer_state *timer;
     uint64_t freq_hz;
+    uint64_t periphclk_divider;
     qemu_irq irq;
     MemoryRegion iomem;
 } TimerBlock;
@@ -45,6 +46,7 @@ struct ARMMPTimerState {
     /*< public >*/
 
     uint64_t freq_hz;
+    uint64_t periphclk_divider;
     uint32_t num_cpu;
     TimerBlock timerblock[ARM_MPTIMER_MAX_CPUS];
     MemoryRegion iomem;
-- 
2.47.3


