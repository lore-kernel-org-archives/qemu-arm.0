Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp337838wrm;
        Fri, 4 Oct 2019 04:53:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2CVxUwmCZxwHncOCpcCvuVn4FO3Ba21cElyAYu0zdGH9LZy7OgzcPp+v86yZ/LSm7C/aY
X-Received: by 2002:a17:906:7245:: with SMTP id n5mr11880961ejk.173.1570190022423;
        Fri, 04 Oct 2019 04:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570190022; cv=none;
        d=google.com; s=arc-20160816;
        b=DLvf9iUluBxh72lbXwyGjiyqj/tAXHlcSogCr8wmIaIR/hf+I38FCXFVmJ45eCKzWe
         eKafwLnAZOVXNQZDvqQ5wHB6f/itLtD9RxCPNablJgkCgviKPBhJuOaKhDr0jMoaBmtp
         VRB86bZh0jQMv3pmjFU8jicOSSUIAMAOon5z30MOQX2XcAPwBGhpz5/IMOpg82CngCEG
         hSsJCOTB2inntFE8Jii4tiX4ym/Ywg7MgClQ0/u0UR+kfezb0ZArY0dub2kREIBP2tkJ
         dd53NoJysAoB/4Ors8HSJiZPFqZ/25kiSPkMlvlJi4vdZFoYVhp9uTBONv6dEUuFAtLX
         F9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vp4+p4FLQruJ614qug2AywQIur5rU9O0ZC+bqOyPTzg=;
        b=GoQ3jIF4fIJSwEwRea5XEhVfbjSVk7U/z52OrUnxa0fwNz2Tsnr5b1x2W67xxjG2ur
         xt6SHBxhpUFwPv0rnAv0gFDKRtc8SnL0CSq06VJpEpEWkrZjfDnAjU/Alxidod1G8xlh
         +EpB6ZAFwmByQ4DjUw0iVMIje4mq/ys7Y3gPT7BGvxbmdosiQg4YE/cAWjHUFhV8vjH7
         w5LV3f3wu3u1S7oySrjx9PwQMmCKypVRHVP/RBXf6/xbBXyGPObg3cGx0QI5B9JIcDwU
         CLUuucLxa4oyHuRiS9Lgs8bWU/5o12aZXpxeRM9bhJB4uneyAx7/q1cPqLy6a3PBihv7
         qjEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0eYyBKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si2717696ejw.335.2019.10.04.04.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 04:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0eYyBKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGM9U-0008C5-3x
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 07:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGM4x-0003ah-Nw
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGM4w-00017l-A2
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:48:59 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45828)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGM4w-00017O-4M
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:48:58 -0400
Received: by mail-wr1-x443.google.com with SMTP id r5so6753973wrm.12
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2019 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vp4+p4FLQruJ614qug2AywQIur5rU9O0ZC+bqOyPTzg=;
 b=y0eYyBKuPQJhvyzvNExbbBu6LW/3Kxgz85hSt9/HVrhIy+FDQM7xSQXE+ifLU+VkOg
 FRqufp2Rnq4q7dvSYOBS1UYZKKoTvJXE1masHBdAaY9K/NuiPf6Zf/ecrY9qdDmNSACC
 BSez378zfyIJ/OT6T/XXP1rvYXtgePMRMnJXx78GhqOL7G6PfV4YfSKoCs+xRY4+0sWX
 S+8LxZUSFs2V8Exd6GyW6Zh2P/E0JFWUsglJLJt3AgUVF/0NFMEMvLEBbYwR6PDBQ6ZY
 4rNA0J5CGxorpWBcZJUgeRduBC3o3RGtkn7pslDP+svPufJr94AVAeZiO60YL84pAxgN
 Is9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vp4+p4FLQruJ614qug2AywQIur5rU9O0ZC+bqOyPTzg=;
 b=uXH/MjJHlJBgYA2RdIbs8gpKW4MLu7bcjdb6gYnO7suG3e7Vn6wAWxxo6nqhDsIZju
 wqeTiWu7BW2u5PhoE3pOnrKWOmUjF1JieG7VLQ5a6ENQpzBtxxkNQ2UYbJkkuWSruUwQ
 tbeciq7N5bK5zkwTq8p5B7kkEqrqGonpQra7krXk62yXUe52QlL2hpEXlUZQWkEaUITK
 7ZWNhn1r7dTj3g9+qVqAlQUAx6Yn2sjlwBw7gxw4gPEJ+gVCTV/sutxJ6YnIJlHNhFxD
 GgKNu/amX2jAE70TYbjFtbvOuz4kdQ9WUkULt2v/dhmqBM62Od3ZJD38LrQ+qOP0+Ki5
 94eg==
