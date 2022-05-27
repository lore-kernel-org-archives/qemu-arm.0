Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1264326lfh;
        Fri, 27 May 2022 13:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoPgbtdJL9wFoUeoFiNrXzZcGYDh16nXlorI8h27j+5qvLU/IqKNUGB/77tqQuapVfz1wt
X-Received: by 2002:a05:6214:262b:b0:464:3674:f789 with SMTP id gv11-20020a056214262b00b004643674f789mr1440834qvb.103.1653682579809;
        Fri, 27 May 2022 13:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682579; cv=none;
        d=google.com; s=arc-20160816;
        b=qxQ+g2e3kpQuwIU+zKKiqOg+X0kTUkViYqWFPaZeee7uagjWfZIYBYQRm+0m4XMO2m
         GV4R72RCoYS0N8GAw15zHA5QiE7OIHQELwDnNNk+PcshklHxpuXprPWl3PdueQ6mBHTx
         4gujDiDpGJhEdAfNawDpRaYkdk2Y25SD63uVDH3/WmMWdvJF+iEo5RBt4lpzUZqJwZMK
         d6EgwlGg7UUdPPtNKyr+iZsOGVNpGvL2tLGKEbeKhupT6CoppYEGLNiSKPHlLblSoZM8
         1uV8qZL+7m24xwyl6Dqkf1u0hZhoMrKjn/rnI849UhnpfGBL9ckzlpLHVrsVTPPJmBdd
         SsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=19AoXnrSycnpvxaVGAqD9BHk2ifXXPkSvDr/EVIdQ3I=;
        b=AUYY+RVcVpOdVvnda0VTigxBDebT6ZEgsBpyjhKdc7C2RLJTTAr50TY120IiW5gxjw
         XUdwEJodKD2z70OazoDDcbl7qUgkzF/L/uwLa60z99QBe/PKZs5rEQfdvk8SK6NBy2n1
         DRIVY4p5DwwLcWnypB3yWc1Ma8mOhRkxsAk8RWZPqmWVybvUcF92VeUlb/JfDxkasYVo
         KtbSelbc89PDc1mFNhn77lbDtWJxNy/Dt8TehFhTSqW6gz52/z/fxcqbNpICcgfMX+yx
         S6CGFF6jOZ41vzePiD8eGiH9y+Oitg1nMjRV9YNJRXcbrN1HomZZ+amRCqhWkk3+OqBJ
         CNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVaI5L3G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n68-20020a37bd47000000b0069fbe5d4116si3208588qkf.660.2022.05.27.13.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:16:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVaI5L3G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugNf-0003bV-7y
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefp-00027v-Cu
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-0005N7-9G
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id c65so4425953pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=19AoXnrSycnpvxaVGAqD9BHk2ifXXPkSvDr/EVIdQ3I=;
 b=fVaI5L3Gwu1bPYv1umi+71y2EHTrSSmVEU74cSnGsp9ivTf/2snuYK2QQ+Gp4aphQp
 nJOghldeEUxwDdbgwlmphSO6VaOc9GLTI3VCZnJU2KnYinhuERC8kvsEQkUKTqoZwU/x
 EWYWJQ4jG+7fWvUiB9iJr+M9jv/tqNbbyq8cxLXRNeXwP9lb0pIfRm+JLDWYYl6gkJ5X
 dNtlfc/so8ciz/breIxVPNC3QCkiAY/nmcoykarVI0+NX7GZRKs+TKqH9ucAopT3J/qL
 259pRwOoWu9DvNHCYJPJGc3MuysGuLEClpD44/cx/sds7O8MguWYKP7sYLiSDWJ0Ah1l
 8Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19AoXnrSycnpvxaVGAqD9BHk2ifXXPkSvDr/EVIdQ3I=;
 b=JcWhA/Ec5m5H1EaYldBCDPdiXl9BYIJaxooVwulQBpdG0b9RwlIWmpzzNh3Ui1qxyQ
 OyslQAah4g7tBBCJu4RDjI63ZdrFqZwAVAeKoYAOBFFH9jIdt1yDwpT7vzmqW+DII/Wh
 QL/vkmiZgR9a8wVugjC8/HiaMd5NJBmsKFsjr7MFQMX+BNF3y4xJQuSWECyLmsjZWYkY
 WDGgCFTnn5pb1f7tX6yS+VQdChCILd9KPCFS5SPkNvJ1U1b9z/ArNv5gkdNtzT3KgxKt
 4uRJuLvMxfij86KRFiuLK4nBDgJF0i7BxOaQDgEBlKirpaY8Q4VtNKP/nfD8HZduzIju
 u0PA==
