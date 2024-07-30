Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2441746njb;
        Tue, 30 Jul 2024 09:03:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUz1fxfppcTgs++Zv6yui8bTkgW9gpR5vhjAFqtsTsYucrmgbC1ljg7jPReDNU+NMZiXH7ztLokMBkLKJUY1XqkCq90qpm
X-Google-Smtp-Source: AGHT+IFY3JINrpDjZWT8PP1iZD5xcI6ucSwjA4TUKzJeAxLjPhRICXd8Kj7lv7DGjS9KvXyfjyDz
X-Received: by 2002:a05:620a:bc7:b0:79f:1985:b602 with SMTP id af79cd13be357-7a1e526b013mr1036406485a.39.1722355414007;
        Tue, 30 Jul 2024 09:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722355413; cv=none;
        d=google.com; s=arc-20160816;
        b=QS+MAeZ3YY7qNIzCPX8LQqHmdxb/zTdg9F/MpmgXFIBl6bLQARAcHTHW9eLJH1yx2y
         T8hbM9Bprj6SkzWwsOUR3WE3xIVapqkK9mcwD8Dz8jw807TFTE5bWpi6yimxnpE/iAgi
         jD2fshlP/ApMssJfn5VtBpI7GsBSHeUmqnosKxTHoidUa/+RdlXPBODZXO+4hmJV5yHp
         jvAHE58+KSlaGmPqTjShiv8HpTLZ7IkfJdg/qoHyDlUlWX87gwJZy824JGQv4412YamZ
         x+kgdqRbkCTTbCNiGM92wFBJzG9lt4LQJgJJTVy8qc3qVAwa1fcs09c1FsgZCPXYDYAh
         n3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u/1r/oeOEIAX2gVU8SoWnDp6iCu5q8o/SWMbeXFkLdU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=O67D2FO63G13Ensfzwzitpj7zMu6vLl1WikSbPhAA2417bIEln+15bahwSIzl27Mjg
         db2MiffnHNBsg7UtTR6Nq+OsF2ghLc/gsztNmQ994LnF59LCGlTxT7iK8pVC5w5teAeU
         sjIAdkcFUgsWeO3j+CLyBmQecVdsAgpBdu61rYeOaKVifpi2XE/sVkJvy8idPNmDdf+N
         LaIIJ/GAnHySJ40aqKwMGZjlG3BgOQb4SIULcfDF1/bwuRKDyxnMRIk/ETfDlgvkP5uq
         oQL0xrHTHJRFMCqxiVBJqC4sQfnWkwHB1d8n5ZKKrtQq0PsQprguciHduUqB6agzcffj
         31sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhRvqy8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d739b81csi1309231685a.144.2024.07.30.09.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 09:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhRvqy8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYpJr-0003lG-Sd; Tue, 30 Jul 2024 12:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJr-0003i0-6M
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJo-0000Hc-8o
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-368313809a4so4406f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722355398; x=1722960198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u/1r/oeOEIAX2gVU8SoWnDp6iCu5q8o/SWMbeXFkLdU=;
 b=XhRvqy8JslX+a0T971HQhfSvFmuFR9lctr81xCuSIMvOyvMduFb29uvBRWhMRxQdL1
 AZtRSmum/sBOzOO/3LNNbOZ9ZpgDoNTEc7yLZviih7a5BJ01p+SfrufyxcrNDojsnDcJ
 T+WfWrzVeTYWuGbPJkgkC97b+bsZYgu5HYey7RkDxRcmc+kTlMp6PIwcb5sK72W11t5r
 fzSEIM+z1kWczybpV6MT423jjRCuR+cBExj2GaPa9rY0t9EhWDh5Uy8I1ZImzyfcX0Om
 gwxrX0mpuGrS8nXLzToFRJ7Y8nqSc3ScJtmYszWcMxPiWv8o13LTHW/CBzi0t3MfLraY
 g0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722355398; x=1722960198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/1r/oeOEIAX2gVU8SoWnDp6iCu5q8o/SWMbeXFkLdU=;
 b=k7CUcy9wYbPziCMMAQRMUXM5tPJHMi8Fo7bDOPlSdJlXfWzBEvc0W5oPCKcs43pDpW
 DLf7fQeBhvFTp358flu3juok7dhSP4rQMzsaBnd2oAXTGvLmzkBhXDDidcjqtWcxNZYo
 kbcwO/YWHLWQY9hwfcizDbOFPY4DGHAdWV3XKbuXIiF2CIfQzexRQ3tYTwbUjCRfZQI/
 YD/KqDj8P2nQQC/8MA1ipGgykxwqlz36qIg8oB5WChRivBCk4G0hgCkM6hiV1ec0SSwI
 seT8Ji5d9Vf8wbsAaDXpxHdkMNqFRjHUAGNY9dAPaUe51YxjMU3+CtuBGRuB9hPVg6VP
 hxvQ==
