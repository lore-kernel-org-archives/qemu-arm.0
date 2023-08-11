Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1145016ejc;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRff3R1VZULZDv8CW9A6KpQElXIic/WcbUHsyA38O5+qyNJpmFBSH9Uo2H+D1gAweyg642
X-Received: by 2002:ac8:5982:0:b0:40f:e15e:8f7f with SMTP id e2-20020ac85982000000b0040fe15e8f7fmr1105052qte.53.1691733024652;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691733024; cv=none;
        d=google.com; s=arc-20160816;
        b=LxhKH3VDGa2afjA51l3nGy24EQpPOP1bYfMrxR3tBHp5a5Y5dEavpeYj6x9UA1OtNN
         6+l58NwlhgyB2ul55gIjLpijHJgxmzile+w9LqIf74TqauqJD44hxAwc774fdkwEuPte
         LnY+6a2t4baDth1TU5LeUDx4tU2M95GLnzB591mBx63zQ0KC7HApGOlMrz33ibQu4V3z
         bEa/k8R+NXjbMAR6bmXQGEf/NdN1cv3X51MHivmSXMZ/xQQXGOeusLpP7/4vASIGH3I5
         Y6ZcgQDAm0hcxjSHnq8dMr8MxxApDTdrbLOgLQHeIcKcewa6wxftA//uQbWA5cFExHcd
         aNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=eEbL67N1i8Hpd4b9GcGlOe6ULkfz+XOm4Aiz1R2WjLY=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=sK/oOYGwjtJULj2vkaYOh2jXmbRI9CIEdmNEZCg6mqj7N/cfMRL/HgRpUHMCX0T5nE
         0J5DZTFEbGJOPmSrLjHIwpABnlY7wK55cCLXlydtnJRfj7UlUhJOZcfrVlmkBRs3FLxQ
         MvfucPOg8IM8rxFvDRNyOLqzWzH3Wrh5yR6uYQu0CFFGDRkkL0pVAnYe3JtYkg5PUYSp
         d6x4bvyUBcFQWB0yVs5cNdimlX575Olm1NrNk3cD4UDExn0H0ljJlrEHeMZfviorVPNz
         HsB1TAkH+JMBXhMj7CkCE3yT75EdXY04GFBdPn9i9YtjtdEDxMp6TjVn7X26vnySZQfg
         SH5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020ac87d42000000b0040fe1ce310dsi1928579qtb.736.2023.08.10.22.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qUL1m-0007w7-0X; Fri, 11 Aug 2023 01:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvZ-0006LH-3G; Fri, 11 Aug 2023 01:43:13 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvV-0000JV-Gg; Fri, 11 Aug 2023 01:43:12 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id 2E95738B155; Fri, 11 Aug 2023 13:43:03 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2 3/4] hw/i2c/aspeed: Fix TXBUF transmission start position
 error
Date: Fri, 11 Aug 2023 13:42:18 +0800
Message-Id: <20230811054220.99562-3-francis_yuu@stu.pku.edu.cn>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230811054220.99562-1-francis_yuu@stu.pku.edu.cn>
References: <20230811054220.99562-1-francis_yuu@stu.pku.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2401:b180:8000:2:9109:19ec:a055:9652 (failed)
Received-SPF: none client-ip=2401:b180:8000:2:9109:19ec:a055:9652;
 envelope-from=francisyuu@B-L8MBMD6R-2342.local; helo=B-L8MBMD6R-2342.local
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 11 Aug 2023 01:49:27 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ccHOifMK5t+g

According to the ast2600 datasheet and the linux aspeed i2c driver,
the TXBUF transmission start position should be TXBUF[0] instead
of TXBUF[1],so the arg pool_start is useless,and the address is not
included in TXBUF.So even if Tx Count equals zero,there is at least
1 byte data needs to be transmitted,and M_TX_CMD should not be cleared
at this condition.The driver url is:
https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/i2c/busses/i2c-ast2600.c

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
---
 hw/i2c/aspeed_i2c.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index e485d8bfb8..44905d7899 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -226,7 +226,7 @@ static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
     return 0;
 }
 
-static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
+static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     int ret = -1;
@@ -239,7 +239,7 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
                                                 TX_COUNT) + 1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
-        for (i = pool_start; i < pool_tx_count; i++) {
+        for (i = 0; i < pool_tx_count; i++) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
             trace_aspeed_i2c_bus_send("BUF", i + 1, pool_tx_count,
@@ -273,7 +273,7 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
         }
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, TX_DMA_EN, 0);
     } else {
-        trace_aspeed_i2c_bus_send("BYTE", pool_start, 1,
+        trace_aspeed_i2c_bus_send("BYTE", 0, 1,
                                   bus->regs[reg_byte_buf]);
         ret = i2c_send(bus->bus, bus->regs[reg_byte_buf]);
     }
@@ -446,10 +446,8 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
  */
 static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 {
-    uint8_t pool_start = 0;
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
-    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
 
     if (!aspeed_i2c_check_sram(bus)) {
@@ -483,27 +481,11 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_START_CMD, 0);
 
-        /*
-         * The START command is also a TX command, as the slave
-         * address is sent on the bus. Drop the TX flag if nothing
-         * else needs to be sent in this sequence.
-         */
-        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
-            if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT)
-                == 0) {
-                SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
-            } else {
-                /*
-                 * Increase the start index in the TX pool buffer to
-                 * skip the address byte.
-                 */
-                pool_start++;
-            }
-        } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
             if (bus->regs[reg_dma_len] == 0) {
                 SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
             }
-        } else {
+        } else if (!SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
             SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
         }
 
@@ -520,7 +502,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_TX_CMD)) {
         aspeed_i2c_set_state(bus, I2CD_MTXD);
-        if (aspeed_i2c_bus_send(bus, pool_start)) {
+        if (aspeed_i2c_bus_send(bus)) {
             SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_NAK, 1);
             i2c_end_transfer(bus->bus);
         } else {
-- 
2.39.2 (Apple Git-143)

