Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355586njf;
        Tue, 3 Sep 2024 01:37:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYPSMpdqsR+rYb8mTs9iBzT3cQr4Y7xLzObdkRdYUNbjfeunFrUR2ENkYMEtVAbqGUuQT0+Xw7W/xCBw==@linaro.org
X-Google-Smtp-Source: AGHT+IG9+CK2olCGaWwDTA/5zBDy/HBWcR86NvojNGQm1w6ABiM8GSMf0hZbpE6MyBxAsqWfLMDr
X-Received: by 2002:a05:620a:460d:b0:7a6:5d86:a3c with SMTP id af79cd13be357-7a8a3dcab8fmr981460485a.63.1725352629174;
        Tue, 03 Sep 2024 01:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352629; cv=none;
        d=google.com; s=arc-20160816;
        b=EPoPKPUdWZr2SVd8/nKsv6X7kakNWWsQ8FxP+rm5LQDQiuW65MhHLh+lwG0MTgUfQt
         Q7+zdgF2yMrQbpT+/444XR1hOYw+MDAQEQ5Va19qA0CH61d41gZCZKCxLnNhzrqXaxsa
         QestuwiyHB2dZZlVnesnoH1mTtv4TH9U+lH4BlG/BNGfQyDPopU8DvTGIah1yUGx3JUf
         iqMogWAeOI7zwKhuIxnvre9e8nKHwiRwjUMMNNc+jcP3y1ZSQVw/KJOp/49weZwnoK1j
         fN00suNrDS43zqpT12npw5LQWF6xihGz4UIFK8L9pqPYW4PiyqCaSZg+7Stm75snW49F
         7hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Zwtp6NbMEZcWkdOReqIrrYS6ySQ1WSdhh73XzctSls0=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=bUJ8V4fYvul9vP59Y6UEjoERysDs8d77t6Ko5CwmUY0/z/TYvcpvsp1q84Gx6Z5hpe
         1LClypX3Wg6Z81nYC+mOdM2tVs5f0wWu+ZXtwYgWEOjCy0Wh0VK0CYtSmlDcR9jlC3o4
         IzzEK/szYUiRPF82mxjgPcvC9CNbLdUpTaSvMwUoV4ly/8hb0MuJj4teuaSCYDtrAmWY
         R3a2NO/OId20oT2Dt4/VFToYK1CVKeKJLs8guPFZJQ8/c74HktYq3wC3XNv3LSShx/wO
         rGXbJtfmoY/9fsyk6djioKS+FSaEbs6Vi5sCSMVbPTFco9xQfvWbSd3y7VwOZRIFo3FZ
         P/GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806de8d48si1250872585a.672.2024.09.03.01.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slP12-0003sD-9n; Tue, 03 Sep 2024 04:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP10-0003k7-Kk; Tue, 03 Sep 2024 04:35:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP0z-00084x-0A; Tue, 03 Sep 2024 04:35:54 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:30 +0800
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
Subject: [PATCH v3 06/11] hw/i2c/aspeed: Add support for Tx/Rx buffer 64 bit
 addresses
Date: Tue, 3 Sep 2024 16:35:23 +0800
Message-ID: <20240903083528.2182190-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IXDHgbGQz1cy

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
and the base address of dram is "0x4 00000000" which
is 64bits address.

It has "Master DMA Mode Tx Buffer Base Address[39:32](0x60)"
and "Master DMA Mode Rx Buffer Base Address[39:32](0x64)"
registers to save the high part physical address of Tx/Rx
buffer address for master mode.

It has "Slave DMA Mode Tx Buffer Base Address[39:32](0x68)" and
"Slave DMA Mode Rx Buffer Base Address[39:32](0x6C)" registers
to save the high part physical address of Tx/Rx buffer address
for slave mode.

Ex: Tx buffer address for master mode [39:0]
The "Master DMA Mode Tx Buffer Base Address[39:32](0x60)"
bits [7:0] which corresponds the bits [39:32] of the 64 bits address of
the Tx buffer address.
The "Master DMA Mode Tx Buffer Base Address(0x30)" bits [31:0]
which corresponds the bits [31:0] of the 64 bits address
of the Tx buffer address.

Introduce a new has_dma64 class attribute and new registers for the
new mode to support DMA 64 bits dram address.
Update new mode register number to 28.

