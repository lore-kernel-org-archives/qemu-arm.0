Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2649482ejm;
        Wed, 3 May 2023 00:02:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5efzzmrd5Q0wpx7M9UN5C29qFhkM1jCz/7g0NIFTBmjHoEqrCzxv410Zr70DBn5ATKswyr
X-Received: by 2002:ad4:4ea7:0:b0:5ef:519:b1a with SMTP id ed7-20020ad44ea7000000b005ef05190b1amr9428923qvb.24.1683097328568;
        Wed, 03 May 2023 00:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097328; cv=none;
        d=google.com; s=arc-20160816;
        b=kkDc46lT8HuzBFnrK2VAc4jPaf0bKpGn8dE5DmpOgZOHvzCaH8KglPj6JXXc/KkvV2
         hF4DDIZoaftg0ZBiQVmaI1ZjZOozHrT/3RVnJpFPTbVZyxVzbX+ais+pCGUaip4OCbzG
         NtPBF4dTE0euxTNjL2szeEtbAXLd28zAcLubZJmZTWAEO/6/QGzjz4j+iaIw2iFxY7a8
         Mz2PYIBl57vbQ5ly5u7jAVLH8w/tlOzHsi45h79Xw+Uw9KQMTlYlv56cUyHYI92H6Jt3
         WaNzujJFSmATUd2rcuIBMW7bW8oh8foDFKGQ4X4FpcBIs/D65xg1KH+AunPj00Z14fYm
         ZvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
        b=wF9SKKUZ1DOBgGA/TXHSWmIwwE8ZEzmj4y1tJ1hTP8HDupOTug7eKQk0JYwqwN7QEm
         NC5xQwlHBuh3CsLlldq2YvNYc7ZfDYQbgJfQkSOuJQaKzDi/R5W0lbiUGimV5gE4zTcQ
         dxI5XVfJzvIr8KHGUWNdF3MncoAl+zGWBsJnGABBU6FSImptB2c7QAChMEctba2NkRX9
         TWbssgtayoakyW6+LaGzkqZJ7D5E5erwroCGeaptNfBOsJJP6UOtauJctzFOAUH8NA7T
         Wp0xIoMyQBKtm8z9GUvb89UMhPcT7c9RjsZmM7oqeJ3TpExuWHJCvW16ooisNdK58Z7+
         y1dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GaUrrg4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020ae9d609000000b0074e4e7c418fsi14082645qkk.784.2023.05.03.00.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GaUrrg4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6SP-00023k-GB; Wed, 03 May 2023 02:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-0000A3-LR
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R2-0001v3-OS
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11012825e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097075; x=1685689075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=GaUrrg4DTLfI2KgfOFXIrNnVQfukbitgvE7xTkMLe6SQLHwulAxuoMZSFoO+EUKg4V
 PCXxhU1iEnoL2f1hb158zK8yuGhNISrzgcWpqwavPJKX4ghi0lbLyVS/I5Whpq+/VmHB
 IqoduTidSPD4PJcLy/pp5vjRLWVWc25pPv22sM+e/FGq+DLqf+3mQr+k/8125PyXDJe7
 76ntmFHtc0N0e7qQydTzVGvg0mxK5QDdi+wVI2UCiK67SLnVT8SlHP6uXQ+vgyt2qegx
 XKkTmhxawYzpGcABylfRPyr5WgFog9xoNIIXjSWQlg2jukz+CY3e06yRVuqXADPy5B7I
 QOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097075; x=1685689075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=QuXOOvnD+VacFPuFTeVgHDxvrRO8P9MCV6d79k/cmwNR/ETsnGGV0dTQ/+w5aBKXvr
 d5DFDxsEhJDToxPMEL98DgaHRzJRZ5x948YcBjjURLYMx92T+39jDV1kn/54RGvHRcaH
 GwT0GNchlfkfmZhtNruSElBK6C9aB4sv5Jx89yY3OXNx+FZXgf42gqN6yi21ERqaoNE1
 Zk5aHFpjmHyBR09o/nBCPEm0cr88lT2mcq5q0N8HZchweFcbIarp5FJeDp0V1bcK1oQn
 HbWGzf0Fk3eHAaDM97vLs/msMXr/xXvh086qrShPRGn31z9vpFwaP9SS4zkWVnwpMnZG
 fl5w==
