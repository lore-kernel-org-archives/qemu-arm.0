Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp159150lfb;
        Thu, 21 Jan 2021 11:07:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlbQ6Z4MBHUnsPZyh6offliQPZ/zttegSMf6qaDlHEUM3Xy2mhXtrzllaF6KD9jeu4nxXO
X-Received: by 2002:a25:2554:: with SMTP id l81mr1181493ybl.124.1611256059787;
        Thu, 21 Jan 2021 11:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256059; cv=none;
        d=google.com; s=arc-20160816;
        b=VhT3HjT24VspEdYIz03F860KyfqE6NmHNrUeVdxDZEEH+RMWVF8ZH2OwVtHkQUKSMK
         tk2OCbHAubucs3mNpy+mmX/nTcCs9cp8m3jz1vPbF0ar4lFlrUyf5TFNNRl9n8ze5mlI
         Zs7rl7AUfDyLq4CXhi0mDdoYvQoV9nwvMiKLm8Eh1vo3oGczxb96upu4yCLOBx1iHanS
         6GxOEyCOX9stGndHYrDYwkiTH/R2fbxPeLZTgRGxLOy+ERT/pg242GqlFOjZPLlySjlx
         NOGiKoY13VcIMZc4iysmz2HkwHA73DPqOjWb1JPz8GLkMtkThJiSp4q+6we4Jtbci2et
         w1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CMkjp0id/Ultib0Bf01Fa0R4lEkPZ5/dYQA5kFPJtl0=;
        b=YWjR+T48f0Z0AGbvBzMR16WgcUBQGpnQOVIVdXTJgsPI4qi/2jTJ+9y8roKwwZFqee
         jUpcHCDqC9QnyoOJUdaz/VDIZ17JrfCvCTwVHdBR/X7M7gdbBhTkECBL+37WNgQEPn9D
         bQrbxyjf83KpXXw+LGtJIm9KbaOFGK9zh5qcYoyQXU3OzUe2Cyql0hzFOXqnzBQogjRo
         HUlmG69O0gvBnGJXvuiXYf8+jOVsZUcBDDK2u4UP+q/BATluU9RMrkWcH/hoe26mbpZQ
         4+RxuDAyXwRBxTZpzuvCFaAG+NROe7Jl+bkgX6PC6jFmL/sJaS3dugKtH3Z8QkIFYU8z
         qoVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzR2c6Lc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x136si5929833ybg.168.2021.01.21.11.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzR2c6Lc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fIx-0002xW-3M
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI2-0002B3-DH
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:32891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHq-0005ka-Nz
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so2830883wrz.0
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMkjp0id/Ultib0Bf01Fa0R4lEkPZ5/dYQA5kFPJtl0=;
 b=ZzR2c6LcIZG+nAvsY8WT9NBeBekCHgIaKMSHtduHxKdS8aEKGaivd62tbC7yz7/7HG
 iZPqSndP3TLv4W0696PeTouTpl9oEoJQ1wpUSeIfSDpsWXPs0myMNMY/xr/NTndZpStA
 E6vT78LnVR21gmhRu2i3X7t/av/rD2jm9l4zoriX1NO8rY/R9p2pxph0znXM1UI95uXk
 BOAm6BqjDjp2kG+RRxI6OPR+dFXgUP9GJRGCEzuzEmHxeIo4InUDkBVkGX9MeTp6wggM
 GEuvtthWVEIFNNsrxWaxH6Uek67sO19X0Fx/g5YH1aT9MtIxGx9Z6mJdpsGIMXbSOqVu
 GFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMkjp0id/Ultib0Bf01Fa0R4lEkPZ5/dYQA5kFPJtl0=;
 b=HP5jJHBKrW4gMPF4pS2537AZd+tAFOST7vY+1G7AmHqIKcWplI8bCaaZNvkuOn1Uy2
 9hZs5kVvG3tHpTFrhktg0fBXiFipSuGcGi1nWaNyvNiZnDAn3BoSgM1eZJEwx3lSoioX
 l9pq29G1W6g5yofin+gJAN2eC/cWa3h3/nA0Cr+fcBwGhqSpJTaq1/kjL3eqamINIigk
 cZ+sBnrEP12G6HlMKoLhmSaTxzKvfZi8DZLF5DQm9me85p2Mg+FuSZp6pRRDKm7fhl5b
 2t1fFaAy+96/GgBPHXA96kE8gS0FXXN8kTzwzIOhQ8v9etfxjHAKho0GWdT1P0NdVY52
 bS9w==
