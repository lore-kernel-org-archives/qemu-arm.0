Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1937831njm;
        Thu, 6 Mar 2025 20:01:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVppPWNeaMFOxJHzULjGZPXvXEwek1CXH78KDkGmxi0uk+6kZsf3+Or6s+N1e7LQWXieUckx0qDIg+Qlg==@linaro.org
X-Google-Smtp-Source: AGHT+IGQVFPVW3FFuNpVDUC/7jYudTwXFD6ZN1niONsH42eSzRypL+JQ06cDyRytDlIaJFmG9hbO
X-Received: by 2002:a05:6214:268b:b0:6d4:1680:612d with SMTP id 6a1803df08f44-6e9004f9eb6mr27053056d6.0.1741320047461;
        Thu, 06 Mar 2025 20:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320047; cv=none;
        d=google.com; s=arc-20240605;
        b=FGb/cSEay2uz75EDizvwyzvlkLdWVL5Vzz0CK4nvN+PtTJgfYsmVahxt7sSidg+dmu
         FEe0JedBcM2ormdKdmKEmn1uaobNkQ+7oEPD9Gt2Ml1chM1dfke0/VA3w5DA+6yeGc7Y
         NHVN2DLcanphq3Zy8EJX5CHqByy1QiCqYhtI2KwqHepE5qJ6I4iEoftYN6WrJirwBzhA
         g5ab5ACZWUm5wmFQEgoSZ6h/yFjwzeDIO1c2kFyizMBpOARV2KhFPyMqORDuTEITs+Oi
         AEdiZkofouFTrtv4U4D6aJ356HS3QB/QHqMGUbRYPhH/fhaa9xRUL0voieflcp9LJav9
         CPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ge4vdV+qA8WId6X58DpgoyqQAudK3RQUu5DfjtZXuow=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=OboWBZ6GikT/nNWFo4nv0nL7wQOC21tTP+3cDMO4bfECi1J8eyKUUJatKNfdoFX7/M
         AiNFjfazeZOSVYAZEKYrpKXqBvC0FQOVQQvAzuvk/Tyr+mQs9rtYdkPPSH58ihIQcw1/
         SXsq22kVAO1tjIDY+6lEUu8f/tH+YibB7zupmZnSUAVu4k+3bJv/x12vGjZq0vn7bZgx
         Se5nR7NmhC3cCq4ArP0SEvTzck+sJxjrtInbDjdbtQpVpRXfnT+VHDhYNxCQtyNrh9QI
         Ql2K9+2XgmqcyiXWzrJx2jEELuwEE0TUGe3AKusErUFVOC9UcieDLerg6E+WQl7pQJiv
         /Quw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707e14fsi25620726d6.66.2025.03.06.20.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqOsT-0007bK-Q9; Thu, 06 Mar 2025 23:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsR-0007Zk-Tz; Thu, 06 Mar 2025 22:59:59 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsP-0004jN-S4; Thu, 06 Mar 2025 22:59:59 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:45 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 01/29] hw/intc/aspeed: Support setting different memory size
Date: Fri, 7 Mar 2025 11:59:10 +0800
Message-ID: <20250307035945.3698802-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
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
X-TUID: lmTX+Uq5Qsht

According to the AST2700 datasheet, the INTC(CPU DIE) controller has 16KB
(0x4000) of register space, and the INTCIO (I/O DIE) controller has 1KB (0x400)
of register space.

Introduced a new class attribute "mem_size" to set different memory sizes for
the INTC models in AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h | 3 +++
 hw/intc/aspeed_intc.c         | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 18cb43476c..03324f05ab 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -25,6 +25,8 @@ struct AspeedINTCState {
 
     /*< public >*/
     MemoryRegion iomem;
+    MemoryRegion iomem_container;
+
     uint32_t regs[ASPEED_INTC_NR_REGS];
     OrIRQState orgates[ASPEED_INTC_NR_INTS];
     qemu_irq output_pins[ASPEED_INTC_NR_INTS];
@@ -39,6 +41,7 @@ struct AspeedINTCClass {
 
     uint32_t num_lines;
     uint32_t num_ints;
+    uint64_t mem_size;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 126b711b94..033b574c1e 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -302,10 +302,16 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     int i;
 
+    memory_region_init(&s->iomem_container, OBJECT(s),
+            TYPE_ASPEED_INTC ".container", aic->mem_size);
+
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
                           TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
 
-    sysbus_init_mmio(sbd, &s->iomem);
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
+
     qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
 
     for (i = 0; i < aic->num_ints; i++) {
@@ -344,6 +350,7 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2700 INTC Controller";
     aic->num_lines = 32;
     aic->num_ints = 9;
+    aic->mem_size = 0x4000;
 }
 
 static const TypeInfo aspeed_2700_intc_info = {
-- 
2.43.0

