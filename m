Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4041396lfm;
        Mon, 24 May 2021 18:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys1y8FFHEc7hlqNpAe0espZGPIixXxu8Ti47PSqm60906zOVGHKdKid+5ARWVDiW33EU0J
X-Received: by 2002:a25:e795:: with SMTP id e143mr9593879ybh.178.1621907450835;
        Mon, 24 May 2021 18:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907450; cv=none;
        d=google.com; s=arc-20160816;
        b=jWIBcP6Fj58xIm5IIubudDUnqL0IR+bb/vQxHCGiS9wmXGHioSpWQDAV8MOj828w8R
         xdBbVZBHjpavxGplwKmEyvc11wNhLeU6ZD7DIq/NnOAr8ci31ywaC4klyLaRgmSkKntw
         udRTPl9k4kaq41A4l/rueDil2kSzjvtKw1MhBj9fXpTw+yE9A1g5S17dCxfUPgySP9Jk
         VLMx8nCLYgLWIhox0p5a+Col08J4PwQJqwx0nqjYzRsa4uO4zoaPNviKR5igXlAvV13w
         UrlgdzJ9xgYseSsNTX7SZMErYVoK8z1fTOVULRFI3sX68DQxo6Pk596/ijKQuvkOG9t6
         PJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J0U7o9nxMC5lTXFPuzpsH42oZtV01Y61hMVi7cku2iM=;
        b=0GA6Fvex3fgcW4dcPGcsNPOJmu0IBVLfaeqH4d6RBCuRlWjfiLeVzdU4n4eFWYv1Xl
         4Tlf2JgozFi23qoxnoqAGzqmB/NUmR5grEok6UdBLcYPT2VJmJKON0LwGsqugh12IfE3
         wcWYIDpFYz5hCv9kURS2D88HRvJeE/Lbumb6X7hhWD+Px65Ro/z1U5CRj6ecEolmhrCF
         P2DLRpoBm4cg8w7CKW3XlU/iMKCXdUKmPgxOPR40mAlFBbAfPSo/ThxMe79DG4hJgqzK
         RjRsRhREPFPXoa1WR61ixwNLHw8R/nNj7rhkLmK0VA+AeP09YAaNNnKtNpkAhBpCMyd2
         A3FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NM/c2nD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si15644685ybo.368.2021.05.24.18.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NM/c2nD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMDa-0007e6-6Y
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYQ-0000dS-Km
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:18 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043Z-4J
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:18 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g18so20613713pfr.2
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0U7o9nxMC5lTXFPuzpsH42oZtV01Y61hMVi7cku2iM=;
 b=NM/c2nD/9H9lClDfTd3VxN949tjLzbs23VKEJbEheD9Nary0ovqdvqMXwru5HkDhzd
 NtroxpNPyjUZjcdmTdLRf5KRC4Je5JlJz4E9jHsAvl+Vj2y3qGNhufb/JB3igcuNdv1w
 mqsF1WT0IyRLA6Rt6YZPK2HsxgmKkhugUXjJzimA7eIHOUgrM7SRzqZJYvwqPhlwxBnA
 ZDAOiXT+iJ8WkA9uoAU7dcTiizmRwO/ksk5IESW1fE82WT/FVHeY/hDcgn+lo/KSmT7w
 A0jfW1tMViXt1phgBIomVzmlZQ8ANU6vkiTgtia3EokytYPPqRxSt9XOttVTnZQwBhqg
 qC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0U7o9nxMC5lTXFPuzpsH42oZtV01Y61hMVi7cku2iM=;
 b=GYnctMpzXhgyi3KHIVUWiESBh2xwEJMiRwNNY1qJJSFJ2O2uX+SLtC8SBVXDcBTmx9
 oXKSBf0kZG5E8LdjNryiu5R4UrjtSw6fS3UDEGvzwAR5wz3l8b+CkBCX5Pb5J814dnOq
 /oAirwF40kIyeDZpoOpZ+VfFy/Khvt/izuSrHHSpy4+oAT2Qig6KlcDSPBT/crv/zP1Z
 SqSt4vWWXrUs/HwZNkZE7E2gi+PgXTWvnodrHBBZH3O68Y9Lhd3cWOoJLY2CPAIbsbvu
 GGkxobqPNpqEA3FH7tnmQ4Xv/EDOc3GTkuGkRYAzk3oUJGbJBKDMVStOJZiGJRsrpta1
 2wCQ==
