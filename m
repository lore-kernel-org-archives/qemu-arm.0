Received: by 10.28.71.27 with SMTP id u27csp2077941wma;
        Sat, 17 Feb 2018 10:34:41 -0800 (PST)
X-Google-Smtp-Source: AH8x226Gtb7Fj+C1lCh8VSgYaFRRgMa+0EZ+5lt9QDVw2xYYG7Aa5f9QUmBBT0BG3nyAi1i+2MqS
X-Received: by 10.37.4.8 with SMTP id 8mr5554800ybe.374.1518892481391;
        Sat, 17 Feb 2018 10:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892481; cv=none;
        d=google.com; s=arc-20160816;
        b=csFqiGRP9t9bKaIKLmR2EnjZbxxn3T76C4CeVHFwm+eRpqFJWp79hUgjITa5yPZg82
         g7+FFpfeKsM+T/C/aCsfTgRlez/P1P9BClT+t3N5gOp4ZtheHs4Y7O3QFzyNbWs/NVZp
         oRCI3Z/2BdkHm9GwJwWeQw650r0BzMSQHtBY3Bz4JVWh7p0GzXgzCLv4iAek4vASg4xs
         5W+Udgrc7XxaPbEZUR8sJ+4b4EhvdyLESVmaJwAosy34UhJzoqzmz5XTjCKDHtQEj5Fp
         HM5OgdzJ0J5s1b+IF16tBtKlpVFjfUDC9sujacfyZpEDdqF/td2Yg0l37+oDPZUW/8di
         xtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=N6hScQO8CYQW5lL3+OTxL793OiswiFsgIP5knStdv5c=;
        b=D94XbEAf1gbv7mWXwK4sn3ACNSitTFkM00//Ki5XDVRFTBaTHNdayshglVTWzqglQF
         FuF7GxsHyGhDj8wDQkoC7tcoTaQHyKTOkDQmR9mQCerYZiDa80gzJTXQX2nbB/RVSNeY
         rC/q/7KZbg5ibmAcjp5cZ9HhgGbrR7QOdgH/E+bSsHEzEAidZw8yasUDmi0I5zWN/PTg
         ZP9HX21rFWqWTT5knFXcpE8ymPZEEKklHPWBjY78tIHMoBnQVDMf2IgliOCKAdFwrIVM
         O0WB69e9E054mMfy0vJu5pmCIZf+RUAJj4YvD3fvlK+1v1k/ZW7d7ieypq63zQ7tbOwG
         bPaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z72Knqlm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si187726ywc.265.2018.02.17.10.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:34:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z72Knqlm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Jo-0000nA-PL
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:34:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79J-0000Md-95
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79H-0001b3-Ml
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:49 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:38908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79H-0001aa-D6
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:47 -0500
Received: by mail-pg0-x241.google.com with SMTP id l24so4354289pgc.5
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N6hScQO8CYQW5lL3+OTxL793OiswiFsgIP5knStdv5c=;
	b=Z72KnqlmkK04i3s+2LKMdFK5K1M7AS0Uy7FLLhpQbj+KHoCifDEa/+DnE1upLewDbI
	nN1MMrPABDZa+r2loyAOKivhVtO1zO33LOcU5yrQsKOK/b0hHOGVTe9N2UQjKjXCJKiJ
	YihBRcUdY9NYdWR8nzod38OhfT40GqMoRtz/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N6hScQO8CYQW5lL3+OTxL793OiswiFsgIP5knStdv5c=;
	b=CFSMw8zYO2XIvcVWpUSeudkhQtiEvDTnWuuI3w2LnmDgDW1GhC9TKxColeIjtuiJuX
	BH5Hhycj/5ZapvzTE4dYPg4QFF2LjpxUovZfw83c88zfODayn/M4mqC2J/xYIsjuv/jL
	Y0GJelsNNSCgr3UfT2OvsVBaodxWiNxc+ONQHYFkWwCbSDEhz40BYwkOX/9npOInnmMc
	8qWxFnXL6pq8MWhoYOoTAwM4kPgNBnhw4y0fGrmJOhk5gHlcGd43rkBTtHBk9TQbpjMj
	6x0As1k60LHBl5z+IwXPa26+O+IuqanIx+60FwTStHO7V2xTJBjZAu+tchcPhxu5dYHE
	gxjA==
