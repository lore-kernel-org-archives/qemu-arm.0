Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2598006ejm;
        Sun, 23 Apr 2023 22:47:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiFYo5KAmFdW429o0uXmQ11lILWIEXVwBFUKAgW0RF4/zANXAahjRhc9c+oaSsIF5q20zf
X-Received: by 2002:a05:622a:1006:b0:3ef:4007:485a with SMTP id d6-20020a05622a100600b003ef4007485amr18800474qte.68.1682315267312;
        Sun, 23 Apr 2023 22:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315267; cv=none;
        d=google.com; s=arc-20160816;
        b=zssnPlEezoHiC/QWVwCtm0oRhf5D9CjxvD7eoMFFvERN8QqmgjA3BxUWmYvULPDP1+
         IFoBzc5/zHbdEFbq8ImwhgWqjlcryZfBP2ll23ra8RKWWkH+BZSD7Z9BVj8NWpnbpCZ4
         8X9TOQ/S3Me2le5nXCjPCwWsVJaALqgfrese5CsAeavr+oyj1jZ6COpvRkgeyA0cb4WD
         5bFutIr+PyrgCIlk58IMztfyrICNWyAimln02srwoFhiM4zMgTBjZz0wTiaZGVbaOzwY
         u12H/nWIwJiOcdVPTCJzM6tM9o2+JhYycMWGZp779GMrVLDGCBWI77CxC/WvZ5T74+2F
         K+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
        b=hCBbqEEgzuhoTWkZgsP2h7eXnWcORDnOApFSlWus6m488JIFt8194BoPfalKaZXGxN
         K1pis4dBlIMVRUzXuUsgz0ejgRYFxyGWSV9npqYuz6sRV0n/8BvgIUfdv+MCvk8jyxX1
         nINM/XEkprVqat8mz5WNOvze83m5nlbciXWppJvdtd9sbsIt6FrImJL+vzgJG0AvZRWa
         ZL3AUM76Rdeo7LS9FqOQV+ciPTGKxjv3AuyynT5pbiOpn2mFKLG//+Zq5EHAuBYAT+4a
         qB8MNKnP1Dcv0YHNPW2dXZY36DSkQ+E41Kri1uAs1tjK2jdpxmjVuQAW/2L0DEaPlnzj
         ViQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unEiPoC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a37b802000000b0074ad554ff02si6346634qkf.9.2023.04.23.22.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unEiPoC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp04-0005fA-He; Mon, 24 Apr 2023 01:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxv-00063p-3m
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox7-0004UD-6K
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63436245e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314887; x=1684906887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=unEiPoC3DGCbNlUVzWehnKJGBznQaFcD5SYtJBHW/C5O5WsSnZBkXAaxZuol/U+9js
 duT/VeJRTp94ans53sImsHCleGJRj5+KaX1C0LphQlmH4CpD4ZLYYGFRKytnu1m/hnGF
 P+5sMSXcwKFaGe5slJARNPutPo395qq0ODpPAvZDTe9+DyaBtgRxMqe9FZdMhE9reX90
 M7+R9UvjijDMR7yzztgko0I6WCpQL6cAv+36Ail22WVRc7bkQVMCyOjyQADLQQ3UD2vR
 hUIflzKiwjkUk/8khkrvPqsrUEcYW9Zr4C2w75bUK2tt8vah0Jqzlwtm9WzeY3CdY+Bk
 JmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314887; x=1684906887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=SOgGqmAN837NAktsXiLRvv6el5fpU5uYmJheqbLd6D1Ll7e1ZR2BwvN+gYToF3I6bD
 IRKjPRUQbpih3b1XQ4ZHnTT8Fc88OXiSy1nnB0Ad+ZqjpAiRg++JFDMvkSTB6uS7ndB3
 Zo7Zn+RQMK64LfX0RX8PYA0xozxgPKFnI+2flZ+uQcbx++8ml21IL3JoTJyBcXJvfvf0
 JUlSSXrx8hMPJCO8MwyjXfLYKh7BdbRsnuX6EYY0XCkjBwao9TK5O8ix8/aanwc/P7IK
 EobQZ7dTD8TVeVjAHHSY+LEvmi90WLoGBiv1FFeWQDYTf4MrCNFOHQFKXnt/Fy4L1CsY
 HrlA==
X-Gm-Message-State: AAQBX9f/kCAqQOdNN8bfv3nyjY3UGHZPYFvaIcG/kk7vEZhpi/7SLaUs
 ikBsf1kWSobeNRVp3OKMgio1Lw==
X-Received: by 2002:a5d:6a11:0:b0:2f6:661:c03c with SMTP id
 m17-20020a5d6a11000000b002f60661c03cmr9340020wru.28.1682314887384; 
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 36/57] tcg: Introduce arg_slot_stk_ofs
Date: Mon, 24 Apr 2023 06:40:44 +0100
Message-Id: <20230424054105.1579315-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: ziS9iji9ca/5

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