X-Gm-Message-State: APjAAAUj6XNrAwgjCFFADTV6ay8nusJCULFUJ35+VaavIm4l2107ljS7
 qOYmM18V7jroIClii1A3TnD8rwYYpGdASQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr10640252wrv.338.1570189736840; 
 Fri, 04 Oct 2019 04:48:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t17sm11962094wrp.72.2019.10.04.04.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 04:48:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 4/4] hw/timer/arm_timer.c: Switch to transaction-based ptimer API
Date: Fri,  4 Oct 2019 12:48:48 +0100
Message-Id: <20191004114848.16831-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191004114848.16831-1-peter.maydell@linaro.org>
References: <20191004114848.16831-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-TUID: WxW2s7DMW92m

Switch the arm_timer.c code away from bottom-half based ptimers
to the new transaction-based ptimer API. This just requires
adding begin/commit calls around the various arms of
arm_timer_write() that modify the ptimer state, and using the
new ptimer_init() function to create the timer.

Fixes: https://bugs.launchpad.net/qemu/+bug/1777777
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_timer.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 848fbcb0e25..255def3deec 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -14,7 +14,6 @@
 #include "hw/irq.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "trace.h"
@@ -79,7 +78,10 @@ static uint32_t arm_timer_read(void *opaque, hwaddr offset)
     }
 }
 
-/* Reset the timer limit after settings have changed.  */
+/*
+ * Reset the timer limit after settings have changed.
+ * May only be called from inside a ptimer transaction block.
+ */
 static void arm_timer_recalibrate(arm_timer_state *s, int reload)
 {
     uint32_t limit;
@@ -106,13 +108,16 @@ static void arm_timer_write(void *opaque, hwaddr offset,
     switch (offset >> 2) {
     case 0: /* TimerLoad */
         s->limit = value;
+        ptimer_transaction_begin(s->timer);
         arm_timer_recalibrate(s, 1);
+        ptimer_transaction_commit(s->timer);
         break;
     case 1: /* TimerValue */
         /* ??? Linux seems to want to write to this readonly register.
            Ignore it.  */
         break;
     case 2: /* TimerControl */
+        ptimer_transaction_begin(s->timer);
         if (s->control & TIMER_CTRL_ENABLE) {
             /* Pause the timer if it is running.  This may cause some
                inaccuracy dure to rounding, but avoids a whole lot of other
@@ -132,13 +137,16 @@ static void arm_timer_write(void *opaque, hwaddr offset,
             /* Restart the timer if still enabled.  */
             ptimer_run(s->timer, (s->control & TIMER_CTRL_ONESHOT) != 0);
         }
+        ptimer_transaction_commit(s->timer);
         break;
     case 3: /* TimerIntClr */
         s->int_level = 0;
         break;
     case 6: /* TimerBGLoad */
         s->limit = value;
+        ptimer_transaction_begin(s->timer);
         arm_timer_recalibrate(s, 0);
+        ptimer_transaction_commit(s->timer);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -170,14 +178,12 @@ static const VMStateDescription vmstate_arm_timer = {
 static arm_timer_state *arm_timer_init(uint32_t freq)
 {
     arm_timer_state *s;
-    QEMUBH *bh;
 
     s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
     s->freq = freq;
     s->control = TIMER_CTRL_IE;
 
-    bh = qemu_bh_new(arm_timer_tick, s);
-    s->timer = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_DEFAULT);
     vmstate_register(NULL, -1, &vmstate_arm_timer, s);
     return s;
 }
-- 
2.20.1

