Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884187ejq;
        Sat, 6 May 2023 00:24:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5m8ybMtVVP2qkc8Ze2r3KaRGRjG19lWAuSR68VhOqM29vxGhp9zIYusRFPeTbdru6ITFPs
X-Received: by 2002:ac8:7d50:0:b0:3ef:3fcd:3c1c with SMTP id h16-20020ac87d50000000b003ef3fcd3c1cmr6248398qtb.63.1683357880426;
        Sat, 06 May 2023 00:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357880; cv=none;
        d=google.com; s=arc-20160816;
        b=Qt15urZBJyUenS7fG/+mH8TohBY9XFuGA4uSn5929+F/ItrchfHFmTiS3aXpq/uri7
         ix6CJaaDIklkhMdY5YJ2G0z0+6DBVmLq48A4X2FNTnjNdVolYS9Tfq2qw84H4Pg6FbbS
         2wphuh8cWVrjafoAVQCWfoIeUYBawza6bxxCMGiTpiHsXtcDJaRmasexUUAfb/MKQm8M
         5nIyXse44byHSWd9/4ZBan1TUP1qWwj+LpwbdT9LWHfXVlZPExg/pMAlfymL2Ok1V8Z2
         nhsArPONrDZr/gHY2P22lf+Nb4udkjtBQk6V7eWjvXCYLMWeNexudsoA4hdnSkeYGHAz
         K1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
        b=DbXqybRFc7NBeI69MRu3Y1F8gQ2L7ueB07iTmjFCKP+JTD9Sl2b5ViG3eJIhdLEz2u
         qCBO33EYN4H8fuoUrB3UysyrB7zN1V0YIhL7xpG7OG5Mtn1BKjgPlKATy8+r9qktlhxp
         tGElf7u03c5k1uvDhJxQj+nMC9SCBGqndYN6g/2jIzl+l8Feem5cLc201/jwfR2dloqF
         87U0dAvzSPKe7Mvuvt5enQR8yiUxC5BNZ+mIP5zmd0nOZgLwyt5FsFthpmUNdu3SvmWq
         sXFlB0fY+meJDifxWtrOHQ13eE6lyY8iLkKw4LCkSzaZ0jpivX4/OFzgYhRAL4CAhf22
         o7Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lzmq8af5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05622a189600b003de2443d398si1197350qtc.300.2023.05.06.00.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lzmq8af5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGe-00064l-7A; Sat, 06 May 2023 03:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGY-0005ol-GQ
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFx-0004Yy-01
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3075e802738so2157589f8f.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=Lzmq8af5w8UUTWeis3i2Xh1P48fJNle9jBlibB1cS64uxNlCTBq8oEgSM+L58DBeIH
 BlsUG4GbnlsAISXOjpM6eXxA/4uPqenfutf76/TE8Si1JgRdmLqgOpIlH/Y2yhU4UMHK
 axhulhnqHVu8bkDeFjol9hkiijs3yt8A6EnT/XXdLhYg9bzOsOoSVWVShXcEngv1bCwf
 qm5/lvK8mJiYiJ5t7aT4mxullYXq53OYPYNF8nl3Jl/Bg6BoeA2dBqEWeRVsrvHPEVoi
 PjQRtueWsxnX28R9HQ5q8YAZB0sNLj2SsSgn7ELAcffiwXHbLIINGVmgQB3OmMfq3NNT
 0NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=AqUkmYOXZxI3BDa6b8Z+7yWkFm+DJw6BjG6lLV5NUMOR5lINhYq97vlo+XM5vd1Ac4
 BupUPD53lTU+18oLXkBCfE0qPxaLB0S0DWEXMt0iv8YckEQX1Hbf0uyOY96L0fd3gvkU
 JnmiLxRzRCk04tRyhD4nwgdZ1DMuGsN3g47c1/SAThsNuf+E4FOtPnyoMIXgBkcjemA6
 5xU9DuVln9CBxu17q/bUTDxQTvsVcQA/6KwIZXAy3m5EtbEwtAsdX8o9phi7TubEBS91
 La/RdUbMShryksPZIKgHQXhSmu0UU8Aro0xjQJdvMxTd2xuB3fRqVOdY7ut1JqkAaNcM
 CxVg==
X-Gm-Message-State: AC+VfDzsLfDGGklCOd4xLrkkFrSHi4g+R7Nc4IRMEIhDLzjc/+1E3pzJ
 idaTv4kmur6rmut2+5WQyRhQoQ==
X-Received: by 2002:a5d:574e:0:b0:306:2cd4:b021 with SMTP id
 q14-20020a5d574e000000b003062cd4b021mr2939853wrw.13.1683357779649; 
 Sat, 06 May 2023 00:22:59 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 30/30] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:35 +0100
Message-Id: <20230506072235.597467-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: 06VHbcTQxs2W

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

