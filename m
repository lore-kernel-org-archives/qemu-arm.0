Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600819njk;
        Thu, 26 Dec 2024 00:25:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyM01LiWPVRnpaSW6csiEuLfXwFnjbVRAWbN3oY2b2DuDYpxb93dhoOzIpNrwNBVB7gIhw4AslUj556g==@linaro.org
X-Google-Smtp-Source: AGHT+IH/iBX8kAm8T+kpiMUI0pI3sd7W0y9c2Pxr/bAz5p3WXHrrb8v4mkzWQbd4LtcJB93dotsq
X-Received: by 2002:a05:622a:164e:b0:467:67ad:e2a6 with SMTP id d75a77b69052e-46a4a8efcabmr316684821cf.26.1735201523071;
        Thu, 26 Dec 2024 00:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201523; cv=none;
        d=google.com; s=arc-20240605;
        b=BblJwN/DWKusECh4quFhvE9EL5uYWuqtY+j5d1EJffFyEoalW4loeBXNuKdd88korj
         fTVFxauY2xK+qOO2q5TeucIkyJUhHEVOKI9j/OAIRpATtCMh8DJfQh/6xeXvWllpxf3l
         Kx6LEofBcyKM/gYScRRAvrEoKcdB9OCNVU/7QJ6+CxKgCkAnvpEjdtBPyKzukdqZI84Y
         EIHt9RP55mN8i33yXHPqgrJ3Rbq/C//ylKI1I0h3ughLonnwNpjCiQ+2UuDrD3ptMH//
         6jh8RqInRAguYD8OvfLc4z0HJoUcbbAAoSrhY9X1FZA5efP0kJIh8KQUKYm8MCP5T0qX
         BBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
        fh=lpFIP4l/y5v+E4bvcFSJ6imIrD6BJ62QcEd1fO9ayos=;
        b=KLhJSK0bSg26zbIRRoVujPe51P03RmvxXuQu56fQBTmaPnDj1XqmARtBj/B6/awPTW
         L7/RzNJIrjwTDTR5nTwj6kceWgn62X0bFIDzUFIo7Ks0Mi1rDZWsVtAah91tj1QG8LbR
         Au2Yxxf/U2SmY/2sXgipbRWGXy89b/c1VK2BuFJiY6b3UCpTecwi0rRk8q8w0pLzY/UK
         AFbv4GgxousPl69VQ5VMAsVRhNvmN/jKycnWQNA42eOaqivQkxOra5nBpn4wViB33sFP
         kFoLrnZwCg00ol5YXj3YLzedrHgszV1dh8w1rucxxjcWeHpfvRWaQg9NzKD2hjK5tOkr
         r4xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HkXrJH0I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd61e5si169494441cf.535.2024.12.26.00.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HkXrJH0I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQj9b-0007W5-22; Thu, 26 Dec 2024 03:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3eBJtZwgKCpMJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9Q-0007Q2-GR
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:23:25 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3eBJtZwgKCpMJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9O-0000YW-TO
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:23:24 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-216405eea1fso71484345ad.0
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2024 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201401; x=1735806201; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
 b=HkXrJH0In/+jyPIL6nW5xhmwUfjRXONK8mdx39k6LhZWD0sB8WWdJKN3cC1WtcUc0C
 jX4bAMGL54HzeTQETl4dmn3ygfrGkfAaEdHQsOSBmDYR+klyKITXEnRGmG2IaWPO9A5Q
 f83qRvzFf4NV57qbEz6FDjREuzqDZjWSlpgXVlLKhsixZdW+eTBthbQYLyLAUCLdZKxp
 PvL1IicnlqpphkMx2w5xigzAG/sHjuMb3C7LPxavvX0q6kAGlVO3zzXX4nzrAR32/9u8
 barhh+Laen/Hwa96xaK9E5Bb1w/P9yGAUKtMFVUksY5JEqfNsp3svo4i72OQcMh5OD/5
 UnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201401; x=1735806201;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
 b=DnYGNCxgUkhgmDUDB+0FiMcEQhKhQX1cMbUOVAzqbBHOgoeH26WWfyVEfEuhYMhWJ4
 w/g4D26nZYhErHDC92Es09j1Ot6ewKLRfHlrTUbHke4ZKqK8E55CkjJgm57THNQ9ATj1
 ofJka5LAXsEkVqrNYf23NHnN9qOxF4WpPAHfz5Tn+QDls94T2DkHtEa5fJ96KNDpOpmB
 oXZY+X5DBT8SgPXqgg461A8SH2mGT6nK3BaCwLcdGNn3io6HLnIY8ruRMiZeEuGaW5eW
 mX96gLgFLtoNoPkqPWYLPAWafwcdcNiOx6/JenB8j60cCjAphNgYWXRmoPWiLXqSzHPL
 wYjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVht22pZxNfzNL++MNUE6X92Jt1hWcVCPNDz4uqWSSIVpCIK6PsHaZ3SmPSKtSyd9ZyB71A6YLG+qy/@nongnu.org
X-Gm-Message-State: AOJu0YxbfeFNwGDPhJf/qxD0fYf2YvxEeAwhwDWocQQC1BUNKLqjLyIX
 CyRUQqPHkwRI/GXmvWSRiYS0dL5rdHvMKCjJmE3d5B+IQjkLv1/Xrx5mVH262BTVAB/tt2VduuI
 +xEV/42vvsA==
X-Received: from pjtq6.prod.google.com ([2002:a17:90a:c106:b0:2e2:9f67:1ca3])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc48:b0:2ee:a58d:cd8b with SMTP id
 98e67ed59e1d1-2f452e49101mr31981933a91.18.1735201400910; 
 Thu, 26 Dec 2024 00:23:20 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:28 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-10-wuhaotsh@google.com>
Subject: [PATCH 09/17] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3eBJtZwgKCpMJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: BNrCb9mcmZYQ

NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
module. Since we don't simulate a detailed memory controller, we
need to store this information directly similar to the NPCM7XX's
INCTR3 register.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c         | 24 ++++++++++++++++++++++++
 include/hw/misc/npcm_gcr.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 52d0fa07ea..a4c9643119 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -279,6 +279,19 @@ static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
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
@@ -322,6 +335,14 @@ static void npcm_gcr_realize(DeviceState *dev, Error **errp)
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
@@ -371,18 +392,21 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 
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
2.47.1.613.gc27f4b7a9f-goog

