Received: by 10.223.159.74 with SMTP id f10csp2981192wrg;
        Mon, 18 Dec 2017 10:32:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBov9VRUyFHeYe3jRF0BKKptml8o/uGWKdJS10ZQG2wJbYhVctdFLpB+CKxOB0xTZYFXVMlkS
X-Received: by 10.129.198.2 with SMTP id l2mr511742ywi.491.1513621976170;
        Mon, 18 Dec 2017 10:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513621976; cv=none;
        d=google.com; s=arc-20160816;
        b=A9QYAkkLf5ybtLpMsDDyivAkJyfgnFXKiS58YNMMzYBCfawmHnslaECvaoWzhqSMNL
         SvyarZ0gsWretttVqaUHVOzau7jXtg9yOzU2iWeeJWwDRFJ004RaBSRPzTq5oYzvKIsL
         jvGNVTv/0G3WuYpEJv0Qfwqr9FSiG0fhosl8hqniymvOAUqFNln5p2RLfgwaB2ZOuHHv
         yBy4fdxbOXYzRJ497F9HNZ6vvEwm3WmGwRVbQKMToNxgHAjoP2hhX36hBMsD4b6rIfDC
         LlfimtEJbtBnDUndhg6cHM9CWsh+6ReoCBJUaDDjxC4/Y6bZGfZRpAXllDBhfV9xtyc0
         bk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=eISu4UfSsAnxjFAeFFh1n1p1VMBmX+zbvHQEoYGoTBI=;
        b=MbRzfV73tEfQgdSZj1zyoec8GXk0kmvWrfdU6H556hXQFhECQSvx4gD65W+EoUWRZo
         6j/PTUyS9sjFc2lsROHNEJrEntKo8QkGdivo6lYMQJmqX1YHOUFeq3Q8vbzEQT7C4bmi
         /nqAMiaFSzsDGHm6vqwkQmt8PBkPjL4+DjvfilqU4W1PYYrTfYGs3fiYlg5yXJFmY8xH
         bC9dGpE0N5homXCYlir9/X0LsKBCgNgBq27rCbI1nLfAfQg3QcI0lZ6q6he6XN7hemlu
         5iFlBe2IYgaHVBu0q55ui+LH5bTYjLz5S2AK1Ljz+Cucara+9EwTwdwwpfC70DH1Weuh
         4Gmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y7zwAIS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si2578558ywh.714.2017.12.18.10.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y7zwAIS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0Df-0006lc-IQ
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:32:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUX-0008H9-Jj
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUW-00027u-HA
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:17 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUW-00027C-9n
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:16 -0500
Received: by mail-pl0-x244.google.com with SMTP id 62so3801146pld.7
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eISu4UfSsAnxjFAeFFh1n1p1VMBmX+zbvHQEoYGoTBI=;
	b=Y7zwAIS5EX1EadgXdaf81dDgxkPnP8QuwleVD+CS/V+hjiORAgEAyZNFU8EF5BX5iu
	TJBF+/6x3TMS+vkRuxXzhi0hpsUCLJqeTfg2fbMKSsS/PKwf/NompMcK9xkJH1uXurUN
	U8MFc7YY45PNERj8SSgMcLnONwS42ijZOPrxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eISu4UfSsAnxjFAeFFh1n1p1VMBmX+zbvHQEoYGoTBI=;
	b=Az4kMNMXIZleKZGlZzeqVJ4NdiZsUSxN1r9ZqbXYbv3WSoYnvgYUXCXyn1d24AXhEB
	oBxbTrUbhMz9CzKxKPFZ3cZFCj1HivGmmEtZJ6WGfC83zbibk1PBhOvJXGKJEBnOd5hn
	3ciWYeK/ElPxU7gVw6NM63tELgdfMQq2oBYAecTxdbQUwHLQK64Ep0zCcehl9eubwmZd
	nf7UEBuYCnWQhUdSeUjMHAsv9dQqEr4RBiNpnF0Tm000CMD17yIaKhQhtU4PRJUbSf2q
	JeldBlAWCfB18jfNHQedZ+2goS6lEEl9cDXhXCJ62LyDfYh85dv1CMy79AWQED0UqGTw
	vbYA==
