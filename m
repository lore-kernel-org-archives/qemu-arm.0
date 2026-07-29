Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50762C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:39:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6ND-000598-4R; Wed, 29 Jul 2026 11:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6NC-00058j-4L
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:39:10 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6NA-0001dJ-Lo
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:39:09 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-495437bb891so9276675e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785339547; x=1785944347;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yyemhKIbNDI0dfV54rPviOfcsJPqmPO4g32wuNZQnWs=;
 b=f0yD7rX6dJ5WaO++IYx5PizjoobB7zwGagbxrzySCX6t6x46Ax1QmvovoylJjSISnJ
 3jBA4MOV97N6/j1knirJZJV3LOW0PEHK/BEya0CEuRtDpZ2hhg3UjpwAgWMLS94MhDKv
 0KaUAT2OpghErGXgTANDzN9TpR03N1EHuUwNzIfiLLxCy7Dpmr/WjZplgBS5Pjk/YO4j
 xGkXzhqCwsU3kk2SZQk3hjdIVsZv77m+5KPMxF5i+a+msQyflULm2/u1w27aQ6FKLNQ+
 vntMG1VOOFQ9Cu/TNrvUxJHhjHw/hjs7XvJ3tz2ceXNfkZ8z4JUpGjWUbz5EpTiwXOSi
 8IPw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp41EvMXEjxhzhNtyXnHoAOfflYw3UieC3O2zycWtgrm8b7azJNsV02rTgy89LjBPQaopRAZ6VVMg==@nongnu.org
X-Gm-Message-State: AOJu0Yxv3nq98SpRWPd5/bEx1XERB8mc0CK+hHU388+DFw55V4OVz8M4
 k8uVv05rh0ylQUv32DCcRoyGwbWtufA0jwsmyhwErj3Sp3lcjrAF7/2b
X-Gm-Gg: AR+sD12F0GQin4BH+s8PI4vL/dE63t9+v0CHIu5Npkhzccaj4MgrDTZaptfaIUjprIG
 8DgOTNXd5e5wenJScBNjDlA4ZG3AhgJZq2SAEH0IOe/Fn4W3cbfhtl55nbfHW7lEEccRaV9905b
 azBDF0+bHM9GS9U6pfDzPOR0yWq3EwVGx9n/wRkOmmYjIgtAySHzpdXRZI8mcipskDXyyUkt5qy
 qFqKyLgqe+THWu6WtgFLYJOXxfQnc1A+1BfWScyQmAEzSZWgb1Qdj2vyEqqA7hkwiOYOFQWBPKz
 oAyHJwA10rDha57ZClY2qGeVDW3FC89V2oepSr7moAovVJdq8O8HXFmKfQ+BoScOAZZEiaJuElq
 5Q3mxTDnRXGh8ridvZmzh7QXhFFU9pXDPRKco75YWdBJlYXbG9/arRPErfp7/gI5yMHZR7xB0Sh
 UNM2hIhbdevdDvCs16lgXTxiKF1aEZApdgduN2y60q5XRbItAF5ivZl6TW2Q9NFxCJe8X7KZ3tJ
 QiaTWqFqx9grnuUjkPnoSWmCJ1/ivO27qQS
X-Received: by 2002:a05:600c:8710:b0:492:6f5c:fd8c with SMTP id
 5b1f17b1804b1-497fd311860mr30695555e9.15.1785339547088; 
 Wed, 29 Jul 2026 08:39:07 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c462512dsm154633125e9.13.2026.07.29.08.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:39:06 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:51 +0200
Subject: [PATCH 15/25] hw/arm: fuji: use the real TMP75 and LM75B
 temperature sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-15-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337964; l=2648;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=3Z2LgNf5NONtKdqbZ6IR/+v7877ewZwsl3F8BgLX3xg=;
 b=c4/xi9dVdrmq4Gb6hhrV7h2lN96P0ySNSmm3xHFsWb4HZHVBk9iSs4KSPx7QikBqfLxbvUfdI
 Dte8Sm01v2EADnUZ/CbogUMI0hmLbSEgk3tPZwmDb4LR3aBzhazf8Mb
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The Fuji BMC instantiates many ti,tmp75 sensors and several NXP LM75B
sensors; the original board code approximated both with a plain TMP105
via local TYPE_TMP75 and TYPE_LM75 aliases (the latter mislabelling the
LM75B parts as LM75).

Now that hw/sensor/tmp105.h provides proper TMP75 and LM75B models, drop
the local aliases (and their guards) and instantiate the accurate
devices.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_fuji.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_fuji.c b/hw/arm/aspeed_ast2600_fuji.c
index 6dc3535f0c..fe0c294e14 100644
--- a/hw/arm/aspeed_ast2600_fuji.c
+++ b/hw/arm/aspeed_ast2600_fuji.c
@@ -15,14 +15,6 @@
 #include "hw/sensor/tmp105.h"
 #include "hw/nvram/eeprom_at24c.h"
 
-/*
- * Guard the aliases against the TYPE_TMP75 that hw/sensor/tmp105.h now defines;
- * TYPE_LM75 is guarded too for consistency (no LM75 model exists yet).
- */
-#undef TYPE_LM75
-#define TYPE_LM75 TYPE_TMP105
-#undef TYPE_TMP75
-#define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP422 "tmp422"
 
 /* Fuji hardware value */
@@ -63,8 +55,8 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
         get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
     }
 
-    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
-    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
+    i2c_slave_create_simple(i2c[17], TYPE_LM75B, 0x4c);
+    i2c_slave_create_simple(i2c[17], TYPE_LM75B, 0x4d);
 
     /*
      * EEPROM 24c64 size is 64Kbits or 8 Kbytes
@@ -74,15 +66,15 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(i2c[20], 0x50, 256);
     at24c_eeprom_init(i2c[22], 0x52, 256);
 
-    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
-    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
-    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
+    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x48);
+    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x49);
+    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
     at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
-    i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
+    i2c_slave_create_simple(i2c[8], TYPE_LM75B, 0x4a);
 
-    i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
+    i2c_slave_create_simple(i2c[50], TYPE_LM75B, 0x4c);
     at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);

-- 
2.50.1


