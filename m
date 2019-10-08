Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5437176wrm;
        Tue, 8 Oct 2019 10:22:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJF4Hs8ykesmFuX5qZysUZlltOturbT2KHzKkKlTnxdV70pSyACZEl4GYj/aiyP6VZ2Fk6
X-Received: by 2002:a0c:eb10:: with SMTP id j16mr33405343qvp.207.1570555374489;
        Tue, 08 Oct 2019 10:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555374; cv=none;
        d=google.com; s=arc-20160816;
        b=eahE2aypVztxa3TOt3Wv7T6l9iAbwQuGIB191r2FxUG7IXPt/S+FkhAFEMPhIi+qOm
         QE+WlA1gTOl0uRmLsuw19Lvx+LTdXx+OE9Vmt+7TeZljcE0ib/9rWCR7SlMSURLYhclT
         c0DATgPrAp5IyYL93kWj7FeUneMg21D9bleNWY7nb9e3iD9e0uQqagkikuXCZWRUCA60
         RgVctpaVD41DOh5kYm0/Yt+6AqfiadpQe7B5yo586bmOdUY0Bt/mouxVwp+xG0OC1Fh6
         NWcBY9HXs57If8r0qSMl3IJ60N+5GmDdFcG2JIXn264oe2ffo3G2z87LMaNcg9TkKPaN
         AoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vTblCPBR00kWBDdHJQrBVtK3r4jiWKjQ3PNlDp1BYo0=;
        b=UuWMHLGj87PcTGbX1smd23RPi4958NlRNEgzLTLNMjae1ao+dqZSOnlhIdwnocwl0V
         GFYwvVwYcAe2kSaIPrX9U3MKUorau92aaRklDb6YbOSczit3gVn6SfrJwmTPHUkUbIfM
         CmALPal6491XcAw4LwVZgs/jTxDK1VQ2H0I72FyzGBc1kLmtDhd72385hSq4/H9QJ/zX
         HGgKAbTur0F75VRnR22IidSjLa7arzWgiA/U/Dm3yvnTZ0mOx9WPvSQjEYDydOBoLP05
         YYsItnvKRQuLOiDY8xCVzRx2qYQsrpVxrVb23Tq9V1casimoYu/H/qvlo5L0OjnW2SPE
         a6Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7eTfrLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38si16789299qvi.78.2019.10.08.10.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7eTfrLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtCH-0003EP-4X
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7X-0006jC-00
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7U-0002IL-Tw
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:58 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38305)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7U-0002HT-Kb
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:56 -0400
Received: by mail-wr1-x442.google.com with SMTP id w12so20349113wro.5
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vTblCPBR00kWBDdHJQrBVtK3r4jiWKjQ3PNlDp1BYo0=;
 b=R7eTfrLJsXKYaoZP/Ro3jCeyCKMIJz02XWUM7n8bl4bP6tExa0XVBl6wGgan+T7hyW
 nCBvggFHbDwbBpWcI19VC7G2ZnKv/M9d+FnJYD6cMunO3UMXLkmw7O3zldCR4dLoZU4q
 PbPmlCQKJ4G7OwIv/BtUWdSdEqwMxXaeI2Z2C65I6R+sabQVLmXJb/P2NGRWfCJK6vzt
 xOKtDDE/d0rEEDm1mNa9+NMfLODpDahoD0EP9DBsEJ2gSFXRyIutjSs4TdGbLjt9Fs+q
 1M+LIZnXrnF9co7ehxMmRVaef9pdJlAPJklbJCQKX3MYCvpuuYgmRS721brE94haTEwm
 h6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vTblCPBR00kWBDdHJQrBVtK3r4jiWKjQ3PNlDp1BYo0=;
 b=pdrVqu7ru1My32GTnsL2boQB/QBChIxLlhyO60Zu9Z4c/Y0l96dASfrpLCfWsA0n1l
 u5roTeiyn6bxvkZtVWnHZOZ4xCsPjgLJ5P3D8bhd/zvgcXuYvQwbftp7MdpG3tUip1Ls
 3Z0hgq7DBSJ6CcHzTdfSBmIzQI2KocT/9xwTx3wJ/J5e9nULcTAnh2oKWwyc+YFcUkwI
 WO1CE34P3HowDkbYUmZWiq62ASv2DmW7oNQ0tQr3IskJpGSvbS09ZizywQlho6Awh0Gm
 NzPYrWRSAQ3cl5yPzehnfdrXWrw0MUsasqDn39G0AGGw1cLLp8cjLBUkERi5oP87vNoc
 fH3A==
