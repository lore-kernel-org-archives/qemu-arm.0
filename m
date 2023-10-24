Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2174567ejb;
        Tue, 24 Oct 2023 09:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3F3h21F0aQJPqrWXCsIFEEgf+cs21Oz6XoRCAwfPCQFCI1aNju1RXcwPClqkbyFrz/I4N
X-Received: by 2002:a05:620a:4412:b0:779:e2bd:2ea2 with SMTP id v18-20020a05620a441200b00779e2bd2ea2mr6187641qkp.55.1698165371692;
        Tue, 24 Oct 2023 09:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698165371; cv=none;
        d=google.com; s=arc-20160816;
        b=ev/FwjxadiO3Xei6h7k+BIo2zSzpjwllIV39TBBzGsMfyHDCxTbR9J2g4QNLI1ZarK
         gDNiURqQ8FOR2B8vE6wJAnoExhLjpyfvonyZQVc1tC9BwfMw5j9L58rCM3JVF81sM9U8
         gnudJv5DX64Nmn6auhPR6Culb8Rjat/Oxjo+2fnSQTSw8MUEW15/YQ0JXQlXUr8TwkaG
         PZCLRGcT/DZXqAyvNEnPgSXAuJqlgwW9S7YqGbiyHqcoWcXu5mwyi56RTmmcSZYeIkc0
         9heWi7EMpIWwNvZxJxvjWgh6BlLHXVKBljXWfOdGOtYH+g0C27K2To/F88Hu59rPaJi4
         ZLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9L3xRsVveSCMU9gTM2aMKdKV9IjkyK5EbO21w89IxGw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=SVD5pjopxi6GPhfbX4LoK5Nr6hwZGsK7jIGhy6ZZioy55AL6ZBbJ3J67WD0nY1v0vg
         4Ot6+J355KSStA/HlWPrbH3IwSyMLxqleznZb4jbHBgdHk6OnURlpHEbcm6whvHkAHBz
         aohTWdxO3wi685EXTGjpIL4HUhqbPuvOaOc72mB4lBHXUZ73QsmGNlXJWKZPBoK66cmm
         Ftq8oWvHHBu99NKgPdwP0RB+PwUesEaeq7Y1KrmgdbSiRoTdbz2nBdvMUc/obIsCoD0/
         aR9a57SF0zP02k//tLgKnbUgPISSQv74/OyOuxvAgCz3mrjRoVFt63AldbQxwBXoHsgO
         TMbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TESFRAPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a16b200b007758e5dba33si7274437qkj.469.2023.10.24.09.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TESFRAPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKNS-000290-OF; Tue, 24 Oct 2023 12:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNJ-000206-1b
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNB-0004Mg-Sw
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40859c46447so24138635e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698165315; x=1698770115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9L3xRsVveSCMU9gTM2aMKdKV9IjkyK5EbO21w89IxGw=;
 b=TESFRAPlmnXahKVNZTRUZsOCSjPMK8fdm8LdQOOdUfDdBkHRfIklnpUSobdeh/pezB
 oCfio9a/TTZznzEatQF9ippTKnNZNcU/3WGoKTiJ6nbg5Ma33jmLRBYEQOGfsdnLZEBG
 jgeG5SHRzcGzPEOQSRR+hFrFnOdX3Pt3PwfbSERkLKaOtSiNi81kLtFsaSis9EgQm6cp
 dgTGr4dUZ2LgDMW2ijbf1rFzESyLEDuRnPCvvQC/olQgIzOOxUmQp1DuvFBGddAdEq2q
 7AElwIfy0xN9XOEdzcxLqPAAmABm916RoS51DQ5pSWoNoNNtIK8oMwn4nvS8tUHv0G5P
 2Ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698165315; x=1698770115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9L3xRsVveSCMU9gTM2aMKdKV9IjkyK5EbO21w89IxGw=;
 b=jcvUifVsp38QMKlWM7TGJ9gHRxaaPYKp5wwp0FwXardRtT2LwGCixLI9QYtpXYIzPR
 IC7Y8AN85lyREaMD7hno9FxsdhZoAs969X4zdPi36Ki8UUC0svpayl8SLzYoZNPHsK65
 1NUsNBDwC0YJ6bZaHA6mkifpb3tMVhQfLEOTjWRVAx5iEJSHxF2g7quhheoBrzAoz8Hl
 inMWF4qWHlFIZfXAOWdodkTlFG+jfcobj4h13sz9Q3SDsqpw+JtYa2vD/dzbRnl8tuIa
 17oGV33T5nqWy7OSvdRD0009ojDl+SACoP8l2sX3EYmk37eSm4zup1teRJ0stt+ktP/l
 Kkaw==
X-Gm-Message-State: AOJu0YzJhnvlBB5CQLHMo6UsMuDyWEoW91qb0JutSZO7SZUa4QznvGKc
 PF4v+Cp4LUcy4cpPiHUMxEp89tRg2NngEm3O5fE=
X-Received: by 2002:a05:600c:35c5:b0:405:4002:825a with SMTP id
 r5-20020a05600c35c500b004054002825amr10383205wmq.13.1698165315387; 
 Tue, 24 Oct 2023 09:35:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16860101wmh.11.2023.10.24.09.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 09:35:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm: Move ID_AA64ISAR* test functions together
Date: Tue, 24 Oct 2023 17:35:08 +0100
Message-Id: <20231024163510.2972081-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024163510.2972081-1-peter.maydell@linaro.org>
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rJmdcihpw/9E

Move the feature test functions that test ID_AA64ISAR* fields
together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 70 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 90200a4b98f..e73120ef974 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -451,6 +451,16 @@ static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
 }
 
+static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+}
+
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+}
+
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
@@ -514,16 +524,6 @@ static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
 }
 
-static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
-}
-
-static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
-}
-
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
@@ -554,6 +554,31 @@ static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
 }
 
+static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
+}
+
+static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
+}
+
+static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
+}
+
+static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
+}
+
+static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
@@ -804,26 +829,6 @@ static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
-static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
-}
-
-static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
-}
-
-static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
-}
-
-static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
-}
-
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
@@ -922,11 +927,6 @@ static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
     return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
 }
 
-static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
-}
-
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
-- 
2.34.1

