Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5782817wrq;
        Tue, 26 Jun 2018 21:55:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfTYtMitkBGF1l0XQMmmFK6hNqdJuks5EhE6GYDyQ9VvGj9u0A71xPrg2t0LzjuEbOxfQeO
X-Received: by 2002:a37:b087:: with SMTP id z129-v6mr3854107qke.347.1530075301518;
        Tue, 26 Jun 2018 21:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075301; cv=none;
        d=google.com; s=arc-20160816;
        b=yoyAMSVGzQFzBRbjOIKQUVctL37tXMWzBcI+fguHfuzqvXEGkv/R2FvNP0UDKK2Hae
         M+nR6UPFARJLjNp3LciG2NFz2L7bJ2zHb9tWtL/zi0ckkiz5CInO8WP5KDKWiFEdEpHa
         Ss4fWXIYdnE7m5eUUrZ7ONH6OCMxtcYwB/SgXCrBgONidgpeqqgEfvuLWUvzw0JwN/l1
         mlwHvQ1egLQSV8+Saw0iF4kWdbI8I4Cfy4TjxNH6lOevkTlQa5FfPa/t4AM5jf4Q0SgE
         mdaaD6fp55WPnHsf4dRTBL9tzLH5qiTYnbIhX2wzrX5ABLpoWRUOIS05t0yPpd9SIh7l
         PMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wmvBZcu08nQNVj+xJr8ERwUWjrrrFWxOlfD78cTaOXQ=;
        b=AoMHtGMlYPLqZcUBorSact6/uPc+1tdvyDizvZYF7UZ8JaSu1c6t+wprz3t7Ue/Yg6
         Ix6fbfpeA937xc8w23mJjI6lEc17maAek56/mzLhj5xVBBL5T21PFQzsZAhU4OCTC3li
         UwqqP3HzzXRr3mjkOM2T5DQIWD0uqI4OGlh7zyH6N3Rrp66vNrhXgra7VLHTVajUBbad
         E6ZefXjQN5GzAH7GE3r/hZ/Kw5CQS8oMJ6iTxTuUij7RCp3Oi4IR8pPEis7mYH4hxNbJ
         dsEUlhDMWdvtjBjVdsW5a4suZDFrgpIRg7rGzmkb/V6LmXANTm82bZP3CJPy3dHYCyoX
         LVQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CdrHTbeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13-v6si1444928qtg.395.2018.06.26.21.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CdrHTbeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Tt-0004nj-1k
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29q-0004fk-E5
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29p-00017K-96
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:18 -0400
Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b]:36343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29p-000166-0x
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:17 -0400
Received: by mail-pg0-x22b.google.com with SMTP id m5-v6so367956pgd.3
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wmvBZcu08nQNVj+xJr8ERwUWjrrrFWxOlfD78cTaOXQ=;
	b=CdrHTbehnXlfkMpSCMvX5mI7eOPVh/Ne1bybOWPinnAwG9qawCjjwQ5Sys1rQ2ngsU
	i60S55DlULd3VQk/frnUKFyTkH7+kDByuVyQJc021x/b2Zj9mHb5c4FO69KTOqbZxJXq
	/Wj/hxAufaJIhavDR3YiXCCaIWPVN6rby7zhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wmvBZcu08nQNVj+xJr8ERwUWjrrrFWxOlfD78cTaOXQ=;
	b=msPM91Mey4Vd2uPgHS0XMfLMIwXJT1azejxSGQNKpj2yLpmXvI8f3SUkbaAVltKLup
	JgaDh0kzZFWyYeetWB1VH7maizOiJ/FraeCSaKTddp3kmvuHQN+0ngKfgs7Xg8r66IVG
	IbYaANAd85iBrkzB3A0WYYa9xrGrhqJpRlS8UYszMU/1dcaXano+yP/OfH8fnJPYNxc1
	Bxkstykt44eqck3AFW9YWGOeRM91M94rjRBwnFqty+Lrc7gvD+4gIjudkFpPN5r0dNoE
	W3V3zeE0DSjW8MAi0B18r7o++4J5FW1V3VygeZiJ1Guc2Y6sbnzRWC3tfnw2RlQjOTA1
	Rx+w==
X-Gm-Message-State: APt69E2k0q0gaI81vjcIYiYvP0gMnfBiye6V4ePZAWT4PDJUWAWIEFtV
	05JSpXH7jY+xFhMlZxyyVDDcXA==
X-Received: by 2002:a63:3c0c:: with SMTP id
	j12-v6mr685319pga.440.1530074056036; 
	Tue, 26 Jun 2018 21:34:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:25 -0700
Message-Id: <20180627043328.11531-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22b
Subject: [Qemu-arm] [PATCH v6 32/35] target/arm: Implement SVE dot product
 (vectors)
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
X-TUID: JfMgJWRV2DRP

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  5 +++
 target/arm/translate-sve.c | 17 ++++++++++
 target/arm/vec_helper.c    | 67 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  3 ++
 4 files changed, 92 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8607077dda..e23ce7ff19 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -583,6 +583,11 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4f2152fb70..8a2bd1f8c5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3423,6 +3423,23 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+static bool trans_DOT_zzz(DisasContext *s, arg_DOT_zzz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[2][2] = {
+        { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
+        { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
+    };
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, 0, fns[a->u][a->sz]);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index db5aeb9f24..c16a30c3b5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -194,6 +194,73 @@ void HELPER(gvec_qrdmlsh_s32)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+/* Integer 8 and 16-bit dot-product.
+ *
+ * Note that for the loops herein, host endianness does not matter
+ * with respect to the ordering of data within the 64-bit lanes.
+ * All elements are treated equally, no matter where they are.
+ */
+
+void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd;
+    int8_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
+              + n[i * 4 + 1] * m[i * 4 + 1]
+              + n[i * 4 + 2] * m[i * 4 + 2]
+              + n[i * 4 + 3] * m[i * 4 + 3];
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd;
+    uint8_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
+              + n[i * 4 + 1] * m[i * 4 + 1]
+              + n[i * 4 + 2] * m[i * 4 + 2]
+              + n[i * 4 + 3] * m[i * 4 + 3];
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd;
+    int16_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] += (int64_t)n[i * 4 + 0] * m[i * 4 + 0]
+              + (int64_t)n[i * 4 + 1] * m[i * 4 + 1]
+              + (int64_t)n[i * 4 + 2] * m[i * 4 + 2]
+              + (int64_t)n[i * 4 + 3] * m[i * 4 + 3];
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd;
+    uint16_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] += (uint64_t)n[i * 4 + 0] * m[i * 4 + 0]
+              + (uint64_t)n[i * 4 + 1] * m[i * 4 + 1]
+              + (uint64_t)n[i * 4 + 2] * m[i * 4 + 2]
+              + (uint64_t)n[i * 4 + 3] * m[i * 4 + 3];
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          void *vfpst, uint32_t desc)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 62365ed90f..35415bfb6c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -725,6 +725,9 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
+# SVE integer dot product (unpredicated)
+DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
-- 
2.17.1

