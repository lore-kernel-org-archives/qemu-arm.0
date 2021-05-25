Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4044569lfm;
        Mon, 24 May 2021 18:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnzMl4R2Kn6PwMD3eZJwxkrOmL+bT1EbnzEVVqHSJbW4Gu4gJ6rFW7Zo6bt7JzmFYlGyPH
X-Received: by 2002:a02:ca4b:: with SMTP id i11mr26741188jal.77.1621907781429;
        Mon, 24 May 2021 18:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907781; cv=none;
        d=google.com; s=arc-20160816;
        b=l17+jxzQH/L9XB87VZoVK8B2ZqnRY2PzyjPRQ+QwL6+HeLNWQ5ki741IyQfBTOrFmC
         iUiQC4Z9TocJQ2O+RYRINY94iFevAofI8NdBu4u/dKcxIyTHUqdKNvyt7PD5XTD3DXYp
         luvKj7ta+FMCmvf7dC06/Lr7iQPFny6/st2RhxA4G3KjCDHu94JO4FousOoR/DAvZbR4
         3M5RMSBJK3BSzbRYdyfb+3GHzYZv6d3ZXsW9irvPEcng4T8d1rKatXl1z9vubZRnEZ2P
         PuCulwScy0+wwiPqCb+kWQSfwUCsE0e6SSqvLzzLzZDfBB6f/FRKVCWPa8t+eDBhE+lm
         Fdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lbC8FoGg2H/cVuag5f63FQxhwvwYVaxuD9dMnuei1/0=;
        b=q4MMQYHg0wSiwYYIOB1QAXNrd1CaKDcgbkZ6IxV2NEgIajHrfw6/ooCGnFvaw23yUc
         fQgDN54kfyvVXGYEAUn0VcH9J/DG16ENo+DVah2gsG3rEZ90ObNuNSWrUJMN3yMug8xc
         FtI/QdjPc8jU5mw9Nob7jHRSf/byPKKacjSDsRkAnr8LJ9uyf3EhB1cPrY6/svBlcqCB
         sP/rqA4jgF90LK6eC0kPsfotOEXSP2eyIvRRFWzhljajVIEAGi7zPpiL1Tmk+wiCEncN
         dEEHE6MMw4aKBAF+mItJmpjBZHABl+Z9hkbsfKqaB57x/ZO4OyQkB0pukAGJZWocRCbN
         xO1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2mqsEXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si7924510iog.40.2021.05.24.18.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2mqsEXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMIu-00045p-FG
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYY-00018f-1d
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXu-00049L-DB
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id u7so6943418plq.4
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbC8FoGg2H/cVuag5f63FQxhwvwYVaxuD9dMnuei1/0=;
 b=k2mqsEXQ4PmnHDU/7oM2qAYvChPVeTS4uCbN1slWLX1P71wuzNUp5loiw8Xr7FiXfP
 mBDQJDFA3jarPdFc6wur+KD75Yki95C2/3iMG8HyBcDzJfNkLwP/paKIBtUKYKasKait
 3ySVK/biOXTvRJqDoqyS+ZtZFH94L/nxrrzcY6DjqeaEppTVbozIv47HaA3pyRO1IkPS
 nFrN2L02Vmw2iheftEjgs9X71fkNQax5DPq2Kur6TQ6NMrqfwNYJzJY2o+4d462MIsTZ
 M/d6PoRR1OrZ+5ZibuiZ7QQp33WnZ2izXV/e+0fFEJR+5wSq6YisAjWRoxhizsUUIiUL
 Fjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbC8FoGg2H/cVuag5f63FQxhwvwYVaxuD9dMnuei1/0=;
 b=Xg0ChbUlRxv8MBhGBOMXr2V3KshlidxWbxXxsLHYm36JpMm7n/37hr/NM9ZCeDvbVd
 eLJy59571WvV4ddgO6FC4Hd2+ikxUL8Z5mlBfOgjegH6AA9zDSGbwnXiNxIyAdcj4l+a
 xxTus7CQytpIKu4HHFtayDZK3BQsYtY4TsMKOCjW752evF5tPmJcnAoRl3JNSlbv0285
 r0n2RZPzuza1IeN/T0Uec0UtQ25a8qoymO0ymj8zo2Ofy4Zs8FlkQIJ5woA1r4uRC03n
 yLbhEbXZx+iwWZRzqpLNUUCfRToT1UWKWOG1LZ06cUkyIuBPB/rhLW50zGabjbYXuOGb
 +nFw==
X-Gm-Message-State: AOAM533qgHO+3CA+M5UMyvYIZNTd4yRFBoEC9HiZw1Z3jPqmgT4Xt447
 7dahsgv+AywQr7lXCq8zoGsjiw==
X-Received: by 2002:a17:902:c9c3:b029:f5:4af8:259e with SMTP id
 q3-20020a170902c9c3b02900f54af8259emr28182938pld.41.1621904865126; 
 Mon, 24 May 2021 18:07:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 74/92] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Mon, 24 May 2021 18:03:40 -0700
Message-Id: <20210525010358.152808-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qAX49FqnpgKh

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1be3515470..5dcc79759e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1582,6 +1582,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7490094d17..0a2718c481 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4777,11 +4777,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
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
@@ -4792,7 +4790,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4803,27 +4801,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
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
@@ -8278,3 +8291,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
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

