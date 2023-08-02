Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp501246ejb;
        Wed, 2 Aug 2023 10:02:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHDRT0/ysGJTExMNnnu4Oj+xLKuqYKUeM31xS4AlYKt8r49+lh72d8D3725TDYseYsYZziJ
X-Received: by 2002:a1f:5fcb:0:b0:486:484d:3053 with SMTP id t194-20020a1f5fcb000000b00486484d3053mr5107129vkb.5.1690995746477;
        Wed, 02 Aug 2023 10:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690995746; cv=none;
        d=google.com; s=arc-20160816;
        b=rZRrR5fmkLXca7yVm3PGdEhxOueWO+yrASwFqgD/wN4POhHqIZJw4fpYOUB7XApfp8
         pA+MkjwkTWrSLrn6vVQcde/VQ0iTc8P1cc7NYRYHiQEqssP3QyFCHrwrvggkv95p4NRr
         GME8Ll+oT1d41B2Td7fLQzeOGUJsK4y9ryh+iW05uHuypodtmkhNMUnEjcDGhi7OYgh7
         5+2fl33vabTadT7FS/GBjvyD7d6xKZ9rwuW+jVv4pNZGrVECNtyU2cDpxct+618AQ6vx
         cFS9qLbHNPwPIkW0j7rr0Ugge67cZXsXcNcxZjP7oNNXJazApbAWBhP5dYu/BuzvWJ7J
         yB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Xq4dJu2qLFemtsjvmEmG9U0HnzxKpgcrkh7e2iGXkwo=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=fbZG4vi8oBXXTfxjNhghPu5MKHOBxgQiZ7emGnUyketF/TQtOBAHCT5b7iWGZDUXWW
         iwqohkBGBfMDKdI1EY0e2hnCDENrDjy7T3DZ5yIen1iYVSdNx5lrRHmQD9xaRehHS7vj
         /G8cDMCRMn84WUSMs2SYqy9YOFUY5pNIcaI62jZ5VFkPVaa/a9+GPL0lEWkt9k78pa8T
         HeCarlrDty3KMQLBjsLiiuLzCAcbl+nvqsJJTceBXaCOypPsWeHBUTZveGT8BzWZQXz5
         8AA5UMu6xO6Nv7iLfIUIJfJoPaM4rlwuFlm5Vk0ast+1A4MYlC1dXrcT9EQNintCxf5l
         5HBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIAXE27q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ej11-20020a056102474b00b00447506544c2si1239531vsb.127.2023.08.02.10.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 10:02:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIAXE27q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRFEh-0000PO-W0; Wed, 02 Aug 2023 13:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEe-0000NH-TG
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEd-0003UA-2e
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so716905e9.2
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690995725; x=1691600525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xq4dJu2qLFemtsjvmEmG9U0HnzxKpgcrkh7e2iGXkwo=;
 b=IIAXE27qu6FnXpfPbME37q9fpI8BmLW0kAwbw94Xt32DzNhSLLI/ryeGI1pVdocs6l
 I9J+Hql/DzmZgDitLjw+sAryGxkl/U+QHwt1rNiDuVouslSSvwLfzvCPx9UesBbKFODL
 Maa0Xej6Yd6WGZSvNN7YKurRqMqp9wlcsRykIHIaB1dyjgeu1X25hsCr5AL3hog9rXmb
 PRVjt9xu4gV+NWWK0015w2ZqMayqyE2hn2A+L+8ZdOaciMckmzailo3OSZWx30FA2lMq
 mocIba8mRCTwZQ7tyL1r1Z5QAjTaZ4VOPFVJ+FDBhZZ4dfKA5/pX+Zwmv3GnuFA0rhLx
 /bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690995725; x=1691600525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xq4dJu2qLFemtsjvmEmG9U0HnzxKpgcrkh7e2iGXkwo=;
 b=JFLLoj9Rz2B6arPKU73N/OFrj23yDMw6wPgayYHqYomhBHuomFwuFaIMsacsDYqYM4
 Mv1H9WIsgnfRjp/9norC0yNzpWy7sPFWWb+P6oTZBk24c3ItPa3uc787YqRdNwhSI6w+
 RwDbikUbtx6YFVB0SxXrQFMsBUndC2LooxPfCHF8jvuqfPFH5RTy4v3O5E75yqFm0XPJ
 y7bwyFZbrBO/CG6XfZ+hcC9K0roaxTOTnLwEtt+ej37vIYxQ2KmXRvgJLykBiTt2wQRX
 ruwEzf9iSuSOqwaeFWwde0lZBW6UawOym8a6YS6K2ynCY46NfNNotwUe4C7hG7tGkUrC
 VY6g==
