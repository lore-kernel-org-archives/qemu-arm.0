Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3789436lfq;
        Tue, 12 Jan 2021 10:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRI87nXjos0jYks8C4/+NPtQNg3RSVIc1uwNF3AMHwCTKA6ZODQNg/e1h6/LgOYcVwyh/7
X-Received: by 2002:a25:d9c3:: with SMTP id q186mr1074223ybg.379.1610476779145;
        Tue, 12 Jan 2021 10:39:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610476779; cv=none;
        d=google.com; s=arc-20160816;
        b=nJbEDoawcEBNslBdR4kiLUga0j0Laf1RCK9+sFt2wKdhX1KY7X/m+OzoUxooSWel+G
         l3SpAFrEKgrfvR8ux6uEIRcFqZpTmsECYyCiWDSVWeILvoAzT6q1R0qeJxtrIViRQNbK
         wR24g4ZSV6ba+C/cZYgRUg8Eu6fW4h2mp9ZZ2SYb0SrxMa+eDMtTy/zu9Oh1S8a4R5cF
         2Zs0qIt6qixLNOERTdo+GDL/XszVzdYlf5gfP7soBiUP7kMusySOcQUMEmA8Gj3loob2
         p44nCnKd4AEvWCNun8KiKY7QyGYaTxvV4F+BAK1Yr6c3pMinsVKaTlR/XUELrX8BvRLz
         /LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cIbTTFaWqBlw1RG7hwtN0wXtBq0CsVDSjfCtHIelito=;
        b=gHvAIbpdJm+9sRKQKn7LKfJ1mAtk4rhqZzSM2BvDqNXtlBwuYgkZEyZzdp3GWsxOgJ
         ypT18jXo6Ka1SEJTFSA68Gmgtb9VDMsjpHeJqf45uWi7CKrm884EMAAo76jX/T+o2Q1F
         yMYahz83hNt4LNxV2D/vC+IBou4xODSbgLNRT8rWS5jO1dnH7FmoOVBEJ0jB1u99iPBL
         uCoYGGslUw/G8vcq3TQZlcpM801QCgi9dd4D65rG1EYRV4HdjKEnn1iYQvmkdhUmNtNs
         jHsSSwi7t3B/AgkJ2J509yeAonYntE3iSU11HfrlUiCsYH+VB7qtwv7l+7QSewYwHgsq
         mGow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oa8ugs1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b206si3299161yba.224.2021.01.12.10.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:39:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oa8ugs1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzOZu-0004WL-Gl
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWQ-0001A4-Sw; Tue, 12 Jan 2021 13:36:03 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWP-0007IV-D3; Tue, 12 Jan 2021 13:36:02 -0500
Received: by mail-ed1-x534.google.com with SMTP id w10so2536878edu.5;
 Tue, 12 Jan 2021 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIbTTFaWqBlw1RG7hwtN0wXtBq0CsVDSjfCtHIelito=;
 b=oa8ugs1bbQImjYGvzrrC9iWH7/IjBH8mPKKCZ8C05gGEOlFpRWPXcWH4bujSXJxR8L
 vfdcmn6vRw7g3PkYOqWmlzTbHMNuY1Ph7Irgfxri+atvvyZtQN/41RqW7jM5djB97iUw
 ir2MPcYNIOm8vAX8c5zUSTIwz5ikhwBjsvnKdgbCuC0y4NzD7nqrrEtLK84qtCfZ9Pyy
 d857Hx/cImqGReyN6V3IacfHN0VmVMQ+ng/9uFA/GNnDlGZU9qHodYNM8iiS86lZhSKa
 qFSarRoX10B9uNaB6TRZJbBqeVfKG70WV+My3vz1aGTACF3yp615ysOW/t8kmLyR+2WT
 c7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cIbTTFaWqBlw1RG7hwtN0wXtBq0CsVDSjfCtHIelito=;
 b=Tns69vjJxrRWRbAb8MMQ/0keXswoxC6n/Ox0pFXMTthbwVysSp7k4OFHgP1j7S1wWY
 N1zyaIQvfW2yxWmlb65ORsIevkxcs++Q2no9ulqoHMxdwNMC3wBGKY/XxjessMJncmeQ
 dageGtA/yMZm74y+fXli5fKDWkbiL5u2O99i2pjUUNH8uoUUU/CjTtmundgJmdVSwXkQ
 xbYdRJtU3c97gC3byOdslFkG/1vHW5iuVlY4Yh3Pvuw3eY1z2g4LSKn5/ilWtoxbgd0s
 N4/SjAu6STgD2/NWLGgO31uj214yusy3muioOR5OAwwqcD/qK4UvQNLxotpc0zm9WIeJ
 lTyg==
X-Gm-Message-State: AOAM5305MBO8W3RAUIV9o0yQ6EjOJAKq/IlAS2z38z7QIDBnaY45/px6
 lLOefOCISYDpDsDDX4u3i6M=
X-Received: by 2002:a50:f745:: with SMTP id j5mr384426edn.92.1610476559715;
 Tue, 12 Jan 2021 10:35:59 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id x16sm1526282ejb.38.2021.01.12.10.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:35:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 03/11] hw/ssi: imx_spi: Convert some debug printf()s to
 trace events
Date: Tue, 12 Jan 2021 19:35:21 +0100
Message-Id: <20210112183529.2011863-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+B1MI16ZTo3

Convert some DPRINTF() to trace events.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c    | 8 ++++----
 hw/ssi/trace-events | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 40f72c36b61..35ab33c0511 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -14,6 +14,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "trace.h"
 
 #ifndef DEBUG_IMX_SPI
 #define DEBUG_IMX_SPI 0
@@ -232,7 +233,7 @@ static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
 
-    DPRINTF("\n");
+    trace_imx_spi_reset();
 
     memset(s->regs, 0, sizeof(s->regs));
 
@@ -290,7 +291,7 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
         break;
     }
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx_spi_reg_name(index), value);
+    trace_imx_spi_read(index, imx_spi_reg_name(index), value);
 
     imx_spi_update_irq(s);
 
@@ -310,8 +311,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         return;
     }
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
-            (uint32_t)value);
+    trace_imx_spi_write(index, imx_spi_reg_name(index), value);
 
     change_mask = s->regs[index] ^ value;
 
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 612d3d6087a..20fcaf32df6 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -1,3 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
 # aspeed_smc.c
 
 aspeed_smc_flash_set_segment(int cs, uint64_t reg, uint64_t start, uint64_t end) "CS%d segreg=0x%"PRIx64" [ 0x%"PRIx64" - 0x%"PRIx64" ]"
@@ -10,6 +12,11 @@ aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_addr, uint
 aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
 aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
 
+# imx_spi.c
+imx_spi_reset(void) ""
+imx_spi_read(uint32_t index, const char *name, uint32_t value) "index:%u (%s) value:0x%08x"
+imx_spi_write(uint32_t index, const char *name, uint32_t value) "index:%u (%s) value:0x%08x"
+
 # npcm7xx_fiu.c
 
 npcm7xx_fiu_enter_reset(const char *id, int reset_type) "%s reset type: %d"
-- 
2.26.2

