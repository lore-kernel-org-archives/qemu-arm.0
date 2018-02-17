Received: by 10.28.71.27 with SMTP id u27csp2092681wma;
        Sat, 17 Feb 2018 10:57:11 -0800 (PST)
X-Google-Smtp-Source: AH8x225q4be6gDv7vR6HmXXgu2jOUuvyfJPpZu96HJSW83yijNKmK+vHTJLRU7z9FY4dO7TNXYeL
X-Received: by 10.37.189.2 with SMTP id f2mr7302255ybk.472.1518893831403;
        Sat, 17 Feb 2018 10:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893831; cv=none;
        d=google.com; s=arc-20160816;
        b=mt5saz5OwgTA6ZHIKifezbRgRQGyd/LNQbvrVthVNOr6ocSLm3m505GkhMMfRAeBKl
         wDeuUxmMuIzOGdvdIOX8QAEJo9sZYokhbXSguljQrC1V6gVqbBIkd1bt6mREt7WGIEzB
         thM5YqbFE51HZF9QwA0fWj/1IQ/uv+27Hj0xM+3PdcQd7qii+ILaaNKsS4XYYHplPWyb
         osXT7TlFEWDRYB8UkTupw07A/LXYbyCfgwf8QSRXpMqtC3AvkoXZLichw1ZKtXyBRwqp
         ZQNoodsNMCAq34hhOCy92/qV6MrO5PJBDir/rcIUWeY3v5O8a87q4ET1lrKzA9bY2p7z
         XQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=szV9p2aTTZ+9ZvXrV44xeIdEsoeNuGFa0EWnSbjdE/M=;
        b=Z6WR/2tV5xSI/78GyiSoH4AjdQ8dX7meFwdE+yNuWjwbpxFHhMIy4u4bVg1B5sv/AD
         qtlOuuAQVmSJ/bWSbAPXAfzAzd8UFm2z47gPt1HPuTGCfsfLoCLLiZbgHR79AbiGJ0cj
         ksVXpzU9wdj+nOiXtWvnhwpGyIpf90b7lNsj3Yj4SNwiRV02CzVElM2eLiBj+sOl0v7q
         TBWltwBH2WWCHCCo1VxEUbH15oQQeOdYNtV+xseTpeJYxd/Ql+/zcMvbTKkHJrfQVLCo
         PsBOsCjcSYhpXakmfQBLKZsV/2KpcVp3bIGShTO1VYsWPiMbETsjGTSNZqqmYzocdJhg
         IM9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvXSwKgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k29si1898327ybj.799.2018.02.17.10.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvXSwKgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7fa-0002wT-PF
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:57:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AK-0001YM-6c
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AI-00029d-By
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:52 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:44555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AH-00029D-TD
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:50 -0500
Received: by mail-pl0-x242.google.com with SMTP id w21so3427221plp.11
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=szV9p2aTTZ+9ZvXrV44xeIdEsoeNuGFa0EWnSbjdE/M=;
	b=MvXSwKgV4KRlsBmoQxUd7Y+CIlWGYasYDm4sXGBUtiOpbCnE6YNApp9YGxhcpKBYuy
	+0AZYN7MAMbsC9wgNTApclQica0EU8GbEq8jaN1nYIgkckAMS8TjYJ2D1vuaHuvAQjYJ
	dCKeQsIW7gs4q5x6qAc+N3lYkfztfnC3X3OiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=szV9p2aTTZ+9ZvXrV44xeIdEsoeNuGFa0EWnSbjdE/M=;
	b=pVzczg2GiqxUd3vEwzl9SC3klLw2rG2DnvS8CC37fZmdkK9LQnlu6m9dgFl3Wn7wKw
	6D+h7Oux88LTtyqpLQIX7xqA1nHh76gGJogss/duQF55WZSDn9XWfPM2zC6iZOVeGRnX
	njnvfi7XIYt8bj46IP3mDxrNG2y7dG6HsfwUgQncT6Yx+qZNeNhQBhI+EW2mzoqnbIn4
	R+EYnlPyNomZzg+b8+wuPFIzOIEXaMz3j/ZK4vQm28WFUB9rGM4XeHlUggqOUPAlD0cv
	zVkU269XA823RDG20iA7b5ZeBwi1WJYlRvMFpQbKYYhyOoln2V/bcqOebKWLaNeXYHul
	iMGg==
