Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp949456wrp;
        Thu, 14 Feb 2019 05:02:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZJqrM8dTwyxmDO2wOrav4pIDVF1hAICVxdwWKXnMkxRqM/AFBEM1UfKtc5jyrBXHs/IEWS
X-Received: by 2002:a0d:d58d:: with SMTP id x135mr2949862ywd.488.1550149338799;
        Thu, 14 Feb 2019 05:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149338; cv=none;
        d=google.com; s=arc-20160816;
        b=itkocbZ7KvqYHkhaHYAP2DN65ZU1cJT5ikSUHA6StKzo2p0pQVC2O+vyOZ9DpIc6+1
         A6++fEp1QM+Vqsftn4YFzT7bNIAUVCTamYrgMBzZkIoZVpLw++Gn2hXJRF3mKvSopf6i
         4hcBR0ikx9svdR1gNTY053wNYws3QBn11bOHDDnVIStgeVUBMHeHXRm5RLSdX0Vc/La+
         NdB5iMgjW5ts4r65rB0WB+Cn5fqBDwRK4+r9AeupMwZrMY5Md1/LrbqKlBCbNXaWPMu7
         rYmSejnZD45+K+y+0DIn8//gyL/GpKOG1gpMs08vt9jRUVz9p99mFYNJB7s6x4t14Mz+
         SAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Lin0GiYvYVCL8oSlzJzB40hq7JY2tVdtIrIszLqF2Dw=;
        b=YtK/f4L1+pwoTaWSqFyFkwKZ0THNo0IOEeGxwdfzP7NPdZhsnrRWka/gQdh7NS/sXH
         4fvfvyHpKUlKj5IAFC5ACJsDVIjozVdQG1U+2ILHB/q0bKnfC98HPwf6n7YTiGnLYzvU
         HvzxKdkOUZAs64ok9asFujVO9pCDgQaTMfrdhT8x4bxpt+1tZ2MYT+Sj62R07gXAp2hN
         kbP10Ur+gR0qxmA51RhsxPTT/28ec2/iJMQ0MSmWjImjlbmgi2KE2c09DQCzfpXbdWVp
         kE0n2umphb7/UXDM7LKFv38Zi3siLIDVG36V0GwWFOVEuCIW3iWmqNRg8cCvqe1F0wJx
         vFWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLx2nyUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i206si1290756ybc.93.2019.02.14.05.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:02:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLx2nyUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGeg-00031h-6X
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGe9-0002xd-8n
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGTz-0006Ta-89
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:16 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGTz-0006SZ-18
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:15 -0500
Received: by mail-wm1-x342.google.com with SMTP id j125so5992681wmj.1
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lin0GiYvYVCL8oSlzJzB40hq7JY2tVdtIrIszLqF2Dw=;
	b=hLx2nyUiF8H1HOv9XT4npdod5mk+q9jM6ocePkN15uLeDcj/E1ghPv/MVklrYCPPyy
	k5oBubbH3BZFEe/R4lZk9b3zlvbm65EMT4raR4fUDdXIhGUXDw810YCAwZXzdNGtZ7PV
	hQRTCRTJr1BwotR5ioNiWgc6v0tKwd4m9EMsLMN2pjuwhi6n8E0O7gVzPAnhDS3qhGpx
	19rKtMX5IEgw5TMsNQZsQEusWD7TWyajq/4u8RU0iGLYmbCYssInDDba52YYsBiPNE0s
	UQo0SZHRmlCKEbml07UPUIafDH7o3UmBd8DD+iqfAW0Ol0JUcxM17Js2Ls5FgjAlK5bb
	VLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lin0GiYvYVCL8oSlzJzB40hq7JY2tVdtIrIszLqF2Dw=;
	b=UDlzLkQBRJQXKEIVLzkKHVufTM1fEm0DicIwnJkS27gw9SSNfdOAmntiKHsilk8r8d
	Ep5hjkr1fSyYHAJt5XzVboMQcYkRWFgTDftvl1LUgBGvSGcQVsWpKE/8uOx4KKdUeAm3
	AukCIiRH0/NMiQ2jv/25K0MpaPrMkvNz5jCTJWjEp9BWAsBe1lr6K75fiJzQAOyzfa2b
	ikLz5D7n4ruUbNLonfBiCOaTdzhL96XvgK2UL7tml89fk4gDCobXNKd2H/nh37/CPSGC
	iEVZl6Z7cQDoQbuueWhDMTFB5/sKDwYjXGCyrKd3RAN77jSqv1TOaZ5EP8f57uIu7wIz
	2cVw==
X-Gm-Message-State: AHQUAuYNRHV/42drcWgXT0WTY6RBWZsxk9GNOnOILHZ/gAJO/0Ewd0AY
	ILdsrNiQ1/LyzUeL/htxhhGAUVouuj9P2g==
