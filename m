Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839819ejb;
        Fri, 30 Dec 2022 03:37:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSjYffu/sHfd593HE0kbT0LOZp1PAMfomzHGLZ5V3m9j2SgQe3CeoDGkTJ/pgUyUwc2twR
X-Received: by 2002:a05:622a:488b:b0:3a9:9cbb:7cdf with SMTP id fc11-20020a05622a488b00b003a99cbb7cdfmr47253752qtb.40.1672400248617;
        Fri, 30 Dec 2022 03:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400248; cv=none;
        d=google.com; s=arc-20160816;
        b=BiUMEaFae0HDwbulAw/nckXSxoC7tiQSQidHhdyfW8mszQbKnulJPjUSxUg2OR43wG
         +QHQit/oIX4a49GPm0yIiJiX6mP7XTLMNZYVuh98XCz6GWuFZ+yogpMwXjEKOmxbGqWY
         Jd3se7EyqKD8JV6BVGmUUq7/ZBFHRsPkpjslm6QdkNau0aoiaMiMR1wLpX6xuc1rFmPG
         k8VblYGHpIc2/N95JgUIT3y4nZH6b6tjX70vSnEj2cpEOmkGD8A5ykMudYnQ7FKJNt4l
         FTyvXadiiJub9qVZV0dMBZmJzwpjge6LceiFkZvXbp4f9dnZyl9OXaC1FjDTb39qp2w+
         dSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UOZfJuKjGnXyKynHrF0ryyVy+OVxkYOdTY6ayMGkBgk=;
        b=Cfmm58sfw15FaUeMggSk8nZgA8duSMiVeuUc9SrRE1E+INc/2dQjpeWAto3FrHCFWb
         cR7k7qWksWpGHfxhxVQmIdC1fsmQhO/iYNGzF7UYSZcUHvgqg3C56Ho3Exjuhlx7MACY
         FINaQIBjrclJCV/ZBgcKeECPXvhqDGGP1MtHkQApZ5VhI84WN186QHXBVK10yWqFLxkP
         tgL8iSM2O9iP3WY8jp0Ec4UNPz/wNUiNjjYEKon6Mq85kTvzspZsur/+2t/nC8ya0jho
         RTkXXIYFo/nCUenC3txgHD3UmdIqZ2JsgNekwnpR0inUhHxTNbOY0gzJRKe3qKIZ7UkL
         U8mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBTZKCrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q28-20020a05620a2a5c00b006feba0ab910si10390023qkp.609.2022.12.30.03.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBTZKCrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDfS-0006Eg-0N; Fri, 30 Dec 2022 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfQ-0006Ds-I4
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:16 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfO-0003pj-R8
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id m3so6118391wmq.0
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOZfJuKjGnXyKynHrF0ryyVy+OVxkYOdTY6ayMGkBgk=;
 b=DBTZKCrqACtUO10TYcUd+HHcB8Ps4HcfHIsmuWpBIbGRaqi7NLiap7mXT/ieFhugrD
 cANS0EBLjBDYMaCI3s4ZDInps2efuEi4BGL/spIZTa5qm87KBaomho7LiJnpJwdCi4mJ
 jN3vHmzgnq8qklxPx5q6RRAPBOEjLPQE3JttJcC0rpzLGy0Zv/I9bz9HLxTHYyYZZTND
 opN0PUXSIW1yHOUkb7GZOhenp6SAL29UyAE630gXTKSWfQUMlyxE8qH1fWN2mNws6xet
 6NGIo/pFPNO0vJWFZnhOvUSEO8Bw8LzDEgebp4JUv0XlcH5ifNnDZr5LoYUlxUtAC2Uh
 wLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOZfJuKjGnXyKynHrF0ryyVy+OVxkYOdTY6ayMGkBgk=;
 b=s4BU2VxhAYEO6TAgFvdgjOderJjwcqUzP23qVR/vur2aJhDx5Y2iI7Np45S3sqCXGE
 s6DNHIY5kC8ALo7ly7uso6AEn266LN5X5CjeEKVbCcnJ/EZFQ0+bQ7UCi7cXVqrgtoDV
 ISllnCnkc3hRQ38+CDTKAwdBEEc2J0Y1HgX49y9Nzw8qwE+8yX9NlMptVkoksNO5bkH+
 87rh98bkknrAj5TdVwjoJLOej6ZJe/4OT2A9viT7pvGbyvUYUmrRJqmXsyAssStqTM+m
 0/igqUR0/z5ir4lnvzblV8znbPz0yAV/1FnU0f3iZk8z6hkqCKK4J34hcHlbb/5p6lgw
 FgIg==
X-Gm-Message-State: AFqh2krMshKN2HqkZJfDYWzw9xPuXlhonu6et3V6MXvUMWYywpI2rgMH
 qNqhdBS2ZNeOvMgsiO10klh4mQ==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr22902840wmp.33.1672400113415; 
 Fri, 30 Dec 2022 03:35:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iz17-20020a05600c555100b003d1e1f421bfsm31857528wmb.10.2022.12.30.03.35.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size as
 'iosize'
Date: Fri, 30 Dec 2022 12:34:54 +0100
Message-Id: <20221230113504.37032-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FlfpxDMR81dI

Avoid confusing two different things:
- the WDT I/O region size ('iosize')
- at which offset the SoC map the WDT ('offset')
While it is often the same, we can map smaller region sizes
at larger offsets.

Here we are interested in the I/O region size, so rename as
'iosize'.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c          | 2 +-
 hw/arm/aspeed_ast2600.c          | 2 +-
 hw/arm/aspeed_soc.c              | 2 +-
 hw/watchdog/wdt_aspeed.c         | 8 ++++----
 include/hw/watchdog/wdt_aspeed.h | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 4d0b9b115f..122b3fd3f3 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* GPIO */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..a79e05ddbd 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* RAM */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b05b9dd416..2c0924d311 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* RAM  */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d753693a2e..958725a1b5 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2400 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
@@ -346,7 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2500 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xfffff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -369,7 +369,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2600 Watchdog Controller";
-    awc->offset = 0x40;
+    awc->iosize = 0x40;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -392,7 +392,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 1030 Watchdog Controller";
-    awc->offset = 0x80;
+    awc->iosize = 0x80;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index dfa5dfa424..db91ee6b51 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -40,7 +40,7 @@ struct AspeedWDTState {
 struct AspeedWDTClass {
     SysBusDeviceClass parent_class;
 
-    uint32_t offset;
+    uint32_t iosize;
     uint32_t ext_pulse_width_mask;
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
-- 
2.38.1

