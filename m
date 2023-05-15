Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6574571ejq;
        Mon, 15 May 2023 08:03:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QOl01aI7gubBw9elRHjWBmkutKtxG37JIZxKKSXv6wOd3lL7b/OMa056sMZTzFLrmdhQc
X-Received: by 2002:a5d:558d:0:b0:306:3604:255b with SMTP id i13-20020a5d558d000000b003063604255bmr24490657wrv.5.1684163016711;
        Mon, 15 May 2023 08:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163016; cv=none;
        d=google.com; s=arc-20160816;
        b=o1Wd2GmAERh3nAB40mAIfYi+JvnKRUzB1fT3wD/ICGWz3Lcs/LvyyuhxDYyfGfLfM1
         JwKdof1peI4rXne4yX7/Xza2rZtFi1DrodrDp7qtODy8AhYuNGzTzrvvA6d+jGKspcSi
         NTmxXmbcbGEAGzhOnQeRlzvl2DlNyNxJZdp1I6bMXThxlAC2akEFSuMq50utL90tq0XS
         qCjsgMIJxLXDgRCdY2+Hx8dfwEYEknNCN6p2DN8tQTj2xBTLmkLsbL/4TaMqfGwN0FjT
         OyzoFExOnZVvEuoQ5H0WA8Tw78r0YW6StsF5EZSs1TPKX/Oz39plX/dPHwvldVdk+IDF
         E/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IAYOvh1bwAhumLvlgygLCHUMrrkGrbmEQT9VUhbIKvg=;
        b=WKAEWTYgXdlnyemNZPs/OHNWn9HUqgPCdSOi9kJFN9/HMl7kbnHeYIuD4YaHexz6Uf
         YPilRdiYZYMxM5wlhnk1TguwSBskD8coe2Ug8oe4IEV52sqZlqqcUhpCUdDV78sCHenm
         wkqByTzrZBPcONZw0YisjAtRncgZQJUGLUOFPiclx7rBX3M74176l3w184HBOY8zsZHw
         kcyJeAAdjTgWlXa0H93gcAUphZzIzYG6sj0hXFClw2h+pc6+v0p1N2WcIywX0XrEZwGf
         gGs0bSZrEY6L5ndyeB3esK8sTOwoVPvIni7O2Z+bGMZz7ozCZQyg6i7DVfBjjDAaT9xN
         xAXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qmCiNUVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020adfd4cf000000b0030633827215si20549wrk.345.2023.05.15.08.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qmCiNUVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZKM-00063g-Mi; Mon, 15 May 2023 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHz-0007Ok-4D
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:35:03 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHg-00053k-LP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:35:02 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aad6f2be8eso118637165ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161227; x=1686753227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAYOvh1bwAhumLvlgygLCHUMrrkGrbmEQT9VUhbIKvg=;
 b=qmCiNUVp0HA6wX2iE0+g8ygvkiJBd611/2xuWR2oPgtyU13sygWDDUWuVRsUe5af8V
 63siCQJq+cROpGR9zIJHIJ0BRUoIcH5m49Ye/k0hdcMzmmi2gangqqA/9cYaH85Af8ah
 JZDTjyPwufJZv18Z/e67oFI1hvDmeW7fkks+3y5f7Jeg01yCXyzzq8anRyg+rvN5bJmi
 g1WwTMXr7SXqiJoGoaFxKnRvznPkTNVcBkpYqnGSqipzfJ5g36EGT49F95C2RmFgA+lX
 qDlSY033qV8yApbLoK3HetlCUKwCkc3sgO2+NBQx1dVMRs4G6yPnuk5AyYgfHfpDhevJ
 eLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161227; x=1686753227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAYOvh1bwAhumLvlgygLCHUMrrkGrbmEQT9VUhbIKvg=;
 b=i6DVTxeFIIjCGyB9jjM6Pd3NeBiTVzRKpJwy0FlNT+M5YEhw/UsAYyNiEdo5LX40ul
 9fokdPCeUtLaxsXGyAhh4cNEr57cGziLSVqQhDJ4xAdcCWbTtWJ4Bj8MaSlrF5EkuTX/
 zy5jAzk6fZwlmKLpJTua5BeEZcuP44Fm3ViNryY5Nk63kSYMT0Pm/D4cqwho3SqYPxUK
 4gDpmwc5Spb/TgFHw6Xdno7DArkNKzR4ntUmQ/DQfW4w7TXIwxFsklQVgD37n9ywM2Di
 zX7ppEROPGmORaa47S0A8YURCy9f6sp7FgGrY6h+3ehPOpW7150+a7QMz2ozLgDPoEA0
 IIwg==
