Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E41DCDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:53:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGD-0004qu-J9; Wed, 24 Jun 2026 21:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGA-0004o8-FZ
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG7-0008R8-V3
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2c6ab886da6so9320225ad.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352322; x=1782957122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idj9Q2rEr7IpLviqkeBHfIp7SzWSnDPDKLJaafvlO4I=;
 b=Rvx/V1bMmH9UkKGTYmgjXPgZbmrGo6q7ecGbKfMQy7TlPGTjJbGf/J55V7aLHy0/rQ
 YuuG5zHCgJPyhP1Yl555m1YdhCDCAJ4RhVdvpHOOJAWB9aJhJZ3Vy1KtzHSfi3zwkAu2
 rJ+bqh2n48i+2eoG5mps8IluMdHgxdp02jGSLQUS41ZfneXncWuHA/LhQDUYs8ssSQov
 EkVzhDgVBRkVPBVAPJy8HHj4rttfWBvgXscY1bI/JvzD+asvaDZIbuEjSrj06R/wlDLI
 2sGIBlFZNPSlxqeKMNLNrCTWvCW2lY5oCK70dqKu6WeBU5QMR5Lt78/qsAq33eMPXzfT
 YV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352322; x=1782957122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=idj9Q2rEr7IpLviqkeBHfIp7SzWSnDPDKLJaafvlO4I=;
 b=mGT8d7mVEq5tSFFj0VDt1BQhLDQNIzmCA5zxnwD02mYu7N2v4TFE9/THTNypt277qM
 VC4GBojJS89hrQwU105uGl6hVSHuifHOBe91td+IN6CIzSHcgcfGKOiXNpAJ3HifzMAE
 P4Cq/B5mXbnxzgTIXe7H/wMUM/Pc16lqVcGMnKwfgHTQJ0KxZpGkgLv1DXSRyusV98s9
 aDLU6xnEMjRc+4SyphP40wvtyy0hAcWCBsFVlOfMcEQKLQ7lOacxI/neVoW1Ds920+wV
 HyUGvy0PpyqCNOGzbQJvc/4Y6TU/IXPtutI/UgWFNAWjIZrrloHJinDk87lZJedongzT
 ds6g==
X-Gm-Message-State: AOJu0Ywy1pnrOJugDeNx2ErOvD3o9wMvb62aT8T1l7jyd/PcPhEGMMsy
 BYdhDv6WBlvyoLNLjR9/tfzvZxZV8Nrz4fQCB/Jb1WyQdPMlibZX8cOAxnGBRmrWaOQ=
X-Gm-Gg: AfdE7cmgqoqy70RlYLkUYRcq2DO3H/Z2i7+2gQkWAQrova61EDpd4GTY61WUW1i7Qi/
 jS4a/GxbZ3TRV3t+OexuBs3DuzTDieVJkGJTsajO0rwYewJnWegqwjJL6LMebGjMHmPmudss4uR
 W83Zk+uaKuwAHpEhpYwy75ND+Aeb8fdbvBqCqvnFsGKTFb7p9WLrbmRCkTZmoT0uUPLCwdBk7f4
 4aS5JsrWXzED3sv4gcoQKObFwmct5QxBlW+f+QzTTxJTnRBNKVw1wEvYRzCv47qJL25LP/qrPLY
 0bOQRqSE7HwOPwXgS6+zs6RTQMHwG5gDlcoMdtBO0hWKvcwPx+49o31Mv756PxRWgd1aFAoPtI3
 vYP8TZzzDGr78vDADze4aSlArtk0QePmm2MwjwgP8RsXiuMqvbQjjSTVcLkjGdsqfW0u3IgznDt
 GZgbqcKgdHjw6HtYxfQ1lc9gEb1sx3OX+RzIsGRx6KU2sbj7gEvA==
X-Received: by 2002:a17:902:da88:b0:2c6:e46f:7e62 with SMTP id
 d9443c01a7336-2c7fca4b753mr6525515ad.33.1782352322139; 
 Wed, 24 Jun 2026 18:52:02 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/10] target/arm: Rename SME FMLAL/FMLSL patterns
Date: Wed, 24 Jun 2026 18:51:50 -0700
Message-ID: <20260625015159.719300-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
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

Rename patterns to include _sh suffix, so that we can
distinguish insns of the same name from FEAT_SME_F8F16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 12 ++++++------
 target/arm/tcg/sme.decode      | 32 ++++++++++++++++----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b8dde80c20..7aa270d3ec 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1107,10 +1107,10 @@ static bool do_fmlal(DisasContext *s, arg_azz_n *a, bool sub, bool multi)
                          multi, FPST_ENV, gen_helper_sve2_fmlal_zzzw_s);
 }
 
-TRANS_FEAT(FMLAL_n1, aa64_sme2, do_fmlal, a, false, false)
-TRANS_FEAT(FMLSL_n1, aa64_sme2, do_fmlal, a, true, false)
-TRANS_FEAT(FMLAL_nn, aa64_sme2, do_fmlal, a, false, true)
-TRANS_FEAT(FMLSL_nn, aa64_sme2, do_fmlal, a, true, true)
+TRANS_FEAT(FMLAL_n1_sh, aa64_sme2, do_fmlal, a, false, false)
+TRANS_FEAT(FMLSL_n1_sh, aa64_sme2, do_fmlal, a, true, false)
+TRANS_FEAT(FMLAL_nn_sh, aa64_sme2, do_fmlal, a, false, true)
+TRANS_FEAT(FMLSL_nn_sh, aa64_sme2, do_fmlal, a, true, true)
 
 static bool do_fmlall_fp8(DisasContext *s, arg_azz_n *a, bool multi)
 {
@@ -1128,8 +1128,8 @@ static bool do_fmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
                          false, FPST_ENV, gen_helper_sve2_fmlal_zzxw_s);
 }
 
