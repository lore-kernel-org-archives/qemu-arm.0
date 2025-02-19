Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1553689njb;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGVedp/fRoYLL+t+FwSH3LZBfLLkRmiJ11G0+t1K+6/yeDis320h7f9UnIs7tDo5bVV/CdlywfY9VMOA==@linaro.org
X-Google-Smtp-Source: AGHT+IGE5ATLiIIxiVUQoFuhfjP/r8eP6kNeyZxVqNEJR/aqE91NBj7RIHQcQQ2/z9/JkZSijNfB
X-Received: by 2002:a05:620a:2994:b0:7c0:a431:6c63 with SMTP id af79cd13be357-7c0b527f60emr543203785a.28.1739990890445;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990890; cv=none;
        d=google.com; s=arc-20240605;
        b=P8vj6dm3KTLym8cHFYt7y7E/DT+i/gd26MBO3PByG5nJD7cwEiNDKHyXCxE1xBO6fK
         upVDv9rf4MjKVo5bQYZTzJAR7A5GTZ4Khuyx/MJZSCOS2mjJ3HICxtkF1WBu1EkWAvGb
         pJPGsDEGS1uF5Ck7Pz4Sd6Ojpsy+O56SBxDe8Nw9F9y35W6wNERU8dOFnsX7as/1lT4O
         yLlmrEGiC2yieijBbjEINLyFdzratRXTSDAwrPikktUCpQ/1EKYT2PRvLa4Zm2kXnbm+
         bDZJDu+cq7m2fyzoH+id48QnxzF4nJhiSZHIh34qGKk30GdYDo2yfNv/c2WAH4jFNymR
         0Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=VIS7B0doPqXPA0DimDPiGrF3NBmPrbLpQSgpHjMhPUs=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=elJkwhURwoFJ5i/koKNpBBRG4lHaEN95L91ReE3rYLLYoEGB5VVMLuJhiHfpByTa+y
         SGlYvoUb18k3VqaNsCFctaAVJw1xOtzZl4DCL2wvEiY3nA4ByMiJLwp8zqXlSkOXApmm
         d1HzM258ng4TS0p3i3POCTelsu1JsEmIjocsszu3L1SJ1HXARZoMjzJCzWsgXivhwSOO
         yCs/uo3GMt5ST3eYrTj8QlBAmFbf161dEfcLbzeVHWxidtHLF73nNDhuE0CaM6avRGzT
         xGro8UcOD23X1Ha1gf4t85+EpGMNF6etjyD6q124ENio2C6nei4pogEq2fGIFhHAikKm
         mPwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TLxT9LFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0ae84aa76si350081185a.621.2025.02.19.10.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TLxT9LFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp6H-000391-KY; Wed, 19 Feb 2025 13:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DSe2ZwgKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5m-000313-Cw
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:42 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DSe2ZwgKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5k-0004kW-La
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:42 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fc1a4c150bso195746a91.2
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990797; x=1740595597; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VIS7B0doPqXPA0DimDPiGrF3NBmPrbLpQSgpHjMhPUs=;
 b=TLxT9LFkkVuqcP1lAvhPQFG/WaVjuvT/RN0Yh36DOcpMjyTlXGbnMw6fK1QE6cJENp
 OVIzR2ZXp7Rx06QWWmQPuwPGYgD7CoAVne/LLBo9qUQnlR9oCy7pViPTHT7tYVCOhorF
 VEFO0E6pr4pyF2+4vTfZpWWO8HaqVBCXnYvIGy7UT1RE52aGbt/OY7IqVJbSHz0CZcHr
 tlsBWqJYuj3ds91ErVYZ7ee5xw4whTJRyjJvrzcDgHWASO7F54QzbP8Og0DWsdAnAk8r
 BnfCkTddtQj8Xw5TPtJAyFqPwn/ZHcwEKtbS9x29aqf646WyWYlqRJBJw13cOF94pd05
 ojbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990797; x=1740595597;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VIS7B0doPqXPA0DimDPiGrF3NBmPrbLpQSgpHjMhPUs=;
 b=N2h369SoEtmA9rUUKCTQ7PmU8a5aaH09aApkZjB4juuBvWDipf7Tnk65yoklk4E6LF
 iPi4CTbrkJoU5lCaq9i5e9QbizRBzXyPhSWApE0hZstH1XutcOW4+icBhI0v3iKkIEyU
 Nb2O5tZ3SC6iPqjLnyhs7cSfnrQpXp252d4oZBeTN4y6h1Y/nTX1hqN3+rX5m7hi/+c4
 ssDccr0r0h+PdNnxS1LZ7F0atjxFpIN4ogM/5onm+jFP35wXomlODozf63x3nFkVsJ3C
 YNO8Li7QnZS9nO9D+kFpvT6sjpDxSQSK4DWJtn+BEfxYr0Th+g+LFi0MG3SOeS5M8VJY
 WDvA==
X-Gm-Message-State: AOJu0YwlsmNOI/7OBx5g/RVtokiqLzL11P50zu84Kk/qTma+YSL995Xp
 L0o+WawTcrNzKGR0bReYF3h9M0hjaHxiJtMhB2domxOKlZllFz6kvG8TJcmCFk2Tr1lNe6IL65V
 0gO8UV4ybzw==
X-Received: from pgbfe24.prod.google.com ([2002:a05:6a02:2898:b0:ad5:5920:367])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:150a:b0:1ee:e08b:4318 with SMTP id
 adf61e73a8af0-1eee08b4672mr2191543637.25.1739990797203; 
 Wed, 19 Feb 2025 10:46:37 -0800 (PST)
Date: Wed, 19 Feb 2025 10:45:59 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-9-wuhaotsh@google.com>
Subject: [PATCH v5 08/17] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3DSe2ZwgKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com;
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
X-TUID: Zw0rYSxMDB5Y

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
index ac22fb08cb..9e4a6aee61 100644
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
2.48.1.601.g30ceb7b040-goog

