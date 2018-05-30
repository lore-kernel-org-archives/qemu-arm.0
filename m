Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5028807wre;
        Wed, 30 May 2018 11:11:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK3zqMD/UKPFu+L81mQNDu07cGY+h3IfPZDYbR1sLeIZ4fFvOkNflE0OZ0PweQYPuuTI3x3
X-Received: by 2002:a37:4f10:: with SMTP id d16-v6mr3438518qkb.323.1527703883741;
        Wed, 30 May 2018 11:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703883; cv=none;
        d=google.com; s=arc-20160816;
        b=cEs3E7M74hTc0wSe5I8vKlNd27mOaoET6uWCLwKQ3tNLzW87fD2Va7GTnuvCcwxuBb
         v4m6teMQoyomE0+AL661TmXVydaoC4w4VlAqcaVNwipYbVoEmhXvPnCRYxuBZMpIak1p
         Ycojzxe5MsQXK58JZuXnWUqB1sR2x4I5LhwR1XWv46yvePNJgUeHmZWipz/e/+T4o1WB
         gQy/NxzUDz16RNQ4VaF2BglpriJmus5iWlSpS+GlMg7gO0WQ/eR8auDkEqOVAbnfWkUh
         MA3XdNuoR1UXPYT8Bjrnvum2qwB2HoJPsX0f9EfrrDxmyX1usaRV2XYy0d4Jp/rK/7ad
         yAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SvrVYh2PWuwtdh6uLUs3LW+4B4XuI0Sq8omTmAY/Tvw=;
        b=WG86RPkxlDtuIZSa08CVJCnVnaDhPohRtQENNlWgvxalRBoyZRk8CUVzXtcdNPXaU3
         7KjIhdh+b9bzyRylgTV3Y6ZwIsgvDjKFVoaT7LEawvMrR/ss3c2Fh/uV+4P7vNEwGVlX
         LJEnjPiIyjAjHq/pGKe2NR3wsO1Bc+BGK9v2GiOxydkkxM4r84oZ8mk7ymz6xVxd9WSI
         hPV83tRk+Ea9NpjcJ9bs0RrtbqMZDXMPAHpyOJtd6wI3KEy6u6BAzQu9t5NKPcg0IZxk
         KfhMUbBV8XMZ/itf810stClUbvB7B8LcQ2JpEW6YkKU21htVoIjyWG+BH34qIOWqmOLb
         WYQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLgpw6SC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si4381973qtl.90.2018.05.30.11.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLgpw6SC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5ZD-00016L-5O
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:11:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pu-00023U-Rt
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pp-0004g2-QR
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:46 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33320)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pp-0004eD-DH
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:41 -0400
Received: by mail-pg0-x241.google.com with SMTP id e21-v6so8489378pgv.0
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SvrVYh2PWuwtdh6uLUs3LW+4B4XuI0Sq8omTmAY/Tvw=;
	b=JLgpw6SCTJLf8FfsV0Eg953oJWW0/yxSYXOctdCCpUYatWZt6Md9pvmrdKbTL6fHHx
	VpcBlzC7O5jKyN2uNtXBT2Kh1PeNkze/3QFqE6jjKhIKel2eYKS91UUUTTr11XY1qzxi
	v7/Ok/ghDc8dN5tWbGcgbgXmVYKX81rz0E024=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SvrVYh2PWuwtdh6uLUs3LW+4B4XuI0Sq8omTmAY/Tvw=;
	b=aF7vuUi2ATPkIzV5p7gRdINtOs1GUfEeuEVXmyfDV21DLEJvhrCxujNXHkfmlFsrI2
	A36ICzETELfmFGXYk2DiIneXcKdLG2YLiiScS3RBUcNwHIydhYETLc6QggS/xYj4E1+Y
	R5RZ0zd9zBMZuegsIZVyJSTO7IweDHUDUYT72GQ/pOKoyUYvv+ekM7AiStxAANW3DBRX
	Tj+0BBjApQnVKnnGIis2ME19DMzFEZYnrnt89n7kJmJhYfJprwiW3DGyhIBHtUhkqzoF
	oo7ZBeLlhbCOqBzTjvG2pT3UbgAeX2tGjaPSSZC/WYgDt/OdMIMIxnFyyXNWi2ATjcSq
	RgMw==
