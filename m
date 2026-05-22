Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD344CD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2K-0000FK-RS; Fri, 22 May 2026 18:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1O-0006qf-P5
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1G-0002qO-PT
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36a15ed5119so4056632a91.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487621; x=1780092421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ch2UaMYXrNBylPBlE3O1inT+1vW1S0aTRYA2Jc42jac=;
 b=h8ilcmhGLTVIcP5LH931HZ/FscsaLbmn7U+w3KIBrrsMF9s88TFpkr3gwKZZJ9h255
 skKXitlYijF/dGh5aEom8oZ5OtCbcWagJj8WVIUExtLkqAZhGFubswIqsjO5MYOK2pQ0
 ktoh8rQL33yTLCpggDT4SzpUHzlj3X9TNIsgRkDhSr+iwElrqUZA3BgNOZBvCFRFA/of
 bGi6hHlRRVIvOYuvQhNTkV839Vjk7y3HNChhBOJrQ/HlTt3eOXda3fSTa5oROF3LB/KQ
 EJhoTZYjNSmXcB2PYPsRO7/EFct+f0QLiXXNFZ8Kk2DV8tHkr/T9O7dCZ/2MoOkBpsP2
 7uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487621; x=1780092421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ch2UaMYXrNBylPBlE3O1inT+1vW1S0aTRYA2Jc42jac=;
 b=LPdjElGzR1f6JqshyOgqYMu3K5geGlWfGfQ2Lx1Vuq+H6Hj1dFJCV0BJUCk+8/ke4k
 5YjIW4w0Qei2FuEtGJETrsEe4nOR5PMEPUp2J7Lusr56btV9brxlZW9yQduxmNvKneHo
 AUjbm3dQ4Q7OGPaPlDEmewiIYaVjHFFditSdogSjEvMsrqtEqygDH+GG/OzXkE35vw4j
 ymwxFczGkqj1V2eTyQRrOYuX6GbiDHbL9POzJ8VmTmsRAheqD32TSW9QHgtecguG//so
 lqNUYNpB95rzb8zKA3E2A7Kc+TW5ked47Jh/WpmLBGQoDAOZ0Tx2NzN8Wx+N16TvNjdf
 dysQ==
X-Gm-Message-State: AOJu0YxSv37pYXKCqZDzcmelYXisgykPptpjzg2tKDpsrGDT9prFRttD
 Obzb1T75sc/0l1J4W0E4dq2Me/Vmia7MklkSUausu15N0nQm/QyhXq9e5iqPZYOHajM=
X-Gm-Gg: Acq92OH3UnlFuTOPhOyC/hK6jK/KLKi2oJs/ghNoIWmrb4ijjRJpmEAk9SRAMq2TZ/h
 AgFDlN/GjcoGaj7Bm9yOwBRtha6rbPQVmGtaVhDZySfSfke4k5HITaW7ev9q0A0yEFMAqT0TtQZ
 4aWIH8qNinn6bfGqP932E3TOO/BkhPz9Y7FhyTRxuqqEtAQ7c0sc34CVju/BoEnIJCzPBFRDOa9
 sNVlbzNgGbFJls/YOdLX8DkN8vxHDDOrJ3xoBbZBWAOfKtwjk6dhbcdTN6VUu0z9gf43vsLjgR+
 jt+g9DaQdAG62BDD61GwnKVrKK9wsiJUqYfTZTsr1CjsATS9C35JGueUYjxQkvlWuDQhIQaWhZW
 kDyznI6oxjk7Uh0rQm6Rz/ARtYU/G0kNbDNPInfYHLrBD/6zQu4tm7UDnDCqzUUbBpC6g7OomsD
 2NoJO5IpIaNOgMxy5/QrSpWqpyqfgtUF60GWY1Arg=
X-Received: by 2002:a17:903:298b:b0:2bd:2de3:51a4 with SMTP id
 d9443c01a7336-2beb0604f43mr59055085ad.27.1779487621201; 
 Fri, 22 May 2026 15:07:01 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:07:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 57/64] target/arm: Implement FDOT (FP8 to FP16) for SVE
Date: Fri, 22 May 2026 15:02:59 -0700
Message-ID: <20260522220306.235200-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7bedc293fd..90098c3cbe 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP2);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index af7f115f4c..5cecd0f5fb 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8425,3 +8425,38 @@ static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
 TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
       a->rd, a->rn, a->rm, a->index)
+
+static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp2 = dc_isar_feature(aa64_f8dp2, s);
+    bool ssve_fp8dp2 = dc_isar_feature(aa64_ssve_f8dp2, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp2 || (fp8dp2 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp2) {
+            s->is_nonstreaming = !ssve_fp8dp2;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           tcg_env, vsz, vsz,
+                           index, fn);
+    }
+    return true;
+}
+
+TRANS(FDOT_hb, do_f8dp2, gen_helper_gvec_fdot_hb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_hb, do_f8dp2, gen_helper_gvec_fdot_idx_hb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c49e992f10..26b3c7697a 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1875,6 +1875,7 @@ FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+FDOT_hb         01100100 00 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 floating-point multiply-add long (indexed)
 
@@ -1900,6 +1901,7 @@ FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
 FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+FDOT_idx_hb     01100100 00 1 ..... 0100.1 ..... .....     @rrx_3a esz=1
 
 ### SVE broadcast predicate element
 
-- 
2.43.0


