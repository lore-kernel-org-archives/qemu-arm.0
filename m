Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD12CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIW-0007EQ-5J; Tue, 02 Jun 2026 23:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcID-0006pG-Qg
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIA-0003ja-TC
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8422f395a4aso131317b3a.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457357; x=1781062157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNWgrz4L4d83/zEiDs+5NR6/Mjh4ZK8N87Ncb5pLF2w=;
 b=eRJ3XYBHcf5Xx/0Nv+KSIIefeq6UZSNdkEOWziL2qzwyoazmB1+FmNqM+nHidnoM/f
 DOy9/rKfVMmz2dDEkymOPgMcpwH+PI0DGDNb+B7feDabvwOOTXKvlUx18iUHcG3sjKr7
 +jFRUUizFWyvPwYhQLYKSMKhkgTHu3UB5OGeqLlvuYlhbIrJoqmHGamty5M+favzuo4P
 0MgiHwChqmJtjcJM6bITkz2B4sRaLwiMfO9JWnR6dUBFS4adiPGRuyvr7dFVrj3/wLMT
 5/SSWNNtpn0b/Tml0UspKIy4Lnuz6VZMgelJBYRpJ5GUGcK8sO6bBO5dDIz2z92wHboU
 ornw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457357; x=1781062157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rNWgrz4L4d83/zEiDs+5NR6/Mjh4ZK8N87Ncb5pLF2w=;
 b=gbaHWP7JGYWXDWNQJGgXT6QPNl/u37XTOWYLDWohDLeIrq2rIGXCaCJlKz3VzXZQtV
 NS6MPrd4cqs5IV0iTwcoJ4RO8WCol7AWiJbdqpvslfjG+ms/A3AjLex+0tdSdbchXbWC
 bKHrtmQYv/FcmcTKL/7NiY2h4JTZiESDR1eNwI/aDpeIJEzV3tE/5bUZx+efsr9O79Si
 e0xXj1xDXUl/Vq6PI2yfaVXPLEcMOh2bslCYetXZ7VD5RVgAi3eWQUSoLs3/9Ifp4dB7
 XuvZju3ZWeu1kCQLxgYNO3b8jrhlT0BPYR1v7t6DZS9WR/fgvPt/uMYc08KGn2C2s972
 pvlw==
X-Gm-Message-State: AOJu0YyZMEVdZh6fwgMTWLSFEq6VbjfjPXIVVaYnzwBZO0S7NNXqKohr
 +ONO5bJPALvFqUt34+lsUAhvjqWeKZyqF9wme6emkuPCK+weFv/zmUuUgrjVCSRg130=
X-Gm-Gg: Acq92OFJ1EfVkygHsFrlIfdpNoMp64Y//lKq+qvB9r+7uFgpNYQ0klvCcL7zAi58m4H
 b4aAHJwp4EqDuw1L9uTJCQQBD/nkTtkWp/iPLrcTQOsOAMxBk9hkEnPDMfgKou/is9z92vuOlug
 KMxf5Z9wiTmhLKmtUvR7PmdIyRxsQSLQvJZ7VVm0hr8Kn+pLQld2GjBM9f76fXfKlntSw3HryqK
 lvXm8Cu1UH6NQtyTRMT/30yp2ZwFZdga2v0KeiHREKIUoVAwTDDpaEjUmkjGvE4waFdX8pNhdWT
 gushTBgiZ7juqrYOhJEicQCA1oh1uS+deehumPw4hkkOqtmQTv1s535uWOOQOS4xsqlF4wpGUUH
 ON/4D5C4+9loB/oy80jdw5Ty11hXsauYNme8O2Tv3BeYP5cjeDNZduvc7J57t47tHbG/9QTRxML
 PA3lB0mrJSaT87D+8AKvKxL6ql0eV4Ldsl/YkfzYo=
X-Received: by 2002:a05:6a00:4f82:b0:82f:4725:f6d0 with SMTP id
 d2e1a72fcca58-84285e4d699mr1085410b3a.29.1780457357207; 
 Tue, 02 Jun 2026 20:29:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 30/45] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Tue,  2 Jun 2026 20:28:39 -0700
Message-ID: <20260603032855.106930-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
index 5a3811d294..78ee893f4f 100644
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


