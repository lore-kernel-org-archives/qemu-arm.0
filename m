Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1789546njb;
        Thu, 6 Feb 2025 12:16:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdOXCThQ/amqYUoYiNAXBVIWwh3hQJHhoh2k00BqSeTm3BkMD90ieJCaYJqbbbilRNPj6U2UN7v6pfgw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGPGDpmtj82fkgJpidiNlSlKL+5oTteqbtsqLdB3dIUmPY72jIUUu9NsImsTNhSVLgPzVS
X-Received: by 2002:a05:620a:1a81:b0:7a9:afef:33e6 with SMTP id af79cd13be357-7c047bc7500mr88477385a.34.1738873014729;
        Thu, 06 Feb 2025 12:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738873014; cv=none;
        d=google.com; s=arc-20240605;
        b=gxuw1bUUhYbpkK4taC1vpbQVtPtKV9VLN4KOwQTbYE75ppk0hPhZydUt+oZYRxZlKQ
         AWHPmY0BerfsqUBgP4o0Q3X3e8CuNIkdwkhKmiBcMvgo7ly73dRuPsWAwUq8oG4WntQx
         694z2Tz50+JVOoboWAcAq3O8AW1o2V7XT/7PRPTyuJDBpm+euRT/3Q8r/geJuEek/RJM
         LPhki6t/jJ3e14T/M+nj0sluieDlStf+Dn3qPyix4RPLWF88bjHjrNGx6F+iNWazWkPU
         yzs1n2d+Sm28gmA8/nfEPb7h+jAdoM125esIQYZk2uIWnV2yuBmn90iVbCaVsKntNjiW
         CAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HTDKbSYnfKQHdxYGjNbr3KxMOfwa8l2dyg4OJnjGl0s=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ajyBcjIBSr8JLCBLrMC3QWs3PUOkSqIvk2ZwK1B6AQsIYuXZL+Lwj1q/oETgYDADXX
         QMxeNgW20sjajPuU3Xzv5I8V4b/sA5Iy+yvCC0wTP6Z87hkUmIM+OUsWSltT4BrFP4rc
         YJd+Z7mQzHSI0WDSwixtkLTCcVZ0hKusj3ke7TsEQvq6q0j9ox4j6gVaZSN1Osxh+HdV
         7+0VlS5HvRfgEr8+ATEGq9uenV8MfZGEkg06dh7Y1n4OrvhAqP43JIlWs/0+KbSShU8z
         ESzvVDmaHuGu3v/lHAl92GtP/vvrnOGG/d4a6tmDhHFy8IiBYlZjBRl2cy6X/F5qjMHQ
         EZ1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pxctCy/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e0a274si182734685a.175.2025.02.06.12.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pxctCy/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg85D-0001as-Ew; Thu, 06 Feb 2025 15:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83Z-0007pH-Bn
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83R-00018V-3K
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:00:56 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2f9bed1f521so2020102a91.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 12:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872052; x=1739476852; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTDKbSYnfKQHdxYGjNbr3KxMOfwa8l2dyg4OJnjGl0s=;
 b=pxctCy/ungBOwcwZ3hLizVI+2J8v/SrcmLEqD0gNn9MUDZL8I4y9Rp2snFBSUPpO3Q
 osJRsmp+erg89EpG7fbQpwTizdQBKOSRuapr7sRCL7VRZJ4fSvxbTZeFa0Wlvx9/ngLV
 pG//B1M2u3LAsb+5Tw84X6wG4MxRvB9xFFS7RcS3iqN5lEhpnaD2CAYfucRxuXf8J4C1
 OCAt00EVxiS2ykx4hENSgrXZxs84eWO+sSJzWO54QDnBzW6DrGRCeuvD72rWCsLjNRtv
 7MhwnMeEnFes+PFfxlZb6hKif4BtQgSD2UfnitxIluDE6oR8et7Xux+ieFFq+Sr/P42f
 jW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872052; x=1739476852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTDKbSYnfKQHdxYGjNbr3KxMOfwa8l2dyg4OJnjGl0s=;
 b=EMnq/WSMz7a1fu6MiNTKgjZL9S1YMc/fMVbO5qt4xJ4Ogmf9K0dpmQ8ec3elfWgS0+
 5iSxyI5aSY2iTrR+OFsUoLMm7CXEVK2X7TRQmRVxaMtDHzFlxgkb6M+a1JYxXdcM62k2
 wh5jokGCv1Ry0Nw7h+b09ROAQ8eYP0yHi/QT+AimEG+6FqrCG+I192pgw7zD/kqktmgv
 xjPYIDXAl9qo7vf6JvWnLQkLxscE8W1RBIiJzHcrX/ZnXUcZnBl5H/OBxM6Dkm+/yIsv
 TIOHGtkEoCrI7yQNZ3y9Cq7UHL3QYRkpGbcRvpXCjNfS18EDBzudWwkKKnk1QSS3wGSq
 kY2A==
