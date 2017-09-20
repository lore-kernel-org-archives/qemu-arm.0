Received: by 10.223.172.38 with SMTP id v35csp1112936wrc;
        Wed, 20 Sep 2017 13:22:23 -0700 (PDT)
X-Received: by 10.200.43.79 with SMTP id 15mr9614687qtv.126.1505938943151;
        Wed, 20 Sep 2017 13:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505938943; cv=none;
        d=google.com; s=arc-20160816;
        b=kg8fDJlGA65+f9QbADWSNvaFNDWJ4wB/ODOZF9FVc1URr/SRJ8fe1X2PpwOWyl5vGM
         XDPxfCoqDlIhh7MMfnFSczM6yHWo6D0D52VfC5mYpnNh/ED55TX1x1iVlAC/FfJxAaaV
         JWbzlW/xfKGHA7K/d/FlE2yYVJR89IU2g3aUGFhq399tenSibYj5mQP3tKuQZtHDJYY+
         vkEPjZ14OCEpxSVdhx/yUg/TvxB+OyVVzTD7tA2jgizsT2MEbIuUFVS6t9rQ8qKKzzcB
         wTZ8UVetU5T+IyHEpdPXDiGFljoeKrZ72f7aE7/2IQpYjdopfgx7+i22kifcpYuJEDxA
         2Wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fgxoXz+MXoxVQK8miT1+OIvJyuhSSRCLPR0q0fdqPxA=;
        b=usiudwtUFUalXRfr2bkJrwyzVHVLgBNXqcwcFpY9CjJAlUoU8LhwKSZXy+KSgkhdtG
         F+Iwb5GI8AoFR1vcgOt/PRB84V1u/NDX7UjZdLDrd/9NgGxInlnlsu4v5wDiTX2uuHQm
         OhkgXfh1P6oxX0PJjo3/wXjtK+YTsWWP6Jz6NtCyDm/510/W4hoeYk01X2+jmDCJ2FOC
         cR+/4tceVD0BP00Hjfa4a+no0rATT/he0gxz1TEPIgpcDpnB4f2CM8TPLAGLA9/zG+sV
         jKj50Laxc3JAPzU08sgVZRcM2/EEq26ez7yYW91via/zMgz1ZLGkoYPa1AFU7Sd7Gv/W
         hiCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pkw9U/Eg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si2557678qkd.365.2017.09.20.13.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 13:22:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pkw9U/Eg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dulVk-0002WP-TG
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 16:22:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRT-0007lq-1e
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 16:17:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRR-0002XJ-6M
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 16:17:55 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRQ-0002Ww-Va; Wed, 20 Sep 2017 16:17:53 -0400
Received: by mail-qk0-x241.google.com with SMTP id c69so2379086qke.5;
	Wed, 20 Sep 2017 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fgxoXz+MXoxVQK8miT1+OIvJyuhSSRCLPR0q0fdqPxA=;
	b=Pkw9U/EglwsyrZTycWwMVw9mPG4zI3noM4xOjY0MkHHWDfcGEjQve6qkCvU3MhA2C+
	FqeJVFbdFLrI0S0DPsphGh9kAI/DV7OWjz3tobxYioa3haZDIW6wR8rE8IifH+3Njj+6
	KetVjeqpEIOVZTvmiu1yRZlQoi3Bi6HxFIJRJSwWKYtzEP4jgcsKgbnSAWsBrHzw/TLi
	bc5lLAJuj9iTopovGWtdW5LvWjnDsNul8iO1h0cq41rjgTUOTkxuNxjvXuv1Q2S4fBFO
	oyctExCQkjHZkINFG6qspTgxtigJZYoSIp0Y17qYfQxFm+ZeLRbYnAaOhdIRuUfTeG0x
	0sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fgxoXz+MXoxVQK8miT1+OIvJyuhSSRCLPR0q0fdqPxA=;
	b=TF1stkQLegl5xkGWJGNYLoIvo+/XQX47wWUOjGthqkJb2dsjMJbfpby09EL2J5E+R4
	jjGQJmjW+zUlEcOQQD3shKoP/OrrZEYQ1RT+KP1RnuNB7Tpj8GO9oPGMO1j1L4YonCLu
	yitzbutCloeyHVGQ6T6ReaHa1d2FeVxVWLc4suuZvXjT/h6MaVWGuoOXWn3xKuxlffS/
	pq+2koD3w1I42M5bWNY73v1moWKnoWwITRyJDEmOLXiVU2q06AIf6Q+3IwBDo90TRnq0
	TBw5wRU75m074oL50VJj4A8s3uh68xGifGO8EjuyrfYzNbun3knED7/pGYlyE91Aqo6/
	dfYw==
