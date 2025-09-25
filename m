Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12952CAC5B5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 00:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1aJw-0001ju-Ny; Wed, 24 Sep 2025 20:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vZPUaAkKCIQtq5qiw6ivowwotm.kwuymu2-izuvwvov2.wzo@flex--lixiaoyan.bounces.google.com>)
 id 1v1aJu-0001ir-J3
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 20:58:50 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vZPUaAkKCIQtq5qiw6ivowwotm.kwuymu2-izuvwvov2.wzo@flex--lixiaoyan.bounces.google.com>)
 id 1v1aJm-0004lx-2P
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 20:58:47 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b55251a4309so284266a12.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 17:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758761917; x=1759366717; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yBZzaq4OPnrNzR5BlCDzRnqVDQ5Ky610bUSrxowzc/0=;
 b=CQsQ6BmnUIVnvT0CZuWFPH8hA4HFYeDe56PajwX2m73NtCLWwfKpgiasXshEZgIBQf
 W7bTpxlQWbcPeGOyb21IA4eEPUJRc3yV+swgPEUpH06YP0oBRvW9d0ddxrevXQ4Xk3Z5
 wITi0vbCiJXBrqXc1YByHIWKz/4qnNLnHknK78wR8aZKdOa4peRxGBZrXPKe0y0ItBCx
 aDNiM+K6+MgBzDaZYbCz4yeYJkNkynTHG1HdA98eQRWhch0mUfjDXrRfKU7osNzc5jxk
 racybRQfsHbYr9xNeeoa7mPzWiOi4ZYVBqtg/XK0kGCfqjAbg7lrHCa8RbL5OpJq2AQj
 SgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758761917; x=1759366717;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBZzaq4OPnrNzR5BlCDzRnqVDQ5Ky610bUSrxowzc/0=;
 b=tupgHxI7x6Zkup3r3GSObgJC1TxCRPFhdGRmfkVJGqeYD20Ofb+vvflZSjRHvfl8OX
 dFy5arxZGTGHmLdtM96rvsDNEL5APNsoqMQHhh00KaOz62+dQpxCtJGUl+oBcRgzCh96
 Axvj2yrwJhSKVk0s5DejWGCajqdl4wEhb9jrQ4YoPcS8NNq3m3ogHyZHKpfpir/z56nI
 6uvnXmTo9LFGPbTQ9tlnoHsUdFbdQOeiAHZ9g8szt1TC1a2Gr7WXdiPOLxMytQfNt3To
 bx8jpCAPm4FYM2eOifGH26Z1KDKZxih0gc90AEYleiNe2yXJfL5IGOOCMjzDeN65t5Br
 moVg==
X-Gm-Message-State: AOJu0Yy1eOOsHiJn2f0NPk9EX0n10lG1vBO++Kn75wd30fIfDKAzjR3g
 upZOMCn/Qmq/mMkrcNSMyHc06MmtTDrxih+DK8jOufygaf7Aj53aEpPcwHbxrnY77kFaNZKjjEM
 DiU6cjNv5/xR7FOdoKA==
X-Google-Smtp-Source: AGHT+IHjVh5Hcl5LmRu88onDqyDDdsuWzXcT4ON0E3PEKUbh2975IlIaQWr1vFOhf9RNVZt4mdgdgZWuOl3VAU4=
X-Received: from plgk12.prod.google.com ([2002:a17:902:ce0c:b0:269:8538:446e])
 (user=lixiaoyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id
 d9443c01a7336-27ed49d0885mr17118235ad.14.1758761917549; 
 Wed, 24 Sep 2025 17:58:37 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:58:28 +0000
In-Reply-To: <20250925005832.3708492-1-lixiaoyan@google.com>
Mime-Version: 1.0
References: <20250925005832.3708492-1-lixiaoyan@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250925005832.3708492-2-lixiaoyan@google.com>
Subject: [PATCH v1 1/5] hw/gpio: Add property for ASPEED GPIO in 32 bits basis
From: Coco Li <lixiaoyan@google.com>
To: peter.maydell@linaro.org, clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lixiaoyan@google.com, 
 flwu@google.com, andrew@codeconstruct.com.au
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3vZPUaAkKCIQtq5qiw6ivowwotm.kwuymu2-izuvwvov2.wzo@flex--lixiaoyan.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
2.51.0.536.g15c5d4f767-goog


