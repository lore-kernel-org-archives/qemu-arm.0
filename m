Received: by 10.28.71.27 with SMTP id u27csp2084217wma;
        Sat, 17 Feb 2018 10:43:40 -0800 (PST)
X-Google-Smtp-Source: AH8x226e6ZMxsn2CE/5aXjEOPaFJLRi9RJTA3NprO2qI1mxgwyA511+CfiD5SQjAGWXLt08fjfz4
X-Received: by 10.129.48.195 with SMTP id w186mr6152027yww.325.1518893020725;
        Sat, 17 Feb 2018 10:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893020; cv=none;
        d=google.com; s=arc-20160816;
        b=yafZzNzHCK/6EP2OkG98MhiOcmHEVm5BO455ddik9f9nbgNhKIErJ54OeKsRcy7lZO
         tfg6w4FqqOEqHCxAxfNpMo48pcJeVbUVA0CvsHTQrqyTAJIZAQ25EZOn+yRJkiw6hygk
         OHSJG1/+B0x6xv9T4otGLt/1qKuAngz56H9DtHuiY3ihqhKjRltW0rWCPzESV+tmqNLO
         jya3z9FuQdIGvWVX2tM1q6661rWXSc2KKCUcRNa5nJxaZPJ7i06jLXCo+AQ0CtB+QDDQ
         abJKdhiZ5f/dW+yvoFZXMBYKmN2YCgsXCTqeIXFBZfQSu4npLe5HBqr5pFw9C7KCcJGh
         qm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DwIEfXE8CNgM0TRpz0r+ylrsP3Cl/uBo6B2EBJ/28wM=;
        b=PV/K+QG4uxjji+KDCB+vcDfrMHlVJ4YbwsZQHt1z50GTg7mo0k5FdD3ilovVsewCPO
         Tv961P9kmUQfW1YxokuHWaIwreZyo9Q5thpnVjCQ9h1X21OFDM7kOa6aOsutWCxkan3G
         jcJaRwT1RGyeF4fESvxMS/OPQRe6twVVpIJ57vexqkD3eJ+sBIz/7eDVwvX+l5OcTxfM
         JDFwxNwOtJOYjkK+MHeYLSjAz0RfMhLSTqLLYuylmm9NIdaZ17M6axYd6zQBgaZgHehE
         oi5T4M+YT6PTwiNcCen8nPCg3oNp9d0c1xFUHZobSfQqQRNyz9EhBQ/eXIpiFMsiTqZk
         0Pfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jhabaLD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n72si329620yba.283.2018.02.17.10.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jhabaLD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7SW-0008Ut-4N
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:43:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79e-0000mB-Pr
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79d-0001me-FF
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:10 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:37014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79d-0001mC-6T
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:09 -0500
Received: by mail-pl0-x242.google.com with SMTP id ay8so3442817plb.4
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DwIEfXE8CNgM0TRpz0r+ylrsP3Cl/uBo6B2EBJ/28wM=;
	b=jhabaLD67l4OK/+vLYeFc4Wb2gL/RzzTtyf+eul8Ai1bKqBT3RoGsh1oACmODiXAPU
	NsFiVErzTnhKkC4qcJyIuOgXoGCGaVDLgv75N6ZXQZ0qMRnb8fI/Ofkpucd/gFXRL7VO
	egXLF3Iyy5g0QLZDVCMqUvTFv6xNsi82BgPII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DwIEfXE8CNgM0TRpz0r+ylrsP3Cl/uBo6B2EBJ/28wM=;
	b=ehbCJ1B4ZhAWsVobGe1kXxIz2FhRpwAn3WQkRbZ3HUmWA/LG2OO/w78px84YsC2cvI
	hBSH3Y4vQw9DfAfHIt7z38m7F0lT9m+7VY64Ax7MwJP2nkhS3CIPaAZcAc6ih+DAKYDX
	OL8mByRFhxSKrPWBw6YW/KBgzTe30pmDY/tZFx6Q0tKB4lr8CATr/yyMPoyEt7V1ChMI
	AFOeTHUmW27U5A1NHe0x6/0OpZJBb3I5c+IKaG9K0rPRPksHnyXuDbv+HYTIr6n8fhxZ
	zT+Bq9va5DyVMiv7XjJCivCckcMuPzG32uhQQBwbe93pCVNfxVmRp5WjBmi2wjck/wMD
	MH/g==
X-Gm-Message-State: APf1xPD7LBtig1Xajudrv0k/G6doYIwKxC1uLlE4XjtYFwopty3EvJFF
	pHm9jnxCHjBX79LgjCNy3aIELV0FMgw=
X-Received: by 2002:a17:902:42c3:: with SMTP id
	h61-v6mr9349488pld.269.1518891848270; 
	Sat, 17 Feb 2018 10:24:08 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:42 -0800
Message-Id: <20180217182323.25885-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 26/67] target/arm: Implement SVE Permute -
 Extract Group
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
X-TUID: Oab/sZkbw0VH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve_helper.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 29 +++++++++++++++++
 target/arm/sve.decode      |  9 +++++-
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 79493ab647..94f4356ce9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -414,6 +414,8 @@ DEF_HELPER_FLAGS_4(sve_cpy_z_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_cpy_z_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_cpy_z_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
+DEF_HELPER_FLAGS_4(sve_ext, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6a95d1ec48..fb3f54300b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1469,3 +1469,84 @@ void HELPER(sve_cpy_z_d)(void *vd, void *vg, uint64_t val, uint32_t desc)
         d[i] = (pg[H1(i)] & 1 ? val : 0);
     }
 }
