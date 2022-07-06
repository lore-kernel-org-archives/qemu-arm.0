Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4557738lft;
        Wed, 6 Jul 2022 02:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJM0Sl4RT32/N+ZXu19M6HmRyihhSvkCZ5MY6Ft0HUK71rHfp6eOzO+x0KfkvG1Y0k/2Xn
X-Received: by 2002:a05:622a:50d:b0:31e:7dcd:891a with SMTP id l13-20020a05622a050d00b0031e7dcd891amr9262249qtx.427.1657098529683;
        Wed, 06 Jul 2022 02:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657098529; cv=none;
        d=google.com; s=arc-20160816;
        b=F6CYdODti19tgtZjS+UkkDwavC0jQFHzNNCQbO9EbDND4fqWAwWLAtgBPeuKFVBiGb
         i7x4/f9deztRSLCGeLSHtew/aeF/xAnqwPfuCkkBbSVnuGTPt83+yGqbw1EcHBLJp9GQ
         vskNvcax2B38G9jcKbdoApw14Eo+Vc9l0E8YNZde/wpvb1SkD0BjoAcmJGTJchm5iKWi
         LDnRmEVx115VdO2gy/zhfeFzej8OpctOJFfoMM8mBj018BCLp4bFB+OKbRccEXLe9Hq3
         27mq2+7k406q3TJzhZ+Z4GkdH+qP+k3QizUCW9NMAOjEYTwRo6LQRHW+tfHTj1gPJWGD
         Z8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
        b=fhfcQFSUs6tx++KEqIvpe8Iy2e149GbDi9Jz+TQhRadv98S/XigLHT/jVvG+BDlDrA
         k5Z0vaIdmUrUK/CW9FH4l3kT2xj2ASZs0sM1kDdQOAfC501AhRgdJXQyhv+vrrMEXvwd
         NY0jc322KFTTaBAC/Hm4cKt/dDI+RIbFTZyxSrbwPTjJjvlUWwqk3FZoFWOXOAWUGr91
         UoFRDsQQ2Th9UEaQBpiEkTxb8aSue2DMGGGfuR71FtWAg0LOJL2C+VifQ5YdxadI4nt6
         nczGvgmS8ruubbdyFPWtTmNNAT4lvWYyjqBLXBcqOO+oXqZcAhvxgiK9qTvlMJtza8Bk
         vBhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NuXoMnXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac85a95000000b003184128f6a5si19902334qtc.525.2022.07.06.02.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NuXoMnXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o911d-0005es-5h
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LP-0006Jh-KT
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LI-0000b7-Sa
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso9762902pjo.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=NuXoMnXnfDmcOUZGSDzlpkHavqVKjx+UMW6mQRx7rkCl+/D6pwSBAdxqWFL95y3nNe
 OLizIG56JLeziIkqo8ANNaW5NfP4CBFH0KB9xd0aRwDS9MtxTzj6C6vd4fprcCYhuqCv
 MH/iL/wASq5iKXFAluXnmYH1Y9KIkgKG1leoWVUpkhMBuZcAUC48DPqjGu8honUMD7Fq
 19iPFzaYFjUB+690Tl/gtPp7poIXQ8cQYoqpv26/TdGT7mIHqSKNVh6kqsOfUm9cJQLt
 3ZPTwZK1stc/kIu/G0LJ+U1/2nj3wq7VbBx4KmAS+kz9P09jRl8EO43T9GI1uiC37Z4T
 Pqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=zHV3nOGwLrG0j7jOIuL4J055ZmdIP75ZZrb48ME3XZHDsc3QocdD9+i3Xev7usW8Iu
 MSiq45Nv8UzMvjlFgZCzqAO3gHHvNtj1B3m7YCGZIL80NgFzu15k4H+w+DgAeT6eSf8U
 eHDsL7bNlKbUGea5tStkSsqEAp0k99gTytFQWnDW6llCih4BGbQ4K67DkjBadCr6WS8Q
 orkruAImmlz0oXATDIDZU8UH0F2kMCF1sk5M3yOnR2zsMzAmZQJN6AAcIpF+RuxLS63c
 42KFplAQ4/dAWZXzhAVoeXvI4BB/ZfcZO3XwR9RrSa9o3JL76EVDurzcYr9Sskk7kz70
 ONKA==
X-Gm-Message-State: AJIora+kMYx+YfZUBuEgDVg7MD2NzaefqUuyE6rVpMgd6BL+wvuJgxia
 kWbYWCjjShp2nQBCqTkZ+I9irjM3gD8zqo3v
X-Received: by 2002:a17:90a:ca89:b0:1ef:7de9:ac45 with SMTP id
 y9-20020a17090aca8900b001ef7de9ac45mr23548856pjt.59.1657095902990; 
 Wed, 06 Jul 2022 01:25:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 18/45] target/arm: Implement SME ZERO
Date: Wed,  6 Jul 2022 13:53:44 +0530
Message-Id: <20220706082411.1664825-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /aZDtfVaWGsM

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix ZA[] comment in helper_sme_zero.
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..eef2df73e1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..971504559b 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.34.1

