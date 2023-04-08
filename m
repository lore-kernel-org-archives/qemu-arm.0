Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649759ejb;
        Fri, 7 Apr 2023 19:46:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTldNFOLu4jOatN1JEbdF5ajyXAnRcbZ2jvvCdx15IFma9Bgs88TkFg5dQ+6KhI3iZwbbJ
X-Received: by 2002:a05:6214:487:b0:56e:aeaa:95b2 with SMTP id pt7-20020a056214048700b0056eaeaa95b2mr9042026qvb.9.1680921992106;
        Fri, 07 Apr 2023 19:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921992; cv=none;
        d=google.com; s=arc-20160816;
        b=RUHeLpJaeG2DpEQIYhG+LiGip8/3si/kFSDYcK+5YSqHxHsUqH69H9lrcGyY4MjsBU
         aYO3en0F8MEjEkZmA/Hy1Enpl09AsKFz+sqdHxMDs5T+2gbWvYQC4deM1J0UajUHOpb2
         I51O/NF+A8MebZP5EDj4+q6dKON4Vr/zxAQ6vJGNmtKBbFWVP3se3kdQS31zeT8LV1Yg
         AmnaRfaCbDSiKVyQD6Ku5IlpNfsKgeaDk1hVe6XrDbArHdBpmJrpW7aDBNqs3wmS7HEX
         cfpkJ+ugUmLzWgMyp7kf+MHkVhVC/HZBeRLaLVFIpfSCNZ/zutp2q2aJvktTX6jEj03S
         Pv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gfrcrwTN/lp3cZCk0Pdqdg+ZowAN5o7wmPz80gOA6Ho=;
        b=eMa8kABPSCEzfVUl6WkpjrdlK/tO1BZ9VATtjHA8fxTijTrPHyPX45xDzi9Ypm1Ef2
         1pRe6eLi7JL8kkwkUia73tSBNNtTifYdbBMOCOEZageJeqDdMp9jgZefM6mHH7ovDaUc
         305ttwUwNw/w8YV+/j3nslaoXPCaeZq6u7JWi6sw04d8wJpL+B5/z+2Uo/kwyt3W6EPU
         Nn1xJXKWXmQfH5udmjdfgbMptpzslXkzFi+tHK3LDVLwQ1V5WjaWS7zfe1P85onkzwBs
         8uXrK6trOn9mAGSk3Lp4tB84Ha7HDF2nmBVdk39XtlBiIiqbi/epNUYVyNZEnwPqC4oX
         e3Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Koqj7JAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a028900b003e38ba5e337si3697488qtw.115.2023.04.07.19.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Koqj7JAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYS-0007W0-J2; Fri, 07 Apr 2023 22:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYQ-0007Tq-FG
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY7-0005fu-Jt
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id bg9so507791plb.2
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfrcrwTN/lp3cZCk0Pdqdg+ZowAN5o7wmPz80gOA6Ho=;
 b=Koqj7JAs8M7ggUSCk/pAMZYUs9jHyhawDrpWcqLi0zAACONcmR8IQW2+72vLl1OH6k
 K6282zKRk/Cpibxm3XuOd3gAhKSdip/5i+MThUTlgz7Rlull2vS2AYpqJBxGMN6athm4
 QnL1TNg0gqaM9G/L8aX9r+4gMpCezAuarN4Xn5cDWM3mNsZgRRJ0z/ZY9VMqSTUOro7o
 eLvHr/2M2+RtS0q2AFJGU6vqaE0W+lCkzxcAbnU81FcVIMKm/ZGjCvRqxzb1joyza5yK
 8qg8dmTC+TRmLbG6tNDDDrxsv2RYc7b5cd2gg0Im3jgWxzP6s3v/FkMLMhD4l7dHET+t
 mhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfrcrwTN/lp3cZCk0Pdqdg+ZowAN5o7wmPz80gOA6Ho=;
 b=QpPmqBCBRv+aQwV7GSvFK4zDg3Xkoh5JbN/4mGs63j58aJ6DGNprR2qS2z7LV6pyAW
 NaNLtEY4JG++zE5LbSuc9912YTPo/f+svuIDNMwTA5Lv3nfJH/oBxIWhBqdyqUCKBVhJ
 ejt1xqAevF+ydnsBgecglAdOIZKf3MfDlmuAzgjw9IZiETTbJ9InAy85/FDBqa5U6pxj
 xauF4VIBze0y2CqrxqtPK/JrGM759NhQAuOiM799wcPXbFbmmJjcvvyqgJU1bi2bABll
 gAJf8+OvCvuUAWJxvTDLGnE1ToTeJ+0K7MsTGfkPJyABC63Z4yOFVchFpJ4N2pYcla6P
 kb5Q==