X-Gm-Message-State: AOAM531dqRchnQA8KTsODAYHuoWU5QOP5ORORtZObUUgvYfgtmUBJpRC
 uHHvCiwPB+9KW6pK7cUo0N2x4xNPSdahog==
X-Received: by 2002:a05:6a00:1807:b0:518:ad18:e514 with SMTP id
 y7-20020a056a00180700b00518ad18e514mr24526669pfa.70.1653676010027; 
 Fri, 27 May 2022 11:26:50 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 108/114] target/arm: Use TRANS_FEAT for do_narrow_extract
Date: Fri, 27 May 2022 11:19:01 -0700
Message-Id: <20220527181907.189259-109-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iR9EyJT+FHFm

Rename from do_sve2_narrow_extract and hoist the sve2
check into the TRANS_FEAT macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 223 +++++++++++++++++--------------------
 1 file changed, 102 insertions(+), 121 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 70e8d90ae8..8e7f8308c7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6345,11 +6345,10 @@ TRANS_FEAT(SLI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sli, a)
 TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
 TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
 
-static bool do_sve2_narrow_extract(DisasContext *s, arg_rri_esz *a,
-                                   const GVecGen2 ops[3])
+static bool do_narrow_extract(DisasContext *s, arg_rri_esz *a,
+                              const GVecGen2 ops[3])
 {
-    if (a->esz < 0 || a->esz > MO_32 || a->imm != 0 ||
-        !dc_isar_feature(aa64_sve2, s)) {
+    if (a->esz < 0 || a->esz > MO_32 || a->imm != 0) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -6382,24 +6381,21 @@ static void gen_sqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQXTNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_sqxtnb_vec,
-          .opt_opc = sqxtn_list,
-          .fno = gen_helper_sve2_sqxtnb_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqxtnb_vec,
-          .opt_opc = sqxtn_list,
-          .fno = gen_helper_sve2_sqxtnb_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqxtnb_vec,
-          .opt_opc = sqxtn_list,
-          .fno = gen_helper_sve2_sqxtnb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 sqxtnb_ops[3] = {
+    { .fniv = gen_sqxtnb_vec,
+      .opt_opc = sqxtn_list,
+      .fno = gen_helper_sve2_sqxtnb_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqxtnb_vec,
+      .opt_opc = sqxtn_list,
+      .fno = gen_helper_sve2_sqxtnb_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqxtnb_vec,
+      .opt_opc = sqxtn_list,
+      .fno = gen_helper_sve2_sqxtnb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQXTNB, aa64_sve2, do_narrow_extract, a, sqxtnb_ops)
 
 static void gen_sqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
@@ -6419,27 +6415,24 @@ static void gen_sqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQXTNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_sqxtnt_vec,
-          .opt_opc = sqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtnt_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqxtnt_vec,
-          .opt_opc = sqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtnt_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqxtnt_vec,
-          .opt_opc = sqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtnt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 sqxtnt_ops[3] = {
+    { .fniv = gen_sqxtnt_vec,
+      .opt_opc = sqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtnt_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqxtnt_vec,
+      .opt_opc = sqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtnt_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqxtnt_vec,
+      .opt_opc = sqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtnt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQXTNT, aa64_sve2, do_narrow_extract, a, sqxtnt_ops)
 
 static const TCGOpcode uqxtn_list[] = {
     INDEX_op_shli_vec, INDEX_op_umin_vec, 0
@@ -6456,24 +6449,21 @@ static void gen_uqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_UQXTNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_uqxtnb_vec,
-          .opt_opc = uqxtn_list,
-          .fno = gen_helper_sve2_uqxtnb_h,
-          .vece = MO_16 },
-        { .fniv = gen_uqxtnb_vec,
-          .opt_opc = uqxtn_list,
-          .fno = gen_helper_sve2_uqxtnb_s,
-          .vece = MO_32 },
-        { .fniv = gen_uqxtnb_vec,
-          .opt_opc = uqxtn_list,
-          .fno = gen_helper_sve2_uqxtnb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 uqxtnb_ops[3] = {
+    { .fniv = gen_uqxtnb_vec,
+      .opt_opc = uqxtn_list,
+      .fno = gen_helper_sve2_uqxtnb_h,
+      .vece = MO_16 },
+    { .fniv = gen_uqxtnb_vec,
+      .opt_opc = uqxtn_list,
+      .fno = gen_helper_sve2_uqxtnb_s,
+      .vece = MO_32 },
+    { .fniv = gen_uqxtnb_vec,
+      .opt_opc = uqxtn_list,
+      .fno = gen_helper_sve2_uqxtnb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(UQXTNB, aa64_sve2, do_narrow_extract, a, uqxtnb_ops)
 
 static void gen_uqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
@@ -6488,27 +6478,24 @@ static void gen_uqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_UQXTNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_uqxtnt_vec,
-          .opt_opc = uqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqxtnt_h,
-          .vece = MO_16 },
-        { .fniv = gen_uqxtnt_vec,
-          .opt_opc = uqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqxtnt_s,
-          .vece = MO_32 },
-        { .fniv = gen_uqxtnt_vec,
-          .opt_opc = uqxtn_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqxtnt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 uqxtnt_ops[3] = {
+    { .fniv = gen_uqxtnt_vec,
+      .opt_opc = uqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqxtnt_h,
+      .vece = MO_16 },
+    { .fniv = gen_uqxtnt_vec,
+      .opt_opc = uqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqxtnt_s,
+      .vece = MO_32 },
+    { .fniv = gen_uqxtnt_vec,
+      .opt_opc = uqxtn_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqxtnt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(UQXTNT, aa64_sve2, do_narrow_extract, a, uqxtnt_ops)
 
 static const TCGOpcode sqxtun_list[] = {
     INDEX_op_shli_vec, INDEX_op_umin_vec, INDEX_op_smax_vec, 0
@@ -6527,24 +6514,21 @@ static void gen_sqxtunb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQXTUNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_sqxtunb_vec,
-          .opt_opc = sqxtun_list,
-          .fno = gen_helper_sve2_sqxtunb_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqxtunb_vec,
-          .opt_opc = sqxtun_list,
-          .fno = gen_helper_sve2_sqxtunb_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqxtunb_vec,
-          .opt_opc = sqxtun_list,
-          .fno = gen_helper_sve2_sqxtunb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 sqxtunb_ops[3] = {
+    { .fniv = gen_sqxtunb_vec,
+      .opt_opc = sqxtun_list,
+      .fno = gen_helper_sve2_sqxtunb_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqxtunb_vec,
+      .opt_opc = sqxtun_list,
+      .fno = gen_helper_sve2_sqxtunb_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqxtunb_vec,
+      .opt_opc = sqxtun_list,
+      .fno = gen_helper_sve2_sqxtunb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQXTUNB, aa64_sve2, do_narrow_extract, a, sqxtunb_ops)
 
 static void gen_sqxtunt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
@@ -6561,27 +6545,24 @@ static void gen_sqxtunt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2 ops[3] = {
-        { .fniv = gen_sqxtunt_vec,
-          .opt_opc = sqxtun_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtunt_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqxtunt_vec,
-          .opt_opc = sqxtun_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtunt_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqxtunt_vec,
-          .opt_opc = sqxtun_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqxtunt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_narrow_extract(s, a, ops);
-}
+static const GVecGen2 sqxtunt_ops[3] = {
+    { .fniv = gen_sqxtunt_vec,
+      .opt_opc = sqxtun_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtunt_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqxtunt_vec,
+      .opt_opc = sqxtun_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtunt_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqxtunt_vec,
+      .opt_opc = sqxtun_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqxtunt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQXTUNT, aa64_sve2, do_narrow_extract, a, sqxtunt_ops)
 
 static bool do_sve2_shr_narrow(DisasContext *s, arg_rri_esz *a,
                                const GVecGen2i ops[3])
-- 
2.34.1

