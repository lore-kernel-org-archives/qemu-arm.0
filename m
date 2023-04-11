Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp186602ejc;
        Mon, 10 Apr 2023 18:14:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOL2qs2PeNsXxxAWWSW7Sl4t+bv0EYNY6CsVeZSX0x97LON595J118VE0AqYTE13hrm25N
X-Received: by 2002:ac8:7d42:0:b0:3bf:cc89:9c8f with SMTP id h2-20020ac87d42000000b003bfcc899c8fmr20782082qtb.68.1681175684887;
        Mon, 10 Apr 2023 18:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175684; cv=none;
        d=google.com; s=arc-20160816;
        b=OYDGPJVeT2bxMgoAF6i+DJnMpGfF7OXbvsrbMQRdPXCiYtHeyIrN/Ej27YoDLT5Th4
         qcFjMAvX2QoyOHT3HjsgCE7ix6uTWokv8gxiutwFEGs865mZL44uUxtLmtSk7KPkfbOd
         wBigaRKxbq1xqIwrmcxXL1MoLbfix0Xc6+pmshbxEo2Fr2bqgwcyxGW/6VO0XQzXRIBq
         BWIA/yp9RRasZV4WJ/XDFU6qVMTqvQ1YuKs4i1H2j0HixB7TWuzxKGStPtAbHLpp1JIj
         mXSgb5R3fL9JsQ+g5dXsOnZuADLsroGpsplLHjbG1khYEvM/U+tpY/DNZeNQqXLErIrh
         wl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1miO26cFWi7kBYl9bo6IEH0Z1HY+IowE9gExI/oBgmE=;
        b=cbF82Wyi/GrsQZ4x7OLUGu3ajnS+dBCHnld9mTuqduF5WdbPGzKgTZc38DOybhSByS
         3icDX/trh40mJxSd0zXCnX1CpLwIvFDVaw4fc4RfrVxmU9eLyrGaSFLeUvY5t87a09Rg
         sr+whnXSoZbHP9BAoDJ8IWncFLY+dMKidFIb0bvVr3T9BRtE2piqwFXXkdXdFRYoh5fJ
         53IGVZYTQ8kIa1Yi8nXyuMl8sTEGp20jkNkW+8AnA3VoCjhE7CkGnoSF2qG3sFc6+Vd6
         IlfIjP97oMjWvdq6l6BXa+jQrJJRiSUNhynN1q7/utihisPNuC6RiFChmNeTZlwVC24O
         6ZnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtN4dBqD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14-20020ac85b4e000000b003e18051efdbsi8299527qtw.671.2023.04.10.18.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtN4dBqD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Wx-0006fp-Tn; Mon, 10 Apr 2023 21:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wm-0005pX-L2
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wj-0001yz-W5
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id ik20so6153840plb.3
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1miO26cFWi7kBYl9bo6IEH0Z1HY+IowE9gExI/oBgmE=;
 b=WtN4dBqDWNW1PKKQSEzV3izHJCdNiMi03T1ZLRwvOxVyS5UYsQC4r0erAhxRgcRRPK
 lSdB6BLK+oz/ix39X+wW5oSY0+mJPoQ8lmkynxo7QbK+rr95XZy34EB4KHhmMP9NTI/1
 iTFlWxvBnxcNRmPqzAViDRb/RCnI2LT8ZLe5MabLACBnvSh754BxgEmXAR4Jm9/8QIVA
 HrTvYwq5gIryWl/o+woSq/spytFe4gPPrRXDFi4Ub1bPjhh5PWxm4awE02zzVoa9mH+R
 J+LcXyLsB4fuqGWQr9/S+AkuYwAUMMPfjLH7MYI/cGv4DiRGo1T0/J5cXBSPFeevc1G7
 41uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1miO26cFWi7kBYl9bo6IEH0Z1HY+IowE9gExI/oBgmE=;
 b=0avXc22PsFAfO3AAGNOJJVh9OnZ3gK1M8jAJQFwebonro372UVAwaD1nkD1PMJ7++p
 WKZ5XSN9bmhnzZwKnEERf+GBU3Xd9mAV3R3OaSNkUFLV2PADhtLcpBceXXuK2SUbY1Dn
 uWA4weVa2Y9IgKv2eEv+EyWKQhuV6mfnrdsdG1TuMy+debLf487+6RejMx6aHTLfp2os
 kGz47pENuo3Tf6c/FKwZ81XzHXfyH7iy530ynvArEuqbKgdbs/Wy4j7nehsb4bDHgL7n
 6Y6e/JK0qVyGoMw/qZTFU76ARwBrIFpSLJ/DqK9+2iz5Ga9SvWQ+Pn1UcJw2Lf6Bi7Hf
 ghlw==
X-Gm-Message-State: AAQBX9cQAuUlbY5+Ra4ElWGrgKqOEaZHYQ+89bh58mSSu1fr82/w/WBT
 /Lw4aRelNa/+mos3LJYJ6csAtA==
X-Received: by 2002:a17:903:2888:b0:1a6:3ffb:8997 with SMTP id
 ku8-20020a170903288800b001a63ffb8997mr3396983plb.42.1681175428862; 
 Mon, 10 Apr 2023 18:10:28 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 54/54] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:12 -0700
Message-Id: <20230411010512.5375-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: Z3JY7VZzwRUt

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
index 42d3e13e08..a380982f86 100644
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
@@ -3185,10 +3173,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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

