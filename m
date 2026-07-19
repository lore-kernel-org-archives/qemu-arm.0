Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DDC4451B
	for <qemu-arm@archiver.kernel.org>; Sun, 19 Jul 2026 17:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlVdt-0000js-DA; Sun, 19 Jul 2026 13:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlVdh-0000fS-St
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 13:49:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlVdf-0003DH-OP
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 13:49:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3810c5d691bso7320398a91.1
 for <qemu-arm@nongnu.org>; Sun, 19 Jul 2026 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784483358; x=1785088158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E+OQ6BtDfQiTt1mzt/r3Vu4ZzRtczFyPqZTa5s6YjYo=;
 b=ZYhEs1j8eBgpnPoTSmF07waPXU+uM9SRw1RUog/fyz2yxARvg6Gvux7l9k+aFocADP
 ltcrBuCBDdmGRCIbQi+40VXRbISVAdF7frzH29BF3BXDY2bTMfShZaggbUlXHwvvMK8B
 MZl321jq8OTQNYsR7WT47MXiXNL6Tr3r+XvgGpGQukYqw62de4w7oYlmImr4zmEJGoWX
 B3aYELir9ddYbX/Nr+Ykr1Xow/H/IL/2ybyUJvqSzRSKsJUtQRWgTDdNx3aePiNdmYY6
 eATZPgOf+xhmXYvBFA/QtMV4/gu9KVUfNNO+tUF9UZ6di5p09DAFTsmGXIsGpG7yfyWW
 Zq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784483358; x=1785088158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E+OQ6BtDfQiTt1mzt/r3Vu4ZzRtczFyPqZTa5s6YjYo=;
 b=YdCfnZf3ApKX+wshDRa9bO6Xkxr9TRQRg4wSaicTxrtDi/3mzy5v8KQ+7Jp818AGct
 NHa3hP0Cd6+CB0I5RiTvX55fEAmRX0YxK74r60BPhNUgn195RufqEGcrJFvFLIQqrV9j
 zcemcH8WTri1qnhiwr7JfKgtH4kdEllX6ZHkTpJ9xIFyKgD/WV0WWhAa4fPwm1/5SMQg
 awfHNihBGRQhH1sER55T3bl98l5hj51elyWRS0rbdLjAitF1TtQByLTETXy7T18Mp9Mt
 nI08YpkdFGt5SPf5lUdT+ZRr1rNevsjMULjmCkFik8dKSbU1lfDQuWr3Vyxrpvxu6CPP
 uEPw==
X-Gm-Message-State: AOJu0YyPFYsHFH3CM0pCzrGN08p3SnY/+8qIGnfBmM0o8hOLIHX+t0zB
 rN2lkH1gilPF7/NbUQ3CRNQIYXsUy3F7w6I4+644uEtu9upeWxOMHh91rDU/i9OkkKlYHBPC6CK
 6uCUx
X-Gm-Gg: AfdE7cm6SbAGQ1gmBq795176yOj2YvL02YsrN/MgyIUefWRPpk1JfFFlIDY68J4LVeY
 oPS/MtZznftPzy/7JbPrheGLAS40F86ZvZU3WTGO7Ea5BxSEUvQpVHwuNH7mZ2KtHpeJt5pXnDQ
 jgzw8mEo8Mnp/9adxZmXO5XfjFzmPTgRbICdUGLRPJriISSvMH3T9X27iWSaIebjciMNdcFAN4r
 /Tpa+vMHVg/ESwUrdqPGfhVi2By/Dyus4epvFbHHl9wqtGRDcDXMzS2ubMYQg/gMmwauhZ/GV2D
 EoVdVR5hp6AS1OWs7P0BkNhpCdTTZzH0m1XNTpPH+BWOCHmOkQLcsZ/YBpZyG6JnzI1eC/p6qfU
 iIRUSMFQhiO5inrOAO9L43i8DyW6DHgCxfTQhPPbAvUDV6detFAL2LmG96ry3oMPdjU5wLXQl6D
 gsvVwFTlQ=
X-Received: by 2002:a05:6a21:e0a6:b0:3c0:9c18:d5a1 with SMTP id
 adf61e73a8af0-3c3ad9647b0mr11526197637.62.1784483358102; 
 Sun, 19 Jul 2026 10:49:18 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20c158sm30471881eec.29.2026.07.19.10.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2026 10:49:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/6] target/arm: Implement FMUL (multiple/multiple and single
 vectors)
Date: Sun, 19 Jul 2026 10:49:04 -0700
Message-ID: <20260719174905.420725-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719174905.420725-1-richard.henderson@linaro.org>
References: <20260719174905.420725-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/arm/tcg/translate-sme.c |  9 +++++++++
 target/arm/tcg/sme.decode      | 15 ++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 379764da24..840e91b677 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -895,6 +895,15 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
 TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_zzz_n1_fpst, a, f_vector_fscale[a->esz])
 TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_zzz_nn_fpst, a, f_vector_fscale[a->esz])
 
+static gen_helper_gvec_3_ptr * const f_vector_fmul[4] = {
+    NULL,
+    gen_helper_gvec_fmul_h,
+    gen_helper_gvec_fmul_s,
+    gen_helper_gvec_fmul_d,
+};
+TRANS_FEAT(FMUL_n1, aa64_sme2p2, do_zzz_n1_fpst, a, f_vector_fmul[a->esz])
+TRANS_FEAT(FMUL_nn, aa64_sme2p2, do_zzz_nn_fpst, a, f_vector_fmul[a->esz])
+
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index e1bef9987b..60c7cacc10 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -219,6 +219,8 @@ UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
 
 %zd_ax2         1:4 !function=times_2
 %zd_ax4         2:3 !function=times_4
+%zn_ax2         6:4 !function=times_2
+%zn_ax4         7:3 !function=times_4
 
 &zzz_en         zd zn zm esz n
 
@@ -288,6 +290,11 @@ SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
 FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
 FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
 
+FMUL_n1        1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2
+FMUL_n1        1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4
+
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
 %zm_ax2         17:4 !function=times_2
@@ -361,6 +368,11 @@ FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
 FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
 FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
 
+FMUL_nn        1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2
+FMUL_nn        1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4
+
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
 &azz_n          n off rv zn zm
@@ -521,9 +533,6 @@ FDOT_n1_hb      11000001 001 1 .... 0 .. 100 ..... 01 ...   @azz_nx1_o3 n=4
 
 ### SME2 Multi-vector Multiple Array Vectors
 
-%zn_ax2         6:4 !function=times_2
-%zn_ax4         7:3 !function=times_4
-
 @azz_2x2_o3     ........ ... ..... . .. ... ..... .. off:3  \
                 &azz_n n=2 rv=%mova_rv zn=%zn_ax2 zm=%zm_ax2
 @azz_4x4_o3     ........ ... ..... . .. ... ..... .. off:3  \
-- 
2.43.0


