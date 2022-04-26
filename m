Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp376714lfu;
        Tue, 26 Apr 2022 10:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLvbGbZupZszic0nbILRtWyq0tLDtKKFgzBQQwq9aGA9ae8H66smP4YmtxqcPfnKZfzt66
X-Received: by 2002:a25:5010:0:b0:648:3dd3:da22 with SMTP id e16-20020a255010000000b006483dd3da22mr14184102ybb.628.1650992627326;
        Tue, 26 Apr 2022 10:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992627; cv=none;
        d=google.com; s=arc-20160816;
        b=xRt5sMD9uruINneSS+Gb4BTFBkmh55qJEPeVFtiU4Nps2ETRoLYIGsYsUH3S1WFN1d
         0LS6mSGQ0+6Pu4UacMBBumeEmPXyNQerldT1pN9la82jxvRDE5VV3xIKmDwF2li28Sc3
         dm/bGDfVGy+BI8JiCNsMSm7pfXNQi5kJCYmXvjyB3ops3ZT/o0aU1nVYWFdgDjUWyYdZ
         xsxAXwJGzrKqZQC4WBfiOq/Cw9WTztlA82ObcgZRb6LtjwQzpE2DjGKjeR6K8+wdXkvG
         h+VwD/pdgRQQe2Z+DY6z0q1wi3oJM9cHvmsd6va1Cdxn3TFc5v8WscnPiXPA5ElFVeb/
         vb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ACpxH01JxErVg11OMtWk96IeWBCSCK3eCBc3FiBtZOg=;
        b=voVpinzjMdFpTpVEckdI2MHzuwYyyO1ts/jiQsA35I5IiQHUR588kA617yTutDbCi5
         YPt0MVFpsaGXLHxENMibbGQa6mkZzpAHFd4bGlDrZO+yg6Cc41DCeAf9WrLhQnnsP6D/
         Ppj14vDG37mNQFvQlLD/qjs9BxX3hWvRP23LwgZ+Bgtex1ur5zLfwi6EwhO34X17DuDu
         sDKrB9N7F6+/+wpx7oNSm4I2Okm1qazFbcwOF3Ll3J/FT/izolpRExlhoYLrSskB79IU
         7zOlfxyN5DuUD2yvVx9a7zq1FeRW4y8MFqrBhIk9ULLnyc8G6KGVzPepfiQFM4XUPzKL
         wRmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paXVMvY+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123-20020a251581000000b006488672fba3si3815012ybv.310.2022.04.26.10.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paXVMvY+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njObK-0003AD-Nk
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO63-0003BH-AI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003yZ-5g
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so18434665pfh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACpxH01JxErVg11OMtWk96IeWBCSCK3eCBc3FiBtZOg=;
 b=paXVMvY+rYx8L28mBZA3hCozX+y65yxDNrgzppj/PxLZsGHreW9hQG1aDGXryyvPTJ
 dq3NgPFVmscDmcME4WRifbaSFlFoIZtMXypp2NWokWlj/HnrYld3BX69FREo5pVG8etK
 X1jZpArmOTh3189OszJWdnnxarQB8QV8/tFhDUC97+cSj5vwC/H2i7Qcbhr9CFdtdkub
 20MQyxQ6+pJqwaY3/0NfvAdO1czrglFUKi0bJjWQ+5QAW0KOhYHTXBB2Xqai0KZ8NH+U
 Iw2PZl6CC+ueXSEaOByLmfNOc8TK8jkN8d/Lyfy05BPunUV6zltTPAKRnyigNXPRFlTU
 4D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACpxH01JxErVg11OMtWk96IeWBCSCK3eCBc3FiBtZOg=;
 b=mvdcmuWismHyOJBRfUu6/oW6kDMeqrp/mVe+oKIrzpXXNb8O3eX7M11Vh3NT63mB19
 gv2ZWAtJMoeo83z7t1jiAYz+GmScY55B/H7NyA8ExSpUXZDIKI832pehb6Ec+jRs4tQS
 WwwNE5NUdxoHwRWuIDM49A9CcVp2MzJPnq+8JFOnnNc1Ubr7q20FnCy3pDVQT9rR15Wc
 Gz2bH82eFXbCHidgeBRjF9IghW6sf/+2XvRbEVaaEidcgP2nKu7fAC5AoqSJ+2fAAiGh
 mv/lb2shl5GZN6a0mHTTg1drmBH4qaBGln0dzGsGtlv2dk+NhbDjo5ZvNYSzcD9ALVAr
 hzcg==
X-Gm-Message-State: AOAM5312PrOSNHg3TQJCylghmiw37y8gUSUfys0qHqEkMr501ztOiVuC
 cRKKANC5eVutgkA/A+/ch8aOOHs/MLXMZg==
X-Received: by 2002:aa7:8215:0:b0:4f7:125a:c88c with SMTP id
 k21-20020aa78215000000b004f7125ac88cmr25623006pfi.70.1650990680328; 
 Tue, 26 Apr 2022 09:31:20 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 38/47] target/arm: Use tcg_constant in FCPY, CPY
Date: Tue, 26 Apr 2022 09:30:34 -0700
Message-Id: <20220426163043.100432-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /yDB5AmTovg0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9321457f31..ef57d3a2b4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2259,9 +2259,7 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
     if (sve_access_check(s)) {
         /* Decode the VFP immediate.  */
         uint64_t imm = vfp_expand_imm(a->esz, a->imm);
-        TCGv_i64 t_imm = tcg_const_i64(imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(imm));
     }
     return true;
 }
@@ -2272,9 +2270,7 @@ static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
     return true;
 }
@@ -2291,11 +2287,10 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             pred_full_reg_offset(s, a->pg),
-                            t_imm, vsz, vsz, 0, fns[a->esz]);
-        tcg_temp_free_i64(t_imm);
+                            tcg_constant_i64(a->imm),
+                            vsz, vsz, 0, fns[a->esz]);
     }
     return true;
 }
-- 
2.34.1

