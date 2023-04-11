Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp185234ejc;
        Mon, 10 Apr 2023 18:11:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YohLER2LdM9XnipO4fLmMWTfHhPhZdlLtQXVl6GeCSorvYj78ohtC7RONtwYjKs7DcVsru
X-Received: by 2002:a05:6214:3015:b0:5ac:58cc:69d1 with SMTP id ke21-20020a056214301500b005ac58cc69d1mr1728911qvb.31.1681175495713;
        Mon, 10 Apr 2023 18:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175495; cv=none;
        d=google.com; s=arc-20160816;
        b=L3FzkR61tA/t6j69Y5iySv8d2GDPj+tmhmTJOxCAvlloBf9cpDg2s7+jogidcbhQvn
         PJfu2CFDyyMvj7NOVQEeKMeT8EpRRbAsPEnpvFmm2VsWwdwuSBZz4+AATEglh+ubJtOZ
         87SenRUU8QqNgENnrpdKKxR9fq7we3J/WYfApxIVy16GdZkrVf12x3yCsp/3w3TQkd0k
         VCA/0oiCIy8IlGsC4pffVkmex88EoWHO+axHJZLfg426GUSFjERghjrYMg7CmQ+7yqkH
         xl8fC9dh+8eaO6auFcQRkJ45cEyIh+5U5UnSrGhU6UcCJjsTc9tV6+MpBl/QW6tdsW2l
         n7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w0cVKKb6OkfCs8ScLtitxNcu602nNA4eo/HP0ekxDYA=;
        b=F16jOk9bjkpGjk0nhZO6ox/LzdOOldcQ+42kpihNhRZQIDODALL6GZDl296vbco0Jq
         E1h6fSVpwctAnVL7LUNoQX97EP+/Kwynqeq7GrzbhheHeklovTrPjzw5ViTOxqJXA2aX
         OHM5vISVvMtMZG9b+G2HamxXSwEqvFj1GQN/IF8k21RlmN8tbHLtr+BTwfxV7bC+3LmH
         kQiwVQp/4cV5TJygpSDfKME0Z3KB6Kvta9oVPeY2z+ImK/8jvMROxtExosks8UHbD28B
         fy7iCzJehjdNzTuzzb1UQ5mGtJhCuN04R47o99hqrIgHlGfL9aUTkBU7ncqffdG6VoFy
         KxuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kuBdaWY/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75-20020a37684e000000b0074697cc769fsi7997907qkc.149.2023.04.10.18.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kuBdaWY/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sr-0005It-2U; Mon, 10 Apr 2023 21:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2S5-0004ZD-QX
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2S0-0000YK-Q2
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:41 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so3809145ad.1
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w0cVKKb6OkfCs8ScLtitxNcu602nNA4eo/HP0ekxDYA=;
 b=kuBdaWY/I5/o0SpMRE67drranlrNM+GC4EQltBjMg+H2MAKwLLkvRR9KiCPXig71ea
 WpejkhxRgZuJIjzFsifasM5UYeu51bpb7DAJ/SAt+DSWnnV4XKKmNBZJqhN49GUZMc6K
 aEUtKogFRhijF6jw2f+x70OtrfYaQNvzyXPFBx98UyyEtCQDLegoZZRvkbYX9tYiWfb4
 jwja4fpP5TC6vwyUWQJ4YlPH33eoCuiF68OGQkc85GLnPEk6XGDHgIxKrvSvZZavHztJ
 ne6nEGClycqixoXhU6c9Mc2xwkNgk1+RsmwnFbECr94p8XhK77ztwkHxICH+0e6PZDJX
 jSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w0cVKKb6OkfCs8ScLtitxNcu602nNA4eo/HP0ekxDYA=;
 b=FiSiuXdxLXANMSgjsEoiiIY4/YO6tTXPcPe63Xo4iuAy5kwr1INQ07T9EZqBvQjHP7
 +DpN58uC3wLG6inEEsS6pr7URlipK6rrfLDdo5U9ueJNnqzOXUvPe0FeTPIymGC7wZj9
 kVe+pgZe7C6R6cg5QKN7WLoruhhlguaMXfWFQ6XiB4tqv+BCyJuSb0J/6MK0Tf+/4y+4
 ZJ6DsuY29SEpQ5AyRVCXgOSIY52E9dpdp06w08kFa1hnpHPsX60oLLAaMNCLTPwaDTkC
 y5og5MzyXiORJQk2jHzFbKc9c375O3AN2YfX70fG7SLQ+xnaXdJdNUONoH9sEp45TAif
 aLdQ==
