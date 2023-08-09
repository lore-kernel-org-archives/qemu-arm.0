Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2863458ejb;
        Wed, 9 Aug 2023 05:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39xB3lebowOi1LljRPW4vI04BeFYq2jLaAqZcKErSXZnS03iUCPldYbG2dlY3qUD2zJHV
X-Received: by 2002:a05:620a:1593:b0:765:a74d:62b1 with SMTP id d19-20020a05620a159300b00765a74d62b1mr2625545qkk.19.1691584672420;
        Wed, 09 Aug 2023 05:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691584672; cv=none;
        d=google.com; s=arc-20160816;
        b=O9sXwkhWCOuOYoSpa7o+nmeaA6glbSchHqTBEHIVETpBVl5jMq7A35AHJyYdaDrKzz
         oQPEu/Uu/k6jg/CoBWNhecRtwhU6pLJPGPasQBTsL4wnKyoVk66ngDB+ZlV52LN9A4PZ
         7hwCEIsCcEkWKwKlNPlkampVJ34xBcriFFnJd3iAkvSStgrxVAXyU25plwWQRxGF41NB
         lHg9HlQ76xUGuk9zZzW7/97PrEoh2KhEP6qrqcsiLT9bZCRQVAqIy11gly1QDVNXKoAE
         4T25BoX4XvennjsWHIQQJHzSUhe0LXhHhQaRVLeIKZHZkc/IcHJPoOlWQog/gP+BYoRm
         Sd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WOUJ2O8wk3azucCxl47Yh4O6mvyjFhsViu2d8wvZ4ks=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=H1nFu1B47KlRpGRsHZ/QCj2SDV2ek1pdRpJsBqo+Z3HB6f/CNUQ6EmTrB3UjyDg79x
         BV4ZQLzwNH2RskLj1j8XUg7zA9DKyB6tZeGnOrYhgHd04uuNCVoTaEaCJIexPgNADkQH
         XBgFR4TiRf7a9FtYwjX2ZzxnrLAnHzXlQUpqBLfyCDj7f54nuOnpOPevWEMzKE/Vw67g
         qu17GW3Q7hyJhzTskEL0L0i0rcZOIjrfl54Y6Ow+W8QqahrpoQz+1VH1eBZRhPwZyrfk
         4FwUnRzGAEHbh3FlOp3iacpbIg+XjeLvsQCw/Cr5LTaPBFW1S5fKasfb5Yg56HsAewSN
         8/lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWuysWDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a400c00b00765a5168fcdsi8014003qko.528.2023.08.09.05.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 05:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWuysWDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTiRJ-0002bi-H7; Wed, 09 Aug 2023 08:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRF-0002Xq-Ep
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRC-0002nx-B7
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:21 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so4827409f8f.0
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691584636; x=1692189436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOUJ2O8wk3azucCxl47Yh4O6mvyjFhsViu2d8wvZ4ks=;
 b=EWuysWDNim64SS5A3i4uOV6jXAePTz1uJ+Pb4pr7zw0kSb9bfL/p1SzApEdRL2OzFu
 Xv3nZKjm3iOISCVxDBtmA5LBsnd5TaO9NxCD7FP1C5kPPrExyqsY6qAyAzgEZ58apCto
 OsPyLAIkJuZe4xWHpilCNG8DSX4X9iUWKdg6r6YpsiUT5gBwOOhscCvZskb93Y4BTs79
 Aze30ai7Ef9fa35Oc2iIlFzQgywzgPpAxtq2Yh2pxnEqw+vnFphXdAjkz5yjVmFI19XF
 kXQc1qwQLrXOURdMmeyPKAHli51XjIZhE3c6VKWRj+NB2qUcWKF6epusc9LZxMBQjlDk
 eEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691584636; x=1692189436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOUJ2O8wk3azucCxl47Yh4O6mvyjFhsViu2d8wvZ4ks=;
 b=I5Yc+ycio8tMM+3zFOB8unAX2cOAwzoHnqdu5FTzuPyl3ZimQQYglps90VKXtYDpe3
 sB8xCA2HHhS7+D954+1G258P90/nxtbObP9eA+t8SUCPyCe3N1C6Biv3DBMTls41nYFg
 oJnc9eCmBV0D8TIKpm/1ciMGX0G1wHxpqZLYXTBV+LVbfwUtsI76ZQg9+fMBjPTsjQuQ
 98A1UBT8b7Wwupe59TPuSrPejmxj8FzsrzvFt6qM240uUWNfri9Kq2/9xhWtV2BlkZo6
 xPJikKgq+a99FohgRJqjh2rIvutJNdM1Efclwrb9QDPfwQEwz8AY72y5DjDZZhvMmXPJ
 z8Jw==
X-Gm-Message-State: AOJu0Yy1BgfDEFzypKyggi+/KTxQURnDQtZqzH9xcjR8ITAm57WqjOOt
 N7Adh/1QHXNzyyH7X/e3YpZYww==
X-Received: by 2002:a5d:4d8a:0:b0:313:e553:b858 with SMTP id
 b10-20020a5d4d8a000000b00313e553b858mr1742498wru.33.1691584635802; 
 Wed, 09 Aug 2023 05:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b00317f70240afsm5617888wrc.27.2023.08.09.05.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 05:37:15 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 2/6] target/arm/helper: Fix tlbmask and tlbbits for TLBI
 VAE2*
Date: Wed,  9 Aug 2023 13:37:02 +0100
Message-ID: <20230809123706.1842548-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809123706.1842548-1-jean-philippe@linaro.org>
References: <20230809123706.1842548-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: nGTsFqdVS67B

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

