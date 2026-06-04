Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA41CD6E7B
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:50:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoF-0006oC-Dd; Thu, 04 Jun 2026 19:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoB-0006jI-NH
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo9-0007uu-2z
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2bf1cda2b17so9659835ad.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616944; x=1781221744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DH7vrH7aOQYkFWuK7+yU89gRaaRlNsipaw6MSquJLEw=;
 b=TkbYtB3T2vNB79UKXZNS23h8/1Xy9FoC8VtHPzUbchQiy05tJo8gznVCp3KtDWDG4G
 Tich6EwWbDqXyD8nOEpb2z7KCKA1vo2gAsou6mr7KtbPbw7hAMeUMsEvm1vIOTSUusS5
 VDJ/V7EhcxZ04vTZBX6uPFA5tl3wp2hdGofaupmbG3Si4FSH0QFCOsHfKkbu+IgAmkwu
 26VbNPFye24ph9xqPUSH0hbIdAuktEkgDbIMGIhxZvlFUo9YdWfNm/J5VzFi/+oAZ67h
 GDg9mGR/luiXLpJMN4/Ymc0WTDGNTtJrR9r3Pbfr9Tg/AOgUbJalKpMonhmnrIDuysA0
 8YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616944; x=1781221744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DH7vrH7aOQYkFWuK7+yU89gRaaRlNsipaw6MSquJLEw=;
 b=AHP9PzdzxQ6mBSehuuoSbiopk+caeYfRi9WQ0/2HQL2rQ2HnGwbaghQBDoLDfFvVv7
 af4Bj4dor8vIl0wZpbegPN2xscxk7RIhvPsWL7pCcJtBI7ZjFtWzWQj6UtZkvyIm82Vu
 CtcllnTkmCt7Do8ITQ/8CvOmkgTdSXVP/O1zXOUAU9wQEs+NkZwmJul61ISLb4TGh2zz
 8dRSKlGPgziRaJzb5Z2dhGambtORE9wGW7Ki5ZGLpzD3DvEr5wwSuv13M2+pX82M01AY
 WFHiA0wdTKbEjcx5Jt4Rk7NQddI+rPZNB60CjBvZ0aLy0BGX9TJijnYh6j156uCf21ZZ
 RhmA==
X-Gm-Message-State: AOJu0YyBmstElncZKciwiHpOdV7NYSK6pS0739+Cs/GSgeq4mMM5KcA9
 lzxRkxD3Mb/HlKj8uAQuCCkHhURreeTfvo4p6qXQv0ueAmMiO/wepSPaFQApFM4lKFg=
X-Gm-Gg: Acq92OGPPJYWcDW8yceAcmO9zoln+ALuddJcFXk/xA1H623VGNhuRTpSJ7T1R0VdG0N
 RCa6esOJGR39Pa5++sHCQMtjevC+9eMYNKy0DLC15evWrmUz6Fs0QiFBy+fuxRqsvzoSilKgtjp
 sHV8FEBFc7//R3/Bqu0pm2BqvbE14pmNMF5gPbdHu0Qr4hZ4w9nboniie4vgn1k6VGW/IhFwTpa
 +ihuUGUJn4yHHjBptVq/Ls96PHAn+2ONk0agh6K/RJmsBCNoWRqSHWiOTVi8WREAYHX2BnSF1St
 j8wPk6oJ39GIIpJm55Qc5MwBApJF9fs9Zto7towPDec8m9sr59AAqoep9gae00Tw/RKx1Zb+Oty
 0q1fmzFpgt+gjifunIC3lDHbyPx7Q/ua86N2EPsSVXmav0u8mDjYQ13ZiRTaAvEyKFpmRy18ICa
 1zkFzy0WqDcbOFTSiND4X5ZpESnk+NfHqZymsn7T0=
X-Received: by 2002:a17:903:11c9:b0:2b9:6cde:c34b with SMTP id
 d9443c01a7336-2c1ec7982f5mr1451315ad.15.1780616943655; 
 Thu, 04 Jun 2026 16:49:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/25] target/arm: Implement Floating-point square root
 (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:40 -0700
Message-ID: <20260604234852.573178-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This is FRECPX and FSQRT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 5 +++++
 target/arm/tcg/sve.decode      | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index b35db9d3c8..9e0945252d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4736,6 +4736,8 @@ static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
 };
 TRANS_FEAT(FRECPX_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            frecpx_fns[a->esz], a, 0, select_ah_fpst(s, a->esz))
+TRANS_FEAT(FRECPX_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           frecpx_fns[a->esz], a, 1, select_ah_fpst(s, a->esz))
 
 static gen_helper_gvec_3_ptr * const fsqrt_fns[] = {
     NULL,                   gen_helper_sve_fsqrt_h,
@@ -4744,6 +4746,9 @@ static gen_helper_gvec_3_ptr * const fsqrt_fns[] = {
 TRANS_FEAT(FSQRT_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            fsqrt_fns[a->esz], a, 0,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
+TRANS_FEAT(FSQRT_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           fsqrt_fns[a->esz], a, 1,
+           a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 TRANS_FEAT(SCVTF_hh_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_scvt_hh, a, 0, FPST_A64_F16)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 889ff85f72..c39d80360f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1263,6 +1263,9 @@ FRINTI_z        01100100 .. 011 001 111 ... ..... .....         @rd_pg_rn
 FRECPX_m        01100101 .. 001 100 101 ... ..... .....         @rd_pg_rn
 FSQRT_m         01100101 .. 001 101 101 ... ..... .....         @rd_pg_rn
 
+FRECPX_z        01100100 .. 011 011 100 ... ..... .....         @rd_pg_rn
+FSQRT_z         01100100 .. 011 011 101 ... ..... .....         @rd_pg_rn
+
 # SVE integer convert to floating-point
 SCVTF_hh_m      01100101 01 010 01 0 101 ... ..... .....        @rd_pg_rn_e0
 SCVTF_sh_m      01100101 01 010 10 0 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.43.0


