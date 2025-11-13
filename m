Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF788CD342D
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 00:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJLRq-0000Qf-Do; Wed, 12 Nov 2025 19:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vikVaQYKCLUtpWdiubjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--yubinz.bounces.google.com>)
 id 1vJLRF-0008Eb-FF
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:54 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vikVaQYKCLUtpWdiubjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--yubinz.bounces.google.com>)
 id 1vJLRD-0006Mr-Lb
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:49 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2955555f73dso2067205ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762994622; x=1763599422; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tdPJbA5gQYfjHofpxb9clh1H5FB3WQCqFyboBs0lAbc=;
 b=isbzWYtC5MHFg1yvh71fWoLObLgbHo9N5XEm+wlxXw8puaLPuDGrKEQbXN9dbYTADS
 IL/c5vgRK0yRkXXIM0kVDbzKEp7bNpVeD94i8zlk4+LL8koMh+EeZ39uVVRuMUbguVlS
 lw8v+eUe8PLUFm9ODtmDcbIwTe3g0qQHUm70fJclpPSExWNf7OjmDPc37/FOV1HTZsHN
 7llPe28PxfOq+gZNNWN/kw03vpE07NkQ44gFFJ0u6X/vdVCp9J5BRRijrVlulrJWnLrK
 sPW/runRAZh4LHYIKYOVKFLp/pudcWQHQtSdDbGf+k0tamstKePfMQ++5Ln84Nx6WmXi
 53FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762994622; x=1763599422;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdPJbA5gQYfjHofpxb9clh1H5FB3WQCqFyboBs0lAbc=;
 b=oxdIW4WQvjwu+C3zLNYui/Vh+FChlgrYcFaclikGU1Jnyg/6bMJuR7+d3vLgjD+22T
 0XbpQ1NTm0O4eTerEF12nig1zqDg1bQ1JZteuo72cRIyBwiITgf4IeykWyA5Tm/zQxfV
 4AVBY3Xmdlfzd7NftF3eALbtNwCDCs89FSNZTpwfaTDCU7iE76M62Du06mlUNXLGSJu7
 OigxP07PyXAJb7kgp8sD4lcazPgv+6YD65857M+Dn7butTVUb4UDfhPLmCasndGAXO5E
 sOWXgVU7mwfMEkvFleFke0c1judK07HLvGPNfPgDV7luBswkH2WXyEREMaYLSqPvA4Vi
 aOkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUynDRk4JmiE9oZ8jR+8Mv0bhDDeAARUNjqB9yDeWrVIrmkDV9ccYtNAIZVS6vCghl12fjCnUdGHQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVI21yAww/rHagwFeu8/VsMfuwZbOOenU4nihT76WTCQTkFN5V
 94F7Nym32GFfiM66e5NhOG7zY9o+SO/0wcWMqqkBfsbOsg0ohHguRlnYHNjS+5/sV4niu2Jgz0a
 JX+bNVQ==
X-Google-Smtp-Source: AGHT+IG4C8E0Tv/dBwExGNQeHKSMNapEPfTkokX4/6JZXKdbuJgbMkbJHDlHhNqI0kiYgGSmhsUI4/mKQm8=
X-Received: from dlbvp3.prod.google.com ([2002:a05:7022:ff43:b0:11a:126f:ee80])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f86:b0:297:c71d:851c
 with SMTP id d9443c01a7336-2984eda9f4emr58626365ad.36.1762994622150; Wed, 12
 Nov 2025 16:43:42 -0800 (PST)
Date: Thu, 13 Nov 2025 00:43:29 +0000
In-Reply-To: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
Mime-Version: 1.0
References: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251113-quanta-q71l-eeproms-v2-2-e72451b974b0@google.com>
Subject: [PATCH v2 2/3] hw/arm: add eeproms to quanta-q7l1 board
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
 envelope-from=3vikVaQYKCLUtpWdiubjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--yubinz.bounces.google.com;
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

Adds eeprom init for aspeed helper method and adds 24c64 eeproms to the
quanta-q71l bmc board.

Tested: Booted quanta-q71l bmc firmware to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/aspeed.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c31bbe7701381f6980e874f9fca51805ff9fb9b4..bae59ae7394882e3fc93863049a37ff5a8737ff8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -561,14 +561,17 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4e);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4f);
 
-    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
-    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
+    /* Baseboard FRU */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x54, 8192);
+    /* Frontpanel FRU */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x57, 8192);
     /* TODO: Add Memory Riser i2c mux and eeproms. */
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
 
-    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
+    /* Add BIOS FRU */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 3), 0x56, 8192);
 
     /* i2c-7 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
@@ -577,8 +580,10 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     /*        - i2c@2: pmbus@58 */
     /*        - i2c@3: pmbus@59 */
 
-    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
-    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
+    /* PDB FRU */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x52, 8192);
+    /* BMC FRU */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 8192);
 }
 
 static void ast2500_evb_i2c_init(AspeedMachineState *bmc)

-- 
2.51.2.1041.gc1ab5b90ca-goog


