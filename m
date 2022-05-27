Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1228983lfh;
        Fri, 27 May 2022 12:05:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/skXuGKhc7QD1pnc36JXgrwGHBSnTdeBxE/w1XxfrSGaB0JGK2fP5/2apWVe8JU3vu3T/
X-Received: by 2002:ad4:5f85:0:b0:461:e790:e812 with SMTP id jp5-20020ad45f85000000b00461e790e812mr36469776qvb.56.1653678346015;
        Fri, 27 May 2022 12:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678346; cv=none;
        d=google.com; s=arc-20160816;
        b=dMO90I9dLs9fFZI2rTts1HSuvmRMrGDDQmvmrC1S1y3WWW+5f3y47sL/FgxDYVV/yc
         ZYSkBtVsIU+x2AE1a4IyhAva9GyxkpFt5FXbcljx4xEzLGILpXg0XS4BqLE1ZKe9rYVO
         FfVtUPBWoI4LBM5EdBmwHeNfO2eZrBJez0HsIHtOw4JQFH6T1yllXqPwCn+Jun5Rd3dw
         DcwcTxhNDTAiQbc4dH+gkXhvFvhFwivu7HCPrD0YwzUNe5+jJ5EFfVZk4MwsFRX+OYLc
         6r2FXa70V0/XT57smC9++EwXttKztMuJ9mwg+5XqWPKUn56JQm/XCC9zD0k2DpPpkd+3
         wkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0jZwbSGmDVYYUKOSscWs7GEbJo3Q7mHcBlc9ur8AKu8=;
        b=RF/gX8JZjearNkJ8b5KQHs3g8SfhCaQKTFe/6WKWtG5Qa2wi6uaLWlWmu+3XG0U+tb
         9hyO6XqMP4nl8oNf6dnBOx2n40OlXeAZ3SzsMZrDw3hupXR5aeIFFjItPalKb1E4M4p6
         UvF4pEt9JRBU/DoUi5RDErFN01fYHiXTHUHxt+FENMl5N02UULa0YgGHk0fsFYGG1Vn9
         wynSlaob2Hq3m5epvXR92gylelJRwPU49eAzmHAQbDqYz5O8UuLUDbr1x2g9/MtntcaQ
         q65XRnXvLAHl7DCvXDLOcEVEWOH3xCmL3I4MCSbp4RiU1SXlwOySnJ2AyHgkXsVURsaY
         EGxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AcsHLLZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020a05622a035500b002f3eafd8285si3138340qtw.671.2022.05.27.12.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AcsHLLZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufHN-0000dQ-EF
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b2-8t
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0004Q8-7r
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id d129so4562586pgc.9
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jZwbSGmDVYYUKOSscWs7GEbJo3Q7mHcBlc9ur8AKu8=;
 b=AcsHLLZDL58b1WREfGXaqo0VcnYB+NUJbFlIUEIhNZL2z5V6D/TAroDGTzDFEj/u/u
 AHjbowdmlUJD6kqS6nA2xMN4IWRIbTlmxHGX1vbX/AJDZchKdFCJHSQjIoRv0M8iLNOV
 cmvD6FLH62KJJH7IafMkMbj8sQrf2KIOe79qn2GLf5JW/jor9zWq4CDCUZB4RlNgChYw
 SbWqf5jzURngI9C8r00PhdqmGBG/5GrGVwiV61eE7RME2tlzbXYoMLjc1se+RBFr1Fuk
 oHKmUNYj/JwG7Pgo6UvfjbeV08nCoVosTdGKaFFe0Ir9RuC3nLHC3DlSoz8dVaU09zij
 5Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jZwbSGmDVYYUKOSscWs7GEbJo3Q7mHcBlc9ur8AKu8=;
 b=zI/RPnVG1uhM98zpWMVd/xtWlBAt1YGuNEtFmfqobyOUbXFdrcm0bg/PUv2AN/719V
 9I/ftd/I8YcFi4WsoLKom6GdN51U+ND7N8EUHFcm6uT7Lapu043GzAtbbtTGaiaJ9qTG
 tsXsbdNO2CeYEdVUvetGeRCnxb8R9SKOo/5RNdxAn+7cOFdFbetOG86AJDRmlilxLzDE
 ODxY3mQeB9+F7CL1N9PL4HN9skB24YDMY3DZZKF9PdZK04/OY+NU0WEa7GQzGXsTW2xC
 L2Xy2O5kNuQr6XHUexDcQPcae5j1+s1K/wDhOJv2vYBF4/09EWtQs1PkXx6kdDpkrpAu
 +umw==
X-Gm-Message-State: AOAM5313bncHu7ATZa60jSQwJ61sgRJ44Ug1LaA5/tNZYmPLBZT+JE/U
 +TFPGVoeMrc5lXgYvjs0iHOKDA==
X-Received: by 2002:a65:6e0d:0:b0:3c6:12af:15b4 with SMTP id
 bd13-20020a656e0d000000b003c612af15b4mr38271772pgb.338.1653675781843; 
 Fri, 27 May 2022 11:23:01 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 057/114] target/arm: Move sve zip high_ofs into simd_data
Date: Fri, 27 May 2022 11:18:10 -0700
Message-Id: <20220527181907.189259-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1VEcez1rhAK6

This is in line with how we treat uzp, and will
eliminate the special case code during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    |  6 ++++--
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e0f9aa9983..3bdcd4ce9d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3382,6 +3382,7 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
 {                                                                    \
     intptr_t oprsz = simd_oprsz(desc);                               \
+    intptr_t odd_ofs = simd_data(desc);                              \
     intptr_t i, oprsz_2 = oprsz / 2;                                 \
     ARMVectorReg tmp_n, tmp_m;                                       \
     /* We produce output faster than we consume input.               \
@@ -3393,8 +3394,9 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
         vm = memcpy(&tmp_m, vm, oprsz_2);                            \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
-        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
-        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
+        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
+        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) =                    \
+            *(TYPE *)(vm + odd_ofs + H(i));                          \
     }                                                                \
     if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
         memset(vd + oprsz - 16, 0, 16);                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1e6bcedb9d..c2ced3e2bb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2298,9 +2298,9 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? vsz / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, fns[a->esz]);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, fns[a->esz]);
     }
     return true;
 }
@@ -2324,9 +2324,9 @@ static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, gen_helper_sve2_zip_q);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
     }
     return true;
 }
-- 
2.34.1

