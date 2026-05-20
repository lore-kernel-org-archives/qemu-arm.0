Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44CCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPldr-0006zA-14; Wed, 20 May 2026 14:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcB-000499-7l
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc7-00024a-9f
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2be1dd4af34so35306635ad.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301550; x=1779906350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l26rPIuII3YImkqTasNjpDKWjPGdRXt+dWuq4seH0M=;
 b=Y6SxNPTB1RxSt7Gqg+DuFgJqCs7H95yav8ACWngT2wSogeip8sPJ43Q47ZWd1FszM7
 yrp6+mmFExeybzY5UqfiqaxuimXdG3LMVqsVo4Vty9rJHYNnJ1cLbtepujtmZzYbVrYR
 jGe+2IXv8MaT/p3wm8zcG8550Aan4m/tPcubCGhfcykQvHTO2c//S9GFCKiEi+GgFe36
 ctBImkeQkzxAJK+WcHYhPlhg5Oiui7k3Ob4gBFfb79sm9hm94niY2Ma4jt4K1+cN9TJl
 AOaWq6FoRLXbsCFLbchMur+JDPCea4hFUaJtP0vrRE+TT2YM19CTLzpUEwCRN6AbufH1
 /oLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301550; x=1779906350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6l26rPIuII3YImkqTasNjpDKWjPGdRXt+dWuq4seH0M=;
 b=m5RaNrEEK9kMAvPzbcyjCFn8q4ajZA33ZYrxHxfXkKgEuHyv4wlysTcCnabWZLMzzj
 B4HmJqZDf00rxc5Cq+Q5MZ12qjDYsv/PUymqlU6laJ2NP6cuy4yIanAxKV/FToPI3Knp
 dGy/at4eTVlIOGzTpAeW768MnNUZrS6UIK7H5WpyRnmarw5ED2UDv9O1ETn41Femklpd
 eZ9EC2cGzBU79YL6RfwdhD8mOFax+4ZEiGkH49xkE3wRu/gNM0KSwTIkhZquWsNnGH64
 ULqh8ZzT5hKghFXscyqQNPY1JJHYy+aOou27eQ6cn9EqqLk++ETbHp6ExMZvEw3A0l5v
 QNXA==
X-Gm-Message-State: AOJu0Yyk33AiNPiDVijsE8ftcciYeHuo9lW9E9Gbff+Hrcvwyk3R1qA/
 FvDAN0gsXUepGWUvSmmCqj9bo+m9xoNSRcYukFVV4a8vDcI29AYA55ovnGmvOoHXcRM=
X-Gm-Gg: Acq92OFF8p9hXtr59K9zyuQGiht9Rljau3uPwwcaH9t7XVHHqFo+Jby2DWgzB9FtsDL
 WoRzfzu+hN6zzQN28hdxXJx2ne28VQ8P8ZGMYv5et+fyTOiGqj2Kk74XgxGTch83zu3b0BMIe4h
 UwcCaV+wEuFUkQS6nexbTxK+NS7TmsKvbwPiUFdmpjiPgF7tVRZl9O2djsEiL7q3AY1O510uPN8
 0UYqZyGQqO3J2STwaFdU8gr8PoJrv9O50cZVBW0xA1lUkFZj1OLUG6K9aGvyDsebI5eskVjgSMT
 T/7tcyE9NoDUErk1xVrEIvoJBN/QqkS+fUYOmgrbwTmlkntMX6GML5nt/gc0W7aaaQDXQT+9H37
 L+CB5OlB03tS5jKDbXmRM83DSo6obGX4sNMuqN7GhD7DO8vZXRx3osWdMrTuvjho7xnsVn3cUbP
 xWVcQXX0h90J9qCjzbhgWfYYllYIsCqHh59qmCe9c=
X-Received: by 2002:a17:903:3888:b0:2bd:2439:25fc with SMTP id
 d9443c01a7336-2bd7e7f9a5cmr265590875ad.7.1779301549522; 
 Wed, 20 May 2026 11:25:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 47/64] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Wed, 20 May 2026 11:21:56 -0700
Message-ID: <20260520182213.872945-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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


