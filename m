Received: by 10.28.71.27 with SMTP id u27csp2073809wma;
        Sat, 17 Feb 2018 10:29:20 -0800 (PST)
X-Google-Smtp-Source: AH8x226ecBbOqjlzycCida5wqDgQ+B7SAzPv5q07IZowoKyN+mqC4UpQBrOBlq87TGgUqFoxXDZ5
X-Received: by 10.129.178.129 with SMTP id q123mr7475823ywh.27.1518892160722;
        Sat, 17 Feb 2018 10:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892160; cv=none;
        d=google.com; s=arc-20160816;
        b=tvvJpPNQ76xhCMCFFYpVJSZXNavZuc9x2MF9y1KxmBouLmRzbCTrKbn4BN6gSqNwDt
         7ofpnBsWeS8DE+Vz40M/d78O+x9DJzd0NUmwaSbFDofA3/A1groitlGix502JrVRnofg
         GSRBFA/8GOQEjDQh2Nqtkw8yLv/KREupwiJLLs0DjBzM1bnZ602fxJpg7TolFYoGPIyX
         T8NMcyUxuWG0fPRO8I1Uaj+4pFUrNq80TDxnDMPuQ8ni+wLTjUmA+bUvWYerK/VvLC4z
         a12i1ifjQfQBiM4zHO8VhuW4FsHKSKpuCxOnFoXnGgqzxKVGe+ps5CEuuyAgzkWUge9M
         7qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Rzb3iILp0N9VPoO2HC7Ijv9hijbpXzSFKAfXOuc/y24=;
        b=V/FKUc7WnNYErM4NtlcCi73+j7l1c2+uBg/nSt/WNfVOk//X1jwQyaKJRaqdlveHFv
         lHWt+zQ679B928uXLRsDv+uSqc1zeIPRTqEvjPIh5o2U0Ukgbot7HfBA6VgRGqjR8rvH
         PeXCKobBcyJjtZX1edK027enWaJ2xoLnANO/6agw+zRPvOF/g4gn8GcofDDAJgaTZ4on
         8FfTqKZ31/0J5eE6lCgqVMz2wyI1bj0p6wKnv2ZmHdMxO7gR1Bb5aUpvQPzNQ+yx+bdC
         ux82g2mhp+atcNrGJWbbJGvv54HJZZTQ4WFMqmmz7sepgyDnNqrmBhtgf2MvG+kzAjri
         zxKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A1yiZ6hg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si467874ywc.421.2018.02.17.10.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:29:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A1yiZ6hg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Ee-0004bH-4S
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:29:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en797-0000AP-Md
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en796-0001UD-8s
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:37 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:36664)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en796-0001Tu-0K
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:36 -0500
Received: by mail-pl0-x244.google.com with SMTP id v3so3443614plg.3
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rzb3iILp0N9VPoO2HC7Ijv9hijbpXzSFKAfXOuc/y24=;
	b=A1yiZ6hgTpl96c/Xw/00JNme4ci8k9OSBXcTPbWr/oWLOlErI/SFubj5rIv9LBNmiZ
	/9vQuRapzkFu4XompCryPs9N5vg77Mw9NA+ae2K+g9r+hnZPYatky+Rp2Kd9I/NlXsSC
	iXJO0CgS4kZz/27Fm2pUSB1p4qfpYC3Mc4tKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rzb3iILp0N9VPoO2HC7Ijv9hijbpXzSFKAfXOuc/y24=;
	b=K1ApJ0ATp1rHEZ84dcrZbzbfx09o/Ouvr9QBkkYTuZON4rfyqvOz1VtBAYF8+oOs76
	R6LsyboN1c4WX6hygH3AlwLkDOpH3q2QXk5jm99WBt+3o8tHc6DSHFWMhyvKt2WS0yem
	jhqXlfsIxufxhvN61yRU8O4bOHSlqiyRO/nmrS6fWh5n8yPpx/jaxv/d2Doungkk4oBc
	wTrt6YHmr5mp2GR8AUf8gP6ef7MmH7UVd7LvSDDsfBf4NNKY2YAUIj5u9Oqx35UtflYH
	spE/8O5ZoSiExqOK27nYec4Gk3c7sSKXa5pzD+O3rwhSbd+otsDIBRvdXQrKnvrCyTw7
	u7vg==
X-Gm-Message-State: APf1xPBJ4AGNlbNLJcvnWKeMewgpzNQTZnPz5BtbAcN6TfBG5Roo5nq+
	MtjdEq4s3ahp8TzWOfVzCTXBTRhBC54=
X-Received: by 2002:a17:902:6bcb:: with SMTP id
	m11-v6mr2324350plt.326.1518891814662; 
	Sat, 17 Feb 2018 10:23:34 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:21 -0800
Message-Id: <20180217182323.25885-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH v2 05/67] target/arm: Implement SVE load
 vector/predicate
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
X-TUID: MmdJjf+PHimL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  22 +++++++-
 2 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 50cf2a1fdd..c0cccfda6f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -46,6 +46,19 @@ typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
  * Implement all of the translator functions referenced by the decoder.
  */
 
+/* Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.  */
+static inline int pred_full_reg_offset(DisasContext *s, int regno)
+{
+    return offsetof(CPUARMState, vfp.pregs[regno]);
+}
+
+/* Return the byte size of the whole predicate register, VL / 64.  */
+static inline int pred_full_reg_size(DisasContext *s)
+{
+    return s->sve_len >> 3;
+}
+
 /* Invoke a vector expander on two Zregs.  */
 static void do_vector2_z(DisasContext *s, GVecGen2Fn *gvec_fn,
                          int esz, int rd, int rn)