-TRANS_FEAT(FMLAL_nx, aa64_sme2, do_fmlal_nx, a, false)
-TRANS_FEAT(FMLSL_nx, aa64_sme2, do_fmlal_nx, a, true)
+TRANS_FEAT(FMLAL_nx_sh, aa64_sme2, do_fmlal_nx, a, false)
+TRANS_FEAT(FMLSL_nx_sh, aa64_sme2, do_fmlal_nx, a, true)
 
 static bool do_bfmlal(DisasContext *s, arg_azz_n *a, bool sub, bool multi)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 1de5f341ef..90ee161461 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -324,13 +324,13 @@ SUB_azz_n1_d    11000001 0111 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
 @azz_nx1_o2x2   ........ ... . zm:4 . .. ... zn:5 ... ..    \
                 &azz_n off=%off2_x2 rv=%mova_rv
 
-FMLAL_n1        11000001 001 0 .... 0 .. 011 ..... 00 ...   @azz_nx1_o3x2 n=1
-FMLAL_n1        11000001 001 0 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=2
-FMLAL_n1        11000001 001 1 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=4
+FMLAL_n1_sh     11000001 001 0 .... 0 .. 011 ..... 00 ...   @azz_nx1_o3x2 n=1
+FMLAL_n1_sh     11000001 001 0 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=2
+FMLAL_n1_sh     11000001 001 1 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=4
 
-FMLSL_n1        11000001 001 0 .... 0 .. 011 ..... 01 ...   @azz_nx1_o3x2 n=1
-FMLSL_n1        11000001 001 0 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=2
-FMLSL_n1        11000001 001 1 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=4
+FMLSL_n1_sh     11000001 001 0 .... 0 .. 011 ..... 01 ...   @azz_nx1_o3x2 n=1
+FMLSL_n1_sh     11000001 001 0 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=2
+FMLSL_n1_sh     11000001 001 1 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=4
 
 BFMLAL_n1       11000001 001 0 .... 0 .. 011 ..... 10 ...   @azz_nx1_o3x2 n=1
 BFMLAL_n1       11000001 001 0 .... 0 .. 010 ..... 100 ..   @azz_nx1_o2x2 n=2
@@ -477,11 +477,11 @@ SUB_azz_nn_d    11000001 111 ...01 0 .. 110 ...00 11 ...    @azz_4x4_o3
 @azz_4x4_o2x2   ........ ... ..... . .. ... ..... ... ..    \
                 &azz_n n=4 rv=%mova_rv zn=%zn_ax4 zm=%zm_ax4 off=%off2_x2
 
-FMLAL_nn        11000001 101 ....0 0 .. 010 ....0 000 ..    @azz_2x2_o2x2
-FMLAL_nn        11000001 101 ...01 0 .. 010 ...00 000 ..    @azz_4x4_o2x2
+FMLAL_nn_sh     11000001 101 ....0 0 .. 010 ....0 000 ..    @azz_2x2_o2x2
+FMLAL_nn_sh     11000001 101 ...01 0 .. 010 ...00 000 ..    @azz_4x4_o2x2
 
-FMLSL_nn        11000001 101 ....0 0 .. 010 ....0 010 ..    @azz_2x2_o2x2
-FMLSL_nn        11000001 101 ...01 0 .. 010 ...00 010 ..    @azz_4x4_o2x2
+FMLSL_nn_sh     11000001 101 ....0 0 .. 010 ....0 010 ..    @azz_2x2_o2x2
+FMLSL_nn_sh     11000001 101 ...01 0 .. 010 ...00 010 ..    @azz_4x4_o2x2
 
 BFMLAL_nn       11000001 101 ....0 0 .. 010 ....0 100 ..    @azz_2x2_o2x2
 BFMLAL_nn       11000001 101 ...01 0 .. 010 ...00 100 ..    @azz_4x4_o2x2
@@ -617,13 +617,13 @@ BFSUB_nn        11000001 111 00101 0 .. 111 ...00 01 ...    @az_4x4_o3
 @azx_4x1_o2x2   ........ .... zm:4 . .. . .. ..... .. ...   \
                 &azx_n n=4 rv=%mova_rv off=%off2_x2 zn=%zn_ax4 idx=%idx2_10_2
 
-FMLAL_nx        11000001 1000 .... . .. 1 .. ..... 00 ...   @azx_1x1_o3x2
-FMLAL_nx        11000001 1001 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_o2x2
-FMLAL_nx        11000001 1001 .... 1 .. 1 .. ...00 00 ...   @azx_4x1_o2x2
+FMLAL_nx_sh     11000001 1000 .... . .. 1 .. ..... 00 ...   @azx_1x1_o3x2
+FMLAL_nx_sh     11000001 1001 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_o2x2
+FMLAL_nx_sh     11000001 1001 .... 1 .. 1 .. ...00 00 ...   @azx_4x1_o2x2
 
-FMLSL_nx        11000001 1000 .... . .. 1 .. ..... 01 ...   @azx_1x1_o3x2
-FMLSL_nx        11000001 1001 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_o2x2
-FMLSL_nx        11000001 1001 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_o2x2
+FMLSL_nx_sh     11000001 1000 .... . .. 1 .. ..... 01 ...   @azx_1x1_o3x2
+FMLSL_nx_sh     11000001 1001 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_o2x2
+FMLSL_nx_sh     11000001 1001 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_o2x2
 
 BFMLAL_nx       11000001 1000 .... . .. 1 .. ..... 10 ...   @azx_1x1_o3x2
 BFMLAL_nx       11000001 1001 .... 0 .. 1 .. ....0 10 ...   @azx_2x1_o2x2
-- 
2.43.0


