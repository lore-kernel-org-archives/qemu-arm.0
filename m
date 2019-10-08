Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5442639wrm;
        Tue, 8 Oct 2019 10:28:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+f8G/MURSIwg6aSnLPPYS3JDNIs5yJffEf5XNlHdXu8yljbAKHsHpiSVx8Kwrmaz4aunO
X-Received: by 2002:a0c:e785:: with SMTP id x5mr34559823qvn.71.1570555717312;
        Tue, 08 Oct 2019 10:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555717; cv=none;
        d=google.com; s=arc-20160816;
        b=zrisGq7/T4stPSYYB6FsFiGcHq8F274jo/X54JHCT5EVPty5/VDdfEyNhqWNm9IfkN
         Pj8hAM4GDClVk0TSkwxAHffdMmHiFb1KydS/KcKUn232wM2VWbCJw9vxjFdCT3RfShJC
         /RfMoIb0zFIGVihHL5Y2wjUnUKLRRIusi7hd+lrRBUuAVKTbRnrXlQ3pU7g0dsQXZCVC
         NI23szQLr0Ar/0ns601gIiytFF+Rg4WoWe9DdlbGuW7O6Kk3J5SZhn00UvELM8um4xdW
         2rG5X77mJE/NKZIAhKPuv9sf617vMHSBQf8A4Mya78XPgBkszu1DRpHaj4ffb07+eEK0
         e5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QW+A6xlbgK0FgzrwM5hDJiZEldqNh8wWGg0ioEj7aAU=;
        b=GWBLxoa6tJIlqoLxqvobx2+ZWyzBqNUUDZP1m4pjPfOY43G1lZdy8jQryJIKFOSmOy
         7AB6K4Tge75zlXY/DE+P9+pjVupogecBKi4uOI08SrI4kbzCppIWX23Lv++do0AjEu1k
         srrauqgyzDsM7y5W5ERvvR+Iv7vb0p7pTQoze68b0c2A0+stsXuAwID5/RRV/rf1r866
         WMohfHzKYFAMKEGMvajUg1ROh5xczzwntoTfaynCi3DxZuKDmTetOareaIx8zfAP5TGw
         vHJdPR0RUrCUr5vlvuq12yePHbovUNVsA4y8BH+uzM8XseAUrSRwos4PMyZPDci5XWJY
         synA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM+7Tp44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si17133840qta.300.2019.10.08.10.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM+7Tp44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtHo-0000M8-5c
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7c-0006m2-Uy
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7a-0002N3-Vn
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:04 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33123)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7Z-0002Lh-UB
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:02 -0400
Received: by mail-wr1-x441.google.com with SMTP id b9so20371723wrs.0
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QW+A6xlbgK0FgzrwM5hDJiZEldqNh8wWGg0ioEj7aAU=;
 b=BM+7Tp44LjG8NgGZHfvDmDNNWka0Np95L+GTWDj3/fnwbDtoWXWUGRwFBsOwjPH1T9
 Q3tt5+/1dRV6Eqf4doZ45IEThOFblKzSSJmv1+bcp85+G0YsGPBVoRxlvvlf2b+KQ7n2
 NNBRzg/CFyjHXWnSnfBlAZlM2owFuwq+dcP/7O34mrcVZuShhIWzhYhpGCRJibZbkfXP
 /QijTH3DZVZ6kftZNG4iNYSkAjnBzRJzVK8tUhG9goXCmzh+a1lB1elxo/m/3Oziti5D
 Rva7ccFW1IU3oZvfTJGE3oyFuk5Vaj5iNdgOO0R2c2PdSKY09u4aGzrdZDGwy+PAjveb
 0Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QW+A6xlbgK0FgzrwM5hDJiZEldqNh8wWGg0ioEj7aAU=;
 b=axlQyyuWjdcxvAMfVZGo9A3BFgHFqDcVIBHDfnBJpitI9KIrUVts760vpU3032E8MI
 ArPI74KjTavf9S5wr5mmcwVd9j8ifGwRQfnMS6nnZHjnamUwyE6F0TQSiRFp1qUOrboT
 MpBFw7owyr2tbL/GKXrKwGgQfwhXodDl0HQf51jgFCCi89Ep6+P5y0afG5QNzHDD2f6S
 XOjxgIm9RiKnY1pj4hoSztNV8XFVkvFb8vHVBbG3bKV/0FcZGo/SgjPUeDP/cDrrxJge
 VMNfFGqzaNfy/UZRScv8GQua+9Ux1i5qGdcLOSsyW/9biBVlcy/vSd32bK6Rv+0YLO6a
 9Akg==
X-Gm-Message-State: APjAAAWLfQ8W7ZvK7Zxxg7u8IjKsPS2uvA3FMQVfUP+ycjRsV3KFnCWf
 p/CV7/xvnPxoZXHVKhuxzIuyUFTncHdKZg==
X-Received: by 2002:a05:6000:186:: with SMTP id
 p6mr25899400wrx.136.1570555080350; 
 Tue, 08 Oct 2019 10:18:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/21] hw/timer/exynos4210_mct.c: Switch ltick to
 transaction-based ptimer API
Date: Tue,  8 Oct 2019 18:17:32 +0100
Message-Id: <20191008171740.9679-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-TUID: rO1JIpHdEI1p