X-Gm-Message-State: AKGB3mJpzNbWsry39dhsMKW/OfxVOycHkn9LKgePaoFlis7uemeFjX98
	N7ZeezdUaDmgaHd3ZjOEp2yOLpnNyQo=
X-Received: by 10.84.133.132 with SMTP id f4mr452596plf.413.1513619174988;
	Mon, 18 Dec 2017 09:46:14 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:42 -0800
Message-Id: <20171218174552.18871-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH 13/23] target/arm: Implement SVE bitwise shift
 by wide elements (predicated)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKT1HCABT5ew

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 21 +++++++++++++++++++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 target/arm/sve.def         |  6 ++++++
 4 files changed, 83 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 61b1287269..a2db3e2fd9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -189,6 +189,27 @@ DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_orv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 20f1e60fda..3be6d1ae05 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -517,6 +517,42 @@ DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/* Three-operand expander, controlled by a predicate, in which the
+ * third operand is "wide".  That is, for D = N op M, the same 64-bit
+ * value of M is used with all of the narrower values of N.
+ */
+#define DO_ZPZW(NAME, TYPE, TYPEW, H, OP)                               \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                       \
+    intptr_t iv = 0, ib = 0, opr_sz = simd_oprsz(desc);                 \
+    for (iv = ib = 0; iv < opr_sz; iv += 16, ib += 2) {                 \
+        uint16_t pg = *(uint16_t *)(vg + H2(ib));                       \
+        TYPEW mm = *(TYPEW *)(vm + iv);                                 \
+        intptr_t i = 0;                                                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                TYPE nn = *(TYPE *)(vn + iv + H(i));                    \
+                *(TYPE *)(vd + iv + H(i)) = OP(nn, mm);                 \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (pg);                                                   \
+    }                                                                   \
+}
+
+DO_ZPZW(sve_asr_zpzw_b, int8_t, uint64_t, H1, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_b, uint8_t, uint64_t, H1, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_b, uint8_t, uint64_t, H1, DO_LSL)
+
+DO_ZPZW(sve_asr_zpzw_h, int16_t, uint64_t, H1_2, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_h, uint16_t, uint64_t, H1_2, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_h, uint16_t, uint64_t, H1_2, DO_LSL)
+
+DO_ZPZW(sve_asr_zpzw_s, int32_t, uint64_t, H1_4, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
+
+#undef DO_ZPZW
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 685a3ba249..91f07d57e3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -230,6 +230,26 @@ void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 
 #undef DO_ZPZZ
 
+#define DO_ZPZW(NAME, name) \
+void trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a, uint32_t insn) \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[3] = {                           \
+        gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
+        gen_helper_sve_##name##_zpzw_s,                                   \
+    };                                                                    \
+    if ((unsigned)a->esz < 3) {                                           \
+        do_zpzz_ool(s, a, fns[a->esz]);                                   \
+    } else {                                                              \
+        unallocated_encoding(s);                                          \
+    }                                                                     \
+}
+
+DO_ZPZW(ASR, asr)
+DO_ZPZW(LSR, lsr)
+DO_ZPZW(LSL, lsl)
+
+#undef DO_ZPZW
+
 typedef void gen_helper_gvec_reduc(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_i32);
 static void do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
                        gen_helper_gvec_reduc *fn)
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 9f9c0803a0..66be950ca5 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -141,6 +141,12 @@ ASR_zpzz		00000100 .. 010 100 100 ... ..... .....		@rdm_pg_rn_esz # ASRR
 LSR_zpzz		00000100 .. 010 101 100 ... ..... .....		@rdm_pg_rn_esz # LSRR
 LSL_zpzz		00000100 .. 010 111 100 ... ..... .....		@rdm_pg_rn_esz # LSLR
 
+# SVE bitwise shift by wide elements (predicated)
+# Note these require size != 3.
+ASR_zpzw		00000100 .. 011 000 100 ... ..... .....		@rdn_pg_rm_esz
+LSR_zpzw		00000100 .. 011 001 100 ... ..... .....		@rdn_pg_rm_esz
+LSL_zpzw		00000100 .. 011 011 100 ... ..... .....		@rdn_pg_rm_esz
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

