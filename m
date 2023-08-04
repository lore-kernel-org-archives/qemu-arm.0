Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1818927ejb;
        Fri, 4 Aug 2023 08:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy1uooj4yTSE5n5kWY2HBebGwjHdL8ExtqCnRkR1+fyxedp2LQpvKHLdpL6u5Ace/zvz2A
X-Received: by 2002:ad4:53ab:0:b0:637:a513:25ef with SMTP id j11-20020ad453ab000000b00637a51325efmr1892712qvv.36.1691162003631;
        Fri, 04 Aug 2023 08:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691162003; cv=none;
        d=google.com; s=arc-20160816;
        b=rBHRcCLidtnbhNGuz1FImqPuGfrUmc44xmUwCFeJVLf+WyYZG0mT9CyXxdENBg9Jcg
         5gz4EI2OFWwZT50iq3C8SJNZjiPQKrNKVs910dvXPuaGf1+sdFMTOIAsNP++f95yqNb5
         yLQFYcaKmIBeqzW4CfcU47VYcpdNEJyenVk1SIzAzWQ1wjPp+r5JDXZ02RoZf7jaYpHb
         83BsyWT3sNx80q4uTwjpATtr0zWGpVeuDrjeSClaa6Ui2Bj2bH3dTicyVkp22efI+eB3
         /lML48vk8hSW4AUfXrwx6yFWv+2k+XF/5U7Lz6dWBvSovghl5nv3BO/RT1aEyxEoTkVY
         Lwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=OTSofsSisbfAdh8rqbt6D92uYFpZj3oJDirCOZ2XpPs=;
        fh=vQFBeAw3Taj7+5cdNTf/uGiAuQJc1rzye/YBZsaU1GY=;
        b=i42ImxhPd1Qauq61JGgKMlXEeXsdqhDwvPBeJG6JQVz2Sof9HhC5gmNi6j7RxJ0BTu
         N0zuT5eg3Jy3YDJJ+6ET+n6/SjyIotu31USKCaUCc650BD8tUUU3EwUiTAz//VWAmvOj
         fuzZ62D385+d1IDhNZu57AvmPyinFPz/eaWrpxGZgf4mSFALmIX3aFhxyTMcpLwJIx19
         VKzT/ukKJxmi9yJG4Q/EFNkS7EhnQGRENs+cjND3mkkkZcWWOqSbLGSJ4Rw3d6rkSiO8
         AeZDnCCEfFQv4Q1wsdutzXlINPMn4GGanJ92wRxWjJc9KdsfUvdEcNdL9XF3K2M3/w49
         Eq2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a0caa51000000b0063d45c90703si1284222qvb.124.2023.08.04.08.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 08:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwUU-0006q6-6M; Fri, 04 Aug 2023 11:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qRpv4-00069U-Cu; Fri, 04 Aug 2023 04:12:22 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qRpv1-0002sm-0M; Fri, 04 Aug 2023 04:12:22 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id 452233446D1; Fri,  4 Aug 2023 16:12:13 +0800 (CST)
To: qemu-devel@nongnu.org
Cc: Hang Yu <1339236493@qq.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH] Aspeed: i2c: Fixed Tx and Rx error in BUFF Mode
Date: Fri,  4 Aug 2023 16:11:42 +0800
Message-Id: <20230804081142.52539-1-1339236493@qq.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2401:b180:8000:2:9109:19ec:a055:9652 (failed)
Received-SPF: none client-ip=2401:b180:8000:2:9109:19ec:a055:9652;
 envelope-from=francisyuu@B-L8MBMD6R-2342.local; helo=B-L8MBMD6R-2342.local
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Aug 2023 11:13:21 -0400
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
Reply-to:  Hang Yu <1339236493@qq.com>
From:  Hang Yu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hh1wxnMB9E/F

1. Fixed inconsistency between the bit field definition in register
I2CD_POOL_CTRL and the ast2600 datasheet
2. Fixed issue of confusing RXSIZE and RXCOUNT, as well as forgetting
to add one to TXCOUNT and RXSIZE in buff mode
3. Fixed issue with TXBUF transmission start position error in buff mode
4. Added support for the BUFFER ORGANIZATION option in reg I2CC_POOL_CTRL
After adding these changes, QEMU can support driver code:
https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15
/drivers/i2c/busses/i2c-ast2600.c

Signed-off-by: Hang Yu <1339236493@qq.com>
---
 hw/i2c/aspeed_i2c.c         | 21 ++++++---------------
 include/hw/i2c/aspeed_i2c.h |  5 +++--
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 1f071a3811..0e380d0bba 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -236,7 +236,7 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     int pool_tx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
-                                                TX_COUNT);
+                                                TX_COUNT)+1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
         for (i = pool_start; i < pool_tx_count; i++) {
@@ -293,10 +293,12 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
     int pool_rx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
-                                                RX_COUNT);
+                                                RX_SIZE)+1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
-        uint8_t *pool_base = aic->bus_pool_base(bus);
+        uint8_t *pool_base ;
+        if(ARRAY_FIELD_EX32(bus->regs,I2CC_POOL_CTRL,BUF_ORGANIZATION))pool_base=aic->bus_pool_base(bus)+16;
+        else pool_base= aic->bus_pool_base(bus);
 
         for (i = 0; i < pool_rx_count; i++) {
             pool_base[i] = i2c_recv(bus->bus);
@@ -418,7 +420,7 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
-        count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT);
+        count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT)+1;
     } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
         count = bus->regs[reg_dma_len];
     } else { /* BYTE mode */
@@ -449,7 +451,6 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
     uint8_t pool_start = 0;
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
-    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
 
     if (!aspeed_i2c_check_sram(bus)) {
@@ -489,16 +490,6 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
          * else needs to be sent in this sequence.
          */
         if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
-            if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT)
-                == 1) {
-                SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
-            } else {
-                /*
-                 * Increase the start index in the TX pool buffer to
-                 * skip the address byte.
-                 */
-                pool_start++;
-            }
         } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
             if (bus->regs[reg_dma_len] == 0) {
                 SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 51c944efea..88b144a599 100644
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
@@ -162,6 +162,7 @@ REG32(I2CC_MS_TXRX_BYTE_BUF, 0x08)
     /* 15:0  shared with I2CD_BYTE_BUF[15:0] */
 REG32(I2CC_POOL_CTRL, 0x0c)
     /* 31:0 shared with I2CD_POOL_CTRL[31:0] */
+    FIELD(I2CC_POOL_CTRL, BUF_ORGANIZATION, 0, 1) /* AST2600 */
 REG32(I2CM_INTR_CTRL, 0x10)
 REG32(I2CM_INTR_STS, 0x14)
     FIELD(I2CM_INTR_STS, PKT_STATE, 28, 4)
-- 
2.39.2 (Apple Git-143)