X-Gm-Message-State: AOAM531H1bW2y/bO9tBT9kECaJ9ano5+Q9dzqtFQqXX/pWtLIvWhoAHz
 ng1XGtNqK4QAh7BlQyiH3DUryzfyJp1nlA==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr912137wrr.326.1611255986528; 
 Thu, 21 Jan 2021 11:06:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/25] ptimer: Add new ptimer_set_period_from_clock() function
Date: Thu, 21 Jan 2021 19:05:58 +0000
Message-Id: <20210121190622.22000-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: caXLxi8h8jWw

The ptimer API currently provides two methods for setting the period:
ptimer_set_period(), which takes a period in nanoseconds, and
ptimer_set_freq(), which takes a frequency in Hz.  Neither of these
lines up nicely with the Clock API, because although both the Clock
and the ptimer track the frequency using a representation of whole
and fractional nanoseconds, conversion via either period-in-ns or
frequency-in-Hz will introduce a rounding error.

Add a new function ptimer_set_period_from_clock() which takes the
Clock object directly to avoid the rounding issues.  This includes a
facility for the user to specify that there is a frequency divider
between the Clock proper and the timer, as some timer devices like
the CMSDK APB dualtimer need this.

To avoid having to drag in clock.h from ptimer.h we add the Clock
type to typedefs.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Side note, I forget why we didn't go for 64.32 fixedpoint for the
Clock too.  I kinda feel we might run into the "clocks can't handle
periods greater than 4 seconds" limit some day.  Hopefully we can
backwards-compatibly expand it if that day ever comes...

The 'divisor' functionality seemed like the simplest way to get
to what I needed for the dualtimer; perhaps we should think about
whether we can have generic lightweight support for clock
frequency divider/multipliers...
---
 include/hw/ptimer.h     | 22 ++++++++++++++++++++++
 include/qemu/typedefs.h |  1 +
 hw/core/ptimer.c        | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 412763fffb2..c443218475b 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -165,6 +165,28 @@ void ptimer_transaction_commit(ptimer_state *s);
  */
 void ptimer_set_period(ptimer_state *s, int64_t period);
 
+/**
+ * ptimer_set_period_from_clock - Set counter increment from a Clock
+ * @s: ptimer to configure
+ * @clk: pointer to Clock object to take period from
+ * @divisor: value to scale the clock frequency down by
+ *
+ * If the ptimer is being driven from a Clock, this is the preferred
+ * way to tell the ptimer about the period, because it avoids any
+ * possible rounding errors that might happen if the internal
+ * representation of the Clock period was converted to either a period
+ * in ns or a frequency in Hz.
+ *
+ * If the ptimer should run at the same frequency as the clock,
+ * pass 1 as the @divisor; if the ptimer should run at half the
+ * frequency, pass 2, and so on.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block.
+ */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clock,
+                                  unsigned int divisor);
+
 /**
  * ptimer_set_freq - Set counter frequency in Hz
  * @s: ptimer to configure
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 976b529dfb5..68deb74ef6f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -34,6 +34,7 @@ typedef struct BlockDriverState BlockDriverState;
 typedef struct BusClass BusClass;
 typedef struct BusState BusState;
 typedef struct Chardev Chardev;
+typedef struct Clock Clock;
 typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
 typedef struct CPUAddressSpace CPUAddressSpace;
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 2aa97cb665c..6ba19fd9658 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -15,6 +15,7 @@
 #include "sysemu/qtest.h"
 #include "block/aio.h"
 #include "sysemu/cpus.h"
+#include "hw/clock.h"
 
 #define DELTA_ADJUST     1
 #define DELTA_NO_ADJUST -1
@@ -348,6 +349,39 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     }
 }
 
+/* Set counter increment interval from a Clock */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
+                                  unsigned int divisor)
+{
+    /*
+     * The raw clock period is a 64-bit value in units of 2^-32 ns;
+     * put another way it's a 32.32 fixed-point ns value. Our internal
+     * representation of the period is 64.32 fixed point ns, so
+     * the conversion is simple.
+     */
+    uint64_t raw_period = clock_get(clk);
+    uint64_t period_frac;
+
+    assert(s->in_transaction);
+    s->delta = ptimer_get_count(s);
+    s->period = extract64(raw_period, 32, 32);
+    period_frac = extract64(raw_period, 0, 32);
+    /*
+     * divisor specifies a possible frequency divisor between the
+     * clock and the timer, so it is a multiplier on the period.
+     * We do the multiply after splitting the raw period out into
+     * period and frac to avoid having to do a 32*64->96 multiply.
+     */
+    s->period *= divisor;
+    period_frac *= divisor;
+    s->period += extract64(period_frac, 32, 32);
+    s->period_frac = (uint32_t)period_frac;
+
+    if (s->enabled) {
+        s->need_reload = true;
+    }
+}
+
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
-- 
2.20.1

