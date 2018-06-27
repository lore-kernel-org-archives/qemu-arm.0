Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5785218wrq;
        Tue, 26 Jun 2018 21:58:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeFvvTdXaYK7rQRGtl8sC1NTZmnCOp7vhnE6XecySwPYBkt1eB6JSGdOP7LDp7ZSOfHbd+t
X-Received: by 2002:a0c:9a02:: with SMTP id p2-v6mr4074282qvd.184.1530075526816;
        Tue, 26 Jun 2018 21:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075526; cv=none;
        d=google.com; s=arc-20160816;
        b=HAczyQg+YlGgrrbBVxb494VTLa4UlVwHFV/D1CW+25tSBhB6wytOzAmRQhdw70mI3G
         Kt8hCr/haSvdyEwEUajz3n4wBSAafBcydJ2vV+goeL1BPeY6Rk+LZ6bKGIR+xzyEg75S
         toNjfg233lYNIhYuOsHo03HY/gF0pyT0xZ0Baz4YywOJ/rt0/n1cFWlAF23sjGFuNp8Z
         VQxXdQKyPqZO3scxejG2l7aI4+zXcrXltpRWwWR3d7vp8AoZHOvJ6bNF9shg/cqHAHOB
         LImMWFKdwL9ixNSX5xrezzTMVzbjvd6Gmz1RhFVRUlUB/L5oOfJr4HkTwrxIMvxERxEj
         0WuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uDnlhaTXRgEX+y5t8YAQfJ33Fc348zNrhQ6d3KrL1HE=;
        b=ELDQYhuEADcCR7XPyZreFqNT23c6i0PLuA2SFzop/vtyBU71BFqdEJ3+M5rkWWEtEB
         SA/4K92Dx8YsrHZ3NhhpHp1E73EASNZGAdV9PPnelRLYWqowJxCv+CXytGDuCfXUAdaA
         mgEItxL5P8LiKLyOIAQvrJjhNwOxxE3rmjZOTaeel7wCc9mX7jlsSlljOZ437Oh3IPKL
         b5P1jAgmYCKzPoopWPW+eiWMnJSCwUMW6Wcc5wHzqr09WfpysddVMIEhYeqJbZolKgM/
         VLKQ+ebMwxIEaQcYGDYTF5urKKDd8KOHe/DT1iOc+8ew107l2c58JaQGI+WSrPh4zyuK
         Fvyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=baKByzqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b29-v6si3174887qkj.363.2018.06.26.21.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=baKByzqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2XW-0007Js-75
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:58:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29p-0004fh-Sh
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29o-00015Q-63
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:17 -0400
Received: from mail-pl0-x233.google.com ([2607:f8b0:400e:c01::233]:40867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29n-00013g-Su
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:16 -0400
Received: by mail-pl0-x233.google.com with SMTP id t6-v6so413524plo.7
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uDnlhaTXRgEX+y5t8YAQfJ33Fc348zNrhQ6d3KrL1HE=;
	b=baKByzqKrKlNjAT5LqXXr2gDTA3uiKhlK96mJgFfygFT5KCpkpKataljpgdIWOuUst
	53gpjg/lUYh46bpgvKVqw5+Tj90nCFvHKiytF5+ZjMiNQnqjWGho8f2U/JFi8zDI3qgJ
	52fyTrGXWnUkE6ZPkDVjtJ8/ProVq8f+X1DPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uDnlhaTXRgEX+y5t8YAQfJ33Fc348zNrhQ6d3KrL1HE=;
	b=G0p4MpVHO17M3RqS3kmn+IlK5zDuLXbZiCBcJLKGxubUIMKsiCzb01yLiBWu3r0uOQ
	IMD6qEwoLs18BFHvhTMggw9Y5O/peC62TgBzbSFwLuYA5ASBqFweXVTGFmPnTDKSni1+
	lKjSDwh0BvJ73ilT39dIBu4PxmYrr7SlefPPZ+wL55n4OPzQoacEXKH95XKPO4w72CNc
	DQX9hgCNfstXwKgBItl67kdShrhoHPuC4NC7tAzO9F5MFuErh8olAuR2IguWRI9KY9vt
	PlDNnwWsecWZ7Owc3uJ1EGYbnKfL8RRuv6g94EdGJjVsJEbLnX29udbgsEErLR/nCkJx
	f5yg==
X-Gm-Message-State: APt69E3dhXpdk6dekfJx5VKiIL11Voox9mvKKUIXYLc+Tvw3gPARP/tD
	RUh6FYLqNv+xZVW5VY2vPhdV5XB8e9E=
X-Received: by 2002:a17:902:822:: with SMTP id
	31-v6mr4420602plk.172.1530074054617; 
	Tue, 26 Jun 2018 21:34:14 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:24 -0700
Message-Id: <20180627043328.11531-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::233
Subject: [Qemu-devel] [PATCH v6 31/35] target/arm: Implement SVE fp complex
 multiply add (indexed)
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
X-TUID: ZBo+HKqUdiYy

Enhance the existing helpers to support SVE, which takes the
index from each 128-bit segment.  The change has no effect
for AdvSIMD, since there is only one such segment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++++++++++++++++
 target/arm/vec_helper.c    | 50 +++++++++++++++++++++++---------------
 target/arm/sve.decode      |  6 +++++
 3 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7ce3222158..4f2152fb70 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4005,6 +4005,29 @@ static bool trans_FCMLA_zpzzz(DisasContext *s,
     return true;
 }
 
+static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[2] = {
+        gen_helper_gvec_fcmlah_idx,
+        gen_helper_gvec_fcmlas_idx,
+    };
+
+    tcg_debug_assert(a->esz == 1 || a->esz == 2);
+    tcg_debug_assert(a->rd == a->ra);
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           status, vsz, vsz,
+                           a->index * 4 + a->rot,
+                           fns[a->esz - 1]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Unary Operations Prediated Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8f2dc4b989..db5aeb9f24 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -319,22 +319,27 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
     uint32_t neg_real = flip ^ neg_imag;
-    uintptr_t i;
-    float16 e1 = m[H2(2 * index + flip)];
-    float16 e3 = m[H2(2 * index + 1 - flip)];
+    intptr_t elements = opr_sz / sizeof(float16);
+    intptr_t eltspersegment = 16 / sizeof(float16);
+    intptr_t i, j;
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 15;
     neg_imag <<= 15;
-    e1 ^= neg_real;
-    e3 ^= neg_imag;
 
-    for (i = 0; i < opr_sz / 2; i += 2) {
-        float16 e2 = n[H2(i + flip)];
-        float16 e4 = e2;
+    for (i = 0; i < elements; i += eltspersegment) {
+        float16 mr = m[H2(i + 2 * index + 0)];
+        float16 mi = m[H2(i + 2 * index + 1)];
+        float16 e1 = neg_real ^ (flip ? mi : mr);
+        float16 e3 = neg_imag ^ (flip ? mr : mi);
 
-        d[H2(i)] = float16_muladd(e2, e1, d[H2(i)], 0, fpst);
-        d[H2(i + 1)] = float16_muladd(e4, e3, d[H2(i + 1)], 0, fpst);
+        for (j = i; j < i + eltspersegment; j += 2) {
+            float16 e2 = n[H2(j + flip)];
+            float16 e4 = e2;
+
+            d[H2(j)] = float16_muladd(e2, e1, d[H2(j)], 0, fpst);
+            d[H2(j + 1)] = float16_muladd(e4, e3, d[H2(j + 1)], 0, fpst);
+        }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -380,22 +385,27 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
     uint32_t neg_real = flip ^ neg_imag;
-    uintptr_t i;
-    float32 e1 = m[H4(2 * index + flip)];
-    float32 e3 = m[H4(2 * index + 1 - flip)];
+    intptr_t elements = opr_sz / sizeof(float32);
+    intptr_t eltspersegment = 16 / sizeof(float32);
+    intptr_t i, j;
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 31;
     neg_imag <<= 31;
-    e1 ^= neg_real;
-    e3 ^= neg_imag;
 
-    for (i = 0; i < opr_sz / 4; i += 2) {
-        float32 e2 = n[H4(i + flip)];
-        float32 e4 = e2;
+    for (i = 0; i < elements; i += eltspersegment) {
+        float32 mr = m[H4(i + 2 * index + 0)];
+        float32 mi = m[H4(i + 2 * index + 1)];
+        float32 e1 = neg_real ^ (flip ? mi : mr);
+        float32 e3 = neg_imag ^ (flip ? mr : mi);
 
-        d[H4(i)] = float32_muladd(e2, e1, d[H4(i)], 0, fpst);
-        d[H4(i + 1)] = float32_muladd(e4, e3, d[H4(i + 1)], 0, fpst);
+        for (j = i; j < i + eltspersegment; j += 2) {
+            float32 e2 = n[H4(j + flip)];
+            float32 e4 = e2;
+
+            d[H4(j)] = float32_muladd(e2, e1, d[H4(j)], 0, fpst);
+            d[H4(j + 1)] = float32_muladd(e4, e3, d[H4(j + 1)], 0, fpst);
+        }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e342cfdf14..62365ed90f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -733,6 +733,12 @@ FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
 FCMLA_zpzzz     01100100 esz:2 0 rm:5 0 rot:2 pg:3 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+# SVE floating-point complex multiply-add (indexed)
+FCMLA_zzxz      01100100 10 1 index:2 rm:3 0001 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx esz=1
+FCMLA_zzxz      01100100 11 1 index:1 rm:4 0001 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx esz=2
+
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-- 
2.17.1