X-Gm-Message-State: ABy/qLbGprTFM6BuJvh8Q/VkimMJdUKmgLU5th9pSfFzsuLv/LxA4U7q
 9Zg6cIc3MyfZ1HoSjjBrTixEmA==
X-Received: by 2002:a05:600c:281:b0:3fb:dff2:9f17 with SMTP id
 1-20020a05600c028100b003fbdff29f17mr5373883wmk.15.1690995725356; 
 Wed, 02 Aug 2023 10:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm2149081wmq.8.2023.08.02.10.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 10:02:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 2/6] target/arm/helper: Fix tlbmask and tlbbits for TLBI
 VAE2*
Date: Wed,  2 Aug 2023 18:01:53 +0100
Message-ID: <20230802170157.401491-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802170157.401491-1-jean-philippe@linaro.org>
References: <20230802170157.401491-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XY5+O2GUVhs2

When HCR_EL2.E2H is enabled, TLB entries are formed using the EL2&0
translation regime, instead of the EL2 translation regime. The TLB VAE2*
instructions invalidate the regime that corresponds to the current value
of HCR_EL2.E2H.

At the moment we only invalidate the EL2 translation regime. This causes
problems with RMM, which issues TLBI VAE2IS instructions with
HCR_EL2.E2H enabled. Update vae2_tlbmask() to take HCR_EL2.E2H into
account.

Add vae2_tlbbits() as well, since the top-byte-ignore configuration is
different between the EL2&0 and EL2 regime.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/helper.c | 50 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2959d27543..a4c2c1bde5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4663,6 +4663,21 @@ static int vae1_tlbmask(CPUARMState *env)
     return mask;
 }
 
+static int vae2_tlbmask(CPUARMState *env)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
+
+    if (hcr & HCR_E2H) {
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
+    } else {
+        mask = ARMMMUIdxBit_E2;
+    }
+    return mask;
+}
+
 /* Return 56 if TBI is enabled, 64 otherwise. */
 static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint64_t addr)
@@ -4689,6 +4704,25 @@ static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
     return tlbbits_for_regime(env, mmu_idx, addr);
 }
 
+static int vae2_tlbbits(CPUARMState *env, uint64_t addr)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    ARMMMUIdx mmu_idx;
+
+    /*
+     * Only the regime of the mmu_idx below is significant.
+     * Regime EL2&0 has two ranges with separate TBI configuration, while EL2
+     * only has one.
+     */
+    if (hcr & HCR_E2H) {
+        mmu_idx = ARMMMUIdx_E20_2;
+    } else {
+        mmu_idx = ARMMMUIdx_E2;
+    }
+
+    return tlbbits_for_regime(env, mmu_idx, addr);
+}
+
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
@@ -4781,10 +4815,11 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * flush-last-level-only.
      */
     CPUState *cs = env_cpu(env);
-    int mask = e2_tlbmask(env);
+    int mask = vae2_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae2_tlbbits(env, pageaddr);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
+    tlb_flush_page_bits_by_mmuidx(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4838,11 +4873,11 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
     CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
+    int bits = vae2_tlbbits(env, pageaddr);
 
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                  ARMMMUIdxBit_E2, bits);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5014,11 +5049,6 @@ static void tlbi_aa64_rvae1is_write(CPUARMState *env,
     do_rvae_write(env, value, vae1_tlbmask(env), true);
 }
 
-static int vae2_tlbmask(CPUARMState *env)
-{
-    return ARMMMUIdxBit_E2;
-}
-
 static void tlbi_aa64_rvae2_write(CPUARMState *env,
                                   const ARMCPRegInfo *ri,
                                   uint64_t value)
-- 
2.41.0

