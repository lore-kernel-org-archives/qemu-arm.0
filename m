Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1846162njb;
        Thu, 6 Feb 2025 14:13:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv/TdgV5Fw8h2fCHZTJtX937i18FEXI2B/N8Bbrb3oew+rDlGyxVAxm4NV0snvgPM4ivuMsYgtcpW8FA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0wNb3BbKu/aDfxXAKn93/LmKw7k3fBJ1rfUL9V43VJBjnj+Famc9To0l1ebfT4BWxjxFC
X-Received: by 2002:a05:620a:400e:b0:7c0:b95:693b with SMTP id af79cd13be357-7c047ba4ec8mr145333785a.7.1738880034880;
        Thu, 06 Feb 2025 14:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738880034; cv=none;
        d=google.com; s=arc-20240605;
        b=bGiD8D/bJ1unt/+az1ZnCzBsAze1uAY+K/zgStjSmzD7mq+oVl/yV84O0ncvWjKPMz
         LMgWvH91taWLeBBxBOx5Kp+Uu2CX9u9kP1La54Af2a3fLoEGCn7YMNryf6UvSkCrRBis
         jjxRps5d7kxCO1NvChp483m1bIotkcyokybYiSFOUshd2b+SIUtG3KZYT7GzCJpnao/j
         udG/gsLJH6v8qoRbUOia6F01wjSevEpEMmEVmvHxF0oE+CLmc6IPle+7y+aYskEvp035
         EC+bPYQIrIa+bijyjZOLzCulG43FF28O7QpsmKjwlYruRHQRTlmVGfjka0D/UWEnIOe3
         Cd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=ODQOf6P0G6BAbndAM0dAbeD41I+TYA8HzSXWvwyTAB8=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=cL1x811uykc2u4FqGeeHfHqC7MTK/9fbl2wDDRh+Yg4SNXYAOr1zb4Pfcnuff85p9y
         fCFbhISvGFX1cui81QzRynFaPodrgnrx7S0lSeQteTL3IpQQyQXOpl0kiaxJQZV3++6u
         qkl20C4NTOJCpvIIIvKYC/NlDIQdD+aqwIT2WOUIgU2sKd7gDpSsJxduXv1EUW34EE6t
         tsne9kcYqEqxasC7V0bUdV4Cwd4tzKKiLpU3a1joLD87xJ+cs43fuEZCgJCuJ0bdw5f6
         kTbEpJZ2zucF6u/jbDs+Omo3fj+QoiqMcRLbvoilu2RMFXXloJordmy89uHxr5mpnjYx
         WB3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iRSMlE1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df41b9si204073985a.57.2025.02.06.14.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iRSMlE1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgA6w-0005t1-Av; Thu, 06 Feb 2025 17:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xDOlZwgKCAU1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6k-0005eA-L9
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:28 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xDOlZwgKCAU1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6h-0001Rq-Fx
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:26 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f816a85facso3112839a91.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879941; x=1739484741; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ODQOf6P0G6BAbndAM0dAbeD41I+TYA8HzSXWvwyTAB8=;
 b=iRSMlE1mMmeuaIIGNlhr0TSQ3cLdHI5H296QLksGXebSP+4OKv6m5Zm7m0Jc9LsUtx
 1xWT9aZw7CoGSOpgaMVuFhDHQEklZg/Mk7Uw6+pXetHT0ktpgz0tjwcBWTK7QDbywKTO
 BjjKiuJDPE3P4cbcgtUUFGRdXs7q5I6w2rO2Rij8d9rxtSCq+Q1gmKH1YlGRszCEnF2/
 SFfeU/g0HwtdgTWuCghk0Ho4Rf6lLDgaLVpuxacgOnbLU+iNWFpd14/Mos0K9QwEESV8
 3JRqyRFX/rlcGHOt4sjIQlS+ezfGKot5N+FB95QjyTBLpC8qvyCyPIXIdwn4TarAWs11
 PN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879941; x=1739484741;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODQOf6P0G6BAbndAM0dAbeD41I+TYA8HzSXWvwyTAB8=;
 b=ly6MtsbGq2tie1FImI+1QXoChXKg3zNBw5qok8WdCk1xySpQWKeBk0SsOKfw5SY45y
 bePsjg67RN5NlpJUtyXcaUNIBmJDsBGfMYXeIOZ2VYDKoJeikes3GZnQiC1mD4Xd03kk
 TMrbfFkHUaEgQuqxPh0aWpyf+iSYmZMrh9nVcWrpFv+OGbjgGure8S6MZFhRDwqomecD
 f8x3w3WyXIv1ZvuuGB/swcRl7smFTMKT0ZaHSecePCzUO+g5dONAUYtNxtzGIshUJ4TM
 zsvwvPEnDQOEbFlfqhZ+vsc7rpa+/gFOp72tnCDjQXpqtz+UBj+pGqdtXF2cLm9JUXEE
 5gxw==
