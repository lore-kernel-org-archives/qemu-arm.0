Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2115433njb;
        Mon, 23 Sep 2024 02:43:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrnZo8s9s+odFWSxh24NLu9KYbLhAxe7K3RqM14yKzquQt99JuEuWWq/ax/K3XWyTXekbEp6x5UNlsJA==@linaro.org
X-Google-Smtp-Source: AGHT+IEVsq9GIuktGO/3ckYYaginTuloM/MKw9uMPcyYy2J70bk4FpSKk54p38Nm2wqBmQJMxo0j
X-Received: by 2002:ac8:58c8:0:b0:454:f384:41e7 with SMTP id d75a77b69052e-45b204e1e28mr199468281cf.8.1727084617605;
        Mon, 23 Sep 2024 02:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727084617; cv=none;
        d=google.com; s=arc-20240605;
        b=iif0rZFfziy797KslISRYVBy1AaxXUvT0DuAv4oqjPt+vtsJud75881i9mUYi19T/c
         /uzwZpYLoaDxg5jKI79YAPY9fQa7OhZwUyOeFDQL73ivDdziAPRjA0u7/GJyzRBrhW+K
         Vffirt8zRI1pyN/3SLlHg190eeTajdO5LKBM7ezrCJ5WkUtkX1DJhItTo0M5lgiYJYqq
         kqn0SQ1xNCmWcEcgGjak5kZbOxnUDDCXJziSXXXsYGEnHRJtbUuO0+WRQSa4CMGDgZ3K
         6NgXusfuI+8qhbjlmlQTNvCH+EgZW1qhbVJb6MduBSiwvyPwB4atpxzqsHU/VkTUcuXn
         0Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=byVF7q0kfrWwC088Wf11Urt8aUWVVN4GHHXMdHOSz2Y=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=gbHx08Em6WAsklroqeyS4n5pVrjcXxBO5OxIL4eEZATngeFbXigrDP+noZUrpuCFwe
         aJF4ISgs36emsod+tgwWzIvnyxnq8lF6/kVpzE8pVeHLg4NjzyBNHkItGg+/w3mvd5CR
         RwFF15S038e20yVoUE8tNxtvdhBQIw+VfWurJR0wIWieBPmYC5Mjr3X6vxY2vDW4htTk
         d3QMogdydsdGq2Q8gSwnb73YyERudJyDj2IEVx2Li1fIDXuHjKuz8d5TYTHVL06eFuy2
         HmsoG4zdUiqDtyN7PWDf8WIVNU4ZTUT1cnotT5TyQgMfdHaN8OtPkpJd1pD01rYjAEF0
         YAXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b17955aabsi99810391cf.710.2024.09.23.02.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfaP-0000P8-4W; Mon, 23 Sep 2024 05:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaL-00008T-Ap; Mon, 23 Sep 2024 05:42:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaJ-0008C9-M8; Mon, 23 Sep 2024 05:42:25 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 17:42:06 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 17:42:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 1/5] hw/gpio/aspeed: Fix coding style
Date: Mon, 23 Sep 2024 17:42:01 +0800
Message-ID: <20240923094206.1455783-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
References: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: clNSBPMzNamf

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c         | 3 ++-
 include/hw/gpio/aspeed_gpio.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 71756664dd..901b576144 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -340,7 +340,8 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
+    aspeed_gpio_update(s, &s->sets[set_idx], value,
+                       ~s->sets[set_idx].direction);
 }
 
 /*
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 90a12ae318..39febda9ea 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -88,7 +88,7 @@ struct AspeedGPIOState {
     qemu_irq irq;
     qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
 
-/* Parallel GPIO Registers */
+    /* Parallel GPIO Registers */
     uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
     struct GPIOSets {
         uint32_t data_value; /* Reflects pin values */
-- 
2.34.1

