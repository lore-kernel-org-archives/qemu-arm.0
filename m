Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3803655dye;
        Wed, 2 Jul 2025 06:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7lTV97gXnH/KWuzt/qlPJ1ouEu2Dme9fEUNg8MrtJhxiQWgrbz+vbe9v73P4ICznt0sO4DbfxeEugqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFQ5jQ9sCHuQPlh0Mfzbg2h6vXZuJBdsubbQ2rFS1uhigLZUtEBVHR+5CZlMHYETQ2xmhZg
X-Received: by 2002:a5d:64c4:0:b0:3a5:39a8:6615 with SMTP id ffacd0b85a97d-3b1fd74bf9emr2113212f8f.11.1751462101440;
        Wed, 02 Jul 2025 06:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751462101; cv=none;
        d=google.com; s=arc-20240605;
        b=T8qngCe/XbaDcahiQ3inlpwYkDO+kWvV5gQeUnFIBErhkxFSF8Nrk+fgzhYMpHgMSJ
         db1uwo86qXjNygEehnhUgbHAZVXtxLipJjhaKauuBed6cjfeiRuUdoM2dQ2YJeLBj/Qn
         UkNLnX7R5wFdXaFRfsKSeYQg2FZ/lS8Rj15VwwyRylxQ+/ChcYDxUVmYoYfXmfkBS5l4
         TDlcTdWsVKx8guZLFLAV/dy/V/ckAZE0HcuIMXTqHhKmpysFYKm1Fa9ILznTUZZR5iH5
         psCEEyja7zXuPTyq2i7zv3lwlZGWFrSJCbnFKn0qG4BmcOqFgA8wfRu6NDfMV08Qg8f+
         4iQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IQbTCIZfXAx+H1aXpv73PAoNk3q2xsGUdD62vzGqb0w=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=dVCFAVb6fhsvaL6WhKKizLujhtSk3mePNgNpjwoKUDLzlHtIl0b2+vV578gWv1up5W
         pqbb6p9KYrfcnJbTzVjm9PNpv+CGK+MZl1Lnki9sPsJG0z7jp41dWRBwZdyQrOso7Zmy
         5H6d7ADA3RGQHEXdCjBMybSHUTlW0Xx7TzTzzm1S6yQrbMBYXjdYGE4w4jbLKTMCFcc8
         82B6mxUCZHrjXto05bYhjF0I9XUhRCEBef7iBJGjnA0h/0iH+N1mAatWUeXQ/+HqT5pa
         akrERr3/WfZM0h+Co7TmFACF2NV6aMfwFXEnnD/TT/6ojQHhw1aq1qBYkrTDKkGlYUVH
         96lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSek5vck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a081035esi9455625f8f.603.2025.07.02.06.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSek5vck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwtK-0001Qv-RC; Wed, 02 Jul 2025 08:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn4-0008Ua-O2
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:20 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwmz-0003AZ-Sr
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:18 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so3763387fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460126; x=1752064926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQbTCIZfXAx+H1aXpv73PAoNk3q2xsGUdD62vzGqb0w=;
 b=bSek5vcktT50ALLxz7kDay4wlXb5gKmVgqn5bPtPkpi4ojeYV8ncZTMFkI9vPpumRH
 TaLHrhV5ryx+7MinnwyJMM6pd5M9XOJctq13go3xEjSP+8YzG0eo8OVor3sARpPtsIEO
 DqlQnmapWQkJueRSfEIcvaPQYZVbbExs8rWdgjDC/AW+iymgIJhrbUFasXXJqGbCGh4H
 miUeM0nH4XhYy7nukyQc7DXG+qAZjEoCf7A91L4JiEU8Q1KrNWq/KTp24n4kuIZkKRxh
 L1u8FakPLpleslyHtD2D6Uetot/9PEUEuEzbI1NRUEKwORfUB7sBmvk5Hg9gYptKTA+X
 Rb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460126; x=1752064926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQbTCIZfXAx+H1aXpv73PAoNk3q2xsGUdD62vzGqb0w=;
 b=CfGFUbYbQ6T6JR3wDnko+7WGVK0SemOSnuWFaPRbVxaynsjYBlMLKQfM0O+wkzTSRZ
 PvmM2eDPyU+ABL5Y55x+OCz0us3YoQ6PMx0kLh/LBEEOImZakhkTtFzOq5fxv6Dcsgt5
 HvwXXmL2Edyw+b9cb00IDBdf7MY1MMYitfdeA5JtwDmNfj2zQjN3HCxl3GMXGjFjWjSE
 loL26xPRGcP/3mk+pBH9Ol6taFYGGp0DPObMaekpBbRFMNAEv9CMc2NG57Uh/TmlPcWc
 J1nX6Uwrqdi4oe9lhqylDdtL+HsiMzaUGX6bzESFk3MfI8tTIFZMYV7r9yXu0jgzBi7+
 fyqw==