Switch the ltick ptimer over to the ptimer transaction API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 82803ef9a02..72257584145 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -58,7 +58,6 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/ptimer.h"
 
@@ -735,6 +734,7 @@ static uint32_t exynos4210_ltick_int_get_cnto(struct tick_timer *s)
 
 /*
  * Start local tick cnt timer.
+ * Must be called within exynos4210_ltick_tx_begin/commit block.
  */
 static void exynos4210_ltick_cnt_start(struct tick_timer *s)
 {
@@ -750,6 +750,7 @@ static void exynos4210_ltick_cnt_start(struct tick_timer *s)
 
 /*
  * Stop local tick cnt timer.
+ * Must be called within exynos4210_ltick_tx_begin/commit block.
  */
 static void exynos4210_ltick_cnt_stop(struct tick_timer *s)
 {
@@ -767,6 +768,18 @@ static void exynos4210_ltick_cnt_stop(struct tick_timer *s)
     }
 }
 
+/* Start ptimer transaction for local tick timer */
+static void exynos4210_ltick_tx_begin(struct tick_timer *s)
+{
+    ptimer_transaction_begin(s->ptimer_tick);
+}
+
+/* Commit ptimer transaction for local tick timer */
+static void exynos4210_ltick_tx_commit(struct tick_timer *s)
+{
+    ptimer_transaction_commit(s->ptimer_tick);
+}
+
 /*
  * Get counter for CNT timer
  */
@@ -812,6 +825,7 @@ static uint32_t exynos4210_ltick_cnt_get_cnto(struct tick_timer *s)
 
 /*
  * Set new values of counters for CNT and INT timers
+ * Must be called within exynos4210_ltick_tx_begin/commit block.
  */
 static void exynos4210_ltick_set_cntb(struct tick_timer *s, uint32_t new_cnt,
         uint32_t new_int)
@@ -885,7 +899,9 @@ static void exynos4210_ltick_recalc_count(struct tick_timer *s)
 static void exynos4210_ltick_timer_init(struct tick_timer *s)
 {
     exynos4210_ltick_int_stop(s);
+    exynos4210_ltick_tx_begin(s);
     exynos4210_ltick_cnt_stop(s);
+    exynos4210_ltick_tx_commit(s);
 
     s->count = 0;
     s->distance = 0;
@@ -995,9 +1011,9 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
         tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
 
         /* local timer */
-        ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);
+        tx_ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);
         tx_ptimer_set_freq(s->l_timer[0].ptimer_frc, s->freq);
-        ptimer_set_freq(s->l_timer[1].tick_timer.ptimer_tick, s->freq);
+        tx_ptimer_set_freq(s->l_timer[1].tick_timer.ptimer_tick, s->freq);
         tx_ptimer_set_freq(s->l_timer[1].ptimer_frc, s->freq);
     }
 }
@@ -1304,6 +1320,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_TCON_WRITE;
         s->l_timer[lt_i].reg.tcon = value;
 
+        exynos4210_ltick_tx_begin(&s->l_timer[lt_i].tick_timer);
         /* Stop local CNT */
         if ((value & L_TCON_TICK_START) <
                 (old_val & L_TCON_TICK_START)) {
@@ -1331,6 +1348,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
             DPRINTF("local timer[%d] start int\n", lt_i);
             exynos4210_ltick_int_start(&s->l_timer[lt_i].tick_timer);
         }
+        exynos4210_ltick_tx_commit(&s->l_timer[lt_i].tick_timer);
 
         /* Start or Stop local FRC if TCON changed */
         exynos4210_lfrc_tx_begin(&s->l_timer[lt_i]);
@@ -1356,8 +1374,10 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
          * Due to this we should reload timer to nearest moment when CNT is
          * expired and then in event handler update tcntb to new TCNTB value.
          */
+        exynos4210_ltick_tx_begin(&s->l_timer[lt_i].tick_timer);
         exynos4210_ltick_set_cntb(&s->l_timer[lt_i].tick_timer, value,
                 s->l_timer[lt_i].tick_timer.icntb);
+        exynos4210_ltick_tx_commit(&s->l_timer[lt_i].tick_timer);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_TCNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_TCNTB] = value;
@@ -1486,7 +1506,6 @@ static void exynos4210_mct_init(Object *obj)
     int i;
     Exynos4210MCTState *s = EXYNOS4210_MCT(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-    QEMUBH *bh[2];
 
     /* Global timer */
     s->g_timer.ptimer_frc = ptimer_init(exynos4210_gfrc_event, s,
@@ -1495,9 +1514,9 @@ static void exynos4210_mct_init(Object *obj)
 
     /* Local timers */
     for (i = 0; i < 2; i++) {
-        bh[0] = qemu_bh_new(exynos4210_ltick_event, &s->l_timer[i]);
         s->l_timer[i].tick_timer.ptimer_tick =
-            ptimer_init_with_bh(bh[0], PTIMER_POLICY_DEFAULT);
+            ptimer_init(exynos4210_ltick_event, &s->l_timer[i],
+                        PTIMER_POLICY_DEFAULT);
         s->l_timer[i].ptimer_frc =
             ptimer_init(exynos4210_lfrc_event, &s->l_timer[i],
                         PTIMER_POLICY_DEFAULT);
-- 
2.20.1