@@ -97,3 +110,122 @@ static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
 {
     do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
+
+/*
+ *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
+ */
+
+/* Subroutine loading a vector register at VOFS of LEN bytes.
+ * The load should begin at the address Rn + IMM.
+ */
+
+#if UINTPTR_MAX == UINT32_MAX
+# define ptr i32
+#else
+# define ptr i64
+#endif
+
+static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
+                   int rn, int imm)
+{
+    uint32_t len_align = QEMU_ALIGN_DOWN(len, 8);
+    uint32_t len_remain = len % 8;
+    uint32_t nparts = len / 8 + ctpop8(len_remain);
+    int midx = get_mem_index(s);
+    TCGv_i64 addr, t0, t1;
+
+    addr = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+
+    /* Note that unpredicated load/store of vector/predicate registers
+     * are defined as a stream of bytes, which equates to little-endian
+     * operations on larger quantities.  There is no nice way to force
+     * a little-endian load for aarch64_be-linux-user out of line.
+     *
+     * Attempt to keep code expansion to a minimum by limiting the
+     * amount of unrolling done.
+     */
+    if (nparts <= 4) {
+        int i;
+
+        for (i = 0; i < len_align; i += 8) {
+            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
+            tcg_gen_st_i64(t0, cpu_env, vofs + i);
+        }
+    } else {
+        TCGLabel *loop = gen_new_label();
+        TCGv_ptr i = TCGV_NAT_TO_PTR(glue(tcg_const_local_, ptr)(0));
+        TCGv_ptr dest;
+
+        gen_set_label(loop);
+
+        /* Minimize the number of local temps that must be re-read from
+         * the stack each iteration.  Instead, re-compute values other
+         * than the loop counter.
+         */
+        dest = tcg_temp_new_ptr();
+        tcg_gen_addi_ptr(dest, i, imm);
+#if UINTPTR_MAX == UINT32_MAX
+        tcg_gen_extu_i32_i64(addr, TCGV_PTR_TO_NAT(dest));
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
+#else
+        tcg_gen_add_i64(addr, TCGV_PTR_TO_NAT(dest), cpu_reg_sp(s, rn));
+#endif
+
+        tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
+
+        tcg_gen_add_ptr(dest, cpu_env, i);
+        tcg_gen_addi_ptr(i, i, 8);
+        tcg_gen_st_i64(t0, dest, vofs);
+        tcg_temp_free_ptr(dest);
+
+        glue(tcg_gen_brcondi_, ptr)(TCG_COND_LTU, TCGV_PTR_TO_NAT(i),
+                                    len_align, loop);
+        tcg_temp_free_ptr(i);
+    }
+
+    /* Predicate register loads can be any multiple of 2.
+     * Note that we still store the entire 64-bit unit into cpu_env.
+     */
+    if (len_remain) {
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
+
+        switch (len_remain) {
+        case 2:
+        case 4:
+        case 8:
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            break;
+
+        case 6:
+            t1 = tcg_temp_new_i64();
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_qemu_ld_i64(t1, addr, midx, MO_LEUW);
+            tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
+            tcg_temp_free_i64(t1);
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+        tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
+    }
+    tcg_temp_free_i64(addr);
+    tcg_temp_free_i64(t0);
+}
+
+#undef ptr
+
+static void trans_LDR_zri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = vec_full_reg_size(s);
+    do_ldr(s, vec_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
+
+static void trans_LDR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = pred_full_reg_size(s);
+    do_ldr(s, pred_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2c13a6024a..0c6a7ba34d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -19,11 +19,17 @@
 # This file is processed by scripts/decodetree.py
 #
 
+###########################################################################
+# Named fields.  These are primarily for disjoint fields.
+
+%imm9_16_10	16:s6 10:3
+
 ###########################################################################
 # Named attribute sets.  These are used to make nice(er) names
 # when creating helpers common to those for the individual
 # instruction patterns.
 
+&rri		rd rn imm
 &rrr_esz	rd rn rm esz
 
 ###########################################################################
@@ -31,7 +37,13 @@
 # reduce the amount of duplication between instruction patterns.
 
 # Three operand with unused vector element size
-@rd_rn_rm_e0	........ ... rm:5  ... ...  rn:5 rd:5		&rrr_esz esz=0
+@rd_rn_rm_e0	........ ... rm:5 ... ... rn:5 rd:5		&rrr_esz esz=0
+
+# Basic Load/Store with 9-bit immediate offset
+@pd_rn_i9	........ ........ ...... rn:5 . rd:4	\
+		&rri imm=%imm9_16_10
+@rd_rn_i9	........ ........ ...... rn:5 rd:5	\
+		&rri imm=%imm9_16_10
 
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
@@ -43,3 +55,11 @@ AND_zzz		00000100 00 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 ORR_zzz		00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 EOR_zzz		00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 BIC_zzz		00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
+
+### SVE Memory - 32-bit Gather and Unsized Contiguous Group
+
+# SVE load predicate register
+LDR_pri		10000101 10 ...... 000 ... ..... 0 ....		@pd_rn_i9
+
+# SVE load vector register
+LDR_zri		10000101 10 ...... 010 ... ..... .....		@rd_rn_i9
-- 
2.14.3

