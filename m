Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600878njk;
        Thu, 26 Dec 2024 00:25:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXI89kpv6+d0A4WFGUISdVgFLZa6ihbsoy04fTb/AYOzp/DFc6eQPo4Y6DipFKR2YNLGbSl1MrEWPG6oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH69bkzNfHH1Kof0rt4azCnszxRyIaZDgOh3XjpAnmmUNyxkTkxNv74Vs+uj4saLNkZeHj5
X-Received: by 2002:a05:620a:4093:b0:7b6:d237:abfa with SMTP id af79cd13be357-7b9bacb48f7mr3599373685a.21.1735201535310;
        Thu, 26 Dec 2024 00:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201535; cv=none;
        d=google.com; s=arc-20240605;
        b=RrPfePTMTkaCLLAPnPC3KDRwQ2TcWbiEyvNl4NkT5QrVKXftwhsmidyQU3bgpNfPD7
         pvYFlbdp2dXQG/05geMHtJLaL8E3U9mK8ieo85vjG4DXSQQXJGlvTzDBz8bHFdJ7pNCD
         VDvfJZGf0HQuVUqWPcri1iA4uGfzDCapuVG5tCfe0YPJ1E01J6DQfhTPGlv9iT4q88et
         OJZXLDZ4xDpVtsaClwJokI9m6/ocq3e/ySzXpNllt8zO2w0n2KP80agpaYu2wXuolI2b
         gEzQInI4LzW/2PtNDhjfBZX4Z3k+1BMumCZHw4oArlMdqXRSWdHq8wQbzuW4OWbdQa0B
         V3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=PC3/TomEsHn2pxO3IjMB1Y1E4z7z2FDcg8knqGv0i/0=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=gNReg/c+JawbSGDzNggwj/OcWd+5MHwYI3BqM36kkmWLvqdaVZJlkgpEGu+YSwPJoc
         AJjLOC9b2nYSSz87e77sUEJ/1sAVGt+rkJ7Hjg7UWSuI8+YQxBtBt9tCid1J9SRuTH+0
         kdFPFzvDvol06PtgxwB5/tl43Lvcxoxffa9SFTMcw7ZBoJXnsoVkfEW7l6EWB0eefSX1
         F2dKrICHG6N+fTZUIAzIiCe1SsKfsMYBb96Oj4DoCZQzqs757cLqTVpnTb3/H1X9s5S0
         6aoSDTXfEoJrg5vPeacOo76rooRUYH9e7JYhkiE82LRZVMf5fsyAFXVKkOCGduarP4FR
         NfkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SXDkLDJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2d0e78si1988448085a.166.2024.12.26.00.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:25:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SXDkLDJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjA1-00085C-CJ; Thu, 26 Dec 2024 03:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gxJtZwgKCJ4USF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9f-0007Xa-Q8
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:40 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gxJtZwgKCJ4USF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9a-0000Zr-LM
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:37 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ee8ced572eso7879030a91.0
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201411; x=1735806211; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PC3/TomEsHn2pxO3IjMB1Y1E4z7z2FDcg8knqGv0i/0=;
 b=SXDkLDJGmIClKo/2FatPFyeag6sMwL8PPMvUGfM5P6nlxPFLZlfvfyfDWbuVDgOA3T
 7FAh55KxzyViXIYJvye/bZLTJ7QLeomREA6DPICLV/lUpSthoRyTJtvUS7cUn4flaM96
 1hXnB7AkDwgFDRl194ankm9LuNNRn0+a0fJgCL3HQx1jNM+9NEQe+qNl76sTkkclEcIL
 nq9b0bLvldcHu/dKKzJmuGUkjIpS5OIy8qtRJKNQHdPypvtjS4ggBPxIU2+jIxKcv13F
 EX5j2FFpbHSu4q55UMZX8Sveo/ONbBwYntgxrVIiHmkBM9KmZxMGWXnzm1AZGPGnQWEK
 zR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201411; x=1735806211;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PC3/TomEsHn2pxO3IjMB1Y1E4z7z2FDcg8knqGv0i/0=;
 b=FKO5LJDUVDEcLgGAdTB3MjptwgkrmqP7HXoeyKimuMYj9BaJJJK2C0HHJarJc8szbV
 T8p95IypAGhmJPjzCidjTT+WMQSW7P/FAb/dfsnP81UYqSj7KkqRO05rxW6Hmk0fZNdq
 EgXxQ4pYBrLl2Mz/mEC/xxY5ptospP8h4vsvZogW/yyUL4YSN/cf1NfWqz596AQBUpY/
 SO9Cgma8myf8KMVtd5026n3mHm9rgHf+cAF+NP4MQ+ti0Gt5cA1mcg2BrSuXcnxXZ8am
 pGTYbFlyqIsD3VT7UFmk5fjkydbxOswAqKQlHOHZ4nYo3r4J54r4uwSEF2qw3KTGjmhj
 krJQ==
