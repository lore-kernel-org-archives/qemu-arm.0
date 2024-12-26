Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600802njk;
        Thu, 26 Dec 2024 00:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8NInk0EhZ2P9/ZTrmxpwezkbw78QERLtRdAd55KQXCKKlHuFRMjWfhnXepQ1XRBcoTvnncSShTTWF7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGUCdBxfieZ+8aq7eMOsQm/L2iT8B/NGoYihZn6iUVemO0cKU856PLneeA8wsfO6XyscTeI
X-Received: by 2002:a05:620a:4688:b0:7b6:eab3:cdd0 with SMTP id af79cd13be357-7b9ba838e31mr3440173785a.59.1735201520137;
        Thu, 26 Dec 2024 00:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201520; cv=none;
        d=google.com; s=arc-20240605;
        b=Jn5OwfBotTNzf7KO/8EHBJyGfbQgz5O9r4O0D10xzM0UUlQhq0TVYsN6rc2J1MrBHM
         WZY/LlknuqThlX0qvwMWfw+72i3Rn462UZ4lB4LEwT9QeEWYtAjdc8/qs+lB9iW3ev/c
         scLeLGP4gykKtLOC+eU5NpjdCgqudBFvWgqFIHlAmtXm6g3AjSLBy1jgMsJNGDNo+2Ss
         JCsS/+fmx8oLVTX0njx2fZCm3zjpeFSp1Yv/31rvCOaRE0HuuhbJU6AIQULNA24FrVEI
         65TlnFHjw3f2AFoiPXEL5BbIwJIBV0FAUSMLBc+TlKfVJyNPQJvp+0rNpOa4WkL7munk
         eaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=k4u/9gSVz2MVxn+R64fReVF7CJDiEd4230//HddnLDzPxmY+/b+QbUfoD1XnJIVbmK
         fzVC58m9hO7UpbX+aIzUl9/S0dw3SmmOJfjAlrsoDc5YRGTrWXtWBiFT05rtecwimhnm
         A5uYnt/bqovhYSGj4sSKHP5AyddASNyCt+ysmHQjpYlD9zuN3BJXnwoHYFqH5LHxo66j
         1j2o0gddBRmD84OQ1Aicv43DjTh2whCQlqexnabw7mK04DbnNIEkW+ctth941GYWaKCK
         2e9eLVBMYBFYTIO99mCv/FyJQwGiRzUsxqwT5zGx5F9VZmCqrLfJA1vvbrUguBZyX9TE
         uJHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=P8Mu1agR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2d117esi1964580085a.188.2024.12.26.00.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=P8Mu1agR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjA4-0008Fg-5Y; Thu, 26 Dec 2024 03:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hhJtZwgKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9j-0007Yp-Tr
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:44 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hhJtZwgKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9f-0000aF-C3
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:41 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2163c2f32fdso125129085ad.2
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201415; x=1735806215; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
 b=P8Mu1agRco17Kl3kP4k08yolLZSTorz7qnm1/JZvmKr2mWnzyH0QA3pkXBkvzVROed
 ajlDy+ql9YTPQpUL7pdTSCfiAvbrtdV5+ncTqRDECHJMfeHlBDTg9vZt+TJmVxVvvwCX
 kauZlSBLUq0ION+KQoMrczGCHlntSEuyz+I09X+HvdE3w5OrC+6bUVDudju3jGb5zTdz
 SQJytnDVK1jzZ+YUlGGFa7+1//SboyRENq2uPLoODHT/45tbCw8ZprpMHPgHJj+PH5GQ
 2QL0wN27/bLfvHFBWJEoN/nO7NDnLpufd/4UcxcqkNUOyF+WoJ55yyrRNNxiwD985GHq
 Vgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201415; x=1735806215;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSqBtRF4XTytwLiQf1Tk6i2T92wgV1efOniSzvWdnQk=;
 b=BNEm1enqnnFyI1HOvTS81s1/Lz/bNTOgpPV2Zgxk33VoQkhkmlQ20HW9XvLXjEdGiE
 0Qjtt9e4NK8+t/FIp9EVv5OeULl5/mx98qGWmIrxrsdVG1JKFCg6mqz6mnyHtGvdDLLT
 Mn4E5yWG7i5X3PppqQgY/V3dX/9v+eFD/JGUCFJUxcyb5rQCiZtQs185y1ypfLFAr0nn
 r2mBnpLoe18v2hCkmqc0MgUpF77X9ObsjVbndmyXSJuXOmCDPHH99L6ryZ0M8LR4xtpU
 OL2j0atAb0PZwwJHldSCgfKy64WmgKQcLOCs65Nnd4QaIPg6cXvRNuSrW9utTmI5idVM
 rrCA==
X-Gm-Message-State: AOJu0Yz3EkPEczXhv+AuAjMUFQZUhgIs13Po1xxguSJPHdBG+YHlnP4R
 RyhoLX7BxQmnQWX5UBiufT3F8MLaUGtzGI7wFGz+lj0WSbT/bv34Mp682JOvNzVqw+wTXIUbxba
 TWDzN24cnZQ==
X-Received: from pgnp25.prod.google.com ([2002:a63:7f59:0:b0:7fd:4e21:2f56])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2449:b0:215:3a42:dc17 with SMTP id
 d9443c01a7336-219e6e8bbabmr280278025ad.7.1735201414765; 
 Thu, 26 Dec 2024 00:23:34 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:32 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-14-wuhaotsh@google.com>
Subject: [PATCH 13/17] hw/misc: Add nr_regs and cold_reset_values to NPCM CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3hhJtZwgKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
X-TUID: cIHvBATHRNmV

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

