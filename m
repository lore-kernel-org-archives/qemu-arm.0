Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1647510lfd;
        Tue, 26 Jan 2021 11:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoFxgI8cFjaQFiH22MUzprVMhMXX1fagp4pIb4tU4+mnSv1dl/2g3e56twhbpyuWO6kg4X
X-Received: by 2002:a25:1182:: with SMTP id 124mr10442325ybr.154.1611689889334;
        Tue, 26 Jan 2021 11:38:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611689889; cv=none;
        d=google.com; s=arc-20160816;
        b=ONNPlxCRtqb0MB/5Fpc7dA3ARtBuDbTlgiWVSeWS/dBbE6xHEtjvtjYhSA3e+dJzmt
         1k1ZxcMxPcfxqFq13AtMwSqbRuYSPpIaOI18xfakM2iCSL4uEkeliIIboff0AqLHi19t
         EGfDG1YJamutMy/Uq5v/y71s3FzF97v6zeDE7Y1ZjcGevW6rsSFiuuoQ6ILMnb1UWXHG
         Jwiuo+SgzCZyQYJKpUvxuIsTYRBhArvhy3AyHULznfnr/bhH6cl6ViI08rvif5XOUPRF
         ZxkqFQ5mY6fs1yoXeCoWHimkE2SYRfm+LRQTONGRgcUXbI/+DGFov8tppkauLA3toBqd
         iqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=0PFajRoJ1DQ0XYaobEENMylsgDeBQsfIucOzPRxM9DY=;
        b=AXA++XdfyPiQH4mwDuvHTsZSl0F3Ne1CKfnF66eucMnjaN831eCDuzMa7WEo+6HSgr
         f/idhYCf3IpDqhakYdEXSakNAp/XkJuGj4IFLnriwwElg7en8b5cyjRuLZV9yYvKmvZp
         spZsKILaL007n6nnl67nBTUnOF+GjOjthXZoyUJJmz8jvj8kO3cjZvsQv1l8Sd6WgBuK
         KRtISeYNfEcFU0l45su8+j98P/MnL3m10cqHAOjmJiuXJjCxOvwCAt9KWAOyO1GaQqK0
         HOKE7UhHteANJA5MFHoiSfzZb5DBwT5pycZEurDwvfZtqAWvcDOCWuHqD0ZTTZ77xOQV
         CPvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=Lh8Eael0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si19063522yba.98.2021.01.26.11.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 11:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=Lh8Eael0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4UAC-0000Qa-Ih
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 14:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3am4QYAgKCI8FD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5P-0004YZ-9c
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:33:11 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3am4QYAgKCI8FD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5H-00047a-3U
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:33:11 -0500
Received: by mail-pg1-x549.google.com with SMTP id i124so8877102pgd.4
 for <qemu-arm@nongnu.org>; Tue, 26 Jan 2021 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=0PFajRoJ1DQ0XYaobEENMylsgDeBQsfIucOzPRxM9DY=;
 b=Lh8Eael0nAszss1OY0l67Svp6F1n2VyjD/bI1A7HM60gbeSJW5wKy+FeAhzbWDdXo4
 KginxIYrHRPxr3XKEjNEml+RjaOuFIYY0/TPW3HhkgnhLN1Ynj/NUn1BjGPGNBeuUys0
 7g01SrQ5DZABfV61wnyDrfVfMVXKCQMX+0I2cUfyVyZZGOdFZa+vOeN77pRZR477/1Ml
 Unnt+BDYmwnJWUd5/NyrVyMbmVHfqyHJNK9UYIpFqcfFeIvegYMaBNiZkfavcWO5uTiU
 YKqjSqHMQI/dMD2FlUTxXF7418yIkY++rqZEsUkbE+Hb+OyqWpYlzaD1uaABpnPPUI1O
 BnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0PFajRoJ1DQ0XYaobEENMylsgDeBQsfIucOzPRxM9DY=;
 b=JCJDRFOUM2Do20BWFzqgrDBn5KEXSffZehJJolSvoytZ3D894u1/NhFGuTJo6jGVLA
 ftxyLfjLpPj7jPv/xQ/oEoM9tujjTi13Guta3TiQNRfvXGbr8UWDeFJi/vt9x53KfpwE
 mUt8r4tNBK717oDhA+X5K5x2mMMw5455MWHNossARDyTm7IAuGAaMoKkO3B/FFJjgPYM
 cCs7ZX0PSkxN/5oWiz+5oZefGtq6uhsy5zs3gQuvgzuacy2KlDMcAAGxYXgvN4BpKvnH
 Zl4qVroeQCXEKZuKnWW+n9VsHAfxE4vRvbcNEx/7hR0dhwUNpWj69ZmeYiWS+LBnK0co
 A4CA==
X-Gm-Message-State: AOAM531mSTSWPirhrMuNSspSUBqkNm3lpUuhsMG8xEBvp7H5CBD+9ZFd
 YEyIWoFeG30aaTnVWmMiYb0ZNFFxbi+ktQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with
 SMTP id o12-20020a056a0015ccb02901ba52823ab8mr6612813pfu.77.1611689578626;
 Tue, 26 Jan 2021 11:32:58 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:35 -0800
In-Reply-To: <20210126193237.1534208-1-wuhaotsh@google.com>
Message-Id: <20210126193237.1534208-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 4/6] hw/arm: Add I2C device tree for Quanta GSJ
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3am4QYAgKCI8FD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: HnCneeR+2rgy

Add an I2C device tree for Quanta GSJ. We only included devices with
existing QEMU implementation, including AT24 EEPROM and temperature
sensors.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 2d82f48848..1418629e06 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -112,6 +113,21 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void quanta_gsj_i2c_init(NPCM7xxState *soc)
+{
+    uint8_t *eeprom_buf0 = g_malloc0(32 * 1024);
+    uint8_t *eeprom_buf1 = g_malloc0(32 * 1024);
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x48);
+    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 9), 0x55, eeprom_buf0);
+    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 10), 0x55, eeprom_buf1);
+
+    /* TODO: Add addtional i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -137,6 +153,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
+    quanta_gsj_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog

