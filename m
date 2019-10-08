Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5446767wrm;
        Tue, 8 Oct 2019 10:32:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBXavjyXw7Y92nhpxFxTLtemzL3siqUI39Pn2fpJMbqXt+ZIkQgpeQnYOrCTVJYjX69lX1
X-Received: by 2002:a17:906:255b:: with SMTP id j27mr6464186ejb.96.1570555944051;
        Tue, 08 Oct 2019 10:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555944; cv=none;
        d=google.com; s=arc-20160816;
        b=KGqpCxwKlH8oSaQxmq3ujnFNtxyzFmbn5vbra8fIJHEla/iOvSSVzRqzW+Nv9eAQ72
         nZtc2TDiUUvvb2c4VdDHgTC2xbbDwRWssm40lZn5+ZaPKX9cw6ya1u5tNVLu30Q2nsAP
         sltTJcqM2JSKUnY1Um33D/XpIAKp1A6k3cAbsswhNPZTVBdvJl+IxkMFH7+58ooMgDIZ
         HNXypKaohJyxkhMNZotVEDMtaUmVDGl4BK+kXTJGhiTuI/EzsbmMLXD4tBD3Z6FkNsLG
         R566P18RtWnpQz+KSPE88FG49FW8tKnxvpZtFc47eLTg7G4Sy8kRDrTQP7vupUH6PvLA
         Wsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NFu/MEC+WzwyReIBeXZdHYVan9ju3LNnnVn/p9IiNqo=;
        b=Pm39sVXqmP/fKHo4cipaD88lSapGDWS9OWlNPpmx96yrKsSECKVgIOzBDQymyOzAtm
         q5GgCCYbR4txA4CjBLw05U5byaejtHHM/KjsU9pR1NNDN8pX6ugWGn6g16+CSPobguIB
         Ds99XnWLlp01WZ1hz3BuBA1ZOJMfFj+wq/jXrhSXPYK527xGJqJARz+WJI/NGrfyrbJC
         r/ArCwPLpEuhBZ0HRsCEgj1Nuu/TtZ570xNCL9/N0g/0VBI0WIeniqFEN6PJnpkPJd0V
         iuacqasEu2pg2aGseG8U4pcsvIO5enaBNwnIil5rO2nvCqETWSK/t8jBGOB77e8/7Y61
         St/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHDd5AMv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e46si10966777eda.401.2019.10.08.10.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHDd5AMv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtLS-0002PQ-1p
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7e-0006oJ-HI
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7c-0002OL-Q6
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:06 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52586)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7a-0002MF-UH
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:04 -0400
Received: by mail-wm1-x342.google.com with SMTP id r19so4029156wmh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFu/MEC+WzwyReIBeXZdHYVan9ju3LNnnVn/p9IiNqo=;
 b=JHDd5AMvkjN4JVcHK8nTdOzcH5T1Gp/15GkDzhs9qwqhzY2RqVATBDxbxX4qmhS9HL
 llIwRlCwSKpRPOBHnftVsX+/HZc+zIpJjvUAAtlMrK3iPa4quJGAypH4eNMnBalR4mSJ
 0IwDinvB8Z2l41Ykhl9LEhxEwFPOlUkPiy5gSx1cPodxQkBkA3mgyyRQ5skozQorKkP/
 kaPOeThKlAR1v10Xp4uhLZHpaQEWuLn+HldUFzTDjXIubXt36E5of6M1+ll6UtcHH7s5
 l4NPx80BxtSFMd7caeKjEmysvmHAGAJBRcDQaHl4grcXi9LkatyCnQ/mOvh1kLalAHjK
 jY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFu/MEC+WzwyReIBeXZdHYVan9ju3LNnnVn/p9IiNqo=;
 b=rjY/8PvukTBVgHFP6XA4Ptx9Nktz2kt8inOBUYX4KJ28Fvf0EMXgaO1nOuR/INiUfB
 4/5femXiiQh2eUoIobyqfyJpG3tsxtfmNeeH74vy5PK2MsUEk06sZKgpFvuXIT1NvaSR
 kXZTCZeVBTyaxV9O9jcNpnTQKmX5soEX1EgLPvRLbF/SbZIhCeqLr0tBhgspthnb6svK
 ve0LyvZoKfzLpEmBEQCDJUUCbJgVaXf+63zePudYZRWbJVsChbiVgOoStihG8VFdknYO
 mV8yJqUfmT8XAz2/IbtEw+GethhznBWzYQjHglS1zV7rQcW48L6dKSjuvnHJxJmeCdzl
 qZvw==
