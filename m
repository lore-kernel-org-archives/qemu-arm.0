Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1554795njb;
        Wed, 19 Feb 2025 10:50:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlKpdNjik1LmLel5hSGGYVtSvoL4hsbxzaTq9K8kBR6VeA7qb59i635I4s5cuo97AiU6k4KIr0916hvg==@linaro.org
X-Google-Smtp-Source: AGHT+IFUuJQU1vezpHoz/Ou4xjIzav0t7NsvHWQOfnl0oExNdf8c5AwfLSUEMZuMsxo38kHYAzcK
X-Received: by 2002:a05:620a:3914:b0:7c0:b336:572e with SMTP id af79cd13be357-7c0b53080d1mr580219685a.38.1739991023979;
        Wed, 19 Feb 2025 10:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739991023; cv=none;
        d=google.com; s=arc-20240605;
        b=P/FEuGCtmSOj1ZBFS+zmPQ4VaShSDl/DSo/7hFVxVnFr80lxhya0lbfCOjyy4p314y
         OOIEMJLm8hTRLb8Oiqw5E/lpAM/OpGYG+g0Bh1O3dc7dYoa63bO2c1kI7Na5yrVe6EHj
         P1cJ5uapDxZjmvKxNTCfoU1InBZkvnOwAh1ohKZdfMiUtO26cmYK6RKuARERd+7J9Bi9
         Fl849zw9xX1xKl9U73fgDb6610jkm+9dkZu3+9Rph/B3f33NTKchNVjqx2lKBLht7Exk
         7AllP4N98HLHLonvjB19aaH9KmN42cTXa00IEsXz6lvhN5nrYEJdp2XTIu98DpySnZyk
         z8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=E39oAQWyGXA+WES3rlqKQsK5aC0dpOzL/yrEOMkeMns=;
        fh=RRnXZUxZ2KuVmhxW7MG8Ogmhf9GBDtfO4GnetEaHoew=;
        b=OhBaAsHO+S82NY9EARL6ZIySgcOshWKr8z8jkxGkb6fhwCJLLwi4WQruY9446utHZV
         ZSYz0BfQ+jxQoMrZ7Uh6wlcEe+7eLu9b0/x8crkI/0/gh26g4kSus6bpY7S7LfcBRrxy
         TjIHullsjuDVnNwTNwvcbT1AdOT/+gkVIkeOMMB1JU50iZc3p+InNNQ019sU6nNequru
         hV8X2QcYHpbrlPzI0m5F/Gu5GLWb5on09OL6n5QOjqoM7l6aqTfoF97UdgbFIfi3y4b5
         7M++ErjfiVxBm35WDd+scO6doVj4I6XnrUjkaz8tXzkEvtPXyLNWVK7Kr4R9VSb2Vnwo
         gS1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QI7RsTaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09d8d4f38si655803485a.88.2025.02.19.10.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QI7RsTaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkp6O-0003E4-6o; Wed, 19 Feb 2025 13:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ECe2ZwgKCnsvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5p-00032o-Sm
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 13:46:46 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ECe2ZwgKCnsvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5m-0004lz-J6
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 13:46:45 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21f6cb3097bso862895ad.3
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2025 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990800; x=1740595600; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=E39oAQWyGXA+WES3rlqKQsK5aC0dpOzL/yrEOMkeMns=;
 b=QI7RsTaNsNlyIpriRDPP925gQ14giPvmwXuYkwirKtN0INAoDScrUaVJRQWkuMqHM8
 iCF1s93PCWN9K1rXLSA1IymoGrZbUmEmmIxQqaUWElxCWjPBobDHORfbOUsGrXBHvIXG
 9Q8fhneh6wKX5UItbgMjTTiKv7IlOTS++ajs7R6JTE4vG6mLTwjKbc24D404wf+HTv/s
 qIqg2fS7KWQgwoG9a1ENB2vGp4nznb5qZnOVeZ4d7nZxCzrzKEt81kC1s5R5B9RNKdcp
 j1D8H2vPuwzWcskSMbLmHqJ7cft48ztLymP/QXl89ciLA9lO6VWs5fBUckfGJwgUGvgN
 MxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990800; x=1740595600;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E39oAQWyGXA+WES3rlqKQsK5aC0dpOzL/yrEOMkeMns=;
 b=BVjcLKZFzykT0O3uPHA7139EqQxpvrjLnwAmEeErVnS87Dn5UmgiQ8h9xRACiaA1ZH
 NNS4LJD34kSyCFEz23Uk2418uyHhjmjMYApiYzSQWqCYwoTx25Y83m3/fOVC6OI/JkBL
 gjWsa3J+kS8uo5/DAys7YcYsuGXfCYlsAl82CzY9MDGVFDYkTrCvI69TCOCfpttLf0J3
 NgEX4OHCpGU3l7bQsvpTzxKqP6d3TYhBQ6uq1PCAe8xkAQN/g/l472Yrd8w6RGlhJwsp
 FCXWxOaC+M6I4qLnD3IH+ngXURCwvTwzoXc8snaalViokbGuLGxUDiksSOJAYeoeeZ6t
 Xz8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7pf/3/DHIkBZMvxaDIRgfFIrija3e1o5UKqe1H9i9dMOSiQK/7+dE07ETlyA49Oz5Y/vZSat3mxBs@nongnu.org
