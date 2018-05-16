Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp215169wme;
        Wed, 16 May 2018 15:50:35 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpavK/Mf6+cRe/9T32Q5xsxqQ6e9Nzj4QDwLdEjPigkoVXOMF+UqsMNpGyUhYPOBPKasaHg
X-Received: by 2002:a37:cf55:: with SMTP id e82-v6mr2928292qkj.193.1526511035289;
        Wed, 16 May 2018 15:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526511035; cv=none;
        d=google.com; s=arc-20160816;
        b=RKlmE8v4zjhZrDxZcF4MP3dsQWYVqDZJJ5mV/PG9smkQb8x2j5BOC7ZisltXpuAFmF
         QhLolWTv+zDGaE7zx9jAx/VcxCKwdsu7l+PGdGCTx9nb9k6lR5GeOpxYSghZcXdh2KOZ
         nmhecP5vuUqzaQhT0m11WAWGzOGE8VyIotYfMtS7OOyrNbsT1mUYoGCo1n0GNCLtws2U
         E6SDw+jbPcS0p7XB5fUNmOF9843G4XXQqxLYEhDd6R3UC+kcPYMgy5OSyM14bZmd//C4
         h8+HpfvRMCMyJk1kYcxRjbelT/zZzu9apKAkCili8w8LzJ1igKyE6jw5FPUqJYXz6SMA
         vsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=urvFqiQxPp3CQoQc6xCxWJ/+pIBwOhdS02gT2zu4FKc=;
        b=FqtiX9EWIjfxfO8Xi2Wne+48l7AnJzVedZBcX7Kl/27O35ge69xb4H/w9xIY4a989E
         4ghpkinG/6v+MoS8q/dJ86nydXj8UQ7NoPlUi7YzcS8K++KD5mkTDBCq/a065V7tfnh6
         RzOEE/hYnctm0kKjKCJJlwlR5i+6o2t1Fy/mwpqJQW5lsOOHHH4kHaooErXAj+JOkZia
         t0h9fT3mHCju0HWTw2UHfZXn2wmdJxFD6afl/FsmePhncr2mtrIlfPEmrYtmOgr+vSOm
         g5wbpKQNGVGMzAwTPdp5i3gWdFo55z1UPNIpKKXEgTWGZromyxALFU1GTTVfSj3h1A7t
         NZaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6dTbGC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8-v6si3443087qvi.109.2018.05.16.15.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6dTbGC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ5Fi-000766-PC
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:50:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wN-0007mf-Sp
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wM-0007XX-2v
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:35 -0400
Received: from mail-pl0-x232.google.com ([2607:f8b0:400e:c01::232]:36197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wL-0007Ws-Oi
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:33 -0400
Received: by mail-pl0-x232.google.com with SMTP id v24-v6so1252995plo.3
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=urvFqiQxPp3CQoQc6xCxWJ/+pIBwOhdS02gT2zu4FKc=;
	b=P6dTbGC9/seefUR+7fEvgxfY8EABBhYXsJAYos+ykSDd5srrfmvq1LzWkgqW3RBUZi
	2QSa8CyiUNAOnutqlelOAe0sm869NC/zpOSa7Uf2V8IEPo2RR7q1byDvDrQqLuYT0EM9
	28zP8ZKef2bbxmIGxejhaXB+QCgANZSHFtPm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=urvFqiQxPp3CQoQc6xCxWJ/+pIBwOhdS02gT2zu4FKc=;
	b=oJ7BV0uoXKveVxqFbL91og6A94/fpOAPDQIo6B6H9Ajcer1+tUDbj9X6SFIDeFgunP
	7A7Sh9UfeSGJmErKgyIAuP7RAk5egN3aQXHACMXiOG1IcUpoFTu4EO++O/QK6RoKh0ET
	HVkecPsWmbr2zap8n8flYDfSgVaVWZc4uvTYJCB1mgnhV7GBbX5BqSTt7rtMP3elvvKI
	x7eUXGHdUHofZisNG9593w+8yKgtAEHHjktYGUYellG1fMa9/SWsMhnPL5SLIG2Vc0cl
	OGuSsEg4/0xNZGMwIR1Faa93Nb9fmi7eJslorBB52qoTEv2/XWpPdZzzg9rUjwIKHQ7n
	w9mw==
X-Gm-Message-State: ALKqPwdfQUEZM5b1PVUMr5hCa1VII6S12xss6vDcz1w/zaqsz8sAQP64
	Y9/VWDx+jCxWeMQfEOrugDUy1Q==
X-Received: by 2002:a17:902:26:: with SMTP id
	35-v6mr2834857pla.104.1526509832695; 
	Wed, 16 May 2018 15:30:32 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:56 -0700
Message-Id: <20180516223007.10256-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::232
Subject: [Qemu-arm] [PATCH v3-a 16/27] target/arm: Implement SVE Index
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8wswVZOx8PeU

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++
 target/arm/sve_helper.c    | 40 +++++++++++++++++++
 target/arm/translate-sve.c | 79 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 14 +++++++
 4 files changed, 138 insertions(+)

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
index 56a4eb71d5..385bb8b314 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -992,3 +992,43 @@ DO_ZPZZZ_D(sve_mls_d, uint64_t, DO_MLS)
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
index d9c4118d46..e3a8e9506e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -702,6 +702,85 @@ DO_ZPZZZ(MLS, mls)
 
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
+static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 start = tcg_const_i64(a->imm1);
+        TCGv_i64 incr = tcg_const_i64(a->imm2);
+        do_index(s, a->esz, a->rd, start, incr);
+        tcg_temp_free_i64(start);
+        tcg_temp_free_i64(incr);
+    }
+    return true;
+}
+
+static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 start = tcg_const_i64(a->imm);
+        TCGv_i64 incr = cpu_reg(s, a->rm);
+        do_index(s, a->esz, a->rd, start, incr);
+        tcg_temp_free_i64(start);
+    }
+    return true;
+}
+
+static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 start = cpu_reg(s, a->rn);
+        TCGv_i64 incr = tcg_const_i64(a->imm);
+        do_index(s, a->esz, a->rd, start, incr);
+        tcg_temp_free_i64(incr);
+    }
+    return true;
+}
+
+static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 start = cpu_reg(s, a->rn);
+        TCGv_i64 incr = cpu_reg(s, a->rm);
+        do_index(s, a->esz, a->rd, start, incr);
+    }
+    return true;
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 58d59c7b77..4f9f64f5ab 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -224,6 +224,20 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+### SVE Index Generation Group
+
+# SVE index generation (immediate start, immediate increment)
+INDEX_ii        00000100 esz:2 1 imm2:s5 010000 imm1:s5 rd:5
+
+# SVE index generation (immediate start, register increment)
+INDEX_ir        00000100 esz:2 1 rm:5 010010 imm:s5 rd:5
+
+# SVE index generation (register start, immediate increment)
+INDEX_ri        00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
+
+# SVE index generation (register start, register increment)
+INDEX_rr        00000100 .. 1 ..... 010011 ..... .....          @rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

