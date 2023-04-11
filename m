Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183540ejc;
        Mon, 10 Apr 2023 18:07:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBa7eCtBlDPGwb5cm58+msZckbhSZv7zIVOB/XyudsiEqfB2OOZ7ga2pM8n07mZEUEr+8O
X-Received: by 2002:ac8:5d8b:0:b0:3de:81b0:aac2 with SMTP id d11-20020ac85d8b000000b003de81b0aac2mr1278103qtx.64.1681175259054;
        Mon, 10 Apr 2023 18:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175259; cv=none;
        d=google.com; s=arc-20160816;
        b=oPLEemQthLtu3MmPipQVmlypCTkFGaYp4wG5MXJGhDaSmWuXJiorxA0/3FYpSSp8tn
         xI51EsNaQ0P+VISL1s3daS+4A6IaeE0khd4LOKc2TSOigSt5GK46P1UvAqxXKtnhoNZ0
         nyA3e7da4uxOSXamU554uw5z9n62TWMjmk1aJkyprcu3OFxfWZ/Wu2vczvC02Eylu2ji
         pwC1352PJY+2vU29/CpXLkZYNB8ESJleY2Nk/8OfINgNlpqPFA/6pRb9RV5rwy8JN9rt
         D8tm1JnB+Xk3OtW/EHMdLpCP1p/GVpwXSx3dIP+I90vnz51ftzDFQ6nga4w4w9BmbBr4
         PboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dy7NPgIW63lguB4xoZDcsD09KGdaAPyKLlII+NDH7so=;
        b=xMCZuJUJE6UpoGNwKxHM6oIEf9EWVoqOgpHqmNjqXSIh/jy7iD/sqyWMV4vCRay6Os
         yLkhUNsaKO2DFpRy48BG9twCinBXw9o4olJmOVIqLUc3fvBD5HK3by/CcGn59dbV7TdS
         R3R5DAaxHfe7v3tsgGbQHlKq0hKvurXmGTJjAfH1PjERGe6alZqW0HzwSeurX4OL4O0Y
         EPglT+EcWy6cOJcnjODDbAIV2jURC64FytiD1puZSlHRaRYCLCNXuqbopwu7cWIzzgRz
         HkRf1ucUf0xBsh0kKC4sMtKXB8LT3eV9/+ivBrOVWjbP9+aMvkb86cP9rFoLtKzo1I2T
         6QpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QEuLSAO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac859c8000000b003d416b846fdsi8600146qtf.498.2023.04.10.18.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QEuLSAO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2S1-0004SW-Al; Mon, 10 Apr 2023 21:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Ry-0004Ni-8F
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rt-0000V6-R0
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so11649532pjb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dy7NPgIW63lguB4xoZDcsD09KGdaAPyKLlII+NDH7so=;
 b=QEuLSAO+pON6CPrx7641Z2K3xWdE+gAFjU0F/jKqoPY7OsQ/2KUKrWNKWGFDoYvt+u
 gT4x07GUWPrHqGuKbCYoyk7Dm/5/LKfyHBGSS+KRJOlajuzmzw0ZcluMaU4OpWQZFE/i
 bR2/XzQ8+bR96RkrGxgSym+a3X6zdDzEl634Qxz8IHmkdjmWBoKsp34RvX0Qv8I8/9EN
 amUh7e8LVWgzG07mC7+itEGmREaxHN6kiTePv4MZUE2ps1okCM+cwBcJ3MqSqEjslFGR
 l2mxFSve8u/XT+5gUxcgCYaY4uxdBDh5MzRPLYijH4VfvD7SmmL8nm76JmUr3X6uBEuP
 PSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dy7NPgIW63lguB4xoZDcsD09KGdaAPyKLlII+NDH7so=;
 b=asYBfIR0j5r+u5/V4Ej8WQ3KBb21cEBnnwXFRh5BuzkvE4iP+V/ij1aJgYlyPXYSPi
 TxdV6VRZrtgwG/kcY9WjlRC4GkViMAE7svtvgEU13Lh3+R/EeHYakI03O0rHMqAQ+FPY
 fyE3/CtbdqGE+5TcUP0gPrbknVgipLkppvsVFv0WBAsQ3/sETRWtGYTz+pn/CvwDNpWy
 vpJar5JGLZ7oxBGbESfk4snowFk5af3gzmEUubwP4RWIa5RoRmqzGVgk9wbtQHnd+fJ9
 Vr11V8s/2R7cWDHKPiSlnyr62Rnp4nj9Qt5o5qBQyyzazvXEUS/Zz4C8XwtUfsw1fTKJ
 zazQ==
X-Gm-Message-State: AAQBX9dQ065XaQFU9Bs9nGF5Sylkkjoll8TmKWl7PFj45OUoz4XuxddN
 o2557LeXOJukiutyaYrxe/3zynIgki7Me4/ejRYJRA==
X-Received: by 2002:a17:90b:1644:b0:23f:7ff6:eb8 with SMTP id
 il4-20020a17090b164400b0023f7ff60eb8mr1507790pjb.31.1681175128357; 
 Mon, 10 Apr 2023 18:05:28 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 06/54] tcg: Split out tcg_out_ext16u
Date: Mon, 10 Apr 2023 18:04:24 -0700
Message-Id: <20230411010512.5375-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zIEvrW6WIlvA

