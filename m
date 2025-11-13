Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A80CD4F38
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 00:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJLRd-00009j-AX; Wed, 12 Nov 2025 19:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vykVaQYKCLYuqXejvckkcha.Ykimaiq-Wnijkjcjq.knc@flex--yubinz.bounces.google.com>)
 id 1vJLRH-0008Er-8R
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:54 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vykVaQYKCLYuqXejvckkcha.Ykimaiq-Wnijkjcjq.knc@flex--yubinz.bounces.google.com>)
 id 1vJLRE-0006N9-TS
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:50 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-297d50cd8c4so6916275ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 16:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762994624; x=1763599424; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tm8rA0540b2jPQHifOjOXAmLnosq8n0B2UdOlNRIOXw=;
 b=ebZHoqBiE2g6piTAaf2fH+nkVIBF8xb5bkQQUY7WqjUSar4nwPR8Ho9bE2qA6yg427
 WzXP/GYlT8sgC0MYZ2JU8rTWFhh2c11Jii3+LI4cyT2/nDDzi2ZSC6pDNf9qeLha3WBT
 siJK+rUFME2D1es4+O9ZI+oDqsNlgANBthwJAhlkOo4iU0BesmV7B7gg18ksZn/pE5gc
 LgNYZe+3JiG8Q0BF+Kcq25O2zIe7Mcz9pHdWYOIz4YcWU/abZZibtfyS1fQoZTx89xdh
 kfzKHyggmjVhZFKN7TI3lBT9hdY23V3kMcUmzffQUkMDuiCnBORVgtNKWGD+1LMSYFAg
 6X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762994624; x=1763599424;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tm8rA0540b2jPQHifOjOXAmLnosq8n0B2UdOlNRIOXw=;
 b=IjoHFLejJNsWuj/ctgQ6lJ/weYP6tk0nQSmUiFknUzNPdaMQkhTOrFyXJ+MfId0yoF
 7veTAbrJ2acLqK0J62fbbdTCerglWnxsB9iA76aeoN6gZCHx+66qePpeLwLb3n69dIL5
 m9R7ZSLazu+m3mtS06xNPnDeo8dhwpZAq7a1ETlFxhB8eT7n5fheFNIQ9teuGyN9U1+B
 7tqbTZChxuNbX9ag7ErAdabHvguSgCUFxBBmFR+JiRF4ZyG8sPZ3JuYk2JI4ev3/D0Rm
 /AV7uXalXsrkW8KeKiLIjqcaar+5uCJGnmp4Af5yFIu5konWGeBjxRPkA72pP9koHNl2
 9YTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDMB3JwmmRdz+ZyJ/QCFavoLM6gwPHWGtj3qY0T1Wj/X/F+6or4HZbxggjqm7nbZB1s5NwGtiqg==@nongnu.org
X-Gm-Message-State: AOJu0YxBLx8TMGdurwCMBV0ZMzeT+XiuCKCwJxKvytMrmkrxKIbIMkSR
 j+1O8znrT7Geqy03UDRjMfKyXcQ+0+gsX2PumIwnUKBDWAsFmdXBSxvlnXyGlCKJZN8QcersqKU
 PzG4bEg==
X-Google-Smtp-Source: AGHT+IFZj6G2V90cdeBOjI2IpVdvCMCt7rAIs8HpZHsitDYJafZnn754kQIjFZ6YfPCf67DWI22zQBX1I0c=
X-Received: from dlbbt10.prod.google.com ([2002:a05:7022:98a:b0:119:49ca:6b9e])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d2c1:b0:298:46a9:df1f
 with SMTP id d9443c01a7336-2984ed34247mr75727425ad.12.1762994623664; Wed, 12
 Nov 2025 16:43:43 -0800 (PST)
Date: Thu, 13 Nov 2025 00:43:30 +0000
In-Reply-To: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
Mime-Version: 1.0
References: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251113-quanta-q71l-eeproms-v2-3-e72451b974b0@google.com>
Subject: [PATCH v2 3/3] hw/arm: enable eeproms for quanta-q71l
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Yubin Zou <yubinz@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3vykVaQYKCLYuqXejvckkcha.Ykimaiq-Wnijkjcjq.knc@flex--yubinz.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Tested: Quanta-q71l firmware booted to login and was populated via the
-drives for the corresponding eeproms.
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/aspeed.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bae59ae7394882e3fc93863049a37ff5a8737ff8..8cef387a0b431576a873553704920886222cca86 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -562,16 +562,16 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4f);
 
     /* Baseboard FRU */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x54, 8192);
+    at24c_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 1), 1, 0x54, 8192, 0);
     /* Frontpanel FRU */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x57, 8192);
+    at24c_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 1), 1, 0x57, 8192, 1);
     /* TODO: Add Memory Riser i2c mux and eeproms. */
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
 
     /* Add BIOS FRU */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 3), 0x56, 8192);
+    at24c_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 3), 3, 0x56, 8192, 2);
 
     /* i2c-7 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
@@ -581,9 +581,9 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     /*        - i2c@3: pmbus@59 */
 
     /* PDB FRU */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x52, 8192);
+    at24c_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 7, 0x52, 8192, 3);
     /* BMC FRU */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 8192);
+    at24c_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 8, 0x50, 8192, 4);
 }
 
 static void ast2500_evb_i2c_init(AspeedMachineState *bmc)

-- 
2.51.2.1041.gc1ab5b90ca-goog