X-Gm-Message-State: AOAM533d/a3Mqi5W4uuhUbT12xxd0p8GExanttvttmj2XiMGT+3lsYTj
 v3T7O894lfypkPWajK3z/GDFNw==
X-Received: by 2002:a62:ea03:0:b029:2e7:8445:243c with SMTP id
 t3-20020a62ea030000b02902e78445243cmr13102091pfh.54.1621904851700; 
 Mon, 24 May 2021 18:07:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 52/92] target/arm: Split out formats for 3 vectors + 1 index
Date: Mon, 24 May 2021 18:03:18 -0700
Message-Id: <20210525010358.152808-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: Ef7Gdvqpc6HV

Used by FMLA and DOT, but will shortly be used more.
Split FMLA from FMLS to avoid an extra sub field;
similarly for SDOT from UDOT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 29 +++++++++++++++++++----------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a504b55dad..74ac72bdbd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -73,6 +73,7 @@
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
 &rrrr_esz       rd ra rn rm esz
+&rrxr_esz       rd rn rm ra index esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -252,6 +253,14 @@
 @rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
 @rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
 
+# Three registers and a scalar by N-bit index
+@rrxr_3         ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_22_19
+@rrxr_2         ........ .. . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+@rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -767,10 +776,10 @@ DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
-                sz=0 ra=%reg_movprfx
-DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
-                sz=1 ra=%reg_movprfx
+SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
+SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
+UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
+UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
@@ -789,12 +798,12 @@ FCMLA_zzxz      01100100 11 1 index:1 rm:4 0001 rot:2 rn:5 rd:5 \
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-FMLA_zzxz       01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx index=%index3_22_19 esz=1
-FMLA_zzxz       01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=2
-FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=3
+FMLA_zzxz       01100100 0. 1 ..... 000000 ..... .....  @rrxr_3 esz=1
+FMLA_zzxz       01100100 10 1 ..... 000000 ..... .....  @rrxr_2 esz=2
+FMLA_zzxz       01100100 11 1 ..... 000000 ..... .....  @rrxr_1 esz=3
+FMLS_zzxz       01100100 0. 1 ..... 000001 ..... .....  @rrxr_3 esz=1
+FMLS_zzxz       01100100 10 1 ..... 000001 ..... .....  @rrxr_2 esz=2
+FMLS_zzxz       01100100 11 1 ..... 000001 ..... .....  @rrxr_1 esz=3
 
 ### SVE FP Multiply Indexed Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4f4b383e52..ae443f3b20 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,26 +3813,34 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
-static bool trans_DOT_zzxw(DisasContext *s, arg_DOT_zzxw *a)
+static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                        gen_helper_gvec_4 *fn)
 {
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
-        { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
-    };
-
+    if (fn == NULL) {
+        return false;
+    }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm,
-                          a->ra, a->index);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
     }
     return true;
 }
 
+#define DO_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_zzxz_ool(s, a, FUNC); }
+
+DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
+DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
+DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
+DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
+
+#undef DO_RRXR
 
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
 {
     static gen_helper_gvec_4_ptr * const fns[3] = {
         gen_helper_gvec_fmla_idx_h,
@@ -3847,13 +3855,23 @@ static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
                            vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | a->sub,
+                           status, vsz, vsz, (a->index << 1) | sub,
                            fns[a->esz - 1]);
         tcg_temp_free_ptr(status);
     }
     return true;
 }
 
+static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, false);
+}
+
+static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, true);
+}
+
 /*
  *** SVE Floating Point Multiply Indexed Group
  */
-- 
2.25.1

