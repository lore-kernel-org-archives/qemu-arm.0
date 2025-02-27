Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp368051njb;
        Thu, 27 Feb 2025 09:04:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9N1ujpffPfGJc5yulmQ0nceg0wMogMrGcwmFdeL/A2jOSwr5bLK/hWdyAtqdDNyDcjKzWf8w63sWqUA==@linaro.org
X-Google-Smtp-Source: AGHT+IHYI81QUzUGcUvfABWRQign6NaCC12gqe80mNSjq79azqy1QyKApnCjDXVS0N8vKN84zg9n
X-Received: by 2002:a05:6214:da8:b0:6e8:96f4:73a with SMTP id 6a1803df08f44-6e8a0d3901dmr2590986d6.19.1740675840753;
        Thu, 27 Feb 2025 09:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740675840; cv=none;
        d=google.com; s=arc-20240605;
        b=JIxFgb4x0xbp5+gHCQivh3EWOWCIGnkCU9iN4F2iA8bNBdTYRlVX1tUg8trVAP0mq4
         7LjSq3EfbpQ4JtSV1Rm48BvgfTrI5ZH011nNRrM005Jk0bZSbgbtIyIQwRWMIfNWVGPg
         Cz4t1l+U47T9KxvI0S2BKc5n1YowpuTIcleuSXMbUzPw8vdTxBSUTwf/9dE0MUlvQJth
         x9zA2dZ+VxhYUPFK+3eUpeJ6zxjeu5RpZCTfgfrDlvzgEIVrHAmIXTe+MoB3Ja5J9xHb
         /EpGwIE5NLmA7ke+A19onkTO4Pg/o59lNc+kpSNXmeFX0m0UbsS8Fe+e9/m5N80qG6WV
         JT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x0ydyJO+hAGBCmhuOK11rHsC8IExSp5z9xqzobRVKxY=;
        fh=z7537GXWlUqmuTKoeXU88MsPgYESq3+Dz9D/2o2RXG0=;
        b=LyNJlunpX8+NcUO1ATiW1Cok4sI/YwBtZBtM5HMwRS5eY2j9pvhnVjCiry6ZHYj0SR
         scpzSa6ncfkY00XAHxUWHvBWLIPbfRqHYT5MJNrAuyBfsdtFG6LyzVxXxA3DlhvMT6Tx
         PxLlt5IcrP1aF6SX0qPyHFRtFL2dbEVkBb4wdaRF02m27ob2w9qhVbQQB17+/DvVFTZ0
         4VOv+ODINbPUX+SSlpnhgBO5x6Bqii3B4/ktk2+9RYeBV7RD37Ih41BSkM0Ie4G4blL0
         M8m8zPdezkcJHdFvZcNZHWGF+Q5Vi2taBmmOY+OLKEnsRFGYH0MP2c54ANmKCX0xdurF
         /eNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuoCST2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0925si15789966d6.232.2025.02.27.09.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 09:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuoCST2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnhIT-0006ya-3S; Thu, 27 Feb 2025 12:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGV-0005Cm-Rr
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 12:01:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGQ-0002La-Ul
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 12:01:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso10930055e9.2
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2025 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675685; x=1741280485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x0ydyJO+hAGBCmhuOK11rHsC8IExSp5z9xqzobRVKxY=;
 b=UuoCST2+HnJsjq2u+WdfkPf1/ZWMcZuW+Ly8KMHfkLJgYkAXdVoVNFfNtxiyF/QRXC
 A7w1l/EYXyY2cN8LT1EZPo5FpsYghiRJ/NayRib8703cK3TRtnVn5kKxgcUH8VB8S+QI
 5ttquJtbwOtcCQXGy5ffMSeeTfCFBYCL7KMziK8mWSlVVXJmz5/yB8soM/dB9goTzuiC
 1Mc+NcQvQOItvpmXsgx8akdHJQx93ae0FhNdUBQXrjUDaiKLnwdGyqABHubSRvVh+kYj
 aOUT+GuBArn9x17g8U/MZEa4vEDjZVcERFEFxr6w+J84G0Y+BQHeSgmal9Wl05IkPLfw
 Zg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675685; x=1741280485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0ydyJO+hAGBCmhuOK11rHsC8IExSp5z9xqzobRVKxY=;
 b=SuH9lUUJBHEaVHTiz9Xe0YeHHG9Kc2ekMXVn4qQq6B7IS7AlaJA5g7UEL3Jdlo8a25
 lQncg9NIEzV4e/j/FPvpnQHdIfpOCNRVuIjfFXzeE4uMDkaJkB47U2Hqs7q1rXbKPmrQ
 4dz7uE5QwOE9BF3uZX4a8IthY66b7WqyHuzyn0arTObI4K20WE2xK5L/bmiJSJLqa6dT
 las4j/h0KDnXZyK+3opSbmORSwE1CCuassUSysRR5GcRz2UuqX53QqUwNbB0DoEGJ8LB
 jmPpZOur8s/iLyCngH3Qbuj3LOulyfqk9KzCgJS/gzn6cF/vjEPieOmrDn1FKPRlVfWQ
 xt3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoxiuxrRwAeimAso9Gvrk3RRmI+RiXUnYJM/HtLz0CyqIw+M9vDWCWGha3UzMZx8fr26kUWK5f+xc9@nongnu.org