X-Gm-Message-State: AAQBX9fEjOU7Xd6dTLgNO5smnLnB8y8v0vEpoRDoIsO48ek5LMIDUtW3
 wZsf79TzxgR5LGhpf7zAjfRM9A==
X-Received: by 2002:a62:2583:0:b0:638:63a3:2474 with SMTP id
 l125-20020a622583000000b0063863a32474mr744020pfl.26.1681175135796; 
 Mon, 10 Apr 2023 18:05:35 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 09/54] tcg: Split out tcg_out_exts_i32_i64
Date: Mon, 10 Apr 2023 18:04:27 -0700
Message-Id: <20230411010512.5375-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: eDGKPmvWrMUs

We will need a backend interface for type extension with sign.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 4 ++++
 tcg/aarch64/tcg-target.c.inc     | 9 ++++++---
 tcg/arm/tcg-target.c.inc         | 5 +++++
 tcg/i386/tcg-target.c.inc        | 9 ++++++---
 tcg/loongarch64/tcg-target.c.inc | 7 ++++++-
 tcg/mips/tcg-target.c.inc        | 7 ++++++-
 tcg/ppc/tcg-target.c.inc         | 9 ++++++---
 tcg/riscv/tcg-target.c.inc       | 7 ++++++-
 tcg/s390x/tcg-target.c.inc       | 9 ++++++---
 tcg/sparc64/tcg-target.c.inc     | 9 ++++++---
 tcg/tci/tcg-target.c.inc         | 7 ++++++-
 11 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a182771c01..b0498170ea 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -111,6 +111,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4529,6 +4530,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext32u_i64:
         tcg_out_ext32u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext_i32_i64:
+        tcg_out_exts_i32_i64(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index bca5f03dfb..58596eaa4b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1434,6 +1434,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext32s(s, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2260,9 +2265,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2332,6 +2334,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5c48b92f83..2ca25a3d81 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1003,6 +1003,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7d63403693..fd4c4e20c8 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1299,6 +1299,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_modrm(s, OPC_MOVSLQ, dest, src);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32s(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2757,9 +2762,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32u(s, a0, a1);
         break;
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_shifti(s, SHIFT_SHR + P_REXW, a0, 32);
         break;
@@ -2838,6 +2840,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d2511eda7a..989632e08a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -456,6 +456,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1251,7 +1256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_extrl_i64_i32:
-    case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
 
@@ -1615,6 +1619,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index fe90547c43..df36bec5c0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -580,6 +580,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_sa(s, OPC_SLL, rd, rs, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2294,7 +2299,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_ext_i32_i64:
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -2447,6 +2451,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 55d4524947..e24f897765 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -807,6 +807,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out_ext32s(s, dst, src);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -2981,9 +2986,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
         break;
@@ -3133,6 +3135,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1d91fd19c6..7bd3b421ad 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -602,6 +602,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1602,7 +1607,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_extrl_i64_i32:
-    case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
 
@@ -1639,6 +1643,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 825dbfc523..60deaa9a95 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1122,6 +1122,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGFR, dest, src);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32s(s, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2524,9 +2529,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
         break;
@@ -2627,6 +2629,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 6464d1fb5e..56ffc6ed91 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -527,6 +527,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rs, 0, SHIFT_SRL);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1677,9 +1682,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -1738,6 +1740,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index bc7b5a410c..7886f21bf5 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -629,6 +629,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_op_rr(s, INDEX_op_ext32u_i64, rd, rs);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -787,7 +792,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(ext_i32)
     CASE_64(extu_i32)
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
     case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
@@ -871,6 +875,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

