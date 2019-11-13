Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp4668085wrr;
        Wed, 13 Nov 2019 14:13:28 -0800 (PST)
X-Received: by 2002:a65:4305:: with SMTP id j5mr6088008pgq.297.1573683208454;
        Wed, 13 Nov 2019 14:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573683208; cv=none;
        d=google.com; s=arc-20160816;
        b=yIn0EesVpnuxefVR2tXps1H02nWsg+yYZZ4Vep6f9ewIZGpe0FqenZVlCowvaGj1yG
         dYc4wm+Xf1ADU/Ipf6ii8oANVi5r3qHDZ4JYy57W8CnG3ffGhbNW40Cs6PC/GKY/lNoP
         vv0EfyDB+ntMokq9vHPQVFNubnYOMX5FmaJLglMNdKc9eKGZcbDGoEO02j3wINrarPmf
         7RiXyd5jTD+WTHIDfo5QuKFaJXf+gB5vuLHyXSgaiDPsVL9F7AhdEvWCy+RAY100J/vt
         TkrnPN4sPmNQ6m43AijdBIJBlTxjvx2Nzrx8tCLIcRHGSK4xqHlc3sVo+Xg/svmTGLo+
         t9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nAP5XJXdKxaozCcpOcXkIdrUjuBLz94yxW3NObWQlgM=;
        b=edLVbxpaDHJSV4RkuhBVNzzK3rTZ0vRTo/n0QPXnHvdDtTEXTJBxIzph9itX2APK0Y
         BVsbhyOcFNPOEDt9fdwQtD7HRi5kISfS7lHWS+/48Hi35qRD244Wez1mBCj+FPTgKw4K
         KWOAbDN6Aax+40PSoeZwLgONNBO5tAD258+IpDnbzYM/YMkJE5ks7wL5yxZ275omKDxu
         FC+fKG/N6B1gysKHzV5hQS9j0BITxzITQG1+TCxPI4yL1Bg19CroZzJS16EojWTXwhgE
         KyPSOONB+zR+z8RsingfgyHyecOdZuVFEjYWIiT9EV4iomh22fGLNcoX4TrG0srfYnaH
         DDGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSJ9+PCG;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b5sor4216851plk.58.2019.11.13.14.13.28
        (Google Transport Security);
        Wed, 13 Nov 2019 14:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSJ9+PCG;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nAP5XJXdKxaozCcpOcXkIdrUjuBLz94yxW3NObWQlgM=;
        b=KSJ9+PCGE7qR0mmVCze0s+sM2HIzUzZ2VQXrgmI8YGkl/K4jObRNkEgMXQtLXIA+Em
         KlMRApyxFOkwr4yu5kGYDWmpyo0dbdy8+CHRemXlSryWMjZ09U5u5gAHEIitcquv1MIN
         JuwRPSJ9nHFy5ex1eyftCtooJJlrHd1sj2bNlkJqWSxnQrwLeMynca1jiClM6zFOVID2
         +xCwxza1ArFXBpnKM2FHL3OnyNjDI7k5PldE2ncsRgiy2RVNFHYoSufKannhIRQLVvyQ
         PK/TVgdK1Acg0veLH0X5KmMgJlpW947o7cSXJTbNun8vKfLxdYhj8mLlLOqYI9sezHFa
         u+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nAP5XJXdKxaozCcpOcXkIdrUjuBLz94yxW3NObWQlgM=;
        b=fbiv611H3PIW8C4PIwBJyVN5hg1OTl7JQyCU7ULKNPUMiv4FMylwjOeEjgsBQkknxR
         hrg4eJpH7vD1c2p7KA+zsMAv0Wv6N9v1/yhj8IY1ADV5tIF6JOChgeymNf48yB6hl87e
         v7eqmn0XnPs7cnu/9JoE6M+ugTysv17s0/UFkMMN87H7Jry5V/uRR9atE4CqJRdD4Cor
         RXGaGu/lars7aKLGOxx/Ob9KQdiIVZr1++AKhKJ0XJ6quK4cHJ24oD7cWw941EfQqpE9
         uC4vxmB6VzQmTUdMjjBzTf37wkwnnrgD9zAzjBwFTNGp68/KKiJOLF4CqqIP/IEfuXhE
         jE9Q==
X-Gm-Message-State: APjAAAVnVUt0nmhw81bHSCqJA3T2kHhYpV4rrFHxOQOwzf9Yymw8m6jv
	8uGYwgxclng5u2pqrw+eo4CVr9tBp2E=
X-Google-Smtp-Source: APXvYqzo/DKt23zo8dF8lERxUeqD/tcuTpx2OEFK+kMK+mysqvj4EWbNODKUa6HiksH032g2CRAqpw==
X-Received: by 2002:a17:902:6f01:: with SMTP id w1mr6355065plk.35.1573683207515;
        Wed, 13 Nov 2019 14:13:27 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w69sm5252005pfc.164.2019.11.13.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 14:13:27 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
Date: Thu, 14 Nov 2019 08:43:01 +1030
Message-Id: <20191113221301.8768-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113221301.8768-1-joel@jms.id.au>
References: <20191113221301.8768-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w6X0hz/pz/tT

The AST2600 control register sneakily changed the meaning of bit 4
without anyone noticing. It no longer controls the 1MHz vs APB clock
select, and instead always runs at 1MHz.

The AST2500 was always 1MHz too, but it retained bit 4, making it read
only. We can model both using the same fixed 1MHz calculation.

Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix Fixes line in commit message
---
 hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

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
-- 
2.24.0
