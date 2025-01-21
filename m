Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494446njn;
        Mon, 20 Jan 2025 23:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVuoM+0boKuDxQDkEVWvEZ1LKOBuS7Mr6lsoHB9vNKf6c8H9qyY+/PNBxv5iANLK2hb5wIGl+Xn8j1pyg==@linaro.org
X-Google-Smtp-Source: AGHT+IGzuW6xIuICD8tfG0RbAbRQ+bv4abwzGeSWci9dFIahnZo1gpedw+1JnGBGDHUq1l+KzanZ
X-Received: by 2002:a05:6214:488:b0:6e1:69ba:34a with SMTP id 6a1803df08f44-6e1b2178798mr220846526d6.1.1737443145735;
        Mon, 20 Jan 2025 23:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443145; cv=none;
        d=google.com; s=arc-20240605;
        b=ez5dlte9xoh9bvtKNWlKPRdLnYyA51E7UD8BmW9RI58r5U1bHfeCKIo8ZBpsuxtb3z
         EQEgaWHdVb5DpwH5me5BM/+j8vc2dUYRL/J9zx+/bP1CVuaagykOnln6h43dU+GXYAgA
         TPADoFIi2TgLBajR4GTJjKtxHxMfIMm+YzZigMLq5wySdG54BqmZKUJwz3S0LN5STQto
         2CH5VWBEj4MI4cs/Sa6rhFKTXLmEHymsM5F1iXeXn4Co2XdS74tyGs7CQ67iJHLFhz/e
         BhGRzKqkEYD1O8mKOUDZVoPpd3WETIt5Q+OEEAU10pSIbWTfQv0Tioye1V4Rrb5Ur9Q1
         HNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=V6972Y9/gUFYYPh6dv49kA1SMnWZG5F+DmOyRbwv5CU=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=DldcnpAenVEA2Efq1Wxqf2xihLYmdrnMgJEx6FV7KtOIClaJPvVQlpfpc8apzjZG8O
         T2Xmq0bTOzvG+HjzHHLBdhx71CmGrqaSIUjNvuWuC7B/wv2Xjwu9YbIHaH/F125RZFja
         ClKn6RXxju5Z55xOJKU/io18mkSRXrj9EiiqcOcJp2sTtPa22RgC/mLStfXz8wdlVjat
         eg/LzCPO9nkdkLrRtgdckYEIFENHFnzGAqwXjBs1UFD8g8gXGgIzlVG3lS6DMiMtWESI
         5C35daST7zqOt+hnqeKPxuC+uyONac4vqDofoTPpAjTrcwnjI71b23EVpJg0pTQwlh27
         zwnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afc19f84si114060616d6.132.2025.01.20.23.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Jp-0006jG-JC; Tue, 21 Jan 2025 02:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Ji-0006g4-Hy; Tue, 21 Jan 2025 02:04:54 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jf-0001Q8-6V; Tue, 21 Jan 2025 02:04:53 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 03/18] hw/intc/aspeed: Introduce a new
 aspeed_2700_intc0_ops for INTC0
Date: Tue, 21 Jan 2025 15:04:09 +0800
Message-ID: <20250121070424.2465942-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
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
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: esoJlcSfS7Bl

Rename "aspeed_intc_read" to "aspeed_2700_intc0_read" and "aspeed_intc_write" to
"aspeed_2700_intc0_write".

Introduce a new memory region operation, "aspeed_2700_intc0_ops", for the
AST2700 INTC0 model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 628f69ea88..219ca02940 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -114,7 +114,8 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 }
 
-static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
+static uint64_t aspeed_2700_intc0_read(void *opaque, hwaddr offset,
+                                       unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     uint32_t addr = offset >> 2;
@@ -133,8 +134,8 @@ static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
     return value;
 }
 
-static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
-                                        unsigned size)
+static void aspeed_2700_intc0_write(void *opaque, hwaddr offset, uint64_t data,
+                                    unsigned size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
@@ -261,8 +262,6 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 }
 
 static const MemoryRegionOps aspeed_intc_ops = {
-    .read = aspeed_intc_read,
-    .write = aspeed_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -339,6 +338,16 @@ static const TypeInfo aspeed_intc_info = {
     .abstract = true,
 };
 
+static const MemoryRegionOps aspeed_2700_intc0_ops = {
+    .read = aspeed_2700_intc0_read,
+    .write = aspeed_2700_intc0_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    }
+};
+
 static void aspeed_2700_intc0_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -347,6 +356,7 @@ static void aspeed_2700_intc0_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2700 INTC 0 Controller";
     aic->num_lines = 32;
     aic->num_ints = 9;
+    aic->reg_ops = &aspeed_2700_intc0_ops;
 }
 
 static const TypeInfo aspeed_2700_intc0_info = {
-- 
2.34.1