X-Gm-Message-State: AHPjjUiiZaH1+4hJIXvMDrVViK7tQPEs0z0D0MmCFTNahrjLgP452Zi1
	XLXsegsCVPj++Dt/HWD7ZBk=
X-Google-Smtp-Source: AOwi7QBOKLyaLpbeow8npS6N7f2DVhk4jicYng16Q2NhIuITD3yoOEnx22foK5Sv8wMp28EKHKPmMw==
X-Received: by 10.233.216.134 with SMTP id u128mr9150384qkf.127.1505938672328; 
	Wed, 20 Sep 2017 13:17:52 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u52sm1953092qtb.34.2017.09.20.13.17.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 13:17:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Date: Wed, 20 Sep 2017 17:17:33 -0300
Message-Id: <20170920201737.25723-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920201737.25723-1-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v11 1/5] msf2: Add Smartfusion2 System timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8I9zpo5c4nxK

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

Modelled System Timer in Microsemi's Smartfusion2 Soc.
Timer has two 32bit down counters and two interrupts.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/mss-timer.h |  64 ++++++++++
 hw/timer/mss-timer.c         | 289 +++++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs       |   1 +
 3 files changed, 354 insertions(+)
 create mode 100644 include/hw/timer/mss-timer.h
 create mode 100644 hw/timer/mss-timer.c

diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
new file mode 100644
index 0000000000..d15d1732f8
--- /dev/null
+++ b/include/hw/timer/mss-timer.h
@@ -0,0 +1,64 @@
+/*
+ * Microsemi SmartFusion2 Timer.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_MSS_TIMER_H
+#define HW_MSS_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+
+#define TYPE_MSS_TIMER     "mss-timer"
+#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
+                              (obj), TYPE_MSS_TIMER)
+
+/*
+ * There are two 32-bit down counting timers.
+ * Timers 1 and 2 can be concatenated into a single 64-bit Timer
+ * that operates either in Periodic mode or in One-shot mode.
+ * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit mode.
+ * In 64-bit mode, writing to the 32-bit registers has no effect.
+ * Similarly, in 32-bit mode, writing to the 64-bit mode registers
+ * has no effect. Only two 32-bit timers are supported currently.
+ */
+#define NUM_TIMERS        2
+
+#define R_TIM1_MAX        6
+
+struct Msf2Timer {
+    QEMUBH *bh;
+    ptimer_state *ptimer;
+
+    uint32_t regs[R_TIM1_MAX];
+    qemu_irq irq;
+};
+
+typedef struct MSSTimerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint32_t freq_hz;
+    struct Msf2Timer timers[NUM_TIMERS];
+} MSSTimerState;
+
+#endif /* HW_MSS_TIMER_H */
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
new file mode 100644
index 0000000000..60f1213a3b
--- /dev/null
+++ b/hw/timer/mss-timer.c
@@ -0,0 +1,289 @@
+/*
+ * Block model of System timer present in
+ * Microsemi's SmartFusion2 and SmartFusion SoCs.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qemu/log.h"
+#include "hw/timer/mss-timer.h"
+
+#ifndef MSS_TIMER_ERR_DEBUG
+#define MSS_TIMER_ERR_DEBUG  0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt "\n", __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+#define R_TIM_VAL         0
+#define R_TIM_LOADVAL     1
+#define R_TIM_BGLOADVAL   2
+#define R_TIM_CTRL        3
+#define R_TIM_RIS         4
+#define R_TIM_MIS         5
+
+#define TIMER_CTRL_ENBL     (1 << 0)
+#define TIMER_CTRL_ONESHOT  (1 << 1)
+#define TIMER_CTRL_INTR     (1 << 2)
+#define TIMER_RIS_ACK       (1 << 0)
+#define TIMER_RST_CLR       (1 << 6)
+#define TIMER_MODE          (1 << 0)
+
+static void timer_update_irq(struct Msf2Timer *st)
+{
+    bool isr, ier;
+
+    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
+    qemu_set_irq(st->irq, (ier && isr));
+}
+
+static void timer_update(struct Msf2Timer *st)
+{
+    uint64_t count;
+
+    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
+        ptimer_stop(st->ptimer);
+        return;
+    }
+
+    count = st->regs[R_TIM_LOADVAL];
+    ptimer_set_limit(st->ptimer, count, 1);
+    ptimer_run(st->ptimer, 1);
+}
+
+static uint64_t
+timer_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    MSSTimerState *t = opaque;
+    hwaddr addr;
+    struct Msf2Timer *st;
+    uint32_t ret = 0;
+    int timer = 0;
+    int isr;
+    int ier;
+
+    addr = offset >> 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on address passed figure out which timer is being used.
+     */
+    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
+        timer = 1;
+        addr -= R_TIM1_MAX;
+    }
+
+    st = &t->timers[timer];
+
+    switch (addr) {
+    case R_TIM_VAL:
+        ret = ptimer_get_count(st->ptimer);
+        break;
+
+    case R_TIM_MIS:
+        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
+        ret = ier & isr;
+        break;
+
+    default:
+        if (addr < R_TIM1_MAX) {
+            ret = st->regs[addr];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
+            return ret;
+        }
+        break;
+    }
+
+    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
+            ret);
+    return ret;
+}
+
+static void
+timer_write(void *opaque, hwaddr offset,
+            uint64_t val64, unsigned int size)
+{
+    MSSTimerState *t = opaque;
+    hwaddr addr;
+    struct Msf2Timer *st;
+    int timer = 0;
+    uint32_t value = val64;
+
+    addr = offset >> 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on addr passed figure out which timer is being used.
+     */
+    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
+        timer = 1;
+        addr -= R_TIM1_MAX;
+    }
+
+    st = &t->timers[timer];
+
+    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)", offset,
+            value, timer);
+
+    switch (addr) {
+    case R_TIM_CTRL:
+        st->regs[R_TIM_CTRL] = value;
+        timer_update(st);
+        break;
+
+    case R_TIM_RIS:
+        if (value & TIMER_RIS_ACK) {
+            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
+        }
+        break;
+
+    case R_TIM_LOADVAL:
+        st->regs[R_TIM_LOADVAL] = value;
+        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
+            timer_update(st);
+        }
+        break;
+
+    case R_TIM_BGLOADVAL:
+        st->regs[R_TIM_BGLOADVAL] = value;
+        st->regs[R_TIM_LOADVAL] = value;
+        break;
+
+    case R_TIM_VAL:
+    case R_TIM_MIS:
+        break;
+
+    default:
+        if (addr < R_TIM1_MAX) {
+            st->regs[addr] = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
+            return;
+        }
+        break;
+    }
+    timer_update_irq(st);
+}
+
+static const MemoryRegionOps timer_ops = {
+    .read = timer_read,
+    .write = timer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4
+    }
+};
+
+static void timer_hit(void *opaque)
+{
+    struct Msf2Timer *st = opaque;
+
+    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
+
+    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
+        timer_update(st);
+    }
+    timer_update_irq(st);
+}
+
+static void mss_timer_init(Object *obj)
+{
+    MSSTimerState *t = MSS_TIMER(obj);
+    int i;
+
+    /* Init all the ptimers.  */
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
+        st->bh = qemu_bh_new(timer_hit, st);
+        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
+        ptimer_set_freq(st->ptimer, t->freq_hz);
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
+    }
+
+    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSS_TIMER,
+                          NUM_TIMERS * R_TIM1_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
+}
+
+static const VMStateDescription vmstate_timers = {
+    .name = "mss-timer-block",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PTIMER(ptimer, struct Msf2Timer),
+        VMSTATE_UINT32_ARRAY(regs, struct Msf2Timer, R_TIM1_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_mss_timer = {
+    .name = TYPE_MSS_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(freq_hz, MSSTimerState),
+        VMSTATE_STRUCT_ARRAY(timers, MSSTimerState, NUM_TIMERS, 0,
+                vmstate_timers, struct Msf2Timer),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property mss_timer_properties[] = {
+    /* Libero GUI shows 100Mhz as default for clocks */
+    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
+                      100 * 1000000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mss_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = mss_timer_properties;
+    dc->vmsd = &vmstate_mss_timer;
+}
+
+static const TypeInfo mss_timer_info = {
+    .name          = TYPE_MSS_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSSTimerState),
+    .instance_init = mss_timer_init,
+    .class_init    = mss_timer_class_init,
+};
+
+static void mss_timer_register_types(void)
+{
+    type_register_static(&mss_timer_info);
+}
+
+type_init(mss_timer_register_types)
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 15cce1c531..8c19eac3b6 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
 
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
+common-obj-$(CONFIG_MSF2) += mss-timer.o
-- 
2.14.1

