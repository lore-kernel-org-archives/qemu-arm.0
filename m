Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2369ACD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OT-0000PN-Rs; Thu, 07 May 2026 19:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OR-0000NI-CX
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:35 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OP-00014x-KV
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:35 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d1872504cbso1372222a34.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197472; x=1778802272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41jFupCrOnfRrp2KPzJTTimux6d6EL/qwchp3PGm3Qw=;
 b=S9m5O8VMV5B2D76KJDFD61+3VWz5qjz9EqWzfLWIsMcp+yfZox5dc3UnLN/l4qQC5/
 NUnHwryy7VMqqXkK29ojWqNOLkquq0iQbuWqpYjS+lOQCMQdrr02t0izIzfqcdTHZd3a
 a1ZSEBOlxp6Itq0DdeJ2/lR/w41K10E6ox4KVucJXzV6pya6xV9u2rXZQnBemMpjEncZ
 MytQ4EJid10DTnrQFVylwvw11VOOG1agsi+V5ihWqYwWP0RbYOv26giMHtcZcTFVsiZe
 hg/lWV7FKmSOM5db+WJmgJErL3SgzE674ySoqYXVBUqddpou/IAkSWFMCs5vEPf6smDN
 XlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197472; x=1778802272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=41jFupCrOnfRrp2KPzJTTimux6d6EL/qwchp3PGm3Qw=;
 b=aK7k1qy9QloOtDMcKJ4Fnh599tfh3E2SuuVz7s9PiUNwiocFn2MrH7FPEOKZLU5vWV
 2DD/Hnlg6mUZJTOFn2xKuBfWUXoh749A5+NmbSsgD87SLjPMOKlYNzjq6Y45ic6Hnotu
 tSSgKKE2PBy46aBmZxMk6YENUe6QNHgfwBSkF5DaSJNEEDaYJTcqvyLAyb0GRcgbWVLr
 RFuc4NW01s2jZC/Z4ybCyvoy63ZJ6ilTAtrPkAneoiRamt0jD0zooX24jBtxP1ZE8Zxj
 0/UbSX9cqyAJY56s/W17ld/A7SJZYFiBOa8/GY91pAQbAcxd1++L1/yf/GZSb5VI/uV4
 Nwhw==
X-Gm-Message-State: AOJu0Yyx8pWqbq03KxRGrCNGePoGI8xlpb+yZfikG70DIoDhOSAcoOie
 nnGaQMjnDAPtAYMT1KvSLvUA0coKvwSavY0zdHDE7zkB2EafhmB+4pNQTP+9XQ7+OAQ5Gg5dtjs
 NXvnd
X-Gm-Gg: AeBDievrUUpOA9DPOGYylsrvH9cucRYZc+j2zr7JVD5uHGO/F5jgDrbm19Wx/BJ0+I9
 PrfCTfK8wv8iRVClc32Ko9XYS9/k0QaYfNsJzsACXkhj/IM/wp1ypKxulwwAMNWfgW4Q5OjnEWk
 eVESpK5b+zuxYvIEF67rnH8AGKmxfezAzRSbILM0gf32AHMZOh7dsaY1/JZHRzdtOOb88XWZi3+
 fviLI61hhDgrug7pqaWKYb+yw+WtJBg+OBDY7Hzr1ZR8BR1saw7SFCEK6TDcT/tJeOK9y7aSYS1
 6GxUYOKPjsTT+xP4k3aiy4KIfOad/wKkSV/0beztEi9fzegKf8Tk5w/4jfZ/8p91EzabZxxPI8L
 VWS5QxasuO1Srn+087YUDuT5T4P2ng5Z6vk8XkmdsOUYKMKEbstnfafBbUEYEaHnAnfoazihCHR
 891H4QbLefQAy5nKOVBiSMSXwHLK/z8qrojGT9IeHXmKcIe9n2B3Ox1dyj
X-Received: by 2002:a05:6830:6119:b0:7dc:cb0d:9e02 with SMTP id
 46e09a7af769-7e1fd20c072mr1122671a34.9.1778197472508; 
 Thu, 07 May 2026 16:44:32 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 19/60] target/arm: Implement FSCALE for SME
Date: Thu,  7 May 2026 18:43:32 -0500
Message-ID: <20260507234413.643512-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sme.c | 15 +++++++++++++--
 target/arm/tcg/sme.decode      |  6 ++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 3758bd19c2..69bc9bf6c7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1616,6 +1616,11 @@ static inline bool isar_feature_aa64_sme2_faminmax(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_faminmax(id);
 }
 
+static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_f8cvt(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index a67501226f..e2d17de165 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -707,9 +707,12 @@ static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
 {
     int esz = a->esz, n, dn, vsz, mofs;
     bool overlap = false;
-    gen_helper_gvec_3_ptr *fn;
+    gen_helper_gvec_3_ptr *fn = fns[esz];
     TCGv_ptr fpst;
 
+    if (fn == NULL) {
+        return false;
+    }
     /* These insns use MO_8 to encode BFloat16. */
     if (esz == MO_8 && !dc_isar_feature(aa64_sme_b16b16, s)) {
         return false;
@@ -719,7 +722,6 @@ static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
     }
 
     fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
-    fn = fns[esz];
     n = a->n;
     dn = a->zdn;
     mofs = vec_full_reg_offset(s, a->zm);
@@ -831,6 +833,15 @@ static gen_helper_gvec_3_ptr * const f_vector_famin[4] = {
 };
 TRANS_FEAT(FAMIN_nn, aa64_sme2_faminmax, do_z2z_nn_fpst, a, f_vector_famin)
 
+static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
+    NULL,
+    gen_helper_gvec_fscale_h,
+    gen_helper_gvec_fscale_s,
+    gen_helper_gvec_fscale_d,
+};
+TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_z2z_n1_fpst, a, f_vector_fscale)
+TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_z2z_nn_fpst, a, f_vector_fscale)
+
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9dec7318a4..ee874be1a6 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -250,6 +250,9 @@ ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_4x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_2x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
 
+FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
+FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
+
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
 %zm_ax2         17:4 !function=times_2
@@ -291,6 +294,9 @@ FAMAX_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 0    @z2z_4x4
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_2x2
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
 
+FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
+FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
+
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
 &azz_n          n off rv zn zm
-- 
2.43.0


