Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387211njm;
        Thu, 6 Mar 2025 02:41:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5lCRmG9ZdU2+nhWA3DKlG7Pjiq+xWPoqNaygbZ4nVSkxbfQo8qodUzVT1XJrZII4tewfRWJ3ZKn2TAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHLrNYQ2d2YklWsJ1dd9KIw8Sgh4w3iT/qQVZeDcUoopE1uqNQzDd/xnDX8gH0lHLtCwVPz
X-Received: by 2002:a05:620a:4899:b0:7c3:ac33:af9e with SMTP id af79cd13be357-7c3d8bcff56mr857415385a.3.1741257679103;
        Thu, 06 Mar 2025 02:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257679; cv=none;
        d=google.com; s=arc-20240605;
        b=eZEtU2cb3OyABW5CgdVGA8vW/yAJ8+YyPRvZojI8zRs5VJHyM707KSuwTn4z6WIPOj
         /6rtArTC2UW0WCWnlivDlS5Cis5Ud5N8jqtVtjfpZRLwir1vTC7OvZe/0DorNwPl4Z0m
         uyf6qRNl7IWCb+vEm+I5JRdtN2sGPUp9AAXYPVjRJJTH7vV4HXsqPqI+aG494BdB4KJZ
         B7sjbQPFjL1YU1hTuoffp+f9iACOQgK/R38zcTsq+T7QcRDHMRWDOmMiqwMDb8Gdb2kn
         r5cFs1uRlTbmJuLwiPc+IEWBRB8+B98PqKw0zSZ+4JoJrlfX0tEhHU99F6JQpla4dNaw
         c/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=rPzmeCtolgx9PL9eF/trha6QyM9/NuEetWlt/LlVQ+I=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=TBZKZMp/2PURW4/p1UtL4hmZYGo33jzJ8bwoZ3onrnv4txt28/YtJ9CSFEcrxPsHck
         599cLrewsDw2BU4aibzDKBx4pP3Vzy4M5JRUwyyAbHAxotxnHr6awHn0bpMIIB7WVDr0
         I0O6jkT8lo7nfdIswPA7dxZOtEbPU6rMzKhmJ1BnX/Lh/goFRKHChL98jKwQEDqvv5xf
         cVvr56UgqkZgOALPHiRln+2sLFnqhfwuxXkH8Kofv5y4VoTw0utYlw/oxbdCvUKh8G9u
         oX8/26Bgv3DKbNPzLJsza7eQx+UJewJtURFhirm3KfqjwuzWN1Nc2+FPKEr6uhsSIrSp
         DipQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511860si96164385a.385.2025.03.06.02.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8dF-0004rc-O9; Thu, 06 Mar 2025 05:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dC-0004qT-Fv; Thu, 06 Mar 2025 05:39:10 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dA-0000TZ-Qk; Thu, 06 Mar 2025 05:39:10 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:48 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 05/29] hw/intc/aspeed: Reduce regs array size by adding a
 register sub-region
Date: Thu, 6 Mar 2025 18:38:13 +0800
Message-ID: <20250306103846.429221-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: J3qH/e+LW4nB

Currently, the size of the "regs" array is 0x2000, which is too large. So far,
it only uses "GICINT128 to `GICINT134", and the offsets from 0 to 0x1000 are
unused. To save code size and avoid mapping large unused gaps, update to only
map the useful set of registers:

INTC register [0x1000 – 0x1804]

Update "reg_size" to 0x808. Introduce a new class attribute "reg_offset" to set
the start offset of a "INTC" sub-region. Set the "reg_offset" to 0x1000 for INTC
registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/intc/aspeed_intc.h |  1 +
 hw/intc/aspeed_intc.c         | 50 ++++++++++++++++++++---------------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 17cd889e0d..d72a5b4ab1 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -42,6 +42,7 @@ struct AspeedINTCClass {
     uint32_t num_ints;
     uint64_t mem_size;
     uint64_t reg_size;
+    uint64_t reg_offset;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 1c3dc3fce0..fad351449b 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -14,25 +14,31 @@
 #include "hw/registerfields.h"
 #include "qapi/error.h"
 
-/* INTC Registers */
-REG32(GICINT128_EN,         0x1000)
-REG32(GICINT128_STATUS,     0x1004)
-REG32(GICINT129_EN,         0x1100)
-REG32(GICINT129_STATUS,     0x1104)
-REG32(GICINT130_EN,         0x1200)
-REG32(GICINT130_STATUS,     0x1204)
-REG32(GICINT131_EN,         0x1300)
-REG32(GICINT131_STATUS,     0x1304)
-REG32(GICINT132_EN,         0x1400)
-REG32(GICINT132_STATUS,     0x1404)
-REG32(GICINT133_EN,         0x1500)
-REG32(GICINT133_STATUS,     0x1504)
-REG32(GICINT134_EN,         0x1600)
-REG32(GICINT134_STATUS,     0x1604)
-REG32(GICINT135_EN,         0x1700)
-REG32(GICINT135_STATUS,     0x1704)
-REG32(GICINT136_EN,         0x1800)
-REG32(GICINT136_STATUS,     0x1804)
+/*
+ * INTC Registers
+ *
+ * values below are offset by - 0x1000 from datasheet
+ * because its memory region is start at 0x1000
+ *
+ */
+REG32(GICINT128_EN,         0x000)
+REG32(GICINT128_STATUS,     0x004)
+REG32(GICINT129_EN,         0x100)
+REG32(GICINT129_STATUS,     0x104)
+REG32(GICINT130_EN,         0x200)
+REG32(GICINT130_STATUS,     0x204)
+REG32(GICINT131_EN,         0x300)
+REG32(GICINT131_STATUS,     0x304)
+REG32(GICINT132_EN,         0x400)
+REG32(GICINT132_STATUS,     0x404)
+REG32(GICINT133_EN,         0x500)
+REG32(GICINT133_STATUS,     0x504)
+REG32(GICINT134_EN,         0x600)
+REG32(GICINT134_STATUS,     0x604)
+REG32(GICINT135_EN,         0x700)
+REG32(GICINT135_STATUS,     0x704)
+REG32(GICINT136_EN,         0x800)
+REG32(GICINT136_STATUS,     0x804)
 
 #define GICINT_STATUS_BASE     R_GICINT128_STATUS
 
@@ -298,7 +304,8 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->reg_size << 2);
 
-    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
+    memory_region_add_subregion(&s->iomem_container, aic->reg_offset,
+                                &s->iomem);
 
     qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
 
@@ -348,7 +355,8 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     aic->num_lines = 32;
     aic->num_ints = 9;
     aic->mem_size = 0x4000;
-    aic->reg_size = 0x2000 >> 2;
+    aic->reg_size = 0x808 >> 2;
+    aic->reg_offset = 0x1000;
 }
 
 static const TypeInfo aspeed_2700_intc_info = {
-- 
2.43.0