X-Gm-Message-State: AC+VfDyEXKs/sIKsOrqkuNEiG2BrLfv9eHblFlEQh8N99RW5/QPoN9Cs
 BN8hxWiqHGDFWPE4bDam3tdyjg==
X-Received: by 2002:adf:fa06:0:b0:2f6:661:c03c with SMTP id
 m6-20020adffa06000000b002f60661c03cmr619489wrr.28.1683097075248; 
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 32/54] tcg: Introduce arg_slot_stk_ofs
Date: Wed,  3 May 2023 07:57:07 +0100
Message-Id: <20230503065729.1745843-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: 5ZZOC3lwSA1G

Unify all computation of argument stack offset in one function.
This requires that we adjust ref_slot to be in the same units,
by adding max_reg_slots during init_call_layout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fa28db0188..057423c121 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -816,6 +816,15 @@ static inline bool arg_slot_reg_p(unsigned arg_slot)
     return arg_slot < nreg;
 }
 
+static inline int arg_slot_stk_ofs(unsigned arg_slot)
+{
+    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
+    unsigned stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
+
+    tcg_debug_assert(stk_slot < max);
+    return TCG_TARGET_CALL_STACK_OFFSET + stk_slot * sizeof(tcg_target_long);
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -1055,6 +1064,7 @@ static void init_call_layout(TCGHelperInfo *info)
             }
         }
         assert(ref_base + cum.ref_slot <= max_stk_slots);
+        ref_base += max_reg_slots;
 
         if (ref_base != 0) {
             for (int i = cum.info_in_idx - 1; i >= 0; --i) {
@@ -4826,7 +4836,7 @@ static void load_arg_reg(TCGContext *s, TCGReg reg, TCGTemp *ts,
     }
 }
 
-static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
+static void load_arg_stk(TCGContext *s, unsigned arg_slot, TCGTemp *ts,
                          TCGRegSet allocated_regs)
 {
     /*
@@ -4836,8 +4846,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
      */
     temp_load(s, ts, tcg_target_available_regs[ts->type], allocated_regs, 0);
     tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK,
-               TCG_TARGET_CALL_STACK_OFFSET +
-               stk_slot * sizeof(tcg_target_long));
+               arg_slot_stk_ofs(arg_slot));
 }
 
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
@@ -4848,18 +4857,16 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
     } else {
-        load_arg_stk(s, l->arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs),
-                     ts, *allocated_regs);
+        load_arg_stk(s, l->arg_slot, ts, *allocated_regs);
     }
 }
 
-static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
+static void load_arg_ref(TCGContext *s, unsigned arg_slot, TCGReg ref_base,
                          intptr_t ref_off, TCGRegSet *allocated_regs)
 {
     TCGReg reg;
-    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
 
-    if (stk_slot < 0) {
+    if (arg_slot_reg_p(arg_slot)) {
         reg = tcg_target_call_iarg_regs[arg_slot];
         tcg_reg_free(s, reg, *allocated_regs);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
@@ -4869,8 +4876,7 @@ static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
                             *allocated_regs, 0, false);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
         tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
-                   TCG_TARGET_CALL_STACK_OFFSET
-                   + stk_slot * sizeof(tcg_target_long));
+                   arg_slot_stk_ofs(arg_slot));
     }
 }
 
@@ -4900,8 +4906,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_BY_REF:
             load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
             load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
-                         TCG_TARGET_CALL_STACK_OFFSET
-                         + loc->ref_slot * sizeof(tcg_target_long),
+                         arg_slot_stk_ofs(loc->ref_slot),
                          &allocated_regs);
             break;
         case TCG_CALL_ARG_BY_REF_N:
-- 
2.34.1

