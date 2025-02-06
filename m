Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1426775njb;
        Thu, 6 Feb 2025 01:53:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTBgEbUiPph0y8cKdoD1BNQnR1qU8z54Uo3ZwoSYMBLNPUL/gEjWdtvwNLOkonj91UwrDVF8pZMzGJKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEheVK5gkL3NMc3pANcCKCIodM2nUNtIcsxzuXbRGn+jx3XLfm1WrZNBOxDZZoGFN4gUM01
X-Received: by 2002:a05:620a:1a8b:b0:7b6:d350:9bfc with SMTP id af79cd13be357-7c039fcf611mr949817985a.27.1738835624845;
        Thu, 06 Feb 2025 01:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738835624; cv=none;
        d=google.com; s=arc-20240605;
        b=Nf91tZU4SfjwWaPmucvRi6DZ9NWNuNb5XTGXwwVZsW7omdyuD8xQu7n6ES3UkkP34o
         1CgGTG5XH+dF625wfc9vNpmfSpo4WsWxMSVYh4Qd1yEgxWrm9GgPTwLxEEXxL259kHB+
         TEihWphqxJaU0K+mIFNik2iAZPQUNBZysv03FxXXe6h8rXn7fcm+P3vC8l4Pkp7+S7PW
         dzrGWtJEZLId2DhiB8sKDTOnnYTgPVOL2YETvVR0wshRQjnQk7SN49m0e1qxU6kd3XcU
         S7E51HHAtuxkFeCww0KLI3Byk1hIlwgHSyTSgwzeF1lgkYHK7+N4rM4oTk1F17lbg5gf
         ftZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=rHNn8ZhYLDinJ6aKgDEfgqvmGnJc94WjYWQ/vQAWcKc=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=g3h/eb8LGN8iem+b7rzFL0KfiAmQlpnETaXvM7Fr6+0gAyrI/Xn9lpFj5G8ajFs7rD
         seI67HXqEELjV7wF8DF/NAq49je4Cf2rn4GfA0H1J6qvDXN9/KGMK2EdKWNvgRTWNlER
         419NQLzXNARIt+qv75s2ocNLp61MCydbED7yrmC/sgQ7u03GrfPw53W106hfhdp6UN0+
         6Pnm8M+L3GbJzvYxulyWjIK8fPnUS/cFIjMPh2rTZj36ovO+UoiuzOh3y8lyMB9tSVWn
         FLvlHxUhLfS7MsPWj48BRGUs8jtZIDNkG3cSUkGDLuX8OgqDFKss8+h1ioUYQZ+tL6z7
         oKUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb4dc6si84970985a.408.2025.02.06.01.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfyZU-00021Q-Le; Thu, 06 Feb 2025 04:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZG-0001xi-8H; Thu, 06 Feb 2025 04:53:07 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZD-00051a-39; Thu, 06 Feb 2025 04:53:05 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Feb
 2025 17:52:53 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Feb 2025 17:52:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 1/6] hw/intc/aspeed: Support setting different memory and
 register size
Date: Thu, 6 Feb 2025 17:52:47 +0800
Message-ID: <20250206095253.928308-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
References: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8NeY+Q6Ss0aq

According to the AST2700 datasheet, the INTC (CPU DIE) controller has 16KB
(0x4000) of register space, and the INTC_IO (I/O DIE) controller has 1KB (0x400)
of register space.

Introduced a new class attribute "mem_size" to set different memory sizes for
the INTC models in AST2700.

Introduced a new class attribute "reg_size" to set different register sizes for
the INTC models in AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c         | 17 +++++++++++++----
 include/hw/intc/aspeed_intc.h |  4 ++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 126b711b94..316885a27a 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -117,10 +117,11 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     uint32_t addr = offset >> 2;
     uint32_t value = 0;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (offset >= aic->reg_size) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -143,7 +144,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     uint32_t change;
     uint32_t irq;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (offset >= aic->reg_size) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -302,10 +303,16 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     int i;
 
+    memory_region_init(&s->iomem_container, OBJECT(s),
+            TYPE_ASPEED_INTC ".container", aic->mem_size);
+
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
-                          TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
+                          TYPE_ASPEED_INTC ".regs", aic->reg_size);
+
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 
-    sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
 
     for (i = 0; i < aic->num_ints; i++) {
@@ -344,6 +351,8 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2700 INTC Controller";
     aic->num_lines = 32;
     aic->num_ints = 9;
+    aic->mem_size = 0x4000;
+    aic->reg_size = 0x2000;
 }
 
 static const TypeInfo aspeed_2700_intc_info = {
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 18cb43476c..ecaeb15aea 100644
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
@@ -39,6 +41,8 @@ struct AspeedINTCClass {
 
     uint32_t num_lines;
     uint32_t num_ints;
+    uint64_t mem_size;
+    uint64_t reg_size;
 };
 
 #endif /* ASPEED_INTC_H */
-- 
2.34.1