We will need a backend interface for performing 16-bit zero-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  5 +++++
 tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
 tcg/arm/tcg-target.c.inc         | 17 ++++++++++-------
 tcg/i386/tcg-target.c.inc        |  8 +++-----
 tcg/loongarch64/tcg-target.c.inc |  7 ++-----
 tcg/mips/tcg-target.c.inc        |  5 +++++
 tcg/ppc/tcg-target.c.inc         |  4 +++-
 tcg/riscv/tcg-target.c.inc       |  7 ++-----
 tcg/s390x/tcg-target.c.inc       | 17 ++++++-----------
 tcg/sparc64/tcg-target.c.inc     | 11 +++++++++--
 tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
 11 files changed, 66 insertions(+), 42 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 739f92c2ee..5b0db747e8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -108,6 +108,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4516,6 +4517,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+        tcg_out_ext16u(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3527c14d04..f55829e9ce 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1442,6 +1442,11 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_uxt(s, MO_8, rd, rn);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_uxt(s, MO_16, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2241,7 +2246,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_ext16s(s, ext, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
-            tcg_out_uxt(s, MO_16, a0, a0);
+            tcg_out_ext16u(s, a0, a0);
         }
         break;
 
@@ -2249,10 +2254,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
-    case INDEX_op_ext16u_i64:
-    case INDEX_op_ext16u_i32:
-        tcg_out_uxt(s, MO_16, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
         tcg_out_movr(s, TCG_TYPE_I32, a0, a1);
@@ -2319,6 +2320,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16u_i64:
+    case INDEX_op_ext16u_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index cddf977a58..8fa0c6cbc0 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -981,12 +981,18 @@ static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
+                                TCGReg rd, TCGReg rn)
 {
     /* uxth */
     tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
@@ -1372,8 +1378,8 @@ DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
     (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
     (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u,
-    (tcg_out_ext16u(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
+DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
+    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
 
 static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
@@ -2249,10 +2255,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
         break;
 
-    case INDEX_op_ext16u_i32:
-        tcg_out_ext16u(s, COND_AL, args[0], args[1]);
-        break;
-
     case INDEX_op_deposit_i32:
         tcg_out_deposit(s, COND_AL, args[0], args[2],
                         args[3], args[4], const_args[2]);
@@ -2303,6 +2305,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16u_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 21bd828146..74a0c1885e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1274,7 +1274,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_modrm(s, OPC_MOVSBL + P_REXB_RM + rexw, dest, src);
 }
 
-static inline void tcg_out_ext16u(TCGContext *s, int dest, int src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     /* movzwl */
     tcg_out_modrm(s, OPC_MOVZWL, dest, src);
@@ -2671,10 +2671,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    OP_32_64(ext16u):
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_qemu_ld_i32:
         tcg_out_qemu_ld(s, args, 0);
         break;
@@ -2839,6 +2835,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a365fbcf8f..08c2b65b19 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext16u_i32:
-    case INDEX_op_ext16u_i64:
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
@@ -1618,6 +1613,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 9d305b9cf4..220060c821 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -569,6 +569,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     tcg_out_opc_reg(s, OPC_SEH, rd, TCG_REG_ZERO, rs);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xffff);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e4b997fca8..28929ed5db 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -790,7 +790,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
 
-static inline void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
 }
@@ -3128,6 +3128,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 12ee7b29af..c49decaae9 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1597,11 +1597,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext16u_i32:
-    case INDEX_op_ext16u_i64:
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
@@ -1642,6 +1637,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 024867336a..0c489c2341 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1107,7 +1107,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LGHR, dest, src);
 }
 
-static void tgen_ext16u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LLGHR, dest, src);
 }
@@ -1157,7 +1157,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         return;
     }
     if ((val & valid) == 0xffff) {
-        tgen_ext16u(s, TCG_TYPE_I64, dest, dest);
+        tcg_out_ext16u(s, dest, dest);
         return;
     }
 
@@ -1600,7 +1600,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_UW | MO_BSWAP:
         /* swapped unsigned halfword load with upper bits zeroed */
         tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
-        tgen_ext16u(s, TCG_TYPE_I64, data, data);
+        tcg_out_ext16u(s, data, data);
         break;
     case MO_UW:
         tcg_out_insn(s, RXY, LLGH, data, base, index, disp);
@@ -1809,7 +1809,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_ext8u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UW:
-        tgen_ext16u(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
+        tcg_out_ext16u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UL:
         tgen_ext32u(s, TCG_REG_R4, data_reg);
@@ -2233,10 +2233,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16u_i32:
-        tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
-
     case INDEX_op_bswap16_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         tcg_out_insn(s, RRE, LRVR, a0, a1);
@@ -2532,9 +2528,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tgen_ext32s(s, args[0], args[1]);
         break;
-    case INDEX_op_ext16u_i64:
-        tgen_ext16u(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
         tgen_ext32u(s, args[0], args[1]);
@@ -2632,6 +2625,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e4a8bd6e27..98784f6545 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -511,6 +511,12 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rs, 0xff, ARITH_AND);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 16, SHIFT_SLL);
+    tcg_out_arithi(s, rd, rd, 16, SHIFT_SRL);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -896,8 +902,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
         tcg_out_ext8u(s, r, r);
         break;
     case MO_16:
-        tcg_out_arithi(s, r, r, 16, SHIFT_SLL);
-        tcg_out_arithi(s, r, r, 16, SHIFT_SRL);
+        tcg_out_ext16u(s, r, r);
         break;
     case MO_32:
         tcg_out_arith(s, r, r, 0, SHIFT_SRL);
@@ -1721,6 +1726,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 167f8123b1..49a83942fa 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -604,6 +604,17 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_debug_assert(TCG_TARGET_HAS_ext16u_i64);
+        tcg_out_op_rr(s, INDEX_op_ext16u_i64, rd, rs);
+    } else {
+        tcg_debug_assert(TCG_TARGET_HAS_ext16u_i32);
+        tcg_out_op_rr(s, INDEX_op_ext16u_i32, rd, rs);
+    }
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -762,7 +773,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
     CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
@@ -845,6 +855,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

