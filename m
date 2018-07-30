Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3979848wru;
        Mon, 30 Jul 2018 09:43:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpefwO6Q5m4/Ff+ft6jWlJOfcJu4WRjd+sI9Pm+vdsub2v7wgcfplRvNtJMRO1RCpT2R00Y6
X-Received: by 2002:ac8:2f42:: with SMTP id k2-v6mr17216929qta.169.1532969019133;
        Mon, 30 Jul 2018 09:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532969019; cv=none;
        d=google.com; s=arc-20160816;
        b=RqYog4814SF4+chUX9g41cwuHlaP8xPZidQ4rglbBoRZgxA28kKjKPrSTZvqHKKncK
         ePvPnml1u38pcfQiemR+qLFTHKHS6IuP0RFQQRVp31l7sbm/P+0/vbhUbUjiqT40oF5Z
         46T0yIW35cYFzR8Bd5hMzk5vtSnDO7PfjekZEDOwrFzJxo2LQuGjip2d7jQehnqIlkJj
         UIsa8BB6nGc367kUtI3jBK3Gp/qDHji+OVAZePumsGrSYuM6f7E2ViOxw86jKcIzsucA
         aN+Y65pvwYRZnPI+bKwzQS/DZ74+DH9C14k0fa0wYupKsLnYdEYm1oOERzGcFCAVFgZl
         EFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=k5b3CnNZN8B+afyGWo6b49lhUH4Pd2pozwGh+SnSiHo=;
        b=I5nrIJV/vuodF/lvmR7ZFkkFNsUOPSURMfdhRSU8T/FixgTbtPfWomyuGAhA4Afc5b
         rLi/UP0mXMyK3VcLnToGj8u2hHn+lRyTYSXbQPQvLDmxbb0f12h75blUyQl+Bi11XbzR
         vlvVM1kDYgGOWF3AwwC8PCZblsewQfxNKXF+uZpJh2gBqFId9dqh9G0ueAZopnEXKHjE
         PjgZyTBoZLT2SRWnvNj0/0G3bOTPbwHY83N2ApWarSZHP36mvfLOY1qiRIOhj7bq943C
         MUnaFnYElEErWkBpZuoweTeFMthlv58cLw8TNbNPHR5t01IIGMkp54Impj5MyQjBoC1N
         kFFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l6-v6si4698431qvc.189.2018.07.30.09.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 09:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkBGk-0008SO-DK
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 12:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyr-0001NT-DU
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyp-0001Ds-Tk
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fkAyn-0001Ab-7C; Mon, 30 Jul 2018 12:25:05 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fkAyh-0004KN-SZ; Mon, 30 Jul 2018 17:24:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 30 Jul 2018 17:24:54 +0100
Message-Id: <20180730162458.23186-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 1/5] hw/misc/mps2-fpgaio: Implement 1Hz and
 100Hz counters
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vl4FRY4wK8UL

The MPS2 FPGAIO block includes some simple free-running counters.
Implement these.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-fpgaio.h |  4 +++
 hw/misc/mps2-fpgaio.c         | 53 ++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index eedf17ebc6d..ec057d38c76 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,6 +38,10 @@ typedef struct {
     uint32_t misc;
 
     uint32_t prescale_clk;
+
+    /* These hold the CLOCK_VIRTUAL ns tick when the CLK1HZ/CLK100HZ was zero */
+    int64_t clk1hz_tick_offset;
+    int64_t clk100hz_tick_offset;
 } MPS2FPGAIO;
 
 #endif
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 7394a057d82..bbc28f641f0 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-fpgaio.h"
+#include "qemu/timer.h"
 
 REG32(LED0, 0)
 REG32(BUTTON, 8)
@@ -32,10 +33,21 @@ REG32(PRESCALE, 0x1c)
 REG32(PSCNTR, 0x20)
 REG32(MISC, 0x4c)
 
+static uint32_t counter_from_tickoff(int64_t now, int64_t tick_offset, int frq)
+{
+    return muldiv64(now - tick_offset, frq, NANOSECONDS_PER_SECOND);
+}
+
+static int64_t tickoff_from_counter(int64_t now, uint32_t count, int frq)
+{
+    return now - muldiv64(count, NANOSECONDS_PER_SECOND, frq);
+}
+
 static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(opaque);
     uint64_t r;
+    int64_t now;
 
     switch (offset) {
     case A_LED0:
@@ -54,10 +66,15 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
         r = s->misc;
         break;
     case A_CLK1HZ:
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        r = counter_from_tickoff(now, s->clk1hz_tick_offset, 1);
+        break;
     case A_CLK100HZ:
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        r = counter_from_tickoff(now, s->clk100hz_tick_offset, 100);
+        break;
     case A_COUNTER:
     case A_PSCNTR:
-        /* These are all upcounters of various frequencies. */
         qemu_log_mask(LOG_UNIMP, "MPS2 FPGAIO: counters unimplemented\n");
         r = 0;
         break;
@@ -76,6 +93,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
                               unsigned size)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(opaque);
+    int64_t now;
 
     trace_mps2_fpgaio_write(offset, value, size);
 
@@ -100,6 +118,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
                       "MPS2 FPGAIO: MISC control bits unimplemented\n");
         s->misc = value;
         break;
+    case A_CLK1HZ:
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        s->clk1hz_tick_offset = tickoff_from_counter(now, value, 1);
+        break;
+    case A_CLK100HZ:
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        s->clk100hz_tick_offset = tickoff_from_counter(now, value, 100);
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO write: bad offset 0x%x\n", (int) offset);
@@ -116,11 +142,14 @@ static const MemoryRegionOps mps2_fpgaio_ops = {
 static void mps2_fpgaio_reset(DeviceState *dev)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(dev);
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     trace_mps2_fpgaio_reset();
     s->led0 = 0;
     s->prescale = 0;
     s->misc = 0;
+    s->clk1hz_tick_offset = tickoff_from_counter(now, 0, 1);
+    s->clk100hz_tick_offset = tickoff_from_counter(now, 0, 100);
 }
 
 static void mps2_fpgaio_init(Object *obj)
@@ -133,6 +162,24 @@ static void mps2_fpgaio_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static bool mps2_fpgaio_counters_needed(void *opaque)
+{
+    /* Currently vmstate.c insists all subsections have a 'needed' function */
+    return true;
+}
+
+static const VMStateDescription mps2_fpgaio_counters_vmstate = {
+    .name = "mps2-fpgaio/counters",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = mps2_fpgaio_counters_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
+        VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription mps2_fpgaio_vmstate = {
     .name = "mps2-fpgaio",
     .version_id = 1,
@@ -142,6 +189,10 @@ static const VMStateDescription mps2_fpgaio_vmstate = {
         VMSTATE_UINT32(prescale, MPS2FPGAIO),
         VMSTATE_UINT32(misc, MPS2FPGAIO),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &mps2_fpgaio_counters_vmstate,
+        NULL
     }
 };
 
-- 
2.17.1

