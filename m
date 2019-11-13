Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp3432241wrr;
        Tue, 12 Nov 2019 17:00:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaUmBXe7x3ADp74iHa478dZSclaIEsZVdQ3RsBLyVFZswzPBIQNDL/g+CptLPgR1y8dDYy
X-Received: by 2002:a05:620a:2eb:: with SMTP id a11mr305968qko.265.1573606804565;
        Tue, 12 Nov 2019 17:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573606804; cv=none;
        d=google.com; s=arc-20160816;
        b=b7/cJBi5PBMxtz4Us5bNCZCNcimXBAWBgbyfsw+sgaAy+7xrI95jX82wcKEJ/1UWkq
         ee9m2DgTeLwKVVIevTxyV2yiYDVpT6aJDryDqQns634jQl3kpUQRtRoHNEBw2sxcEANC
         U+P95+XN6B6bQDyCzyKc2E9sbRss9CVJg1OrabrnLUoGPVLCagwZabsEVweiL3Qa2Q8B
         gj5Adx0qvaC94bUZIB/cNRRt2/L1+WjCqFePkalfAh6h6wR29oou3Q9iVI9F3tO+W9O7
         hbpbGcVwRow01wlEyi0WQ+JG/g3momOqzMBBowSZCn1xrruzKuw7gn+E2TCa6awO7BYZ
         +QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=69JEq1ljDXyHeKt9u+I4iV39ni/MWZMig/OklbPPAFo=;
        b=GyZoakijVjMQy8XV62MnpVDV3kMBfFOjWmbv5ZCX+h1Dq3yD70oUxoLSK0BkTFyTcW
         c4B7uzmQGuUEMfl2F5pgA3DG4w7mZwiHueCGqfSzpRM/oLHsaeMykgBVqo+k7+gLpELT
         mNnExQoX+hnpw6UFhVbyaGiYH52cG2sEB1bLbb288UnFfoXzIIj6EVkmysClN7hJnC2B
         aYgxna0hvfgub2SkBiYBOD/li3kShI91omnUJMGN7mSow/NJNFYTWx84/sS2Gx38w3WM
         Zc/m2nG3iop5ntDPf3rMmlLo72dDV19DTgNFxKEcaaDenqA/OA64GCbkhQlZaAf9ZMX+
         D13Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AmedqT/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si84926qtr.143.2019.11.12.17.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 17:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AmedqT/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUh0t-0006Xe-UW
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 20:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtW-0001X6-Qb
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtU-0005KP-6n
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:25 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUgtU-0005K8-1P; Tue, 12 Nov 2019 19:52:24 -0500
Received: by mail-pg1-x541.google.com with SMTP id 15so169623pgh.5;
 Tue, 12 Nov 2019 16:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69JEq1ljDXyHeKt9u+I4iV39ni/MWZMig/OklbPPAFo=;
 b=AmedqT/ypEk0jFibhlPxFaz1RYCARtLfspAqPXQ2kQJfniym7juPQGVAcuWGuag11L
 4Bw+qgzs9yWYtMnTjzin1fJmWntop5jw7Fm+HH7tC8JQRzciC9rWudA3MQ+LDxdrz5U1
 YauVmLH6tnmdB3RXNbd6+ec5KM7Vo8YuJSmcHB811Vlo5odm5JTLBaDOYqGZvsbPQJml
 3niV6NQQNbMWXh7DlGGOdW46axI8wxoKopecw3aCt1iyT1TXQXiU2AnMeSuuXbewkOny
 Fl7/KXwyQGtrTs6EyAZ0qbZ4RogOA5VZuPM9Gows6aAsQx6T/eU3kcAjt3UTFoePLfJ7
 uYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=69JEq1ljDXyHeKt9u+I4iV39ni/MWZMig/OklbPPAFo=;
 b=KuNA2ROQ+pG6VKwdwXFgcSEzVLbm4TZAQs0YeFq5g9n+sCVpC08lsAi9oQI1YlrqnV
 o9bVpNuSqC1db4ltnKp2EJw7f+p4IRv97mNa2Aq/GmYkrGKovEBreZ6ehkG1jUHe7i1F
 E0FqVWbx77ifqjDx+VW6VBaJzaoVZ8WvR6PgIaLx+owTBoJaw4ePcUZ597Pk+wewPXOA
 AuXtQXJlJd8SDwL38BuydoCzXi6YvMxryU2r/KVztaTPmvKsI5EfrwbPb8PbaWJVfeEf
 7VjLBHZoCL44O1LP/H1zdSckmxPHwEb8e+7NuWQ9Si2wNpVMaIcT2t2pVv/+TeZeGuqk
 f9pQ==
X-Gm-Message-State: APjAAAVTLvddvFUocB0KFp394/8lPPNmquFu84X/gYOxzEP+We+mNq4Q
 cEeKP4QoNQ1j3ZOb0j3RprU=
X-Received: by 2002:a17:90a:8083:: with SMTP id c3mr937501pjn.92.1573606342926; 
 Tue, 12 Nov 2019 16:52:22 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i13sm169848pfo.39.2019.11.12.16.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:52:22 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
Date: Wed, 13 Nov 2019 11:22:01 +1030
Message-Id: <20191113005201.19005-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005201.19005-1-joel@jms.id.au>
References: <20191113005201.19005-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z4NooPThEcat

The AST2600 control register sneakily changed the meaning of bit 4
without anyone noticing. It no longer controls the 1MHz vs APB clock
select, and instead always runs at 1MHz.

The AST2500 was always 1MHz too, but it retained bit 4, making it read
only. We can model both using the same fixed 1MHz calculation.

Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix Fixes line in commit message
---
 hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 8787c5ad0f97..9a8a2200fd8e 100644
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

