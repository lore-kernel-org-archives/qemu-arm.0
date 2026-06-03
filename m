Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65698CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:30:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIX-0007H2-N3; Tue, 02 Jun 2026 23:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcII-0006tc-DI
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIF-0003ln-EX
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8423f236418so1544321b3a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457362; x=1781062162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2h0bcjqwxYF6k6ptoucqXviBKsAm5tcFiqEuvNhCQo=;
 b=rLZ4n0z/CMa8C5G6xkiBKatUFdVYvrOMPY+u06O1H6zn3T4fyW2BOdMp6A4OoPt5op
 /jkkoCDfBBygkc73lNMqsjpxRvQ56CMiipks33xlKeZwaZemIAPIHYsSwzXQ05K/mlX/
 HnIQCHT+o0LSxqZ75qTcIqf0gGsBgnU3ZsPz2qVCVnz+W6xhKNjK/BCcGDm604wkcqMz
 6jK9fxgUIjgK+U+h6B6E5p93wOLeU+pHPVEVzPS5PgpdrR/T1DCAzVUKBqA+KJNEnNrQ
 0Mdru+P4tYjjepd7/oCua6thfXXUy5FrIqdN2tTxfHTqo04OPB/JYD8bo7J9Gk1GYaXv
 Z3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457362; x=1781062162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c2h0bcjqwxYF6k6ptoucqXviBKsAm5tcFiqEuvNhCQo=;
 b=S6WJzaRIqKfCNCEFwQwZFROyEcT+vpKKH2jwah7M18tkbEkzYuloOGIZAuOTlFyvWK
 0LYPeBj0q/IJIe8ZABOmaAhKu1RvorsQK2LH9WCto05XqnU0fAAnHl9/SdhAOonqA+8q
 MBr481m3VKxNER2+VVsGxuVESxC2FySfTUF312dhyCHEZhN1tH/rgBvprG/992bJ3qdg
 zIG88UrjwYbJ7wKDoO9wQabQhYVyB08b3BQ1bkDL5umsvQ6b2llCcx2M6O6uRZexUfVh
 JmaxshAuDjSD97cgtGGMufu0pyHRnCAD13Q1t3GcEpZ8oixPnbKL0Mveqv9l3arX+aJX
 0xXA==
X-Gm-Message-State: AOJu0YyNiaL8/UfTVh52AHHI06vZ/mLP6gJnE8ILECx40Wc2Kr5joonQ
 dcKORaNpiaQbDRbUQe9pGfh4IRlQvkjLAePj8umcxEC2SUIdW2Vb4VBDNXDlwAX7VTw=
X-Gm-Gg: Acq92OGzIbgTD+pkcXW5XXgc0wVsnDbcyNyg1ouxNXfObpKgZ2yeNgFy8a3sk88CFPr
 lJjCGkJRzUskn0LwECK/hwf6GUmY05fPXCzlUgDE5s7ByOfW0+ymY0AOWZ4A6iFS+vP/oSpMcG8
 pDWTyJ6SsZou3+y7c1YxQ14J6EHGuIashyTNHvodaZVlYfC/ufsRTwiF4XebwdyvFSSDNJO+XxU
 OW2VnTkKiZV6pprBnf1Lj5aJ6qhtpMMmaF1qa7PRCPDTAJyuazmfb43GZSdvvxpBsLs37GPkBGW
 aagLamxs52EjqDql3Po5MAfJR5YN2oFoc3+szPZETB1oWxZ5ViFbO+hqeS0aGxGA9kfVbcE/arE
 plJYdURzPYHZL7xGYXgQ1l5JwSASUMUAN+uqSAs+Y2lLfrGw39ohtW8X9zTyhuugHDI2ujOGFIT
 Em3xDLACDSCou+lRuHq3M3HOT5nKhF+K7qXK0rRbo=
X-Received: by 2002:a05:6a00:430b:b0:842:5c90:736b with SMTP id
 d2e1a72fcca58-84284f790d9mr1664199b3a.29.1780457361956; 
 Tue, 02 Jun 2026 20:29:21 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 35/45] target/arm: Implement FDOT (FP8 to FP32) for SVE
Date: Tue,  2 Jun 2026 20:28:44 -0700
Message-ID: <20260603032855.106930-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
 target/arm/tcg/sve.decode      |  4 ++++
 3 files changed, 44 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4342a2461e..fbf4decd74 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1560,6 +1560,11 @@ static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 6c4e372b67..a5a0359a95 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8391,3 +8391,38 @@ TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
 TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
 TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
+
+static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp4 = dc_isar_feature(aa64_f8dp4, s);
+    bool ssve_fp8dp4 = dc_isar_feature(aa64_ssve_f8dp4, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp4 || (fp8dp4 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp4) {
+            s->is_nonstreaming = !ssve_fp8dp4;
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
+TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 06bbd7fa63..c49e992f10 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1874,6 +1874,8 @@ FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
+FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 floating-point multiply-add long (indexed)
 
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
@@ -1897,6 +1899,8 @@ FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
+FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+
 ### SVE broadcast predicate element
 
 &psel           esz pd pn pm rv imm
-- 
2.43.0