X-Gm-Message-State: AOJu0YwR+0rDsj5E1nQynJpYhtEJkL/f+OeNnxM6nVHlRqvf8ASM/5/H
 7LK2Yk3JLosipuMW/Wn34j6bW2yArrhkf0v7ZEhOcl3YZqAWXn02F9HuL7yvbSdjFyiI8y65dDA
 2
X-Gm-Gg: ASbGncv1Q3tWWpbCFShjrsTOiNTyq+sqX4qhz0yG7u8kTl1Kr4kxuETkqkeCRLnWbOD
 oOTBkzmD4V+ZxpJT0lxqRyeXIcTTWkzqBl00p/nVTwt3SdbqzMkG3gMQwMM0lMW40zxQ+PwJeot
 we3GFFdh1XkfHTzZeo/JO4Q0GtT2+mHsHNA3avyFXkeKUlo868mlYRDy5Ad7fBc/LTPFNqU7Nwj
 XoL1hlyktnqRfHHYQNGuWkgK+zb9pFXClMsaqJeYIOIH6KrOsqCcUvlDaxEaH0HqK58u1xW/jNE
 x1/pxS5yymemYPr6WaI2cJVwPpw3YKIp
X-Received: by 2002:a05:600c:4e8b:b0:439:6101:5440 with SMTP id
 5b1f17b1804b1-43ab8fd875dmr70840565e9.8.1740675683826; 
 Thu, 27 Feb 2025 09:01:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm62747565e9.39.2025.02.27.09.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:01:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/arm/omap1: Convert information printfs to tracepoints
Date: Thu, 27 Feb 2025 17:01:15 +0000
Message-ID: <20250227170117.1726895-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170117.1726895-1-peter.maydell@linaro.org>
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yy0AMJaDCYpi

The omap1 code uses raw printf() statements to print information
about some events; convert these to tracepoints.

In particular, this will stop the functional test for the sx1
from printing the not-very-helpful note
 "omap_clkm_write: clocking scheme set to synchronous scalable"
to the test's default.log.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c      | 27 ++++++++++++++-------------
 hw/arm/trace-events |  7 +++++++
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 8f5bb81c96a..605e733459c 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -42,6 +42,7 @@
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
 #include "target/arm/cpu-qom.h"
+#include "trace.h"
 
 static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
 {
@@ -1731,8 +1732,7 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
     case 0x18:	/* ARM_SYSST */
         if ((s->clkm.clocking_scheme ^ (value >> 11)) & 7) {
             s->clkm.clocking_scheme = (value >> 11) & 7;
-            printf("%s: clocking scheme set to %s\n", __func__,
-                   clkschemename[s->clkm.clocking_scheme]);
+            trace_omap1_clocking_scheme(clkschemename[s->clkm.clocking_scheme]);
         }
         s->clkm.cold_start &= value & 0x3f;
         return;
@@ -2335,7 +2335,7 @@ static void omap_pwl_update(struct omap_pwl_s *s)
 
     if (output != s->output) {
         s->output = output;
-        printf("%s: Backlight now at %i/256\n", __func__, output);
+        trace_omap1_backlight(output);
     }
 }
 
@@ -2470,8 +2470,8 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
         break;
     case 0x04:	/* VRC */
         if ((value ^ s->vrc) & 1) {
-            if (value & 1)
-                printf("%s: %iHz buzz on\n", __func__, (int)
+            if (value & 1) {
+                trace_omap1_buzz(
                                 /* 1.5 MHz from a 12-MHz or 13-MHz PWT_CLK */
                                 ((omap_clk_getrate(s->clk) >> 3) /
                                  /* Pre-multiplexer divider */
@@ -2487,8 +2487,9 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
                                  /*  80/127 divider */
                                  ((value & (1 << 5)) ?  80 : 127) /
                                  (107 * 55 * 63 * 127)));
-            else
-                printf("%s: silence!\n", __func__);
+            } else {
+                trace_omap1_silence();
+            }
         }
         s->vrc = value & 0x7f;
         break;
@@ -3494,7 +3495,7 @@ static void omap_lpg_tick(void *opaque)
         timer_mod(s->tm, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + s->on);
 
     s->cycle = !s->cycle;
-    printf("%s: LED is %s\n", __func__, s->cycle ? "on" : "off");
+    trace_omap1_led(s->cycle ? "on" : "off");
 }
 
 static void omap_lpg_update(struct omap_lpg_s *s)
@@ -3514,11 +3515,11 @@ static void omap_lpg_update(struct omap_lpg_s *s)
     }
 
     timer_del(s->tm);
-    if (on == period && s->on < s->period)
-        printf("%s: LED is on\n", __func__);
-    else if (on == 0 && s->on)
-        printf("%s: LED is off\n", __func__);
-    else if (on && (on != s->on || period != s->period)) {
+    if (on == period && s->on < s->period) {
+        trace_omap1_led("on");
+    } else if (on == 0 && s->on) {
+        trace_omap1_led("off");
+    } else if (on && (on != s->on || period != s->period)) {
         s->cycle = 0;
         s->on = on;
         s->period = period;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 7790db780e0..70b137a6cfd 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -1,5 +1,12 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# omap1.c
+omap1_clocking_scheme(const char *scheme) "omap1 CLKM: clocking scheme set to %s"
+omap1_backlight(int output) "omap1 PWL: backlight now at %d/256"
+omap1_buzz(int freq) "omap1 PWT: %dHz buzz on"
+omap1_silence(void) "omap1 PWT: buzzer silenced"
+omap1_led(const char *onoff) "omap1 LPG: LED is %s"
+
 # virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
 
-- 
2.43.0

