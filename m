Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4017964lfm;
        Mon, 24 May 2021 18:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8T1WmptEGizQECYOfqGhTziRNlepp5AcuFh2Qhy+oUQdMeLs9SqPHnkbg6tfEqS/rMdj3
X-Received: by 2002:ab0:2c0e:: with SMTP id l14mr24303338uar.123.1621904871942;
        Mon, 24 May 2021 18:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621904871; cv=none;
        d=google.com; s=arc-20160816;
        b=pW1C30UavBfbC99jOF15rPwwDXq8Hb/cOVvFha8jaYmtGZQ5q/hAW+ZE6jsc193+X1
         jdsfApNx3CPZG/nwMLYxNwkYBBXTSWApWCpE5KFLVtxd41IsfZDoODQQrM2mcplJIQzT
         vMYpeXEjfw0QQr+PLQ+6HSxOsvhvdg21rqeTflkxjGc45/UmKE8wRBochmnotk6qzikX
         RChabDGG2Wg5qr2/EUGV+zXtOmdjACTB2t0I4SUgf8F7RviXrPrJu7jirrx2s3G8zb1O
         ZKL0qlfGNbAtRSkTuJ1h61Rot+crerFqGXj+w6L8l0UgizL0xlzozt8e8tjRUUo7mpvZ
         fGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jVZUYPn904dvokrZxIul+Uwhblv3yiIVTy/DzrmsM1E=;
        b=S/WgbaDC2UaMaFVHdRtNtX+o25TVIaUK4wVKPiJL/YBDYLhHzilex5R+J+a+gedYjR
         6TUlodCZP38OdYN8WmVwpInoqta8ArBk5asUrm1gmAcgidZVRSI9uL130lTN3Ti9rdQ6
         t7B+UVr+4kVUu+fTr3nqUmeuAxCTuwDqabtUQ+Lxi1LS9uMHwOLfMV9+2LmrH3smFlOS
         w7BKhX2AJEz6iajOYu/ihmI8XTI4p9HPzfnjcE+w1d/OHUy7c86yC8Cv7lZ+V7MSEtQ1
         zPrYW5etPbSEamijDDOFNcEzxlyw8bg+M25bdluoWt/NC+/5HzBlzEDPsenfTHJYPV5w
         npLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EiBsQbqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si6218953uac.75.2021.05.24.18.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EiBsQbqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLXz-0007LW-3h
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUP-00015p-GA
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUJ-0001dq-Ox
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id n8so10282925plf.7
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVZUYPn904dvokrZxIul+Uwhblv3yiIVTy/DzrmsM1E=;
 b=EiBsQbqg5JUy2jVDqufMkcd5skIWxCm19ZAdzfov1wzbLE0VcCEqcq3mCcmccp2GP/
 VEced8LEtUoGF9vh38/6VXmk7geP6anPdrcTmoIim4Qr6zoBG4i/cp6sD9aM+n8waAP1
 xge6vqML/PI6DJ/rqLsBWo193cyzOxE3arWCwrpS6JoAgIf5ZWopl10KFk/ivhgqKngf
 IY86pkiuFSe72P9opzaUWiyjfpdQdIFkaz5nSSerPqnWGJxPt28RHR7rCzb7eugU1MQ+
 QqHXBOO+nLIqwouTahJ/nLl2sWPNdQLJoniqVpCZn2RC4tINFySRYDZwxZoqPTRuzXJy
 GoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVZUYPn904dvokrZxIul+Uwhblv3yiIVTy/DzrmsM1E=;
 b=KsdXqqW5dHcEZhVLQZGF/kmGN974hS0+DbvLgfLtFNCPIEJJfAHD/2K63O2DFITE2J
 SOKZ/d3SCKSfegK7vxoZsVUrrONPi+BUI1JCd5o5XNV9Ae6Cio8dkoGrYzDoc4h7TQZU
 cLw2i9ZYKD9JD0KcThXmbanx5Q0r12eluDIZl18QKrpSvwBbKV2q6CQGpvXHVdf9vCUh
 eYVfeyUaNirpwDFvMXT/JNjlxK3RN6T357EQBPFdfp9/6dEo97nct1yAPGPP+F8h9uTo
 G9vYWl3Gy3VDHJWa5ekcmfaSbjT3f7a7pY2O3P7iLERY3AIneYw9Ib7KZ03/ciKV6OF+
 TwsQ==
X-Gm-Message-State: AOAM531+noqbWAIh3mDwmQkfs/EGFZkxE4rGcAOX9Km/uF8oINHSXhCH
 3MCqoV5DNutekSsfJaDNS8dpJg==
X-Received: by 2002:a17:90a:7306:: with SMTP id
 m6mr1979743pjk.217.1621904642421; 
 Mon, 24 May 2021 18:04:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/92] target/arm: Implement SVE2 integer unary operations
 (predicated)
Date: Mon, 24 May 2021 18:02:30 -0700
Message-Id: <20210525010358.152808-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/yjZ+boNhuy

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sqabs, sqneg (laurent desnogues)
v7: Fix rebase error vs sadalp/uadalp.
---
 target/arm/helper-sve.h    | 13 +++++++++++
 target/arm/sve.decode      |  7 ++++++
 target/arm/sve_helper.c    | 21 +++++++++++++++++
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b2a274b40b..9992e93e2b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -502,6 +502,19 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqabs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqneg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0524c01fcf..5ba542969b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1105,3 +1105,10 @@ PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
 UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
+
+### SVE2 integer unary operations (predicated)
+
+URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
+URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
+SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
+SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f44b4138cc..7a08c24f2d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -728,6 +728,27 @@ DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
 DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
 
+#define DO_SQABS(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ >= 0 ? x_ : x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqabs_b, int8_t, H1, DO_SQABS)
+DO_ZPZ(sve2_sqabs_h, int16_t, H1_2, DO_SQABS)
+DO_ZPZ(sve2_sqabs_s, int32_t, H1_4, DO_SQABS)
+DO_ZPZ_D(sve2_sqabs_d, int64_t, DO_SQABS)
+
+#define DO_SQNEG(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqneg_b, uint8_t, H1, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_h, uint16_t, H1_2, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_s, uint32_t, H1_4, DO_SQNEG)
+DO_ZPZ_D(sve2_sqneg_d, uint64_t, DO_SQNEG)
+
+DO_ZPZ(sve2_urecpe_s, uint32_t, H1_4, helper_recpe_u32)
+DO_ZPZ(sve2_ursqrte_s, uint32_t, H1_4, helper_rsqrte_u32)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 208d9ea7e0..c30b3c476e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5884,3 +5884,50 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
     }
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
 }
+
+/*
+ * SVE2 integer unary operations (predicated)
+ */
+
+static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ool(s, a, fn);
+}
+
+static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
+}
+
+static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
+}
+
+static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
-- 
2.25.1