X-Gm-Message-State: AOJu0YyGbgJrcfNo9R2IXGUqTFNGMZA6jyEAWaZwxgsLOz92oZJ6R4EU
 BUZzZ2ThRPW4wgPdIRZSaccUZlhXIjAs0wWTw97GX/Z0eSEcXs2P86SsZ5MhAD/RAmPPXMhsGzX
 f
X-Received: by 2002:a05:6000:1a51:b0:362:2af4:43cc with SMTP id
 ffacd0b85a97d-36b8c8e6637mr1913162f8f.19.1722355398465; 
 Tue, 30 Jul 2024 09:03:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3685810csm15001676f8f.71.2024.07.30.09.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 09:03:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/arm: Pass env pointer through to gvec_bfmmla helper
Date: Tue, 30 Jul 2024 17:03:03 +0100
Message-Id: <20240730160306.2959745-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730160306.2959745-1-peter.maydell@linaro.org>
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FkWNtjmo1cgA

Pass the env pointer through to the gvec_bfmmla helper,
so we can use it to add support for FEAT_EBF16.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             | 4 ++--
 target/arm/tcg/translate-a64.c  | 2 +-
 target/arm/tcg/translate-neon.c | 4 ++--
 target/arm/tcg/translate-sve.c  | 2 +-
 target/arm/tcg/vec_helper.c     | 3 ++-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 386cf8686ea..93b830d2cce 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1032,8 +1032,8 @@ DEF_HELPER_FLAGS_6(gvec_bfdot, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_bfdot_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmmla, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a4e9740c921..33d49f524f4 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5630,7 +5630,7 @@ TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
 TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
 TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
 TRANS_FEAT(BFDOT_v, aa64_bf16, do_dot_vector_env, a, gen_helper_gvec_bfdot)
-TRANS_FEAT(BFMMLA, aa64_bf16, do_dot_vector, a, gen_helper_gvec_bfmmla)
+TRANS_FEAT(BFMMLA, aa64_bf16, do_dot_vector_env, a, gen_helper_gvec_bfmmla)
 TRANS_FEAT(SMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_smmla_b)
 TRANS_FEAT(UMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_ummla_b)
 TRANS_FEAT(USMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usmmla_b)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 7de157c539c..13cd31aad42 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3730,8 +3730,8 @@ static bool trans_VMMLA_b16(DisasContext *s, arg_VMMLA_b16 *a)
     if (!dc_isar_feature(aa32_bf16, s)) {
         return false;
     }
-    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
-                        gen_helper_gvec_bfmmla);
+    return do_neon_ddda_env(s, 7, a->vd, a->vn, a->vm, 0,
+                            gen_helper_gvec_bfmmla);
 }
 
 static bool trans_VFMA_b16(DisasContext *s, arg_VFMA_b16 *a)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8876d1f91a9..95e938662ed 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7123,7 +7123,7 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_env_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_env_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_env_arg_zzzz,
                         gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 1edde9792f0..77efb5f47d8 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2847,7 +2847,8 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
+                         void *envp, uint32_t desc)
 {
     intptr_t s, opr_sz = simd_oprsz(desc);
     float32 *d = vd, *a = va;
-- 
2.34.1

