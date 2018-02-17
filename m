Received: by 10.28.71.27 with SMTP id u27csp2095495wma;
        Sat, 17 Feb 2018 11:01:04 -0800 (PST)
X-Google-Smtp-Source: AH8x2264iyVe/fxmApT682Pc8SpnRU2tieS++5W9uwNGiY48RMrqMV36SIPfJOd5hDCVGU+J7wId
X-Received: by 10.37.188.17 with SMTP id i17mr7112285ybh.251.1518894064523;
        Sat, 17 Feb 2018 11:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894064; cv=none;
        d=google.com; s=arc-20160816;
        b=L12eK6e5gHqvu4M6oCSazqHETZ8ShEGI7n3j/yc3eTnfAsM5zSadSmhI44e5hGx1A2
         bpiA4f4NIs5Cc76piWgKXhNnwVOBx/zwTzkhIi14o+cG2vzprrY3hf+NIcz/ISsUSs7P
         lMFnoado00f/HhEEbIRblpS3fte+ugGNe9b/B0vgsO/fZ5llGYPHKqZZmPEZJli27F1R
         IKhrL89Ck3CIvCLKIJvA3B5mU6XIFj+gc3EYfFs1VEb0TyEirEAL8ZrWsoQJOjToR37z
         ybZi1m1Qi6PWniVVPXaLsblprGOX0tYEW4RlbWJuyn54fBUfI34b/ngGxWvOs3szKULU
         BVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nvmjmNBSSd8KlTGFZjxDZR+Pc5M+VYp/8trMxJq8PP0=;
        b=uEchLuLdsTS/CqUC9PQyTGnTLnVGKpRnRPuC3UN5k+5JAnle8JoKiRMRY36ga4MWjj
         Ml7JdXxiohs/q1X8MJ54zElNgu6iA4287ESLcAwcxje0KtS6Do7VYsAfIdaTHBb2gQR6
         DSIe3O26KVYr0GjqGLwvTfjjbjrLLsphGgKkDBNL733XZEI9gs/tWWoeSoeRUpQp5Y7V
         Z60AzDU10uOzSNvYTNPWRdGAldiUYhsYqr5ETHYNqQondSruve4c+aizG1zwWykDbrpM
         VVzBFgeO3yfI0ICPWzFgVzDtSlILQS+R8wWIqSJAZhTwz0sha2nOoAueSm4UgetdzXtX
         oCPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d9nEwwYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z128si820069ywe.717.2018.02.17.11.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d9nEwwYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7jL-0006i2-VQ
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:01:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79k-0000ty-Ve
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79j-0001qf-Sg
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:16 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:40105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79j-0001qP-MR
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:15 -0500
Received: by mail-pg0-x241.google.com with SMTP id g2so4353432pgn.7
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nvmjmNBSSd8KlTGFZjxDZR+Pc5M+VYp/8trMxJq8PP0=;
	b=d9nEwwYSjSaZUIaYquQNmpyKFIsbiRl3tuTsBjkgE9UJK+HgSsr5ZfaeFGJR+zf4eM
	/A7lagrN+kO7Oaum7aHT1gt+zZbeuXnd5R7CdrZwo4EoL+2G7rkUVCsvqbopNMoJ43KC
	X/7TsJcXEbLefuEyNkIyf/IItVAz6ahZ1EJm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nvmjmNBSSd8KlTGFZjxDZR+Pc5M+VYp/8trMxJq8PP0=;
	b=VKq8CGEwV2uXbLbYWCYDBlM77pbc1yWproxJdNn+TDQR88KqFIT/Q/Z2BsfRdh2cJF
	h6ByOZRjB9Y9qYrkbKPR1Sld9ISxqiAZ4KUJDdy5kVedmA8mX5lY1Kkis1cItjhaoVeh
	gqwEKjI09esdLxRY6EY0LRjhceeFGl2sj4CWaCW0smHYHhArfLLeHXJI1arTK0JSag0s
	WBLz5IpebAJA4ehXRAoVj0hlKZhbEHxH8rSZ/T42dVHCM2S1G6Naqt7ZiGXuJ2qM/cbH
	6QhIc+k9AHPWwwfWtVnKpNdLQ2bxxM3gKXEpksQS04pYEfsKMe4bXxcuea6BQGb+4ZxM
	HKuw==
X-Gm-Message-State: APf1xPAsN410nRDhhyY2yg0TlkA6MgtB0miuhzND4c2PLYd0ZWZfUXDN
	EvuHhwm2l1CgCnNcuSqO3MKUfA==
X-Received: by 10.99.60.72 with SMTP id i8mr8129654pgn.399.1518891854813;
	Sat, 17 Feb 2018 10:24:14 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:46 -0800
Message-Id: <20180217182323.25885-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 30/67] target/arm: Implement SVE compress
 active elements
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
X-TUID: B0bi/27e6DTb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 12 ++++++++++++
 target/arm/sve.decode      |  6 ++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index bab20345c6..d977aea00d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -460,6 +460,9 @@ DEF_HELPER_FLAGS_4(sve_trn_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 62982bd099..87a1a32232 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2016,3 +2016,37 @@ DO_TRN(sve_trn_d, uint64_t, )
 #undef DO_ZIP
 #undef DO_UZP
 #undef DO_TRN
+
+void HELPER(sve_compact_s)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = j = 0; i < opr_sz; i++) {
+        if (pg[H1(i / 2)] & (i & 1 ? 0x10 : 0x01)) {
+            d[H4(j)] = n[H4(i)];
+            j++;
+        }
+    }
+    for (; j < opr_sz; j++) {
+        d[H4(j)] = 0;
+    }
+}
+
+void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = j = 0; i < opr_sz; i++) {
+        if (pg[H1(i)] & 1) {
+            d[j] = n[i];
+            j++;
+        }
+    }
+    for (; j < opr_sz; j++) {
+        d[j] = 0;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 09ac955a36..21531b259c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2111,6 +2111,18 @@ static void trans_TRN2_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
     do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
 }
 
+/*
+ *** SVE Permute Vector - Predicated Group
+ */
+
+static void trans_COMPACT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
+    };
+    do_zpz_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2efa3773fc..a89bd37eeb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -425,6 +425,12 @@ UZP2_z		00000101 .. 1 ..... 011 011 ..... .....		@rd_rn_rm
 TRN1_z		00000101 .. 1 ..... 011 100 ..... .....		@rd_rn_rm
 TRN2_z		00000101 .. 1 ..... 011 101 ..... .....		@rd_rn_rm
 
+### SVE Permute - Predicated Group
+
+# SVE compress active elements
+# Note esz >= 2
+COMPACT		00000101 .. 100001 100 ... ..... .....		@rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

