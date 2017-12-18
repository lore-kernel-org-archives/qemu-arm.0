Received: by 10.223.159.74 with SMTP id f10csp2978227wrg;
        Mon, 18 Dec 2017 10:29:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBovShRZ0LtvMg4ApGiLsBGGyodDTOHHmG4//5Vrbqp2JH/GWzTPJUDAegAxQP2o62c6NL0qd
X-Received: by 10.129.1.212 with SMTP id 203mr563499ywb.304.1513621799765;
        Mon, 18 Dec 2017 10:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513621799; cv=none;
        d=google.com; s=arc-20160816;
        b=aN3s6J27o8OQWpx6/tZ97JsX4RTq1xlFQcp7R825XNV2xoU8N47w1zM32+21gXMqkl
         KNcEZiTKP6S1ve09Uv16WLnI7/gOhd2bSdq04OcfFbJq9bQVMO5/ce7hmXLVfxciO7L5
         FEzuw2R5Gkw/y0Pn9SJvUF5TDN2tGOs3NLWoOtOampGkOnyn8W7aECMuUhON2uhW1Bgr
         tPA8NIk671QX2RAhCThWv87Jnk+oK0miNSmo0VZiQLk5GGRexZKuYpLOpPuj2u13fWBe
         TN2Kqv9gtEJs3CurIiIYBZbHtzro2lH4ogqSng+KU83+yc7VM3snb4q9PjHEXQWI/f9n
         23sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ig4kdYIw6qOuzDY1F9Ia70Qay4cvLKadEMa5FjRQcZw=;
        b=eF4nXS72HRarvEJGZRXQssC8mpdHbwCj6ff2bS5giR4OOsvHUmxnopjXZCMRNVjxUw
         wutKu8ghcSijpLpyqj0JUiV7Kq8gEDERr6iyoamAQi4gMpSvI8vwtxB8Tu9eDlbVBEbW
         bnwQ152TcRwnYsZZ+XIq99YQzWlwt80fq3UYp3xTgVfxsQ249yMpHnL6LD30FC+5j+VU
         3CXFLNZsFgTrPwOGvpvUEYmlxNHNqQD2Pk2e7bdFTf7wWLSAUrDZjpt9dX6UnA809fk0
         oLsjXwo4VbbH4IlBNpnwZ9QDXTQsoYsVtkjYuECGJh1yVyw7ql0quc1jwjkw4ooE1NR3
         hsjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OpChPybH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185si960633ybe.780.2017.12.18.10.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:29:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OpChPybH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0Ap-00052f-5l
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:29:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUV-0008G2-MM
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUU-00026H-MD
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:15 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUU-00025p-F7
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:14 -0500
Received: by mail-pg0-x243.google.com with SMTP id j9so9427303pgc.11
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ig4kdYIw6qOuzDY1F9Ia70Qay4cvLKadEMa5FjRQcZw=;
	b=OpChPybH9SFEICQQfVL9N3G4TLi3b2VGHHvT8BiGSOCn5mHV+TzpvgV6FWliEgdb8I
	hZjpPGNx/KXAPG+iNBuah9F+iZTxu0dn/ZoBI6Gl3YCvbmZul2IYiCTREGRRxZj1z9WB
	9+Ad7hbWsZt0JqLKZTC9NwsTA2ec3eaigdIUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ig4kdYIw6qOuzDY1F9Ia70Qay4cvLKadEMa5FjRQcZw=;
	b=aMOAGPY+dN8Btajis8z7zRBoef02DrumbzGDXd6tXcvWjj/0hLfi3/FCNNOyLIkcH8
	k3ee6iCvaVnUxhb2FFdmVxAoC5WfCZE6pN5HmPOy0L6I2+b2UhP5i2TSjSpLGDjR6q5Z
	EibHMbjiIdXKp1X291TmSvOrYbnOHcHHrqfdU+8oGMEWABGNcYnYpKzxy+CVSYZ1qgHc
	k7wHLwqgBjpN5DfW6ZYC2ZErdeQF66JcLzbB4/EAG5gM3tmgBU3jJAOYYEO1RnKnDUgn
	CysFA4vcIC3ipxhmQvmQbd3xNRjg8/RRET09itPOqIxyh3dgHutGhJMpuuvFOqhtkSRd
	hqPw==
X-Gm-Message-State: AKGB3mIz6v3LOdLcr1gUEbsNOpOWrb5/iPDkVfCAzxkpviA4QSvY6SLT
	kSWWRgYruyXYLT27+at16b1xcA==
X-Received: by 10.98.56.69 with SMTP id f66mr498722pfa.38.1513619173513;
	Mon, 18 Dec 2017 09:46:13 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:41 -0800
Message-Id: <20171218174552.18871-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 12/23] target/arm: Implement SVE bitwise shift by
 vector (predicated)
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
X-TUID: lwp+PgOeE3ue

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 27 +++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sve.c |  4 ++++
 target/arm/sve.def         |  8 ++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2b265e9892..61b1287269 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -162,6 +162,33 @@ DEF_HELPER_FLAGS_5(sve_udiv_zpzz_s, TCG_CALL_NO_RWG,
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
index 9146e35e5b..20f1e60fda 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -492,6 +492,28 @@ DO_ZPZZ_D(sve_umulh_zpzz_d, uint64_t, do_umulh_d)
 DO_ZPZZ_D(sve_sdiv_zpzz_d, int64_t, DO_DIV)
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
 
@@ -595,6 +617,9 @@ DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
 #undef DO_ABD
 #undef DO_MUL
 #undef DO_DIV
+#undef DO_ASR
+#undef DO_LSR
+#undef DO_LSL
 
 /* Three-operand expander, immediate operand, controlled by a predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 08388c0a07..685a3ba249 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -190,6 +190,10 @@ DO_ZPZZ(MUL, mul)
 DO_ZPZZ(SMULH, smulh)
 DO_ZPZZ(UMULH, umulh)
 
+DO_ZPZZ(ASR, asr)
+DO_ZPZZ(LSR, lsr)
+DO_ZPZZ(LSL, lsl)
+
 void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     gen_helper_gvec_4 *fn;
diff --git a/target/arm/sve.def b/target/arm/sve.def
index f1d2801b94..9f9c0803a0 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -133,6 +133,14 @@ LSR_zpzi		00000100 .. 000 001 100 ... .. ... .....	@rdn_pg_tszimm imm=%tszimm_sh
 LSL_zpzi		00000100 .. 000 011 100 ... .. ... .....	@rdn_pg_tszimm imm=%tszimm_shr
 ASRD			00000100 .. 000 100 100 ... .. ... .....	@rdn_pg_tszimm imm=%tszimm_shr
 
+# SVE bitwise shift by vector (predicated)
+ASR_zpzz		00000100 .. 010 000 100 ... ..... .....		@rdn_pg_rm_esz
+LSR_zpzz		00000100 .. 010 001 100 ... ..... .....		@rdn_pg_rm_esz
+LSL_zpzz		00000100 .. 010 011 100 ... ..... .....		@rdn_pg_rm_esz
+ASR_zpzz		00000100 .. 010 100 100 ... ..... .....		@rdm_pg_rn_esz # ASRR
+LSR_zpzz		00000100 .. 010 101 100 ... ..... .....		@rdm_pg_rn_esz # LSRR
+LSL_zpzz		00000100 .. 010 111 100 ... ..... .....		@rdm_pg_rn_esz # LSLR
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

