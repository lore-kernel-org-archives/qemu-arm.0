Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp507207lfg;
        Fri, 30 Apr 2021 14:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI5iO58CLm4+yUfXmHlo8/+9DMkJx6MtaPLJfmzDjYEVcXz1OB5akne1U6aNOgqNy4FzdF
X-Received: by 2002:a92:c0c2:: with SMTP id t2mr5617724ilf.210.1619817808391;
        Fri, 30 Apr 2021 14:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817808; cv=none;
        d=google.com; s=arc-20160816;
        b=IQDTNnQhhiMrC9AzrsOwH7IHe9DGn4CGMTGf25Z1ajrKNHsgbrnT5P8u4uSZgUbL10
         kBL+CHohCPLA/27i4+DzZ6upz3Dfo6s4Jxywkxx2MGPvFj+gb77lgdajap2dU5wmnVyJ
         h4Fjo4KJnVGqqCu30Q+5s6AjdaACDv0/2jrsCzax6I7kYLFiLBd0nzFlKvgpga6O99Ce
         OKVGCiIGzRltfYrjk4kLd6q32ORD13KH38/8p+YJm3yQaSKWDWILM2umKkBgxRyIhpDB
         gJvDKooYPyHvuRV0ey47OoPWj9Aktng/IqThoJGawPKoAxEBLVCh27L+O2QCAGgJTLez
         qMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B/7aU0EzUxhV/kKb8WHkerqUukEIGKD6u5NHmPGNPZk=;
        b=bKrVlOcSAyp7Vv95Me38vnPnVRZzveBwBQS/5VLwzHbJbIpIBY5paZ/W/3Nae54mvY
         USfhGZYDY3X/xpmLT+Q1lhws2c2sgnMJvVUcyWJ73sV3t6up1SsrL6gdkk6VIsBQvmFL
         SvH91BcsoKWUsb0UpEf0DQneNfn4MtZN+84tiOOhC9XzybJzdbBemYhE9QORYhQhmIw1
         C7GlS+5YbuEjd+aZbHWQSFPYXTRvccKeGwFaSM4POEeRzg7CqVFeHF8rIimirk5G14iu
         uhbJkVJ4giLKU6zwNTroWH2RRUgzlgSL4u51vDlqhhs2oCVP4ye8GvvUYY/rqtz5Guyi
         wQqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHiPV3FA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si3768328ilv.74.2021.04.30.14.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHiPV3FA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcabf-0000sy-Kz
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZn5-0005DX-Fz
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007nI-L3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h7so8668715plt.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/7aU0EzUxhV/kKb8WHkerqUukEIGKD6u5NHmPGNPZk=;
 b=xHiPV3FAQFXx3WWVf2xNqEQAoO8qxfkoqt4t+6zsWr6wGJIzWKO2oyCdxrOE6tUd8E
 gAvcmpoGm2cbP7b0uP6Q+A94808Hx5dNrKMq0rZ7pyTgsbIW+fQmO+jJUJT1aNfaEUdX
 68PLfmemfMVlq5RtC7zC1zoKY23NI6Y4bFSaZhWGveMjcE7NE/Oh5/UX+6JEVYG8RpJb
 VZupCASnIyoWbTDGIeIYogg9yRS9sjSBCNl13iB2hPiVHAXA+9JSUuDzeySpltR508za
 14xYIv88lXHgJWQ41eg/86xr7bd/0Ig4nrQt8CixG+sY4R+r9AhPXbwZohEESSxePG+s
 +pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/7aU0EzUxhV/kKb8WHkerqUukEIGKD6u5NHmPGNPZk=;
 b=JJsLcuMf94dt/S2pi77BDX4AGPLMe7Jl0CaIYK3ENNvUTmaQbQ7BSCulhVTGCGLxDo
 tWY4eCGX/m63Y4YUg9S/y69mSMSaCqsATaURwyWJuOhv67nEQwbGbHF5aFURa8JDXWT+
 a2gIyMwAS9k2UP6IGb5YJ2idO1KMBAUIJjnWu3icriWON5NwzLt1XF2tfPZ/oQ8/USaF
 vCL9+DhoxmDLfCvUVrsW+MWegaS3LBThZfSl3ujkSEhmMyx+B6k+p3dzaqr440rKI2aH
 wG6tD0O81PLb4k2OK/G2F2KksP7fS1/IXenApls3E1tuELExk8LZ8HcrV7wCiTpHcj2F
 aDag==
X-Gm-Message-State: AOAM531LnR94XIf3cKlrK4RcGXr7D4akWS+7WR8w1OhW5U9Hhe+ho8qd
 2nakaeJBzxZvy/BozHQxwUkYPRG4myk1Qg==
X-Received: by 2002:a17:902:8604:b029:e6:60ad:6921 with SMTP id
 f4-20020a1709028604b02900e660ad6921mr7276222plo.15.1619814592834; 
 Fri, 30 Apr 2021 13:29:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 67/82] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Fri, 30 Apr 2021 13:25:55 -0700
Message-Id: <20210430202610.1136687-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gn70UkyVW609

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fb998f5f34..46153d6a84 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1533,6 +1533,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f5bf122204..87e5c8ac63 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4715,11 +4715,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
 }
 
-static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
+                          int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_i32 tmode = tcg_const_i32(mode);
@@ -4730,7 +4728,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4741,27 +4739,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_nearest_even);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_up);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_down);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_to_zero);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_ties_away);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
@@ -8202,3 +8215,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
 }
+
+static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1

