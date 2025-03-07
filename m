Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1937760njm;
        Thu, 6 Mar 2025 20:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMV0Jy+QKhMT94zUS70dNS+0WyivWgURe8DxE3zObKgDDKsw1991IhbB5mMCpuUpsUcsg9YJxwcvTm0w==@linaro.org
X-Google-Smtp-Source: AGHT+IGupwTK9Ncm30Dqzt+7HS8I79vcU5HbmI/hZ3uRTqgunDG1tOyk//VIiJADzR3c+huHNkgO
X-Received: by 2002:ac8:7dca:0:b0:471:c701:7351 with SMTP id d75a77b69052e-4761095045emr25613991cf.5.1741320059292;
        Thu, 06 Mar 2025 20:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320059; cv=none;
        d=google.com; s=arc-20240605;
        b=fM3MxYIsbzXpuF3nl3yRhIyLME4XXS/lhA8PXhQKVpnce0jMoE9KgJulGRJDsvHLcm
         SgF6CVNPsRf6PromJqzaCUY5O3vVasuMHkhdZ0V/KQgFbEy3u7qUzeEftqJl32yRiKJx
         NoMANfaWJc9KOYQnRbT9+OGQrDBB8L3OElO3X6pfDhcx3ayaAZ4hohOgvauKgBncwfMH
         VqjgHTO6zWxQfAAcC4USKyk0bJKmFRYBKEzOxaF69oeI34hlKRQH0KpRvegvrdmj9Uz/
         UvFbBlIAPMvPbPbPfM7tnpn8wCoLIZYeKbGH3+p/qyDebBQTjLomD7FccF0FmMtdaivH
         G3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+IXFVn0PSZrn7OAHG2BjyMDqg0WPlwvSjTsRCMjHPT0=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=dswf3lsYS9A1ENytcLPeQpNca1f5CToVw9A7ByHkww3In4M+Gkg0cA+LZFC4wiy3/3
         gJjHC0guBzs599DORBwcVS8kwk3hqVO1VW50XuGltPbyHHtoVYDUJlAbtlGdn7ALNQNc
         mLFzCcLFwQhHfFF5iYKzRSPtBWghQhNibzNSsljtlp//O1QZdW2TxhhZQ9evkQmO49zH
         w/02OiuZXMyZx7v6ZDeqRm+1vaW4Gv+5NF0/gKOcT3KTxQLYO/gMMAdJoCL/76SurZTC
         FFTV1602z+agwGJlDqwYlNEo6GInULxZPoj0NKPKcZ7lw2ZJ5LWpvWBU4J/CH/g8iNoI
         E6ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db1e50csi26473051cf.410.2025.03.06.20.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOsb-0007i8-1n; Thu, 06 Mar 2025 23:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsU-0007cN-Hd; Thu, 06 Mar 2025 23:00:03 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsS-0004jN-Nw; Thu, 06 Mar 2025 23:00:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v6 04/29] hw/intc/aspeed: Support setting different register
 size
Date: Fri, 7 Mar 2025 11:59:13 +0800
Message-ID: <20250307035945.3698802-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
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
X-TUID: EvVtCtLDVC4u

Currently, the size of the regs array is 0x2000, which is too large. So far,
it only use GICINT128 - GICINT134, and the offsets from 0 to 0x1000 are unused.
To save code size, introduce a new class attribute "reg_size" to set the
different register sizes for the INTC models in AST2700 and add a regs
sub-region in the memory container.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/intc/aspeed_intc.h |  2 +-
 hw/intc/aspeed_intc.c         | 22 +++++-----------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 47ea0520b5..ec4936b3f4 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -16,7 +16,6 @@
 #define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
-#define ASPEED_INTC_NR_REGS (0x2000 >> 2)
 #define ASPEED_INTC_NR_INTS 9
 
 struct AspeedINTCState {
@@ -42,6 +41,7 @@ struct AspeedINTCClass {
     uint32_t num_lines;
     uint32_t num_ints;
     uint64_t mem_size;
+    uint64_t nr_regs;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 558901570f..134922e46f 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -120,13 +120,6 @@ static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
     uint32_t reg = offset >> 2;
     uint32_t value = 0;
 
-    if (reg >= ASPEED_INTC_NR_REGS) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
-                      __func__, offset);
-        return 0;
-    }
-
     value = s->regs[reg];
     trace_aspeed_intc_read(offset, size, value);
 
@@ -143,13 +136,6 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     uint32_t change;
     uint32_t irq;
 
-    if (reg >= ASPEED_INTC_NR_REGS) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
-                      __func__, offset);
-        return;
-    }
-
     trace_aspeed_intc_write(offset, size, data);
 
     switch (reg) {
@@ -288,8 +274,9 @@ static void aspeed_intc_instance_init(Object *obj)
 static void aspeed_intc_reset(DeviceState *dev)
 {
     AspeedINTCState *s = ASPEED_INTC(dev);
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
 
-    memset(s->regs, 0, ASPEED_INTC_NR_REGS << 2);
+    memset(s->regs, 0, aic->nr_regs << 2);
     memset(s->enable, 0, sizeof(s->enable));
     memset(s->mask, 0, sizeof(s->mask));
     memset(s->pending, 0, sizeof(s->pending));
@@ -307,9 +294,9 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
-    s->regs = g_new(uint32_t, ASPEED_INTC_NR_REGS);
+    s->regs = g_new(uint32_t, aic->nr_regs);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
-                          TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
+                          TYPE_ASPEED_INTC ".regs", aic->nr_regs << 2);
 
     memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 
@@ -361,6 +348,7 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     aic->num_lines = 32;
     aic->num_ints = 9;
     aic->mem_size = 0x4000;
+    aic->nr_regs = 0x2000 >> 2;
 }
 
 static const TypeInfo aspeed_2700_intc_info = {
-- 
2.43.0

