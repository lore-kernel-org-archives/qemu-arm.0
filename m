Received: by 10.28.71.27 with SMTP id u27csp2083355wma;
        Sat, 17 Feb 2018 10:42:18 -0800 (PST)
X-Google-Smtp-Source: AH8x226SUufNTJF7b2lf+Afv5C9TNGiRn30iT28jG5mBT8C3HYSeR0zZ5jy0odu47nuMUgT21NGx
X-Received: by 10.37.92.196 with SMTP id q187mr7141117ybb.214.1518892938562;
        Sat, 17 Feb 2018 10:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892938; cv=none;
        d=google.com; s=arc-20160816;
        b=wMeKuNr6SGw0ASvSxZeZWS++2g5kz3159GgQ78y/6+Nudx2hF92XWfJPfd6afsK0Op
         tfHltuOo2TgsZntCLNJ2zT5OnN+/YFkT67W31moPwkSbnTmblW8MmWwmlKqfE4vSzRlC
         mJuc1uo4kNh3hV9aYFmVzB/v731Bd4B3QJDWMY4jjiQmv6NT1ToSld98+BvHqkjqCtOE
         sNX8EYHANOgADze265UW/2paC55MJDVQsIbM6KlZMcYVmL3XUuJV/kNPhEz+oQ3huCBr
         y6v+S8/LyzplZyvn4srzbMSx/Mu/V8nRWtbCZYqVBEqvmeN6yciZQJkn8aMlYjXPWnPQ
         yxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qUivDrBs/deC0vPF+CXEPEAAPcV9POzH7MV2Tc4RKIU=;
        b=Ahn8/7MWFm7/FDQ5mJuhvVxD6Scda//mhfkrvmkDXQGhTalKPzzqzgHZnlAjG30F9j
         1VkdKJ++pypj3cYeBOkGjhwxFR4P59u9Zrt7zIX/WgIz1u/p31b4Xxm+hWqNonhEccbF
         wJjHRZmZF1G0sV3DIwQ9e0s9wKVWaNAiunRhle1alUyNlOFl5NLgP3VA58L8ZdW6tGSx
         3TG/eWicobAJnDRtN/KLHf/c9jFKs72LMytpbezJ8HyLbSZlwOl6o2pbuVC08ztIyT0o
         FKexY6lS5+zkXtBYM8z2U0GOkJFks6DiHfqhUqbQlh5Ce6JputWjqNV5rAR1qNGMfeL3
         WEXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FjCGSzOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si1835681ywc.35.2018.02.17.10.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:42:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FjCGSzOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7RB-0006lp-QY
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:42:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79V-0000cH-Nv
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79U-0001hY-Hj
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:01 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:47051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79U-0001hC-AC
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:00 -0500
Received: by mail-pf0-x242.google.com with SMTP id z24so587774pfh.13
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qUivDrBs/deC0vPF+CXEPEAAPcV9POzH7MV2Tc4RKIU=;
	b=FjCGSzOrl59WAmxuTF3fp9cSnWOvbvUgfkBEWUwBwkG9lu8QMIiknQeTGNI/UBvJL3
	2MoyEOQphAC3KlOTqLXCYkJhLwyiVlZ7vMcC8trb2Wb3jChCrAP4w2TefmACPQ5aSrTK
	4bZvwBG+audRb0NOqQmMDYm/3BdsDWDcLoQsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qUivDrBs/deC0vPF+CXEPEAAPcV9POzH7MV2Tc4RKIU=;
	b=gK/YjL0hgmrrgBBAEtg/NpGcmc/dkyrjJgSVg+pIvBX7grSJNj23q22jUvfRnbTuFd
	umdnBA3V3xmrRMFj2/K5OQqEo/Gu3i3C3joV8ZAzAEE0ol38I6cQ2fOppWXuZNAHJmAA
	FoaH0z64Q+tL2B8oT8hcBGKMtLmpDR2wEC6zqfQq5ut42zRfXw9J07ads8qQsqdSFnQP
	TXqj9TIrKSsWQyM9kJn5PKDMpG1Gp2O1MvKYtxgWgD6U8+GKplC03L8MjtswlgvB2tTc
	kocV7R4q6Yk7PKQDMOPkqHepv3m0TJpi0RR+hRbr1fMm1y+ZZmrwpapmFK2KUKKquYWN
	/bYQ==
X-Gm-Message-State: APf1xPBL7a/9GWy0Veotn08R0IhFujPjsGr6n+FYv6Er1672nVVP+FO1
	kScQqSn7i+K8A7zeswTXLIDUqClNEpQ=
X-Received: by 10.98.196.199 with SMTP id h68mr1212317pfk.42.1518891839009;
	Sat, 17 Feb 2018 10:23:59 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:36 -0800
Message-Id: <20180217182323.25885-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v2 20/67] target/arm: Implement SVE Compute
 Vector Address Group
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tIN9GzQshGpc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 33 +++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 00e3cd48bb..5280d375f9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -380,6 +380,11 @@ DEF_HELPER_FLAGS_4(sve_lsl_zzw_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_lsl_zzw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_lsl_zzw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_adr_p32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_p64, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_s32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_u32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4c6e2713fa..a290a58c02 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1061,3 +1061,43 @@ void HELPER(sve_index_d)(void *vd, uint64_t start,
         d[i] = start + i * incr;
     }
 }
+
+void HELPER(sve_adr_p32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t sh = simd_data(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + (m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_p64)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + (m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_s32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + ((uint64_t)(int32_t)m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_u32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + ((uint64_t)(uint32_t)m[i] << sh);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43e9f1ad08..34cc8c2773 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -847,6 +847,39 @@ static void trans_RDVL(DisasContext *s, arg_RDVL *a, uint32_t insn)
     tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
 }
 
+/*
+ *** SVE Compute Vector Address Group
+ */
+
+static void do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, a->imm, fn);
+}
+
+static void trans_ADR_p32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_p32);
+}
+
+static void trans_ADR_p64(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_p64);
+}
+
+static void trans_ADR_s32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_s32);
+}
+
+static void trans_ADR_u32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_u32);
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f71ea1b60d..6ec1f94832 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -49,6 +49,7 @@
 
 &rr_esz		rd rn esz
 &rri		rd rn imm
+&rrri		rd rn rm imm
 &rri_esz	rd rn imm esz
 &rrr_esz	rd rn rm esz
 &rpr_esz	rd pg rn esz
@@ -77,6 +78,9 @@
 # Three operand, vector element size
 @rd_rn_rm	........ esz:2 . rm:5  ... ...  rn:5 rd:5	&rrr_esz
 
+# Three operand with "memory" size, aka immediate left shift
+@rd_rn_msz_rm	........ ... rm:5 .... imm:2 rn:5 rd:5		&rrri
+
 # Two register operand, with governing predicate, vector element size
 @rdn_pg_rm	........ esz:2 ... ... ... pg:3 rm:5 rd:5 \
 		&rprr_esz rn=%reg_movprfx
@@ -278,6 +282,14 @@ ASR_zzw		00000100 .. 1 ..... 1000 00 ..... .....		@rd_rn_rm
 LSR_zzw		00000100 .. 1 ..... 1000 01 ..... .....		@rd_rn_rm
 LSL_zzw		00000100 .. 1 ..... 1000 11 ..... .....		@rd_rn_rm
 
+### SVE Compute Vector Address Group
+
+# SVE vector address generation
+ADR_s32		00000100 00 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_u32		00000100 01 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_p32		00000100 10 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_p64		00000100 11 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