X-Gm-Message-State: AOJu0Yyc9cymoO/+/+Fq/zgNRY7hzNOw2HVfO6vwxLCTiekN/VkFS2wa
 GtdqTXHDCVEOQ9ic3/42BhL/4X6kRiG0GG6jeyjvB3M59dqe6DGaSBYEnDtkxiPtYld26MTMlsQ
 W
X-Gm-Gg: ASbGnctX5bvp/HXG9kW6D7IQ8mJLqxOX1YwBDBFZPyXo6xYvmvAXLroBPYBi3H9L+fI
 MknyIZjHb2msmypQYFOrkwrFXIG38g2okKwkX7YcgcOql+kTl5KrEKU5M+Sl386bbe+eNw/k4k6
 0SJGWyEbcaWnBbZIzR2XTAzFRIkjeZV8GSzpy07gHZ8ACkgMYgLbTvoLLHc44Ulc3qaVcNCtKwy
 wt+sLSMlhohb/ssp9FUrRwa89/KKBl7nFvAYtDH3M4VMITkA1xEZMe10ceRfEeIUxmS6v498hBv
 mMSguge46HRGK04JzpKpdNnX0O/4fs2cX2S3+FGwLyHT5Rw=
X-Received: by 2002:a17:90a:f94e:b0:2eb:140d:f6df with SMTP id
 98e67ed59e1d1-2fa23f41df4mr515171a91.1.1738872051521; 
 Thu, 06 Feb 2025 12:00:51 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:00:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 46/61] target/arm: Implement SME2 BFCVT, BFCVTN, FCVT, FCVTN
