Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1842163ejc;
        Fri, 11 Aug 2023 23:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP9adAEXGLDxIUYK70gY6qkhKS/beDM0TSJu5YbntRuYxNFM2ryJ6eK+TPA+7gQXK82EhC
X-Received: by 2002:a0d:f6c3:0:b0:584:61ca:107d with SMTP id g186-20020a0df6c3000000b0058461ca107dmr4317290ywf.5.1691823245723;
        Fri, 11 Aug 2023 23:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691823245; cv=none;
        d=google.com; s=arc-20160816;
        b=j4T4kFfcyWBdxDlvU1u0ZsRj+sAItWS3Kv315M2VWlOR/qHTrJVWM5Cl8lfeQuLT0x
         tBdCfHz5do1/RXjS9uLBOXoGCKr8ME/ezGzkCTMZz7wC8dR4qwIt4hFLRKNbAU0R0GPs
         yynvqDgX7Noid2ioLfjkrtQv9j1lwkpjIw8FAyDRqgvlaxY+XkIDlYeDMQ17o3QNsfTo
         jT60rNNywdC3uWZgcd/HkTvarYwufYdNrSE0DjYWT7cXpAW6kCXIfTHgGzFc5SSS5Eum
         +w0r7Ek70Q0IY+zUzKoZi8gHX5309gEEkXeKcD6bPqvmis+O6Lu3WFxiN+VSzfC2qFU2
         zg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=GOOunY/C1XjQKZA+9DzuL6wEvVZ3+j3Peh3Oj6kHIlc=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=sj16OmYZXfMnEdJS01bqUcQ2UikObjN/VVeME8pIhNI+7CTRPdrGl8XHWjtjrcdJj4
         7hP7BRa0cP6tS3w/NPOPsri9I71s3vkrZa9XBqWddDICZDfWO9c7FskqHqJz5E02CQ6g
         XfVbu3EdyLGzYsdm+eWlrKX3pRofvkVuF074xaKJAVTjTG900zNtk2ELnG+NqQnDR7NX
         NyxTOQ58tYkXup/uRWp0SrdUgMXUSxO5rTZ1MyghaioJrmZcx9OsYqIBAkQ3go76yzMu
         sLTaavV/5P6uWbB2gJSg9b/UNSJenxZ5QSmXDkxtZOyDRsRSesu60leUN4ygTiWERzCh
         MZ3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a454700b00767fd0121f1si3606188qkp.252.2023.08.11.23.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 23:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUiVL-0004s9-7V; Sat, 12 Aug 2023 02:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUiVJ-0004rk-Jc; Sat, 12 Aug 2023 02:53:41 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUiVF-0006ck-Ng; Sat, 12 Aug 2023 02:53:41 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id D13323992F3; Sat, 12 Aug 2023 14:53:22 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v3 3/3] hw/i2c/aspeed: Add support for buffer organization
Date: Sat, 12 Aug 2023 14:52:30 +0800
Message-Id: <20230812065230.8839-4-francis_yuu@stu.pku.edu.cn>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230812065230.8839-1-francis_yuu@stu.pku.edu.cn>
References: <20230812065230.8839-1-francis_yuu@stu.pku.edu.cn>
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
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: NaXb/pUBnb1J

Added support for the buffer organization option in pool buffer control
register.when set to 1,The buffer is split into two parts: Lower 16 bytes
for Tx and higher 16 bytes for Rx.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
---
v2-->v3:
1. Fixed typos
2. Simplified the judgment logic of buffer organization.
3. Change the buffer organization field to a shared field, and move it 
from I2CC_POOL_CTRL to I2CD_POOL_CTRL.

 hw/i2c/aspeed_i2c.c         | 3 +++
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 44905d7899..5d84797027 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -297,6 +297,9 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, BUF_ORGANIZATION)) {
+            pool_base += 16;
+        }
 
         for (i = 0; i < pool_rx_count; i++) {
             pool_base[i] = i2c_recv(bus->bus);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 2e1e15aaf0..a064479e59 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -143,6 +143,7 @@ REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
     SHARED_FIELD(RX_SIZE, 16, 5)
     SHARED_FIELD(TX_COUNT, 8, 5)
     FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
+    SHARED_FIELD(BUF_ORGANIZATION, 0, 1) /* AST2600 */
 REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
     SHARED_FIELD(RX_BUF, 8, 8)
     SHARED_FIELD(TX_BUF, 0, 8)
-- 
2.39.2 (Apple Git-143)

