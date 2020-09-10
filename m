Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1060000lfq;
        Thu, 10 Sep 2020 00:01:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy00fyW+CMC7/kBU/fnVcX/0xxt3qzOGwm7/W8nsCT00ketS+Mr2AQ3Pbp2eEvrYWlMtZR9
X-Received: by 2002:a50:f687:: with SMTP id d7mr8080730edn.353.1599721304064;
        Thu, 10 Sep 2020 00:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721304; cv=none;
        d=google.com; s=arc-20160816;
        b=dSpIE6ivjlTZqY8KwDgs3hFCaHJp14W/vTB2/UyNmjZHqnW6Q3JBJTXTR3U2p0V/XO
         U/pThH6E4dOjGo7Nj6Up6hCT5e4GjvHOTLTBTtbV9vNADBzp8I1cV/YrQwcjgCIxZAqW
         9rHgK+P35u6QN8E2UQPDbYxDLJ+nLVF/BmPVES0QjKsuOZ5CPAn9tCzSH1tKSOB6a+Kc
         SG2uIY3Zuocl3pu0SjB/2WdWfkBO0Ir/y93UyPOC2YIMdyV7vQW0Sx5/VhmSVZry8v6h
         SD2toiAjM4DywMqcVRkOVij/ZPHDY2DehevL+BzETPG1Q+mI9531JtZiYm0pXGTu7Sym
         TalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3LVq3GBMxvuW5ThC5No6G6me9ou9dAQJhQkLuf9vMHg=;
        b=SIRTtbdjLuy4mJmcYaO54zmLl0foDtxD3CoXEqVI5yexLy2y4AalxEnFA9GGReApOw
         jLMR+lQQjj6xWg+zt6qM5L+Me6ry1+oX0ob2l4FH/TN+LwoOGDx+ORdsN0nXb/zVXPsq
         TbZUtBnFOpEyG6gOHKucO3mfsuVz0Xm95M7G36GTcJjoh6KPIJal5avqSsOGKpRbYiPL
         gla6W5akV2D0wOYvcqUpztQe1tPpZ0ndWAD4okBkyrr9SoQDmMIaLpejTaNU9DVb58S1
         0oK1fHShnZHN9vsyXmUe/ZRAHRgNQ9iro/PMCOt/CV26jnKFdVGuES8pazHBbhzRWDLy
         If/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kna6C9SL;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id v24si2950804eju.655.2020.09.10.00.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kna6C9SL;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3LVq3GBMxvuW5ThC5No6G6me9ou9dAQJhQkLuf9vMHg=;
	b=Kna6C9SLL8kP0KHVgat50x7ub/fWQYKQ6eXubxX8H9gmiCYuKwEDqaGCQqn/mRCikX3/rl
	vsnTFv8tS4jLA5wsRFxW9wZhcU4iokm7Yy/uc3L72AERIoGJ7/bCC/YzMAPoBxbyQa6rkU
	bu72t5IjBlltwdrR4b2ZAXUhQWMUZ8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-J26QiKOaMi-yd-lRXZoLOA-1; Thu, 10 Sep 2020 03:01:41 -0400
X-MC-Unique: J26QiKOaMi-yd-lRXZoLOA-1
Received: by mail-wm1-f70.google.com with SMTP id w3so1302144wmg.4
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LVq3GBMxvuW5ThC5No6G6me9ou9dAQJhQkLuf9vMHg=;
        b=j1w8JTTE9MeRCI71eikRurPcerDi7zi0Y3/HESizhjkwKuoCwNC8uy1YYQx3lhPINd
         v/txC7EZo77EJUFMnfLO4g7LaTbdCILHaeW5IXJI47HrXH2rMY3vATAw1BgRiS4Yzxgq
         2aH4dUd5pCDLZxK4QeXGTyaV7w/shfzfZ8GnWdpnG1do+11/A8loioAXPVGk/Q7+JVf7
         r8haCwLvFFscGydg2byRRUjAYriX85QTn+AYpzVZGAZoE0LqeCuaWCOCfm3EGb4H2+bT
         g6sBz3RYaouvpKDtWG5DNY/UNyxRdF8DMp0D/anVeHNT3hN5icLG33jzqueVcJrI9TvM
         M3XQ==
X-Gm-Message-State: AOAM530bpaAAtAqPVGS9ptQZ398kV7LYsy4yz29Jdq8tyRXk1NYFwZzB
	p6ZhHPqRA2y8fY3pfVscr5WS/u/ymB+WbAWInHwwrFn/X9l0ImcILXg4KB1+qtKF/4n2Vm2PvHG
	LrBr6v8wrAx3jd6CP
X-Received: by 2002:a7b:c182:: with SMTP id y2mr6733467wmi.21.1599721299921;
        Thu, 10 Sep 2020 00:01:39 -0700 (PDT)
X-Received: by 2002:a7b:c182:: with SMTP id y2mr6733445wmi.21.1599721299694;
        Thu, 10 Sep 2020 00:01:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id o124sm2127336wmb.2.2020.09.10.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:01:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/6] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
Date: Thu, 10 Sep 2020 09:01:26 +0200
Message-Id: <20200910070131.435543-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 02IW4qdqqHcN