X-Gm-Message-State: AC+VfDzq8xyTEb2Y8phupbRv2yR3Bbn7VjwcT+xCtXB7Q/IvUGkzG8mN
 a+P940cM7+HOjBkExxhSa2aUTCovjaXEZ07F2UU=
X-Received: by 2002:a17:902:8691:b0:19a:9890:eac6 with SMTP id
 g17-20020a170902869100b0019a9890eac6mr32126898plo.24.1684161227210; 
 Mon, 15 May 2023 07:33:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 38/54] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
Date: Mon, 15 May 2023 07:32:57 -0700
Message-Id: <20230515143313.734053-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: VSK09c5cOGh/

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 196 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 163 insertions(+), 33 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ff7aec23e7..10429be039 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -206,6 +206,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] __attribute__((unused)) = {
     [MO_UQ] = helper_ldq_mmu,
 #if TCG_TARGET_REG_BITS == 64
     [MO_SL] = helper_ldsl_mmu,
+    [MO_128] = helper_ld16_mmu,
 #endif
 };
 
@@ -214,6 +215,9 @@ static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
     [MO_16] = helper_stw_mmu,
     [MO_32] = helper_stl_mmu,
     [MO_64] = helper_stq_mmu,
+#if TCG_TARGET_REG_BITS == 64
+    [MO_128] = helper_st16_mmu,
+#endif
 };
 
 TCGContext tcg_init_ctx;
@@ -866,6 +870,15 @@ static TCGHelperInfo info_helper_ld64_mmu = {
               | dh_typemask(ptr, 4)  /* uintptr_t ra */
 };
 
+static TCGHelperInfo info_helper_ld128_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(i128, 0) /* return Int128 */
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i32, 3)  /* unsigned oi */
+              | dh_typemask(ptr, 4)  /* uintptr_t ra */
+};
+
 static TCGHelperInfo info_helper_st32_mmu = {
     .flags = TCG_CALL_NO_WG,
     .typemask = dh_typemask(void, 0)
@@ -886,6 +899,16 @@ static TCGHelperInfo info_helper_st64_mmu = {
               | dh_typemask(ptr, 5)  /* uintptr_t ra */
 };
 
+static TCGHelperInfo info_helper_st128_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(void, 0)
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i128, 3) /* Int128 data */
+              | dh_typemask(i32, 4)  /* unsigned oi */
+              | dh_typemask(ptr, 5)  /* uintptr_t ra */
+};
+
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
@@ -1299,8 +1322,10 @@ static void tcg_context_init(unsigned max_cpus)
 
     init_call_layout(&info_helper_ld32_mmu);
     init_call_layout(&info_helper_ld64_mmu);
+    init_call_layout(&info_helper_ld128_mmu);
     init_call_layout(&info_helper_st32_mmu);
     init_call_layout(&info_helper_st64_mmu);
+    init_call_layout(&info_helper_st128_mmu);
 
 #ifdef CONFIG_TCG_INTERPRETER
     init_ffi_layouts();
