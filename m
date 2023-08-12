Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1842488ejc;
        Fri, 11 Aug 2023 23:55:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCBvUc4hSnBC3c2Qb8BJJ46v2OWTFqUTQ2Bo2CZQwXiLC3iPjZT+exHmr48p3/+A3CAhkc
X-Received: by 2002:ac8:7f44:0:b0:40f:f639:4265 with SMTP id g4-20020ac87f44000000b0040ff6394265mr5833635qtk.37.1691823301892;
        Fri, 11 Aug 2023 23:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691823301; cv=none;
        d=google.com; s=arc-20160816;
        b=qsiWdbYSeTrgyvF82V8JbFZB8IQRNRxAzAjJ7+KgnW2tMUy5zQqtRHiuqWtMLR4uH3
         yKEhu8446IRYwhRkWWJ/ZJmn2BjrG3Na/zAQcCiekdDSl1WfwjrWcLQ7jNO52iSjOrcc
         GARMOdxp9Gvcrjsl9r12ZueITyIGb7cTC1NJbTZHABC6vyiYR2+UIUtVNdMDuJGJinV/
         XXHT11Y4xAE+ZvOudRJPU4n7Zw57tU9DoG3Jq/mHMGqJIz7le5yr2gBlP9rOTFAG9tLe
         BVlthOaNcQKSoTP2naRwG8uDpSoIjiu39815l0suPXDMpBK6h0NW4EnLRtes+E+m0qqG
         WYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=dK2VU0U8BVElgc7wjGzHA4ShoiSQaB7MsFS4dZaPxz0=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=hTnjFgmEmWjna3BFiSvGxwBm0BD0HiCindkSYVZurSKRlQZnQtrFpeqZCSNbMOLnNz
         U4OnNPg0XExyqb5/wh9wOmr/HfApnFAIiFlPhmKgPKo78aKEgQUd29a1Ebz7LXaDgo0Q
         MJyHrSmxD8/hkOLPjhOYFVKPLofCDoxo6WmhFsjC2s/WXhQ5tTrEdG4o9IGmLkGe7U4s
         LpAEN+IF//s8qjHfk2Q8nyqVqIsUrW5qm9a+bfPGN+JabqeHce/B8j7xTi5q9TDkOoyW
         tryu+7qO6/yMxJEzj56wf5V/3aBOxsCY6poLBp9W3q+MaznTxS+NvJcAAWmgezKibuuv
         Vmnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ac85a83000000b0040f17f1054bsi3265358qtc.750.2023.08.11.23.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 23:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUiVO-0004u3-8M; Sat, 12 Aug 2023 02:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUiVK-0004s4-S4; Sat, 12 Aug 2023 02:53:42 -0400
Received: from [106.11.34.246] (helo=B-L8MBMD6R-2342.local)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUiVF-0006cq-Mk; Sat, 12 Aug 2023 02:53:42 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id 056F13992E8; Sat, 12 Aug 2023 14:53:20 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v3 1/3] hw/i2c/aspeed: Fix Tx count and Rx size error in
 buffer pool mode
Date: Sat, 12 Aug 2023 14:52:28 +0800
Message-Id: <20230812065230.8839-2-francis_yuu@stu.pku.edu.cn>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230812065230.8839-1-francis_yuu@stu.pku.edu.cn>
References: <20230812065230.8839-1-francis_yuu@stu.pku.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.11.34.246 (failed)
Received-SPF: none client-ip=106.11.34.246;
 envelope-from=francisyuu@B-L8MBMD6R-2342.local; helo=B-L8MBMD6R-2342.local
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: nOVFliiYq9Ph

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
---
v2-->v3:
1. Merged patch1 and patch2 in v2
2. added fixes tag
3. Fixed typos

 hw/i2c/aspeed_i2c.c         | 8 ++++----
 include/hw/i2c/aspeed_i2c.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 1f071a3811..e485d8bfb8 100644
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
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 51c944efea..2e1e15aaf0 100644
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
-- 
2.39.2 (Apple Git-143)

