Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp186897ejc;
        Mon, 10 Apr 2023 18:15:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmgMSgyZfPrihP0jLfdAluv9V37qjRFCliQ+RX7rVQEHP2T7YnZzrcOC1oupbP9laDJjGM
X-Received: by 2002:ac8:5704:0:b0:3bf:b5fe:372d with SMTP id 4-20020ac85704000000b003bfb5fe372dmr14600226qtw.61.1681175728161;
        Mon, 10 Apr 2023 18:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175728; cv=none;
        d=google.com; s=arc-20160816;
        b=rDZWnhiuevW+b9EaCgDJd224w+xjZfigTmqCYVRcPKUgSZ91n5sIfrUztJT3/lqnRm
         EOAHIokhxxMzT5wRdNZrgv3V5LWU7mlJWSqUltZgQtRzeK7wQvFHH4iRruLhUlk+DpH7
         D8O2xQjOcXS4gJnxwBCQjqsOwn7xbcASl7NllpBz+Gk0E3uHIySyda2WzOgDcg4AP+Rt
         y42w5s060BqDqJzGGrwBXHHwCo5ORMDbK8MjyYcZ66bFgZf//cu8rRGwcCQxER0YZaOw
         KG3kk4R5MMJltqlTqYn31FB305Ccm8+UsNwH123xAV86v/c3YAloagtuCfRlrSnDWFbL
         MEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=14rBhklhvDo1V9kW+8pac3sP0tDbR7NixB7NEp+EaWQ=;
        b=ldAtnnyR6JzXdmHVSqquKNGCIa2Bl7kup6GGvOWlrTtUYYEUMO9iMC6SBNVc4H3KGC
         Tn+4+oKQvfiiOfGgteAcg1EXGLgWGrtjyhCy4yDQT3EmVl/mRsrvNsv9rgxsm3yqkmqy
         c7hpVT6aJrt/gKV560WC06kb8WA0Jm6f9BmTg8uhry/u+PhXSBlf7npfMr6mNAcoTIZp
         RphGdZqI2/yvPvr6Wp1qLMYPotjT0bZfdq+8g6R0g+ibtcGMCf7X0zgWYQXjcaV287BH
         h4Ya0aO8+S0X7LeHjkfCI7fUBgC0M8zYrUMrQVkqaQQzYo81u4wgWXOs50iMlCgmgx6T
         Uv7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kT6dkqPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q35-20020a05620a2a6300b0074a36d76847si8564264qkp.239.2023.04.10.18.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kT6dkqPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sx-0005dl-Uy; Mon, 10 Apr 2023 21:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SM-0004dz-2a
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SI-0000i0-3A
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id ik20so6144202plb.3
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14rBhklhvDo1V9kW+8pac3sP0tDbR7NixB7NEp+EaWQ=;
 b=kT6dkqPJ69/DG8tCZjZ6sf/11MQaZGb80T0k4ItHIHW8XXphwfi2kfvn7eJQtQA1zE
 SDfgixlRmCxjqO8SZ9wYkzBVuNQcpYCBA8JZ34Vt7OtPrJg45P4Gw7uSSHGFFcRMP5H6
 YfEdfaFhwEeu6fWoKS7AXkcXTJ4zYbkAqJ+ZYI5rIMLiBJaXTEdgM3Rfmh9Gth9ffGQR
 GC/+BWeZa+BX7E79Dv54hYhKRX6mgqfa3Hsmn3Ao7EHeT24R21UvEyUT7p8a8CUSdcNm
 ZHKpjW7eSp/NwigZF73PPQ1TKARUyzRj1AWNkvig+WQ2B5thxVqI9R1KKSo+kgEnQS8Q
 lnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14rBhklhvDo1V9kW+8pac3sP0tDbR7NixB7NEp+EaWQ=;
 b=c23SJWlBa3aE+31uB93cgKNMYadgnB5g1wA5jgdp3q3NvbYmvd/QaPzVc9xTjsxi81
 KT7vLGhjKmEolEujs+3Btt738Fnj0oS3jtSJuZwE09Y3YcO6emk6qLD07BaKt/K4Fcpu
 U6IBMgcHytaUBm+P4LceCwh+uVO9b0Aszdzca9BrZiMgedI3lgsTtgIswn5fHLhiTDex
 uF6mwPqWslpAP3XxaitnLXF+hjdtpntkwHHqK5gh8W8dFraQ4N6rckllAHEAAK+S8HSE
 llfRLENMW2jcpfJgepwx8vmALljuLufrnhcF54xe/l+En+BWBGUj8hx+sM+kFTbHDmUo
 nevg==
