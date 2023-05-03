Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652255ejm;
        Wed, 3 May 2023 00:08:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SZXui5IByQTpTpdg64IJIT6t9NdsGxTAP8ZymOuVsCFQs0csE77EKl9DE4HI6f3+9WdAG
X-Received: by 2002:ac8:7d56:0:b0:3ef:6e84:ee82 with SMTP id h22-20020ac87d56000000b003ef6e84ee82mr34899380qtb.35.1683097685897;
        Wed, 03 May 2023 00:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097685; cv=none;
        d=google.com; s=arc-20160816;
        b=WlK5YFeAsbAqnG5lUyPdGfD+K1DtG77ajM3PbW1WxhoeYsUkWbU+/HZ/QESiA70Qr/
         uggRY9RMi4NIiViyodudHW/nSiYADqd28xeAusJjiHMIecUPQljjw+m1HWadTchZMMK0
         RxxAFAEqXmI9/waTmd8g7TTNGomubwmblF13ua+U62jgf+ttRXeI6RExqSSiCjew9i40
         N4R8cc2u1WfO6MHzUF9WDs10hcDWnZaXO4M/rN5BcppvyMkqTFwo333oKZCb/le07dyJ
         fr64gdZjyos3BRmCG5FTrbpAnR9BMU2FrJ1sRYGeweJYhdpuIIYq6gF3RecTTapeMgdG
         6XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
        b=lwoxf/NBEMwbIbgG4EBeQwvrZqFeTLsJC6SRleDvi4R/uTAZr9HWczulBWB0/VPaEz
         oQSCtpbwhlD7Y9NdMMZQaelnHsMslp51LD9gPxGiDYmVJ8pfy6EiKOHNlCkctYyy4a01
         Xg00hek4YO+lX9Yr+ymCNF5bvO4yxHdB9OSGv27EhXkpFkSvuh8jgFe2DWm7MJirDVJ2
         h4gifaW6llTDzqSkrf7QkTN8Vdjufayymzn4rDgTd1p93U8A/iJasA8EbJgltHu5Po4V
         SlhqUSVVSKIrCAaB6EbfWInJGM7NAgl+ts+WPSx+k8GcNOYFaBp0tgIUlgOvjMxEYPT4
         6zpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tj7T+WrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05622a02cf00b003b644b7e22bsi3403869qtx.155.2023.05.03.00.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tj7T+WrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6Vq-0001Fb-6E; Wed, 03 May 2023 03:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Ua-0006he-77
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:01:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UD-0003FC-Iy
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:01:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f4000ec74aso38595e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097272; x=1685689272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=tj7T+WrSrXrBOI5S1rQ16npLCkDIn+HL7AACvP6YPcKxRDadhkoycmyjW+B7PkKjqI
 AmnsKGzctMmaM/7InTIzW0beNYbDN9HKMy82j0X7yERowrx1QjZ4tPqQ/KS2DLsFVbk3
 2IcWIsT3MMSNc3ybYNxX8KaCVIpHlA+kEA2gPnyTbelURVme8ClIgSCmVZr0gIsxU7H2
 6IqB43Fn7yOC1HckwCNZ1CHjGatgleKRcxfTEENhOXRx4Yc9cF9LEpFursXLbuukL0iA
 jbKzlVX0SaECbTeUvQXZuIQgXmVHvyfC1Oa+7HiayAe29pxM4qWYNxtQYg9fe6yfKlvA
 Rz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097272; x=1685689272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=IT6ZRXCvgRFGk0iTZ5MvPL0/Q6Nuua7BKRllhv5JOuGITZPeepJAhI8kmKTYwk9a4H
 8/7Rt67Bvn7Emif3FkjHpShJ5yulv3sSc/jiTkP3/EnPWBmD/kmCJEVYHQ9ngJpb3Z/Z
 dIN89u0+Kcxuz9YMAo1KEbOEtAV3WpO7FDWx53shnabPZ8w9lWMNt0uyS62XXuKSVn1t
 PpdywhWfoxt/JKVM5TOgvBmYcHTD4UDhMjXl0H7RG1OYAMypBYfZ7vwB/cBPNW3Ec2Vh
 1wDdxhBQ0ce5iV1tREY/h7+whRH27SaG/0cUU98JCz5LGFXe3HsMFAvE1YMxJKFjcllu
 IlPg==
X-Gm-Message-State: AC+VfDz0/DLf6clNPXd41Cfde36vxDBkIY9Q4TC+xNtTK5mg+u5dvu6H
 /M0WfJ2rlA/jNfs+w1Y9bXbjlw==
X-Received: by 2002:a05:6000:1191:b0:306:34f6:de8a with SMTP id
 g17-20020a056000119100b0030634f6de8amr3690018wrx.71.1683097271853; 
 Wed, 03 May 2023 00:01:11 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 54/54] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Wed,  3 May 2023 07:57:29 +0100
Message-Id: <20230503065729.1745843-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lPEyyO76tiFz

Adjust the softmmu tlb to use R0+R1, not any of the normally available
registers.  Since we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  2 --
 tcg/s390x/tcg-target-con-str.h |  1 -
 tcg/s390x/tcg-target.c.inc     | 36 ++++++++++++----------------------
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 15f1c55103..ecc079bb6d 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -10,12 +10,10 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(L, L)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
 C_O0_I2(r, rA)
 C_O0_I2(v, r)
-C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 6fa64a1ed6..25675b449e 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 REGS('v', ALL_VECTOR_REGS)
 REGS('o', 0xaaaa) /* odd numbered general regs */
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dd13326670..aacbaf21d5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -44,18 +44,6 @@
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 16)
 #define ALL_VECTOR_REGS      MAKE_64BIT_MASK(32, 32)
 
-/*
- * For softmmu, we need to avoid conflicts with the first 3
- * argument registers to perform the tlb lookup, and to call
- * the helper function.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS MAKE_64BIT_MASK(TCG_REG_R2, 3)
-#else
-#define SOFTMMU_RESERVE_REGS 0
-#endif
-
-
 /* Several places within the instruction set 0 means "no register"
    rather than TCG_REG_R0.  */
 #define TCG_REG_NONE    0
@@ -1814,13 +1802,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->oi = oi;
     ldst->addrlo_reg = addr_reg;
 
-    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
+    tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, addr_reg, TCG_REG_NONE,
                  TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
 
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
-    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
-    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
+    tcg_out_insn(s, RXY, NG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, mask_off);
+    tcg_out_insn(s, RXY, AG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, table_off);
 
     /*
      * For aligned accesses, we check the first byte and include the alignment
@@ -1830,10 +1818,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
-        tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
+        tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
     } else {
-        tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
-        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R3, tlb_mask);
+        tcg_out_insn(s, RX, LA, TCG_REG_R0, addr_reg, TCG_REG_NONE, a_off);
+        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R0, tlb_mask);
     }
 
     if (is_ld) {
@@ -1842,16 +1830,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ofs = offsetof(CPUTLBEntry, addr_write);
     }
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+        tcg_out_insn(s, RX, C, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     } else {
-        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+        tcg_out_insn(s, RXY, CG, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     }
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     ldst->label_ptr[0] = s->code_ptr++;
 
-    h->index = TCG_REG_R2;
-    tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
+    h->index = TCG_TMP0;
+    tcg_out_insn(s, RXY, LG, h->index, TCG_TMP0, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
     if (TARGET_LONG_BITS == 32) {
@@ -3155,10 +3143,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
     case INDEX_op_qemu_st_i64:
     case INDEX_op_qemu_st_i32:
-        return C_O0_I2(L, L);
+        return C_O0_I2(r, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-- 
2.34.1

