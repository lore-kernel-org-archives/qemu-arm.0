Received: by 10.28.4.212 with SMTP id 203csp333928wme;
        Fri, 4 May 2018 11:31:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpsSfD5GRzXkieu0B/WDbVg2k2onBJ21wHDso67/SCI3lb8tcmRoS5N5Lu5s2mWRCVHmg1y
X-Received: by 2002:ac8:2f8f:: with SMTP id l15-v6mr13584170qta.337.1525458660187;
        Fri, 04 May 2018 11:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458660; cv=none;
        d=google.com; s=arc-20160816;
        b=sPj1hV/EJ7xs7BKFGtabRF+hakNm1MAg2qZwHkN1UFjItNiw8AzprAhS1KY6FKvy//
         H30YB9eeaoVMzV4rEI9XyeCm0Zos03KCAdvZQreKMbGaj9hmkfaTTphm5knB3XyGP6rA
         ZBqrJuUKcT/twxYQb6zuqfrd0TgNrwY48K5tl3dM6SjEKcm5Gl/s8H/iuKV7d88DewHE
         mQd+RM/zonN6cJ6D3wC1fI/QIGbRNmhWGhbk3Ms7nIHK8TyIOVEhjipMYfuEFUIOc1NX
         Xe5odBagSpUTEJhRPrzLje8yYl2k9WojNrmX5nkDuIxWw9tSHGtMBnBPXJxKW1DRtWiJ
         Fj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8liVC1EvOhXEjQqPTbUiUiso0NQryYqSK+kZmW2XosI=;
        b=VGNzI1WvaiWi8Fjajuuy4FGV+iu6KmdwueryihDg7vMdLMm78jRHoehYaPQnDyfJ5o
         7JozRPvhm0M5SOL0J7N7m7xN6bFHlkOm3xvono2nCoFhEEg86mlTWxwewHXR4a6Y5P61
         nLTR1thZm8YydtU7E+JruwupW7mWBk6w1LWESJW71wFHNDjp9Y6uVE6vsUmOfk4FnjvC
         5Q45lF80yGokdIjQ67MwtsfXBCcDjGy9GWvav0nCTbUUqEnNDEgOgHdMbL9JfCiz0fr/
         t1REE9w7U8Q7itT3rNv+YpfJ4QIrdty0BveF8EAcdyjrvETvXiBVdrC/pEPG7N+FCkhc
         +2jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=auTPZvxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12si11810609qka.92.2018.05.04.11.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=auTPZvxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfTv-0007hY-Ig
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTR-0007Sj-06
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTQ-00014T-1r
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:29 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTP-00013v-PU
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:27 -0400
Received: by mail-pg0-x243.google.com with SMTP id j11-v6so15977047pgf.2
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8liVC1EvOhXEjQqPTbUiUiso0NQryYqSK+kZmW2XosI=;
	b=auTPZvxOL43cPk1dHmLGtoavykFo4zabs/busrfaqJA9CjiIIPvXbcsnQ5zh9s6p9o
	3zkNeGOpxsLrzsejsckcj4frw62YLwWTgQmbcdDD9orA4UN0RAMoHJpt0jFooI8NX2oq
	JjxHRKbojPIlaiLTIokkks9XXUlUxggcQ/wbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8liVC1EvOhXEjQqPTbUiUiso0NQryYqSK+kZmW2XosI=;
	b=cZxuDCFniLOdtQJyRn9wgKJQwHJCqamxO7c78Cvxazdk3Ccok1v8bjCLW2pzEbcc5w
	gTtyY64w4KboejZ+QbL/JAGgrMdS2Dfn+Aff0130zrnJhyo9ij/LQMu/Q5lynHNwLxJg
	2tb7g31fYaHaNpKBp7hh/1aUrAv2XWf2sBcj51Lfy+fdCig+OAlJ+UZ6GM7mhT3lvdVN
	3zJYJx8F63p8UM09k5AhFnBet3jajfEe4B+R8yUFOb9zwHEGCIG114xyfSJf1zaPdgq5
	1vqexyLXi+TQ+88wvVWs4gWx/KZletbwUE4U89ZCXGMs19PiBHlLYwAvOP/nIXYlUiKb
	Heqw==
X-Gm-Message-State: ALQs6tCX/edeJaaMeV0oIGt0X0uzZrjrEBToO9UVokGZnzsZPMxbEFB1
	C0hmAKtxQLD+Qe+Rwy7g9h268g==
X-Received: by 2002:a65:5d0f:: with SMTP id
	e15-v6mr23701692pgr.119.1525458626756; 
	Fri, 04 May 2018 11:30:26 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:13 -0700
