Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp131287ocb;
        Mon, 3 Oct 2022 09:30:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4olV5/DJ96n1jm5QUfn8RunpLDC4j8o84Hh6SCQNrSSX3iP37YEyZPn3nYUjhOl3jvo7iN
X-Received: by 2002:a05:620a:2682:b0:6ce:173b:6b37 with SMTP id c2-20020a05620a268200b006ce173b6b37mr14411409qkp.75.1664814648212;
        Mon, 03 Oct 2022 09:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664814648; cv=none;
        d=google.com; s=arc-20160816;
        b=R0JFVoHY4bff5ln7heQ4bKnQC+3sB0nLeHR1z2i7BwUoENhoN/B0L8YSpBXTk/E02s
         SewtrX8MhOVlWh/RWy0R8xe5OYWGoglKQwHcbibEPiWpD6DxeJBq0NzijkBTcxBAMiIz
         6xuUmCFo/EIhk84pIKO8y55ZB8akexLeZtTInRCmIawPiSwfp6uX4ZbsKbL77ozNviNg
         Go1zcuAMsaKVhrtTMbzIW5JPgYAk4NqO9n7RztIG6fbTOLrlM1pUvnuy+ZYpUrLRpqIf
         7FHyugBc4mb80iWDJf6S/XQycW8FN6pNG3Uj3kfEYJeIewr57lxd1lGc9WJLU8eDue02
         DZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iLS80cjxzj2lzwffuWrbrnxfYmJ63GkptFKtPKF4mf8=;
        b=y5xoGQzbPRuM44xRaCvccPNk7WvChEYBdj/+WEAmpBjppxYCzzSNCO8VKlX5857Uaf
         wPpF2498jUKyb3LELvMZLzkGvIf547t8e+Xrra7U1OjBQq2OlaFHyalf/OiSRxpZZDqy
         XKOosadX129mtT44xvZVNdqBWUKe1yeEbRsCuvwoOzfSpXgc5PQpFZauKrEPXbLnCkLA
         xfBPpZZMc5XXtDYkNfzSM0nBevMvZa/T2B6FZoVAIZSNBbztXwxZqwWa5iuaRk20fRp+
         M1KAsc7khfZgrnIPw9AtzaftaUsDlc+jtDREoUGtq/sGY4p4qVhTLJXb0rAAEuowHdTH
         xjBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crwwGU25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a05620a448300b006cebcfbc520si4722243qkp.412.2022.10.03.09.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 09:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crwwGU25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofOL9-0004EX-JK
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 12:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofOEA-0007vv-7h
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofODy-0000Hd-QP
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a3so5249009wrt.0
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=iLS80cjxzj2lzwffuWrbrnxfYmJ63GkptFKtPKF4mf8=;
 b=crwwGU25GTQMMOV+aN1uk6LhaFVle8FSx2hJKe1U255cSYxMdSp9qQjJedTzEsQzsL
 YC1nQ+qhLFAyg4adBjjwYP1yUEdJzhmNRvBCaLQULJ6igSW3Tj+1MNkDZ3MTrfqauBSI
 ltPj4NCzw3l0+D2XZ5a+s+ebLVMn0VMClsHdbpomYek+pXhmPvzaGRiu8L+Y6q0RScm+
 l77zH6+Bfj2v85VxX9O6uBPwc5vnGBfinz+U4RCH1oZu/sevClVF+Z4RMKaO33pcL3eM
 HimT8MrrNKDKtoP81QYmRouQMUfOsNgQxGidM3prsNgAKocvJzIVBnjb9cbXXDSBSAea
 Xzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iLS80cjxzj2lzwffuWrbrnxfYmJ63GkptFKtPKF4mf8=;
 b=7ynFVAl1Z3H/TvmAJflBt9NpcL+o9sTP9kxmP7djzf2m0URLkd8i7lYg5gyXxJ2+tu
 ZZE6/463GkbZdd1WFE5jX6tyijJwgIEmOYj6ASTLjOUP8jOoLRMtEtb3/gIQKviYPXQb
 jPT6OuO8pwSqsBRj3iwIsDvS4vgutlWVRWvIPk0R+ibk7kooIwWLCVAznKQxMpb/Ih9r
 MGWU3a+CI9DUEjZPCp6VqORVTGSDCaDGXl/JjSecM/t5reuRIFHgDEDuvgS4i9SFcRuI
 OXmgtVi/KPYgv86PiLQIsz2koBrambEkKRJlf97n4s4Q+kbUiDAdjWE3ma7GKecqMkTd
 bWNw==
X-Gm-Message-State: ACrzQf2wMbuz8usHZNcsyj/570sBY1DPDRrc83w51d98ZQonJrExPwqC
 nsYRMf5ovjNjFLXtbv6oKMCLD5xH3dkzsw==