X-Gm-Message-State: AOJu0YwwUyeou/8PXed1vSFZFB9DBYacHGxApuci2uIHRo7n66LNX5yR
 we5ivENXUxWEsOy80B3TtfEizVA9/N0RAAL+Qsly02BXh0OgmcUgchK62lnTuJSgQ78=
X-Gm-Gg: ASbGncsvsNufvdxlYGyjWX/o4I/nP6Y59j0kAYO2tocMS6H9TC+Ur2X+kDItGBV3NQy
 RRfRpIT1tlfBVqsiU2eXIimJecxaDQpPhnhoItfDSl8mqIFMAKi2clohO6RAzFRdnfqEy1xGfJp
 Qahyl3gXddCnDWWSm2nsZrBtkNOU72vbzKL13FQNF9JlbJaXo9vjqV8xFoEKiyqVAsm/LzyZciJ
 O4V0stWNd4yP78t6rxgCgGbJJFQ8kmqzAWh2CbwX1khtfRQU2WP2+QEHzXYAv5ZQMId/Va+P7WD
 rKZtBr9mOyMuuwxZfhadWQ3Kt0HZQ/hqmKJoE0ARcylqz6cyCcq/bG5fGZg7KSSR90Bi0w==
X-Received: by 2002:a05:6871:28a6:b0:2b8:fab0:33c with SMTP id
 586e51a60fabf-2f5a8b93e0fmr2103688fac.23.1751460126367; 
 Wed, 02 Jul 2025 05:42:06 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:42:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 87/97] target/arm: Implement LD1Q, ST1Q for SVE2p1
Date: Wed,  2 Jul 2025 06:34:00 -0600
Message-ID: <20250702123410.761208-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: rOCI4NmW4+5E

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 16 ++++++++++++++++
 target/arm/tcg/sve_helper.c    |  6 ++++++
 target/arm/tcg/translate-sve.c | 34 ++++++++++++++++++++++++++++++++--
 target/arm/tcg/sve.decode      |  8 ++++++++
 4 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index ade76ff664..c36090d13d 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -2155,6 +2155,10 @@ DEF_HELPER_FLAGS_6(sve_ldsds_le_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_ldsds_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldqq_le_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldqq_be_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_6(sve_ldbsu_zsu_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
@@ -2264,6 +2268,10 @@ DEF_HELPER_FLAGS_6(sve_ldsds_le_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_ldsds_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldqq_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldqq_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
@@ -2549,6 +2557,10 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stqq_le_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stqq_be_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_6(sve_stbs_zsu_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
@@ -2616,6 +2628,10 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stqq_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stqq_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index cf46ff9947..dfce9697e2 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -7482,6 +7482,9 @@ DO_LD1_ZPZ_D(dd_be, zsu, MO_64)
 DO_LD1_ZPZ_D(dd_be, zss, MO_64)
 DO_LD1_ZPZ_D(dd_be, zd, MO_64)
 
+DO_LD1_ZPZ_D(qq_le, zd, MO_128)
+DO_LD1_ZPZ_D(qq_be, zd, MO_128)
+
 #undef DO_LD1_ZPZ_S
 #undef DO_LD1_ZPZ_D
 
@@ -7868,6 +7871,9 @@ DO_ST1_ZPZ_D(sd_be, zd, MO_32)
 DO_ST1_ZPZ_D(dd_le, zd, MO_64)
 DO_ST1_ZPZ_D(dd_be, zd, MO_64)
 
+DO_ST1_ZPZ_D(qq_le, zd, MO_128)
+DO_ST1_ZPZ_D(qq_be, zd, MO_128)
+
 #undef DO_ST1_ZPZ_S
 #undef DO_ST1_ZPZ_D
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 994839e8b4..262670ed89 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -6116,13 +6116,23 @@ gather_load_fn64[2][2][2][3][2][4] = {
                   gen_helper_sve_ldffdd_be_zd_mte, } } } } },
 };
 