X-Gm-Message-State: APf1xPBHC8epV14sRdWleNRlZ1Eq3mhhA5lYWDaXcYt5YFSchfyIrQrL
	j8sdDs/WVAIKaQCBuT9qfasqL0gSniw=
X-Received: by 2002:a17:902:461:: with SMTP id
	88-v6mr9362814ple.88.1518891889000; 
	Sat, 17 Feb 2018 10:24:49 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:08 -0800
Message-Id: <20180217182323.25885-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 52/67] target/arm: Implement SVE store
 vector/predicate register
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
X-TUID: 4kUler+2s3O8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 101 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |   6 +++
 2 files changed, 107 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b000a2482e..9c724980a0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3501,6 +3501,95 @@ static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
     tcg_temp_free_i64(t0);
 }
 
+/* Similarly for stores.  */
+static void do_str(DisasContext *s, uint32_t vofs, uint32_t len,
+                   int rn, int imm)
+{
+    uint32_t len_align = QEMU_ALIGN_DOWN(len, 8);
+    uint32_t len_remain = len % 8;
+    uint32_t nparts = len / 8 + ctpop8(len_remain);
+    int midx = get_mem_index(s);
+    TCGv_i64 addr, t0;
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
+            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
+        }
+    } else {
+        TCGLabel *loop = gen_new_label();
+        TCGv_ptr i = TCGV_NAT_TO_PTR(glue(tcg_const_local_, ptr)(0));
+        TCGv_ptr src;
+
+        gen_set_label(loop);
+
+        src = tcg_temp_new_ptr();
+        tcg_gen_add_ptr(src, cpu_env, i);
+        tcg_gen_ld_i64(t0, src, vofs);
+
+        /* Minimize the number of local temps that must be re-read from
+         * the stack each iteration.  Instead, re-compute values other
+         * than the loop counter.
+         */
+        tcg_gen_addi_ptr(src, i, imm);
+#if UINTPTR_MAX == UINT32_MAX
+        tcg_gen_extu_i32_i64(addr, TCGV_PTR_TO_NAT(src));
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
+#else
+        tcg_gen_add_i64(addr, TCGV_PTR_TO_NAT(src), cpu_reg_sp(s, rn));
+#endif
+        tcg_temp_free_ptr(src);
+
+        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
+
+        tcg_gen_addi_ptr(i, i, 8);
+
+        glue(tcg_gen_brcondi_, ptr)(TCG_COND_LTU, TCGV_PTR_TO_NAT(i),
+                                   len_align, loop);
+        tcg_temp_free_ptr(i);
+    }
+
+    /* Predicate register stores can be any multiple of 2.  */
+    if (len_remain) {
+        tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
+
+        switch (len_remain) {
+        case 2:
+        case 4:
+        case 8:
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            break;
+
+        case 6:
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_shri_i64(addr, addr, 32);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+    tcg_temp_free_i64(addr);
+    tcg_temp_free_i64(t0);
+}
+
 #undef ptr
 
 static void trans_LDR_zri(DisasContext *s, arg_rri *a, uint32_t insn)
@@ -3515,6 +3604,18 @@ static void trans_LDR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
     do_ldr(s, pred_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
 }
 
+static void trans_STR_zri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = vec_full_reg_size(s);
+    do_str(s, vec_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
+
+static void trans_STR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = pred_full_reg_size(s);
+    do_str(s, pred_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
+
 /*
  *** SVE Memory - Contiguous Load Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 3e30985a09..5d8e1481d7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -800,6 +800,12 @@ LD1RQ_zpri	1010010 .. 00 0.... 001 ... ..... ..... \
 
 ### SVE Memory Store Group
 
+# SVE store predicate register
+STR_pri		1110010 11 0.     ..... 000 ... ..... 0 ....	@pd_rn_i9
+
+# SVE store vector register
+STR_zri		1110010 11 0.     ..... 010 ... ..... .....	@rd_rn_i9
+
 # SVE contiguous store (scalar plus immediate)
 # ST1B, ST1H, ST1W, ST1D; require msz <= esz
 ST_zpri		1110010 .. esz:2  0.... 111 ... ..... ..... \
-- 
2.14.3

