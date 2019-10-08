Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5441024wrm;
        Tue, 8 Oct 2019 10:26:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyj/N0TW0Z+PTxlSqPvRjvvUgtRUtyRV2wsgcqGrBZQR0WygNM/QNczvQM38Dp3SKnX7zry
X-Received: by 2002:ac8:2497:: with SMTP id s23mr36247158qts.329.1570555614816;
        Tue, 08 Oct 2019 10:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555614; cv=none;
        d=google.com; s=arc-20160816;
        b=k3SIppF0yVj6yMF3NVVJJPbX4C06Qwt4xnIXxyNqAmC28zSKCBGoBYlP4+rqbjKjg1
         c7Z2E2/4adlI53qNqlzutydsvOfU4EDzmtLRqduoob9GB3Z5Ts7uJ/OOTPCWp2Fk7H5x
         HxyxzR6avLu5YbHPV8+riWBT5dlgXo7JywW0GE5HZMb7lWH4lh25k6oCHvaju+XJoAFe
         w7PXnn2i+PoAZfaN1rFaJAEoGRe6W0QRDb+WY0C8oN4CN6S0EhOCzanSjGQv1cYwLDPV
         Hwpd1IU9PBUNQS5npbE5NapsnhTe+oebJVZ1gWepu1UnXQsMoO7n3Q2CZLi4kiSqkRf2
         8Eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YIQRxGhBJ1X9p2Nl8IBpa05pvQdkYgoMHZ4M5gIxc50=;
        b=x8wJs+eujomBakemXgFFwMWSURqoH5fzejMqdun636JwhAtqXhftS7vCnRxKzNzF7M
         MCXSopTa3MIt27dIJ3/SJx0/viZyUVbaURXlV3ko1S5CIAb8wqFCgod/3qgWZr8DHXBw
         NGQcOzGSPId7XKk8JP5ko1DIX/KzoMriy5ZEFB7Oxl6Hob4wE44WluH8BFCI9qT6uDsC
         cqSpnrE1pgY2NoYKVc8Nd0RJQNQNSQKIHeAK41H1gFBkcOPJFHHktd/scFXSyqYBEURq
         28F7QEUV6u+zsj8i7nDtP6sTxc8LodMBUCsdF1bITW/OdpRvysdhdGc5H7mEr5yVtWum
         eK2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aaFIl2VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v129si15054260qka.262.2019.10.08.10.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aaFIl2VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtG9-0006rl-Nh
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7U-0006gh-IV
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7S-0002Gu-Kd
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7S-0002G1-5N
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:54 -0400
Received: by mail-wr1-x444.google.com with SMTP id z9so20279760wrl.11
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIQRxGhBJ1X9p2Nl8IBpa05pvQdkYgoMHZ4M5gIxc50=;
 b=aaFIl2VC5JOv/pFyQjeRHvAwjPepmBx6g920gmzsD4G63E3y8uXibOnKGJDy7hLMie
 5dmFkMcnc8DmT/biSoi6QzvwugyESvongUEiXp6VWDrYBjwQag1kXeRIl//MkZspe8KH
 MkBQQvfTKIkge6MLFnx8M6f2SWAkL1jT+EiX+PDhw8dmXD7zdjSFVU5u88iif+PIMrYZ
 BnWPbVTgMQI/xYPn0Zt7/rBNtfaLsyBE7PQtHm63sUJlHq/sgoDQHUMiwSlmhsMuLNpC
 fNnye94oYEpv6x0U9dM3kR7ZT5vbJjTzucamxpuiFZplPQJUVPcIwIU7peoMm682Q2cg
 o4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIQRxGhBJ1X9p2Nl8IBpa05pvQdkYgoMHZ4M5gIxc50=;
 b=I1ymSb5vBJIxzlnyuer7+HvMGUeTdUVBP/wQ45+weQtOimUQAfs414JuwgWlR+xS4T
 uwflevuP53368HA6lkjV51Q2AVowqBM48kJ5++/vKpblFrbLsPqGxttNvVXE/eSjmxzH
 YivxLSVH2Va6M3jVm4AqlkKhReNitFY2ByQmS+ZGSRbTDliiEdYS73+en1aDd7fMOrO0
 5OcMdNJIRpZmcs1oYVkuP/OMf/+BC2FmySbvIimrT/F0yFLDgMa0dwGuoGZ2uTnIlcPi
 rCtMyc0TJtSWZ1oEU/xqc4BBySQOYNuNKQ/LK+QaLCnrfd2jL5GTVYUirOXK35b9YDuS
 Rc1A==
