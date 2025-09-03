Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DFCA1010
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 22:21:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utvr1-00058Z-6e; Wed, 03 Sep 2025 18:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SbW4aAkKCOIPMbMEScERKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--lixiaoyan.bounces.google.com>)
 id 1utvBN-0005j5-56
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:21 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SbW4aAkKCOIPMbMEScERKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--lixiaoyan.bounces.google.com>)
 id 1utvBL-0003S2-E9
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:20 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e9d5260b7b2so594199276.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756935497; x=1757540297; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7YmXbfGBvimAKdLcD+dHyCW8+I0vDsbzJdW19c8VFSA=;
 b=gAsmMsqz0f1DObFDFhkAhJGGmCVkZ0g3L8Th4/BSZCdEvj4yAk8stmSYqBrrUUbm1W
 O2qFzIa8uSe6Qd4X0bsiN10LFBwC+WYe19SZLtUKJ6Kp0x1ShpSLkx/wkEawF0ht1+PF
 aAtwMhNYYpzJ9vb8tSiyEuXNgXQ4M/XaInwd13YsWkq1uUZ/GUPmxTaG9kLQ4DYudYuC
 ABlb/C+xYsdOsyIWrTyHGiFE8+uVI9M/ZAaeVQ9ccFPuwWknbb4lbSVtKfoiLJTaW2aU
 5S9WAY7zXItqxbOg/bWbrRlpcmNlRJpINbxszDLEScJoBvmqNYiva9zYTtY/GFez/n5C
 Fvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756935497; x=1757540297;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YmXbfGBvimAKdLcD+dHyCW8+I0vDsbzJdW19c8VFSA=;
 b=ui8caO19n6FofdU1mRz17InuGKqB5oTK7UB9KZDXKJS8qoA2X8pYxuBjWl0GhxQsBf
 JtlY8kDVARXIUlcFw++/3Am43izImiJNxariGYJFhX7n3xg4uZBm3jUzn3K80awfo9NV
 6CIx07kYut69A+bKyBvHG/DQ16xxffBz1H1QmT074IaZXvDNrkCgC2YGkcB0Pj0rGa+w
 jQxk8LgvOLCCCvzi0rdlhlQkeaKhiqH3agmP2cV94KDN18br2tJccfRRVlIiUmRi31Rh
 fQtmBjbNp78ihn1248vo9XVGipqMaxihlHcuB/1840ST41kNY52WLU3wz0mJ8XmfD6bJ
 Mklw==
X-Gm-Message-State: AOJu0YygJGr1Hlza5lY6902+LaAjljczQ3C+KVfaeLEF4sbj0jzRd3aV
 qATYDtZA2iXs3WyeV8Uc8Od7k+YfdxWvZOvXFix9mj4XuXwi+dWMT4nFfr4aPbmotzcLhQYDB0n
 9YPlui4h2ahcnpIPkPg==
X-Google-Smtp-Source: AGHT+IGnr80oMbMZwKeA62+/WdLQoGMgHXnxIa4mPkQDbm6ESxOgMgJRfSEzlQcjN/4REELZ42qrkChL1I7Yr2Q=
X-Received: from ybey126.prod.google.com ([2002:a25:dc84:0:b0:e9d:6756:ec1f])
 (user=lixiaoyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6902:18c4:b0:e8f:e04f:ef9d with SMTP id
 3f1490d57ef6-e98a3654661mr19462528276.0.1756935497485; 
 Wed, 03 Sep 2025 14:38:17 -0700 (PDT)
Date: Wed,  3 Sep 2025 21:38:05 +0000
In-Reply-To: <20250903213809.3779860-1-lixiaoyan@google.com>
Mime-Version: 1.0
References: <20250903213809.3779860-1-lixiaoyan@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250903213809.3779860-2-lixiaoyan@google.com>
Subject: [PATCH 1/5] hw/gpio: Add property for ASPEED GPIO in 32 bits basis
From: Coco Li <lixiaoyan@google.com>
To: peter.maydell@linaro.org, clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3SbW4aAkKCOIPMbMEScERKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--lixiaoyan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -86
X-Spam_score: -8.7
X-Spam_bar: --------
X-Spam_report: (-8.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_FROM=0.938, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Sep 2025 18:20:31 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Felix Wu <flwu@google.com>

Added 32 bits property for ASPEED GPIO. Previously it can only be access in bitwise manner.

This change gives ASPEED similar behavior as Nuvoton.

Signed-off-by: Felix Wu <flwu@google.com>
---
 hw/gpio/aspeed_gpio.c | 57 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 609a556908..2d78bf9515 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1308,6 +1308,57 @@ static void aspeed_gpio_2700_write(void *opaque, hwaddr offset,
 }
 
 /* Setup functions */
+static void aspeed_gpio_set_set(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    uint32_t set_val = 0;
+    AspeedGPIOState *s = ASPEED_GPIO(obj);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    int set_idx = 0;
+
+    if (!visit_type_uint32(v, name, &set_val, errp)) {
+        return;
+    }
+
+    if (sscanf(name, "gpio-set[%d]", &set_idx) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+
+    if (set_idx >= agc->nr_gpio_sets || set_idx < 0) {
+        error_setg(errp, "%s: invalid set_idx %s", __func__, name);
+        return;
+    }
+
+    aspeed_gpio_update(s, &s->sets[set_idx], set_val,
+                       ~s->sets[set_idx].direction);
+}
+
+static void aspeed_gpio_get_set(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    uint32_t set_val = 0;
+    AspeedGPIOState *s = ASPEED_GPIO(obj);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    int set_idx = 0;
+
+    if (sscanf(name, "gpio-set[%d]", &set_idx) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+
+    if (set_idx >= agc->nr_gpio_sets || set_idx < 0) {
+        error_setg(errp, "%s: invalid set_idx %s", __func__, name);
+        return;
+    }
+
+    set_val = s->sets[set_idx].data_value;
+    visit_type_uint32(v, name, &set_val, errp);
+}
+
+/****************** Setup functions ******************/
 static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
@@ -1435,6 +1486,12 @@ static void aspeed_gpio_init(Object *obj)
             g_free(name);
         }
     }
+
+    for (int i = 0; i < agc->nr_gpio_sets; i++) {
+        char *name = g_strdup_printf("gpio-set[%d]", i);
+        object_property_add(obj, name, "uint32", aspeed_gpio_get_set,
+        aspeed_gpio_set_set, NULL, NULL);
+    }
 }
 
 static const VMStateDescription vmstate_gpio_regs = {
-- 
2.51.0.338.gd7d06c2dae-goog


