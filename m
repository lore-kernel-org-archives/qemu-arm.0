Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp697811wru;
        Wed, 1 Aug 2018 05:31:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9eNuYbWP7tQH39WWaaGGwfUYimAJDXcUzUpBe4J2SbM3XNFI30HwF2m0eX7xDX6YT0OEb
X-Received: by 2002:ac8:1881:: with SMTP id s1-v6mr23861796qtj.401.1533126703433;
        Wed, 01 Aug 2018 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533126703; cv=none;
        d=google.com; s=arc-20160816;
        b=szDEqdOkcEhJl6NQ9fdbBbzWJ/i6e7+CiHk2BmUtZj8XxlodQB4NJMaUfFxIFVZm6H
         KG3dx070Hz9XTx7noDFDM9pY6hL1HE4f2dEQbLEXJ0C0lmMVGap6Fg+4XfKpMDka+hhQ
         jmiuUHIXQcrMFpeIS+cQ6zturtYss9ZTJ8PLf5AZcUQeKUlKYU/E/FnjYoWDzPCNwmV5
         DiW/ACatcVSywf2d1QlwYNnzNVJzIIZ5Cs5LdBQBAW+weHX8Nr2OD91SfdF49UkP7SpV
         Zc1qGaqyNDaoiUKNp6VZRgffmVuF3p60kRuAJhXeqPTTtlHrp0D1G0PGKQjanFO66A61
         4qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gaII0zNOehxL/uVYcqOMRBb0l0zQg1hJOdueMjvS+cs=;
        b=wYJ276qpXhdezRzSPcY2BQ5i3aYptJuoUw66vppVkXmeBIbBQln5JhsYPWC8JKEN2H
         nHCiUpNauVwXDjlI6rblufpGmZi9ZdEspup8Wyh2Whg351mwQwj+9ZGxbEJUBFnnQWGX
         OBpJjg33JWPkCx0yRr1RhWUDX9CSZMJni8YGxIkWk4WgiSajgo9lTq8LPjVwBDNNGn9P
         KsYgy1earCr5vdZgBswbD4mz02eJAoSlOuaftsYX4bnJSqnhquJpVdyzXIPqzh1bUKN9
         c7LvfUSUDxgnEkFKelsd3kwnL+nP5BKtLECzi6HJVYASGKdvyox/ogJreyAG8BukiBjL
         3SFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QWQSGj2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8-v6si11288360qtn.387.2018.08.01.05.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 05:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QWQSGj2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkqI2-0005r5-Rz
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 08:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHk-0005oD-Ue
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHj-0004Ug-L6
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:24 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:43058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkqHj-0004UK-Ef
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:23 -0400
Received: by mail-ua0-x242.google.com with SMTP id x24-v6so12529538ual.10
	for <qemu-arm@nongnu.org>; Wed, 01 Aug 2018 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gaII0zNOehxL/uVYcqOMRBb0l0zQg1hJOdueMjvS+cs=;
	b=QWQSGj2DmKBGSsWJOjHYpfCzs08Y543d94SZCbKennPay4LW3IuguFP9xv24i5sdlV
	mXo4lfsAeXxyO6hk8AS2yVL4YwXTwceBO0FC1ExoBB7Wp14ydfNVGCgr/kIi1Y/nmIg+
	eRLHzk6tp3AL0uDPOQ45OaV/xP8AIxo7saq50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gaII0zNOehxL/uVYcqOMRBb0l0zQg1hJOdueMjvS+cs=;
	b=KHezcW2hI3vN6PrvSaaDcvzdSp2vccB3v8nfRnmloKLc+JAe9V7Yby5ta9tMJT01dd
	ZFaOfufIZQB8Ogy1+7x1nfzcT3sFIxqclLEZeCHv3fsTk+TQTryyICTAiEPdmnE4BsCi
	0rOQE9kaOwAOEc0UPqsZBPLku2sgv+pyadFRMT1BJqS/61RIillScTJt/F1dRlPaxx6n
	PXc2aecX1iEmO8aZAVCYNNQ9NdBQzh4z91dXns8DEKCv/Gmuj+js/1KMjnWcfpw80VNt
	kJKVghBmZ+GwO5HhBFn3vvHZTWbAIHSiqPHFnZxO7xPBDoKrrs8i7zqzKWbqrsy0kiPJ
	CxWQ==