X-Gm-Message-State: APjAAAUGvj/k0VRJKxyGeByOs6DuSE/9kLWd6CePwJLRuqrQ0ewNwdNF
 Uupbmpn4PVHIjuGj1gRb+LkJT/NKyGpadw==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr10300156wrp.172.1570555072858; 
 Tue, 08 Oct 2019 10:17:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/21] hw/timer/arm_mptimer.c: Switch to transaction-based
 ptimer API
Date: Tue,  8 Oct 2019 18:17:26 +0100
Message-Id: <20191008171740.9679-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-TUID: 6xVHxLq1pORC

Switch the arm_mptimer.c code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_mptimer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 2a54a011431..fdf97d1800f 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -27,7 +27,6 @@
 #include "hw/timer/arm_mptimer.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/core/cpu.h"
 
@@ -65,6 +64,7 @@ static inline uint32_t timerblock_scale(uint32_t control)
     return (((control >> 8) & 0xff) + 1) * 10;
 }
 
+/* Must be called within a ptimer transaction block */
 static inline void timerblock_set_count(struct ptimer_state *timer,
                                         uint32_t control, uint64_t *count)
 {
@@ -77,6 +77,7 @@ static inline void timerblock_set_count(struct ptimer_state *timer,
     ptimer_set_count(timer, *count);
 }
 
+/* Must be called within a ptimer transaction block */
 static inline void timerblock_run(struct ptimer_state *timer,
                                   uint32_t control, uint32_t load)
 {
@@ -124,6 +125,7 @@ static void timerblock_write(void *opaque, hwaddr addr,
     uint32_t control = tb->control;
     switch (addr) {
     case 0: /* Load */
+        ptimer_transaction_begin(tb->timer);
         /* Setting load to 0 stops the timer without doing the tick if
          * prescaler = 0.
          */
@@ -132,8 +134,10 @@ static void timerblock_write(void *opaque, hwaddr addr,
         }
         ptimer_set_limit(tb->timer, value, 1);
         timerblock_run(tb->timer, control, value);
+        ptimer_transaction_commit(tb->timer);
         break;
     case 4: /* Counter.  */
+        ptimer_transaction_begin(tb->timer);
         /* Setting counter to 0 stops the one-shot timer, or periodic with
          * load = 0, without doing the tick if prescaler = 0.
          */
@@ -143,8 +147,10 @@ static void timerblock_write(void *opaque, hwaddr addr,
         }
         timerblock_set_count(tb->timer, control, &value);
         timerblock_run(tb->timer, control, value);
+        ptimer_transaction_commit(tb->timer);
         break;
     case 8: /* Control.  */
+        ptimer_transaction_begin(tb->timer);
         if ((control & 3) != (value & 3)) {
             ptimer_stop(tb->timer);
         }
@@ -160,6 +166,7 @@ static void timerblock_write(void *opaque, hwaddr addr,
             timerblock_run(tb->timer, value, count);
         }
         tb->control = value;
+        ptimer_transaction_commit(tb->timer);
         break;
     case 12: /* Interrupt status.  */
         tb->status &= ~value;
@@ -212,9 +219,11 @@ static void timerblock_reset(TimerBlock *tb)
     tb->control = 0;
     tb->status = 0;
     if (tb->timer) {
+        ptimer_transaction_begin(tb->timer);
         ptimer_stop(tb->timer);
         ptimer_set_limit(tb->timer, 0, 1);
         ptimer_set_period(tb->timer, timerblock_scale(0));
+        ptimer_transaction_commit(tb->timer);
     }
 }
 
@@ -260,8 +269,7 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
-        tb->timer = ptimer_init_with_bh(bh, PTIMER_POLICY);
+        tb->timer = ptimer_init(timerblock_tick, tb, PTIMER_POLICY);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
-- 
2.20.1

