Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358220njc;
        Wed, 7 Aug 2024 19:50:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNDUQ9R2MwfJwR8nPjMrjv9QYpw4gag/a2AunBbKV0oxtPT5CDdDtR95pq+DiV02L3bP1zWGiwAUDzlud77dRPDBwUyl6f
X-Google-Smtp-Source: AGHT+IHyZC9MP2+Mu6+Cops20Ek7Tz666nWxK5sNkovRRjuTuYUw0oVdL+u7J2o+TyKUQsXA0gXc
X-Received: by 2002:a05:6102:d88:b0:493:d325:4d71 with SMTP id ada2fe7eead31-495c5b1abd4mr756781137.9.1723085452003;
        Wed, 07 Aug 2024 19:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085451; cv=none;
        d=google.com; s=arc-20160816;
        b=mxA1V45RvT5LsgFgwX0Ut87lQk4YH7S9gF+N9jBC1MehRkUcgOxs0D/jMFZGvqOpve
         1PQtH8bUjoy/i+bCm5TzM/Q4V/zJLzSuNXXXg/Felmzn80WLHD3ARDaFrmnS0u+pCE1B
         +lvP6FRVD6fNjX6jCZDrkAN/He1323sNHc/wHXr6YGe5bfXyCR8H7YrSG0Rluel9T1Td
         EMzQAfxzbklYVXaY88xDk5UfXGwvdHB/scZy4GP9AGj4pZMz29KUdHXNU0QKdSRqeIYY
         WqT6pzOo2V+Mrdw8MB+ll4V/8IBDSVnGRqHt/8kfgdxiTXTlmfmEAhis9J1zr6rZ3gTx
         mTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=aobM1nmIOTcfrp1wfRjN63bLBSGm5qDFzg2vFmVK/TI=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=YC6mvwIfKKTTIWxSsdajGcvQ/lAPz/r+66eGzrNssYk5x8sCi613RRMyKB/3Ffjcfj
         wRINrSlKOfl+Q0oSA9jlh3bUgB5w5eIDy08ileabRL2ePVRL5ctp0y6VwzWlp2WH5/u/
         J8EuiVSx9zZ4T7+nyADaMuZVAnx1WE1YCtzsR2P5fJoFAlxNWUgcfPoctm7c+S8ClnQs
         EnRaANm02dP0luXj4bDk2cysstNCXbPVnoAJppNA1TzhqJSAzRPBRebzR+VB+mm0yHem
         tBoUCDlK6Zcz9a5A1m+diDmxdAj3ueWS4oQyoNBFv1aZXpEmZERQrQxg+NggQZEMOUhk
         LeCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8ed3efsi34203766d6.330.2024.08.07.19.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDi-0007P0-2X; Wed, 07 Aug 2024 22:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDf-0007G1-Vl; Wed, 07 Aug 2024 22:49:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDe-0008AE-6y; Wed, 07 Aug 2024 22:49:39 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:17 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 04/11] hw/i2c/aspeed: introduce a new dma_dram_offset
 attribute in AspeedI2Cbus
Date: Thu, 8 Aug 2024 10:49:09 +0800
Message-ID: <20240808024916.1262715-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TRQCfI3eVxXk

The "Current DMA Operating Address Status(0x50)" register of
I2C new mode has been removed in AST2700.
This register is used for debugging and it is a read only register.

To support AST2700 DMA mode, introduce a new
dma_dram_offset class attribute in AspeedI2Cbus to save the
current DMA operating address.

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

Set the dma_dram_offset data type to uint64_t for
64 bits dram address DMA support.

Both "DMA Mode Buffer Address Register(I2CD24 old mode)" and
"DMA Operating Address Status (I2CC50 new mode)" are used for showing the
low part dram offset bits [31:0], so change to read/write both register bits [31:0] in
bus register read/write functions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 51 +++++++++++++++++++++++--------------
 include/hw/i2c/aspeed_i2c.h |  9 +------
 2 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index abcb1d5330..2dea3a42a0 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -114,7 +114,10 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             value = -1;
+            break;
         }
+
+        value = extract64(bus->dma_dram_offset, 0, 32);
         break;
     case A_I2CD_DMA_LEN:
         if (!aic->has_dma) {
@@ -150,9 +153,7 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CM_DMA_TX_ADDR:
     case A_I2CM_DMA_RX_ADDR:
     case A_I2CM_DMA_LEN_STS:
-    case A_I2CC_DMA_ADDR:
     case A_I2CC_DMA_LEN:
-
     case A_I2CS_DEV_ADDR:
     case A_I2CS_DMA_RX_ADDR:
     case A_I2CS_DMA_LEN:
@@ -161,6 +162,9 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CS_DMA_LEN_STS:
         /* Value is already set, don't do anything. */
         break;
+    case A_I2CC_DMA_ADDR:
+        value = extract64(bus->dma_dram_offset, 0, 32);
+        break;
     case A_I2CS_INTR_STS:
         break;
     case A_I2CM_CMD:
@@ -210,18 +214,18 @@ static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
 {
     MemTxResult result;
     AspeedI2CState *s = bus->controller;
-    uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
 
-    result = address_space_read(&s->dram_as, bus->regs[reg_dma_addr],
+    result = address_space_read(&s->dram_as, bus->dma_dram_offset,
                                 MEMTXATTRS_UNSPECIFIED, data, 1);
     if (result != MEMTX_OK) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%08x\n",
-                      __func__, bus->regs[reg_dma_addr]);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: DRAM read failed @%" PRIx64 "\n",
+                      __func__, bus->dma_dram_offset);
         return -1;
     }
 
