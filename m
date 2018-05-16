Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp203141wme;
        Wed, 16 May 2018 15:33:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrW07n09rjNPf3M68HROHLzvQbBkK5AnFyCjsem8CpNmNMvyEiUT3KKRzVDPXdQff8Yf1cs
X-Received: by 2002:a37:1f9c:: with SMTP id n28-v6mr2900728qkh.379.1526510025271;
        Wed, 16 May 2018 15:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510025; cv=none;
        d=google.com; s=arc-20160816;
        b=glJ3LEwJ5FG74fg+M8g6fR1twyIDzSuhj/EyiGvWz5DaL+HKZ38hPKdXSRx9Y87HXv
         b2a1XP/7WM8RWLLT8b8HyKx8mGMJsLPdZtVPKZB6gfbnpo6lE2gHUyzyvR1gjmU/cch3
         UelY3UlZF7FFafpoKyLtRSZja2lY2vvx6ar2i8n54Cu4d1L8IaYkzCD2RpX4ulGFR++Y
         RD69BnxANj0DH88Mzwzf6pdALNYOFPRyYf8iXNtI9ydUgB8yULKhr91+3GFOhK7x/pA4
         a9F2T/z1q13gdla7sN6JMN5bm7NE3p41Aco+RWEilsqvekKUd7/g8XaCGKKvwxJoG89L
         CwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6FkDAGxpjtctRPD74Kvsj7pbO4IsIUxfkCQDo+Nmo7Q=;
        b=JvtzguBKODKll/j+mU1INkOjSMK77sYgj0JLtNkvUB2yTwEcv9vmxXJojayvqze45r
         9RBLAOo2NwVsSMKDrfC+7qgHbHzVTffuh3TAnnQnURVTOwP0cS2XnK/nHfeAf1c4wjz0
         g0lPwPxHBoZHz2mePtfnjsXGbQCS54huWxgv77/t+fxxx+VDJQ/I1aB77Ru0/xkkWyLo
         2EdLT4FQDzo4TgvkSWWVHKFK5qSv0byFd+WCihXfT4pB07ldBfYc4ILLDxejX2zULejm
         0Q6i7I1sQd9ggldhyH3VDt3ILfeAXdVxa/1vAwRztdlS3iQ0etARUtm1lZhdvjB6EcD3
         dlEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EHdeLlsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m52-v6si3652310qvh.164.2018.05.16.15.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EHdeLlsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ4zQ-0001VI-P4
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w4-0007RQ-Ji
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w3-0007K8-FA
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:16 -0400
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:46653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4w3-0007JV-9v
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:15 -0400
Received: by mail-pl0-x236.google.com with SMTP id 30-v6so1235655pld.13
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6FkDAGxpjtctRPD74Kvsj7pbO4IsIUxfkCQDo+Nmo7Q=;
	b=EHdeLlsd8AY3TQ0HLEU47faoNa6YDQzmrrI8zSz3SRNbbpz7Zdd5F4Y4qG7jTsvDFf
	llJ4sdtdZw0/KHKl1Ij6/l6+ZdHixWOfhKha4gbQDV/fCIdFCmhnwy8cx7JsasgEgqXU
	JBzTzIADCwHnpUnmmArQ83wd4aq17CYSmbMlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6FkDAGxpjtctRPD74Kvsj7pbO4IsIUxfkCQDo+Nmo7Q=;
	b=MpQo6TeAOOpbAW5h60kHFw/s3fBNaB7GnvWaRkCZJWh7Lx1p5hZqKi9KJ1XLXFY7TB
	33e9oRbPly3K+vsuIMxyvfJsLsIpsWjtr3eX5XXejhF2jfyQDA/x/IQMy/2+oNcBW8Mc
	HGXR3V4MWgUhUFIW6FG8IQDZKnbhQuADAF+LaJ6NF2cz4M7AraL1IfP7YnUKBmnwcOMd
	keKpWlRmITYEHOP97XxOtgpRwQ6aoZqVERQjjLpFodSDB9gqHHgwOZU8UFDgpivE321c
	s5OGnmFN9HXsgrXgx1fR1xUnX6AjWQXmJPQn3OM7TVUJhda2uexrmBuQvC2NNMoZKSsR
	JUfw==
X-Gm-Message-State: ALKqPwcRc/PFJiVjXfAckLM99I0tvdos7DmDEiO17JtU59ILitEzYBgV
	gq0L4DxVFo6KHX1Y2xRdByHvKQ==
X-Received: by 2002:a17:902:22a:: with SMTP id
	39-v6mr2715823plc.146.1526509814365; 
	Wed, 16 May 2018 15:30:14 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:43 -0700
Message-Id: <20180516223007.10256-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: [Qemu-arm] [PATCH v3-a 03/27] target/arm: Implement SVE Bitwise
 Logical - Unpredicated Group
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
X-TUID: hCE4LkxUaAyv

These were the instructions that were stubbed out when
introducing the decode skeleton.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v3: Remove typedefs now present in translate-a64.h.
---
 target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d323bd0b67..67d6db313e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -42,22 +42,61 @@
  * Implement all of the translator functions referenced by the decoder.
  */
 
-static bool trans_AND_zzz(DisasContext *s, arg_AND_zzz *a, uint32_t insn)
+/* Invoke a vector expander on two Zregs.  */
+static bool do_vector2_z(DisasContext *s, GVecGen2Fn *gvec_fn,
+                         int esz, int rd, int rn)
 {
-    return false;
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn), vsz, vsz);
+    }
+    return true;
 }
 
-static bool trans_ORR_zzz(DisasContext *s, arg_ORR_zzz *a, uint32_t insn)
+/* Invoke a vector expander on three Zregs.  */
+static bool do_vector3_z(DisasContext *s, GVecGen3Fn *gvec_fn,
+                         int esz, int rd, int rn, int rm)
 {
-    return false;
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn),
+                vec_full_reg_offset(s, rm), vsz, vsz);
+    }
+    return true;
 }
 
-static bool trans_EOR_zzz(DisasContext *s, arg_EOR_zzz *a, uint32_t insn)
+/* Invoke a vector move on two Zregs.  */
+static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
-    return false;
+    return do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
 }
 
-static bool trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
+/*
+ *** SVE Logical - Unpredicated Group
+ */
+
+static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
 {
-    return false;
+    return do_vector3_z(s, tcg_gen_gvec_and, 0, a->rd, a->rn, a->rm);
+}
+
+static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    if (a->rn == a->rm) { /* MOV */
+        return do_mov_z(s, a->rd, a->rn);
+    } else {
+        return do_vector3_z(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
+    }
+}
+
+static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_xor, 0, a->rd, a->rn, a->rm);
+}
+
+static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
-- 
2.17.0