+static gen_helper_gvec_mem_scatter * const
+gather_load_fn128[2][2] = {
+    { gen_helper_sve_ldqq_le_zd,
+      gen_helper_sve_ldqq_be_zd },
+    { gen_helper_sve_ldqq_le_zd_mte,
+      gen_helper_sve_ldqq_be_zd_mte }
+};
+
 static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
 
-    if (!dc_isar_feature(aa64_sve, s)) {
+    if (a->esz < MO_128
+        ? !dc_isar_feature(aa64_sve, s)
+        : !dc_isar_feature(aa64_sve2p1, s)) {
         return false;
     }
     s->is_nonstreaming = true;
@@ -6137,6 +6147,12 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
     case MO_64:
         fn = gather_load_fn64[mte][be][a->ff][a->xs][a->u][a->msz];
         break;
+    case MO_128:
+        assert(!a->ff && a->u && a->xs == 2 && a->msz == MO_128);
+        fn = gather_load_fn128[mte][be];
+        break;
+    default:
+        g_assert_not_reached();
     }
     assert(fn != NULL);
 
@@ -6304,6 +6320,14 @@ static gen_helper_gvec_mem_scatter * const scatter_store_fn64[2][2][3][4] = {
                gen_helper_sve_stdd_be_zd_mte, } } },
 };
 
+static gen_helper_gvec_mem_scatter * const
+scatter_store_fn128[2][2] = {
+    { gen_helper_sve_stqq_le_zd,
+      gen_helper_sve_stqq_be_zd },
+    { gen_helper_sve_stqq_le_zd_mte,
+      gen_helper_sve_stqq_be_zd_mte }
+};
+
 static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn;
@@ -6313,7 +6337,9 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
         return false;
     }
-    if (!dc_isar_feature(aa64_sve, s)) {
+    if (a->esz < MO_128
+        ? !dc_isar_feature(aa64_sve, s)
+        : !dc_isar_feature(aa64_sve2p1, s)) {
         return false;
     }
     s->is_nonstreaming = true;
@@ -6327,6 +6353,10 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     case MO_64:
         fn = scatter_store_fn64[mte][be][a->xs][a->msz];
         break;
+    case MO_128:
+        assert(a->xs == 2 && a->msz == MO_128);
+        fn = scatter_store_fn128[mte][be];
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 3eda029146..2efd5f57e4 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1340,6 +1340,10 @@ LD1_zprz        1100010 10 1. ..... 1.. ... ..... ..... \
 LD1_zprz        1100010 11 1. ..... 11. ... ..... ..... \
                 @rprr_g_load_sc esz=3 msz=3 u=1
 
+# LD1Q
+LD1_zprz        1100 0100 000 rm:5 101 pg:3 rn:5 rd:5 \
+                &rprr_gather_load u=0 ff=0 xs=2 esz=4 msz=4 scale=0
+
 # SVE 64-bit gather load (vector plus immediate)
 LD1_zpiz        1100010 .. 01 ..... 1.. ... ..... ..... \
                 @rpri_g_load esz=3
@@ -1443,6 +1447,10 @@ ST1_zprz        1110010 .. 01 ..... 101 ... ..... ..... \
 ST1_zprz        1110010 .. 00 ..... 101 ... ..... ..... \
                 @rprr_scatter_store xs=2 esz=3 scale=0
 
+# ST1Q
+ST1_zprz        1110 0100 001 rm:5 001 pg:3 rn:5 rd:5 \
+                &rprr_scatter_store xs=2 msz=4 esz=4 scale=0
+
 # SVE 64-bit scatter store (vector plus immediate)
 ST1_zpiz        1110010 .. 10 ..... 101 ... ..... ..... \
                 @rpri_scatter_store esz=3
-- 
2.43.0

