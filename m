Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5602232njk;
        Thu, 26 Dec 2024 00:29:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUICDAeBnfRn1CRwdua+xOrwTvqVhrLZoygSFeOEPYncnatyoO8LHluSGcymnG0odiC+Gj/5W1qZPUgDw==@linaro.org
X-Google-Smtp-Source: AGHT+IHlAPIMVE4vncihCEySjkKqzHZok/zxN0GVjdqSiOs6UveSctzJl36CIso9j9Mt8Wd+6/KG
X-Received: by 2002:a05:6214:509e:b0:6d8:9815:92e2 with SMTP id 6a1803df08f44-6dd2332c084mr306523446d6.15.1735201794743;
        Thu, 26 Dec 2024 00:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201794; cv=none;
        d=google.com; s=arc-20240605;
        b=PxqqRcABMNpyRGplyT8IJw5PeOHa0YuIW0YGY2Ct/lV4kZSTj4YdUltPAW3xodFnED
         gEaQdi6SvCpC59uIZ+KOCCo5t8HNJBYtIGDpIOAbgDAcFI9wsxGF7BWDXOfDRMPZhyw0
         yIdPXARiJw0nxSb0Gg38If8Qx0H+maritFg35AsCIwhXlmyzHdfi8j0bVEWdAgbXxg89
         JTkV+uXlp0aHtJxbOx6nrTi/8z8IRALZbKunn7xPfnCzURiH3dvoUsrFBR6zqzj79hiA
         T/MbiKZY8Hi04qqorycblXQKzgNe6pqfXZzd4lDNx3eMpn2SAxWgLvc4xJk5dllUew8F
         KrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=iK51l4j6+Uf8yvsmcmXFNvXnGCWu0m0u5xB4PAPemkYSlPO/6Ni3RxxdqwVkuU7/3K
         pS85pguRVD5O5gZT8q7C+HBkvCNRz7tCS1Aut5OYNQQQZpdR+8JJg1Sk6lU6slDFg718
         2jvdf/oyqh9E3+bxu4SwjmB3++E8Vjsbq0WS5HrTps+fm5+4WhlSxBQYATc1JO2+IrMY
         rsnYZZ2+glMQ4A8YTOeGLtisQEo2xCRXSiJTZGxwAfAKK3asJW32LQXTqSkTd59gfLU6
         1e07p4ewqSCDTMWd2PO1178LpW8qS8CJx4jDjkKuTNRC7cbIYTj4mWXVOFk599gtMXjf
         C5aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yZf0TG4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18366a3dsi169443226d6.484.2024.12.26.00.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:29:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yZf0TG4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjEw-0005au-2n; Thu, 26 Dec 2024 03:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3whNtZwgKCN8XVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEk-00057v-9s
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:56 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3whNtZwgKCN8XVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEi-0001G4-8u
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:53 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21632eacb31so57297885ad.0
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201730; x=1735806530; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
 b=yZf0TG4VnbBeVUXFjLUkN+2beiMGBtS5SwUd5bgGQ9uvoFltvVJWw25XHMaFLqqBUG
 rsi0jebXNxD0hywPMT00sBHbeyXSTR5aHiUlmS6AIoypnfZhdJLk008C0n9DKSEQYyha
 PdrIN1hNJ40eIdCte0pU/UbvLvJGBvl2vMZYBJaOBo06la8WMqKgg8jOARHSI5GKxde5
 swXUCOqhX7VO8O8EjFxmNXcnhCC4Xk6NGl9nZG/6BRF7pePqAQZM5Ku9dhgW/rPyUmMq
 v3djS47B8ZnWj97FpQdR5bMhswi8HHbc70UIsSf/Y0FpCi7+rGWIUoJfS5HbIEXdYf9p
 pxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201730; x=1735806530;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
 b=FqyIUltDM9Y+NtZ+4drROJFG/6UVGsCtDKwbAPonCKYrPvsAMaII4DNYfga9gubk/y
 USrQgyXu36gPbhsSGm4q1XM9pP/nDO7CTV3k58D9pzg14YqrxYY+88oznguI2fQMHVLV
 oCOsoG1AbMZlWEMCEgMyjqdRmVGt+y6VaIZ4O5q0ExWjqllPn4YptO++q0h/8B21CIto
 UJBKIrasRLfxFl4HoApoI8YKc0KaoG9b5hBBtCMXpdPMAOf0MFsyKYVfWad86IVYVvDh
 9nsad5kmn8QGINTidmLWjMUyzwMMKegQOyjJYhoxYefdPpTHMiXYpitNQ3L1eG8HbOZy
 HVpQ==
X-Gm-Message-State: AOJu0YwQpuS81hK3AcoK9WlCnh3ekmLk1SfF4rusxeN3rqq6xdRWgaI/
 /FGTGP4YSSmt6n4ArQebSn1l4hy678cT5LnbdJLJKH7covyJfUKsU9v432tjVFovQZUsUeGp+cz
 kKesUGTm7Bw==
X-Received: from pgtq9.prod.google.com ([2002:a65:6849:0:b0:845:b983:9e34])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:946:b0:216:3e9a:89e with SMTP id
 d9443c01a7336-219e6f2e9dfmr352474315ad.35.1735201730595; 
 Thu, 26 Dec 2024 00:28:50 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:56 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-14-wuhaotsh@google.com>
Subject: [PATCH v2 13/17] hw/misc: Add nr_regs and cold_reset_values to NPCM
 CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3whNtZwgKCN8XVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
X-TUID: r7NcJ++QJGvg

These 2 values are different between NPCM7XX and NPCM8XX
CLKs. So we add them to the class and assign different values
to them.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_clk.c         | 17 +++++++++++------
 include/hw/misc/npcm_clk.h |  9 ++++++++-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 0ecf0df3bb..eee754d31f 100644
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
@@ -870,10 +872,9 @@ static const struct MemoryRegionOps npcm_clk_ops = {
 static void npcm_clk_enter_reset(Object *obj, ResetType type)
 {
     NPCMCLKState *s = NPCM_CLK(obj);
+    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
 
-    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
-
-    memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
+    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
     s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     npcm7xx_clk_update_all_clocks(s);
     /*
@@ -1045,11 +1046,14 @@ static void npcm_clk_class_init(ObjectClass *klass, void *data)
 
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
@@ -1081,6 +1085,7 @@ static const TypeInfo npcm_clk_info = {
     .parent             = TYPE_SYS_BUS_DEVICE,
     .instance_size      = sizeof(NPCMCLKState),
     .instance_init      = npcm_clk_init,
+    .class_size         = sizeof(NPCMCLKClass),
     .class_init         = npcm_clk_class_init,
     .abstract           = true,
 };
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
2.47.1.613.gc27f4b7a9f-goog