X-Received: by 2002:a5d:59a5:0:b0:22e:37ab:ed7d with SMTP id
 p5-20020a5d59a5000000b0022e37abed7dmr4288607wrr.461.1664814199106; 
 Mon, 03 Oct 2022 09:23:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b0022afce9ea93sm9897856wrv.40.2022.10.03.09.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Use ARMGranuleSize in ARMVAParameters
Date: Mon,  3 Oct 2022 17:23:14 +0100
Message-Id: <20221003162315.2833797-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003162315.2833797-1-peter.maydell@linaro.org>
References: <20221003162315.2833797-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ckHhIKE278qs

Now we have an enum for the granule size, use it in the
ARMVAParameters struct instead of the using16k/using64k bools.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 23 +++++++++++++++++++++--
 target/arm/helper.c    | 39 ++++++++++++++++++++++++++++-----------
 target/arm/ptw.c       |  8 +-------
 3 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0727c7e4559..95f654db3bc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1074,6 +1074,26 @@ typedef enum ARMGranuleSize {
     GranInvalid,
 } ARMGranuleSize;
 
+/**
+ * arm_granule_bits: Return address size of the granule in bits
+ *
+ * Return the address size of the granule in bits. This corresponds
+ * to the pseudocode TGxGranuleBits().
+ */
+static inline int arm_granule_bits(ARMGranuleSize gran)
+{
+    switch (gran) {
+    case Gran64K:
+        return 16;
+    case Gran16K:
+        return 14;
+    case Gran4K:
+        return 12;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Parameters of a given virtual address, as extracted from the
  * translation control register (TCR) for a given regime.
@@ -1086,10 +1106,9 @@ typedef struct ARMVAParameters {
     bool tbi        : 1;
     bool epd        : 1;
     bool hpd        : 1;
-    bool using16k   : 1;
-    bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 41b8435deac..484a2d54ab8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4487,6 +4487,24 @@ typedef struct {
     uint64_t length;
 } TLBIRange;
 
+static ARMGranuleSize tlbi_range_tg_to_gran_size(int tg)
+{
+    /*
+     * Note that the TLBI range TG field encoding differs from both
+     * TG0 and TG1 encodings.
+     */
+    switch (tg) {
+    case 1:
+        return Gran4K;
+    case 2:
+        return Gran16K;
+    case 3:
+        return Gran64K;
+    default:
+        return GranInvalid;
+    }
+}
+
 static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
                                      uint64_t value)
 {
@@ -4495,17 +4513,19 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     uint64_t select = sextract64(value, 36, 1);
     ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
     TLBIRange ret = { };
+    ARMGranuleSize gran;
 
     page_size_granule = extract64(value, 46, 2);
+    gran = tlbi_range_tg_to_gran_size(page_size_granule);
 
     /* The granule encoded in value must match the granule in use. */
-    if (page_size_granule != (param.using64k ? 3 : param.using16k ? 2 : 1)) {
+    if (gran != param.gran) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
     }
 
-    page_shift = (page_size_granule - 1) * 2 + 12;
+    page_shift = arm_granule_bits(gran);
     num = extract64(value, 39, 5);
     scale = extract64(value, 44, 2);
     exponent = (5 * scale) + 1;
@@ -10377,7 +10397,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10421,11 +10441,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
-    using64k = gran == Gran64K;
-    using16k = gran == Gran16K;
 
     if (cpu_isar_feature(aa64_st, cpu)) {
-        max_tsz = 48 - using64k;
+        max_tsz = 48 - (gran == Gran64K);
     } else {
         max_tsz = 39;
     }
@@ -10435,7 +10453,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
      * adjust the effective value of DS, as documented.
      */
     min_tsz = 16;
-    if (using64k) {
+    if (gran == Gran64K) {
         if (cpu_isar_feature(aa64_lva, cpu)) {
             min_tsz = 12;
         }
@@ -10444,14 +10462,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         switch (mmu_idx) {
         case ARMMMUIdx_Stage2:
         case ARMMMUIdx_Stage2_S:
-            if (using16k) {
+            if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
             break;
         default:
-            if (using16k) {
+            if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
@@ -10488,10 +10506,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .tbi = tbi,
         .epd = epd,
         .hpd = hpd,
-        .using16k = using16k,
-        .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .gran = gran,
     };
 }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028abb..b0a780b38e2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1048,13 +1048,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
     }
 
-    if (param.using64k) {
-        stride = 13;
-    } else if (param.using16k) {
-        stride = 11;
-    } else {
-        stride = 9;
-    }
+    stride = arm_granule_bits(param.gran) - 3;
 
     /*
      * Note that QEMU ignores shareability and cacheability attributes,
-- 
2.25.1

