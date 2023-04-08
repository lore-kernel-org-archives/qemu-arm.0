Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp651095ejb;
        Fri, 7 Apr 2023 19:51:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7pKTBZSaKCaVMkRxCsE0xoJ3Iya1+3uZk40F8kQHOpwn/BR0hJyI/miZL7cZGjW+WWOZW
X-Received: by 2002:ac8:4e8e:0:b0:3e6:957a:5721 with SMTP id 14-20020ac84e8e000000b003e6957a5721mr1088243qtp.68.1680922292971;
        Fri, 07 Apr 2023 19:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922292; cv=none;
        d=google.com; s=arc-20160816;
        b=0FJV/G8c6oSCNXlrdnKkYU+Cra8mH5my4r9aOF5hU6+MWTidJwu4euUAzp1eqgXlvb
         vX7Lln/c+oQK1U9g54nJaKM71+MAKWVeMgCgpT2hU7oF+k/5LBwQ5W8bJxgX2Q9PeGMe
         8ps0JEQCYXHzh+cMSrDF8O+NhgaXbiVIWj9MCfWO4E70e4N1uClOFkVLmhF8BMGGlGWj
         RPUorcCaGVOe+nApJBOEr3/CitHukj3awo0ihrgjnKq1c7jlg+5OlIB72OFoh9FRFsUJ
         S8xMI3EL4EHLIZDVvWG9CbHcoiK9GAKu23GERVl3uDvxhPW64x/U8W1DFvsmjj1I7Zvl
         Ogkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SrQW4Aeu2V1q+r0Fl22IATDZGwActs9RT4mXhJ6VIuc=;
        b=U22UAmEfPIYODS4ifYPTNmOhKmHZZFnsgtQswy48mtU+hXYUM1r4S7bu4rmqIN9qdY
         7fOaRZ9G6Lczo2iX3dnJxlxPrbPAz/tFfaTFopOYF6eZUXGuJ9oJICca4i627MQ+lYCs
         fjeG6o21EXlLxRq59/DK7NbhVEMWD9fb8GJ83JOZNjeTVT8mLRhZIqW7aYR913aWprP0
         sl3gx1lqD0j+jMP9PGB+LKAtW1TkP5YJBieXYARL7BMZ3cEq9pozf05V6LyCK5edd5WQ
         mcBS7hRecPKXSeUjHJs7+DD5eRPwtY1vNRX+v1xC3NCJVNdfo+Sz5LPntdq6koA5YBEl
         8qag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbbHNMao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05622a01c700b003d42c0bb132si3741585qtw.313.2023.04.07.19.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbbHNMao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkybX-0003zH-SE; Fri, 07 Apr 2023 22:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybS-0003E7-4H
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybO-0007n7-6B
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so4742167pjl.0
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrQW4Aeu2V1q+r0Fl22IATDZGwActs9RT4mXhJ6VIuc=;
 b=qbbHNMaoBsurhe1dnFYCc9EFptqz22KzTJkIyFB5L4GQLTlM7FctU/qH4WSmWhnsXe
 HBiQmPOYb6l3j83ZDqdTiI8HN23csCdgJJDkIhpkUDnQa6Z6SK6+SHoXv9T+R1Yhg3WZ
 fdwNpGcx0nv/x5c0txfi5yFhLYM0s+vADpXVzzp5kcKUONc16A4Af5v8RjoNurCvJ45f
 NPu+KBTgvTfqGZedJ2vq9SWDluMz43OtpZg19hk4aC030t41YSRknpjec6YsdR1iBKhP
 /Rl/9Ea6UJqAtU0qnOQU/eLcasEqGnsOiheJ5G5tRTXEzyM5YzFRWnj8tT+Khp4EIyRS
 N21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrQW4Aeu2V1q+r0Fl22IATDZGwActs9RT4mXhJ6VIuc=;
 b=gQcWZb6LFlfPY5DqkDCL/yGWyKWGHonS2HhWZaYHfzhEdIIgf1G10crcF60lTVn82w
 k/Aj1cxyVWASpe+7b4tLmY2NVTUYkO3lJPQTQGZtCN93hSsBMm3wz2fR/7iGq7Q7yTYE
 GCgGQOS+TdrKvtYT7s5F73DxaI+EoMm8ETNXff5CkmDaLaLhxTe1Ue5DFhC4aHcXUqSk
 h4eUdH4L54ISEkAnN5XjKp0ebxXkANKkaZ7BDUQ3iljIhtwEJ1RftlJfFH4EFqEA8d26
 FvFsmng11b2SC9hWbPUTdSiWWWyxblcT6uyZ4tEbh+sGw3wzYuS6Mq5ojyVCJskcYk/u
 ft5w==
X-Gm-Message-State: AAQBX9fmAiiHRdfEoMG/iWyfWUb5Deyq+TgUfElatQibE797pMgrPGT1
 oUwv5fmv3yCwHgD8LQWo5mR5mw==
X-Received: by 2002:a17:902:d50a:b0:1a1:e39c:d4d1 with SMTP id
 b10-20020a170902d50a00b001a1e39cd4d1mr497509plg.67.1680922012334; 
 Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 40/42] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:12 -0700
Message-Id: <20230408024314.3357414-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 5XROkca0o81+

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
index b53eb70f24..64033fb957 100644
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
@@ -1734,10 +1722,10 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
     int ofs, a_off;
     uint64_t tlb_mask;
 
-    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
+    tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, addr_reg, TCG_REG_NONE,
                  TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
-    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
+    tcg_out_insn(s, RXY, NG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, mask_off);
+    tcg_out_insn(s, RXY, AG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, table_off);
 
     /* For aligned accesses, we check the first byte and include the alignment
        bits within the address.  For unaligned access, we check that we don't
@@ -1745,10 +1733,10 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
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
@@ -1757,14 +1745,14 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
         ofs = offsetof(CPUTLBEntry, addr_write);
     }
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+        tcg_out_insn(s, RX, C, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     } else {
-        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+        tcg_out_insn(s, RXY, CG, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     }
 
-    tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
+    tcg_out_insn(s, RXY, LG, TCG_TMP0, TCG_TMP0, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
-    return TCG_REG_R2;
+    return TCG_TMP0;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
@@ -3181,10 +3169,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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