Date: Thu,  6 Feb 2025 11:57:00 -0800
Message-ID: <20250206195715.2150758-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: SJwH+qs6zIDb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  5 +++
 target/arm/tcg/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 25 ++++++++++++
 target/arm/tcg/sme.decode      | 12 ++++++
 4 files changed, 116 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 673aa347bc..cb81f89fb3 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -213,3 +213,8 @@ DEF_HELPER_FLAGS_5(sme2_umlsll_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr,
 DEF_HELPER_FLAGS_5(sme2_umlsll_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme2_usmlall_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme2_usmlall_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_bfcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_n, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 6fbf49e77d..6d2b83d26a 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1488,3 +1488,77 @@ DO_MLALL_IDX(sme2_usmlall_idx_s, uint32_t, uint8_t, int8_t, H4, H1, +)
 DO_MLALL_IDX(sme2_usmlall_idx_d, uint64_t, uint16_t, int16_t, H8, H2, +)
 
 #undef DO_MLALL_IDX
+
+/* Convert and compress */
+void HELPER(sme2_bfcvt)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    ARMVectorReg scratch __attribute__((uninitialized));
+    size_t oprsz = simd_oprsz(desc);
+    size_t i, n = oprsz / 4;
+    float32 *s0 = vs;
+    float32 *s1 = vs + sizeof(ARMVectorReg);
+    bfloat16 *d = vd;
+
+    if (vd == s1) {
+        s1 = memcpy(&scratch, s1, oprsz);
+    }
+
+    for (i = 0; i < n; ++i) {
+        d[H2(i)] = float32_to_bfloat16(s0[H4(i)], fpst);
+    }
+    for (i = 0; i < n; ++i) {
+        d[H2(i) + n] = float32_to_bfloat16(s1[H4(i)], fpst);
+    }
+}
+
+void HELPER(sme2_fcvt_n)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    ARMVectorReg scratch __attribute__((uninitialized));
+    size_t oprsz = simd_oprsz(desc);
+    size_t i, n = oprsz / 4;
+    float32 *s0 = vs;
+    float32 *s1 = vs + sizeof(ARMVectorReg);
+    float16 *d = vd;
+
+    if (vd == s1) {
+        s1 = memcpy(&scratch, s1, oprsz);
+    }
+
+    for (i = 0; i < n; ++i) {
+        d[H2(i)] = float32_to_float16(s0[H4(i)], true, fpst);
+    }
+    for (i = 0; i < n; ++i) {
+        d[H2(i) + n] = float32_to_float16(s1[H4(i)], true, fpst);
+    }
+}
+
+/* Convert and interleave */
+void HELPER(sme2_bfcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    float32 *s0 = vs;
+    float32 *s1 = vs + sizeof(ARMVectorReg);
+    bfloat16 *d = vd;
+
+    for (i = 0; i < n; ++i) {
+        bfloat16 d0 = float32_to_bfloat16(s0[H4(i)], fpst);
+        bfloat16 d1 = float32_to_bfloat16(s1[H4(i)], fpst);
+        d[H2(i * 2 + 0)] = d0;
+        d[H2(i * 2 + 1)] = d1;
+    }
+}
+
+void HELPER(sme2_fcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    float32 *s0 = vs;
+    float32 *s1 = vs + sizeof(ARMVectorReg);
+    bfloat16 *d = vd;
+
+    for (i = 0; i < n; ++i) {
+        bfloat16 d0 = float32_to_float16(s0[H4(i)], true, fpst);
+        bfloat16 d1 = float32_to_float16(s1[H4(i)], true, fpst);
+        d[H2(i * 2 + 0)] = d0;
+        d[H2(i * 2 + 1)] = d1;
+    }
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index f41b4343e4..777ea15a80 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1263,3 +1263,28 @@ TRANS_FEAT(UMLALL_nx_d, aa64_sme_i16i64, do_smlall_nx, a, gen_helper_sme2_umlall
 TRANS_FEAT(UMLSLL_nx_d, aa64_sme_i16i64, do_smlall_nx, a, gen_helper_sme2_smlsll_idx_d)
 TRANS_FEAT(USMLALL_nx_d, aa64_sme_i16i64, do_smlall_nx, a, gen_helper_sme2_usmlall_idx_d)
 TRANS_FEAT(SUMLALL_nx_d, aa64_sme_i16i64, do_smlall_nx, a, gen_helper_sme2_sumlall_idx_d)
+
+static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
+                       ARMFPStatusFlavour type, gen_helper_gvec_2_ptr *fn)
+{
+    if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        TCGv_ptr fpst = fpstatus_ptr(type);
+
+        for (int i = 0, n = a->n; i < n; ++i) {
+            tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->zd + i),
+                               vec_full_reg_offset(s, a->zn + i),
+                               fpst, svl, svl, data, fn);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(BFCVT, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_bfcvt)
+TRANS_FEAT(BFCVTN, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_bfcvtn)
+TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_fcvt_n)
+TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_fcvtn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 91df2068cf..8cca7d0d46 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -719,3 +719,15 @@ BFMLS_nx        11000001 0001 .... 1 .. 1.. ...01 1 ....    @azx_4x1_i3_o3
 FMLS_nx_h       11000001 0001 .... 1 .. 1.. ...00 1 ....    @azx_4x1_i3_o3
 FMLS_nx_s       11000001 0101 .... 1 .. 0.. ...00 10 ...    @azx_4x1_i2_o3
 FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
+
+### SME2 Multi-vector SVE Constructive Unary
+
+&zz_n           zd zn n
+@zz_1x2         ........ ... ..... ...... ..... zd:5        \
+                &zz_n n=1 zn=%zn_ax2
+
+BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
+BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
+
+FCVT_n          11000001 001 00000 111000 ....0 .....       @zz_1x2
+FCVTN           11000001 001 00000 111000 ....1 .....       @zz_1x2
-- 
2.43.0

