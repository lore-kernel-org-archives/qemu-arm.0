Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp149272lfo;
        Thu, 28 Jan 2021 03:50:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLirQ3xRK/+TpcseI20fw+kFJGYPbW461qhiYifsVxappdXEV8bSL0ZfoNIqRjBPt6fV2R
X-Received: by 2002:a25:1e86:: with SMTP id e128mr23147175ybe.326.1611834614386;
        Thu, 28 Jan 2021 03:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834614; cv=none;
        d=google.com; s=arc-20160816;
        b=naJuV9SLsTKnbl49ZcfzoPTZkDB1rdj4NtK3hnzo4dYA40D0Vzgc0wWvf840eXjppA
         yLjHnUe3KfI86sHeUy96r3l9X9ufGNvX4bE5DflOfrnFDbG+5MPA3yeZ6wlpk1qxPDcB
         WPR4y3DJP5E0zS0oQqUo53YMp0ar5WoKR/HVvImeDS8PJvv3/XZttZavUI99CLVReZmx
         cn7EUaYUSik7K2U9xF64Rwzbk7FZlXmnPoVQhn470bWabX5VCHq3mRDp92oAWqh4PisX
         dhD6j2oLms7tUzD/VQCZrtmvw5Oo9x3wveBCoNmDashYLDxzXuTZvhM5HhovIr4jCzzy
         sTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lnxZhqtkhnY8r8cAKmASAC+5gwFe5OR+EW9jsx4r30I=;
        b=Ri8vjhcY0G/BOZLjJxhPAowBlnpa55hvTseFV4g/CWk2+gqTl+eAwGtBr3a+1akohO
         eE+mbcF8TAeNg2khbJGOlWpzgs3FwyKqR7//t8kz/PkTz7i6e/+PPyK+0fh2tgl99t9V
         Ii9/CFLGmg7iTmNW3rqvi8l62qV8Gl3HqQGV918V1PTZDUWbYLtyb4D5aM/JfRpJJhRo
         n7gC+Erkf1GuvvgGBwz8/VlCqtB+IX0r1oz0RAMdU7Qz+4GVJ4W6O5tGdIqUlleccp6h
         SwslZL0Thjv2XcMfR9FgSKsz0h/oCJtOmfw7TQ9AhRyyvJqCoOkfx0po3YBaZp27imBP
         NMvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="joboC/Lw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si5519673ybj.129.2021.01.28.03.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="joboC/Lw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55oT-0004A5-NZ
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gp-0001cz-Ul
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:19 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gd-0006Cg-Uc
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m2so4050681wmm.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lnxZhqtkhnY8r8cAKmASAC+5gwFe5OR+EW9jsx4r30I=;
 b=joboC/LwkMaPmMA0p5XXNdEhlITVvPRWh/mbxR1x6DbOcuGK0b0EF75nvBhcNs/pTp
 /vcX3EK8lzL3UDINlkye3e4iO0n490rShzQMstZFXbjGR+iwrfECO9nYTB8mWMWUMZiZ
 AmVVM6PNPqFEwOAWr2m7Z7hx4LWzU4JhAbKHe0w9wF8136t92n9tQR4IsjU5RNfplWH5
 Y/ikC04jsktA72Z2gy/kJ7IWwTk9fe5dannrx0iQK+OAqbz/p67/XO8aRa09TJRUiVkI
 UsbF4jJl4SSwiXGMQsxHC/uBsjC+aOEyfiV0Cq6s4dZRkFTFqhJgyk5YJ/heNeINqEu7
 P92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnxZhqtkhnY8r8cAKmASAC+5gwFe5OR+EW9jsx4r30I=;
 b=GtvZXzPJ5Kfhn44sFE6SwkzVxVFC4uLmYjjBmqizXPaaxeoPhYwtkNowgUe1S4WYfo
 Dx03VMqYgZhfVMvd/k1F8VOAInZRDXOA0YjtxA4N59Ejs4+eIdXYv5+Dzbkf7X2wCzqZ
 eZWwUslLJKheOvJF1589boQZxsZY/1zYiwHltMY43qXnGV/+rHxFkcTHotu5VjoQe0Se
 /2AMdxMFEWTS8H9WHR5rzB4dH0Q84g2uUNTbOpR+URF7Iv7FplOQ7JB5dJZRAzCPMOSP
 yVSNGpai6gHrofn/xEeJeIBgjpF4aQnxShEpgvhKKyRg0E0h0tFlgqMTmYtoCTN236Ft
 yUug==
X-Gm-Message-State: AOAM531whVfWY/6oh4GAtUmNzQgUq9ZUuHN5f7iyBiZGfWV3u5guYQza
 OXfir+NyoExcN8Bb/e6qc2uKorHIl40W7Q==
X-Received: by 2002:a1c:e043:: with SMTP id x64mr8465245wmg.48.1611834126547; 
 Thu, 28 Jan 2021 03:42:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
Date: Thu, 28 Jan 2021 11:41:39 +0000
Message-Id: <20210128114145.20536-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ESNtOZPFtnOS

Switch the CMSDK APB dualtimer device over to using its Clock input;
the pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-20-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index 781b496037b..828127b366f 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
     qemu_set_irq(s->timerintc, timintc);
 }
 
+static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
+{
+    /* Return the divisor set by the current CONTROL.PRESCALE value */
+    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
+    case 0:
+        return 1;
+    case 1:
+        return 16;
+    case 2:
+    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
+        return 256;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
                                              uint32_t newctrl)
 {
@@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
         default:
             g_assert_not_reached();
         }
-        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
+        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);
     }
 
     if (changed & R_CONTROL_MODE_MASK) {
@@ -414,7 +430,8 @@ static void cmsdk_dualtimermod_reset(CMSDKAPBDualTimerModule *m)
      * limit must both be set to 0xffff, so we wrap at 16 bits.
      */
     ptimer_set_limit(m->timer, 0xffff, 1);
-    ptimer_set_freq(m->timer, m->parent->pclk_frq);
+    ptimer_set_period_from_clock(m->timer, m->parent->timclk,
+                                 cmsdk_dualtimermod_divisor(m));
     ptimer_transaction_commit(m->timer);
 }
 
@@ -432,6 +449,20 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
     s->timeritop = 0;
 }
 
+static void cmsdk_apb_dualtimer_clk_update(void *opaque)
+{
+    CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
+        CMSDKAPBDualTimerModule *m = &s->timermod[i];
+        ptimer_transaction_begin(m->timer);
+        ptimer_set_period_from_clock(m->timer, m->parent->timclk,
+                                     cmsdk_dualtimermod_divisor(m));
+        ptimer_transaction_commit(m->timer);
+    }
+}
+
 static void cmsdk_apb_dualtimer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -446,7 +477,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
         sysbus_init_irq(sbd, &s->timermod[i].timerint);
     }
-    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
+    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK",
+                                   cmsdk_apb_dualtimer_clk_update, s);
 }
 
 static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
@@ -454,8 +486,8 @@ static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
     CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(dev);
     int i;
 
-    if (s->pclk_frq == 0) {
-        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
+    if (!clock_has_source(s->timclk)) {
+        error_setg(errp, "CMSDK APB dualtimer: TIMCLK clock must be connected");
         return;
     }
 
-- 
2.20.1

