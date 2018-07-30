Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3977617wru;
        Mon, 30 Jul 2018 09:41:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdDo1sdkk5tifkOPFlCuvwuLvLngsK/3XSZ3EzPpqKwvefYFmKyuir+3l+8Pk14k7EnvrT2
X-Received: by 2002:a0c:c78c:: with SMTP id k12-v6mr15321946qvj.99.1532968875067;
        Mon, 30 Jul 2018 09:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532968875; cv=none;
        d=google.com; s=arc-20160816;
        b=ig09D4G4CvvOOgiq7ry3hRFbXhwy/LqonmCvj9cMiBNOpZkkYhMwNBjG4DVUirphu0
         6IRkE5QzixcHxQzaEJAXORoC72v3jJIGJwOM4gT7HU94XrlPwzZyM4OrboNoDGnardlv
         aQRCJ00ZlJ6IxusXqohk+VU9i1lskL2RreR0ArkXTmpS+r5vqxKAr8v8pabncmlHfKgc
         wbFNBGgT9+4h46pVFuDTaRONtR8hT6HsrwW4h8KWf5Er3i0hDzUpU5pAz6gE5aP9EdMB
         OatRR2+VB4Sj8TX3K0ueu4mXLoIguQyjWJO5NLBa130QF2Ch8D9KL6dU1iphE15suK9S
         VLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ffi50I0gfYL9jf7Ikl3bMfUKUEkmdT/v30Nh5Meex7c=;
        b=tOyNph+DkIB5X5CjOlmKFkoRdLdYztJ/Ez8aumJvnyTCQ387YsEtFi8He7vR2G6aaV
         h6pJ8tFkjHkFXRTP+pXIcTHS2JALrUAEbuaa8MAMfDPuWVzz16Julj7/DE9bh7hglP5e
         RllWcUviSR6GY59R1X93jqDCdcV2AQskkEhMWBl4vwOkBVyUmXoXuLsBKubyUYBYI1nT
         N+v/g0q6jHXowuf9jH83xUNP/0Df0kdOPK0ZDBdS+y7E8vp9Vp3CPAExELVsdW1o75NK
         Dt/0gb2bQTZc1KnH2zkcplOyQTGI3U1O7T4vDh1lMnYoopA/bdOtLYAuOwhS7OhL9hTk
         YIKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y47-v6si8965986qtk.186.2018.07.30.09.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 09:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkBEQ-000784-7r
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 12:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyn-0001JG-Uh
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 12:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAym-0001Be-Hz
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 12:25:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fkAym-0001Ab-8B; Mon, 30 Jul 2018 12:25:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fkAyi-0004Ke-Hj; Mon, 30 Jul 2018 17:25:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 30 Jul 2018 17:24:55 +0100
Message-Id: <20180730162458.23186-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/5] hw/misc/mps2-fpgaio: Implement PSCNTR and
 COUNTER
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AX+dcKhuRt9E

In the MPS2 FPGAIO, PSCNTR is a free-running downcounter with
a reload value configured via the PRESCALE register, and
COUNTER counts up by 1 every time PSCNTR reaches zero.
Implement these counters.

We can just increment the counters migration subsection's
version ID because we only added it in the previous commit,
so no released QEMU versions will be using it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-fpgaio.h |  6 +++
 hw/misc/mps2-fpgaio.c         | 97 +++++++++++++++++++++++++++++++++--
 2 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index ec057d38c76..69e265cd4b2 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -37,6 +37,12 @@ typedef struct {
     uint32_t prescale;
     uint32_t misc;
 
+    /* QEMU_CLOCK_VIRTUAL time at which counter and pscntr were last synced */
+    int64_t pscntr_sync_ticks;
+    /* Values of COUNTER and PSCNTR at time pscntr_sync_ticks */
+    uint32_t counter;
+    uint32_t pscntr;
+
     uint32_t prescale_clk;
 
     /* These hold the CLOCK_VIRTUAL ns tick when the CLK1HZ/CLK100HZ was zero */
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index bbc28f641f0..5cf10ebd66a 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -43,6 +43,77 @@ static int64_t tickoff_from_counter(int64_t now, uint32_t count, int frq)
     return now - muldiv64(count, NANOSECONDS_PER_SECOND, frq);
 }
 
