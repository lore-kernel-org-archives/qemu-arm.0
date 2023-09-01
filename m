Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496009ejc;
        Fri, 1 Sep 2023 02:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNN1UlOI24zvtgCzUXE2pVGt3qXjgjgzSnx8x8SGUldpGBmLo6sFerKLHp7I+s3kM/ouw+
X-Received: by 2002:a05:620a:b48:b0:76e:f804:1532 with SMTP id x8-20020a05620a0b4800b0076ef8041532mr1525285qkg.33.1693561422554;
        Fri, 01 Sep 2023 02:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561422; cv=none;
        d=google.com; s=arc-20160816;
        b=UA8cy1aNwzmY5zV1QI0ao3K3gHPu8qCpmqSY1wZ7iED5qrezvn9nCs2tX0ItMzbh8e
         cFQQC+Zn1E2Njo0a9wKLLjT/YzYdGQg2l+KNR1d8O1ANTCgIPMB6lx0bl+9CsLHmhVVk
         xMUsL8D4cPgcls/7JrMWg5rn6oyKPaBnjb0SrmWrDZxxZb1hCrVzZ51hbQQZHBsacSUz
         qcdx/wZuqKVjbfrDZ0yw1naS5IsTqmH1snnBcAQu0cRhrHH6/nCIjN5/3z+f4d9GifZe
         XTNc+zv0ZdVHXK2NK+Ne5wKze+gMH4fOuKgfW5Tn5JSKYOkhbODYC1NO2Y6Q/c1rq/df
         7+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=WYPBKcUpHAr7k8MYTcgZwiCHD2cqy0Y0+J/LpecJ0T0=;
        fh=1Jxhf+9Nb+8r7Uf3Z24eyiFG706BexBUOuvmFi7HxA0=;
        b=PRfxzWj96m1mROA8FFNR6brHajWDJEA6zJpXTs+c0iHBMpIHXbZh1XefgVwuYDssDC
         lsncj6hr8w5qw5FSleVeN2O/XKJxZXFoHOSVT7Vs8+QY08oVbD1OGV6PzgfHJrqPOJuu
         jpwFdg293VLDn+8lt9/qkoJbUJZldfvyYxmBtJPaYMr1GbfXX1e0IdbHZAhOWV3k5hBQ
         1OMVqUAAFRFvxnlUwIGZkp7dYQsVvZ8FkZYMr0XgUDO1Wtgo6yyK43um7rKtCI3bB15U
         7lr7KVOhuCY87wlnL2NgMugukKhjz2IJCXan39TO+5sCjYtHH5j38XUHyZvo+pS/N97L
         pUyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a0cf1c1000000b006261c14ff15si2027718qvl.251.2023.09.01.02.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0fk-0001Mo-6O; Fri, 01 Sep 2023 05:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fj-0001MO-28; Fri, 01 Sep 2023 05:42:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fd-0002qm-Lg; Fri, 01 Sep 2023 05:42:33 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3Q1tsTz4wy9;
 Fri,  1 Sep 2023 19:42:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3N11cVz4wxW;
 Fri,  1 Sep 2023 19:42:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/26] hw/i2c/aspeed: Fix Tx count and Rx size error in buffer
 pool mode
Date: Fri,  1 Sep 2023 11:41:50 +0200
Message-ID: <20230901094214.296918-3-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1tejf6Lm9gov

From: Hang Yu <francis_yuu@stu.pku.edu.cn>

Fixed inconsistency between the regisiter bit field definition header file
and the ast2600 datasheet. The reg name is I2CD1C:Pool Buffer Control
Register in old register mode and  I2CC0C: Master/Slave Pool Buffer Control
Register in new register mode. They share bit field
[12:8]:Transmit Data Byte Count and bit field
[29:24]:Actual Received Pool Buffer Size according to the datasheet.
According to the ast2600 datasheet,the actual Tx count is
Transmit Data Byte Count plus 1, and the max Rx size is
Receive Pool Buffer Size plus 1, both in Pool Buffer Control Register.
The version before forgot to plus 1, and mistake Rx count for Rx size.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
Fixes: 3be3d6ccf2ad ("aspeed: i2c: Migrate to registerfields API")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 4 ++--
 hw/i2c/aspeed_i2c.c         | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 51c944efeaae..2e1e15aaf0f7 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -139,9 +139,9 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
     SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
-    SHARED_FIELD(RX_COUNT, 24, 5)
+    SHARED_FIELD(RX_COUNT, 24, 6)
     SHARED_FIELD(RX_SIZE, 16, 5)
-    SHARED_FIELD(TX_COUNT, 9, 5)
+    SHARED_FIELD(TX_COUNT, 8, 5)
     FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
 REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
     SHARED_FIELD(RX_BUF, 8, 8)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 1f071a3811f7..e485d8bfb836 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -236,7 +236,7 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     int pool_tx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
-                                                TX_COUNT);
+                                                TX_COUNT) + 1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
         for (i = pool_start; i < pool_tx_count; i++) {
@@ -293,7 +293,7 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
     int pool_rx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
-                                                RX_COUNT);
+                                                RX_SIZE) + 1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
@@ -418,7 +418,7 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
-        count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT);
+        count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT) + 1;
     } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
         count = bus->regs[reg_dma_len];
     } else { /* BYTE mode */
@@ -490,7 +490,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
          */
         if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
             if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT)
-                == 1) {
+                == 0) {
                 SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
             } else {
                 /*
-- 
2.41.0