X-Gm-Message-State: AOJu0Yzea+QsISwcBwCBXvCBpcNTRmlvEaYzvaqYxmUi/9yyW/TxWH5b
 wqo7pCvhyxnBTSG2GyGaJWzGmzCCtv4WLYqSVqcepibpHc17euaWjS10Ni4TpYgCw4bGHEKK+0h
 3jc+Ibe/JkA==
X-Received: from pfd7.prod.google.com ([2002:a05:6a00:a807:b0:727:2d74:d385])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8085:b0:725:1de3:1c4a with SMTP id
 d2e1a72fcca58-72abdd3c159mr31419682b3a.3.1735201411367; 
 Thu, 26 Dec 2024 00:23:31 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:31 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-13-wuhaotsh@google.com>
Subject: [PATCH 12/17] hw/misc: Move NPCM7XX CLK to NPCM CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3gxJtZwgKCJ4USF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: BslwdeEhl6LT

A lot of NPCM7XX and NPCM8XX CLK modules share the same code,
this commit moves the NPCM7XX CLK to NPCM CLK for these
properties.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_clk.c         | 106 +++++++++++++++++++++----------------
 hw/misc/trace-events       |   6 +--
 include/hw/arm/npcm7xx.h   |   2 +-
 include/hw/misc/npcm_clk.h |  22 ++++----
 4 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 2bcb731099..0ecf0df3bb 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -198,7 +198,7 @@ static NPCM7xxClockPLL find_pll_by_reg(enum NPCM7xxCLKRegisters reg)
     }
 }
 
-static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_plls(NPCMCLKState *clk)
 {
     int i;
 
@@ -207,7 +207,7 @@ static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_sels(NPCMCLKState *clk)
 {
     int i;
 
@@ -216,7 +216,7 @@ static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_dividers(NPCMCLKState *clk)
 {
     int i;
 
@@ -225,7 +225,7 @@ static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_clocks(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_clocks(NPCMCLKState *clk)
 {
     clock_update_hz(clk->clkref, NPCM7XX_CLOCK_REF_HZ);
     npcm7xx_clk_update_all_plls(clk);
@@ -635,7 +635,7 @@ static void npcm7xx_clk_divider_init(Object *obj)
 }
 
 static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
-        NPCM7xxCLKState *clk, const PLLInitInfo *init_info)
+        NPCMCLKState *clk, const PLLInitInfo *init_info)
 {
     pll->name = init_info->name;
     pll->clk = clk;
@@ -647,7 +647,7 @@ static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
 }
 
 static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
-        NPCM7xxCLKState *clk, const SELInitInfo *init_info)
+        NPCMCLKState *clk, const SELInitInfo *init_info)
 {
     int input_size = init_info->input_size;
 
@@ -664,7 +664,7 @@ static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
 }
 
 static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
-        NPCM7xxCLKState *clk, const DividerInitInfo *init_info)
+        NPCMCLKState *clk, const DividerInitInfo *init_info)
 {
     div->name = init_info->name;
     div->clk = clk;
@@ -683,7 +683,7 @@ static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
     }
 }
 
-static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
+static Clock *npcm7xx_get_clock(NPCMCLKState *clk, ClockSrcType type,
         int index)
 {
     switch (type) {
@@ -700,7 +700,7 @@ static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
     }
 }
 
-static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
+static void npcm7xx_connect_clocks(NPCMCLKState *clk)
 {
     int i, j;
     Clock *src;
@@ -724,10 +724,10 @@ static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
     }
 }
 
-static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t npcm_clk_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxCLKState *s = opaque;
+    NPCMCLKState *s = opaque;
     int64_t now_ns;
     uint32_t value = 0;
 
@@ -766,19 +766,19 @@ static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
         break;
     };
 
-    trace_npcm7xx_clk_read(offset, value);
+    trace_npcm_clk_read(offset, value);
 
     return value;
 }
 