X-Gm-Message-State: ALKqPwezpKMP41cuAFUImWGm/GdL7f0jotxWhh/VpGezQ75kdzaxln50
	6QnV27iayWo+YvJn3aiL+tfOaA==
X-Received: by 2002:a63:bf49:: with SMTP id
	i9-v6mr3012613pgo.342.1527703300126; 
	Wed, 30 May 2018 11:01:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:13 -0700
Message-Id: <20180530180120.13355-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3b 11/18] target/arm: Implement SVE Integer
 Compare - Vectors Group
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
X-TUID: vOa4rexxyLqZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 115 +++++++++++++++++++++++
 target/arm/sve_helper.c    | 187 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  91 ++++++++++++++++++
 target/arm/sve.decode      |  24 +++++
 4 files changed, 417 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0f57f64895..6ffd1fbe8e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -490,6 +490,121 @@ DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 51cf9c47d9..1dc2ec1e65 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -74,6 +74,28 @@ static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
     return flags;
 }
 
+/* This is an iterative function, called for each Pd and Pg word
+ * moving backward.
+ */
+static uint32_t iter_predtest_bwd(uint64_t d, uint64_t g, uint32_t flags)
+{
+    if (likely(g)) {
+        /* Compute C from first (i.e last) !(D & G).
+           Use bit 2 to signal first G bit seen.  */
+        if (!(flags & 4)) {
+            flags += 4 - 1; /* add bit 2, subtract C from PREDTEST_INIT */
+            flags |= (d & pow2floor(g)) == 0;
+        }
+
+        /* Accumulate Z from each D & G.  */
+        flags |= ((d & g) != 0) << 1;
+
+        /* Compute N from last (i.e first) D & G.  Replace previous.  */
+        flags = deposit32(flags, 31, 1, (d & (g & -g)) != 0);
+    }
+    return flags;
+}
+
 /* The same for a single word predicate.  */
 uint32_t HELPER(sve_predtest1)(uint64_t d, uint64_t g)
 {
@@ -2200,3 +2222,168 @@ void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
         d[i] = (pg[H1(i)] & 1 ? nn : mm);
     }
 }
