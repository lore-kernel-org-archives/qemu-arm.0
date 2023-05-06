Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp883810ejq;
        Sat, 6 May 2023 00:23:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SQfYy9cs0FKiiWjcwWKnLEi5oqv9NoUWHUUeQDLH7wEUc6OBsNxfbrPQY0RExTdx6SGuN
X-Received: by 2002:a05:6214:2305:b0:61b:5bcd:db57 with SMTP id gc5-20020a056214230500b0061b5bcddb57mr5945512qvb.48.1683357809402;
        Sat, 06 May 2023 00:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357809; cv=none;
        d=google.com; s=arc-20160816;
        b=fQcLD72zN6/w6QxU1J6NjLoF8oOUIoOZEoAfy2jStpLr2vZpBmsAMVc70otXWBLLsC
         ZOxNln/VAA3f+RHP3pEo5SVm/ho2eerGvFSIiFfYdQvuYVAfVIQdy9zcTpxlJiYL8vnG
         y/LKGdY0eScEOmzYBrU7UFzuIIAMUelhXJkpznNr0WDlTgk8+dk6G1oQuM36SkFPQq0B
         TB7ngrIyU9eeK0+krzaDHuYImeM9NmhGpW5d9WfMFsYeoRmU6WIIANuTNwe6Xi34RhpJ
         D8X7DBAgfwxcpGzdkTQvFtjTQpYbtU2DDGKf9WPYyaYa2HvR/6rTOyYccJ8oiq57PO/L
         x9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
        b=pVCU1fSZQiTPRFwbxef0CP6G9Wj32OhnP+Z44xb4+O9C3pzoQhoQNLJEClKmoZ2RY9
         z0VVJQm/5nOiuzj/m8Vz3+kQQcdrns7I5dz9zpmEOkGooeKA2Eqspj1txcxZgqTcHx60
         Fk0rL62vqIU5tIHmOcXcSXW4cBST0l1jLsS8tR0/+W6B1Cu+2N4opMSEWE0kpdXfQGhw
         s7TS+MwRvdQc+0HvBSCKg6VRPP1l2/LPxRWO59lqoMmW0hEoFbCVZqM7yiKAgH7Y09hJ
         Yx1P7hqd5eV4eJG+XqP3ITn1O47CHxrU1X3DOPQuaU/x5St1xRBpLpLVpA/MWbq3YM8r
         ozag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxM8tUQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt14-20020a056214048e00b005ef5593eb45si1274491qvb.187.2023.05.06.00.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxM8tUQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCFz-0004Hf-0j; Sat, 06 May 2023 03:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFx-0004Fc-C5
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFj-0004PN-Ia
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso157656f8f.0
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357766; x=1685949766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
 b=RxM8tUQepHAaXG7+z+hp0L22t5C3njaSNTpWmwvIiVAhO4vwATQ8PgWkF5kc1Bg9DU
 5PMucKCIl3JhhnRFiqIp4X1Q6qvo2V2Zb2stZVZqK22u6B9kpTkEbDiWDOrwHlyVI3MN
 drvUqUqe/ar7HMDxbMuEjAn0puEYCidr8Hg2ysJKouzEU2foBkGIm1EgOjrPUwGPO5Wj
 iCh8zFWh4Kw5OOCVQrEiZXQFH7CcjjzmukSqdPY4luxspoZuvBnq9ylWxDGif9/ZYAcX
 KFCY2MJcjO2ULOYjxE2tYdN4FFVGip1Vxo5PB7YfA/AyYjkjCsp+d9UubexGRcB1letA
 kahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357766; x=1685949766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
 b=FgRq2uZw3zFKRKUKNJdu8sp20wT0CzvjLJakQ8Z+cwvHvgrFWp5jW47bHZf7g4Dqer
 P9cn6rfY4aEgEIDcv6IhdwumpR0BrLt54zbhi9wQsny/Ocjn2Csz5bLcblOVQHfcm7m+
 eT0DvC4UZ894YQvuvxfJTeor82a/PZxvnPKsm7w6rGFqH021gcdOqUS3syqqlBvsLVMR
 +i5oIudZ/6wxzf0LIYga/KCNev8h/vYPPgcR1GvSWpHTKsdDdupJPsa9MnD2VK8Gzisn
 GCeR4kl9M0fn7BGIujMN8p+4Nf5pt8tc2u0Q21hcAGYJWO4MSKAQabJB4JcylAxOJYbe
 cxcA==
X-Gm-Message-State: AC+VfDzfz5awK1U1s8cNODUD+WaaKOmU7rXShZEa0KK/ugUcUaSNlu9P
 9qGFTs01GtZNKf6hup48t3Lsjg==
X-Received: by 2002:a05:6000:1250:b0:306:266a:2dc8 with SMTP id
 j16-20020a056000125000b00306266a2dc8mr3018315wrx.64.1683357765916; 
 Sat, 06 May 2023 00:22:45 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 12/30] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Sat,  6 May 2023 08:22:17 +0100
Message-Id: <20230506072235.597467-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: pCRBSDPxd+Bn

Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
the store helper.  This may or may not be an improvement, depending on
the call/return branch prediction of the host microarchitecture.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 57 +++------------------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 17ad3c5963..7dbfcbd20f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1854,11 +1854,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    TCGReg retaddr;
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1866,56 +1863,10 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (s_bits == MO_64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        retaddr = TCG_REG_EAX;
-        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
-
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        } else {
-            retaddr = TCG_REG_RAX;
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-            tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        }
-    }
-
-    /* "Tail call" to the helper, with the return address back inline.  */
-    tcg_out_push(s, retaddr);
-    tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_jmp(s, l->raddr);
     return true;
 }
 #else
-- 
2.34.1

