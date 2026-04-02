Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48DBCC6B00
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 07:50:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Coa-0005nF-OG; Thu, 02 Apr 2026 03:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaoguohan@kylinos.cn>)
 id 1w8CoX-0005iH-4u
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 03:50:06 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaoguohan@kylinos.cn>)
 id 1w8CoT-0003az-7z
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 03:50:04 -0400
X-UUID: 876d7cb42e6811f1aa26b74ffac11d73-20260402
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:751ab53f-2c39-4998-a732-d3c758ec6373, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:573c2ac8e551c8607c353ed60dee9357,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
 DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 876d7cb42e6811f1aa26b74ffac11d73-20260402
X-User: zhaoguohan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1984774881; Thu, 02 Apr 2026 15:49:50 +0800
From: zhaoguohan@kylinos.cn
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [PATCH] hw/arm/stm32f405: fix I2S2ext MMIO base
Date: Thu,  2 Apr 2026 15:49:47 +0800
Message-ID: <20260402074947.182306-1-zhaoguohan@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=zhaoguohan@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1, RCVD_IN_VALIDITY_RPBL_BLOCKED=1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

From: GuoHan Zhao <zhaoguohan@kylinos.cn>

stm32f405_soc_realize() maps the I2S2ext unimplemented stub at
0x40003000, which overlaps with the IWDG region.

The surrounding APB1 address layout leaves 0x40003400 as the next
available slot before I2S3ext at 0x40004000. Map I2S2ext there so the
stub matches the documented peripheral layout.

Fixes: 529fc5fd3e18 ("hw/arm: Add the STM32F4xx SoC")
Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 hw/arm/stm32f405_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index c2bc460603f9..556ddd054f3c 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -262,7 +262,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("RTC and BKP", 0x40002800, 0x400);
     create_unimplemented_device("WWDG",        0x40002C00, 0x400);
     create_unimplemented_device("IWDG",        0x40003000, 0x400);
-    create_unimplemented_device("I2S2ext",     0x40003000, 0x400);
+    create_unimplemented_device("I2S2ext",     0x40003400, 0x400);
     create_unimplemented_device("I2S3ext",     0x40004000, 0x400);
     create_unimplemented_device("I2C1",        0x40005400, 0x400);
     create_unimplemented_device("I2C2",        0x40005800, 0x400);
-- 
2.43.0

