Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D0DC43602
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 20:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfOGA-0006qN-WE; Thu, 02 Jul 2026 16:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFz-0006jN-2t
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:35 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFs-0000Uj-FG
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:34 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-847a69ba83dso1358459b3a.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 13:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783025005; x=1783629805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=df4N35aTj6C9IHwYzsSxXrxhNKFg2xVClcAfKEMrLIM=;
 b=o8KuQ1x66Qp4sjjQA9D1PycCAGDzJs+FyaKndD0ZKTYf7lEAMcLmXNLePOZdN5LsoB
 OKpQhNV2e1U/7k+CPvbsADjtJM/i+kS22uvGw9XT6sgBG0KVLonXkDNm6MdJZhZa6JkZ
 lExpd9ikbjJzK1LPPToEs5WYMcfynE68MfBcplQOU6WYPIyiCYGBqm++YcPtVKHWTzyC
 npu+jPzZFyOHTJCopu5fFRV7qEP/gVXHbVDANQFCtNxesa06lANCV1owFZp0oqL25i4J
 9ymfNYRrSyKMtg5NGE/zliZPqRyNchAF29grgvwJ5nm6ZVupSYeUL6U5wTYu8NhntZtc
 5Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783025005; x=1783629805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=df4N35aTj6C9IHwYzsSxXrxhNKFg2xVClcAfKEMrLIM=;
 b=K03LJbvFuxybwi7uz7Fr+zJSJdqRUX5jxSkDodGk0f/7qTxuC6r/L15tvvqjoPlvnN
 T8F9IvEHdaZKcloHkr1+sWJhGvcH/O2WIjiTzcKrBw1bx9URUWE6ws8qNSxpQj/B6j1j
 qYALxAg9NbsmxTl9vSnrLD7HzzcXjV5Fxl0Do114TmD/H+fac6nP9ir1PaB2ylHuYHa5
 YL8HKe3vGo1ol9d/Cw6CRD1s3Xg8EHfR7zjWLbMmrypD2tSg61N60zgu7TTTBsEnbDiq
 9RfD8T1E91ocx6hifdIMp16dEAmA0USDMxTO01AS1plH/ZvIVLGJK8IXW7hIfO89uS9O
 FSFA==
X-Gm-Message-State: AOJu0Yw/NMr4Tr4gUcm3hR0c+jKAk4JlhF+J/l4dsdpi1G01bOgg2lNq
 mi0v2qwxluCZK5gi4AOxcC/ihmyLhFWyv4YGNWHamHaqNLZQ4HOYgEkM91JjguU1g84=
X-Gm-Gg: AfdE7clPSXPQMfVKypK1saTXdG1pkYLY8kr+KgOt8kf90sABaxp1+QR7xZGdfLMA4gB
 8L0I75v4AmQnZ2AvU8XvZhvrx82eVM8Ao4UT2ptWpAVlKHdibsS9QEnIoku5Uzjcfp4yyAACy9C
 LHcgpxUoEPh9a8r5k1Wy5OPHwabQTtzUPWGZFCUbcxPiY88Tqj8rppq4mRBf9nPu6+wjYCqQtCh
 ky75799remm1ZHvsI0WoHKtNbbYpG3Ivx95vURFHDXMN60tSQReU/ynw1e05WXmaLuNOpAoJXam
 +i6rv+TGeLYLU+f7joulh9rKzS8CJjP83wY1kFJJWIaN24+7vduvcZut2llDV39WRTxrqwHDfz0
 SuXM/bjESqr7aUXXiQy1cjBwO/J7JScOjsZM4GdltBFPPzuTejG03LpjlE1QbIvG33H3Wdce/ut
 8IxiDtjV6FANCq+vKZ5c3TsByFyQ5Gl6fgck1zPA5hhDKfL2Hd8g==
X-Received: by 2002:a05:6a00:ad84:b0:847:95a6:eb74 with SMTP id
 d2e1a72fcca58-847c073141dmr7716123b3a.23.1783025005408; 
 Thu, 02 Jul 2026 13:43:25 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e921cd139sm1678941a12.23.2026.07.02.13.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/15] target/arm: Implement SUMOP4[AS]
Date: Thu,  2 Jul 2026 13:43:10 -0700
Message-ID: <20260702204314.79224-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
References: <20260702204314.79224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h | 5 +++++
 target/arm/tcg/sme_helper.c      | 5 +++++
 target/arm/tcg/translate-sme.c   | 5 +++++
 target/arm/tcg/sme.decode        | 3 +++
 4 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 070a1a2c1d..3da40d9f33 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -386,3 +386,8 @@ DEF_HELPER_FLAGS_4(sme_smop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme_sumop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 11d9d509ec..5a9e3b8398 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2972,4 +2972,9 @@ IMOP4_4WAY(smop4s_sb, -, int32_t, int8_t, int8_t)
 IMOP4_4WAY(smop4a_dh, +, int64_t, int16_t, int16_t)
 IMOP4_4WAY(smop4s_dh, -, int64_t, int16_t, int16_t)
 
+IMOP4_4WAY(sumop4a_sb, +, int32_t, int8_t, uint8_t)
+IMOP4_4WAY(sumop4s_sb, -, int32_t, int8_t, uint8_t)
+IMOP4_4WAY(sumop4a_dh, +, int64_t, int16_t, uint16_t)
+IMOP4_4WAY(sumop4s_dh, -, int64_t, int16_t, uint16_t)
+
 #undef IMOP4_4WAY
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 6f3806f4de..fce07b2565 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2114,3 +2114,8 @@ TRANS_FEAT(SMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_smop4s_sb : gen_helper_sme_smop4a_sb)
 TRANS_FEAT(SMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
            a->s ? gen_helper_sme_smop4s_dh : gen_helper_sme_smop4a_dh)
+
+TRANS_FEAT(SUMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
+           a->s ? gen_helper_sme_sumop4s_sb : gen_helper_sme_sumop4a_sb)
+TRANS_FEAT(SUMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
+           a->s ? gen_helper_sme_sumop4s_dh : gen_helper_sme_sumop4a_dh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 16f86a9d2d..aef3fae8db 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1120,3 +1120,6 @@ FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
 SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
 SMOP4_sb        1000 0000 000. ...0 1000 00.. ..0. 00..         @mop4_o2
 SMOP4_dh        1010 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
+
+SUMOP4_sb       1000 0000 001. ...0 1000 00.. ..0. 00..         @mop4_o2
+SUMOP4_dh       1010 0000 111. ...0 0000 00.. ..0. 1...         @mop4_o3
-- 
2.43.0


