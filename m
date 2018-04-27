Received: by 10.28.4.212 with SMTP id 203csp179975wme;
        Thu, 26 Apr 2018 17:48:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqAggB+z9RVXJXJpbeKDLwETRbfkggtJ85+/i7KdbWhs2vaOddjFWFa3pqKrYiiX6khpnXL
X-Received: by 10.55.119.199 with SMTP id s190mr182192qkc.357.1524790086727;
        Thu, 26 Apr 2018 17:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524790086; cv=none;
        d=google.com; s=arc-20160816;
        b=vJaR1pPQfTlqTqLxyY8SrALB8HTTj7IgheE1IqunH7RxQCWtol604JT9zm/gxfwy/p
         5gnpvL1UzK+sdSNm/o6onhTY1o340R1OPIlOfKL1k4ujvwbzT4DN3gM7olK1b/g8LXv0
         r1uu5xgTJ80x5jd710n8XjFF/hjLPjN6IdJ2p7NDpqOi8h13ZjtmLGXuuMAr6lzs9Zl/
         7GwHDxCm5UDABls02G81znsvl31xlxsaLlHwptaohpKIggdRjQ2cNE2JK7Otjvp403hQ
         lnO/xO5Y2mgjqE3zk1wHEeEpH7Dlr8CmapdKQXn1FDAhfx182SXonabNMo9p0JUbpyAy
         WbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FcnQaKOY5FiYcN1YZAPz8IfJW4izctQEpJ8H6gTzcVU=;
        b=AFFFnhMJVOEx2W0K5d33exHxf4Eb/sohsQjed3eD/w+CUzrfw08HUSJYppMKLfRycC
         xFoZ1jOU94wOzFFFmxv0R1PVsHew9yXFK1/NbAV8sOdWaBhpavWxcgQXJnVTO5+Srg9O
         gVdrj4UjsGpLYsR90TW+0GsShcOS33Plj4plOUpS4YY10oOf6rcr4oNgtTYQJQkjv7+d
         cNWowqyEeZ1uxx8Mxe83i2lGmAmbAUB64wBUBb3n9AWwM0B3qWdMhQXhUDZtr+YTmyUM
         bnq9tf59FjObn8siQUpKlVqUy0oQoKMiwAtzZagYHt5Mwwx25vj2EN7ZvamGXPZ0WD9U
         r8Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bPOys9K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f54-v6si138067qvh.216.2018.04.26.17.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bPOys9K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrYU-00022k-8T
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:48:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE9-0001xR-LR
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE8-0004Px-Lw
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:05 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrE8-0004Pb-GS
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:04 -0400
Received: by mail-pg0-x244.google.com with SMTP id i6-v6so152450pgv.3
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FcnQaKOY5FiYcN1YZAPz8IfJW4izctQEpJ8H6gTzcVU=;
	b=bPOys9K5bvbyeZ5Jm5EXU9ej0n7y4YpE61DBD2Hya2qVOFw3UfRqkuH5+aqeczPqoq
	7vgfXPbvToFLBOyH7IbAT2IptIW/y9T49oPuWkYBajzPEVO8GfAFDDdf85onDkVo6Xcb
	evYXjWVaep2YA0SM50AUfzFUllwmSkvpA4O3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FcnQaKOY5FiYcN1YZAPz8IfJW4izctQEpJ8H6gTzcVU=;
	b=O6GuxorS5R7kEgbXaT0NpAehM50tjRy13kQvVh+D0pEt001XNHawQ5anWywjV3pEbw
	SQTdUSPS3nSjjgPJUEpW0Gtkyyo/Z3JdQi9VmaQh6CV9Yi8iVDqbpkoWUMHYYcDLbvTz
	Wl9E+Ym+yF5zR45uZpL8epvFWd0VpiMLGAzUgH9AjV0ilm2ohYn1NyMki0zAw9ZDW5Yr
	Q3P65VXgpKSR5ZMX8modKvb1vE3L7Iv2XWu0rDF/QDsBqQjoJRdyj/Fg2UIfmg8epZSG
	HQ/aicdjbP00GoIjkO6atMXByGB+V6neQeP1Ce/7RSF21bS567sjRwod3oBips6/uP78
	vqUA==
X-Gm-Message-State: ALQs6tCzZ1RK2inkdI0BO2m890BD5gVO4FXzoD+O51TJUfzYA66tNDDJ
	hAInorrdC+r9hqisWOMbW0q9bCaSDrQ=
X-Received: by 2002:a63:6385:: with SMTP id
	x127-v6mr190438pgb.50.1524788823585; 
	Thu, 26 Apr 2018 17:27:03 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:44 -1000
Message-Id: <20180427002651.28356-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 2/9] target/arm: Use new min/max expanders
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fYHcACwUlvdP

The generic expanders replace nearly identical code in the translator.

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

