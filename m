Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp287961lfu;
        Tue, 5 Apr 2022 15:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxzmFcO1hnQd/pCvqaLReM5QzhPP4mIS2EwHVQSXOyxqbWadoGZctxtDIpsAluktCgGZYQ
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id dk1-20020a056214092100b00443ce3d577bmr5002626qvb.122.1649198650395;
        Tue, 05 Apr 2022 15:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649198650; cv=none;
        d=google.com; s=arc-20160816;
        b=rjzNEoSOM0VqcvlQLQlR2xKc25PhU3GStr+rRJXyYbUYXNgtX8q0Zi7u+TOD4X/6s9
         I1dUSAXAk0ToDosyAXFITrtCQr1ExHdEFvi8KsyZimwMf4CcLfHSeOGBHykpvZDFQkUo
         cLtWJQotiYiTqLMo5BVrhgsHZjv2xmmU7hQmHfD8vV7a5XHZX1hr3YD+emEoJZSbcksX
         4Y3rnfYNjJCJW1hugqIljRaZ1AKSoe3DghtL7n02tj69aG4EcyPlae0Mz405bWaC4SnW
         BtAJGwpI3B5kcsn2h5XHx4pAIrDLwh4zAjj4nGVle8xm6tRHYYj2tCu9uqn+gZEh1Lns
         GQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=7y16m+YhgKT9axQ8vzxH2jNiZz8ZOwdWe+v7jicPkRA=;
        b=d1l9qfWpbW4SVrpKPEnSfb3F9Nd2K4yHgIbEvw5VcgjM0Qa72KOl5WSrEazHQle7TL
         fJzX+Ga1VS36EeA+DtIf4tEd2dxDQWPcApwm3LT1Mhf52eQAoNuuIzUsMdUpTkq/uzS8
         FVe2lUJVpvGeAR0YRqTbTfYa2lRl8jJVONn7+coHBSU5aPx4khH5Is6SfCabE0VIIf14
         HQxqlr4jBUYwAnMY6bfy+zXkQQFgPPRjPd4bB3PZm/9lkEoK5oaBQur0VpGOPy4YqbG3
         zvc2eiJKQ1Q9pmLVGzj0wHi6jQ0pWLcR8SmC1vqPtcIjzkUNdJuuB2lKxHCdeg9MwOoB
         9awA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CAjxTBZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020ac84245000000b002e1fbf3be5dsi5157369qtm.78.2022.04.05.15.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 15:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CAjxTBZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbruD-00075q-SB
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 18:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zMRMYggKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1nbroX-0004Hs-SE
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:17 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:51119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zMRMYggKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-00031j-K7
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:17 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 bv2-20020a17090af18200b001c63c69a774so412566pjb.0
 for <qemu-arm@nongnu.org>; Tue, 05 Apr 2022 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=7y16m+YhgKT9axQ8vzxH2jNiZz8ZOwdWe+v7jicPkRA=;
 b=CAjxTBZ5DCHGqgRFAP0vBgTsvNnqKGZNo3ys8caHzWv+VMd8oRqKLUemGlFhbq7IGr
 S0M67zfwqtEbbRNII5fWZE0st5BaCBKhdkF8ilrkt1AYTNMQU2qlvcVTPZwzvZsr/DgU
 C2YvL+MlQUDya6QLsHSWzSnLgggvGU9FSIcx+UOVd1EizfA1lhNfVPA9RZNfoS99gMeo
 OA5RhDcY/z8jHd4g8KpANPD/Yv6L5BW/DozqmKUyYnTEwE8rdudB1VBW5Fiq3QwDxAYH
 mXJ6YfTymzxLKK8tLoIuU7oYuTRJUWRAFWkswT3YbU7Wht6sWjcbBbvazTEOR/c2ZQ+D
 5dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=7y16m+YhgKT9axQ8vzxH2jNiZz8ZOwdWe+v7jicPkRA=;
 b=lOg654xA2k5HBS3w8WbP5LpDDxKdRAEGHHpKIt2iJo9Yvba5qy2d6Q42CeF3qv8iGQ
 Q4CuQKIECOmmlTSZsHOG9SBEhrF8pnfdEckyIScES//8R8V5KqQrZE7KEXosdf1oI+Kh
 ry9A8fJmncktvnD0A3twtTIz/7Fq6KKWMFaD4fWT2pGuZJAj47fd/S9zDRoNRgBnrLd7
 +on2H0pVX99AS35SUcokHHpkvatZ1AUwkmt4kzNTzgJpXODhokPOjyTQE+/bJUvq8yX1
 HhSDclrppFQGaTSW8h/yyJBONgXR/JJZLNydIrhvikaoDr9G6HGQFa3X+sCFUzi0FF2G
 fEdw==
