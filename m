Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp86490njb;
        Tue, 24 Sep 2024 20:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9/2Cu1FdpoGxZS7nz94CHcVkJrexbI4+1ypi3GTDz7As1JWYqlxyE4Og0jF459DolG4jPguWrPqen3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGM7Ml3yeV1rJsAw0SbHhJK1jTCrEFrPqihpmvN4CaHtHnpG471ddBZx6BLt1k3Uh9aCHjn
X-Received: by 2002:a05:620a:1918:b0:79f:67b:4ffc with SMTP id af79cd13be357-7ace73e2adamr202382585a.5.1727235343466;
        Tue, 24 Sep 2024 20:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727235343; cv=none;
        d=google.com; s=arc-20240605;
        b=RDy2F8rxSWPof+lAu06Nn/CE0pTJ7mbB7qO2dlhsRlYea7U9vhs6NdQoJWP3rLGy7d
         E1g9HoDRF1a65QdAug6drBmYIeDoVVEZxuQu3izXLeQVJbuPCEvRavoFlimATEvnDFnB
         o6HxHm1yzxGZ5BOc/4ntYkAHYxbfIEBXaTuHvBg9eM6nJhvZa4mfoGB5BuHBTcp+Iyfz
         qf9sMN0KAVuM06xdF7XkB/GZU2PuD6zLje2ZodJmJGgY1gx+zUPwSSoK5VwsbmRWRM+5
         1W+mjJIqjRgv4R/seCpX5D4YuGihkvnwHScr6zZ2+67Si1n+n39aX0vwJsSfMcCjRBqP
         i17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ETnMHFs0G5r2xU1bmiPZZEIDclUSWydyIB52uZ3z5ac=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=E75QWdgTz2XHYFtkuWBr98eOsL/KRWHiaKZgOmnng0XIFl1hNb/XkElNLpobJAfblz
         VGY+LMyPUyknupNlQ3/trJemAxVtuDjxobTxPAEb1q8YW68eCcwBmtcToK8wi6RQFUqM
         39fqWcKk2/eMuN2Vvlyr5tDjOACO4ITTbFKffYXiBrSl4ITNqZ7K0MduPpDV73TSynz0
         +v5lQ/BW+4ZNAMuBfkyIOfmReQ1GtqNKWSQ9GOuexEE01j/jiSzamUk+8rByRUdPFzJP
         YKBo0G5tRdI0U46UJegsUvBLig6D/HW3wM3DkaawKpJZR7PQlenj1XCz/MUv36VGv78v
         +rBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acde5cc9b4si298513885a.363.2024.09.24.20.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 20:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stIoF-00047R-Kc; Tue, 24 Sep 2024 23:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stIo9-0003z3-EI; Tue, 24 Sep 2024 23:35:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stIo6-0007FP-88; Tue, 24 Sep 2024 23:35:16 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 25 Sep
 2024 11:34:55 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 25 Sep 2024 11:34:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 4/6] hw/gpio/aspeed: Fix clear incorrect interrupt status
 for GPIO index mode
Date: Wed, 25 Sep 2024 11:34:52 +0800
Message-ID: <20240925033454.4117445-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925033454.4117445-1-jamin_lin@aspeedtech.com>
References: <20240925033454.4117445-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: j10NJ03zEB2o

The interrupt status field is W1C, where a set bit on read indicates an
interrupt is pending. If the bit extracted from data is set it should
clear the corresponding bit in group_value. However, if the extracted
bit is clear then the value of the corresponding bit in group_value
should be unchanged.

SHARED_FIELD_EX32() extracts the interrupt status bit from the write
(data). group_value is set to the set's interrupt status, which means
that for any pin with an interrupt pending, the corresponding bit is
set. The deposit32() call updates the bit at pin_idx in the group,
using the value extracted from the write (data).

The result is that if multiple interrupt status bits
were pending and the write was acknowledging specific one bit,
then the all interrupt status bits will be cleared.
However, it is index mode and should only clear the corresponding bit.

For example, say we have an interrupt pending for GPIOA0, where the
following statements are true:

   set->int_status == 0b01
   s->pending == 1

Before it is acknowledged, an interrupt becomes pending for GPIOA1:

   set->int_status == 0b11
   s->pending == 2

A write is issued to acknowledge the interrupt for GPIOA0. This causes
the following sequence:

   reg_value == 0b11
   pending == 2
   s->pending = 0
   set->int_status == 0b00

It should only clear bit 0 in index mode and the correct result
should be as following.

   set->int_status == 0b11
   s->pending == 2

   pending == 1
   s->pending = 1
   set->int_status == 0b10

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 6e6ab48b56..58ae63e3c1 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -642,7 +642,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
     uint32_t pin_idx = reg_idx_number % ASPEED_GPIOS_PER_SET;
     uint32_t group_idx = pin_idx / GPIOS_PER_GROUP;
     uint32_t reg_value = 0;
-    uint32_t cleared;
+    uint32_t pending = 0;
 
     set = &s->sets[set_idx];
     props = &agc->props[set_idx];
@@ -705,15 +705,16 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
         set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
                                                       reg_value);
         /* set interrupt status */
-        reg_value = set->int_status;
-        reg_value = deposit32(reg_value, pin_idx, 1,
-                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS));
-        cleared = ctpop32(reg_value & set->int_status);
-        if (s->pending && cleared) {
-            assert(s->pending >= cleared);
-            s->pending -= cleared;
+        if (FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS)) {
+            pending = extract32(set->int_status, pin_idx, 1);
+            if (pending) {
+                if (s->pending) {
+                    assert(s->pending >= pending);
+                    s->pending -= pending;
+                }
+                set->int_status = deposit32(set->int_status, pin_idx, 1, 0);
+            }
         }
-        set->int_status &= ~reg_value;
         break;
     case gpio_reg_idx_debounce:
         reg_value = set->debounce_1;
-- 
2.34.1