X-Gm-Message-State: AOJu0YyOqUaiCkCxmPzVGzHQ1d4rghhxLyvkWj+1GCnx+wojTP1qwJ4d
 hRYeftIb5PIBvgmg4RgO6DsrFELYpy0CaHZsUiYfDAT0Ei1kiK3bCyOS+Rrk1D9ON5kvtJB6WRk
 q2rmU5sIorA==
X-Received: from pji14.prod.google.com ([2002:a17:90b:3fce:b0:2f4:47fc:7f17])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2303:b0:2ee:5edc:4b2 with SMTP id
 98e67ed59e1d1-2fa2417c0f9mr1163870a91.20.1738879940302; 
 Thu, 06 Feb 2025 14:12:20 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:54 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-9-wuhaotsh@google.com>
Subject: [PATCH v4 08/17] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3xDOlZwgKCAU1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com;
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
X-TUID: WrLQrRbcUDU8

NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
module. Since we don't simulate a detailed memory controller, we
need to store this information directly similar to the NPCM7XX's
INCTR3 register.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c         | 24 ++++++++++++++++++++++++
 include/hw/misc/npcm_gcr.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index fe6e332de7..7cdea2e392 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -280,6 +280,19 @@ static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
     s->regs[NPCM7XX_GCR_INTCR3] = s->reset_intcr3;
 }
 
+static void npcm8xx_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
+
+    memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+    /* These 3 registers are at the same location in both 7xx and 8xx. */
+    s->regs[NPCM8XX_GCR_PWRON] = s->reset_pwron;
+    s->regs[NPCM8XX_GCR_MDLR] = s->reset_mdlr;
+    s->regs[NPCM8XX_GCR_INTCR3] = s->reset_intcr3;
+    s->regs[NPCM8XX_GCR_SCRPAD_B] = s->reset_scrpad_b;
+}
+
 static void npcm_gcr_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -323,6 +336,14 @@ static void npcm_gcr_realize(DeviceState *dev, Error **errp)
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
@@ -370,16 +391,19 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 
     c->nr_regs = NPCM7XX_GCR_NR_REGS;
     c->cold_reset_values = npcm7xx_cold_reset_values;
+    rc->phases.enter = npcm7xx_gcr_enter_reset;
 }
 
 static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->desc = "NPCM8xx System Global Control Registers";
     c->nr_regs = NPCM8XX_GCR_NR_REGS;
     c->cold_reset_values = npcm8xx_cold_reset_values;
+    rc->phases.enter = npcm8xx_gcr_enter_reset;
 }
 
 static const TypeInfo npcm_gcr_info[] = {
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index 9ac76ca9ab..d81bb9afb2 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -68,6 +68,7 @@ typedef struct NPCMGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
+    uint32_t reset_scrpad_b;
 } NPCMGCRState;
 
 typedef struct NPCMGCRClass {
-- 
2.48.1.502.g6dc24dfdaf-goog

