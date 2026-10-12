Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F0CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHRE-00083Y-98; Mon, 12 Oct 2026 10:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHR6-0007yN-Fh
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:55:34 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHR3-0005Id-Ox
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:55:32 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso21276485e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816927; x=1792421727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ImldGJ+S970Bf5OYd6GaXlG8v143fN7qBqQiDylCmP4=;
 b=bppneVmdtLsRvfiGjdNy/F16P08+mATggKSv+uBXw/BH783MahZlfWLO/3gl3nBkzV
 VYDig/r+Jo6m+Ej7LrCMCkdBx0QTO+HNT1nELFFxU0ro4oWatg+D96Q+N4BWMIJ56wUK
 z1ekH48XZ0s259szQidmWgFctzoEiSJ84sE4RCT4Aq5OBVbmNFSTSLV2Etc9mQMvdMAI
 ZYh0gLs2u5yhY/hbMx2i9gk7MSvj0IHS4ScrDyQKiyfLLhf7EGJ2KTR2dM6gFV6iMpw1
 f/ruciQ9Z6WnIHk7r1rbmqDQTJAM2tdI3xO2AeqtTC5M3nv/f7uA6rvONWBNIDoUEu1X
 qXVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByHya1422+mz/zLjlplRMAj919C5g2anaRfmB7jcHo0+IuZj3gfrF4y6K2TO2KvDwTKacja6hjkRg==@nongnu.org
X-Gm-Message-State: AFq9FYKVyD7bjU4YsMd1lC1cz0jcBnixiJjuULmh9k5qLJHgNa05zTSA
 tzhXY/+g23fSCBH4Je2VnUEIjs/Et5BEU2uwK/BIjpOeE9jFvVX5PP+o
X-Gm-Gg: AYBFou18zxoot4fYPi1hA75i/RL5wd1DL7w78IuNnUNH1byMeblvlg/7HIRE5yWDZCI
 dz7ug02lZTIU8Gx+xdiOf21IsWmEaHIcJerdZeA3XYJATLE6GHPXqD2IU1JpymXNN1+emtELr8Z
 zwN4qU84bmSe5nEF2nNrAJSCxpq5TXwUeOAVyS1z5dw5/i6Ayn+IOi3rDIEvhtT6gcFtVMe7J3X
 xvuzEBrqUr7beYudxhUAoYs7Cc1F19mMLpCwzZvjLPAXNZHTsmN4jviC5vYdXKIcpO+64jRwPh0
 lKprDVyuw2p4CMPKyT3Bc4p9KbSavNv47NmHLMiKiT2UDVNMsjzSTsiiVayraq0TO/vNZwgIzDU
 FfUa+QWIjdughrmipHyX/8JuWX6wUlt4/Qo/DN216mezKBjtm2nxyJLxdPSUixGSyLdB2PLumbg
 o2UAh2nApFD0dCGhCIRAdvmfE15JRpeOJymzzXndwb5dzW8Q6Iho7ps6MXXD20s8d3gWt2pQdvc
 skjfiQlByW7ue8TZ44UxeOUq2H9DsD6Y5Z0B1v2sKlOTGUKDEvneR8j
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a18e4837f2mr176377965e9.5.1791816926905; 
 Mon, 12 Oct 2026 07:55:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm312212015e9.11.2026.10.12.07.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:55:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:56 +0200
Subject: [PATCH v2 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1273;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=d5avXaQSHf6bIfiDvZv67RY5xgd1U3dm0wZh/dvYVAk=;
 b=M4EuneDWmdSo+VtSiaypHuk5+OfyPHsRFymuYjEK1qqATk/7ayeW0LBEEEiBPYzFJmbzIduyd
 R3YCUJRus7NCKQNRfHveC+Klhxdd6mCFzXBTgwRcm6g7weRdqcb+h2e
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
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

The board only populates the flash device attached to the FMC
controller; the SoC SPI controllers are left unused. Advertising a
part there presents the guest with a flash device the hardware does
not have.

While here, add the missing year to the copyright line.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_sanmiguel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
index 345a9c9416..ac2aef740a 100644
--- a/hw/arm/aspeed_ast2600_sanmiguel.c
+++ b/hw/arm/aspeed_ast2600_sanmiguel.c
@@ -1,7 +1,7 @@
 /*
  * Facebook SanMiguel BMC
  *
- * Copyright (c) Meta Platforms, Inc. and affiliates.
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -384,7 +384,7 @@ static void aspeed_machine_sanmiguel_class_init(ObjectClass *oc,
     amc->hw_strap1 = SANMIGUEL_BMC_HW_STRAP1;
     amc->hw_strap2 = SANMIGUEL_BMC_HW_STRAP2;
     amc->fmc_model = "mx66l1g45g";
-    amc->spi_model = "mx66l1g45g";
+    amc->spi_model = NULL;
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC0_ON;
     amc->i2c_init  = sanmiguel_bmc_i2c_init;

-- 
2.50.1