+
+/* Big-endian hosts need to frob the byte indicies.  If the copy
+ * happens to be 8-byte aligned, then no frobbing necessary.
+ */
+static void swap_memmove(void *vd, void *vs, size_t n)
+{
+    uintptr_t d = (uintptr_t)vd;
+    uintptr_t s = (uintptr_t)vs;
+    uintptr_t o = (d | s | n) & 7;
+    size_t i;
+
+#ifndef HOST_WORDS_BIGENDIAN
+    o = 0;
+#endif
+    switch (o) {
+    case 0:
+        memmove(vd, vs, n);
+        break;
+
+    case 4:
+        if (d < s || d >= s + n) {
+            for (i = 0; i < n; i += 4) {
+                *(uint32_t *)H1_4(d + i) = *(uint32_t *)H1_4(s + i);
+            }
+        } else {
+            for (i = n; i > 0; ) {
+                i -= 4;
+                *(uint32_t *)H1_4(d + i) = *(uint32_t *)H1_4(s + i);
+            }
+        }
+        break;
+
+    case 2:
+    case 6:
+        if (d < s || d >= s + n) {
+            for (i = 0; i < n; i += 2) {
+                *(uint16_t *)H1_2(d + i) = *(uint16_t *)H1_2(s + i);
+            }
+        } else {
+            for (i = n; i > 0; ) {
+                i -= 2;
+                *(uint16_t *)H1_2(d + i) = *(uint16_t *)H1_2(s + i);
+            }
+        }
+        break;
+
+    default:
+        if (d < s || d >= s + n) {
+            for (i = 0; i < n; i++) {
+                *(uint8_t *)H1(d + i) = *(uint8_t *)H1(s + i);
+            }
+        } else {
+            for (i = n; i > 0; ) {
+                i -= 1;
+                *(uint8_t *)H1(d + i) = *(uint8_t *)H1(s + i);
+            }
+        }
+        break;
+    }
+}
+
+void HELPER(sve_ext)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    size_t n_ofs = simd_data(desc);
+    size_t n_siz = opr_sz - n_ofs;
+
+    if (vd != vm) {
+        swap_memmove(vd, vn + n_ofs, n_siz);
+        swap_memmove(vd + n_siz, vm, n_ofs);
+    } else if (vd != vn) {
+        swap_memmove(vd + n_siz, vd, n_ofs);
+        swap_memmove(vd, vn + n_ofs, n_siz);
+    } else {
+        /* vd == vn == vm.  Need temp space.  */
+        ARMVectorReg tmp;
+        swap_memmove(&tmp, vm, n_ofs);
+        swap_memmove(vd, vd + n_ofs, n_siz);
+        memcpy(vd + n_siz, &tmp, n_ofs);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dd085b084b..07a5eac092 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1790,6 +1790,35 @@ static void trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a, uint32_t insn)
     tcg_temp_free_i64(t_imm);
 }
 
+/*
+ *** SVE Permute Extract Group
+ */
+
+static void trans_EXT(DisasContext *s, arg_EXT *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned n_ofs = a->imm >= vsz ? 0 : a->imm;
+    unsigned n_siz = vsz - n_ofs;
+    unsigned d = vec_full_reg_offset(s, a->rd);
+    unsigned n = vec_full_reg_offset(s, a->rn);
+    unsigned m = vec_full_reg_offset(s, a->rm);
+
+    /* Use host vector move insns if we have appropriate sizes
+       and no unfortunate overlap.  */
+    if (m != d
+        && n_ofs == size_for_gvec(n_ofs)
+        && n_siz == size_for_gvec(n_siz)
+        && (d != n || n_siz <= n_ofs)) {
+        tcg_gen_gvec_mov(0, d, n + n_ofs, n_siz, n_siz);
+        if (n_ofs != 0) {
+            tcg_gen_gvec_mov(0, d + n_siz, m, n_ofs, n_ofs);
+        }
+        return;
+    }
+
+    tcg_gen_gvec_3_ool(d, n, m, vsz, vsz, n_ofs, gen_helper_sve_ext);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e6e10a4f84..5e3a9839d4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -22,8 +22,9 @@
 ###########################################################################
 # Named fields.  These are primarily for disjoint fields.
 
-%imm4_16_p1             16:4 !function=plus1
+%imm4_16_p1	16:4 !function=plus1
 %imm6_22_5	22:1 5:5
+%imm8_16_10	16:5 10:3
 %imm9_16_10	16:s6 10:3
 %preg4_5	5:4
 
@@ -363,6 +364,12 @@ FCPY		00000101 .. 01 .... 110 imm:8 .....		@rdn_pg4
 CPY_m_i		00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 CPY_z_i		00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 
+### SVE Permute - Extract Group
+
+# SVE extract vector (immediate offset)
+EXT		00000101 001 ..... 000 ... rm:5 rd:5 \
+		&rrri rn=%reg_movprfx imm=%imm8_16_10
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

