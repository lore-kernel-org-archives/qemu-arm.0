Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB6CD6E7D
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoC-0006kV-Vf; Thu, 04 Jun 2026 19:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoB-0006id-9J
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:07 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo7-0007tq-HE
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c0c1e0b0faso9312365ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616942; x=1781221742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00A7hgOZ4BJxydtU0VYApJHMDSvFHd62SnNXpfPSUCw=;
 b=Lx1pWSxjg2UyLhEBVffK6fRHna6jXQw7vuDXe0/PRojZBvdgJJaTZgzU76Pyw5ifYW
 WxXwVJX7aDF/NEfM+afkp2PyhBaTDJEq/im6QnIQ0FTudUGQJZulTi5Q+9MSNKJ6aS0h
 /IRja9SQmKlna0rrVmB+q1uNn8CxmCXUmSg+8ws9Iv4etQK15rPN4F2c4Fo4eqoNFKWu
 woxcRtdyDjNljFF8VuIa6HjaJs3SjfAxlsYKH+l3D+xw8BlDXk3kBTHzZEv0vPRGsRqF
 JG7M6B96bHjpVfQHNXKoLCMXFcPptKxxfdsC6RjENBnJejsuuICBfP+yJNoVSXoUSf7U
 jfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616942; x=1781221742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=00A7hgOZ4BJxydtU0VYApJHMDSvFHd62SnNXpfPSUCw=;
 b=No86yCNbVQEY+MxRR40RNd/0U04d417H4/vOXYHWucZUAuZNIZ4m/wYgrkmma4F894
 ngCw3euEY6xuGccmfMtUgPQDkgnKhpKDpMRJ36DPjmMjc8nmFniv8p1Z8l9r/ffiGmU/
 EOVBFo1EeU9438kI3bzIiuZy2wS9GRdUsG63Zc6TkbeCnLNjK/4uSwn7DqlMUX5LWTif
 9zMV+AclgDYL488EJXIP3E6HNe+gyUFn6AAUwnAwb2ZOqRGRvZ43M/XIME4QvNFuwJoy
 8NOQo+gl3PPd7REp2nKQEXaLkpkFqZNZNQTFmF4TClFej8vU+lKjiHz4tOZrx6CxyaWg
 SkJA==
X-Gm-Message-State: AOJu0Yytbrol0uwhATU2pRFKAsnI8/HsXy5WzKaCmS+zF22VcTXWLU/L
 s4k2jjkYX21v5wCYGvkNOjawflbD+ThieB5jWpy5kOpQZWN5MhJ1OCD5M04/HmfTObEaJlBUJWo
 kkME3vlU=
X-Gm-Gg: Acq92OFuUzzXp+P1r9+kqcmGRwBjEfEoGy3KTMxZGZCLHUiIhNHYHhaoKnrqe2Gfl06
 miryj1WB/s9/BfDbQH1Iug0A1ShQ4nOTKHgFfUsmnxKO4GPyHwiOgY7xww+RXJj2/ifBPdVMSva
 FbyMgQTd3PH66ti3fKPGAJ2SmpXxlyyDrsAFYXUE+2XkcBPNwuD2buat5/tdAiRPHQa0030UQ64
 1036UG5eGuv/NenCExzmFJ4ryRo+Elq37VaaNl5ssG055Lo7kzR9gxiyesRYfi6MmbbkwwmVG9K
 2nnDvQl5QRVmjjpyKJOKmEPK64kKthYAgK6Olaq+suJjwlmQVWpBrtwCDJiIAPQmUEdo7QTrmS9
 ROm/3tXjj7ZHAA5m96bk+zN3oJSfyxz8BuHHdwt5TghQaeL3OVzmUhZDy76EtkQIO/ylPYQrSr8
 rAszBqbPRaE4/Z1L1uDvl3Mdj8bcxot5A3cjxovYyyM4cPR/kqQQ==
X-Received: by 2002:a17:902:f64e:b0:2c0:ee6c:c53c with SMTP id
 d9443c01a7336-2c1e7b2f52dmr7355425ad.1.1780616941989; 
 Thu, 04 Jun 2026 16:49:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/25] target/arm: Implement Floating-point round to integral
 value (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:38 -0700
Message-ID: <20260604234852.573178-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This is the various FRINT rounding modes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 17 +++++++++++++++++
 target/arm/tcg/sve.decode      |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e9c0a73e90..3b346aed35 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4644,6 +4644,9 @@ static gen_helper_gvec_3_ptr * const frint_fns[] = {
 TRANS_FEAT(FRINTI_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            frint_fns[a->esz], a, 0,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
+TRANS_FEAT(FRINTI_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           frint_fns[a->esz], a, 1,
+           a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 static gen_helper_gvec_3_ptr * const frintx_fns[] = {
     NULL,
@@ -4654,6 +4657,9 @@ static gen_helper_gvec_3_ptr * const frintx_fns[] = {
 TRANS_FEAT(FRINTX_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            frintx_fns[a->esz], a, 0,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
+TRANS_FEAT(FRINTX_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           frintx_fns[a->esz], a, 1,
+           a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                           ARMFPRounding mode, int data,
@@ -4694,6 +4700,17 @@ TRANS_FEAT(FRINTZ_m, aa64_sme_or_sve, do_frint_mode, a,
 TRANS_FEAT(FRINTA_m, aa64_sme_or_sve, do_frint_mode, a,
            FPROUNDING_TIEAWAY, 0, frint_fns[a->esz])
 
+TRANS_FEAT(FRINTN_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_TIEEVEN, 1, frint_fns[a->esz])
+TRANS_FEAT(FRINTP_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_POSINF, 1, frint_fns[a->esz])
+TRANS_FEAT(FRINTM_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_NEGINF, 1, frint_fns[a->esz])
+TRANS_FEAT(FRINTZ_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_ZERO, 1, frint_fns[a->esz])
+TRANS_FEAT(FRINTA_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_TIEAWAY, 1, frint_fns[a->esz])
+
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
     gen_helper_sve_frecpx_s, gen_helper_sve_frecpx_d,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index f1cf7a628d..099cd4e93d 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1240,6 +1240,14 @@ FRINTA_m        01100101 .. 000 100 101 ... ..... .....         @rd_pg_rn
 FRINTX_m        01100101 .. 000 110 101 ... ..... .....         @rd_pg_rn
 FRINTI_m        01100101 .. 000 111 101 ... ..... .....         @rd_pg_rn
 
+FRINTN_z        01100100 .. 011 000 100 ... ..... .....         @rd_pg_rn
+FRINTP_z        01100100 .. 011 000 101 ... ..... .....         @rd_pg_rn
+FRINTM_z        01100100 .. 011 000 110 ... ..... .....         @rd_pg_rn
+FRINTZ_z        01100100 .. 011 000 111 ... ..... .....         @rd_pg_rn
+FRINTA_z        01100100 .. 011 001 100 ... ..... .....         @rd_pg_rn
+FRINTX_z        01100100 .. 011 001 110 ... ..... .....         @rd_pg_rn
+FRINTI_z        01100100 .. 011 001 111 ... ..... .....         @rd_pg_rn
+
 # SVE floating-point unary operations
 FRECPX_m        01100101 .. 001 100 101 ... ..... .....         @rd_pg_rn
 FSQRT_m         01100101 .. 001 101 101 ... ..... .....         @rd_pg_rn
-- 
2.43.0


