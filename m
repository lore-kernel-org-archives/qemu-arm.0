Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp584720lfc;
        Tue, 19 Nov 2019 06:13:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzqF/Qa9ocFzYFju5/H3wziqLZkoMtwUbR2TZIlCn7O77kp1BiZTrxvb/VrwfsegTFRX2l+
X-Received: by 2002:adf:e942:: with SMTP id m2mr39880816wrn.26.1574172817766;
        Tue, 19 Nov 2019 06:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172817; cv=none;
        d=google.com; s=arc-20160816;
        b=aVoXRubpTxwL4QU48SBDDKM4BYWO2tT6O4FSg76CX2CCv7WUAjn9z+7HkUofCezR2b
         3050YZGnfSV/Q4+X9RKWPbBhaDB9R+GMWRIvBaS57nE6C1Pd5h4sCNEY9tQdlx4dD8QN
         HE4CBZa3KZULzq40Fl3I9nu6HlfC2WnW5r2Gjjg94yStVILfwys7EvpSjHebjevWK7qb
         HPqHOrqgt6un4lqelUCotpKauf50NVSjSZNWA8u9cenzVuIfE2Xp9b+tpiK3Elg8POdJ
         XruTvTXAF9QB6tEZFTj7NNxGfH/XAY6i8PpqFZt856EHBod2wQz689eDB1YPL5CmD1M4
         4IPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KjjMA+FaQZm7V+eGiKIhnTT8I/XOgKrIu/yFUbDKx1I=;
        b=nwKN3ibWcgJPOltz2PvSlEj++qeIQi4HfuswEfK0RWzlUWM5MrquKRyIsxReTluIXy
         md8XBb1L/O7rWrA8jyG6p2OgrhVKGLYv9IveM5kF1P5oRYMGr32/ItjOPyymRGwNcx1R
         BU9WJjd8OD0BX5Jh1Xe4u5wEEpRjUTil0JEg5hBdNibpNlKMYOgXe/gzh8ByeJuuRN2E
         hYjnuqy8Dj6/RbY1A3dTf7qdEHeX8mOv0zph+2Ino6OFy5mx5ij0ZJfFllUKxrH9YiKo
         Fp4CLX1iZeUKvKDDKvNm6Y/rl5rYwmcGD3O8JvZLaLl3iAaH3K7ZfrfmqMgoKPhU8zbt
         dNGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.56.113 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 14.mo6.mail-out.ovh.net (14.mo6.mail-out.ovh.net. [46.105.56.113])
        by mx.google.com with ESMTPS id b6si18184191wrn.34.2019.11.19.06.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.56.113 as permitted sender) client-ip=46.105.56.113;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.56.113 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player795.ha.ovh.net (unknown [10.109.143.225])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 4B5061ED3C2
	for <alex.bennee@linaro.org>; Tue, 19 Nov 2019 15:13:37 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 469EFC18AC24;
	Tue, 19 Nov 2019 14:13:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/17] watchdog/aspeed: Fix AST2600 frequency behaviour
Date: Tue, 19 Nov 2019 15:12:03 +0100
Message-Id: <20191119141211.25716-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17911097193377270545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgepfe
X-TUID: blHSKCklnDLa

From: Joel Stanley <joel@jms.id.au>

The AST2600 control register sneakily changed the meaning of bit 4
without anyone noticing. It no longer controls the 1MHz vs APB clock
select, and instead always runs at 1MHz.

The AST2500 was always 1MHz too, but it retained bit 4, making it read
only. We can model both using the same fixed 1MHz calculation.

Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index dfedd7662dd1..819c22993a6e 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -47,6 +47,7 @@ typedef struct AspeedWDTClass {
     uint32_t ext_pulse_width_mask;
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
+    void (*wdt_reload)(AspeedWDTState *s);
 }  AspeedWDTClass;
 
 #endif /* WDT_ASPEED_H */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d283d07d6546..122aa8daaadf 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -93,11 +93,11 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 
 }
 
-static void aspeed_wdt_reload(AspeedWDTState *s, bool pclk)
+static void aspeed_wdt_reload(AspeedWDTState *s)
 {
     uint64_t reload;
 
-    if (pclk) {
+    if (!(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK)) {
         reload = muldiv64(s->regs[WDT_RELOAD_VALUE], NANOSECONDS_PER_SECOND,
                           s->pclk_freq);
     } else {
@@ -109,6 +109,16 @@ static void aspeed_wdt_reload(AspeedWDTState *s, bool pclk)
     }
 }
 
+static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
+{
+    uint64_t reload = s->regs[WDT_RELOAD_VALUE] * 1000ULL;
+
+    if (aspeed_wdt_is_enabled(s)) {
+        timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
+    }
+}
+
+
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
@@ -130,13 +140,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
     case WDT_RESTART:
         if ((data & 0xFFFF) == WDT_RESTART_MAGIC) {
             s->regs[WDT_STATUS] = s->regs[WDT_RELOAD_VALUE];
-            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK));
+            awc->wdt_reload(s);
         }
         break;
     case WDT_CTRL:
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
-            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
+            awc->wdt_reload(s);
         } else if (!enable && aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             timer_del(s->timer);
@@ -283,6 +293,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     awc->offset = 0x20;
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
+    awc->wdt_reload = aspeed_wdt_reload;
 }
 
 static const TypeInfo aspeed_2400_wdt_info = {
@@ -317,6 +328,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     awc->ext_pulse_width_mask = 0xfffff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
 }
 
 static const TypeInfo aspeed_2500_wdt_info = {
@@ -336,6 +348,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
 }
 
 static const TypeInfo aspeed_2600_wdt_info = {
-- 
2.21.0
