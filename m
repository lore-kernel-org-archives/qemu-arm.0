Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1145013ejc;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGI6936yd23g14pglITA3gK4YE+irgpyQR/NI745Ojqkav73BvYmXKe8VOogJCFKlSu5K/
X-Received: by 2002:a05:620a:4454:b0:767:e6cd:6f6d with SMTP id w20-20020a05620a445400b00767e6cd6f6dmr1303975qkp.55.1691733024397;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691733024; cv=none;
        d=google.com; s=arc-20160816;
        b=ddkniYfNac/92J2mcT57Kns+sFyGnT5IRnCm+LSa/gXC9M1wbft5DQo6h0fMPHcA//
         gSg6DdjeasbUkWlXY13zd+gML9QFNwkE15s6UoQE101eze6HZiqUqxQdBp5oB9YJp79C
         xFSEAtL7FU0qh2d767msQmT/bAlK3hwmV558GNrjCNKOwRK3w0vMGPLgcNndii4X9Yo8
         WUzEzmld4CH69n8Q6ct5WHTAGxrU0s0JiYWBObib/8my0a4t4oJgJme10gnt26LHHlk0
         Iy5K46eNbIEIOlavAFKxmIFLkl/P2vVIedTF1WWGP2xrcHGoov6X8cQ4hQl9XlvtJjuK
         /Y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6cCWvyTnlUlq5beq5mdr70Hnjs+oqIOfZy7P4jI9+tg=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=jpTC2gvS1nHxI1wYgrQDDoljzlXFOlADQxfHi2AxSttNj5UaKozFRo6Z+t4IRmYh5/
         UKVFi5RpxYKnlKvHmKm2n06SSxA1RLNe/n+78dhlk8+asYOrZs3cExgXevjd0Ojv6Lwr
         w0KckrRpx0cT7h+WSCY476P/QLld4WvxqU8eSSQDj/aJ6ZFRMnMxP7c998UsdclEmXaq
         Ozr0mfwEu7O6xuZ9KbH/wT32YFM7+rgv9OQbC1Zkv95G0AFAplkxst3JIA2rvXCnXpvm
         I8lwphjHhBgQLFZCGeItqLFZ512eO7Ka46qs55dNCoIbl0EQKJHOYUGpmQRTKGDHXFnF
         XD5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05620a244200b007652932acbbsi1811584qkn.31.2023.08.10.22.50.24
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
	id 1qUL1u-0007xa-NT; Fri, 11 Aug 2023 01:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvb-0006M5-SD; Fri, 11 Aug 2023 01:43:15 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvZ-0000KD-On; Fri, 11 Aug 2023 01:43:15 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id 7D17838B158; Fri, 11 Aug 2023 13:43:04 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2 4/4] hw/i2c/aspeed: Add support for BUFFER ORGANIZATION in
 new register mode
Date: Fri, 11 Aug 2023 13:42:19 +0800
Message-Id: <20230811054220.99562-4-francis_yuu@stu.pku.edu.cn>
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
X-TUID: +ZiZzukB/Aht

Added support for the BUFFER ORGANIZATION option in reg I2CC_POOL_CTRL,
when set to 1,The buffer is split into two parts: Lower 16 bytes for Tx
and higher 16 bytes for Rx.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
---
 hw/i2c/aspeed_i2c.c         | 7 ++++++-
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 44905d7899..26fefb8f9e 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -296,7 +296,12 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
                                                 RX_SIZE) + 1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
-        uint8_t *pool_base = aic->bus_pool_base(bus);
+        uint8_t *pool_base;
+        if (ARRAY_FIELD_EX32(bus->regs, I2CC_POOL_CTRL, BUF_ORGANIZATION)) {
+            pool_base = aic->bus_pool_base(bus) + 16;
+        } else {
+            pool_base = aic->bus_pool_base(bus);
+        }
 
         for (i = 0; i < pool_rx_count; i++) {
             pool_base[i] = i2c_recv(bus->bus);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 2e1e15aaf0..88b144a599 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
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

