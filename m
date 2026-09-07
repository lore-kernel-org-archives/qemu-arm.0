Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A20C79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cR3-0007Jw-MV; Mon, 07 Sep 2026 12:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cR2-0007J5-Be
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:43:08 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cR0-0002oK-Mj
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:43:08 -0400
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso31085615e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799385; x=1789404185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6rZV+0Rq4PmlZn+kvmoVgaQLW2OyVLJsEpdjV2a5OvI=;
 b=AoE7BVrqwEpwxPfeYpwATvmuT1gngh8Fl+ARrtitVaC3w0wMxTs8Hol1k2j0EJzyNw
 nQu/a4vfqY1aU+wXDLILTxr9qWXe+i7qw8+U8/9iKbAZntsPATYBbIH21/SCOAUst3Cv
 YPR+aNXG8E7FHs5TVLbDaSsC3ydVmc5BqNxp64PHx7SKwrCaY1qGH16J0P58CeYY5vga
 aWCK8acveoCGEZujTmFfAI2bQhtTK9Pa5c4PdQOGJaxOC3b5n9dW6cj1E4uPh8VZKum9
 een3aaxrbNGYFbqNYjKCQlIjFwYveuxGxx59VgpyR7H2ft740EI33/3/h88o+6ZEDBU8
 ByWA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFFdv/z9S7e45xURFoF31WwJR1xo3kyeF1wmgSDW7BfwpEmoePeSSzb6076TVITHbsy8K9XDYbFw==@nongnu.org
X-Gm-Message-State: AFuF++lJ4cMkFJqTH/oaogg21g0zm5YEFVv89AntHnoJc1HIbY/0B3cK
 fd5BHkV/PwVegGJlgFz/0j/C1SyEweog3Ydk4a7PMFkRSM4k5580YYgD
X-Gm-Gg: AYBFou0f+0G/5loe99hdLHgGlruuY3Q6X49a8IQb3kxbsglwJSfNns1FvSSNUmzNHgq
 N8ilZzRq7gAUyqSk2h9rMjulBGW1rng8A/IrTg2QxnWZe/nC3VQ5nSS1IRTMZKShi8MozVV8UJ/
 yb7CeANk/CylYvK5Rd3TPfhtmilxTZh33gUhXdsBBsOACuL90Sv2VEYZ1uqC17bBBXbcWmVdGkd
 K3631vAr8HdmSwrDavHYw4MrlRh9mWBRaJZcMh0hjWdPbbBgvd4CnE+uwLX2qevXk1K2W1c/Jz9
 wafUIbh/tkwYGzmC1/PGSj2mIyyL90Zo7l4xnoS2xL+VDo8YscjnCQAtGPM2tKFFDTLYBCVEo9K
 FEE7dyAAOnjuBOEC0r1lr8N63EajZoOJG4vxG7X9oLm/vg/lyjKyJhPICGo530LZcOrJ444TVoD
 HRW9sMFyiHrAtPs+QvNbDrWi1PBICZLvRWV/Q9k8oCW68Cyza/2bm5x28XjF1xRZii/8CKxEbA6
 5Yv0NGNs3vZs9Y13kQAYBTtpwSB/bBhCSQ=
X-Received: by 2002:a05:600c:1d0d:b0:49d:99c:3bd9 with SMTP id
 5b1f17b1804b1-49d099c3fc9mr105824635e9.33.1788799384968; 
 Mon, 07 Sep 2026 09:43:04 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46696e8sm291092065e9.0.2026.09.07.09.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:43:04 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:41:53 +0200
Subject: [PATCH 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-3-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799319; l=1273;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=A/n8ct+D5Xu+mMgfHstzXeaf3QPL+KzcwDlNWjocwiE=;
 b=cqM5K1I8x8srHtJZ7eQ24cJrKOwHfhjzCBExf6iCiP2xEGdxhprPiDhShDDYyx3oDp/VNGd/U
 B4JJR/ufbTqBFIsfEEdq9W8VAmtwiYqQRpn0eDgPFMyknNP6tP8k0oi
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f50.google.com
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
index 599ef1701f..1dbbef11f2 100644
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