X-Gm-Message-State: AOJu0Yz8w/vg3s54n68puYzXgHfJefX2szeQWL1NVTBAvADdL3ri+Vq5
 Dtu4C+rF9CF4MEnLofsBcqgRN6JKAsrCircRubgPeZxWNqY3vKmxalYk9VGsjRglXcLEUO2+Ovz
 k4WvAXFK9Kg==
X-Received: from plqq12.prod.google.com ([2002:a17:902:c74c:b0:220:e7dc:350d])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f78b:b0:220:e336:94e with SMTP id
 d9443c01a7336-22104013e19mr292267905ad.15.1739990800424; 
 Wed, 19 Feb 2025 10:46:40 -0800 (PST)
Date: Wed, 19 Feb 2025 10:46:01 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-11-wuhaotsh@google.com>
Subject: [PATCH v5 10/17] hw/misc: Rename npcm7xx_clk to npcm_clk
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3ECe2ZwgKCnsvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 687hOLOh9Nml

NPCM7XX and NPCM8XX have a different set of CLK registers. This
commit changes the name of the clk files to be used by both
NPCM7XX and NPCM8XX CLK modules.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/meson.build                           | 2 +-
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 2 +-
 include/hw/arm/npcm7xx.h                      | 2 +-
 include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (99%)
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (98%)

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 554eb8df5b..edd36a334d 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -69,7 +69,7 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx_rngc.c',
 ))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
-  'npcm7xx_clk.c',
+  'npcm_clk.c',
   'npcm_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm_clk.c
similarity index 99%
rename from hw/misc/npcm7xx_clk.c
rename to hw/misc/npcm_clk.c
index 46f907b61c..2bcb731099 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 2e708471ec..e80fd91f20 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,7 +23,7 @@
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/misc/npcm_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm_clk.h
similarity index 98%
rename from include/hw/misc/npcm7xx_clk.h
rename to include/hw/misc/npcm_clk.h
index 5ed4a4672b..0aef81e10c 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -13,8 +13,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  * for more details.
  */
-#ifndef NPCM7XX_CLK_H
-#define NPCM7XX_CLK_H
+#ifndef NPCM_CLK_H
+#define NPCM_CLK_H
 
 #include "exec/memory.h"
 #include "hw/clock.h"
@@ -177,4 +177,4 @@ struct NPCM7xxCLKState {
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
 OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
-#endif /* NPCM7XX_CLK_H */
+#endif /* NPCM_CLK_H */
-- 
2.48.1.601.g30ceb7b040-goog