In order to use inclusive terminology, rename max_slaves
as max_devices.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 40 ++++++++++++++++++-------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6fbbb238f15..52ae34e38d1 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -42,7 +42,7 @@ typedef struct AspeedSMCController {
     uint8_t r_timings;
     uint8_t nregs_timings;
     uint8_t conf_enable_w0;
-    uint8_t max_slaves;
+    uint8_t max_devices;
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 795784e5f36..8219272016c 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -259,7 +259,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 1,
+        .max_devices       = 1,
         .segments          = aspeed_segments_legacy,
         .flash_window_base = ASPEED_SOC_SMC_FLASH_BASE,
         .flash_window_size = 0x6000000,
@@ -275,7 +275,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 5,
+        .max_devices       = 5,
         .segments          = aspeed_segments_fmc,
         .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -293,7 +293,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_SPI_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = SPI_CONF_ENABLE_W0,
-        .max_slaves        = 1,
+        .max_devices       = 1,
         .segments          = aspeed_segments_spi,
         .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -309,7 +309,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 3,
+        .max_devices       = 3,
         .segments          = aspeed_segments_ast2500_fmc,
         .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -327,7 +327,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 2,
+        .max_devices       = 2,
         .segments          = aspeed_segments_ast2500_spi1,
         .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size = 0x8000000,
@@ -343,7 +343,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 2,
+        .max_devices       = 2,
         .segments          = aspeed_segments_ast2500_spi2,
         .flash_window_base = ASPEED_SOC_SPI2_FLASH_BASE,
         .flash_window_size = 0x8000000,
@@ -359,7 +359,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 3,
+        .max_devices       = 3,
         .segments          = aspeed_segments_ast2600_fmc,
         .flash_window_base = ASPEED26_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -377,7 +377,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 2,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 2,
+        .max_devices       = 2,
         .segments          = aspeed_segments_ast2600_spi1,
         .flash_window_base = ASPEED26_SOC_SPI_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -395,7 +395,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 3,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 3,
+        .max_devices       = 3,
         .segments          = aspeed_segments_ast2600_spi2,
         .flash_window_base = ASPEED26_SOC_SPI2_FLASH_BASE,
         .flash_window_size = 0x10000000,
@@ -476,7 +476,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
     AspeedSegments seg;
     int i;
 
-    for (i = 0; i < s->ctrl->max_slaves; i++) {
+    for (i = 0; i < s->ctrl->max_devices; i++) {
         if (i == cs) {
             continue;
         }
@@ -537,7 +537,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
      */
     if ((s->ctrl->segments == aspeed_segments_ast2500_spi1 ||
          s->ctrl->segments == aspeed_segments_ast2500_spi2) &&
-        cs == s->ctrl->max_slaves &&
+        cs == s->ctrl->max_devices &&
         seg.addr + seg.size != s->ctrl->segments[cs].addr +
         s->ctrl->segments[cs].size) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -948,7 +948,7 @@ static void aspeed_smc_reset(DeviceState *d)
     }
 
     /* setup the default segment register values and regions for all */
-    for (i = 0; i < s->ctrl->max_slaves; ++i) {
+    for (i = 0; i < s->ctrl->max_devices; ++i) {
         aspeed_smc_flash_set_segment_region(s, i,
                     s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
     }
@@ -995,8 +995,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) ||
         (s->ctrl->has_dma && addr == R_DMA_LEN) ||
         (s->ctrl->has_dma && addr == R_DMA_CHECKSUM) ||
-        (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slaves) ||
-        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves)) {
+        (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_devices) ||
+        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_devices)) {
 
         trace_aspeed_smc_read(addr, size, s->regs[addr]);
 
@@ -1270,7 +1270,7 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
         int cs = addr - s->r_ctrl0;
         aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
     } else if (addr >= R_SEG_ADDR0 &&
-               addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
+               addr < R_SEG_ADDR0 + s->ctrl->max_devices) {
         int cs = addr - R_SEG_ADDR0;
 
         if (value != s->regs[R_SEG_ADDR0 + cs]) {
@@ -1341,10 +1341,10 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     s->conf_enable_w0 = s->ctrl->conf_enable_w0;
 
     /* Enforce some real HW limits */
-    if (s->num_cs > s->ctrl->max_slaves) {
+    if (s->num_cs > s->ctrl->max_devices) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
-                      __func__, s->ctrl->max_slaves);
-        s->num_cs = s->ctrl->max_slaves;
+                      __func__, s->ctrl->max_devices);
+        s->num_cs = s->ctrl->max_devices;
     }
 
     /* DMA irq. Keep it first for the initialization in the SoC */
@@ -1376,7 +1376,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
                           s->ctrl->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash);
 
-    s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_slaves);
+    s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_devices);
 
     /*
      * Let's create a sub memory region for each possible slave. All
@@ -1385,7 +1385,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * module behind to handle the memory accesses. This depends on
      * the board configuration.
      */
-    for (i = 0; i < s->ctrl->max_slaves; ++i) {
+    for (i = 0; i < s->ctrl->max_devices; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
         snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
-- 
2.26.2