-static void npcm7xx_clk_write(void *opaque, hwaddr offset,
+static void npcm_clk_write(void *opaque, hwaddr offset,
                               uint64_t v, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxCLKState *s = opaque;
+    NPCMCLKState *s = opaque;
     uint32_t value = v;
 
-    trace_npcm7xx_clk_write(offset, value);
+    trace_npcm_clk_write(offset, value);
 
     if (reg >= NPCM7XX_CLK_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -842,7 +842,7 @@ static void npcm7xx_clk_write(void *opaque, hwaddr offset,
 static void npcm7xx_clk_perform_watchdog_reset(void *opaque, int n,
         int level)
 {
-    NPCM7xxCLKState *clk = NPCM7XX_CLK(opaque);
+    NPCMCLKState *clk = NPCM_CLK(opaque);
     uint32_t rcr;
 
     g_assert(n >= 0 && n <= NPCM7XX_NR_WATCHDOGS);
@@ -856,9 +856,9 @@ static void npcm7xx_clk_perform_watchdog_reset(void *opaque, int n,
     }
 }
 
-static const struct MemoryRegionOps npcm7xx_clk_ops = {
-    .read       = npcm7xx_clk_read,
-    .write      = npcm7xx_clk_write,
+static const struct MemoryRegionOps npcm_clk_ops = {
+    .read       = npcm_clk_read,
+    .write      = npcm_clk_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid      = {
         .min_access_size        = 4,
@@ -867,9 +867,9 @@ static const struct MemoryRegionOps npcm7xx_clk_ops = {
     },
 };
 
-static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
+static void npcm_clk_enter_reset(Object *obj, ResetType type)
 {
-    NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
+    NPCMCLKState *s = NPCM_CLK(obj);
 
     QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
 
@@ -882,7 +882,7 @@ static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
      */
 }
 
-static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
+static void npcm7xx_clk_init_clock_hierarchy(NPCMCLKState *s)
 {
     int i;
 
@@ -918,19 +918,19 @@ static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
     clock_update_hz(s->clkref, NPCM7XX_CLOCK_REF_HZ);
 }
 
-static void npcm7xx_clk_init(Object *obj)
+static void npcm_clk_init(Object *obj)
 {
-    NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
+    NPCMCLKState *s = NPCM_CLK(obj);
 
-    memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
-                          TYPE_NPCM7XX_CLK, 4 * KiB);
+    memory_region_init_io(&s->iomem, obj, &npcm_clk_ops, s,
+                          TYPE_NPCM_CLK, 4 * KiB);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
-static int npcm7xx_clk_post_load(void *opaque, int version_id)
+static int npcm_clk_post_load(void *opaque, int version_id)
 {
     if (version_id >= 1) {
-        NPCM7xxCLKState *clk = opaque;
+        NPCMCLKState *clk = opaque;
 
         npcm7xx_clk_update_all_clocks(clk);
     }
@@ -938,10 +938,10 @@ static int npcm7xx_clk_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static void npcm7xx_clk_realize(DeviceState *dev, Error **errp)
+static void npcm_clk_realize(DeviceState *dev, Error **errp)
 {
     int i;
-    NPCM7xxCLKState *s = NPCM7XX_CLK(dev);
+    NPCMCLKState *s = NPCM_CLK(dev);
 
     qdev_init_gpio_in_named(DEVICE(s), npcm7xx_clk_perform_watchdog_reset,
             NPCM7XX_WATCHDOG_RESET_GPIO_IN, NPCM7XX_NR_WATCHDOGS);
@@ -996,15 +996,15 @@ static const VMStateDescription vmstate_npcm7xx_clk_divider = {
     },
 };
 
-static const VMStateDescription vmstate_npcm7xx_clk = {
-    .name = "npcm7xx-clk",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .post_load = npcm7xx_clk_post_load,
+static const VMStateDescription vmstate_npcm_clk = {
+    .name = "npcm-clk",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .post_load = npcm_clk_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),
-        VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
-        VMSTATE_CLOCK(clkref, NPCM7xxCLKState),
+        VMSTATE_UINT32_ARRAY(regs, NPCMCLKState, NPCM_CLK_MAX_NR_REGS),
+        VMSTATE_INT64(ref_ns, NPCMCLKState),
+        VMSTATE_CLOCK(clkref, NPCMCLKState),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -1033,17 +1033,23 @@ static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_npcm7xx_clk_divider;
 }
 
-static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+static void npcm_clk_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM7XX_CLK_NR_REGS);
+    dc->vmsd = &vmstate_npcm_clk;
+    dc->realize = npcm_clk_realize;
+    rc->phases.enter = npcm_clk_enter_reset;
+}
+
+static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
+    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM_CLK_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END != NPCM7XX_CLK_NR_REGS);
     dc->desc = "NPCM7xx Clock Control Registers";
-    dc->vmsd = &vmstate_npcm7xx_clk;
-    dc->realize = npcm7xx_clk_realize;
-    rc->phases.enter = npcm7xx_clk_enter_reset;
 }
 
 static const TypeInfo npcm7xx_clk_pll_info = {
@@ -1070,11 +1076,18 @@ static const TypeInfo npcm7xx_clk_divider_info = {
     .class_init         = npcm7xx_clk_divider_class_init,
 };
 
+static const TypeInfo npcm_clk_info = {
+    .name               = TYPE_NPCM_CLK,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCMCLKState),
+    .instance_init      = npcm_clk_init,
+    .class_init         = npcm_clk_class_init,
+    .abstract           = true,
+};
+
 static const TypeInfo npcm7xx_clk_info = {
     .name               = TYPE_NPCM7XX_CLK,
-    .parent             = TYPE_SYS_BUS_DEVICE,
-    .instance_size      = sizeof(NPCM7xxCLKState),
-    .instance_init      = npcm7xx_clk_init,
+    .parent             = TYPE_NPCM_CLK,
     .class_init         = npcm7xx_clk_class_init,
 };
 
@@ -1083,6 +1096,7 @@ static void npcm7xx_clk_register_type(void)
     type_register_static(&npcm7xx_clk_pll_info);
     type_register_static(&npcm7xx_clk_sel_info);
     type_register_static(&npcm7xx_clk_divider_info);
+    type_register_static(&npcm_clk_info);
     type_register_static(&npcm7xx_clk_info);
 }
 type_init(npcm7xx_clk_register_type);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 59c2d4ecc0..6b313e4f88 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -130,9 +130,9 @@ mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, const char *name, uint64_t val) "reg=0x%"PRIx64 " [%s] val=0x%"PRIx64
 mos6522_read(uint64_t addr, const char *name, unsigned val) "reg=0x%"PRIx64 " [%s] val=0x%x"
 
-# npcm7xx_clk.c
-npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+# npcm_clk.c
+npcm_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm_gcr.c
 npcm_gcr_read(uint64_t offset, uint64_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index e80fd91f20..56536565b7 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -90,7 +90,7 @@ struct NPCM7xxState {
     MemoryRegion        *dram;
 
     NPCMGCRState        gcr;
-    NPCM7xxCLKState     clk;
+    NPCMCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
     NPCM7xxPWMState     pwm[NPCM7XX_NR_PWM_MODULES];
diff --git a/include/hw/misc/npcm_clk.h b/include/hw/misc/npcm_clk.h
index 0aef81e10c..db03b46a52 100644
--- a/include/hw/misc/npcm_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -20,11 +20,12 @@
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 
+#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
 /*
- * Number of registers in our device state structure. Don't change this without
- * incrementing the version_id in the vmstate.
+ * Number of maximum registers in NPCM device state structure. Don't change
+ * this without incrementing the version_id in the vmstate.
  */
-#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
+#define NPCM_CLK_MAX_NR_REGS            NPCM7XX_CLK_NR_REGS
 
 #define NPCM7XX_WATCHDOG_RESET_GPIO_IN "npcm7xx-clk-watchdog-reset-gpio-in"
 
@@ -80,7 +81,7 @@ typedef enum NPCM7xxClockDivider {
     NPCM7XX_CLOCK_NR_DIVIDERS,
 } NPCM7xxClockConverter;
 
-typedef struct NPCM7xxCLKState NPCM7xxCLKState;
+typedef struct NPCMCLKState NPCMCLKState;
 
 /**
  * struct NPCM7xxClockPLLState - A PLL module in CLK module.
@@ -94,7 +95,7 @@ typedef struct NPCM7xxClockPLLState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     Clock *clock_in;
     Clock *clock_out;
 
@@ -115,7 +116,7 @@ typedef struct NPCM7xxClockSELState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     uint8_t input_size;
     Clock *clock_in[NPCM7XX_CLK_SEL_MAX_INPUT];
     Clock *clock_out;
@@ -140,7 +141,7 @@ typedef struct NPCM7xxClockDividerState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     Clock *clock_in;
     Clock *clock_out;
 
@@ -155,7 +156,7 @@ typedef struct NPCM7xxClockDividerState {
     };
 } NPCM7xxClockDividerState;
 
-struct NPCM7xxCLKState {
+struct NPCMCLKState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -165,7 +166,7 @@ struct NPCM7xxCLKState {
     NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];
     NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS];
 
-    uint32_t regs[NPCM7XX_CLK_NR_REGS];
+    uint32_t regs[NPCM_CLK_MAX_NR_REGS];
 
     /* Time reference for SECCNT and CNTR25M, initialized by power on reset */
     int64_t ref_ns;
@@ -174,7 +175,8 @@ struct NPCM7xxCLKState {
     Clock *clkref;
 };
 
+#define TYPE_NPCM_CLK "npcm-clk"
+OBJECT_DECLARE_SIMPLE_TYPE(NPCMCLKState, NPCM_CLK)
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
 #endif /* NPCM_CLK_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

