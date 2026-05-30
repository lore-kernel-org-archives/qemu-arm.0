Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61552CD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:21:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrV-0000MK-60; Sat, 30 May 2026 19:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrT-0000K0-Lp
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:59 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrR-0007a4-RO
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:59 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c85825bbc4fso734263a12.2
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182776; x=1780787576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQqPNC8DicGYwyNnJ/K+IIlXc1mscqAi+348DJPf5DI=;
 b=i2kcJlujP4EZe/IJxumvPkSrxly2t25gD6NMkQZ64VH6WVUzM4ETUGInFDat/NH7P+
 0GM6hKnBMmFI35I9T2AZoOyls8uBH+3sG2RgOiK7R1ZfnY83np4dT/aZvE8FSPC8n3cJ
 IZsX5Pa2LFdTEstodsHLupLGOlk7nFiNy53VjzRFcTgupzuuwk+M0nrn+5WKIU9id8AM
 X82Jjjc8841msz20i/PUDCTJoaWVJ0R9ZAstNbeuHcCltncLeaeQXU1wOSMu/RnBM7Ii
 hPLKWeR7WjtvP+NlERbgqOOKm/D/wxLKwLMENi6lvKUQsFSE1NTs0w+z6GdEcM6u4Vl1
 Nq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182776; x=1780787576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IQqPNC8DicGYwyNnJ/K+IIlXc1mscqAi+348DJPf5DI=;
 b=ia4gKfNWBFga4ZK3jERii2oxNRaj5DJC/MmHjAQ4raXpjUsSUjUvk+D7fQoDnafWO1
 C46O8qnfLUVLy1tIYIdTaJt4GayoSMR0P+/KQg97EIWrPH6gn2UmFnADJq9nVek02ug3
 yOddFNf9OwJM8aOWuDEF5QlUQ9UiF7jEztolko7EZ3MRciHEFi4DLszTQQi3DSURSPtN
 K8ARCGOP61OyOVc9jjLviOCyluXu5rlhebMWw3OyUJ/Wp2FdtEPXdU2Q7VrKVO2RuqpP
 9hoKUhk8HvrWzOIneHYImILiAHD/9Lm4EFMbOwPhMgCdz4s1JxzGbjhE4SFq825aDPaP
 EogQ==
X-Gm-Message-State: AOJu0YxGAXc7uBJ+DOisFCnqtrSMaAIE6+875Ql07orDgrTPMAxesiVk
 Y3IbD5daIgWi2WPKD/bI3NA4CAheIDB85QKMgjmvb3mM6MjmZ/2L+Cq1zzq2DNO9m7M=
X-Gm-Gg: Acq92OEa5RIN6s/q8Zo9SRXvglpvEYkP4Dah92ETueFLBmyvW0KhV10nyvysMw/2wiY
 K1jpxT8Filj+J8CNIvsdoZHN7TuwLTktDAGUz9s0wMI7t4bt49jFFXegsb+L8st1/2TQWGahyLy
 lN/MyH77zycdm4DR0ZiwCp6tl8aMpkpM4JPOV9D1z01qmd5JSmzNrBl/MpxhxaoulEehCTUFUcO
 PnPiWqeTRJap+sSGh8YOy5UYuomizKoKAS3UPOIj2NVDbDRSMS9RJwZzF3wRRYPNBweX2B4Gykx
 OGjAV4GPsjOS7JeyuvrI9ScpLh6Lg1lSmJ23QZvPOpSUjhuiC4woTpgo2UxQf2qwRh1dccGGXi+
 h+ceDcv5V423Ljah6bWmQCBvPOK4Gw7oDv3V5kfX8pxNeWAjlj9bHmHRiUvgHRU3/tJGartDyJ2
 2Tj4gZ5LpLPSIb/jJpIM9dTGMVMjcTsBKgMmHYKr2MWyz+JoW7Dg==
X-Received: by 2002:a05:6a20:7490:b0:3b2:86a4:ab57 with SMTP id
 adf61e73a8af0-3b427f88ba3mr5377371637.1.1780182776149; 
 Sat, 30 May 2026 16:12:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 26/41] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Sat, 30 May 2026 16:12:14 -0700
Message-ID: <20260530231229.400441-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
index 418abf33ab..5e9eb3405b 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
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
index a891117916..1044b81c95 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8355,3 +8355,36 @@ static bool trans_LUTI4_2h(DisasContext *s, arg_LUTI4_2h *a)
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


