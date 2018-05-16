Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp208865wme;
        Wed, 16 May 2018 15:41:39 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr08bwLH6xZ3MbxjGQcm8djke0u3XGbTevFl/lZvlG8g1eJASz2kZw31zc5XahBgFh4vauI
X-Received: by 2002:a37:1f44:: with SMTP id f65-v6mr2709974qkf.423.1526510499094;
        Wed, 16 May 2018 15:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510499; cv=none;
        d=google.com; s=arc-20160816;
        b=O9DvcdLzyaxYHA5b0CLZp2gU5fBthKnqW12UWRPOjfFJOLqt2FRj94LdPgIlL93lzd
         w0/oMlji10aeQvgLRuzceYGwfV/+BEewJnFtbQwZOaYwIlXCt16qeYr6SLuwPOeWziFG
         uo2UWgsFRXPJu98MutAJmA78QReVO1m0/ZA+ocbzo+Z1jz4Ay9LrXxkxU1ewukuw/ZBz
         hZZgipZiyzXjUhKAncWrZgOeI1gCalEqDBX8qunT18gT9fqcjI7PJnArFyP3L97EfdeP
         3FglwUwHkFadneGfxpDsuYjzsc52xf3WGNg7NDFUFj0Hdby9khc7OuC7qsaR1g/oTKHE
         pNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k3EXmj1zgibPmaPAluYYBePwXnlNWmp/AhopEEu/1oQ=;
        b=wVsNKo/PixdNipOsA48VqJXNqrMFAf4nFkvAyNH9/t8q4X1t6+Vl4JJVG4UrhxgCTc
         xjoi/cO4pxsvU6vGM9f3Cls0Iovj4qpuI8PCunLcUF88+IWOtHeRapJwXR3eMegjww6i
         pUlvE56VZnGa9kngwcjc6zgRxNOSV+oUO3CX/pyYW23WZJJp1uQBUslf2aMKZbeMsbbD
         G12TpQqxH1835y9IZDxzu0Qz7eXgQnvWERc16MtFuv4xs/fRfA9yekiyXOLK4bZLXuAQ
         O1HmBSZPqBju3CxDowKafTZMN00068U6TeNe06kDiEmbwSpopF6nAkLV/MPPWvIhINbd
         z1tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BaqDzAeL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c37-v6si2062817qta.384.2018.05.16.15.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BaqDzAeL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ574-0007wL-JJ
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:41:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wT-0007sq-LV
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wQ-0007br-Cb
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:41 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:33916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wP-0007b0-Nk
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:38 -0400
Received: by mail-pf0-x235.google.com with SMTP id a14-v6so1058360pfi.1
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k3EXmj1zgibPmaPAluYYBePwXnlNWmp/AhopEEu/1oQ=;
	b=BaqDzAeLSpS02V6np8+xyHnl0OODiL8F/Sl4lyUXgTmwcsQCkIJmhAzF4s+pU4o24P
	X+Vao/TuMMx4fWDjiASv3I0b4u0wioV+0Gi1Emkgz+qXRAXTq7hdVjGmZLMZAHXpzzmG
	D2nWM67ubD6T7PLsHg93mvjTXZN9MYgyVXj5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k3EXmj1zgibPmaPAluYYBePwXnlNWmp/AhopEEu/1oQ=;
	b=J8P5LwYmhgnuTl6ynj6HSOVrhpsm3W+z15bPhiBvh5bR/8eJivlfr4OFEuQG0kbYx7
	c1PCosdvDViYpNrvGNED23RuL73opj7XZaV4S1UPI24oDk9jtLZRBJMeaqBzL1muYzrR
	P8GhIH5KWD7cfDIYkpw/xcmd40Fa+nXxu+Ntx5BYeXcAZIJSLMnrzxvf3kc/UqLxLWCy
	FOfLhhy0s9QGmL0bOY11jI8kgm/u+xUUGA3G8DVtmSPxXS9rcLKi3wOCLkfgiLV9Z2hQ
	L+v9grT1Nsd5iQsXIz/CXsBgIVlbISWWEcJbSKoc9K1T54sYrg6nOIZbCoXKRjCfM5jx
	uQFA==
X-Gm-Message-State: ALKqPwd/kDWUgjaA4NzHW898nNYcPCHXwkczMUp+J71sCrdd2lTuvwjk
	HZEFsKb/KxV+/wWmYeljVO1KpQ==
X-Received: by 2002:a65:648a:: with SMTP id
	e10-v6mr2187782pgv.34.1526509836652; 
	Wed, 16 May 2018 15:30:36 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:59 -0700
Message-Id: <20180516223007.10256-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: [Qemu-arm] [PATCH v3-a 19/27] target/arm: Implement SVE Compute
 Vector Address Group
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
X-TUID: R/h9HsiJgiBj

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 4 files changed, 93 insertions(+)

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
index f43640c1eb..7fa8394aec 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1062,3 +1062,43 @@ void HELPER(sve_index_d)(void *vd, uint64_t start,
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
index 2c2218bc31..8924848463 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -893,6 +893,42 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Compute Vector Address Group
+ */
+
+static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
+{
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->imm, fn);
+    }
+    return true;
+}
+
+static bool trans_ADR_p32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    return do_adr(s, a, gen_helper_sve_adr_p32);
+}
+
+static bool trans_ADR_p64(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    return do_adr(s, a, gen_helper_sve_adr_p64);
+}
+
+static bool trans_ADR_s32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    return do_adr(s, a, gen_helper_sve_adr_s32);
+}
+
+static bool trans_ADR_u32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    return do_adr(s, a, gen_helper_sve_adr_u32);
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b24f6b2f1b..691876de4e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -48,6 +48,7 @@
 
 &rr_esz         rd rn esz
 &rri            rd rn imm
+&rrri           rd rn rm imm
 &rri_esz        rd rn imm esz
 &rrr_esz        rd rn rm esz
 &rpr_esz        rd pg rn esz
@@ -75,6 +76,9 @@
 # Three operand, vector element size
 @rd_rn_rm       ........ esz:2 . rm:5 ... ... rn:5 rd:5         &rrr_esz
 
+# Three operand with "memory" size, aka immediate left shift
+@rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
+
 # Two register operand, with governing predicate, vector element size
 @rdn_pg_rm      ........ esz:2 ... ... ... pg:3 rm:5 rd:5 \
                 &rprr_esz rn=%reg_movprfx
@@ -276,6 +280,14 @@ ASR_zzw         00000100 .. 1 ..... 1000 00 ..... .....         @rd_rn_rm
 LSR_zzw         00000100 .. 1 ..... 1000 01 ..... .....         @rd_rn_rm
 LSL_zzw         00000100 .. 1 ..... 1000 11 ..... .....         @rd_rn_rm
 
+### SVE Compute Vector Address Group
+
+# SVE vector address generation
+ADR_s32         00000100 00 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
+ADR_u32         00000100 01 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
+ADR_p32         00000100 10 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
+ADR_p64         00000100 11 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

