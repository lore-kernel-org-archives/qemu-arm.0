Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D956CCC6B1F
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 08:01:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Czq-0004kQ-Td; Thu, 02 Apr 2026 04:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaoguohan@kylinos.cn>)
 id 1w8Czo-0004gw-8e
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 04:01:44 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaoguohan@kylinos.cn>)
 id 1w8Czh-000618-RV
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 04:01:43 -0400
X-UUID: 24229a022e6a11f1aa26b74ffac11d73-20260402
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:91a79fe7-b02a-43ac-8fa2-3daed465f732, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:9fb5c0a21845d8eb6f8844dec799edf2,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
 DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 24229a022e6a11f1aa26b74ffac11d73-20260402
X-User: zhaoguohan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 720498789; Thu, 02 Apr 2026 16:01:23 +0800
From: zhaoguohan@kylinos.cn
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-arm@nongnu.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [PATCH] hw/arm/stm32l4x5: fix stale peripheral comments
Date: Thu,  2 Apr 2026 16:01:19 +0800
Message-ID: <20260402080119.200785-1-zhaoguohan@kylinos.cn>
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

stm32l4x5_soc.c still has a couple of stale comments left behind by
copy-and-paste updates.

The EXTI wakeup table labels IRQ 53 as UART4 even though it is the
UART5 wakeup line, and the reserved APB1 gap after IWDG is still
annotated as 0x40001800 instead of 0x40003400.

Update the comments to match the current STM32L4x5 layout. No
functional change.

Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 hw/arm/stm32l4x5_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 39b8cdf97dca..9c3cecf2c928 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -70,7 +70,7 @@ static const int exti_irq[NUM_EXTI_IRQ] = {
     38,                     /* USART2 wakeup, Direct   */
     39,                     /* USART3 wakeup, Direct   */
     52,                     /* UART4 wakeup, Direct    */
-    53,                     /* UART4 wakeup, Direct    */
+    53,                     /* UART5 wakeup, Direct    */
     70,                     /* LPUART1 wakeup, Direct  */
     65,                     /* LPTIM1, Direct          */
     66,                     /* LPTIM2, Direct          */
@@ -369,7 +369,7 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("RTC",       0x40002800, 0x400);
     create_unimplemented_device("WWDG",      0x40002C00, 0x400);
     create_unimplemented_device("IWDG",      0x40003000, 0x400);
-    /* RESERVED:    0x40001800, 0x400 */
+    /* RESERVED:    0x40003400, 0x400 */
     create_unimplemented_device("SPI2",      0x40003800, 0x400);
     create_unimplemented_device("SPI3",      0x40003C00, 0x400);
     /* RESERVED:    0x40004000, 0x400 */
-- 
2.43.0