X-Gm-Message-State: AAQBX9cPP+DRF7GW8gxKJoBUT3IL0kxSWCHzNW2WaiDrcbz5baPBxiYR
 2bg+FbQihA2YXMc6qZJsLA7geg==
X-Received: by 2002:a17:902:f68b:b0:1a2:7d:8a74 with SMTP id
 l11-20020a170902f68b00b001a2007d8a74mr5447591plg.66.1680921810221; 
 Fri, 07 Apr 2023 19:43:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 15/42] tcg: Split out tcg_out_extrl_i64_i32
Date: Fri,  7 Apr 2023 19:42:47 -0700
Message-Id: <20230408024314.3357414-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: mfwAj3H087Mh

We will need a backend interface for type truncation.  For those backends
that did not enable TCG_TARGET_HAS_extrl_i64_i32, use tcg_out_mov.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  6 ++++++
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  9 ++++++---
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        |  9 ++++++---
 tcg/ppc/tcg-target.c.inc         |  7 +++++++
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       |  6 ++++++
 tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
 tcg/tci/tcg-target.c.inc         |  7 +++++++
 11 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 17bd6d4581..0188152c37 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -113,6 +113,7 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4537,6 +4538,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_extu_i32_i64:
         tcg_out_extu_i32_i64(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_extrl_i64_i32:
+        tcg_out_extrl_i64_i32(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ca8b25865b..bd1fab193e 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1467,6 +1467,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_ext32u(s, rd, rn);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2337,6 +2342,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2135616e12..1820655ee3 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1013,6 +1013,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 71a2bff234..45b2054856 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1311,6 +1311,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     }
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2765,9 +2770,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32u(s, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_shifti(s, SHIFT_SHR + P_REXW, a0, 32);
         break;
@@ -2848,6 +2850,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d83bd9de49..b0e076c462 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -468,6 +468,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32u(s, ret, arg);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1258,10 +1263,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
-
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
@@ -1624,6 +1625,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 4789b0a40c..f103cdb4e6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -592,6 +592,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2306,9 +2311,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
 
     case INDEX_op_sar_i32:
         i1 = OPC_SRAV, i2 = OPC_SRA;
@@ -2457,6 +2459,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 01924fdf51..6fd309968e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -816,6 +816,12 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_ext32u(s, dst, src);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rn);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -3137,6 +3143,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index a6d352976c..6af5c25f02 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -614,6 +614,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32u(s, ret, arg);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1609,10 +1614,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
-
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_imm(s, OPC_SRAI, a0, a1, 32);
         break;
@@ -1648,6 +1649,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e17d000991..360229cdd3 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1132,6 +1132,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32u(s, dest, src);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2632,6 +2637,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index c57a8c8304..18ddd6bb9f 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -537,6 +537,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1687,9 +1692,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_arithi(s, a0, a1, 32, SHIFT_SRLX);
         break;
@@ -1744,6 +1746,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 48c9dbd0b4..68531e35ec 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -639,6 +639,12 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -881,6 +887,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