+
+/* Two operand comparison controlled by a predicate.
+ * ??? It is very tempting to want to be able to expand this inline
+ * with x86 instructions, e.g.
+ *
+ *    vcmpeqw    zm, zn, %ymm0
+ *    vpmovmskb  %ymm0, %eax
+ *    and        $0x5555, %eax
+ *    and        pg, %eax
+ *
+ * or even aarch64, e.g.
+ *
+ *    // mask = 4000 1000 0400 0100 0040 0010 0004 0001
+ *    cmeq       v0.8h, zn, zm
+ *    and        v0.8h, v0.8h, mask
+ *    addv       h0, v0.8h
+ *    and        v0.8b, pg
+ *
+ * However, coming up with an abstraction that allows vector inputs and
+ * a scalar output, and also handles the byte-ordering of sub-uint64_t
+ * scalar outputs, is tricky.
+ */
+#define DO_CMP_PPZZ(NAME, TYPE, OP, H, MASK)                                 \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                            \
+    intptr_t opr_sz = simd_oprsz(desc);                                      \
+    uint32_t flags = PREDTEST_INIT;                                          \
+    intptr_t i = opr_sz;                                                     \
+    do {                                                                     \
+        uint64_t out = 0, pg;                                                \
+        do {                                                                 \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                         \
+            TYPE nn = *(TYPE *)(vn + H(i));                                  \
+            TYPE mm = *(TYPE *)(vm + H(i));                                  \
+            out |= nn OP mm;                                                 \
+        } while (i & 63);                                                    \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
+        out &= pg;                                                           \
+        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
+        flags = iter_predtest_bwd(out, pg, flags);                           \
+    } while (i > 0);                                                         \
+    return flags;                                                            \
+}
+
+#define DO_CMP_PPZZ_B(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZZ_H(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZZ_S(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1_4, 0x1111111111111111ull)
+#define DO_CMP_PPZZ_D(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP,     , 0x0101010101010101ull)
+
+DO_CMP_PPZZ_B(sve_cmpeq_ppzz_b, uint8_t,  ==)
+DO_CMP_PPZZ_H(sve_cmpeq_ppzz_h, uint16_t, ==)
+DO_CMP_PPZZ_S(sve_cmpeq_ppzz_s, uint32_t, ==)
+DO_CMP_PPZZ_D(sve_cmpeq_ppzz_d, uint64_t, ==)
+
+DO_CMP_PPZZ_B(sve_cmpne_ppzz_b, uint8_t,  !=)
+DO_CMP_PPZZ_H(sve_cmpne_ppzz_h, uint16_t, !=)
+DO_CMP_PPZZ_S(sve_cmpne_ppzz_s, uint32_t, !=)
+DO_CMP_PPZZ_D(sve_cmpne_ppzz_d, uint64_t, !=)
+
+DO_CMP_PPZZ_B(sve_cmpgt_ppzz_b, int8_t,  >)
+DO_CMP_PPZZ_H(sve_cmpgt_ppzz_h, int16_t, >)
+DO_CMP_PPZZ_S(sve_cmpgt_ppzz_s, int32_t, >)
+DO_CMP_PPZZ_D(sve_cmpgt_ppzz_d, int64_t, >)
+
+DO_CMP_PPZZ_B(sve_cmpge_ppzz_b, int8_t,  >=)
+DO_CMP_PPZZ_H(sve_cmpge_ppzz_h, int16_t, >=)
+DO_CMP_PPZZ_S(sve_cmpge_ppzz_s, int32_t, >=)
+DO_CMP_PPZZ_D(sve_cmpge_ppzz_d, int64_t, >=)
+
+DO_CMP_PPZZ_B(sve_cmphi_ppzz_b, uint8_t,  >)
+DO_CMP_PPZZ_H(sve_cmphi_ppzz_h, uint16_t, >)
+DO_CMP_PPZZ_S(sve_cmphi_ppzz_s, uint32_t, >)
+DO_CMP_PPZZ_D(sve_cmphi_ppzz_d, uint64_t, >)
+
+DO_CMP_PPZZ_B(sve_cmphs_ppzz_b, uint8_t,  >=)
+DO_CMP_PPZZ_H(sve_cmphs_ppzz_h, uint16_t, >=)
+DO_CMP_PPZZ_S(sve_cmphs_ppzz_s, uint32_t, >=)
+DO_CMP_PPZZ_D(sve_cmphs_ppzz_d, uint64_t, >=)
+
+#undef DO_CMP_PPZZ_B
+#undef DO_CMP_PPZZ_H
+#undef DO_CMP_PPZZ_S
+#undef DO_CMP_PPZZ_D
+#undef DO_CMP_PPZZ
+
+/* Similar, but the second source is "wide".  */
+#define DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H, MASK)                     \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                            \
+    intptr_t opr_sz = simd_oprsz(desc);                                      \
+    uint32_t flags = PREDTEST_INIT;                                          \
+    intptr_t i = opr_sz;                                                     \
+    do {                                                                     \
+        uint64_t out = 0, pg;                                                \
+        do {                                                                 \
+            TYPEW mm = *(TYPEW *)(vm + i - 8);                               \
+            do {                                                             \
+                i -= sizeof(TYPE), out <<= sizeof(TYPE);                     \
+                TYPE nn = *(TYPE *)(vn + H(i));                              \
+                out |= nn OP mm;                                             \
+            } while (i & 7);                                                 \
+        } while (i & 63);                                                    \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
+        out &= pg;                                                           \
+        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
+        flags = iter_predtest_bwd(out, pg, flags);                           \
+    } while (i > 0);                                                         \
+    return flags;                                                            \
+}
+
+#define DO_CMP_PPZW_B(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZW_H(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZW_S(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_4, 0x1111111111111111ull)
+
+DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, uint8_t,  uint64_t, ==)
+DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, uint16_t, uint64_t, ==)
+DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, uint32_t, uint64_t, ==)
+
+DO_CMP_PPZW_B(sve_cmpne_ppzw_b, uint8_t,  uint64_t, !=)
+DO_CMP_PPZW_H(sve_cmpne_ppzw_h, uint16_t, uint64_t, !=)
+DO_CMP_PPZW_S(sve_cmpne_ppzw_s, uint32_t, uint64_t, !=)
+
+DO_CMP_PPZW_B(sve_cmpgt_ppzw_b, int8_t,   int64_t, >)
+DO_CMP_PPZW_H(sve_cmpgt_ppzw_h, int16_t,  int64_t, >)
+DO_CMP_PPZW_S(sve_cmpgt_ppzw_s, int32_t,  int64_t, >)
+
+DO_CMP_PPZW_B(sve_cmpge_ppzw_b, int8_t,   int64_t, >=)
+DO_CMP_PPZW_H(sve_cmpge_ppzw_h, int16_t,  int64_t, >=)
+DO_CMP_PPZW_S(sve_cmpge_ppzw_s, int32_t,  int64_t, >=)
+
+DO_CMP_PPZW_B(sve_cmphi_ppzw_b, uint8_t,  uint64_t, >)
+DO_CMP_PPZW_H(sve_cmphi_ppzw_h, uint16_t, uint64_t, >)
+DO_CMP_PPZW_S(sve_cmphi_ppzw_s, uint32_t, uint64_t, >)
+
+DO_CMP_PPZW_B(sve_cmphs_ppzw_b, uint8_t,  uint64_t, >=)
+DO_CMP_PPZW_H(sve_cmphs_ppzw_h, uint16_t, uint64_t, >=)
+DO_CMP_PPZW_S(sve_cmphs_ppzw_s, uint32_t, uint64_t, >=)
+
+DO_CMP_PPZW_B(sve_cmplt_ppzw_b, int8_t,   int64_t, <)
+DO_CMP_PPZW_H(sve_cmplt_ppzw_h, int16_t,  int64_t, <)
+DO_CMP_PPZW_S(sve_cmplt_ppzw_s, int32_t,  int64_t, <)
+
+DO_CMP_PPZW_B(sve_cmple_ppzw_b, int8_t,   int64_t, <=)
+DO_CMP_PPZW_H(sve_cmple_ppzw_h, int16_t,  int64_t, <=)
+DO_CMP_PPZW_S(sve_cmple_ppzw_s, int32_t,  int64_t, <=)
+
+DO_CMP_PPZW_B(sve_cmplo_ppzw_b, uint8_t,  uint64_t, <)
+DO_CMP_PPZW_H(sve_cmplo_ppzw_h, uint16_t, uint64_t, <)
+DO_CMP_PPZW_S(sve_cmplo_ppzw_s, uint32_t, uint64_t, <)
+
+DO_CMP_PPZW_B(sve_cmpls_ppzw_b, uint8_t,  uint64_t, <=)
+DO_CMP_PPZW_H(sve_cmpls_ppzw_h, uint16_t, uint64_t, <=)
+DO_CMP_PPZW_S(sve_cmpls_ppzw_s, uint32_t, uint64_t, <=)
+
+#undef DO_CMP_PPZW_B
+#undef DO_CMP_PPZW_H
+#undef DO_CMP_PPZW_S
+#undef DO_CMP_PPZW
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 53b86af94d..ed0e3c48b1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -33,6 +33,10 @@
 #include "trace-tcg.h"
 #include "translate-a64.h"
 
