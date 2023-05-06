Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp883957ejq;
        Sat, 6 May 2023 00:24:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5nbJek9Edb5tH77DbPuJsYq92O3gqHuUaXVuuqFQxn7M8aq+FBq9y659fnAhvogBtTY7JI
X-Received: by 2002:a05:622a:1441:b0:3bf:c407:10c6 with SMTP id v1-20020a05622a144100b003bfc40710c6mr5699731qtx.13.1683357841081;
        Sat, 06 May 2023 00:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357841; cv=none;
        d=google.com; s=arc-20160816;
        b=kCluh3DjfsiE7OehuxzZPfTZSSnYZX0NYvu+6AhlraF6dl5FQyvnZyj1IdrP/0vgSM
         LSjAdpGmGZYJ1Vvz54Ffo3sp4ZkT3U5HMu/TvAookVlh3pKHx7ESG7elY7cXbuE5uwvv
         I/fMGhg7XawawzZWtH9fv6KEe1yyUOoxwV4EPgHAbHOLHx8HWiEssBWY9QyvVV/jw6ea
         +zA/quef9BWnhm3FAKmlBUEMHT9N7HW7o4ht3MdlJyGntKrm2sYCKr3QdGkDZnfElQ5n
         cBcdiCw1EU8G0kWUi2kxYVSmY0Knao0uyD8lNqXwpDeBFAq9basaXy9j7WuSl8hLUPr5
         ikXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
        b=UvEUUuOzpeCUmnJ6Ahgt0pIicIypOOTrFTJ1u+f2GsUpJWJs6kLYmQhKjL0/iN1kjr
         FAY1gfUpukDKGaw1/Hjmhn6XDDSg11pPRBa8cnXRJ4La5SFJSJBDrAXx2iIhvvScAjhf
         3uKGN5S0WyiEJxJIPhj/AF0itAe6poIk4tOxP/XnMKo8dI9vcPvMpf828xfpyzcqqW+I
         ifZ5Cu77kb8LrTKqDSJ6hyJcYAcweFqGhNqRzAbW4o0WW/Ro+rEKUEReHGcMAdc3fQnv
         vmflreDy4KERLikNRW620xBEvMLuB2DttR+kGo+0YUqFABbfOumIeewedbKtpxMhPAsM
         AuOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q4NPOj9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a068800b0074e3667a540si1265427qkh.237.2023.05.06.00.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q4NPOj9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGl-0006Na-VJ; Sat, 06 May 2023 03:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGk-0006LT-9i
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFv-0004Xq-B6
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-306f9df5269so1725923f8f.3
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357778; x=1685949778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=q4NPOj9/E+zXYe/Zd3aMwxW38WnbsUv/LrnxjyrUyqRetTj8CpVgMTLPp93IC2Jc0Z
 OKy2/Ct/HVz4Ci56jwggj0kV1ij0MuPSOqlRgTS2Yei0rtwINNDKxjn+D4YUx96jJUTC
 k7DYbjOvQfJHKng5G6jhsNshWFwIyaB0YokThGDvwSOozkkcG+N9sLguhbAY0qooRjYV
 +siGncxgkENvCkBcRRZjXkNuRW0NAeduVpVpVUwlCOTxzy4M92QqNjwU5cGdSFuMPWsd
 y/MiUJbc7s1jk7NZqWpuM2bLI3BNlegW6L5GtLje110xN65kK/cnbvnqZd1zNFbvy0L5
 hsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357778; x=1685949778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=IrjEC1JOZu+Uzi6b6Wb/QqUocq02xvfvTbet+3TVjAz3qOZHXrVI7o9haa+8UvSg/1
 HY9KzNxiGOxT3M7pNize0zyM5H2o+SnYjMGx2rX3KjlD9mOLo3cXnS2EfpeAWHA2YSMa
 66EOF23r+j8QWpGl6iRjHitsThLqQ/J1ylqwwIsXsQjKyvit/b1x5ZpUJ/DPlg9qz3ZJ
 flOdlnBBLXVijDqx22p9n0jpFkCQJ9kBHQijbALucYuDix5bBHD34TKNhx5enINTnA21
 1+0uNfSxvqXW2+D4trQSYNsjYQk3ZBOUItoIP22ZLka8hbKpswU8lyIjzNjNvLeQyN7s
 KoOw==
X-Gm-Message-State: AC+VfDzgymPL4CgLZWWQ3dhPK6rqAXGW7lgUJ9kr3+n0bmgihKYaaw1P
 dKf1dX1i92gS2ZMvL0BbWqYq9w==
X-Received: by 2002:a5d:6801:0:b0:306:2b64:fd1b with SMTP id
 w1-20020a5d6801000000b003062b64fd1bmr2828134wru.52.1683357778081; 
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 28/30] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:33 +0100
Message-Id: <20230506072235.597467-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: EFM72dvpvqqv

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index d4cff673b0..d88888d3ac 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,10 +10,8 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
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
index c22d1e35ac..d12b824d8c 100644
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
 
@@ -1600,10 +1590,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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

