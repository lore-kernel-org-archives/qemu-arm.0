Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650355ejb;
        Fri, 7 Apr 2023 19:48:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQJ3og3M5u/cBoh2kjx6OsRhYTHMQwbMjBBLzk1tqIay2CNYZKTvlok07+BmMImQKDs+Xp
X-Received: by 2002:a05:6214:20ea:b0:5a9:1bd5:375e with SMTP id 10-20020a05621420ea00b005a91bd5375emr1625042qvk.21.1680922118146;
        Fri, 07 Apr 2023 19:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922118; cv=none;
        d=google.com; s=arc-20160816;
        b=shljPjaExzyZV2A12i1oP5oQKXXt8cMIZSkIb5mXQXCOaNqeLrSpf55dsv4zyhKezS
         IzmweBBBJ/T0q3sQlSNbFJlfRb6W1xolDPJYQ/i4bqK4R6lcPllePuWrTc1PdOG9IHW9
         WdVPYI05X22xahgPDmc4eYQeiNZynkifekgqROsvpUD7tGzRtu5ecmqMVq6foz6mGNqB
         5SDtFUwZWJ/9JaZJQ44mOmMlwG4usNVyuWK8cFDXxen+rYN3L+m9ttmUggJKO9NcEXJJ
         8/kARoaYPNYce3a3ohRqI5pwYwvOB6Q4q3ov93NyDnhcAWI/O4Gldnl2ZL102waABCSb
         dIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u3QvbuMmLJFN66+AgerJ4hDVUqG975uEhSCFouk7XB4=;
        b=FbUtuxssg3s/xliLNNeiGJQeXOD2XMzpRTj/8YkQhexCG3wmU1FPpABnrqyhRqA4C8
         2MtEPmJUpE16RLFTlGKd2ly+Y/4jktAD5Ro0ygst4KOvj7HySF7HuepHTPtB4nKqiWX6
         JVwVbsxkO6KQlT9hudPr7dYnHzv1EujHlj7Fsy200HMcoAccas8TmWV/m1R3Wohyl8/J
         SgHjUGxlWEAkVF7wuCai7LBDVXMiBTBYNXiGgTRti/DFo2rJTVQv31528W+2hBJ+xF29
         Q4g30otGkHWlU8pu0ZYddsnmlm0wt2cc3w95PCoQWF+FvoaTetGdUjSv9pIBeqIVsEog
         42RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdSWsa6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020ad45c63000000b005e97d39cd3fsi351450qvh.120.2023.04.07.19.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdSWsa6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyZU-0001hS-6X; Fri, 07 Apr 2023 22:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ8-0008WU-Tq
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYR-0005tU-Re
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso9063065pjc.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3QvbuMmLJFN66+AgerJ4hDVUqG975uEhSCFouk7XB4=;
 b=ZdSWsa6ERlfHiTwam0IQTYjTL62Eq74YZIMXCeXBvP/ME89ZlRUlqB5ZFbNJbov+ZE
 Q+1LDauE8R/aoEm/zXUFr5e1Fxq62FVH+RSJo/Zkmy85AyNU+Xv5midE3bZJLqlOLPsX
 R5qwJ9id6YPcJpTvGNNV/6oda6uPWUuKBFE6Kd+rUIowu6FTFMLUavvHTcUa3qbU/J/c
 pvXg5PV/0VGP/fUSbAjM273gK+FaKTrqBCjxe+Ghqes88VS5CV6YNWO+2AnonpPbm069
 JABdgPdYNXOCSRjcsF0ArTCnDxYIAAqcgp0irOu4jdPTmXWuOmQGUkyz+2WcN1/vAd/3
 /4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3QvbuMmLJFN66+AgerJ4hDVUqG975uEhSCFouk7XB4=;
 b=0CpDIr0/N1jNywYPyP/VCiK/axkZUFk4VtywbAVvNgB2018fz/VT3CIf0YIee/uNYD
 /DidyXEORrzT4NCCCFf2iM7GV0vd4Qlw5fAns3gRzatvObDFnNeT8YmEpnD6AgR5nexK
 iG1AX8v9RUO7pAO0/N1uXJIp56S4TRQQphG2l2NHFc6nulBHqfnTGwZVMPbSrKJM94Yq
 39wzHrjXdsptNwaqY7fo9YNjqFVKKTdVwTXAEMCotw3qlYcSoctN85Y3baUcVOxy6+/p
 N4UXL2cbOcwtm6jnRpVGY5T3fLmJ1Dy6SYnk2p2pii9PZsqQcUBXo/+X2HkH7cKXWD5l
 3QJQ==
X-Gm-Message-State: AAQBX9elcMeAgrMoCYsyh3AFYDGH1Ra74SmOzUm1sGP8c6Hfm5wVjlaE
 VJstpbgABi/BQiMMxxfqgzykLg==
X-Received: by 2002:a17:902:ec83:b0:1a1:dd05:39fe with SMTP id
 x3-20020a170902ec8300b001a1dd0539femr823556plg.4.1680921830263; 
 Fri, 07 Apr 2023 19:43:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 38/42] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:10 -0700
Message-Id: <20230408024314.3357414-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: 4xKzUpbpeDOp

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index c11710d117..1a8b8e9f2b 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,11 +10,9 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
 C_O0_I4(rZ, rZ, rZ, rZ)
-C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
index 8d8afaee53..6f1cfb976c 100644
--- a/tcg/riscv/tcg-target-con-str.h
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ab70aa71a8..45a4bc3714 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
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
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 #define sextreg  sextract64
 
@@ -1654,10 +1644,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
+        return C_O0_I2(rZ, r);
 
     default:
         g_assert_not_reached();
-- 
2.34.1

