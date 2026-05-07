Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C42CD37AD
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S6-0007no-Np; Thu, 07 May 2026 19:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rq-0007DV-EG
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:12 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rm-00027m-9w
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:05 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-67e09232daeso889149eaf.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197680; x=1778802480; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dx4LZOEArrVWhcrcV8egakiEsG2aRS8cehmkYIp5N70=;
 b=U1T60c2NbTbn/tVInEaUItdPqofrckmskPnUYCJ/5BKrqMKD3TYfbyjmwdiU12Maxs
 VHaXVFsLyAD7uYBxlmTNgSObfbMIARld0Yh2tIG9Vgdqc+AASTfw1No5JdwZ7jDnfPkN
 RyuXzkfhplrE2/CKYkI67dcwWdzIolIKjnbgELximKNqsK7QRzD9Br9n0pCMNjCYFqIh
 1xJyeHplgLzgZNSh6iEStQ7UF25NRcjcEyHpmmblE01GEB8yG8qt00EvSQpNfQHpA0P3
 XBQm2U0Ww7C5JncscIyfGKKLTyn+5oGXZ1lgGoto+L6UZ7uYa93IXU1raAEcZejCsCa5
 t/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197680; x=1778802480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dx4LZOEArrVWhcrcV8egakiEsG2aRS8cehmkYIp5N70=;
 b=kmWdRQC1oXMN0DRshcvdThZwU0vyvfc1bjPcv5zLayEAvdoPUfOpE5zPpSfxtxmeH/
 6yRBSHsmUrYrg5JIywvhO7OBp/dezo/iPmU7nNrX+c55FDR1uwDtv6wR+OxSXP6mBMPy
 pIgjKN50sYqbMkIeSK1UyFvgbGSTor5Okdi9721d3VqyJw5DKod7qwAUMen212WaR2Mk
 BCccavOJvePYtdYOMLGLGI1JHETQ4aT/qvnJgybVEDZVmQUFQf71Bapw3//edGK0RgNo
 aex9Ht2JcY+tfdFff9Eag0p2p8/1RJDxfKXCfpTo9Ojitgeck2RrwRQ2kAjW7+VFgOrZ
 ey/w==
X-Gm-Message-State: AOJu0Yz4v++VKJGACogP1VXXjb7jCcAME8Pz5VBiM3VIt83rS41Aob40
 Ky6i46Y849+J3i2pIgQSOxkwQaToD2HOCY+Al4pS+TlcB7+LoRM50IpqdWqFqpQmwSLtfn8rufY
 S2CnZ
X-Gm-Gg: AeBDieulFSzGRkVKHImqCE1P5ov1dOoXKkKSPIUbBZdmf944AM7Pusf9lxpOj8PQKhU
 iyIavlk2KRVld5ddrpQrk0MxlCowJV6OaKzDK3ZV9WLGd//ARx/87Z64QNgu29q+fya3j2+GHOA
 X/1RCbw6jjfj4/I0hx+MeX+LpOTGwXmPqfrcJ9KIncKkrgFQdmwEubTsdyHS9oKNa9tcfaVREqD
 M4NMgD6pjxWLJyltixqdC4PJIxIG5P5A7nJ30ynSKrX/klopviZNiKPKoONGOIHmNJMyRe7/U0U
 K3q4HAksFrpZQalWtewmZGjPx5cqRz6HhrBDTB1SEqSpXnhce/6hLk/lQ4N8fG0pTCRZZH/2yCt
 9eMGndXr2y+FElNrEyzZgnDkqmQ+vrgudQgKMydqRPv3VKGKu2NLqvxfwxa6zov99RXzOG+m3Do
 R8mgXGfrldxZaUC3rUVAyn/5ZVnv+vgJaWuIBdwPpneBcuoUI/7Ue10Cch
X-Received: by 2002:a05:6820:3101:b0:694:9e64:678e with SMTP id
 006d021491bc7-69998cb1130mr5910775eaf.18.1778197679719; 
 Thu, 07 May 2026 16:47:59 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:47:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 45/60] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Thu,  7 May 2026 18:43:58 -0500
Message-ID: <20260507234413.643512-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
index dcbd839d2d..e5e249d824 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1539,6 +1539,11 @@ static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
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


