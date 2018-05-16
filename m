Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp202821wme;
        Wed, 16 May 2018 15:33:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpz0i9YKWFRj2AfQ7bCdaiAMdubTK9Hw95XmL9ivGZ/0K7ZryS7+lkhUyt0Tr0/6bwB7e6C
X-Received: by 2002:a37:1453:: with SMTP id e80-v6mr2885461qkh.117.1526510000455;
        Wed, 16 May 2018 15:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510000; cv=none;
        d=google.com; s=arc-20160816;
        b=lNa72G8hS8AAu/p+9vCgiTniXR2/f6llu8gTBdlP9WMOxZnZSYnJ2moHHHRRKnHYB5
         qQovmUJRzo2o48sw1D+LJnjo3M4VBNrQ/Y+jrRcMUwqCRCEoqKi3+98z9DPYEfgMJ4FE
         8YRG4fMuzQHjXD9umg7cf85m7VzAYFyhzhU9UivhSgYGVbW7cKxjMrFnzwuU5uuJdmNH
         bgqGBVE+1uyfcQBK55hBs5fd088vAmxRo3JoSKcARDTB3KM6yYQjahwFJdPFT9gWRMH/
         xeFWhZ0ESy+XXEKmDKey82U1pwrx1U3DYP612xIkDMhaBTa2SuL5ZdPakTjJuXiGifDI
         5F3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=um4QLHX1iMAwR5s1WiFKyjG6exIGzfIhln7mUAYtMVI=;
        b=e0B5XII/PaKmLJ4j1ZPnYUTiK2sYwdwDtQQPKDBPlWbEQscWAvSG4+yCTBd/hMjkd7
         YwMB1sWowfj1l3Te4qHFLXZ+H2vFOBMchr/ry4p+f4DjzKuvuh6wOvye1FmazLIsC6w5
         HlXf+4obRgLP1X1JyIXcK6ohE8lWA5iJekvnupsCELa0BuSvQ1aICBxKEnw5n7p8+F65
         K2C1d64Bu7tVRj7GKaHMsDuQDzArK58QvEko9JFx0LgS7mM6w7uYM0TVdV1U2AcYNY6Z
         dqMfIQq0jsGpVBLQxBcxXtcAWsS57jRPvQZWm/6JJ+Dq4g5Ng/8uyd9HpWxJS0nQ6OUj
         rowQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J8vhtKl8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44-v6si3728751qte.76.2018.05.16.15.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J8vhtKl8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ4z2-0000fU-0X
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:33:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w6-0007U2-PD
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w5-0007Mr-Bn
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:18 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:43757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4w5-0007MK-4t
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:17 -0400
Received: by mail-pf0-x242.google.com with SMTP id j20-v6so1045962pff.10
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=um4QLHX1iMAwR5s1WiFKyjG6exIGzfIhln7mUAYtMVI=;
	b=J8vhtKl8y86nU7vPIyVwIOu5TK3175Sv/d+pgNdlISti/jgUpsZQexUVHDLKWIoK5i
	ho1x0cIIyvYDPubj2U8eKZWQHTJNp9HOip1de8xMawOtevWBputs0o4kgWnDewb7zf+/
	M9FHt8+AKSmq8rr+c4VvGIVLHqQT419OvAKkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=um4QLHX1iMAwR5s1WiFKyjG6exIGzfIhln7mUAYtMVI=;
	b=EOCQpLmIF9y/6M29OvQHCv534yjEYQmOCIv81tNubSznrltjvCq5ySlO/JxO0KlABq
	LNbzq3GQ5hrpqPd1pZfjgvUO28FCttDbz3JUxtEwPw7DIvad+7kye6L6afGV5LHLOiXC
	uc388241E7cYTp5Ex5QdLcNnzC4j4Ob4gdYHg+LMUV0Q8QPNgMgEgY+724/fHhskR4p3
	Pzs2u5edDjNmClRR4YgIn2xFDrXXL1BTPU9giVKrxxYEx1dFL5ualpFDFKA2je+Fyngx
	viCpG8JRDA39vrXWs2QBbdMWWNU9mXMUvS2M0CwyOhg3I0DSRWProYcIKeaVtzVVM3Jy
	Nb5A==
X-Gm-Message-State: ALKqPwd397xf3rAlsGwgXLFaDRsRdHoUn2sc7ft2BAEXvpy9rsTmRCMG
	D61im2pohszDXjkjdqJHr3ZVwQcLwpw=
X-Received: by 2002:a63:7d0f:: with SMTP id
	y15-v6mr2165999pgc.317.1526509815773; 
	Wed, 16 May 2018 15:30:15 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:44 -0700
Message-Id: <20180516223007.10256-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v3-a 04/27] target/arm: Implement SVE load
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgG4Y4O6E4Q8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 127 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  20 ++++++
 2 files changed, 147 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67d6db313e..5ec18a6aac 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -42,6 +42,20 @@
  * Implement all of the translator functions referenced by the decoder.
  */
 
+/* Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.
+ */
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
 static bool do_vector2_z(DisasContext *s, GVecGen2Fn *gvec_fn,
                          int esz, int rd, int rn)
@@ -100,3 +114,116 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
 {
     return do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
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
+        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+
+        gen_set_label(loop);
+
+        /* Minimize the number of local temps that must be re-read from
+         * the stack each iteration.  Instead, re-compute values other
+         * than the loop counter.
+         */
+        tp = tcg_temp_new_ptr();
+        tcg_gen_addi_ptr(tp, i, imm);
+        tcg_gen_extu_ptr_i64(addr, tp);
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
+
+        tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
+
+        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_addi_ptr(i, i, 8);
+        tcg_gen_st_i64(t0, tp, vofs);
+        tcg_temp_free_ptr(tp);
+
+        tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
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
+static bool trans_LDR_zri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        int size = vec_full_reg_size(s);
+        int off = vec_full_reg_offset(s, a->rd);
+        do_ldr(s, off, size, a->rn, a->imm * size);
+    }
+    return true;
+}
+
+static bool trans_LDR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        int size = pred_full_reg_size(s);
+        int off = pred_full_reg_offset(s, a->rd);
+        do_ldr(s, off, size, a->rn, a->imm * size);
+    }
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 48dac9f71f..a2c4450e7c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -19,11 +19,17 @@
 # This file is processed by scripts/decodetree.py
 #
 
+###########################################################################
+# Named fields.  These are primarily for disjoint fields.
+
+%imm9_16_10     16:s6 10:3
+
 ###########################################################################
 # Named attribute sets.  These are used to make nice(er) names
 # when creating helpers common to those for the individual
 # instruction patterns.
 
+&rri            rd rn imm
 &rrr_esz        rd rn rm esz
 
 ###########################################################################
@@ -33,6 +39,12 @@
 # Three operand with unused vector element size
 @rd_rn_rm_e0    ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
 
+# Basic Load/Store with 9-bit immediate offset
+@pd_rn_i9       ........ ........ ...... rn:5 . rd:4    \
+                &rri imm=%imm9_16_10
+@rd_rn_i9       ........ ........ ...... rn:5 rd:5      \
+                &rri imm=%imm9_16_10
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -43,3 +55,11 @@ AND_zzz         00000100 00 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
+
+### SVE Memory - 32-bit Gather and Unsized Contiguous Group
+
+# SVE load predicate register
+LDR_pri         10000101 10 ...... 000 ... ..... 0 ....         @pd_rn_i9
+
+# SVE load vector register
+LDR_zri         10000101 10 ...... 010 ... ..... .....          @rd_rn_i9
-- 
2.17.0

