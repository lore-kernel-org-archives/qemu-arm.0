Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653865ejm;
        Wed, 3 May 2023 00:11:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JTDARjH49VZWb5WvClBk2OWfG/XJy8xWrQXfs0vIUp1S3hlElUQnulfHAwLhE2ccOzlVx
X-Received: by 2002:a05:6214:518c:b0:5ef:83cf:91cc with SMTP id kl12-20020a056214518c00b005ef83cf91ccmr8421603qvb.44.1683097891952;
        Wed, 03 May 2023 00:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097891; cv=none;
        d=google.com; s=arc-20160816;
        b=EDCkcRjT8cRr6fCNXphEKRF3mE03AL3cLyIX2ZFoFTFV+hW6Go6aiAfdpMroLuTnJO
         sAS/7WwZNndQRaYhLNvMFKTqFi1fTR7tgP5p80wUd5pwnb4FjOizebJQHa20LYgAnt60
         hsbY7nnv0VrYgsaAQx3by1RhDxSirj5wbMZCRzgfdJZE5b1vX4O4ALOx5Ug7CXzFvIGS
         JJTuJfnrrDNmF10pNN6ZC+liAKNszMUTr6UN8nTONIdIHu+y+nUkYHvtIFF3gvx94sD/
         pT7shEQZCam+e+6Gz2kcrDEJTY2zK8jVslO7QF9F779FK1qUrJ/OVUHFvpj9Zm1MDtBS
         73ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
        b=vb4OYfU0/5fM1swXyol/PvkLPiEpxxx0GDb1fFnuO+kPaCXB/4NpbmJPdAZcmomwue
         Aazp2axRRpC4TLypJAT0WIvcgGLqwQZoxdL/Bfk4rTXlDb7DDJJ3E2gAILUiXO+YG9FO
         0zuFVj4jOPmZPnxjCA90GWQ6Aw0A8SZvShhUhHyhtXOGK/4WeAlR0qoyuSxt09fjkDNZ
         XYOFP5QBl5r4iB1OeGt3/nKVJ6ORE/ym+QCcy2bwdSaqg/pFd6uMv3UxcAitV5VjpnDN
         DHjGQjPUSjwXs19AQbX6JQf0ZdKv6vLa3IQxaCyk8jV1x0ZKzrP+G3p9hx7nZCSWyUGn
         ozAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n25NmJDy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn6-20020ad45d66000000b005ef56f664a0si2567977qvb.194.2023.05.03.00.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n25NmJDy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Uz-0007g7-Hx; Wed, 03 May 2023 03:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-00061F-SZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6U6-00039I-82
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so47510945e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097264; x=1685689264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=n25NmJDyb9X7KuCxytueShxDeF/Q5E2vJEI5Roj5QIfBBTbuWZOB7D968T0EkIVZb0
 xABw6qXFV24T++EWq25H6eGbjTd+b1MlAcdy55qA1kRFOdinr9oYiW5Kkzt4NfmU42MZ
 gYvOffm97mCx01xkhXEEx32AMPtBkjG+wtPg4ZfcQruB0XoVPh2h0+deFdnIkY/BH+TK
 nRdPlqf7xGJd/yq2JnQmnFw/MXXi0Cdzra9+LWcVbT1XQcqYR7gMHwt1P6O7KJ/v3Rp7
 7+Zy20dyxB/xXRKgqC9c0eJuXA8isrjpbO7BjJuZpukHxt+b7dvBCi3AL1Bwq3/Eznth
 1Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097264; x=1685689264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=RGeE1TBdw8mTpNZPAH0VAEf3soTbKQlyInjMHs8ov/bIjrSlwWU9AeX7jRuUI/ZRTu
 4UpIvwZ4hI0ukMHgmug40cTF11H+Tv5NQszuyzGwLbw011K6u9i42sp9ahBirBj053Jm
 oHI73wIc/m/SFsSmVzciYfyTUU94UDomHQdrXnDAQTGQbVFT8/gLKvNyKKICyAXXH3ly
 PVNbpqyNYE+e1AuYTV0VvyqX1JUsJkqkcIqVCenMTcADqxy6rPg6eJrV5s2Va7ivSacM
 n78v/6gszuENWwfzlHcQk0nrqRAe05lJkrEEUf8Wx9tJV+Qu4LkD4sV7p+z4kvAqLPts
 kycA==
X-Gm-Message-State: AC+VfDyyeLRsSZE/wM0+SxeeTf7X8YmhJ7dPRpRI+T6gecM7u64R2dVH
 a1JGYdjBZxDc/+9+xo7OWEEWlAGfFRNX+ZsdmIuRAA==
X-Received: by 2002:a1c:4c0b:0:b0:3f1:82ba:b03f with SMTP id
 z11-20020a1c4c0b000000b003f182bab03fmr13101628wmf.18.1683097264562; 
 Wed, 03 May 2023 00:01:04 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 44/54] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Wed,  3 May 2023 07:57:19 +0100
Message-Id: <20230503065729.1745843-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ns6wUwxn6vXl

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 --
 tcg/loongarch64/tcg-target-con-str.h |  1 -
 tcg/loongarch64/tcg-target.c.inc     | 23 ++++-------------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 172c107289..c2bde44613 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,9 +17,7 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(LZ, L)
 C_O1_I1(r, r)
-C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index 541ff47fa9..6e9ccca3ad 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -14,7 +14,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 60d2c904dd..83fa45c802 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -133,18 +133,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
-
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
@@ -1541,16 +1530,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
-
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1586,11 +1573,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-        return C_O1_I1(r, r);
-
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-- 
2.34.1

