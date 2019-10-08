Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5455818wrm;
        Tue, 8 Oct 2019 10:41:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaPHup8JMX524LrvZ1luKoV4sZCE6k0AG/LwW6aBn/ZwvfQNZimZcEZcC7Uw1BE/00x9OW
X-Received: by 2002:a17:906:6c8:: with SMTP id v8mr30379487ejb.40.1570556499194;
        Tue, 08 Oct 2019 10:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570556499; cv=none;
        d=google.com; s=arc-20160816;
        b=T06qwe7Bq8fGoIIAwKgamym8i5fUuAPUgC0+9H1+UKsy+Iz7KdFdFY7hpBDOZsknBn
         owgGhL6SR/JyJWNy6l0zsIAHZGci3LRc8E8aIzwZ/QIQZCxRQ9XFZFPWr+Zs59rVzFm+
         JdArO5COJKgJBPswOYIoJAFd2Zkzi3SvwLSKpooJjh6yE00epF37RT5eRhiDldGi8sOe
         5AaznzCm70yT3jV2VwdO6Y/8c8LNvb3pY/9N7O6uVg9QAP73uHz17z2kAGfpKiPQz587
         kqo9kLRQOYKXwtmyxNKI791c5VqeVgJpAKIvkI1OmY7JaVvKAMPNNOMxlwAGTaGvMsAb
         12tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=utJl6lOKI6yGj+1Myezosvn3a88cspPU4H5F4QN8n/0=;
        b=KY5A5RYIVWVdURh9rPUYWEzt3yKwwPR2An00C/z7aoNa7bwuGtUfjKeARsgnzzj2Ko
         dZYd1HYvrQ24TkaSy262hjVchke2VMtPDq8fjI2ZFlsXfAI/oH24wBMq4QbEIv+Fh/ki
         bf3gJb+5VLzsazxLAk8wunwZSVt3oM5rAzhjaaQU5CvgTBgX+JseaoGk+lhuh6dDolFq
         kCZGvxzSSxTONvrhx0/kxS9vJRAW6ZuoNgaokG0ctAZ4xLX5enrnjgagb0bblZcyU+Gk
         9QhmWNr3dPdMzyxbtQ5Rgry7Ma+tfz8bIhQdBSaqPceVuJ7Y3aNFJBUFklRMLeNGkehl
         u0Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N0LL/YfI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox28si9195734ejb.130.2019.10.08.10.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N0LL/YfI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtUP-00039R-DE
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7i-0006tA-EF
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7h-0002Rx-2j
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:10 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7g-0002R9-Rl
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:08 -0400
Received: by mail-wm1-x343.google.com with SMTP id r19so4029474wmh.2
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=utJl6lOKI6yGj+1Myezosvn3a88cspPU4H5F4QN8n/0=;
 b=N0LL/YfI2y+MrFGNlw4C8nWcYSF8E4lRaFlcbC1xXeGfN53mxUEDm51MRrh3FbeQu4
 HCgrGEKJrPf7epG2YubFu6Cu+rMkodILuPXLZ70QPPnCzQvWQ8pWDjujjc4BHavDpzUv
 cAJrxckKI9xEFufW0ldYdNrHDPQRn/2upzKqYO05jaxYXAXeVXI0SfOdC+8VZG34NvNs
 bFvUJfEdREDP/fQwghCEmD9A+XMfBFriR+LysSLNvCWcTp9tQ526xD2URSwurDlzDbV1
 /JptaBJGQf1NXyUzw78rYZWPweTbhsK0YKOu4tg8GkDonfza1F14w/5+/P8VylCds7HI
 Y8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utJl6lOKI6yGj+1Myezosvn3a88cspPU4H5F4QN8n/0=;
 b=m81YkF7Y6E1dt6PcB67n6DwKTPdx6gDU3u1s2aCakJWqU9VKbJeFDJoCTmaAlZV9Bz
 gy5drRG6iRprtHp60upqcKt/YBNQXy/gkTsurHZhjaJgVjg5cQ+lJ1VjEhNOv3AoKnWY
 KufekIRJaJJN8ZSstt9x2+v51Q8FWi8m7kdpjqo3RvIx8NKqO15j/1gfcQsQZdrkGQQy
 ilm2VlOz1cSF/NXVzUwr0zYiT9ep7wovGD7offhGTecOiX+GFJi03yjU7l4jMheCmmgg
 0OGEIeN1aUwtJjPWXSRY1pJN+5knIlm8OWYjL3a6fY/SPTOwYNR11rRgnmuOqXTS1oF4
 78cQ==
X-Gm-Message-State: APjAAAVtmvjkcsbu6XxalGMgk62fv4Gc0hruXGd8muvJEIZ/xYC0A93p
 Y10SRdh060/FCgyArO4DjqaBa850JkpD8Q==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr4926860wml.40.1570555087431; 
 Tue, 08 Oct 2019 10:18:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:18:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/21] hw/timer/mss-timerc: Switch to transaction-based
 ptimer API
Date: Tue,  8 Oct 2019 18:17:38 +0100
Message-Id: <20191008171740.9679-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-TUID: iZNdvp5kKN5k

Switch the mss-timer code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/mss-timer.h |  1 -
 hw/timer/mss-timer.c         | 11 ++++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index d15d1732f81..e5a784b27e4 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -46,7 +46,6 @@
 #define R_TIM1_MAX        6
 
 struct Msf2Timer {
-    QEMUBH *bh;
     ptimer_state *ptimer;
 
     uint32_t regs[R_TIM1_MAX];
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index a34c2402b00..b1c9a805011 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "hw/irq.h"
@@ -67,6 +66,7 @@ static void timer_update_irq(struct Msf2Timer *st)
     qemu_set_irq(st->irq, (ier && isr));
 }
 
+/* Must be called from within a ptimer_transaction_begin/commit block */
 static void timer_update(struct Msf2Timer *st)
 {
     uint64_t count;
@@ -159,7 +159,9 @@ timer_write(void *opaque, hwaddr offset,
     switch (addr) {
     case R_TIM_CTRL:
         st->regs[R_TIM_CTRL] = value;
+        ptimer_transaction_begin(st->ptimer);
         timer_update(st);
+        ptimer_transaction_commit(st->ptimer);
         break;
 
     case R_TIM_RIS:
@@ -171,7 +173,9 @@ timer_write(void *opaque, hwaddr offset,
     case R_TIM_LOADVAL:
         st->regs[R_TIM_LOADVAL] = value;
         if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
+            ptimer_transaction_begin(st->ptimer);
             timer_update(st);
+            ptimer_transaction_commit(st->ptimer);
         }
         break;
 
@@ -228,9 +232,10 @@ static void mss_timer_init(Object *obj)
     for (i = 0; i < NUM_TIMERS; i++) {
         struct Msf2Timer *st = &t->timers[i];
 
-        st->bh = qemu_bh_new(timer_hit, st);
-        st->ptimer = ptimer_init_with_bh(st->bh, PTIMER_POLICY_DEFAULT);
+        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
+        ptimer_transaction_begin(st->ptimer);
         ptimer_set_freq(st->ptimer, t->freq_hz);
+        ptimer_transaction_commit(st->ptimer);
         sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
     }
 
-- 
2.20.1

