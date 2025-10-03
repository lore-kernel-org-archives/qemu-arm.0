Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09ECCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:10:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jHB-0001eC-Ar; Fri, 03 Oct 2025 13:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jH9-0001de-VT
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGU-0006Et-HZ
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2897522a1dfso24244495ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511287; x=1760116087; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVdjjmeNl369fORWFFYrAmuAxl5OexK+Goh2FzAHrEY=;
 b=cbn3Oo440JYyjLJNsXP0iezSlZde3jTjGksEezK16uWzlSBF72ocHIONJV7orTJoDz
 7oFjgbFVF1qzHXOyMeRAMeGmfgc8JKgjcEaTksQpoch46j9+TtKXhKjMaBmTX8eFMyNF
 ZGSGb0krxCvrQcfSiQQzZ9hff4oSA/fOrtfUrFs81ZAQJRwwZL71nz1svGSFPwWLWvmk
 Kf3wA81Ac3UqqOr5C8jZNqNZrywfFAhfhqGmJk/wNdTYigZHhL07KfOBKT9kEtCclWdO
 nwDr5svExr/+aiQxWKZ7BcNl/+uXkaBBpxy6P8tnwFstpKyivvLxVdJWxe19OTSl9xQ9
 TYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511287; x=1760116087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVdjjmeNl369fORWFFYrAmuAxl5OexK+Goh2FzAHrEY=;
 b=lN42QdMA/XM9T52ql2q3B/ufpMwCbpieNdFih1Y24rfb49RddNRK1p9ZNEOYF9xH+U
 2G1gtUx0CxULeHF0R9FeSPOagd6aFC18m0BRvg8tvU3kL+g/sLMhuOgY7JEqR2rSHewx
 gAx9NqHb4Ky9tU0OHqYJknnImZRfyScYpP4y6DChlgx4c+u3bZbvhmxFLc/HMBxPCbWW
 81UsK+NJ5xxw0hJNlD3qhAQGjmV5JqSTp/Ent4LhxmMmFipsuf9BQpjZtc5zbfCfHgWx
 8ajLpiciGUa9RB4pOrD+6My29Vta90aOnDNEuQ0mypiyFzDf6vmD3yRBLavrMgpSyCpd
 n51w==
X-Gm-Message-State: AOJu0YzntMQUxSamRWrgU34/me5ld0UEzG8I5oP1CmPuu75kBCt2puGK
 RwQew96rqhisBSTO+n+EY2NDgoNeA+rKOwpvwwtW5DQGLaB4KiyemGkgeOAdDP0by7v7ieq0/Iy
 pBhoR4VQ=
X-Gm-Gg: ASbGncvMWK/mvdi/ojTFjDuvC5tVauQquLF4Hd4bXz80pqQHcPAI2OpwkLkJP+LZaW2
 3FYwuAv0tBSG7i8KaAln85mCBB9zYqoEVeEYLthHxxp9NvUjC1UffMlVkCRS2MI1ZJx5JVpQZDy
 o/Pgz2Wc9Dbf9SsV4tyCoLgAWzc9G70EWL450oApNPmzQrfVVQLMw+X86EV7j7c6awLjdkHBIgl
 fIig4eN8fvsewcD3kkPx3vf36yoKilBBsRF0SO8MERkWo57C8Iu9lsvDo/BhmlfKhex7FrPaKXd
 KTIXecfy6xruuMfLbRmg7gfEHvnHjsCWhn5+lJ5cs2j/pOo11zVwZNvzHALxzLwGpd5Nrkfm1T/
 Y/WsX9ho3oQ6bZU9TiYd/OzedH4FceBtdoCygFbgO7X3+DS7nm9UILaPO
X-Google-Smtp-Source: AGHT+IHvfTNb+qoz9SMrc4TkGjPndigteGGKkkJLSqCpXhjbJGh/mCzNmDm5Sam6c9ztGxPza7fdhA==
X-Received: by 2002:a17:903:2f4b:b0:272:f27d:33c7 with SMTP id
 d9443c01a7336-28e9a2fe26emr41738785ad.0.1759511287286; 
 Fri, 03 Oct 2025 10:08:07 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 06/73] target/arm: Cache NV1 early in get_phys_addr_lpae
Date: Fri,  3 Oct 2025 10:06:53 -0700
Message-ID: <20251003170800.997167-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We were not using the correct security space in the existing call
to nv_nv1_enabled, because it may have been modified for NSTable.

Cache it early, as we will shortly need it elsewhere as well.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ebb260d54d..d6d704e2a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -76,6 +76,8 @@ typedef struct S1Translate {
      * may be suppressed for debug or AT insns.
      */
     uint8_t in_prot_check;
+    /* Cached EffectiveHCR_EL2_NVx() bit */
+    bool in_nv1;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -1641,12 +1643,6 @@ static bool lpae_block_desc_valid(ARMCPU *cpu, bool ds,
     }
 }
 
-static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
-{
-    uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
-    return (hcr & (HCR_NV | HCR_NV1)) == (HCR_NV | HCR_NV1);
-}
-
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
@@ -1698,6 +1694,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                    !arm_el_is_aa64(env, 1));
         level = 0;
 
+        /*
+         * Cache NV1 before we adjust ptw->in_space for NSTable.
+         * Note that this is only relevant for EL1&0, and that
+         * computing it would assert for ARMSS_Root.
+         */
+        if (el == 1) {
+            uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
+            ptw->in_nv1 = (hcr & (HCR_NV | HCR_NV1)) == (HCR_NV | HCR_NV1);
+        }
+
         /*
          * If TxSZ is programmed to a value larger than the maximum,
          * or smaller than the effective minimum, it is IMPLEMENTATION
@@ -2073,7 +2079,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         xn = extract64(attrs, 54, 1);
         pxn = extract64(attrs, 53, 1);
 
-        if (el == 1 && nv_nv1_enabled(env, ptw)) {
+        if (el == 1 && ptw->in_nv1) {
             /*
              * With FEAT_NV, when HCR_EL2.{NV,NV1} == {1,1}, the block/page
              * descriptor bit 54 holds PXN, 53 is RES0, and the effective value
-- 
2.43.0


