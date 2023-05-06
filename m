Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884307ejq;
        Sat, 6 May 2023 00:25:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qdJNEf+vd1dqqfsVucC4HR6M2uX4lB29i56KCzhHmPs8xT4Meb9WBdqyKYCjgidaSft0l
X-Received: by 2002:ac8:5d8c:0:b0:3ef:366b:5afa with SMTP id d12-20020ac85d8c000000b003ef366b5afamr6058173qtx.54.1683357903956;
        Sat, 06 May 2023 00:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357903; cv=none;
        d=google.com; s=arc-20160816;
        b=TDgjhTrjxC7z3dCuTyDyRzwLQnWJkCaCRI6vEdskpo1mVxkwYww7jvefU0l5r22ONe
         a0O+Vn907lSOpcNNjpZbeHCXPFTOvVg6S+AM4LNy6yPf0AqbqB3T1oNqfgPsYgpY34Tv
         IaznBG584XLqaio6KcxVwTyQ0DAOhrmKFYFlGbXjV9AbDKnEjw5uu0qUaDUo07yVh+55
         6MJFciHArwTfrGGYO2bzRyR+jNIweDu+6yPJ9ZR7w/xI1tLdY209tBdZ/FD1yQa/FezI
         hFJwAhsSDX9aaimi/Oy+aJTWD5MYzjipkilvPCtG3gdn4l8pHcdbOe5KMk+AqABCKw2W
         H+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
        b=hpJTOR+SbZ8l86m9HRYVmlj235ntXsL513pEBTffeIjAvEPks0QkxwXPRQZAOAbKal
         4kAFCSYAVkHWl7NG7/sgsTZmYLUKTrrr8fH2bgxJNKZkyBCLlD214NGUH8aaOg4vjZ58
         6BvbThqwIuP42ZEw3mZ8pDlj2eL9gmOOr4ugtAkBoTKhJVVOBZSAins/ofX1tdmBFlyG
         PbMNepaKEVY+vjI36LE8Ra6b0aCOYzDjsMK5a6c9bcQvGjDGkHC2MiFqHDDORtC4afDl
         O77QfcP2HOqKm4GAJ9Z+W/syUwGg/vQUoqyU/D6VnLD/+ZT9a80kIzLVB2Cl+JMFIxdo
         Hq0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+6wIx4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020ae9f713000000b0074e1ea435b6si1293870qkg.130.2023.05.06.00.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+6wIx4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCG1-0004JQ-Bn; Sat, 06 May 2023 03:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFz-0004I8-B3
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFk-0004Pu-20
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so2473094f8f.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357766; x=1685949766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=M+6wIx4ufFFDyNBBxwZi6PDn2lYhS0nxtj3bybjAbzgfdds1n2WAnrne4zI6HVL9bJ
 ktI5h+OsQzV+GbA9eIXt9JJsp90HybxpBcfC29OW6SEkcHrfvLTHhga1xD4hzpzwJESX
 XJSHdDpTxCgQXzPDcJuZzeiG8S7Zkm5PwscDmlN6ctYvBFuP+hNEa3UascrQV1AAUiC+
 LrNYxVTtzOp4UVI1nIk5Tj1mqdTnU3v/dFYwDKYzW8lVfq4ouEFutri/CxdZlCondqAa
 pRoR2nYozlp0k7facE+sXfM+UHHMtnJwl38lB6EqIQ0SiCZkVWctWTCGgL7DlNGjgdDj
 FlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357766; x=1685949766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=IB9gwEKY2XzQ8+HF+KZw18fsEsAFOE5NTH08I1CS2Gwg33BkXV7KeJ8oYQkrIUCUVE
 x4qEmtkYgU88ZB/5W++8/22LJlBiuyu38VJaB9IfFAdd4SzHHTdzOnw4YvQfwdp+jSi0
 i4+FKYRFvw6ny/+6/2uBfWYYpT0Guet7KE1Q2D0ovygC4Hki5AvlTBL8ow8k7aAQi5Tl
 Dquchum8paa2Hu0PFvGdPc56WiOhNfg5TlHpWv08kFgu06YlRFyYAdJ8Rb7mmM66rQXT
 gcACveKfFZxUfpBAAN2Y/naM00i/S3uolqcX8zzIK5ZA7OkXCTgUTGgUsWplFYiih4sj
 hzHg==
X-Gm-Message-State: AC+VfDxOmuvOz6fyZY7fyeSvsNykR7Bz7XdeCTZ/BOtRFjDSyXklh8S3
 SYGEiroWrsx+R8boSMGVwXQNZg==
X-Received: by 2002:adf:f7d1:0:b0:306:45ff:b527 with SMTP id
 a17-20020adff7d1000000b0030645ffb527mr2536272wrq.45.1683357766625; 
 Sat, 06 May 2023 00:22:46 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 13/30] tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:18 +0100
Message-Id: <20230506072235.597467-14-richard.henderson@linaro.org>
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
X-TUID: Edm9YRwPC+tb

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 40 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 202b90c001..62dd22d73c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1580,13 +1580,6 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 typedef struct {
     TCGReg base;
     TCGReg index;
@@ -1627,47 +1620,46 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
-    tcg_out_adr(s, TCG_REG_X3, lb->raddr);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    tcg_out_movext(s, lb->type, lb->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_X0);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
-    tcg_out_adr(s, TCG_REG_X4, lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
 #else
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
+
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-- 
2.34.1