X-Gm-Message-State: APf1xPDGEq4HdZ4wk0SSNII6ZVxcsQ6hidxRKNd7P7es/W+keXd4OOL6
	423/vDI6UklIH1euylp0aFbie8JoKRY=
X-Received: by 10.98.27.78 with SMTP id b75mr9797472pfb.146.1518891826128;
	Sat, 17 Feb 2018 10:23:46 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:28 -0800
Message-Id: <20180217182323.25885-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v2 12/67] target/arm: Implement SVE bitwise
 shift by vector (predicated)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mceM4QGHaekx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 27 +++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sve.c |  4 ++++
 target/arm/sve.decode      |  8 ++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b3c89579af..0cc02ee59e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -168,6 +168,33 @@ DEF_HELPER_FLAGS_5(sve_udiv_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_udiv_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_orv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b1a170fd70..6ea806d12b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -439,6 +439,28 @@ DO_ZPZZ_D(sve_sdiv_zpzz_d, int64_t, DO_DIV)
 DO_ZPZZ(sve_udiv_zpzz_s, uint32_t, H1_4, DO_DIV)
 DO_ZPZZ_D(sve_udiv_zpzz_d, uint64_t, DO_DIV)
 
+/* Note that all bits of the shift are significant
+   and not modulo the element size.  */
+#define DO_ASR(N, M)  (N >> MIN(M, sizeof(N) * 8 - 1))
+#define DO_LSR(N, M)  (M < sizeof(N) * 8 ? N >> M : 0)
+#define DO_LSL(N, M)  (M < sizeof(N) * 8 ? N << M : 0)
+
+DO_ZPZZ(sve_asr_zpzz_b, int8_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_b, uint8_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_b, uint8_t, H1_4, DO_LSL)
+
+DO_ZPZZ(sve_asr_zpzz_h, int16_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_h, uint16_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_h, uint16_t, H1_4, DO_LSL)
+
+DO_ZPZZ(sve_asr_zpzz_s, int32_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_s, uint32_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_s, uint32_t, H1_4, DO_LSL)
+
+DO_ZPZZ_D(sve_asr_zpzz_d, int64_t, DO_ASR)
+DO_ZPZZ_D(sve_lsr_zpzz_d, uint64_t, DO_LSR)
+DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -543,6 +565,9 @@ DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
 #undef DO_ABD
 #undef DO_MUL
 #undef DO_DIV
+#undef DO_ASR
+#undef DO_LSR
+#undef DO_LSL
 
 /* Similar to the ARM LastActiveElement pseudocode function, except the
    result is multiplied by the element size.  This includes the not found
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4218300960..08c56e55a0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -282,6 +282,10 @@ DO_ZPZZ(MUL, mul)
 DO_ZPZZ(SMULH, smulh)
 DO_ZPZZ(UMULH, umulh)
 
+DO_ZPZZ(ASR, asr)
+DO_ZPZZ(LSR, lsr)
+DO_ZPZZ(LSL, lsl)
+
 void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     static gen_helper_gvec_4 * const fns[4] = {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c265ff9899..7ddff8e6bb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -151,6 +151,14 @@ LSL_zpzi	00000100 .. 000 011 100 ... .. ... ..... \
 ASRD		00000100 .. 000 100 100 ... .. ... ..... \
 		@rdn_pg_tszimm imm=%tszimm_shr
 
+# SVE bitwise shift by vector (predicated)
+ASR_zpzz	00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
+LSR_zpzz	00000100 .. 010 001 100 ... ..... .....   @rdn_pg_rm
+LSL_zpzz	00000100 .. 010 011 100 ... ..... .....   @rdn_pg_rm
+ASR_zpzz	00000100 .. 010 100 100 ... ..... .....   @rdm_pg_rn # ASRR
+LSR_zpzz	00000100 .. 010 101 100 ... ..... .....   @rdm_pg_rn # LSRR
+LSL_zpzz	00000100 .. 010 111 100 ... ..... .....   @rdm_pg_rn # LSLR
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

