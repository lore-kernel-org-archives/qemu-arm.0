Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2312014wrr;
        Mon, 11 Nov 2019 22:46:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+iw3vpzxGDpbGj94VJJSlcPxmEsuaJR4w1EV/cUcWMzosGhhvJT21mxXOmn0ZWdEy+myk
X-Received: by 2002:ac8:745a:: with SMTP id h26mr29696139qtr.192.1573541185708;
        Mon, 11 Nov 2019 22:46:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573541185; cv=none;
        d=google.com; s=arc-20160816;
        b=LZLJ+YjmVkN88RGK5MLWNGGdgG5E5XTe1CKy4H9dIUAgdpE/kMYF4IJL4SbkFbOvUY
         1aEKfmPxY+gsr0YXLAfIrdlQm5tE3GQq1elx4oQG/7lpEObgMQo8JxIybb4AKy8N+57E
         cjjzjqpsDW/LBQriAdueTCzQxJch3yo2TbS1r5zVjffQRj4L6cOQJEcOVkeFy7TYEo+1
         pnhPuE/E496Zu7TNCEj6zr1gy2YjHCI59z9TqYA4o6aKzne8AXrnYhvkRwo/Mq7VtPb0
         VB7zNlGe5e/rLgFu6jE/bWEsHg2qMwhPUQJn+kVWL8UOPonBkK3cNorYjoZ2zG98K0ue
         d1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ViOcwrGNNJLxaLFTqLvWuJzL8hqpUFzYbRzOh1R/JSc=;
        b=t208wOAZ+sTsRU16zxAt1QP6d0Puw/puZ4sD3JdoYzLYDgWuYqzBIx9Bfc2m4Kqmhm
         mGrAaeUCbLLfwz0m/OF/2mVbLeteq4SiUSg+VHMkKWRoH5dhhrx53+DeDqIvJtZSmn62
         LQHNoANTLEFwQDLzWTUPBtrgnMabQaCq+g+tDKYbjEaupsDFgprauUeLxOtBvdeq24Eu
         FqkAJOrwtOkWF4OBtXQffx970/DQcvZNpfsi13obHTYSegsqODH7f/jnwdk79guNhwn7
         yBQDKJNsAG1yHYg2YV7r2Q//nfImEAJlqDZlmRPTUTWZd+lwovCyBa+amzPbxfBvJ7Z1
         kEQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dnD1fKL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24si10041654qto.272.2019.11.11.22.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 22:46:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dnD1fKL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUPwW-0007Di-I7
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 01:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUPre-0003Nt-LC
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrc-0007QG-D3
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:22 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUPrc-0007PL-3N; Tue, 12 Nov 2019 01:41:20 -0500
Received: by mail-pg1-x544.google.com with SMTP id z24so11189354pgu.4;
 Mon, 11 Nov 2019 22:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ViOcwrGNNJLxaLFTqLvWuJzL8hqpUFzYbRzOh1R/JSc=;
 b=dnD1fKL2tM9LQR9v2+PDwJjqCOdKqvguQL2/27vf/A0vw8z0ZTML8ib0yY8SMHEatk
 RBGJSC1Kv08ESNmJ9GsvUT4RucIk5i7O4M/2H9nZgZKgA4hAwFkrN9imHGnpJdA7SsC9
 hZC7PM7EhSsyLsRqGbNOEKm6AXRgj+BvTZQmmS/K1vjwgnq3d7khBNNhXWjGW6RpXt+q
 68zdZtsLwmC5tfnyd2jCIU7kEGsui9LSX4gNv8MUsYmHZsFh3ONNpgO4ZpCbtPltmg05
 L5L+iV7Qgv61pKonjdAcBpIWuWgwOHvK54xGveX3Kg+MZMO85UGK4L1E60QI13+9ffMk
 ADSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ViOcwrGNNJLxaLFTqLvWuJzL8hqpUFzYbRzOh1R/JSc=;
 b=iPKD3ge1yOfFYvLTfp7tMApGf7AiBJtM5bJO4nalWUmEUgVAwqyMwS7OyG6L0OPgRc
 gQXgW4v9HT3OgsHORRBHkId0thgjyZkwd7vTnbUgP6gbWf2jxl9vk3NSzNpdegUM8VIn
 eUrLP0GCV3h2PAQoJfO94PMjRJw+R3SLA0hnL6ZsW8MyceregNoeGG2GJFGRZrqMyLqJ
 cIyW0XSTYGX5R2ZifbJtf5aauoH8ZQ8EFPy8pNsgCZ3uv4Pgkz2vhTTT83zkyZ6qRPCq
 NIv3fVqMDjzF8Pi+HYCM4EUFOi8pbY6JUwgUsVmkdO1eLua2QGFcEVsWebul8j7ZpXUx
 g6TQ==
X-Gm-Message-State: APjAAAX3gBc2AcNhjA5mjF5uPACQBpCkzr9AbaYYVd95NheZZpJycv2V
 ai3iPufzGno9EvYs31pXIUY=
X-Received: by 2002:aa7:9618:: with SMTP id q24mr6313479pfg.229.1573540878044; 
 Mon, 11 Nov 2019 22:41:18 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q8sm16375590pgg.15.2019.11.11.22.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:41:17 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
Date: Tue, 12 Nov 2019 17:10:58 +1030
Message-Id: <20191112064058.13275-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112064058.13275-1-joel@jms.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4niVsLEn1T3r

The AST2600 control register sneakily changed the meaning of bit 4
without anyone noticing. It no longer controls the 1MHz vs APB clock
select, and instead always runs at 1MHz.

The AST2500 was always 1MHz too, but it retained bit 4, making it read
only. We can model both using the same fixed 1MHz calculation.

Fixes: ea29711f467f ("watchdog/aspeed: Fix AST2600 control reg behaviour")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 5697ed83325a..f43a3bc88976 100644
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

