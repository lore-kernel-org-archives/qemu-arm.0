Received: by 10.28.71.27 with SMTP id u27csp2073749wma;
        Sat, 17 Feb 2018 10:29:17 -0800 (PST)
X-Google-Smtp-Source: AH8x227gsEJx65ZXkIlY8oeFXrvc+WRiBAi1hLjZENBPdAbxPwCr2fAw8qKRcZd8CncbYR8tUwBq
X-Received: by 10.37.75.65 with SMTP id y62mr961330yba.90.1518892157906;
        Sat, 17 Feb 2018 10:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892157; cv=none;
        d=google.com; s=arc-20160816;
        b=FhsCe+d72rrl+ojJIo0VzIIQa88Ph0NVJki1S+X9zkKK/y1bEGLIsXLPqxEAfmnNJq
         E5wmdP6885maL5iv/d5IMSe90tIHl7i6tnXRemHc50ByT3+eQ8OX3Rn53N7MHerTWiVC
         +3RS8JrPmdR3JRjstSb2elvdZElMrrzU510Gmxtx4cSwyuNJMkazarzQywuyAGZoibO0
         MkqlLGUF9WJkQIjspBOCtQWlY8QviUvhszDKrG0zDxycGogU+5Nied3vPzTU6LAH/luk
         +G8X4kmP697fLI+d1YNkz3wBr3+eH4QxoPoLMj7V78WfuTt0rtFFv0ylMPm1KuhAUkoq
         jX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=p2OJeeH3GeRDZFkskP3/uYl1RujJsL25/T8puntaOkM=;
        b=aDo8QaPVVSfptTOuvUWG82sVo+BsYD0m3picUaHV0vakRdz/hkJtz533wVdm6yO7l0
         te0JE9KFEdaBSROGQirhUBcDkyfXkFpDnS+jBoPY6AGhm7k/3SaqmY5RmMGoEy7mSOe2
         8W7bqL5scYDdYTowu+UszFlBLmqsOxkwx/pVRXggRU0zluMa6JQlhrTC1HsJ9Zpc/8VQ
         +HBHvGLbglghL53AewY+AMq1cytR45SZyFxajB0/bPdwvJ+M+T8g6C8aPKAtt3eiqRTy
         BQc03LV1yldFitaUWmck0WyibyN7VqDvi4BGkeIF6cGec2qpiksU3iutl9Xk67EmDQdK
         kp0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZTtPAfCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si3338911ybj.768.2018.02.17.10.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZTtPAfCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Eb-0005Bq-8a
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:29:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79P-0000WV-Aq
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79O-0001eI-3h
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:55 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:41326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79N-0001dy-Uf
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:54 -0500
Received: by mail-pl0-x242.google.com with SMTP id k8so3438285pli.8
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p2OJeeH3GeRDZFkskP3/uYl1RujJsL25/T8puntaOkM=;
	b=ZTtPAfCmp4AENayfBA1q3SlbKh7Qlc+yadSVWnyaqj3P2yqCTtBS+Xh5SduMTIlvgs
	fmU8vd3dH/idKnbBAPdQVwV43wAICu+no7J+z+Wa37RajwsatY8KFafyIFg+tYWabHQk
	X4iHsfoRGQvsjyqrMLmD9KM/0COyQvuN16/m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p2OJeeH3GeRDZFkskP3/uYl1RujJsL25/T8puntaOkM=;
	b=XzfCaBem2Jju4nzizCjYBYHd78IN0xdR3MLVJx+3XRdv4kSuFz2Cybf4tOxEI81Zd7
	VrAM3/I23SuNd8JNZwwVzoYGh+8Z8F+p8V1zQlCglzks3kVfe2SQuPrX6No466IkmqWq
	tS0FenzeXd6k56wtTgysZtcpCn+r2qpb/UP9VFZLWQP2O6ahPbmSv8w35Ik4td7bfNoD
	CpyHZbzcelZO765zIXBCJ20+8HmXHu91DhsxoQcnjAl7pD+DhtoLbi4ixbeaCwiFo6wH
	hTn5f/cbecPf86UO4mSr4y5cfa+KuGj8nvYQ/ihkIwuUT2rE6uxnvcYj7zZKUqXAfauk
	EwfQ==