-    bus->regs[reg_dma_addr]++;
+    bus->dma_dram_offset++;
     bus->regs[reg_dma_len]--;
     return 0;
 }
@@ -291,7 +295,6 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
-    uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
     int pool_rx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
                                                 RX_SIZE) + 1;
 
@@ -323,14 +326,17 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
             data = i2c_recv(bus->bus);
             trace_aspeed_i2c_bus_recv("DMA", bus->regs[reg_dma_len],
                                       bus->regs[reg_dma_len], data);
-            result = address_space_write(&s->dram_as, bus->regs[reg_dma_addr],
+
+            result = address_space_write(&s->dram_as, bus->dma_dram_offset,
                                          MEMTXATTRS_UNSPECIFIED, &data, 1);
             if (result != MEMTX_OK) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%08x\n",
-                              __func__, bus->regs[reg_dma_addr]);
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: DRAM write failed @%" PRIx64 "\n",
+                              __func__, bus->dma_dram_offset);
                 return;
             }
-            bus->regs[reg_dma_addr]++;
+
+            bus->dma_dram_offset++;
             bus->regs[reg_dma_len]--;
             /* In new mode, keep track of how many bytes we RXed */
             if (aspeed_i2c_is_new_mode(bus->controller)) {
@@ -636,14 +642,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CM_DMA_TX_ADDR:
         bus->regs[R_I2CM_DMA_TX_ADDR] = FIELD_EX32(value, I2CM_DMA_TX_ADDR,
                                                    ADDR);
-        bus->regs[R_I2CC_DMA_ADDR] = FIELD_EX32(value, I2CM_DMA_TX_ADDR, ADDR);
+        bus->dma_dram_offset =
+            deposit64(bus->dma_dram_offset, 0, 32,
+                      FIELD_EX32(value, I2CM_DMA_TX_ADDR, ADDR));
         bus->regs[R_I2CC_DMA_LEN] = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN,
                                                      TX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_RX_ADDR:
         bus->regs[R_I2CM_DMA_RX_ADDR] = FIELD_EX32(value, I2CM_DMA_RX_ADDR,
                                                    ADDR);
-        bus->regs[R_I2CC_DMA_ADDR] = FIELD_EX32(value, I2CM_DMA_RX_ADDR, ADDR);
+        bus->dma_dram_offset =
+            deposit64(bus->dma_dram_offset, 0, 32,
+                      FIELD_EX32(value, I2CM_DMA_RX_ADDR, ADDR));
         bus->regs[R_I2CC_DMA_LEN] = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN,
                                                      RX_BUF_LEN) + 1;
         break;
@@ -811,7 +821,8 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
             break;
         }
 
-        bus->regs[R_I2CD_DMA_ADDR] = value & 0x3ffffffc;
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 0, 32,
+                                         value & 0x3ffffffc);
         break;
 
     case A_I2CD_DMA_LEN:
@@ -983,6 +994,7 @@ static const VMStateDescription aspeed_i2c_bus_vmstate = {
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedI2CBus, ASPEED_I2C_NEW_NUM_REG),
         VMSTATE_UINT8_ARRAY(pool, AspeedI2CBus, ASPEED_I2C_BUS_POOL_SIZE),
+        VMSTATE_UINT64(dma_dram_offset, AspeedI2CBus),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1188,8 +1200,9 @@ static int aspeed_i2c_bus_new_slave_event(AspeedI2CBus *bus,
             return -1;
         }
         ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN, 0);
-        bus->regs[R_I2CC_DMA_ADDR] =
-            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR);
+        bus->dma_dram_offset =
+            deposit64(bus->dma_dram_offset, 0, 32,
+                      ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR));
         bus->regs[R_I2CC_DMA_LEN] =
             ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN) + 1;
         i2c_ack(bus->bus);
@@ -1255,10 +1268,10 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 static void aspeed_i2c_bus_new_slave_send_async(AspeedI2CBus *bus, uint8_t data)
 {
     assert(address_space_write(&bus->controller->dram_as,
-                               bus->regs[R_I2CC_DMA_ADDR],
+                               bus->dma_dram_offset,
                                MEMTXATTRS_UNSPECIFIED, &data, 1) == MEMTX_OK);
 
-    bus->regs[R_I2CC_DMA_ADDR]++;
+    bus->dma_dram_offset++;
     bus->regs[R_I2CC_DMA_LEN]--;
     ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN,
                      ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN) + 1);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index b42c4dc584..bdaea3207d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -248,6 +248,7 @@ struct AspeedI2CBus {
 
     uint32_t regs[ASPEED_I2C_NEW_NUM_REG];
     uint8_t pool[ASPEED_I2C_BUS_POOL_SIZE];
+    uint64_t dma_dram_offset;
 };
 
 struct AspeedI2CState {
@@ -369,14 +370,6 @@ static inline uint32_t aspeed_i2c_bus_dma_len_offset(AspeedI2CBus *bus)
     return R_I2CD_DMA_LEN;
 }
 
-static inline uint32_t aspeed_i2c_bus_dma_addr_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_DMA_ADDR;
-    }
-    return R_I2CD_DMA_ADDR;
-}
-
 static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
 {
     return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
-- 
2.34.1

