Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1846400njb;
        Thu, 6 Feb 2025 14:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWJqmLTdKX3+qYPTzDLKML0XpRt3tDwJVWIXeec3Xsc/CaCTM3qdN29sgtxNgmizAryomLUYA2I72Zfg==@linaro.org
X-Google-Smtp-Source: AGHT+IGqILpIM4IJLtQsfWOJXboZ7L8uTXqOA6JzVPr/qrKBIgPlOYCy2EQtILY/j237ncQBbStj
X-Received: by 2002:a05:620a:410c:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7c047eb2f81mr96677985a.11.1738880067240;
        Thu, 06 Feb 2025 14:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738880067; cv=none;
        d=google.com; s=arc-20240605;
        b=WipP+gwOktSN/UqYTTEM2EKMeT8RlPiQG+pacpi9sJmFGdbAJ890OBsbfTYJINT1as
         /U2jQMywpAg7ulYu859XWyoRXQMQX5fmdtoN3vsTdSwPRBbbmFdHcRqsg3oVMu+3ENQI
         2nVL7H2IvxP6p4gMR70drpHYuBDbgaRNTFsB4Xi225LJQ/AWJZ0jslWVHHkrSQTpmvZi
         1wrVIC6HPnqcSPFD6CpEll0flZdzCFSwF4cxMBCkzwSTfJfZrbsJ3FpkGpSs0EIj2UKE
         88WOjyHxcIjeHbiTbgDEYwk3L4PcrMhU/Yx3SgJNYfkuiqOq3vqa3Q+GCdS802E7DP1M
         HnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=os2VRvm8dcEj0pbDL7mJZonO8xIs20XXxswKtdErcUY=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=aPfkusHF49vb99dpL1OAMjCCH6j1/rXsDFHAvdy2yxuP+Jl57X3G/IxH6/Zcy4RPTw
         ugNIw9onI5AK0IYwcrImBXhVNkv81QzFt2HI+qspLroyARt6sof1FshJo5VOYJopPv3U
         1QWA7tT9/so28jiDQwqRyJQjG7ZR0C/+KGnQsASoEEBiP62N16bR0htAFqTWipWZNJa7
         NGJTZRe92iK3tLS7JYGQa9hW/EQiHT9NWyVgjgXwiA8LmLsWTQCzczJ+CUH2X1IJ1C3h
         vjnxE9XQc1nPC7A7NDfe9NEtWW5/AXDui0GKbr2uojtGG+p/M0+IL1XNoUHZYJ3q41NS
         lldw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tISbMK+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb58a3si188314385a.426.2025.02.06.14.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tISbMK+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgA6z-0005wd-F8; Thu, 06 Feb 2025 17:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yzOlZwgKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6p-0005m3-Li
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:31 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yzOlZwgKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6n-0001Ts-Gd
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:31 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fa0204ad21so2750229a91.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 14:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879947; x=1739484747; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=os2VRvm8dcEj0pbDL7mJZonO8xIs20XXxswKtdErcUY=;
 b=tISbMK+xkOtri6kJ6ucMc0MnlJhXD5P2j7z1wGVqq4mgFFuVHYMdrQgqvLaskd6jf4
 PcUwkX1DLcLgHjMGcsrh5JIZOZtwUUGmBExeTiX3ZqKpdLZcmkx6y8A4DJPinMYDW43L
 oUjYhKRCVTfLBdzC+JXLp//3USSOccKINT72Z0/lIzsrikgi21A4soFhu9QzwS/GLroK
 ek5u5EeOuIa5ZZHR8l6yvWPOOMzWpD6qlrT7Mb2/5WjoEV17fQG2GCw6w4Wz4Ge1iMEC
 EA0H+qxOmiZO9HhoDWN9TDXnkppy1KdVkCbeL6rNu2KPWtkawZ5To4mII8HXFk3ljIfm
 nb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879947; x=1739484747;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=os2VRvm8dcEj0pbDL7mJZonO8xIs20XXxswKtdErcUY=;
 b=TgOmbLtD03TTmdM14Z4LTTVsWYO7r1Z2icnSbNqsy2fTfh1DSVqTEVR9VAgyriVX0U
 HzXWjIG3bhSNLecBmSRsY7jaj3NhORhMEjS1CmNzAtyZvbzaByKhdPuQBiLKYgJoCuRg
 qmUa6WtUg5TKVl1KzXXylUX6GO5lK/kksgb++RLctlUjXeeMkLC7lZruPnUyaWyG31Cc
 7UPCiAWU9nSe822qfd+YqRrD9HfZVldJ6QBYsvVJ5mkpEUJ5L9E11U1QbtWyvYlrarBK
 79lVCgzSV59oCQT7gcgr+d8Mp+7eg/6rr4Iq+cnD/yzmf4BO4hk4fsRoPsc9d/jsrOJg
 2USA==