X-Gm-Message-State: AAQBX9cN/Ph+c+alfWZ5YuXfl4sLge0BSWRYooo9+3bcsV+jJwRSbMkT
 j6alPW3doJ4U/Vd+1d5adnjPxGewIxkx5abH2/f6gg==
X-Received: by 2002:a05:6a20:7a22:b0:da:35d1:c474 with SMTP id
 t34-20020a056a207a2200b000da35d1c474mr8119482pzh.62.1681175151805; 
 Mon, 10 Apr 2023 18:05:51 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 13/54] tcg: Split out tcg_out_extu_i32_i64
Date: Mon, 10 Apr 2023 18:04:31 -0700
Message-Id: <20230411010512.5375-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: n7jeX5HpNO2i

We will need a backend interface for type extension with zero.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     | 10 ++++++----
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  7 ++++++-
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        |  9 ++++++---
 tcg/ppc/tcg-target.c.inc         | 10 ++++++----
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       | 10 ++++++----
 tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
 tcg/tci/tcg-target.c.inc         |  7 ++++++-
 11 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index b0498170ea..17bd6d4581 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -112,6 +112,7 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4533,6 +4534,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext_i32_i64:
         tcg_out_exts_i32_i64(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_extu_i32_i64:
+        tcg_out_extu_i32_i64(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 58596eaa4b..ca8b25865b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1462,6 +1462,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_movr(s, TCG_TYPE_I32, rd, rn);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext32u(s, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2265,10 +2270,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_deposit_i64:
     case INDEX_op_deposit_i32:
         tcg_out_dep(s, ext, a0, REG0(2), args[3], args[4]);
@@ -2335,6 +2336,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2ca25a3d81..2135616e12 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1008,6 +1008,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index fd4c4e20c8..40d661072b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1304,6 +1304,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32s(s, dest, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2758,7 +2763,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
-    case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2841,6 +2845,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b2146988be..d83bd9de49 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -463,6 +463,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     }
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32u(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1253,10 +1258,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -1622,6 +1623,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 2bc885e00e..4789b0a40c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -587,6 +587,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2304,9 +2309,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
 
     case INDEX_op_sar_i32:
         i1 = OPC_SRAV, i2 = OPC_SRA;
@@ -2454,6 +2456,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e24f897765..bd298c55fd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -812,6 +812,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_ext32s(s, dst, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out_ext32u(s, dst, src);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -2986,10 +2991,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
-        break;
-
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
                         const_args[2]);
@@ -3136,6 +3137,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 2b9aab29ec..a6d352976c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -609,6 +609,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     }
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32u(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1604,10 +1609,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -1646,6 +1647,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 60deaa9a95..e17d000991 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1127,6 +1127,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32s(s, dest, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2529,10 +2534,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
-        break;
-
     case INDEX_op_add2_i64:
         if (const_args[4]) {
             if ((int64_t)args[4] >= 0) {
@@ -2630,6 +2631,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 56ffc6ed91..c57a8c8304 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -532,6 +532,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1682,9 +1687,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
     case INDEX_op_extrl_i64_i32:
         tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
         break;
@@ -1741,6 +1743,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7886f21bf5..48c9dbd0b4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -634,6 +634,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -792,7 +797,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(extu_i32)
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
     case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
     case INDEX_op_bswap64_i64: /* Optional (TCG_TARGET_HAS_bswap64_i64). */
@@ -876,6 +880,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