+
+typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
+                                     TCGv_ptr, TCGv_ptr, TCGv_i32);
+
 /*
  * Helpers for extracting complex instruction fields.
  */
@@ -2686,6 +2690,93 @@ static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Integer Compare - Vectors Group
+ */
+
+static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                          gen_helper_gvec_flags_4 *gen_fn)
+{
+    TCGv_ptr pd, zn, zm, pg;
+    unsigned vsz;
+    TCGv_i32 t;
+
+    if (gen_fn == NULL) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    t = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    pd = tcg_temp_new_ptr();
+    zn = tcg_temp_new_ptr();
+    zm = tcg_temp_new_ptr();
+    pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(pd, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(zm, cpu_env, vec_full_reg_offset(s, a->rm));
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    gen_fn(t, pd, zn, zm, pg, t);
+
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(zm);
+    tcg_temp_free_ptr(pg);
+
+    do_pred_flags(t);
+
+    tcg_temp_free_i32(t);
+    return true;
+}
+
+#define DO_PPZZ(NAME, name) \
+static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h,   \
+        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d,   \
+    };                                                                    \
+    return do_ppzz_flags(s, a, fns[a->esz]);                              \
+}
+
+DO_PPZZ(CMPEQ, cmpeq)
+DO_PPZZ(CMPNE, cmpne)
+DO_PPZZ(CMPGT, cmpgt)
+DO_PPZZ(CMPGE, cmpge)
+DO_PPZZ(CMPHI, cmphi)
+DO_PPZZ(CMPHS, cmphs)
+
+#undef DO_PPZZ
+
+#define DO_PPZW(NAME, name) \
+static bool trans_##NAME##_ppzw(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h,   \
+        gen_helper_sve_##name##_ppzw_s, NULL                              \
+    };                                                                    \
+    return do_ppzz_flags(s, a, fns[a->esz]);                              \
+}
+
+DO_PPZW(CMPEQ, cmpeq)
+DO_PPZW(CMPNE, cmpne)
+DO_PPZW(CMPGT, cmpgt)
+DO_PPZW(CMPGE, cmpge)
+DO_PPZW(CMPHI, cmphi)
+DO_PPZW(CMPHS, cmphs)
+DO_PPZW(CMPLT, cmplt)
+DO_PPZW(CMPLE, cmple)
+DO_PPZW(CMPLO, cmplo)
+DO_PPZW(CMPLS, cmpls)
+
+#undef DO_PPZW
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 91522d8e13..76a42193e4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -99,6 +99,7 @@
 @rdm_pg_rn      ........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
                 &rprr_esz rm=%reg_movprfx
 @rd_pg4_rn_rm   ........ esz:2 . rm:5  .. pg:4  rn:5 rd:5       &rprr_esz
