Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4298706ejc;
        Sun, 26 Feb 2023 21:45:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+up3j7QjUpF7nS2rinDc+fDmURLwgaWzzb2iRra3E58CTCZTHl4KWCoPrchg0oBGxdDkdu
X-Received: by 2002:ac8:5e0a:0:b0:3b3:7707:9b92 with SMTP id h10-20020ac85e0a000000b003b377079b92mr24065420qtx.15.1677476758198;
        Sun, 26 Feb 2023 21:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476758; cv=none;
        d=google.com; s=arc-20160816;
        b=HtnRzShk+/+0E8ap6X/9Qcc/6euyiNwnFOJTIRapgmR83TgjBrArLBi4HRNetpTRFF
         JdN+zHKSuiWcRXqUxidtYaHRscLLEvfY4BmSq38jVThGrDN58Oq2+c4IF3YC/yL/2+jv
         XglwjHE27uNC7qfnx36pre4/CFfml1+vydFYPukKkz5HMDuzv07PF03wxLH7IPCl9obq
         XVFN80m4JRe4yF/Nd3l2vv1STHEHKewNRICohet437CGGZChlSTnbP9f2ygQbfP6ewCY
         75cfWpdYD391adZHiqLUQoLyT97afMyiWm2w4EdaQANGkztmUl/Lay7Z6H64+riV9Y31
         QALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MxXl5KF71DhlaBsV+RHw1EwwhElryOwogRYDGewzQzE=;
        b=gv5xOcCJXLpAaj4uY4HOsWZrOduNQZHHmlaBaTRCFDgPohg+IPBxvMRoXmPXt5f8Yl
         8oSbqery4zQ/qoPwKIEbdxSrAdTr2XJX+3W7ZMbCAZQpQGDDeEXTrY4GJXB5NbWSKkWJ
         mfP1aUi/AYUEiBIBCfVOEEgW7feRnQ8XAYmLm6SJCJwogD+8a2qIi6or1AfZbJI82BRV
         GOv1AIGRj2f1Q/KQJBmYpyhiqGbWIMT26Fz8zveWFhSq89zW8wRQiUOgNf2QNJsfaQMn
         7A/eI/dml6gs+e14175Ul8ArJs4ICh04fjdQz8RY8ZbOBgwQ6J65vm1Xf4oHI1bJ3mfg
         cGpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+aIQFx1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b003bac7925889si5487894qta.412.2023.02.26.21.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:45:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+aIQFx1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJH-0006wG-IG; Mon, 27 Feb 2023 00:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ8-00066V-4G
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:18 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIw-00059Z-Fr
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:17 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8870366pjb.3
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxXl5KF71DhlaBsV+RHw1EwwhElryOwogRYDGewzQzE=;
 b=L+aIQFx1HWcGWNQ4XX/bF83Fx9vN/XqK25oXZMwLL18lRapyzh28edn4vRWnXTZc+/
 Lg42QIk7BFnfo0CSeOvZJNbdLAy2uy8cORs8xnIBEKjGb54Njp7Taf2Oa2UouyPpr0pf
 gf57B0R6rCUsFMxh3Ab0A065waS5OnMDFtqWeyCQIEhMyyKEYu7xTe7aDQydwOuJg/95
 6VbZ4ErBjOE0OhvT0nOlSwXjRCdl11kmBN4wEGA0BiL/p9aK7HD4y9siuDAXY0jKEgzt
 YlvRHpitJnzBt59NF3wL0uTto8QUHeCB1IuY2LIe/egyKlVO+IFFMxb/3uexhpOqLTVR
 z1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxXl5KF71DhlaBsV+RHw1EwwhElryOwogRYDGewzQzE=;
 b=JIQ8WnLydBMaRzVSTam8aTQ56bRd5qb0GvntKo4twomWhYjRqXsG8LjkoJPdtSNen1
 hRkc/asrfgguAB0s2wdGFUKinHBci5S8xxfOgpLEKUdH5BCeX6F3OXfViudC762PzTUN
 Z5LI03BzY4thRPuuWvGhBzd/sO0lGJrXR4m5XTy8n0fM2QVuSddCHlbo1IAX1I//EY6i
 xiDb8xxAfn2gviymATy4BXFmpAHOXKDGcnfqEWNN97x81gUJL+Otjg4F7sy077zPWJFr
 s5DMNLbymgnNA0O2Cd7/lTlCU/HJAEYIOhluH8Ix3a8s1eK31/isMmI2jVki+LD/aWXB
 ZbzA==