X-Gm-Message-State: AOAM533Sn153ogqYQ+6mQvjNZG1K5BVkXACY4QsO8a/DhVx/ip9ynE0E
 vMLWbp3cSO5GeatMchpcNX1ncTuYQixcnQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ce02:b0:153:bd65:5c0e with SMTP
 id k2-20020a170902ce0200b00153bd655c0emr5586875plg.160.1649198284850; Tue, 05
 Apr 2022 15:38:04 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:34 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 05/11] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3zMRMYggKCKEXVIBPUTIHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDHM0yl/1kCc

NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
module. Since we don't simulate a detailed memory controller, we
need to store this information directly similar to the NPCM7XX's
INCTR3 register.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Titus Rwantare <titusr@google.com>
---
 hw/misc/npcm_gcr.c         | 33 ++++++++++++++++++++++++++++++---
 include/hw/misc/npcm_gcr.h |  1 +
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 2349949599..14c298602a 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -267,7 +267,7 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
     },
 };
 
-static void npcm_gcr_enter_reset(Object *obj, ResetType type)
+static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
 {
     NPCMGCRState *s = NPCM_GCR(obj);
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
@@ -283,6 +283,23 @@ static void npcm_gcr_enter_reset(Object *obj, ResetType type)
     }
 }
 
+static void npcm8xx_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
+
+    switch (type) {
+    case RESET_TYPE_COLD:
+        memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+        /* These 3 registers are at the same location in both 7xx and 8xx. */
+        s->regs[NPCM8XX_GCR_PWRON] = s->reset_pwron;
+        s->regs[NPCM8XX_GCR_MDLR] = s->reset_mdlr;
+        s->regs[NPCM8XX_GCR_INTCR3] = s->reset_intcr3;
+        s->regs[NPCM8XX_GCR_SCRPAD_B] = s->reset_scrpad_b;
+        break;
+    }
+}
+
 static void npcm_gcr_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -326,6 +343,14 @@ static void npcm_gcr_realize(DeviceState *dev, Error **errp)
      * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
      */
     s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;
+
+    /*
+     * The boot block starting from 0.0.6 for NPCM8xx SoCs stores the DRAM size
+     * in the SCRPAD2 registers. We need to set this field correctly since
+     * the initialization is skipped as we mentioned above.
+     * https://github.com/Nuvoton-Israel/u-boot/blob/npcm8mnx-v2019.01_tmp/board/nuvoton/arbel/arbel.c#L737
+     */
+    s->reset_scrpad_b = dram_size;
 }
 
 static void npcm_gcr_init(Object *obj)
@@ -355,12 +380,10 @@ static Property npcm_gcr_properties[] = {
 
 static void npcm_gcr_class_init(ObjectClass *klass, void *data)
 {
-    ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = npcm_gcr_realize;
     dc->vmsd = &vmstate_npcm_gcr;
-    rc->phases.enter = npcm_gcr_enter_reset;
 
     device_class_set_props(dc, npcm_gcr_properties);
 }
@@ -369,24 +392,28 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END != NPCM7XX_GCR_NR_REGS);
     dc->desc = "NPCM7xx System Global Control Registers";
     c->nr_regs = NPCM7XX_GCR_NR_REGS;
     c->cold_reset_values = npcm7xx_cold_reset_values;
+    rc->phases.enter = npcm7xx_gcr_enter_reset;
 }
 
 static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END != NPCM8XX_GCR_NR_REGS);
     dc->desc = "NPCM8xx System Global Control Registers";
     c->nr_regs = NPCM8XX_GCR_NR_REGS;
     c->cold_reset_values = npcm8xx_cold_reset_values;
+    rc->phases.enter = npcm8xx_gcr_enter_reset;
 }
 
 static const TypeInfo npcm_gcr_info[] = {
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index ac3d781c2e..bd69199d51 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -39,6 +39,7 @@ typedef struct NPCMGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
+    uint32_t reset_scrpad_b;
 } NPCMGCRState;
 
 typedef struct NPCMGCRClass {
-- 
2.35.1.1094.g7c7d902a7c-goog