The aspeed_i2c_bus_vmstate is changed again and
version is not increased because it was done earlier in the same series.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 48 +++++++++++++++++++++++++++++++++++++
 include/hw/i2c/aspeed_i2c.h | 12 +++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 819a875839..c1ff80b1cf 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -140,6 +140,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
 static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
                                         unsigned size)
 {
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     uint64_t value = bus->regs[offset / sizeof(*bus->regs)];
 
     switch (offset) {
@@ -170,6 +171,16 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CM_CMD:
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
+    case A_I2CM_DMA_TX_ADDR_HI:
+    case A_I2CM_DMA_RX_ADDR_HI:
+    case A_I2CS_DMA_TX_ADDR_HI:
+    case A_I2CS_DMA_RX_ADDR_HI:
+        if (!aic->has_dma64) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
+            __func__);
+            value = -1;
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
@@ -731,6 +742,42 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         qemu_log_mask(LOG_UNIMP, "%s: Slave mode DMA TX is not implemented\n",
                       __func__);
         break;
+
+    case A_I2CM_DMA_TX_ADDR_HI:
+        if (!aic->has_dma64) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
+                          __func__);
+            break;
+        }
+        bus->regs[R_I2CM_DMA_TX_ADDR_HI] = FIELD_EX32(value,
+                                                      I2CM_DMA_TX_ADDR_HI,
+                                                      ADDR_HI);
+        break;
+    case A_I2CM_DMA_RX_ADDR_HI:
+        if (!aic->has_dma64) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
+                          __func__);
+            break;
+        }
+        bus->regs[R_I2CM_DMA_RX_ADDR_HI] = FIELD_EX32(value,
+                                                      I2CM_DMA_RX_ADDR_HI,
+                                                      ADDR_HI);
+        break;
+    case A_I2CS_DMA_TX_ADDR_HI:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Slave mode DMA TX Addr high is not implemented\n",
+                      __func__);
+        break;
+    case A_I2CS_DMA_RX_ADDR_HI:
+        if (!aic->has_dma64) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
+                          __func__);
+            break;
+        }
+        bus->regs[R_I2CS_DMA_RX_ADDR_HI] = FIELD_EX32(value,
+                                                      I2CS_DMA_RX_ADDR_HI,
+                                                      ADDR_HI);
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -1554,6 +1601,7 @@ static void aspeed_2700_i2c_class_init(ObjectClass *klass, void *data)
     aic->bus_pool_base = aspeed_2500_i2c_bus_pool_base;
     aic->has_dma = true;
     aic->mem_size = 0x2000;
+    aic->has_dma64 = true;
 }
 
 static const TypeInfo aspeed_2700_i2c_info = {
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 4f23dc10c3..2c4c81bd20 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -38,7 +38,7 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_SHARE_POOL_SIZE 0x800
 #define ASPEED_I2C_BUS_POOL_SIZE 0x20
 #define ASPEED_I2C_OLD_NUM_REG 11
-#define ASPEED_I2C_NEW_NUM_REG 22
+#define ASPEED_I2C_NEW_NUM_REG 28
 
 #define A_I2CD_M_STOP_CMD       BIT(5)
 #define A_I2CD_M_RX_CMD         BIT(3)
@@ -227,6 +227,15 @@ REG32(I2CS_DMA_LEN_STS, 0x4c)
     FIELD(I2CS_DMA_LEN_STS, TX_LEN, 0, 13)
 REG32(I2CC_DMA_ADDR, 0x50)
 REG32(I2CC_DMA_LEN, 0x54)
+/* DMA 64bits */
+REG32(I2CM_DMA_TX_ADDR_HI, 0x60)
+    FIELD(I2CM_DMA_TX_ADDR_HI, ADDR_HI, 0, 7)
+REG32(I2CM_DMA_RX_ADDR_HI, 0x64)
+    FIELD(I2CM_DMA_RX_ADDR_HI, ADDR_HI, 0, 7)
+REG32(I2CS_DMA_TX_ADDR_HI, 0x68)
+    FIELD(I2CS_DMA_TX_ADDR_HI, ADDR_HI, 0, 7)
+REG32(I2CS_DMA_RX_ADDR_HI, 0x6c)
+    FIELD(I2CS_DMA_RX_ADDR_HI, ADDR_HI, 0, 7)
 
 struct AspeedI2CState;
 
@@ -292,6 +301,7 @@ struct AspeedI2CClass {
     bool has_dma;
     bool has_share_pool;
     uint64_t mem_size;
+    bool has_dma64;
 };
 
 static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
-- 
2.34.1