@@ -5395,6 +5420,8 @@ static unsigned tcg_out_helper_add_mov(TCGMovExtend *mov,
                                        TCGType dst_type, TCGType src_type,
                                        TCGReg lo, TCGReg hi)
 {
+    MemOp reg_mo;
+
     if (dst_type <= TCG_TYPE_REG) {
         MemOp src_ext;
 
@@ -5422,19 +5449,25 @@ static unsigned tcg_out_helper_add_mov(TCGMovExtend *mov,
         return 1;
     }
 
-    assert(TCG_TARGET_REG_BITS == 32);
+    if (TCG_TARGET_REG_BITS == 32) {
+        assert(dst_type == TCG_TYPE_I64);
+        reg_mo = MO_32;
+    } else {
+        assert(dst_type == TCG_TYPE_I128);
+        reg_mo = MO_64;
+    }
 
     mov[0].dst = loc[HOST_BIG_ENDIAN].arg_slot;
     mov[0].src = lo;
-    mov[0].dst_type = TCG_TYPE_I32;
-    mov[0].src_type = TCG_TYPE_I32;
-    mov[0].src_ext = MO_32;
+    mov[0].dst_type = TCG_TYPE_REG;
+    mov[0].src_type = TCG_TYPE_REG;
+    mov[0].src_ext = reg_mo;
 
     mov[1].dst = loc[!HOST_BIG_ENDIAN].arg_slot;
     mov[1].src = hi;
-    mov[1].dst_type = TCG_TYPE_I32;
-    mov[1].src_type = TCG_TYPE_I32;
-    mov[1].src_ext = MO_32;
+    mov[1].dst_type = TCG_TYPE_REG;
+    mov[1].src_type = TCG_TYPE_REG;
+    mov[1].src_ext = reg_mo;
 
     return 2;
 }
@@ -5457,6 +5490,9 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
     case MO_64:
         info = &info_helper_ld64_mmu;
         break;
+    case MO_128:
+        info = &info_helper_ld128_mmu;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -5471,8 +5507,33 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     tcg_out_helper_load_slots(s, nmov, mov, parm);
 
-    /* No special attention for 32 and 64-bit return values. */
-    tcg_debug_assert(info->out_kind == TCG_CALL_RET_NORMAL);
+    switch (info->out_kind) {
+    case TCG_CALL_RET_NORMAL:
+    case TCG_CALL_RET_BY_VEC:
+        break;
+    case TCG_CALL_RET_BY_REF:
+        /*
+         * The return reference is in the first argument slot.
+         * We need memory in which to return: re-use the top of stack.
+         */
+        {
+            int ofs_slot0 = TCG_TARGET_CALL_STACK_OFFSET;
+
+            if (arg_slot_reg_p(0)) {
+                tcg_out_addi_ptr(s, tcg_target_call_iarg_regs[0],
+                                 TCG_REG_CALL_STACK, ofs_slot0);
+            } else {
+                tcg_debug_assert(parm->ntmp != 0);
+                tcg_out_addi_ptr(s, parm->tmp[0],
+                                 TCG_REG_CALL_STACK, ofs_slot0);
+                tcg_out_st(s, TCG_TYPE_PTR, parm->tmp[0],
+                           TCG_REG_CALL_STACK, ofs_slot0);
+            }
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
 }
@@ -5481,11 +5542,18 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
                                   bool load_sign,
                                   const TCGLdstHelperParam *parm)
 {
+    MemOp mop = get_memop(ldst->oi);
     TCGMovExtend mov[2];
+    int ofs_slot0;
 
-    if (ldst->type <= TCG_TYPE_REG) {
-        MemOp mop = get_memop(ldst->oi);
+    switch (ldst->type) {
+    case TCG_TYPE_I64:
+        if (TCG_TARGET_REG_BITS == 32) {
+            break;
+        }
+        /* fall through */
 
+    case TCG_TYPE_I32:
         mov[0].dst = ldst->datalo_reg;
         mov[0].src = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, 0);
         mov[0].dst_type = ldst->type;
@@ -5511,25 +5579,49 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
             mov[0].src_ext = mop & MO_SSIZE;
         }
         tcg_out_movext1(s, mov);
-    } else {
-        assert(TCG_TARGET_REG_BITS == 32);
+        return;
 
-        mov[0].dst = ldst->datalo_reg;
-        mov[0].src =
-            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
-        mov[0].dst_type = TCG_TYPE_I32;
-        mov[0].src_type = TCG_TYPE_I32;
-        mov[0].src_ext = MO_32;
+    case TCG_TYPE_I128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        ofs_slot0 = TCG_TARGET_CALL_STACK_OFFSET;
+        switch (TCG_TARGET_CALL_RET_I128) {
+        case TCG_CALL_RET_NORMAL:
+            break;
+        case TCG_CALL_RET_BY_VEC:
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       TCG_REG_CALL_STACK, ofs_slot0);
+            /* fall through */
+        case TCG_CALL_RET_BY_REF:
+            tcg_out_ld(s, TCG_TYPE_I64, ldst->datalo_reg,
+                       TCG_REG_CALL_STACK, ofs_slot0 + 8 * HOST_BIG_ENDIAN);
+            tcg_out_ld(s, TCG_TYPE_I64, ldst->datahi_reg,
+                       TCG_REG_CALL_STACK, ofs_slot0 + 8 * !HOST_BIG_ENDIAN);
+            return;
+        default:
+            g_assert_not_reached();
+        }
+        break;
 
-        mov[1].dst = ldst->datahi_reg;
-        mov[1].src =
-            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
-        mov[1].dst_type = TCG_TYPE_REG;
-        mov[1].src_type = TCG_TYPE_REG;
-        mov[1].src_ext = MO_32;
-
-        tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
+    default:
+        g_assert_not_reached();
     }
