Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp669873dlb;
        Wed, 5 Feb 2025 17:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUz6B4vD8KqNcwE+0ioW5i7cUGNugQ87pANUDJr9btt2uGLArvd8KHlW7jlupRfq4Yj9bKwc5fuYLA2AA==@linaro.org
X-Google-Smtp-Source: AGHT+IGZUwku/LQRCyQ8EYlKOH3rdM2COwIoeFzWTIY4ogpBC6blKKq39yMf/jxWZ//iQty2nbWv
X-Received: by 2002:a05:620a:25c6:b0:7b6:f143:44e3 with SMTP id af79cd13be357-7c039ff4f48mr705974785a.32.1738805762222;
        Wed, 05 Feb 2025 17:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805762; cv=none;
        d=google.com; s=arc-20240605;
        b=EkO9zChJSLy4IlXMmJTXLI1wGAkdBgRVcR+Y0oGSs3PoEV8PA6frkxfR2so0UoMe8L
         K9oenWtvrwzYwYEPTdN3EC8k8shbCG/RLSVRccR84gN/yfbi9G3nBJuXSy12zzH3qWek
         esoXYG0qz11nVmbEG94WIAQSGh9jt02FkaftKE7qIPtkIbZfm5Xyl5tGb1yanW0jInJZ
         xEVePfCrkBx/tVYSuRlPYB7d0qHkXqcIyQS3cIcYtbU2Ow6We1Y+dA5jWymFk50EyEhR
         Cf1P37sNzTu3+W7/aFS6OIO88I2yJgiASmEvxQyi/tX7FN1giiyublIvRCb1+W6gg0al
         T2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=oBetUZa1VIuwY/hQFvT1H//eRdbda2Y81ohbyoRG5Cw=;
        fh=ZITWRJo3u7z2sj4CP7djukVWvbVPBYYi8TcarXgkfBY=;
        b=WZDxKFBH/qhAxwkj2KjSHs/cPxKys4mGuxCmnG3BmXwwXLRCf2M8u3ia303wz6hISq
         g5ynxKp6ILzbsbl/wSG2LCvXZiTkARluVOxKBVM+C3arklYM74vD/gIHSj2d+LMtJb+B
         8gOCmrC9RpHcDnyAkv/Vz/Ncztn/BT/NaM9VQLI8qaQPtKMm+xXRyX1CoK1iqIsEZL6N
         L+81A2iGjD6/sOlFEAQdmgnWdJAED41AVsedGvLMPaVn6L5adjTyNWPRdXjWlHHN7nu2
         ncp9yPlACNxE+uARciAQn+EimKePfDVIfRcpZyv+LBjss+AzPjQo/tHG0LI3WF71T1ZU
         +y6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="v/mVq8/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed5a53si21634385a.535.2025.02.05.17.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="v/mVq8/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfqkX-0005O3-Ad; Wed, 05 Feb 2025 20:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38hCkZwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1tfqk1-0005Dv-2l
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:42 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38hCkZwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjy-0006vY-1Z
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:40 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f9ee46968cso654927a91.3
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2025 17:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805490; x=1739410290; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oBetUZa1VIuwY/hQFvT1H//eRdbda2Y81ohbyoRG5Cw=;
 b=v/mVq8/GKw3HkgRGlcLyHrmkFjssL8bloYeFxGc5gpRJJLJ452b9bi42xR0mWa/uG/
 KlhfDOF2QvGY61QdtC3kuIeJLHjTI3lBsF4X8aynD2R7x1lQP/uxW9g2XxChsqlWqH3l
 6yTt0oBbGUpJHcNQ0jm8NCbqR+WxClMpYb/P+JTIe5re+PcPz090DGmjmahXbAMlzE2A
 b4twPep5yPFms6945IeLiYH8Sn1yUAgz3TAD/Y3YU00DBBO+6JoYtIEtVZrV0NgU+m5X
 rVM2/Z0BsY3zsvMNL0mQwEaPn3Xhb1erx0ntVS2AqIgNeN2ATq6RqwthpzoRZtSpLk1d
 A7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805490; x=1739410290;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBetUZa1VIuwY/hQFvT1H//eRdbda2Y81ohbyoRG5Cw=;
 b=haayfQsftIbBU8zzM4AwaMTA6ChbHLgbYFBLQ8Ea0rWmjoETuTzvTVczxkMq18vAEv
 z/DR40Zo6k4TBVbRt24y56Wddt7VnlZmaTCOGL15tNdEoq/LoIJFJ2lHIXfsLDr+3huC
 2ZwwdFDCSMJS4lFQsVwjdy5oKWAY8BNG8vBkz3FlhV1TX8c5WGU4yuFHzC8+kz4O47Hb
 BnqGD0i5GV0fr8CwIEJghZk9sdB1mrCXxEtcRk/ceQMi3kknkY7uzbtF7/vWh0oHRIGu
 PFjtYUBxdUntsJ1N9PCiuN447T945XK7kkLFYZvbI+agQ8eCH137QfCeka/qsBc1tdd8
 7WGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOw7PxGgmaOCPkUwZCgjtyzC/7kzj6IL0pQmVLyJUfDZzMyi5uUaYHVCAF1i8vENfOQKYSubTzwEoL@nongnu.org
X-Gm-Message-State: AOJu0Yw2ad0ic52li3esn0t7Qa6+hjacNJ5BYbfsq8joTGgLG8Y9T714
 qnGpfiMDUHrOuN04gEIfKPhm1551zW4EbQB2SEt4hvVH/dSTvkU+H21CYdzCcaBvHOiXOzvel+K
 XiNPup0sXrg==
X-Received: from pfbbe14.prod.google.com
 ([2002:a05:6a00:1f0e:b0:725:936f:c305])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:e0d:b0:725:f153:22d5 with SMTP id
 d2e1a72fcca58-730351ec08cmr8925502b3a.18.1738805490000; 
 Wed, 05 Feb 2025 17:31:30 -0800 (PST)
Date: Wed,  5 Feb 2025 17:31:00 -0800
In-Reply-To: <20250206013105.3228344-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206013105.3228344-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-13-wuhaotsh@google.com>
Subject: [PATCH v3 12/17] hw/misc: Add nr_regs and cold_reset_values to NPCM
 CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=38hCkZwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yPMjmwRiTRpN

These 2 values are different between NPCM7XX and NPCM8XX
CLKs. So we add them to the class and assign different values
to them.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_clk.c         | 19 +++++++++++++------
 include/hw/misc/npcm_clk.h |  9 ++++++++-
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 0ecf0df3bb..9ad66ce212 100644
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
@@ -870,10 +872,11 @@ static const struct MemoryRegionOps npcm_clk_ops = {
 static void npcm_clk_enter_reset(Object *obj, ResetType type)
 {
     NPCMCLKState *s = NPCM_CLK(obj);
+    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
 
-    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
-
-    memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
+    g_assert(sizeof(s->regs) >= sizeof(c->cold_reset_values));
+    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
+    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
     s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     npcm7xx_clk_update_all_clocks(s);
     /*
@@ -1045,11 +1048,14 @@ static void npcm_clk_class_init(ObjectClass *klass, void *data)
 
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
@@ -1081,6 +1087,7 @@ static const TypeInfo npcm_clk_info = {
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
2.48.1.362.g079036d154-goog

