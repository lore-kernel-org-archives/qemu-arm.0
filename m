Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A70CC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1xG-0000jY-Op; Tue, 07 Jul 2026 05:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1xF-0000hG-Ez
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:19:01 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1xD-0004CT-OJ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:19:01 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 471472003CC;
 Tue,  7 Jul 2026 11:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415938;
 bh=fkjGzf37tNgyGQ3AwXjGErnZFpoQCULgobRbRXQib3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bfiDSjTC1RUoziuXbWlGXCIjbb9piktQU5in79LsRNBCTQOA5e5Ca3svsHYu2yhIs
 1eYbqEtc8T7Cfle7sq4eg1Ssxn6Of8S8UtUmL3RhtTjGXBSbUIiIDERrzBKm2hHQG/
 MC9eG+ZxKHUzs56DhJFRSu1XX0+1CKpQVTlUx41NYqhIJbW0KJ0bmKned9rF5IxhRi
 jOu7OkmecFz6xIMXNJrNIaAArDgdyAYpziWL131rORFipN630FerOHTRE3w1mne9hu
 LGV2eUYUksKuojxlACOh3I6CNA2vziSfrHTNdeVNB7fVhx7khgOabaQdly12j1wYx0
 2ibi3czns1dvg==
From: Emmanuel Blot <emmanuel.blot@free.fr>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>,
 Emmanuel Blot <eblot@meta.com>, qemu-arm@nongnu.org
Subject: [PATCH v6 7/9] hw/arm/aspeed: anacapa: use ASCII in comments
Date: Tue,  7 Jul 2026 11:16:00 +0200
Message-ID: <20260707091609.97759-8-emmanuel.blot@free.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707091609.97759-1-emmanuel.blot@free.fr>
References: <20260707091609.97759-1-emmanuel.blot@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.27.42.2; envelope-from=emmanuel.blot@free.fr;
 helo=smtp2-g21.free.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The anacapa machine source contains a few comments using the U+2014 EM
DASH character. Replace them with plain ASCII hyphens so the file stays
ASCII-only.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_anacapa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
index a1c8111a93..bd6cc00686 100644
--- a/hw/arm/aspeed_ast2600_anacapa.c
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -242,7 +242,7 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     /* &i2c1 */
     /* eeprom@50 */
     at24c_eeprom_init(i2c[1], 0x50, 256 * KiB);
-    /* i2c-mux@70 (PCA9546) — 4 channels, empty */
+    /* i2c-mux@70 (PCA9546) - 4 channels, empty */
     i2c_slave_create_simple(i2c[1], TYPE_PCA9546, 0x70);
 
     /* &i2c4 */
@@ -259,7 +259,7 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_mux = i2c_slave_create_simple(i2c[8], TYPE_PCA9546, 0x72);
 
     /* i2c8mux ch0 */
-    /* adc128d818@1f — no model */
+    /* adc128d818@1f - no model */
     /* pca9555@22 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0),
                             TYPE_PCA9552, 0x22);
@@ -305,7 +305,7 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     /* i2c-mux@71 (PCA9548) */
     i2c_mux = i2c_slave_create_simple(i2c[11], TYPE_PCA9548, 0x71);
 
-    /* i2c11mux ch0-ch4 — empty */
+    /* i2c11mux ch0-ch4 - empty */
 
     /* i2c11mux ch5 */
     /* pca9555@22 */
@@ -328,7 +328,7 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
                           hpm_brd_id_eeprom, hpm_brd_id_eeprom_len);
 
     /* i2c13mux ch7 */
-    /* nfc@28 — no model */
+    /* nfc@28 - no model */
 }
 
 static void aspeed_machine_anacapa_class_init(ObjectClass *oc,
-- 
2.50.1


