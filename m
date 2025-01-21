Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494321njn;
        Mon, 20 Jan 2025 23:05:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVczi/HSOYmR6CzpCmgU5ljzFLTRELXh/9t1MxUYS68tBURlLfm1YHTs1Pw2ww6guxc5BQeAmPm6AvDPA==@linaro.org
X-Google-Smtp-Source: AGHT+IFoJ2RaajBGgwZTjCF4di9NmbZlldXrqaIPEDvb+ycCCe4JCpHKq/HDNMwTnq9VANA5Vs7Z
X-Received: by 2002:a05:622a:1820:b0:467:677a:74d with SMTP id d75a77b69052e-46e12a99dc7mr226607031cf.25.1737443130457;
        Mon, 20 Jan 2025 23:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443130; cv=none;
        d=google.com; s=arc-20240605;
        b=kqiH69VXtaQAEF8MP24XgNoJ6ZJCwUQ2sMYqnekRu/0LUn4R8GXJhUkhkRc9SVzrxR
         ewDNLCsl2wSdYhqA+SoJcM+p4PsR6QYXh4Hn8M4WuT/POsAerbRlyuGmbHOc7xXV+C7V
         EmsWOB4J5wP6j92dJ134u1RZ7PFTjI1cKZSMKEP3fSh2Mdv5hjnzn2x/xxRL5vRCMKTq
         ILO5vFstIvUTWG2qsoSxF6JkVflOZzBp8tNRoYs3LZZD4aWTSKrkp4Q2r5O0s86sjIsL
         uvid8maa3MWvmKcSf71PN1Az9oBHLAupkFyCRnQW9t9Fvaa2uSAdy9TnHq45kekKuFd0
         SsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=PLYT51RZdOdgFNVJk+NhS53LGVij9r+kYrpKRx00+IQ=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=JymIbchbViI+h3phgSOKN7iRMrAhj6ioJzEq+PEU8B2PdWfMqBww0LcbsPsrnEoVvt
         Rg0qBS4ZgCggqocNXxUO10/Da3SRiUtc9/I5Hlz0w4djrSkxvgS7lEiIDI0G/Mofte9i
         2k1ue2Rzu6CkjO8DOmQjW5/cTxyZj8Z/XPYPSpqEAhFd3HOtwhqRUspo+hDNEkVVNOTF
         5VUfOTXH3EfiH+OXA9rNRNup42IfckVezRnqLhDZAGBlL+btIGSyUVF8llxCb+wHFS+D
         m/I8AOusNO91jgK0tcouqbfuVJBS9b7OtFzVlj3HzpHsR7nsk0/w6b9tW0ZLpE4GgKYj
         B+5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1048a315si112464271cf.501.2025.01.20.23.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Jp-0006j8-Gb; Tue, 21 Jan 2025 02:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jl-0006gf-C4; Tue, 21 Jan 2025 02:04:58 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jj-0001Q8-RO; Tue, 21 Jan 2025 02:04:57 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:26 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:26 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 04/18] hw/intc/aspeed: Support setting different memory and
 register size
Date: Tue, 21 Jan 2025 15:04:10 +0800
Message-ID: <20250121070424.2465942-5-jamin_lin@aspeedtech.com>
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
X-TUID: AGTU+ZbBI5hy

According to the AST2700 datasheet, the INTC0 (CPU DIE) controller has 16KB
(0x4000) of register space, and the INTC1 (I/O DIE) controller has 1KB (0x400)
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
index 219ca02940..25035c65ca 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -118,10 +118,11 @@ static uint64_t aspeed_2700_intc0_read(void *opaque, hwaddr offset,
                                        unsigned int size)
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
@@ -144,7 +145,7 @@ static void aspeed_2700_intc0_write(void *opaque, hwaddr offset, uint64_t data,
     uint32_t change;
     uint32_t irq;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (offset >= aic->reg_size) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -301,10 +302,16 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     int i;
 
+    memory_region_init(&s->iomem_container, OBJECT(s),
+            TYPE_ASPEED_INTC ".container", aic->mem_size);
+
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
     memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
-                          TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
+                          TYPE_ASPEED_INTC ".regs", aic->reg_size);
+
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 
-    sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
 
     for (i = 0; i < aic->num_ints; i++) {
@@ -357,6 +364,8 @@ static void aspeed_2700_intc0_class_init(ObjectClass *klass, void *data)
     aic->num_lines = 32;
     aic->num_ints = 9;
     aic->reg_ops = &aspeed_2700_intc0_ops;
+    aic->mem_size = 0x4000;
+    aic->reg_size = 0x2000;
 }
 
 static const TypeInfo aspeed_2700_intc0_info = {
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 9a73661403..d881cb7088 100644
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
@@ -40,6 +42,8 @@ struct AspeedINTCClass {
     uint32_t num_lines;
     uint32_t num_ints;
     const MemoryRegionOps *reg_ops;
+    uint64_t mem_size;
+    uint64_t reg_size;
 };
 
 #endif /* ASPEED_INTC_H */
-- 
2.34.1