X-Gm-Message-State: AOJu0YxJnyOmph5ekYMFUhcUNVHB5psEQHwvs73If8h+JB+06yZsGC42
 kLsiAnwwwvEgmR1ad40zNOZ8oJb6n3xfgmPQ8FjQFhxFmfgpckuHtuj/que+K36PZbPbaZZN5Yc
 /5RtWXC4noA==
X-Received: from pjbmn8.prod.google.com ([2002:a17:90b:1888:b0:2ef:7af4:5e8e])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:38c3:b0:2f7:e201:a8cc with SMTP id
 98e67ed59e1d1-2fa2416703fmr1299033a91.18.1738879947306; 
 Thu, 06 Feb 2025 14:12:27 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:58 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-13-wuhaotsh@google.com>
Subject: [PATCH v4 12/17] hw/misc: Add nr_regs and cold_reset_values to NPCM
 CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3yzOlZwgKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 4jeVaABntSC3

These 2 values are different between NPCM7XX and NPCM8XX
CLKs. So we add them to the class and assign different values
to them.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_clk.c         | 18 ++++++++++++------
 hw/misc/npcm_gcr.c         |  2 ++
 include/hw/misc/npcm_clk.h |  9 ++++++++-
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 0ecf0df3bb..78144b14e3 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -81,7 +81,7 @@ enum NPCM7xxCLKRegisters {
  * All are loaded on power-up reset. CLKENx and SWRSTR should also be loaded on
  * core domain reset, but this reset type is not yet supported by QEMU.
  */
-static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
+static const uint32_t npcm7xx_cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
     [NPCM7XX_CLK_CLKEN1]        = 0xffffffff,
     [NPCM7XX_CLK_CLKSEL]        = 0x004aaaaa,
     [NPCM7XX_CLK_CLKDIV1]       = 0x5413f855,
@@ -728,10 +728,11 @@ static uint64_t npcm_clk_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMCLKState *s = opaque;
+    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
     int64_t now_ns;
     uint32_t value = 0;
 
-    if (reg >= NPCM7XX_CLK_NR_REGS) {
+    if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
                       __func__, offset);
@@ -776,11 +777,12 @@ static void npcm_clk_write(void *opaque, hwaddr offset,
 {
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMCLKState *s = opaque;
+    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
     uint32_t value = v;
 
     trace_npcm_clk_write(offset, value);
 
-    if (reg >= NPCM7XX_CLK_NR_REGS) {
+    if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
                       __func__, offset);
@@ -870,10 +872,10 @@ static const struct MemoryRegionOps npcm_clk_ops = {
 static void npcm_clk_enter_reset(Object *obj, ResetType type)
 {
     NPCMCLKState *s = NPCM_CLK(obj);
+    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
 
-    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
-
-    memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
+    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
+    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
     s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     npcm7xx_clk_update_all_clocks(s);
     /*
@@ -1045,11 +1047,14 @@ static void npcm_clk_class_init(ObjectClass *klass, void *data)
 
 static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
 {
+    NPCMCLKClass *c = NPCM_CLK_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM_CLK_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END != NPCM7XX_CLK_NR_REGS);
     dc->desc = "NPCM7xx Clock Control Registers";
+    c->nr_regs = NPCM7XX_CLK_NR_REGS;
+    c->cold_reset_values = npcm7xx_cold_reset_values;
 }
 
 static const TypeInfo npcm7xx_clk_pll_info = {
@@ -1081,6 +1086,7 @@ static const TypeInfo npcm_clk_info = {
     .parent             = TYPE_SYS_BUS_DEVICE,
     .instance_size      = sizeof(NPCMCLKState),
     .instance_init      = npcm_clk_init,
+    .class_size         = sizeof(NPCMCLKClass),
     .class_init         = npcm_clk_class_init,
     .abstract           = true,
 };
diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index d644d7ddd5..5930a88f28 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -215,6 +215,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
         break;
 
     case 8:
+        g_assert(!(reg & 1));
         value = deposit64(s->regs[reg], 32, 32, s->regs[reg + 1]);
         break;
 
@@ -270,6 +271,7 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
         break;
 
     case 8:
+        g_assert(!(reg & 1));
         s->regs[reg] = value;
         s->regs[reg + 1] = extract64(v, 32, 32);
         break;
diff --git a/include/hw/misc/npcm_clk.h b/include/hw/misc/npcm_clk.h
index db03b46a52..f47614ac8d 100644
--- a/include/hw/misc/npcm_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -175,8 +175,15 @@ struct NPCMCLKState {
     Clock *clkref;
 };
 
+typedef struct NPCMCLKClass {
+    SysBusDeviceClass parent;
+
+    size_t nr_regs;
+    const uint32_t *cold_reset_values;
+} NPCMCLKClass;
+
 #define TYPE_NPCM_CLK "npcm-clk"
-OBJECT_DECLARE_SIMPLE_TYPE(NPCMCLKState, NPCM_CLK)
+OBJECT_DECLARE_TYPE(NPCMCLKState, NPCMCLKClass, NPCM_CLK)
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
 
 #endif /* NPCM_CLK_H */
-- 
2.48.1.502.g6dc24dfdaf-goog