X-Gm-Message-State: APf1xPBOufI7KroLcz9BZvHc3jF3hFrXvGJuSnBUb0o8kY32JCCc160t
	3weVLQ3Kvi7nV1+l7xWbAUjOlw==
X-Received: by 2002:a17:902:9686:: with SMTP id
	n6-v6mr9302113plp.333.1518891833069; 
	Sat, 17 Feb 2018 10:23:53 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:32 -0800
Message-Id: <20180217182323.25885-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 16/67] target/arm: Implement SVE Integer
 Arithmetic - Unpredicated Group
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
X-TUID: Z/wASdTUVu1y

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 41 ++++++++++++++++++++++++++++++++++++++---
 target/arm/sve.decode      | 13 +++++++++++++
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b956d87636..8baec6c674 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -235,6 +235,40 @@ static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
     do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
 
+/*
+ *** SVE Integer Arithmetic - Unpredicated Group
+ */
+
+static void trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_add, a->esz, a->rd, a->rn, a->rm);
+}
+
+static void trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_sub, a->esz, a->rd, a->rn, a->rm);
+}
+
+static void trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_ssadd, a->esz, a->rd, a->rn, a->rm);
+}
+
+static void trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_sssub, a->esz, a->rd, a->rn, a->rm);
+}
+
+static void trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_usadd, a->esz, a->rd, a->rn, a->rm);
+}
+
+static void trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_ussub, a->esz, a->rd, a->rn, a->rm);
+}
+
 /*
  *** SVE Integer Arithmetic - Binary Predicated Group
  */
@@ -254,7 +288,8 @@ static void do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
 }
 
 #define DO_ZPZZ(NAME, name) \
-void trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn) \
+static void trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
 {                                                                         \
     static gen_helper_gvec_4 * const fns[4] = {                           \
         gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
@@ -286,7 +321,7 @@ DO_ZPZZ(ASR, asr)
 DO_ZPZZ(LSR, lsr)
 DO_ZPZZ(LSL, lsl)
 
-void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+static void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
@@ -294,7 +329,7 @@ void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
     do_zpzz_ool(s, a, fns[a->esz]);
 }
 
-void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+static void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 68a1823b72..b40d7dc9a2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -68,6 +68,9 @@
 # Three prediate operand, with governing predicate, flag setting
 @pd_pg_pn_pm_s	........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4	&rprr_s
 
+# Three operand, vector element size
+@rd_rn_rm	........ esz:2 . rm:5  ... ...  rn:5 rd:5	&rrr_esz
+
 # Two register operand, with governing predicate, vector element size
 @rdn_pg_rm	........ esz:2 ... ... ... pg:3 rm:5 rd:5 \
 		&rprr_esz rn=%reg_movprfx
@@ -205,6 +208,16 @@ MLS		00000100 .. 0 ..... 011 ... ..... .....   @rda_pg_rn_rm
 MLA		00000100 .. 0 ..... 110 ... ..... .....   @rdn_pg_ra_rm # MAD
 MLS		00000100 .. 0 ..... 111 ... ..... .....   @rdn_pg_ra_rm # MSB
 
+### SVE Integer Arithmetic - Unpredicated Group
+
+# SVE integer add/subtract vectors (unpredicated)
+ADD_zzz		00000100 .. 1 ..... 000 000 ..... .....		@rd_rn_rm
+SUB_zzz		00000100 .. 1 ..... 000 001 ..... .....		@rd_rn_rm
+SQADD_zzz	00000100 .. 1 ..... 000 100 ..... .....		@rd_rn_rm
+UQADD_zzz	00000100 .. 1 ..... 000 101 ..... .....		@rd_rn_rm
+SQSUB_zzz	00000100 .. 1 ..... 000 110 ..... .....		@rd_rn_rm
+UQSUB_zzz	00000100 .. 1 ..... 000 111 ..... .....		@rd_rn_rm
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

