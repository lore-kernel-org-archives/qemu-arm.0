Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B851CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSu-00012C-28; Sat, 16 May 2026 20:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS3-0006lr-Hn
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS0-0006oY-Gm
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2b4583f0a1aso6046825ad.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978027; x=1779582827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l26rPIuII3YImkqTasNjpDKWjPGdRXt+dWuq4seH0M=;
 b=X3jkfJRkLJ30Zkbtn3w8WHcaIPpiBrx7+ieJb3gadSfTzcj33X41BuSulhTDuY6v1F
 oMgS2fzZsdigVQ8TDAPqiaRR9Dpe+CWC9oajKBhdAsG4I8qBbPoUUaiT1+ZLLDifw3vT
 KJqN9U0rB5uGRDOo3aOcSaOSqGrZUgmEr/Ns5+jcwTFMCYOjuxjv7LBL/78gJDayU9xT
 ExBK1OacoHHXwGTluVQmJY3665+CyoSZDsDCNE3x6OcwyvVL3XV9vJDPFMxs9GBWJ/gj
 iTkWjN1+zQwwmqADr2RvRxXHiZK6tU8pTm4jX1G4DuSee7hP/lD84VdTjr+6lReVzsoK
 WXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978027; x=1779582827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6l26rPIuII3YImkqTasNjpDKWjPGdRXt+dWuq4seH0M=;
 b=A7nVO8Wu/CnRXsnXGQAHqGzJjQXJ71vDJFLezY933H/BIdFZfSrHEYIFVm3I2S3meG
 Iu5M8UeWQ6YbAFrhH8vNUhO5z+2dJpnXyvUIs8uUyKvgyrvuilKwuQJtncB6GEGUtiyt
 zpuwdA54j379VfvyMcnraDy4KgI2EJ8DUVgJixrD0sJpdbhYX13UX5yYLvZrROy5P7zi
 DCUJxQKZpkoUtWfSi/4jGeWENnzGbjerK/dVhqUqwGV9uQ3+kZMwSRmEFptYbJ9X94Gx
 mK4/Wx6erMFpDxQ0X5gvVDyFC0tUfRnEH2EGGbvvvNGoOHM7FhrKLDzNIYMPbzr9BJty
 TEgg==
X-Gm-Message-State: AOJu0YwHiOUyCIyWdaUjGmn6AQE0EsXZbdhdZkFj6oHnADYQGRPs/m2p
 /WqnGL05UUoi6DDDKOwjD/ZapargrjdWDIQyCfQOTqCL8YhnqIeZDCLn4iB70UQ2fpM=
X-Gm-Gg: Acq92OGwidxfbgsz4tIMHWZiIC3YgMNu7G/wPJcUxnDd0khUD6eeNKN1GoF62vetb4v
 mcrDnysVKCnnl60z/BV3ibMXN9MfyY+Zf17oFpvrnzhJkFePswskUbaGQIAcx16emXdGgIx0qU8
 MvVlkDXOrpXWpmxFUUOe/oVqBy8bnkqW7a0PRT+c3lw7PJbeNydTxVZ7X4PUsSjsydPz1bykKI1
 CM3UkalDvYThtIVpcdpDFQ0KkgOsG6SCNUA5K4O3AJoNHWPTrKzfTpNXZa86fCPah5nXvXKb0Sp
 INacYoVlaN38I5yVFQbSTBjaarMI1N95MUKJZ9A6r5jYh5aPEdGVrTp0naq5Ie5GI3YoW5RoG4m
 v8de47STnQ5faixW4mKQLVBPEDp9bOQ+7sQp49eG/GTY1VApAD8jFlOmjfvC5DWUbplu+C1PNJY
 F2bR39cefAxik+4iB36+b3/APanxHZYKJbR1/yyGY=
X-Received: by 2002:a17:903:440c:b0:2bd:9a27:70f1 with SMTP id
 d9443c01a7336-2bd9a277240mr66141525ad.30.1778978026638; 
 Sat, 16 May 2026 17:33:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 46/63] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Sat, 16 May 2026 17:29:45 -0700
Message-ID: <20260517003002.321430-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/tcg/translate-sve.c | 33 +++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  7 +++++++
 3 files changed, 45 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index ee20d74164..c0b646415c 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1545,6 +1545,11 @@ static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, B16B16);
 }
 
+static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ea0d66178e..aa785fa0c3 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8336,3 +8336,36 @@ static bool trans_LUTI4_2h(DisasContext *s, arg_LUTI4_2h *a)
     }
     return true;
 }
+
+static bool do_fmla_fp8(DisasContext *s, arg_rxx *a, gen_helper_gvec_3_ptr *fn)
+{
+    bool fp8fma = dc_isar_feature(aa64_f8fma, s);
+    bool ssve_fp8fma = dc_isar_feature(aa64_ssve_f8fma, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8fma || (fp8fma && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8fma) {
+            s->is_nonstreaming = !ssve_fp8fma;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, vsz, vsz,
+                           a->idxn | (a->idxm << 2), fn);
+    }
+    return true;
+}
+
+TRANS(FMLAL_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
+TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e2106fc7f5..71ec09393c 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -29,6 +29,7 @@
 %imm9_16_10     16:s6 10:3
 %size_23        23:2
 %dtype_23_13    23:2 13:2
+%index4_19_10   19:2 10:2
 %index3_22_19   22:1 19:2
 %index3_22_17   22:1 17:2
 %index3_22_12   22:2 12:1
@@ -73,6 +74,7 @@
 &rri            rd rn imm
 &rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
+&rxx            rd rn rm idxn idxm
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
@@ -1864,6 +1866,8 @@ BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
 BFMLSLB_zzzw    01100100 11 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
+FMLAL_hb        01100100 10 1 rm:5 100 idxn:1 10 rn:5 rd:5 &rxx idxm=0
+
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
@@ -1880,6 +1884,9 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 BFMLSLB_zzxw    01100100 11 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 
+FMLAL_idx_hb    01100100 idxn:1 01 .. rm:3 0101 .. rn:5 rd:5 \
+                &rxx idxm=%index4_19_10
+
 ### SVE2 floating-point dot-product (indexed)
 
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
-- 
2.43.0


