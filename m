Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600289ejm;
        Sun, 23 Apr 2023 22:52:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zy/30lNy/+ojlprY3ap0mMyWdhyBLLzhtkrHX4/D63P3mkMyDHuzcYDkaF3dUMtqqnvXEu
X-Received: by 2002:a05:622a:44d:b0:3e6:6262:9710 with SMTP id o13-20020a05622a044d00b003e662629710mr18716434qtx.38.1682315573270;
        Sun, 23 Apr 2023 22:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315573; cv=none;
        d=google.com; s=arc-20160816;
        b=Qku7ve3VvTQlc0XTt9OW06xvJXHPLR2aklU9jgL1PmJxhfXjyYx2pP8hxVmvhBIgmb
         Rm3KXNFr1VmXRjFl6vNHIbsA06XfTDtUjLiTV4nOYl5KTJNzE4jWT7isZvU8Nn4WH4+9
         FzlCHbvA/2ICR4sliV50e14OfkMmegAV+efzWK+CIEthvXJXtOOSs7l93lOB8t6WjIRa
         wRHcz3FkNcG/rg372ByhlUsptXXDJVhpTEMQ9+7YShK87hyzhsTHSim46QU1fry8OonX
         0+yXpEz6msMO+jB7FLDZete8j6RK1V/bllv+gsmaQBHcQE1Z5xnboYAMfJ5ri48N/513
         fiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
        b=G19q+k6UzQipy2e3EvxxuQ2LL1NAeFuyLk6jKWK666NwcBRZ9ouJPGMAAwO32bOHxp
         odBoo5Cv9Pk+eOs5/okWhi8UAZLpZvFoNgomXb6rNdbitLdPxA3FLfuWOrrMUQaE3ln9
         OwdKSFxm3LHo+0CX8VIYvkvnX0cbjmR1x0jJLmJoACCMyUs0yzvBXvlXNQCHI6godnvu
         +H/lr+t/GtLfP8++bMREMc8LwjZPZ7npLYo+dFDuDJkrmPNiZFev0OzpkJcOlB1IFbXt
         mgV1VwRrOvAkRAuRYgk0fyQ+DDc9xmHckjo+7JWBhsXTS6loAsS6/L3vSuLnbUEzMrMJ
         0XXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pk+Cib0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q142-20020a374394000000b007464c33e22esi6259018qka.480.2023.04.23.22.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pk+Cib0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp53-000778-3K; Mon, 24 Apr 2023 01:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0b-0006FA-1g
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005Nc-Ri
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2305229f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315080; x=1684907080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=Pk+Cib0gWXNgLzURVy9ATLUZ0zPes8CGBbxFT2RYkk+xdALdboPicHzv8uRtfCwwLO
 rgXt/TayZjus5PmjM2RL1PQTe0ai43mbfoXB4px1Q+0IITGRU+BIvpjNG1hOs3JtSSHT
 a/1NiQvGphAm7C8EeOtJQvHvjrm66/huRSzXt09iLnLW0UE96gGHzKce8v3EJs28HxBI
 AnpFEITopgYyyBAsweiN0v93qGT4Uu6wJJHaEZawqMuToPLuBHy7Yp69ZaJYa8UvU+ft
 BMxqeRTHhd7/9xHaeqntUByiCnz8f/rwiIMWtO5Efm4KEiQ2ZfOl1p9F+F+6ZEdD8c8M
 fneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315080; x=1684907080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0NN2hpnzMNaQXsS3LeulCiRo0il3NBwU75zZGVxlFw=;
 b=av8yoaHwAVygpQo7cfmOUXxBKUAOkkT8cDq2v/MgUKEkyYP/o7K6dH2y+dPGKpPyfW
 i/bmGSQBVzZpjIhEMLa94XYKh5EGZPSdE1g+h4CYRByFIV0CLce4kjN+pV5GcFRKABUv
 nr+uI2vSWvyL4C8YA/OmUBMa3N+f/YPOhsGpDyXf7d/3fw0VN+2TNA2HjIUvIWPRPo1G
 3B1nDolHFfxUOyAm/HcE+PARTWL/GF3LX/cP/7RCQWCb4E8w/r+K8RFZWlEHlCPEJAZh
 9t2Nelx7/MtlXGIpu8SnIvEPgqc/8Y07OOFq0um3lu67Miu1TAK9FH7/QvPh5IulyFbq
 EZQQ==
X-Gm-Message-State: AAQBX9eZpvQRxRYLUbIFCplFk7YfVcvao1JEYTJK7aqFcYdwh/n1G5+w
 BrHCkrzxjv+gbO4VlMQvCazcnDgdIaBh9qjib8QQCg==
X-Received: by 2002:a5d:6781:0:b0:304:7159:d3e4 with SMTP id
 v1-20020a5d6781000000b003047159d3e4mr3090999wru.44.1682315079994; 
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 57/57] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Mon, 24 Apr 2023 06:41:05 +0100
Message-Id: <20230424054105.1579315-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: i9o8Azw8hds4

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

