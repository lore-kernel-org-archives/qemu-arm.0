Received: by 10.28.71.27 with SMTP id u27csp2081549wma;
        Sat, 17 Feb 2018 10:39:38 -0800 (PST)
X-Google-Smtp-Source: AH8x225ODNeji0UQyUnE6idr+dRuKDpgXNnasuby4OvR8NL3Odns/6TsSTOTCV2q0LWtSdHQg3dx
X-Received: by 10.37.73.70 with SMTP id w67mr7371446yba.178.1518892778765;
        Sat, 17 Feb 2018 10:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892778; cv=none;
        d=google.com; s=arc-20160816;
        b=OCiQAlG5sDuac68obOVikGtOwWl02O+LTdDbmHmxa58EPbIIqol8zsdJUnztxxXKGp
         urcRRNKOkmhNKaK4fl1VJn5t3gYKE5r7S/DxpaJz30infy3o9PSk7ljA3+EnU27ig1V+
         0P9wB3TiaFzpX72O5xrKclytYgrIB1XKF7RxHR+hPlM4daiJESTieKqipZnQBCM0CzUl
         A9mXMjUo3lYIDRsILTxYJ53VLYBW1zs02nIQkZ0Va/NLu0OzLiqLV5Di6yuFZ1fLP0NG
         +ucK/RzOcXtmZ8fPep/6KgW9ytMfEc92X2HRnub/P2X8m/3qBgy8MgPby0MZDpacNTQT
         bonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=STsmc4QHRnZfTt7wI7/HBaUPP3ioNeLwXu1h7b1S+p8=;
        b=gYHdUoufijIJ6siFEC3CQgbLaz7ZZ0R7dq7ohhoKCLTzc647CePnreYtKSjajMxmU6
         C3HyXkW0ALHf7ykHIxuEr517YVjlCLmIsoqDUkDo5Atlapn4056UQwwGjlzxakFCJTXL
         g1gpyAsDJiXaKzv8CYyjrUIrYfKOgQm4zdtspDqxcOHsThoyQ2WFZIPO9AyLmR++am2N
         dMrSTQpBUCujang1Zvh8DlfqwkwFfwBjYD3nWm+tLPObE5Rmm+AehPXk/KReJhOk++/7
         xvVyK4GfwY2wliGS6yyOEajhXslqmjYtY+e+9i1K2X73waYUM2xs8LcDM39S9jh6yHc2
         eEzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hn1ZBSBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si275807ywb.708.2018.02.17.10.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hn1ZBSBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Oc-0005C3-2l
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:39:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79S-0000ab-Ir
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79P-0001eu-K1
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:58 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79P-0001ef-B1
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:55 -0500
Received: by mail-pl0-x241.google.com with SMTP id g18so3435125plo.7
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=STsmc4QHRnZfTt7wI7/HBaUPP3ioNeLwXu1h7b1S+p8=;
	b=hn1ZBSBu3dRtay/gpG4FfhIwDAwA1h0GdGOtLoITHFW+FmfwRPEhJrj3ezAM/ngfpF
	tQ7+P4vMkwgfVF2Ri9cg+4sFTQfXfit88ESvQABOC4oZwv7gJqZcuKOaUuNRtpzuRaZp
	jNzlDSGw39sU2xZMukOQ9k8ZMzhC9vy5WzdtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=STsmc4QHRnZfTt7wI7/HBaUPP3ioNeLwXu1h7b1S+p8=;
	b=KqQU4KpJTCmYhwATtPUwBOFvlnMP2I1O4HxA9OmkQQQJPWOYsUlEQZ3VARXsz58C8n
	mu5g7RhzUGUNsYwcSt10ey4mQ38QTQQYSTGnc+7eDERRcipWOZGKH5qa2xGRd9vbTq++
	2bewHE4UKbhYIZx+m7GtTkWKvVWpTheGLrSPB5WB/R4qTB93h3eruwK9lFBr9LiP+Rd8
	XyzVYUgkk9q7IW7PrnyIUjhf/4PITNlNxIct+gxTEA4eABJ0OTeHSZ9YxJBT0U0Qx6om
	rxpj7cZFDbP5zn2Z911Cwf/z3VMau9AmpiWEh3lqyvBQwANlogu7DRgZRo6uKrk7pgL5
	y+Uw==