+@pd_pg_rn_rm    ........ esz:2 . rm:5 ... pg:3 rn:5 . rd:4      &rprr_esz
 
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
@@ -472,6 +473,29 @@ SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 # SVE select vector elements (predicated)
 SEL_zpzz        00000101 .. 1 ..... 11 .... ..... .....         @rd_pg4_rn_rm
 
+### SVE Integer Compare - Vectors Group
+
+# SVE integer compare_vectors
+CMPHS_ppzz      00100100 .. 0 ..... 000 ... ..... 0 ....        @pd_pg_rn_rm
+CMPHI_ppzz      00100100 .. 0 ..... 000 ... ..... 1 ....        @pd_pg_rn_rm
+CMPGE_ppzz      00100100 .. 0 ..... 100 ... ..... 0 ....        @pd_pg_rn_rm
+CMPGT_ppzz      00100100 .. 0 ..... 100 ... ..... 1 ....        @pd_pg_rn_rm
+CMPEQ_ppzz      00100100 .. 0 ..... 101 ... ..... 0 ....        @pd_pg_rn_rm
+CMPNE_ppzz      00100100 .. 0 ..... 101 ... ..... 1 ....        @pd_pg_rn_rm
+
+# SVE integer compare with wide elements
+# Note these require esz != 3.
+CMPEQ_ppzw      00100100 .. 0 ..... 001 ... ..... 0 ....        @pd_pg_rn_rm
+CMPNE_ppzw      00100100 .. 0 ..... 001 ... ..... 1 ....        @pd_pg_rn_rm
+CMPGE_ppzw      00100100 .. 0 ..... 010 ... ..... 0 ....        @pd_pg_rn_rm
+CMPGT_ppzw      00100100 .. 0 ..... 010 ... ..... 1 ....        @pd_pg_rn_rm
+CMPLT_ppzw      00100100 .. 0 ..... 011 ... ..... 0 ....        @pd_pg_rn_rm
+CMPLE_ppzw      00100100 .. 0 ..... 011 ... ..... 1 ....        @pd_pg_rn_rm
+CMPHS_ppzw      00100100 .. 0 ..... 110 ... ..... 0 ....        @pd_pg_rn_rm
+CMPHI_ppzw      00100100 .. 0 ..... 110 ... ..... 1 ....        @pd_pg_rn_rm
+CMPLO_ppzw      00100100 .. 0 ..... 111 ... ..... 0 ....        @pd_pg_rn_rm
+CMPLS_ppzw      00100100 .. 0 ..... 111 ... ..... 1 ....        @pd_pg_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