X-Gm-Message-State: APjAAAXvKiNU1Kt5NPUp8R+Euw1MnTJ3/OfPTfMSuapngh2I6DFe7Te3
 Uhu6wwXWJD8j3y6Q6aMDRg3J/g==
X-Received: by 2002:a1c:b745:: with SMTP id h66mr4505556wmf.70.1570555081534; 
 Tue, 08 Oct 2019 10:18:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:18:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/21] hw/timer/exynos4210_pwm.c: Switch to
 transaction-based ptimer API
Date: Tue,  8 Oct 2019 18:17:33 +0100
Message-Id: <20191008171740.9679-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hlv/kXGqeR4a

Switch the exynos4210_pwm code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_pwm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index aa5dca68ef7..59a8c08db0f 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -25,7 +25,6 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/ptimer.h"
 
@@ -150,7 +149,9 @@ static const VMStateDescription vmstate_exynos4210_pwm_state = {
 };
 
 /*
- * PWM update frequency
+ * PWM update frequency.
+ * Must be called within a ptimer_transaction_begin/commit block
+ * for s->timer[id].ptimer.
  */
 static void exynos4210_pwm_update_freq(Exynos4210PWMState *s, uint32_t id)
 {
@@ -281,12 +282,15 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
 
         /* update timers frequencies */
         for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
+            ptimer_transaction_begin(s->timer[i].ptimer);
             exynos4210_pwm_update_freq(s, s->timer[i].id);
+            ptimer_transaction_commit(s->timer[i].ptimer);
         }
         break;
 
     case TCON:
         for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
+            ptimer_transaction_begin(s->timer[i].ptimer);
             if ((value & TCON_TIMER_MANUAL_UPD(i)) >
             (s->reg_tcon & TCON_TIMER_MANUAL_UPD(i))) {
                 /*
@@ -315,6 +319,7 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
                 ptimer_stop(s->timer[i].ptimer);
                 DPRINTF("stop timer %d\n", i);
             }
+            ptimer_transaction_commit(s->timer[i].ptimer);
         }
         s->reg_tcon = value;
         break;
@@ -369,8 +374,10 @@ static void exynos4210_pwm_reset(DeviceState *d)
         s->timer[i].reg_tcmpb = 0;
         s->timer[i].reg_tcntb = 0;
 
+        ptimer_transaction_begin(s->timer[i].ptimer);
         exynos4210_pwm_update_freq(s, s->timer[i].id);
         ptimer_stop(s->timer[i].ptimer);
+        ptimer_transaction_commit(s->timer[i].ptimer);
     }
 }
 
@@ -388,12 +395,12 @@ static void exynos4210_pwm_init(Object *obj)
     Exynos4210PWMState *s = EXYNOS4210_PWM(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     int i;
-    QEMUBH *bh;
 
     for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
-        bh = qemu_bh_new(exynos4210_pwm_tick, &s->timer[i]);
         sysbus_init_irq(dev, &s->timer[i].irq);
-        s->timer[i].ptimer = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+        s->timer[i].ptimer = ptimer_init(exynos4210_pwm_tick,
+                                         &s->timer[i],
+                                         PTIMER_POLICY_DEFAULT);
         s->timer[i].id = i;
         s->timer[i].parent = s;
     }
-- 
2.20.1