+
+    mov[0].dst = ldst->datalo_reg;
+    mov[0].src =
+        tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
+    mov[0].dst_type = TCG_TYPE_I32;
+    mov[0].src_type = TCG_TYPE_I32;
+    mov[0].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
+
+    mov[1].dst = ldst->datahi_reg;
+    mov[1].src =
+        tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
+    mov[1].dst_type = TCG_TYPE_REG;
+    mov[1].src_type = TCG_TYPE_REG;
+    mov[1].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
+
+    tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
 }
 
 static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
@@ -5553,6 +5645,10 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
         info = &info_helper_st64_mmu;
         data_type = TCG_TYPE_I64;
         break;
+    case MO_128:
+        info = &info_helper_st128_mmu;
+        data_type = TCG_TYPE_I128;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -5570,13 +5666,47 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     /* Handle data argument. */
     loc = &info->in[next_arg];
-    n = tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
-                               ldst->datalo_reg, ldst->datahi_reg);
-    next_arg += n;
-    nmov += n;
-    tcg_debug_assert(nmov <= ARRAY_SIZE(mov));
+    switch (loc->kind) {
+    case TCG_CALL_ARG_NORMAL:
+    case TCG_CALL_ARG_EXTEND_U:
+    case TCG_CALL_ARG_EXTEND_S:
+        n = tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
+                                   ldst->datalo_reg, ldst->datahi_reg);
+        next_arg += n;
+        nmov += n;
+        tcg_out_helper_load_slots(s, nmov, mov, parm);
+        break;
+
+    case TCG_CALL_ARG_BY_REF:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_debug_assert(data_type == TCG_TYPE_I128);
+        tcg_out_st(s, TCG_TYPE_I64,
+                   HOST_BIG_ENDIAN ? ldst->datahi_reg : ldst->datalo_reg,
+                   TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc[0].ref_slot));
+        tcg_out_st(s, TCG_TYPE_I64,
+                   HOST_BIG_ENDIAN ? ldst->datalo_reg : ldst->datahi_reg,
+                   TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc[1].ref_slot));
+
+        tcg_out_helper_load_slots(s, nmov, mov, parm);
+
+        if (arg_slot_reg_p(loc->arg_slot)) {
+            tcg_out_addi_ptr(s, tcg_target_call_iarg_regs[loc->arg_slot],
+                             TCG_REG_CALL_STACK,
+                             arg_slot_stk_ofs(loc->ref_slot));
+        } else {
+            tcg_debug_assert(parm->ntmp != 0);
+            tcg_out_addi_ptr(s, parm->tmp[0], TCG_REG_CALL_STACK,
+                             arg_slot_stk_ofs(loc->ref_slot));
+            tcg_out_st(s, TCG_TYPE_PTR, parm->tmp[0],
+                       TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc->arg_slot));
+        }
+        next_arg += 2;
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 
-    tcg_out_helper_load_slots(s, nmov, mov, parm);
     tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
 }
 
-- 
2.34.1