X-Received: by 2002:a1c:9aca:: with SMTP id c193mr2625756wme.2.1550148674017; 
	Thu, 14 Feb 2019 04:51:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:57 +0000
Message-Id: <20190214125107.22178-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 04/14] hw/timer/pl031: Convert to using trace
 events
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
X-TUID: DBNZn0Y8aP0d

Convert the debug printing in the PL031 device to use trace events,
and augment it to cover the interesting parts of device operation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/pl031.c      | 55 +++++++++++++++++++++++--------------------
 hw/timer/trace-events |  6 +++++
 2 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index f774dcd5223..274ad47a33a 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -18,15 +18,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
-
-//#define DEBUG_PL031
-
-#ifdef DEBUG_PL031
-#define DPRINTF(fmt, ...) \
-do { printf("pl031: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
+#include "trace.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
@@ -44,7 +36,10 @@ static const unsigned char pl031_id[] = {
 
 static void pl031_update(PL031State *s)
 {
-    qemu_set_irq(s->irq, s->is & s->im);
+    uint32_t flags = s->is & s->im;
+
+    trace_pl031_irq_state(flags);
+    qemu_set_irq(s->irq, flags);
 }
 
 static void pl031_interrupt(void * opaque)
@@ -52,7 +47,7 @@ static void pl031_interrupt(void * opaque)
     PL031State *s = (PL031State *)opaque;
 
     s->is = 1;
-    DPRINTF("Alarm raised\n");
+    trace_pl031_alarm_raised();
     pl031_update(s);
 }
 
@@ -69,7 +64,7 @@ static void pl031_set_alarm(PL031State *s)
     /* The timer wraps around.  This subtraction also wraps in the same way,
        and gives correct results when alarm < now_ticks.  */
     ticks = s->mr - pl031_get_count(s);
-    DPRINTF("Alarm set in %ud ticks\n", ticks);
+    trace_pl031_set_alarm(ticks);
     if (ticks == 0) {
         timer_del(s->timer);
         pl031_interrupt(s);
@@ -83,38 +78,49 @@ static uint64_t pl031_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL031State *s = (PL031State *)opaque;
-
-    if (offset >= 0xfe0  &&  offset < 0x1000)
-        return pl031_id[(offset - 0xfe0) >> 2];
+    uint64_t r;
 
     switch (offset) {
     case RTC_DR:
-        return pl031_get_count(s);
+        r = pl031_get_count(s);
+        break;
     case RTC_MR:
-        return s->mr;
+        r = s->mr;
+        break;
     case RTC_IMSC:
-        return s->im;
+        r = s->im;
+        break;
     case RTC_RIS:
-        return s->is;
+        r = s->is;
+        break;
     case RTC_LR:
-        return s->lr;
+        r = s->lr;
+        break;
     case RTC_CR:
         /* RTC is permanently enabled.  */
-        return 1;
+        r = 1;
+        break;
     case RTC_MIS:
-        return s->is & s->im;
+        r = s->is & s->im;
+        break;
+    case 0xfe0 ... 0xfff:
+        r = pl031_id[(offset - 0xfe0) >> 2];
+        break;
     case RTC_ICR:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pl031: read of write-only register at offset 0x%x\n",
                       (int)offset);
+        r = 0;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pl031_read: Bad offset 0x%x\n", (int)offset);
+        r = 0;
         break;
     }
 
-    return 0;
+    trace_pl031_read(offset, r);
+    return r;
 }
 
 static void pl031_write(void * opaque, hwaddr offset,
@@ -122,6 +128,7 @@ static void pl031_write(void * opaque, hwaddr offset,
 {
     PL031State *s = (PL031State *)opaque;
 
+    trace_pl031_write(offset, value);
 
     switch (offset) {
     case RTC_LR:
@@ -134,7 +141,6 @@ static void pl031_write(void * opaque, hwaddr offset,
         break;
     case RTC_IMSC:
         s->im = value & 1;
-        DPRINTF("Interrupt mask %d\n", s->im);
         pl031_update(s);
         break;
     case RTC_ICR:
@@ -142,7 +148,6 @@ static void pl031_write(void * opaque, hwaddr offset,
            cleared when bit 0 of the written value is set.  However the
            arm926e documentation (DDI0287B) states that the interrupt is
            cleared when any value is written.  */
-        DPRINTF("Interrupt cleared");
         s->is = 0;
         pl031_update(s);
         break;
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 0144a68951c..12eb505fee7 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -77,3 +77,9 @@ xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min, int sec
 nrf51_timer_read(uint64_t addr, uint32_t value, unsigned size) "read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nrf51_timer_write(uint64_t addr, uint32_t value, unsigned size) "write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 
+# hw/timer/pl031.c
+pl031_irq_state(int level) "irq state %d"
+pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl031_alarm_raised(void) "alarm raised"
+pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
-- 
2.20.1

