Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1145144ejc;
        Thu, 10 Aug 2023 22:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpdKPewufx/NNjVXDupi/Rn6YLaOO6ezuhmzbImdvbg+e9E8EAFNn3YTZofwWCI/aboJiY
X-Received: by 2002:ac8:5753:0:b0:409:f273:e28d with SMTP id 19-20020ac85753000000b00409f273e28dmr1009002qtx.62.1691733050915;
        Thu, 10 Aug 2023 22:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691733050; cv=none;
        d=google.com; s=arc-20160816;
        b=M/j/XGrUg9phDBh1gRhdb9Vbh+Jby8xbjv3aSdH5VFZa3s2bzdT0sP9BlKYa4iLE+5
         C0qJCT2S/6zVrVZ1fu0LnSMtj2Pl3I8TZEs5RwRUksH5Ehaf2lRkmwBO3VH5x6z1kplh
         lbdxYMYm3AZnj+zcMhOAQYfAhpCtJuMZ8vyxvjfeK7VnDMlMJbj1hkbF2oI0dsYc43yM
         t69SwHJyxWfGGRra4o6xrMN9MeJWHw+QWeg/+dzdxg5wKHi+HpZHDEnJoRXzcAoLVE6r
         2hMDqjb6DPGKFII+ccKV8y42EOyyuZuvyXWNBsZdm4q5Tg2zuggAzg9EQzbPCvCQnhkl
         mU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9333q0P/g/k/yRSClN9NTiiSfE79MN2EgY8iv6pr7tc=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=QlMNYP6Lm7OYN6zg90aMAgJ0wb3QGmDgITY08TBagn2CnuQ/d+1aUhtfr3+wp6CzVK
         jiEJrBXONPJd1COCy6/FEfVllfwkdggqWZBHGVeN/cWFD0NUrk1C9cNBXg/m8yHc3KjT
         3n2cDCBKt/Dv8/hx6gbbGV2kzv6I2MKOR21y4zgp7/dI58731ekmpLLee5ASpKKr9nKQ
         cO0rdOwxk14aup2WOkxNFvZPpn6N468P1+NI5H5sAxyOyFdXuQBck3KFrB1zXEjNnL5R
         03TQnIuiSCVk49/Ojh+K0m5JZyxHJySRh7dmB5mnn7wpEUbe2vGbE2tK89yA5jsxt2PF
         hHNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a14ca00b00400ab98ce1fsi1856187qtx.727.2023.08.10.22.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 22:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qUL1s-0007x0-AP; Fri, 11 Aug 2023 01:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvX-0006Ku-Mv; Fri, 11 Aug 2023 01:43:11 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvU-0000Id-Cn; Fri, 11 Aug 2023 01:43:11 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id E7BBC38B150; Fri, 11 Aug 2023 13:43:01 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2 2/4] hw/i2c/aspeed: Fix Tx count and Rx size error
Date: Fri, 11 Aug 2023 13:42:17 +0800
Message-Id: <20230811054220.99562-2-francis_yuu@stu.pku.edu.cn>
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
X-TUID: jgcxIT65MUqd

According to the ast2600 datasheet,the actual Tx count is
Transmit Data Byte Count plus 1, and the max Rx size is
Receive Pool Buffer Size plus 1, both in Pool Buffer Control Register.
The version before forgot to plus 1, and mistake Rx count for Rx size.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.39.2 (Apple Git-143)