X-Gm-Message-State: AO0yUKX/MYZ83MuPihd+ewovJ2pEMS2XB3+yypSYtPJcU1pSKOw6IvAH
 A7ldV08Bwt/jKbUGHHECatOtcQ==
X-Received: by 2002:a05:6a20:1443:b0:c6:c030:81aa with SMTP id
 a3-20020a056a20144300b000c6c03081aamr29213041pzi.59.1677476643715; 
 Sun, 26 Feb 2023 21:44:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 30/70] target/mips: Split out gen_lxl
Date: Sun, 26 Feb 2023 19:41:53 -1000
Message-Id: <20230227054233.390271-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NMsx9wDvsBA1

Common subroutine for LDL and LWL.
Use tcg_constant_tl instead of tcg_const_tl and t2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 106 ++++++++++++------------------------
 1 file changed, 36 insertions(+), 70 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0f27ca6149..f8ea7a54a3 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1995,6 +1995,32 @@ static target_ulong pc_relative_pc(DisasContext *ctx)
     return pc;
 }
 
+/* LWL or LDL, depending on MemOp. */
+static void gen_lxl(DisasContext *ctx, TCGv reg, TCGv addr,
+                     int mem_idx, MemOp mop)
+{
+    int sizem1 = memop_size(mop) - 1;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    /*
+     * Do a byte access to possibly trigger a page
+     * fault with the unaligned address.
+     */
+    tcg_gen_qemu_ld_tl(t1, addr, mem_idx, MO_UB);
+    tcg_gen_andi_tl(t1, addr, sizem1);
+    if (!cpu_is_bigendian(ctx)) {
+        tcg_gen_xori_tl(t1, t1, sizem1);
+    }
+    tcg_gen_shli_tl(t1, t1, 3);
+    tcg_gen_andi_tl(t0, addr, ~sizem1);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, mop);
+    tcg_gen_shl_tl(t0, t0, t1);
+    tcg_gen_shl_tl(t1, tcg_constant_tl(-1), t1);
+    tcg_gen_andc_tl(t1, reg, t1);
+    tcg_gen_or_tl(reg, t0, t1);
+}
+
 /* Load */
 static void gen_ld(DisasContext *ctx, uint32_t opc,
                    int rt, int base, int offset)
@@ -2034,25 +2060,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_LDL:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 7);
-        if (!cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 7);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~7);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
-        tcg_gen_shl_tl(t0, t0, t1);
-        t2 = tcg_const_tl(-1);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_andc_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        gen_store_gpr(t0, rt);
+        gen_lxl(ctx, t1, t0, mem_idx, MO_TEUQ);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LDR:
         t1 = tcg_temp_new();
@@ -2133,26 +2143,10 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         /* fall through */
     case OPC_LWL:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 3);
-        if (!cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 3);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~3);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
-        tcg_gen_shl_tl(t0, t0, t1);
-        t2 = tcg_const_tl(-1);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_andc_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        tcg_gen_ext32s_tl(t0, t0);
-        gen_store_gpr(t0, rt);
+        gen_lxl(ctx, t1, t0, mem_idx, MO_TEUL);
+        tcg_gen_ext32s_tl(t1, t1);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LWRE:
         mem_idx = MIPS_HFLAG_UM;
@@ -4220,28 +4214,12 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         case OPC_GSLWLC1:
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-            if (!cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 3);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, rt);
+            t1 = tcg_temp_new();
             tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
+            gen_lxl(ctx, t1, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_trunc_tl_i32(fp0, t1);
             gen_store_fpr32(ctx, fp0, rt);
             break;
         case OPC_GSLWRC1:
@@ -4277,21 +4255,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-            if (!cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 7);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            gen_store_fpr64(ctx, t0, rt);
+            gen_lxl(ctx, t1, t0, ctx->mem_idx, MO_TEUQ);
+            gen_store_fpr64(ctx, t1, rt);
             break;
         case OPC_GSLDRC1:
             check_cp1_enabled(ctx);
-- 
2.34.1