X-Gm-Message-State: AOUpUlFSBvJDihczFXJ2b4IYk7twTamW0GqFaVGdxWF7NuVDVwpFeGRC
	h4UfTJven7s1LDcv7j5yXpQz6A==
X-Received: by 2002:ab0:6a6:: with SMTP id
	g35-v6mr18381341uag.16.1533126682855; 
	Wed, 01 Aug 2018 05:31:22 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	f60-v6sm4247847uaf.10.2018.08.01.05.31.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 05:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2018 08:31:10 -0400
Message-Id: <20180801123111.3595-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: [Qemu-arm] [PATCH 3/4] target/arm: Reorganize SVE WHILE
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATpPK83drr1P

The pseudocode for this operation is an increment + compare loop,
so comparing <= the maximum integer produces an all-true predicate.

Rather than bound in both the inline code and the helper, pass the
helper the number of predicate bits to set instead of the number
of predicate elements to set.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    |  5 ----
 target/arm/translate-sve.c | 49 +++++++++++++++++++++++++-------------
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9bd0694d55..87594a8adb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2846,11 +2846,6 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
         return flags;
     }
 
-    /* Scale from predicate element count to bits.  */
-    count <<= esz;
-    /* Bound to the bits in the predicate.  */
-    count = MIN(count, oprsz * 8);
-
     /* Set all of the requested bits.  */
     for (i = 0; i < count / 64; ++i) {
         d->p[i] = esz_mask;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9dd4c38bab..89efc80ee7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3173,19 +3173,19 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a, uint32_t insn)
 
 static bool trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
 {
-    if (!sve_access_check(s)) {
-        return true;
-    }
-
-    TCGv_i64 op0 = read_cpu_reg(s, a->rn, 1);
-    TCGv_i64 op1 = read_cpu_reg(s, a->rm, 1);
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2, t3;
     TCGv_ptr ptr;
     unsigned desc, vsz = vec_full_reg_size(s);
     TCGCond cond;
 
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
     if (!a->sf) {
         if (a->u) {
             tcg_gen_ext32u_i64(op0, op0);
@@ -3198,32 +3198,47 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
 
     /* For the helper, compress the different conditions into a computation
      * of how many iterations for which the condition is true.
-     *
-     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
-     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
-     * aren't that large, so any value >= predicate size is sufficient.
      */
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
     tcg_gen_sub_i64(t0, op1, op0);
 
-    /* t0 = MIN(op1 - op0, vsz).  */
-    tcg_gen_movi_i64(t1, vsz);
-    tcg_gen_umin_i64(t0, t0, t1);
+    tmax = tcg_const_i64(vsz >> a->esz);
     if (a->eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
+
+        /* If op1 is max (un)signed integer (and the only time the addition
+         * above could overflow), then we produce an all-true predicate by
+         * setting the count to the vector length.  This is because the
+         * pseudocode is described as an increment + compare loop, and the
+         * max integer would always compare true.
+         */
+        tcg_gen_movi_i64(t1, (a->sf
+                              ? (a->u ? UINT64_MAX : INT64_MAX)
+                              : (a->u ? UINT32_MAX : INT32_MAX)));
+        tcg_gen_movcond_i64(TCG_COND_EQ, t0, op1, t1, tmax, t0);
     }
 
-    /* t0 = (condition true ? t0 : 0).  */
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(t0, t0, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Set the count to zero if the condition is false.  */
     cond = (a->u
             ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
             : (a->eq ? TCG_COND_LE : TCG_COND_LT));
     tcg_gen_movi_i64(t1, 0);
     tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
+    tcg_temp_free_i64(t1);
 
+    /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, t0);
     tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
+
+    /* Scale elements to bits.  */
+    tcg_gen_shli_i32(t2, t2, a->esz);
 
     desc = (vsz / 8) - 2;
     desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
-- 
2.17.1

