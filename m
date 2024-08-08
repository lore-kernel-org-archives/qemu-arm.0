Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358152njc;
        Wed, 7 Aug 2024 19:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvNeALSCETWYfUL8rK5JdhEXbeVyzVqjrIMY2SsWoeL3XKykgJrZjd+U5XATXrKofdriCZt0R0hI9y505QDWmPAhJgW1qD
X-Google-Smtp-Source: AGHT+IFwPXqkJbckKRHF08d4qupSkVWiJkNX1PaSw9sAa9EnDN7qO3gvyAkb0ZPaWx4heVxfOc0k
X-Received: by 2002:a05:6102:370f:b0:493:c028:bee0 with SMTP id ada2fe7eead31-495c5b47185mr684732137.15.1723085429427;
        Wed, 07 Aug 2024 19:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085429; cv=none;
        d=google.com; s=arc-20160816;
        b=Ee6RMv7a7i1OoFEST4uGM/SK+ExAYopn3Nss1ir8mTPcSWXe+sQFcvvuuyl1Z8emwt
         59RuhDF+5tHRsrtObHyJZG6U72vfZOXJnWT9Z6JImZRtQVn2fG17pK7dKZLZm7cqmPQu
         UlUBu7d+YDsHhHfMtCfiod6pmT6mDE7YlpLvnfTV3RxTSxhHHA2EJC9n24PXDLnM6PTq
         l8u7xrk0e7vpb3JcltlhcabndOvpYXbiY6iDzut5RUdg9MBpjjH4h2EnbjekT8yNGGv0
         5/AiBYYCETG1ThBccAwiBmpOZedGO+3sXio7WPnFpTfvALifvX8JMUYANGTXJuh1yU6U
         xSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8MOvhqyEz91G0YcI49CQstCpq4fC0bLHAQNaguBcFO8=;
        fh=sVs3p8gbptRv32z9lLYpJL2ORX7RrMh6U4eLBNuVM2U=;
        b=Vq3GT4+JeJgouLxVlZO90JhHF+5YA8FOrJZQGIsfDWbwAZb9SocsXvxmEIzBImsC4b
         v48d+DxpSRJnlI2HPoXt0HhdRcqK4pxc40fbsK0w9BPkPSTH1z9vrgwhlCq8UDrU2Os1
         KXWTlR/eAAI5GtE5iFpugJ9i/miMsOq+I584pkKL72QycgMTPqxGZxuoepVTxD3McuD7
         47bRuJQzMTFit1KE+b6R2mdTexGTW5ku0tcG3ovwQgXwDMu1zEcNjnlkkleKB3FMgUeH
         ayutVRCO+vI9ha9H/tZLP0+Fxblxj9Snm4xknqVXQhwou3kdOG6iRIpNjxsQoxtL6Pxn
         RVZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb5f8cf7si33611626d6.22.2024.08.07.19.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDm-0007hz-Oy; Wed, 07 Aug 2024 22:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDl-0007au-16; Wed, 07 Aug 2024 22:49:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDj-0008AE-6A; Wed, 07 Aug 2024 22:49:44 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 06/11] hw/i2c/aspeed: support Tx/Rx buffer 64 bits address
Date: Thu, 8 Aug 2024 10:49:11 +0800
Message-ID: <20240808024916.1262715-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: 8VdHNFZ809hc

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

It have "Master DMA Mode Tx Buffer Base Address[39:32](0x60)"
and "Master DMA Mode Rx Buffer Base Address[39:32](0x64)"
to save the high part physical address of Tx/Rx buffer address
for master mode.

It have "Slave DMA Mode Tx Buffer Base Address[39:32](0x68)" and
"Slave DMA Mode Rx Buffer Base Address[39:32](0x6C)" to
save the high part physical address of Tx/Rx buffer address
for slave mode.

Ex: Tx buffer address for master mode [39:0]
The "Master DMA Mode Tx Buffer Base Address[39:32](0x60)"
bits [7:0] which corresponds the bits [39:32] of the 64 bits address of
the Tx buffer address.
The "Master DMA Mode Tx Buffer Base Address(0x30)" bits [31:0]
which corresponds the bits [31:0] of the 64 bits address
of the Tx buffer address.

Introduce a new has_dma64 class attribute and new registers of
new mode to support DMA 64 bits dram address.
Update new mode register number to 28.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

