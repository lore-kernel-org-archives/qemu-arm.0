Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp153052lfo;
        Thu, 28 Jan 2021 03:54:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFv9f162dffMdGo4sOxCwyIOx//YYmQFn86aMwWso7687Quk3S7aQ32ytoRZuBcGGDHjD8
X-Received: by 2002:a25:df94:: with SMTP id w142mr7627143ybg.14.1611834866275;
        Thu, 28 Jan 2021 03:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834866; cv=none;
        d=google.com; s=arc-20160816;
        b=WcY8WOK1nw7XHgxrEBiILwmrGrfpLxoSmCh1aVKKFncrysTqHW8J93CMAGUqkbFQMK
         gLquVuJVNjMTJERWnP4Gno4H2KIo1lvaWNa00NRBAfZ0F0xOgYmnmGDwFBXFADAIeU18
         y0sE9mrXuGk6S01+t0WhzVgxAkB5uJwC0KEITvemzYIyD2godNseeN93YVTs7dTr4ys+
         95+lvIOnPUNR8ABUn7lcwrtNkPHpm9dQZza6ekP1pPWpvaoEkd9T2SB61NW+TmmleUGc
         FLHToh+M6sOZV7545pCXHctg9PRCHIoMRC6nM7s8RRPLpQsaWpbIYSfOHg4I4tnck6fp
         cXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PcyyQtxEfK2y+OFK30UnD/QXT/ftSlQorAj3S+Fk7FE=;
        b=eeownXRIa5COAqFJgofEyKkl+gAUUO6FjAiqYmg3NLHlk6Jk30v9Y69EScf2p18CiF
         PLChq/W3P/H3RuqrsPLxGwHOVkVw1/0ofZTWYndsxS9FIcmjF3SgZu509AqHBbzCsZdj
         dy5eVVyZ2ucczk4yMfX4sXKOOVlh8xoi9ndjkctvsk+8erxi8InlXZZmDIaYGQsws7WG
         yKX7QdUiHRd6qoOf+TD4SN/nUfvt0Bqvk4o7FDga69EPygfG8/FX4TSIOpD3JN1cthFH
         kTjEeuDzone9X7yrMbGrmhftAXcPba4s1vojAmWv30jocSkEIVxH0HAbeMY9s3yxzoZ2
         reiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfN5rLMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si5154624ybt.235.2021.01.28.03.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfN5rLMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55sX-0001Yl-Mu
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gY-0001FS-CK
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gS-000671-Ob
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:02 -0500
Received: by mail-wr1-x430.google.com with SMTP id d16so5019448wro.11
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PcyyQtxEfK2y+OFK30UnD/QXT/ftSlQorAj3S+Fk7FE=;
 b=qfN5rLMp4qA3iy1d2aPpnmztm8v/X2d7qe0H9nmWjWPmXeY6rZ5J6m7V0wdSbr69ZK
 w3pRDzS4IEulRYFOV5aaHoV6e8n4SfzlH4Kvjl+qLoUO4ED80DQjGWc5dD6O3UMSEMta
 zYXYTuZxkNEayxxyHDdk+hGrB6QWXV4FM777Z2C6h/Of3wAIt0KZmuBlZSQNPrXehXgv
 kPqL3h9HaSU+qX5O6Jd0+hMzUD+S/ka66XS/qtJk/rap2Z21uNUF+3ObpBcp0O5SuzV/
 QYIV5jr6quUqfqQZh93bnpNT4T8Bjsdt2i1s26j81bklMvb1VkfOezBNdKb7QNwXD0MW
 Gy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcyyQtxEfK2y+OFK30UnD/QXT/ftSlQorAj3S+Fk7FE=;
 b=hecHu5qeCGDoswN+89HfubkaLgsulAJB8eyL3CVEnHPCPVRb++xJLMs67ijrtVvTSa
 QKkdghRti8TZl+xBR1USqyoU23e6t3sP9g/rkNGYyMZk6El1stgvRaBCs51z0GeAvoSP
 Zdg/vrGUwx3MLB7Zh9lFw+zT0AI2v5JuFKZfyr7Bvwbkp74g5+ZsALeEfGp7Dvg/Wgry
 QhBrIGragFyV8Arlw8VILCz5yIi3X10z/NGaOAgWKoxQogg/0+EXzucFl1FAZCMsnDWn
 0KxbMoZddpPfOP0SbKvoezDobuORCF0ymkeMF6jLdG4QtX0jLHsq7H06zvUgzUndS7u9
 tdaQ==
X-Gm-Message-State: AOAM531TSmoz1seS5aewI01oWeKwMwjEzkMfY2aeZorzsonfpu9BrZTP
 qqdDOS7NEIQpXEd3XKu/SP4ncqZyixXJUg==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr15796220wrq.265.1611834115157; 
 Thu, 28 Jan 2021 03:41:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
Date: Thu, 28 Jan 2021 11:41:27 +0000
Message-Id: <20210128114145.20536-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: TGmTYpdxhAtS

As the first step in converting the CMSDK_APB_TIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the pclk-frq
property to using the Clock once all the users of this device have
been converted to wire up the Clock.

Since the device doesn't already have a doc comment for its "QEMU
interface", we add one including the new Clock.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-8-peter.maydell@linaro.org
---
 include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
 hw/timer/cmsdk-apb-timer.c         | 7 +++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index baa009bb2da..fc2aa97acac 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -15,11 +15,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
 OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
+/*
+ * QEMU interface:
+ *  + QOM property "pclk-frq": frequency at which the timer is clocked
+ *  + Clock input "pclk": clock for the timer
+ *  + sysbus MMIO region 0: the register bank
+ *  + sysbus IRQ 0: timer interrupt TIMERINT
+ */
 struct CMSDKAPBTimer {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -29,6 +37,7 @@ struct CMSDKAPBTimer {
     qemu_irq timerint;
     uint32_t pclk_frq;
     struct ptimer_state *timer;
+    Clock *pclk;
 
     uint32_t ctrl;
     uint32_t value;
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index ae9c5422540..c63145ff553 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -35,6 +35,7 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "migration/vmstate.h"
 
@@ -212,6 +213,7 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
@@ -236,10 +238,11 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription cmsdk_apb_timer_vmstate = {
     .name = "cmsdk-apb-timer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_PTIMER(timer, CMSDKAPBTimer),
+        VMSTATE_CLOCK(pclk, CMSDKAPBTimer),
         VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
         VMSTATE_UINT32(value, CMSDKAPBTimer),
         VMSTATE_UINT32(reload, CMSDKAPBTimer),
-- 
2.20.1