X-Gm-Message-State: APf1xPD64CqVc710DB4XmXiBQVokGiRo5kkMm4TblGMr/W1aUEegyw2Z
	fJ0lBKFwdmHpfqtpKQGJdT/lvXoT9mw=
X-Received: by 2002:a17:902:33a5:: with SMTP id
	b34-v6mr2253184plc.263.1518891834489; 
	Sat, 17 Feb 2018 10:23:54 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:33 -0800
Message-Id: <20180217182323.25885-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v2 17/67] target/arm: Implement SVE Index
 Generation Group
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
X-TUID: p7mnvDml/Tsd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 ++++
 target/arm/sve_helper.c    | 40 +++++++++++++++++++++++++++
 target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 14 ++++++++++
 4 files changed, 126 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b31d497f31..2a2dbe98dd 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -363,6 +363,11 @@ DEF_HELPER_FLAGS_6(sve_mls_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_mls_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_index_b, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_h, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_s, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_d, TCG_CALL_NO_RWG, void, ptr, i64, i64, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b08a38ce8..950012e70a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -991,3 +991,43 @@ DO_ZPZZZ_D(sve_mls_d, uint64_t, DO_MLS)
 #undef DO_MLS
 #undef DO_ZPZZZ
 #undef DO_ZPZZZ_D
+
+void HELPER(sve_index_b)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H1(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_h)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H2(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_s)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H4(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_d)(void *vd, uint64_t start,
+                         uint64_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = start + i * incr;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8baec6c674..773f0bfded 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -675,6 +675,73 @@ DO_ZPZZZ(MLS, mls)
 
 #undef DO_ZPZZZ
 
+/*
+ *** SVE Index Generation Group
+ */
+
+static void do_index(DisasContext *s, int esz, int rd,
+                     TCGv_i64 start, TCGv_i64 incr)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_ptr t_zd = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
+    if (esz == 3) {
+        gen_helper_sve_index_d(t_zd, start, incr, desc);
+    } else {
+        typedef void index_fn(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+        static index_fn * const fns[3] = {
+            gen_helper_sve_index_b,
+            gen_helper_sve_index_h,
+            gen_helper_sve_index_s,
+        };
+        TCGv_i32 s32 = tcg_temp_new_i32();
+        TCGv_i32 i32 = tcg_temp_new_i32();
+
+        tcg_gen_extrl_i64_i32(s32, start);
+        tcg_gen_extrl_i64_i32(i32, incr);
+        fns[esz](t_zd, s32, i32, desc);
+
+        tcg_temp_free_i32(s32);
+        tcg_temp_free_i32(i32);
+    }
+    tcg_temp_free_ptr(t_zd);
+    tcg_temp_free_i32(desc);
+}
+
+static void trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a, uint32_t insn)
+{
+    TCGv_i64 start = tcg_const_i64(a->imm1);
+    TCGv_i64 incr = tcg_const_i64(a->imm2);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(start);
+    tcg_temp_free_i64(incr);
+}
+
+static void trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a, uint32_t insn)
+{
+    TCGv_i64 start = tcg_const_i64(a->imm);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(start);
+}
+
+static void trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a, uint32_t insn)
+{
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = tcg_const_i64(a->imm);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(incr);
+}
+
+static void trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
+{
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    do_index(s, a->esz, a->rd, start, incr);
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b40d7dc9a2..d7b078e92f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -226,6 +226,20 @@ ORR_zzz		00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 EOR_zzz		00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 BIC_zzz		00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 
+### SVE Index Generation Group
+
+# SVE index generation (immediate start, immediate increment)
+INDEX_ii	00000100 esz:2 1 imm2:s5 010000 imm1:s5 rd:5
+
+# SVE index generation (immediate start, register increment)
+INDEX_ir	00000100 esz:2 1 rm:5 010010 imm:s5 rd:5
+
+# SVE index generation (register start, immediate increment)
+INDEX_ri	00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
+
+# SVE index generation (register start, register increment)
+INDEX_rr	00000100 .. 1 ..... 010011 ..... .....		@rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

