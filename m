Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp778508njb;
        Thu, 26 Sep 2024 00:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4d7aOylJLltl+cYQJKOXODkr1nbMQ567WOQvrwVerL5dgmh4ipBKVs0WAUJv2dsOJUySsX0+Girytiw==@linaro.org
X-Google-Smtp-Source: AGHT+IETBHp2nbLnBmyjUZLDanFPbOgH4juhBwL6g5hkeKIKUe2ei5nBvCN/0rQcqT/T0CxCGjbV
X-Received: by 2002:a05:622a:14e:b0:45b:28a3:46d with SMTP id d75a77b69052e-45b5def2800mr63771041cf.28.1727336994819;
        Thu, 26 Sep 2024 00:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727336994; cv=none;
        d=google.com; s=arc-20240605;
        b=VLXAvgj78A7Bry4PDdMp/22glxeCyF7vVk/YR+oH8xeH0KJyUDcutOuggeVQKiBQHv
         qIGB2cChrPdlsIuPcZpSFZE8aGUiRZbWXWepGnzucfT15ZTk10yRIestF3h/n6Fy1B8x
         8k2Ajqyz238Ef8NTBDISGMAMDocJaTHvELJXfUw4woRcN0FE8B8JtH/9VaPy0gyb4Y72
         t1wJpnQ6WjRaUxVH4Hva88pvsmBdNuuY1QGw0ZObU3eZnoUdgs1aaGOzKgTNVeU98lSQ
         iL0yF8LZr8GN6iB2GFZrd9r5DJS6f/IYBD6na41g0cB/1DibMQG5C34Wl3q2T2E/MaSl
         +Vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OV1UhsVdSVqr7UUa1EW1koTbrvOkCE214NwP8TKxAKs=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=YL0zjl1cQiKlRY8wX1mBNRNPqY0M2xvg4YjUsRHmR7g1McC2GcXOhbi3Z0zQW0CVV1
         2Kl2L9Svwa3JnvOnt5zrPsaVK8CA8emSHSOUj3GJkj7TsaSQBiGUION3psvDYWRPBC8z
         v3J3QY/X8wubEPfODVJDD6R+CswtNYiGJMSeuJRCPzXCj3bA50NCaZAR4Q6uekSXHhrR
         hTows+3UZ8HWwoK6BfXR8CDVo2XbUg1ToS3cC7dyH4/y8CC6mwe4WcBZgV0DHrb2fcec
         TNkNu47ap02B0J69YrOjtzjXCUBQncoZ5CBHPGP+3RwjtYlpkVxI2+3VLn2t8mtuLqzg
         wEUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b526f3edcsi52673031cf.541.2024.09.26.00.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 00:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stjCX-0001yq-01; Thu, 26 Sep 2024 03:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjCT-0001rc-UL; Thu, 26 Sep 2024 03:46:12 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjCS-0006Ef-3O; Thu, 26 Sep 2024 03:46:09 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 26 Sep
 2024 15:45:37 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 26 Sep 2024 15:45:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 4/6] hw/gpio/aspeed: Fix clear incorrect interrupt status
 for GPIO index mode
Date: Thu, 26 Sep 2024 15:45:33 +0800
Message-ID: <20240926074535.1286209-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
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
X-TUID: EZqqtsDnKHiX

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
   s->pending == 0
   set->int_status == 0b00

It should only clear bit 0 in index mode and the correct result
should be as following.

   set->int_status == 0b11
   s->pending == 2

   pending == 1
   s->pending == 1
   set->int_status == 0b10

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 8725606aec..16c18ea2f7 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -641,7 +641,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
     uint32_t pin_idx = reg_idx_number % ASPEED_GPIOS_PER_SET;
     uint32_t group_idx = pin_idx / GPIOS_PER_GROUP;
     uint32_t reg_value = 0;
-    uint32_t cleared;
+    uint32_t pending = 0;
 
     set = &s->sets[set_idx];
     props = &agc->props[set_idx];
@@ -703,16 +703,23 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
                               FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_2));
         set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
                                                       reg_value);
-        /* set interrupt status */
-        reg_value = set->int_status;
-        reg_value = deposit32(reg_value, pin_idx, 1,
-                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS));
-        cleared = ctpop32(reg_value & set->int_status);
-        if (s->pending && cleared) {
-            assert(s->pending >= cleared);
-            s->pending -= cleared;
+        /* interrupt status */
+        if (FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS)) {
+            /* pending is either 1 or 0 for a 1-bit field */
+            pending = extract32(set->int_status, pin_idx, 1);
+
+            assert(s->pending >= pending);
+
+            /* No change to s->pending if pending is 0 */
+            s->pending -= pending;
+
+            /*
+             * The write acknowledged the interrupt regardless of whether it
+             * was pending or not. The post-condition is that it mustn't be
+             * pending. Unconditionally clear the status bit.
+             */
+            set->int_status = deposit32(set->int_status, pin_idx, 1, 0);
         }
-        set->int_status &= ~reg_value;
         break;
     case gpio_reg_idx_debounce:
         reg_value = set->debounce_1;
-- 
2.34.1