Message-Id: <20180504183021.19318-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 02/10] target/arm: Use new min/max expanders
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HAws1Q55+o5V

The generic expanders replace nearly identical code in the translator.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 46 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bff4e13bf6..d916fea3a3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6021,15 +6021,18 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
                 tcg_gen_add_i64(tcg_res, tcg_res, tcg_elt);
                 break;
             case 0x0a: /* SMAXV / UMAXV */
-                tcg_gen_movcond_i64(is_u ? TCG_COND_GEU : TCG_COND_GE,
-                                    tcg_res,
-                                    tcg_res, tcg_elt, tcg_res, tcg_elt);
+                if (is_u) {
+                    tcg_gen_umax_i64(tcg_res, tcg_res, tcg_elt);
+                } else {
+                    tcg_gen_smax_i64(tcg_res, tcg_res, tcg_elt);
+                }
                 break;
             case 0x1a: /* SMINV / UMINV */
-                tcg_gen_movcond_i64(is_u ? TCG_COND_LEU : TCG_COND_LE,
-                                    tcg_res,
-                                    tcg_res, tcg_elt, tcg_res, tcg_elt);
-                break;
+                if (is_u) {
+                    tcg_gen_umin_i64(tcg_res, tcg_res, tcg_elt);
+                } else {
+                    tcg_gen_smin_i64(tcg_res, tcg_res, tcg_elt);
+                }
                 break;
             default:
                 g_assert_not_reached();
@@ -9931,27 +9934,6 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Helper functions for 32 bit comparisons */
-static void gen_max_s32(TCGv_i32 res, TCGv_i32 op1, TCGv_i32 op2)
-{
-    tcg_gen_movcond_i32(TCG_COND_GE, res, op1, op2, op1, op2);
-}
-
-static void gen_max_u32(TCGv_i32 res, TCGv_i32 op1, TCGv_i32 op2)
-{
-    tcg_gen_movcond_i32(TCG_COND_GEU, res, op1, op2, op1, op2);
-}
-
-static void gen_min_s32(TCGv_i32 res, TCGv_i32 op1, TCGv_i32 op2)
-{
-    tcg_gen_movcond_i32(TCG_COND_LE, res, op1, op2, op1, op2);
-}
-
-static void gen_min_u32(TCGv_i32 res, TCGv_i32 op1, TCGv_i32 op2)
-{
-    tcg_gen_movcond_i32(TCG_COND_LEU, res, op1, op2, op1, op2);
-}
-
 /* Pairwise op subgroup of C3.6.16.
  *
  * This is called directly or via the handle_3same_float for float pairwise
@@ -10051,7 +10033,7 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
                 static NeonGenTwoOpFn * const fns[3][2] = {
                     { gen_helper_neon_pmax_s8, gen_helper_neon_pmax_u8 },
                     { gen_helper_neon_pmax_s16, gen_helper_neon_pmax_u16 },
-                    { gen_max_s32, gen_max_u32 },
+                    { tcg_gen_smax_i32, tcg_gen_umax_i32 },
                 };
                 genfn = fns[size][u];
                 break;
@@ -10061,7 +10043,7 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
                 static NeonGenTwoOpFn * const fns[3][2] = {
                     { gen_helper_neon_pmin_s8, gen_helper_neon_pmin_u8 },
                     { gen_helper_neon_pmin_s16, gen_helper_neon_pmin_u16 },
-                    { gen_min_s32, gen_min_u32 },
+                    { tcg_gen_smin_i32, tcg_gen_umin_i32 },
                 };
                 genfn = fns[size][u];
                 break;
@@ -10516,7 +10498,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 static NeonGenTwoOpFn * const fns[3][2] = {
                     { gen_helper_neon_max_s8, gen_helper_neon_max_u8 },
                     { gen_helper_neon_max_s16, gen_helper_neon_max_u16 },
-                    { gen_max_s32, gen_max_u32 },
+                    { tcg_gen_smax_i32, tcg_gen_umax_i32 },
                 };
                 genfn = fns[size][u];
                 break;
@@ -10527,7 +10509,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 static NeonGenTwoOpFn * const fns[3][2] = {
                     { gen_helper_neon_min_s8, gen_helper_neon_min_u8 },
                     { gen_helper_neon_min_s16, gen_helper_neon_min_u16 },
-                    { gen_min_s32, gen_min_u32 },
+                    { tcg_gen_smin_i32, tcg_gen_umin_i32 },
                 };
                 genfn = fns[size][u];
                 break;
-- 
2.14.3