X-Gm-Message-State: APjAAAWwMwmv3eDHXd5Kr2TsQmBCsZ/7LHaCzjtX37uu+Lyz/uaDyVUx
 cz5jqAo2MOxSI9q4jEuQF+DC2yop1aRpUg==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr11391673wrv.396.1570555075246; 
 Tue, 08 Oct 2019 10:17:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/21] hw/timer/cmsdk-apb-timer.c: Switch to
 transaction-based ptimer API
Date: Tue,  8 Oct 2019 18:17:28 +0100
Message-Id: <20191008171740.9679-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bh5abkeZ9CR+

Switch the cmsdk-apb-timer code away from bottom-half based ptimers
to the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-timer.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index c9ce9770cef..40728e85e20 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -29,7 +29,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -121,14 +120,17 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
                           "CMSDK APB timer: EXTIN input not supported\n");
         }
         s->ctrl = value & 0xf;
+        ptimer_transaction_begin(s->timer);
         if (s->ctrl & R_CTRL_EN_MASK) {
             ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
         } else {
             ptimer_stop(s->timer);
         }
+        ptimer_transaction_commit(s->timer);
         break;
     case A_RELOAD:
         /* Writing to reload also sets the current timer value */
+        ptimer_transaction_begin(s->timer);
         if (!value) {
             ptimer_stop(s->timer);
         }
@@ -140,8 +142,10 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
              */
             ptimer_run(s->timer, 0);
         }
+        ptimer_transaction_commit(s->timer);
         break;
     case A_VALUE:
+        ptimer_transaction_begin(s->timer);
         if (!value && !ptimer_get_limit(s->timer)) {
             ptimer_stop(s->timer);
         }
@@ -149,6 +153,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
         if (value && (s->ctrl & R_CTRL_EN_MASK)) {
             ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
         }
+        ptimer_transaction_commit(s->timer);
         break;
     case A_INTSTATUS:
         /* Just one bit, which is W1C. */
@@ -191,9 +196,11 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
     trace_cmsdk_apb_timer_reset();
     s->ctrl = 0;
     s->intstatus = 0;
+    ptimer_transaction_begin(s->timer);
     ptimer_stop(s->timer);
     /* Set the limit and the count */
     ptimer_set_limit(s->timer, 0, 1);
+    ptimer_transaction_commit(s->timer);
 }
 
 static void cmsdk_apb_timer_init(Object *obj)
@@ -210,21 +217,21 @@ static void cmsdk_apb_timer_init(Object *obj)
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBTIMER *s = CMSDK_APB_TIMER(dev);
-    QEMUBH *bh;
 
     if (s->pclk_frq == 0) {
         error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
         return;
     }
 
-    bh = qemu_bh_new(cmsdk_apb_timer_tick, s);
-    s->timer = ptimer_init_with_bh(bh,
+    s->timer = ptimer_init(cmsdk_apb_timer_tick, s,
                            PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
                            PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT |
                            PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
+    ptimer_transaction_begin(s->timer);
     ptimer_set_freq(s->timer, s->pclk_frq);
+    ptimer_transaction_commit(s->timer);
 }
 
 static const VMStateDescription cmsdk_apb_timer_vmstate = {
-- 
2.20.1

