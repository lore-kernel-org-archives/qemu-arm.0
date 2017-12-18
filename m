Received: by 10.223.159.74 with SMTP id f10csp2953560wrg;
        Mon, 18 Dec 2017 10:04:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBovWXPY/MjIjPvm+n0NxWeeudHU/EWQh143TjeC5/jGlP8yUBdCGpE1Kz6jmteo5PWfY5BXo
X-Received: by 10.129.161.206 with SMTP id y197mr453735ywg.483.1513620283527;
        Mon, 18 Dec 2017 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620283; cv=none;
        d=google.com; s=arc-20160816;
        b=rlYS/uNNFRlBRYt4mx/G4/U+XYHKclzupagdIEc8wriRnk1SQYBGmZlk1lK7Lm0toX
         /nkM087TWmitMbeGYwqN3Q0NR4wuPWuHgu/kOY66ltY/wHpYaVJYS5yP2IB9hY9Nhz4N
         3mLRBJjxiazKR/raVACNFUBJZWg6rE4lMhDvIxYnsEsqsSzYi3xnJLaB9ITNxYBSI8tF
         jnaRbR4oT8hqLvoACGvhv5joGiO7WiknOJVZ+rUU+Vz76q5A/vezik8QOefyc7mrWBs3
         xspU8gLHV3NauWk4V8KUznd7+7rZiHYISXDjhWuZpfm2SbnrPmVUUG8DhUi2iql+6yam
         6BaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gQ2kkF9An4v3zz2RnIXaDTstLgGEHB4P1MCQCEXfaFM=;
        b=yZMWw7Ew9AYJ6XTw7b7zvJ7ZSIiZupudKSd7rDUiK3I92LX2R75JrCcL5fln3IsnWG
         DTFObpg/SkMBW6oonlYCdhvHx64Pwnz3Zf80TkLFA1Dtvh3dDkJLV2TsvPG5LB0NZmim
         UZ+FO05/U1U3iP46izK3irOIYIx6jAsWwRa1wr6QzET8NEFLW2Up9XKMvj0VZOCUW2EF
         JOXwLpj0JpFecK0+VP48/RtuqH+hWZ2vacSfKKt4XsgJ7sVZhvldKUK/pT1GIvGebiEH
         ZAmQJJ58mG6bFsmcQI1reZ6gIyHwZGoOGmY54olERXRmdL73wsTCQUGKwkaFMHJS9saC
         2leA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WYuwpBbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si2517434ywd.216.2017.12.18.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WYuwpBbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzmN-0008Ve-0m
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:04:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUH-00080i-81
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUG-0001nO-7z
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:01 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:45266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUG-0001ms-3F
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:00 -0500
Received: by mail-pg0-x242.google.com with SMTP id m25so9422090pgv.12
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gQ2kkF9An4v3zz2RnIXaDTstLgGEHB4P1MCQCEXfaFM=;
	b=WYuwpBbxF9PgrWrWhb68ihzzbJKA+no5t1Q183MlePzFyH5atBgsxiJghFo3nANy8X
	1ongYR6mkT0owXaJX5eCPvgfzgUK2K98A9VwqvgZsFXgHWCQirgIzSFSs1t/bHNTgDPU
	cGuwTvPStDCH6W+/Yz+gQxYedPqHRzFowgJNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gQ2kkF9An4v3zz2RnIXaDTstLgGEHB4P1MCQCEXfaFM=;
	b=XzMxDBB/T6maiWiBlF9gWdCnrwRAnLQsD6L8+dQHlxulTmyu7CN9AWK9mb6Wskiytj
	Tc13r/3mHTm7ioU4GCG/giSeXRvYB4bYbO0uKf/3myPCwtgN8cb3a82clodu0z2o0UMS
	3JJZZ9ftTTlO6Yj5/irW1T/RQYeZUIKfQToQNKz0q4xaNNmX2U7lDwXy7GAWJgc+yKEr
	AtcZ2WePQGsclY6vFdHNUw3Hf0ITzBQf+JZyXVXi7B0NaT5tIXemb2KmoZn49ONBd1Bf
	IDw8eDueiI8ouoEc0hKjVX2uBBJP2wBqAkvJrX8RhSGHgVag5m4SbW85lhM58+d1iqNw
	8vtg==
X-Gm-Message-State: AKGB3mIMj4C4FtxsyKg0/UoY6ywsiQS1J7ar3qU1k7zBeHkECF6WbvxS
	As2CfVcfyHKl8hX9ApXH+oDY3Dw5FBc=
X-Received: by 10.101.101.73 with SMTP id a9mr436893pgw.148.1513619159147;
	Mon, 18 Dec 2017 09:45:59 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:45:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:32 -0800
Message-Id: <20171218174552.18871-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 03/23] target/arm: Implement SVE Bitwise Logical
 - Unpredicated Group
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
X-TUID: 3qx7doNms4TQ

These were the instructions that were stubbed out when
introducing the decode skeleton.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 61 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67ad94e310..43420fa124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -32,6 +32,10 @@
 #include "trace-tcg.h"
 #include "translate-a64.h"
 
+typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
+typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
+
 /*
  * Include the generated decoder.
  */
@@ -42,7 +46,56 @@
  * Implement all of the translator functions referenced by the decoder.
  */
 
-void trans_AND_zzz(DisasContext *s, arg_AND_zzz *a, uint32_t insn) { unsupported_encoding(s, insn); }
-void trans_ORR_zzz(DisasContext *s, arg_ORR_zzz *a, uint32_t insn) { unsupported_encoding(s, insn); }
-void trans_EOR_zzz(DisasContext *s, arg_EOR_zzz *a, uint32_t insn) { unsupported_encoding(s, insn); }
-void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn) { unsupported_encoding(s, insn); }
+static unsigned size_for_gvec(unsigned s)
+{
+    if (s <= 8) {
+        return 8;
+    } else {
+        return QEMU_ALIGN_UP(s, 16);
+    }
+}
+
+static void do_genfn2(DisasContext *s, GVecGen2Fn *gvec_fn,
+                      int esz, int rd, int rn)
+{
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn), vsz, vsz);
+}
+
+static void do_genfn3(DisasContext *s, GVecGen3Fn *gvec_fn,
+                      int esz, int rd, int rn, int rm)
+{
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    gvec_fn(esz, vec_full_reg_offset(s, rd), vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm), vsz, vsz);
+}
+
+static void do_zzz_genfn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
+{
+    do_genfn3(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
+}
+
+void trans_AND_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_and);
+}
+
+void trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    if (a->rn == a->rm) { /* MOV */
+        do_genfn2(s, tcg_gen_gvec_mov, 0, a->rd, a->rn);
+    } else {
+        do_genfn3(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
+    }
+}
+
+void trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_xor);
+}
+
+void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_andc);
+}
-- 
2.14.3