+static void resync_counter(MPS2FPGAIO *s)
+{
+    /*
+     * Update s->counter and s->pscntr to their true current values
+     * by calculating how many times PSCNTR has ticked since the
+     * last time we did a resync.
+     */
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t elapsed = now - s->pscntr_sync_ticks;
+
+    /*
+     * Round elapsed down to a whole number of PSCNTR ticks, so we don't
+     * lose time if we do multiple resyncs in a single tick.
+     */
+    uint64_t ticks = muldiv64(elapsed, s->prescale_clk, NANOSECONDS_PER_SECOND);
+
+    /*
+     * Work out what PSCNTR and COUNTER have moved to. We assume that
+     * PSCNTR reloads from PRESCALE one tick-period after it hits zero,
+     * and that COUNTER increments at the same moment.
+     */
+    if (ticks == 0) {
+        /* We haven't ticked since the last time we were asked */
+        return;
+    } else if (ticks < s->pscntr) {
+        /* We haven't yet reached zero, just reduce the PSCNTR */
+        s->pscntr -= ticks;
+    } else {
+        if (s->prescale == 0) {
+            /*
+             * If the reload value is zero then the PSCNTR will stick
+             * at zero once it reaches it, and so we will increment
+             * COUNTER every tick after that.
+             */
+            s->counter += ticks - s->pscntr;
+            s->pscntr = 0;
+        } else {
+            /*
+             * This is the complicated bit. This ASCII art diagram gives an
+             * example with PRESCALE==5 PSCNTR==7:
+             *
+             * ticks  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14
+             * PSCNTR 7  6  5  4  3  2  1  0  5  4  3  2  1  0  5
+             * cinc                           1                 2
+             * y            0  1  2  3  4  5  6  7  8  9 10 11 12
+             * x            0  1  2  3  4  5  0  1  2  3  4  5  0
+             *
+             * where x = y % (s->prescale + 1)
+             * and so PSCNTR = s->prescale - x
+             * and COUNTER is incremented by y / (s->prescale + 1)
+             *
+             * The case where PSCNTR < PRESCALE works out the same,
+             * though we must be careful to calculate y as 64-bit unsigned
+             * for all parts of the expression.
+             * y < 0 is not possible because that implies ticks < s->pscntr.
+             */
+            uint64_t y = ticks - s->pscntr + s->prescale;
+            s->pscntr = s->prescale - (y % (s->prescale + 1));
+            s->counter += y / (s->prescale + 1);
+        }
+    }
+
+    /*
+     * Only advance the sync time to the timestamp of the last PSCNTR tick,
+     * not all the way to 'now', so we don't lose time if we do multiple
+     * resyncs in a single tick.
+     */
+    s->pscntr_sync_ticks += muldiv64(ticks, NANOSECONDS_PER_SECOND,
+                                     s->prescale_clk);
+}
+
 static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(opaque);
@@ -74,9 +145,12 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
         r = counter_from_tickoff(now, s->clk100hz_tick_offset, 100);
         break;
     case A_COUNTER:
+        resync_counter(s);
+        r = s->counter;
+        break;
     case A_PSCNTR:
-        qemu_log_mask(LOG_UNIMP, "MPS2 FPGAIO: counters unimplemented\n");
-        r = 0;
+        resync_counter(s);
+        r = s->pscntr;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -107,6 +181,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
         s->led0 = value & 0x3;
         break;
     case A_PRESCALE:
+        resync_counter(s);
         s->prescale = value;
         break;
     case A_MISC:
@@ -126,6 +201,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
         now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         s->clk100hz_tick_offset = tickoff_from_counter(now, value, 100);
         break;
+    case A_COUNTER:
+        resync_counter(s);
+        s->counter = value;
+        break;
+    case A_PSCNTR:
+        resync_counter(s);
+        s->pscntr = value;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO write: bad offset 0x%x\n", (int) offset);
@@ -150,6 +233,9 @@ static void mps2_fpgaio_reset(DeviceState *dev)
     s->misc = 0;
     s->clk1hz_tick_offset = tickoff_from_counter(now, 0, 1);
     s->clk100hz_tick_offset = tickoff_from_counter(now, 0, 100);
+    s->counter = 0;
+    s->pscntr = 0;
+    s->pscntr_sync_ticks = now;
 }
 
 static void mps2_fpgaio_init(Object *obj)
@@ -170,12 +256,15 @@ static bool mps2_fpgaio_counters_needed(void *opaque)
 
 static const VMStateDescription mps2_fpgaio_counters_vmstate = {
     .name = "mps2-fpgaio/counters",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = mps2_fpgaio_counters_needed,
     .fields = (VMStateField[]) {
         VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
         VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
+        VMSTATE_UINT32(counter, MPS2FPGAIO),
+        VMSTATE_UINT32(pscntr, MPS2FPGAIO),
+        VMSTATE_INT64(pscntr_sync_ticks, MPS2FPGAIO),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.17.1

