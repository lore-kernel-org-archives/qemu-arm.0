Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03ECCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIlcf-0008M4-LI; Tue, 11 Nov 2025 05:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcH-0007Vh-J7
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:49 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcB-0000Fj-8k
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:47 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so5968753a12.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762856920; x=1763461720; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbDS/MaXiZ2BNL1f+1XPRv78qm4Be4BIPl13rBc/TDY=;
 b=lzULEvrRvgWs4cyeqKYTjdqge4+RaTE9VDOwWyxyA+bc+g4l27IIZh/qYiZUY9qyN4
 wdQrlNdfPmZHmtrYtQCgDYL+R/sX32aC3U8A4T7lve/XnVWzt7zSLGIWvh/PowlykAV5
 8dPqtKqP08t4AY1B/7wxqKfmbOgLvNCS/qU4eueJ2EVFObbfcmPlMSIPSG0iXTKCerST
 +Lr+M1yEyK9XwAHbIp8881oFW0R/tKz+rub8RedfbI9vajxun9pVJxiLzjG7KpfFmzoC
 nY+fraDEJ6+I1MLyVRaN3b0hKUPZN2n5JoNzRfdyyt5f5UVogneu/21S8Xv2gQZb+X76
 z53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762856920; x=1763461720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gbDS/MaXiZ2BNL1f+1XPRv78qm4Be4BIPl13rBc/TDY=;
 b=XPtnFq3lVpqWR+80ImE43TYXvE04rMSX1eBQoHh72m6oQlBbrXMy3lIL0+7rKBLoRY
 p/6cKL8VvDLGKeWKivMgrKphptQAbcQ7QHsDKzM1icq36R1oRmowoqJekLj6hoQKKWZl
 k7DYe3pvEc6HRXkaUHZHtrDYdFthDl5frUidHd+/TI49pN0pkwSxa/Ez5X33hRp/9kBH
 uz4bUws9fjIcY8AjOzj7w095ApdPppsEzS5czmwRTM7ggFtByNSXfkwOpJTcpTI2/gpk
 D0dP/GcY6ejadfE/S6NRb7wXTejXXlKVF1647vEvcykWZR4VczuIrQPiGPfoefloxBTp
 IYwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7fPe4IflcbdwO6NyJU+1t4ynmXpw1s8YSZbj0ztoC87vM/9Nooq5UFrM8q5ylzj/96DN5AaZLA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+u/WOFGJ6mK/+qoywbC7LI3qI9It1/5Ir6P0LYfqJiE7ND4LA
 Nu9iWlwJ43ebyPiMwVmyDnOhgyXFrwsBXIuGmLuf/O8rgo81CMu+i6YJ
X-Gm-Gg: ASbGncvRyxtF199tTJpShPVGXsUQ1EetRa5ZpNWWtdcjVYUNZRJ2wIxlr+ofJ5NmwlK
 aGqUdoHgOqMveSEJadv56mPjNJWXh7mBu+OHQp167VKe7mYUtG48T3IRGJ7wqFJUhtpM8ICHWd6
 JIEbA/unskMOqIcNIifwKwJI1481HswXipn6GKTCIQW+u/SMM535qH0v7AWeB47vcwUhCjd74Sg
 ejqkGYXxM+00mbRR9/QSnLks4iGCb/nydARhnKUCfdoi4vpsbDyyFDAe4zrPI0N5IYwQRO7sa4S
 diMQxvSiBiuHGRQwQJCzSNW50L7eyeACuHn6meypd6Pnv6vhl3UjAwF0ji0WbQf2H32Y8wFpP/B
 eX79EG3yZKPHIioTZLHfgYFrRH8cjZH69Bj2ccnOC8rYOCCY9w6PcjSs2PeZBkJ3+4nAJrKMceP
 ZroYnxoug8mOlMGwI5Wsqleg==
X-Google-Smtp-Source: AGHT+IE/8sIqFZhXoMtSuvQo+Vex/umHlW4YvtDgDDI0NrjH9wt2g0KRNSuyMLgHltdOvQSVfLLLOg==
X-Received: by 2002:a17:907:7f26:b0:b40:da21:bf38 with SMTP id
 a640c23a62f3a-b72e041276dmr1183849666b.36.1762856919700; 
 Tue, 11 Nov 2025 02:28:39 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc12:ce00:ae91:a1ff:fe8b:15a7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbd1ecfsm1290619366b.10.2025.11.11.02.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:28:39 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v4 02/15] hw/timer: Make PERIPHCLK divider configurable
Date: Tue, 11 Nov 2025 11:28:23 +0100
Message-ID: <20251111102836.212535-3-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111102836.212535-1-corvin.koehne@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/timer/a9gtimer.c            | 19 ++++++++++++++++++-
 hw/timer/arm_mptimer.c         | 19 ++++++++++++++++++-
 include/hw/timer/a9gtimer.h    |  1 +
 include/hw/timer/arm_mptimer.h |  2 ++
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 090d14c683..31eb9422f7 100644
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
 
 static void a9_gtimer_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cae07090f9..a7434cf56a 100644
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
 
 static void arm_mptimer_class_init(ObjectClass *klass, void *data)
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


