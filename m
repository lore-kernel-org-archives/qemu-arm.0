Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2885451lft;
        Mon, 27 Jun 2022 21:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbLxPKFtf0uJZotkhllJLic4P2gRB1ZMuZrGMSgCAz9A+yDK20yujgo7Cscm11Zomxs208
X-Received: by 2002:a05:620a:2a06:b0:6af:20f4:5f29 with SMTP id o6-20020a05620a2a0600b006af20f45f29mr6441399qkp.253.1656390395527;
        Mon, 27 Jun 2022 21:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390395; cv=none;
        d=google.com; s=arc-20160816;
        b=A6MfTCOoPvKlLxvl1g20rssal1afVD2OkFdQvCPxgvbfU+09QAjuFQ7/4KhgPoKfxq
         WQ7BGNISNRJOO09WxUVn7fMHuaJcEdVYKlpBPtXlh+15ipWqD4KjzLU0sYQUqykWzdi+
         fGmAcvGSVxPq71Ifik8J3ouR+WG+s/5E0oO5FTtWBicie9yb7qOpzhIs5u0NErqjhjk0
         Q8/fUPHytCxzUDjGlhbIyDHyNemub6kiroM229LjIdxQFt1ygdA8UOZ4r5BFOJ7pKKhW
         bK/ive3jIDW/W+5fARVATDQAFDLc4GVOHWlQfCEjd2fTdS230hUxw5wSHnLmoJ5NHmtZ
         +m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BrRYGwzjzVwnaJEo7+6hrwlrxFObfEt4K9E/YNerK6s=;
        b=cjlYr+gV9zR6Ov1+OqpR523KX43lZYF8XZCikllT5TwvdbwSLD4rBNkZjNNRWcMy9y
         EY+zgTscG2RVOTBIurHacydlN9Jt5okdAoPu/7DEb6ts5QellwX04vELa7WKKMF/es6v
         Na25TPk1fxJQFzf15ZEW5udH0LwNYs9lmRFEGRGPi2wzbHjxbawKiNfve6XeTfUyVUVD
         lBWXPfNGgSNjzK/EYiwPD5rDm97webIYHHRs3WVdiy5Zus7VRMtKtJt4Uj8//6LrnS8J
         X21T7bedNDloCCR4OrDLlFcSjM8twdKDIm7+/URQ94xOrsQig+jGumIUeOVYz0QGGSBB
         9mMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mBFY84eS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05620a454e00b006af2186d52dsi3276569qkp.473.2022.06.27.21.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mBFY84eS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62o6-0008QZ-UT
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jH-0001Im-Ne
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jF-0003eH-QS
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:35 -0400
Received: by mail-pl1-x629.google.com with SMTP id jb13so9965357plb.9
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrRYGwzjzVwnaJEo7+6hrwlrxFObfEt4K9E/YNerK6s=;
 b=mBFY84eSCfdHPekN0KwQG3dADRKUWO2WmhWFvGbHUbji+F9BpLBUp5lDidJkss3W94
 YExJFpfhX/BuXVD+J9XRkNDYTtUsUUA1kOsknNkzZuzp15ebq5rbbSotdJ5R/tDFq5j2
 Gb8ZDlktNsOvjDwYCzXc+XIS8Qvj9q9eiEammff2DgpPStGi3XN4J18+oR1oSNv+qNZX
 30Y0FBT4jr7a9FwhVYSrVL8AAzRUf6Khf073mHJpng/Qt6w/hhHYgs6McwcGz3Y3N68d
 2gIJI2ZhKXGFtn4gja6TgkGSt+mJK+tS5NSpUad2JPSmgYuIuhOjbTi8SXbBVvbvn6yK
 Gqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrRYGwzjzVwnaJEo7+6hrwlrxFObfEt4K9E/YNerK6s=;
 b=mpbj3aoS0kWOPayPHZyQREZLpuKlA3zEl8gMSCsCropgL8J3rA7WX3jR6xCLKSlAg+
 1uMVwtm9UipXE+1qgz4iLLSOwh5UVqja2KK/zTt0bjcwSklGehtxYjvW2Tb/XrkU8qsk
 kZsNovaQeHFVMhj3GVbpBecMyjocoO8IPYMBd83U8N+D4SdJg3qdKE9S4zPn5c+coi6b
 yd6/IjRM8Fvhr6ESPMzrRNM/qRb41wkFW6Gb5H5oJA3MUIA3uJAc9gcLBwBNZy4MJoUC
 sUio4JZqxEnqpZTsctT1+iYlFUDtcSf9jS4eqy60fdq4zsGrGbfViKBnHQ9mqE+9VMKv
 GZIA==
X-Gm-Message-State: AJIora/FY5romfAztBNTVdvf9wDGR/beFMSEV9zVw/xPbpPLYOVvgh4I
 2S5XmB4DARrQYBDp1X2kWbhEXw==
X-Received: by 2002:a17:902:f2d3:b0:169:77a:2e82 with SMTP id
 h19-20020a170902f2d300b00169077a2e82mr1699122plc.146.1656390092459; 
 Mon, 27 Jun 2022 21:21:32 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 04/45] target/arm: Mark ADR as non-streaming
Date: Tue, 28 Jun 2022 09:50:36 +0530
Message-Id: <20220628042117.368549-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C7G+MxJLC9Lx

Mark ADR as a non-streaming instruction, which should trap
if full a64 support is not enabled in streaming mode.

Removing entries from sme-fa64.decode is an easy way to see
what remains to be done.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 7 +++++++
 target/arm/sme-fa64.decode | 1 -
 target/arm/translate-sve.c | 8 ++++----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index cbc907c751..e2e619dab2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -566,4 +566,11 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
     { return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__); }
 
+#define TRANS_FEAT_NONSTREAMING(NAME, FEAT, FUNC, ...)            \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
+    {                                                             \
+        s->is_nonstreaming = true;                                \
+        return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
+    }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4c2569477d..bce717ae5f 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,7 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1010 ---- ---- ----   # ADR
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
 FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62b5f3040c..5d1db0d3ff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1320,10 +1320,10 @@ static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
-TRANS_FEAT(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
-TRANS_FEAT(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
-TRANS_FEAT(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
-TRANS_FEAT(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
+TRANS_FEAT_NONSTREAMING(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
+TRANS_FEAT_NONSTREAMING(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
+TRANS_FEAT_NONSTREAMING(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
+TRANS_FEAT_NONSTREAMING(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
 
 /*
  *** SVE Integer Misc - Unpredicated Group
-- 
2.34.1

