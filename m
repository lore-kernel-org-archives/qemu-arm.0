Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193496njb;
        Wed, 11 Dec 2024 08:37:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEEw4jA9V2ArYTcodJ0wQcjBBBV/TRFC69zaJrsKgx8duKPVdsn2riI/iRfv27feoDJjhsLgA5nN5/QQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEpdE4QBeqneFBDb8tEAFhUNeQ7Ugpa25U1MmDO+QACWfV5hKIPsdEcC9Y9juE9a8u4WlEf
X-Received: by 2002:a05:6214:2a4b:b0:6d8:a80e:229 with SMTP id 6a1803df08f44-6d934bd0a74mr69259866d6.47.1733935038200;
        Wed, 11 Dec 2024 08:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935038; cv=none;
        d=google.com; s=arc-20240605;
        b=jTEE6cqL+b/Ij6oqd+e2O1d6Qy8Tpk7kfhYz0ZwfqqsqHDeIyGVPEfLhap7YeiyXOP
         fq+3FZV/l2+mL0HzHVS32LuMxRGqYOMRwNPAZ1cSNReNfSwqjUhAOqHIZlX4AtUziMCP
         qYmaHjyPpXpDQaDyJLwxg5pvS4PM2ss29T4PX/2xJxYAoW/PORDPNBh+Pz6nYadA4ca8
         87BQs2cNXX1rBjz1t0XkxmL5iTCBP1LXWjBsx5Ts1Jztr1blZ+a38SNW4HhVZxAFASeT
         9db0bmy2rdMq7GeuajDbXbAEcskqZQB4SCipqaMngHurHg/v+wBg62cOSPjLLiLYt9z4
         SL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NvYUTxGU0SlbdB/A8XWhhOlkaNp7pR5YZMOeGOSqwZc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=cPqX53AlQeyP5L9l8Bma3g6Xl1VcD8EFSzABh+4jssY0NWVtkfRfER8gDYBDnV8UjJ
         kSOAK3h0bhZiUpfajHrXo8DhCe1Gt7D9KXCFP+ozFCK6OyrMpN8XYYZjpsqXDp0FwKGQ
         1AtaFQih0GWjV5np1Xuy+mJyiWUHOrWmYhPlcejAqWe36gkxjuvs/ByxDZGygrc701f2
         UmmcHKgYkZHR1Npy25sKgLLxWUwu9v5f7OU+6a3lX/BTOfbyKTl+9x1YFwVB/nYgKuEy
         iboHvcTdyFV2Jne7EbpR9I1CyUq8tAFSZjLCjr+xRd+NXvrbQAfIIgaSgnovC51DrkSz
         6ujw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ziw+EZGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da69ed17si169960646d6.141.2024.12.11.08.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ziw+EZGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdX-0006Ml-MT; Wed, 11 Dec 2024 11:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcg-0004P2-1W
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:40 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcc-0001GY-Tv
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:37 -0500
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-46779ae3139so18035481cf.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934693; x=1734539493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvYUTxGU0SlbdB/A8XWhhOlkaNp7pR5YZMOeGOSqwZc=;
 b=ziw+EZGKicgIINjyeuaVFGr+60UYx811d9i8burA46jbCXbwz/9HpJcGEybY1YnRWG
 J4DP5MZbXRltRJML/1fM+9rwWVX9wf5+scIYpktRImUrITyTl1eEfdoUHGMx8xLICfxR
 7KOOlfpDm0W9SU3EyR97ThzYLnpXHuWzgHDbvQHCqUKLsqL/mMH0q6W8UhUcYRMoqB7z
 BnOfsbEbxdV/d94/sISA62dxmgfSE1et1Ab7ai7MFxW5n/n2GMiWB9DG1imsHcM4uvh3
 CrTO/2kvWerbA8jbwDVJQm5T3yFgzY+FHY0nQQeHVRXwXoe/mgB4OpVJMTFW06mSOkbn
 3ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934693; x=1734539493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvYUTxGU0SlbdB/A8XWhhOlkaNp7pR5YZMOeGOSqwZc=;
 b=nmReBUuhoY/9hbDuTKUF6NvCdhAc5hYcYT6WlxcVARj0/dKOeJFxBQFvgWuK5M3m6y
 lcM6iTZMZmV74VefdgA88mY3UWnrV1RSjrntwWNEcG6iPd+HMtPb1L8oRlLTTDA7WSfa
 Rf4onvUODOkXNLat7/w0RbHPiNKA7OQFr7RxU8APf2+FFtfbT4fci9DDOcDqjT5grTFA
 EdaugXjrX/RgD9Ex9Gr0Gf7dLDTCw1WnVdA0uqynMiEshgPVx0wwd2W+cYFQUxNECtYF
 awFNFJ5n0WtKRf9Lf6x1GOVi+PCyc2zqMI99MYbg/M7VpxQ5zdLgWqrYxaNpWV84hG6j
 3Whw==
X-Gm-Message-State: AOJu0YyKRYoE42bd28p31oHK6hd0dtFtlb13SexEOPhcDaaTqEeRsCZg
 i+USnLcOBbrzpu8nPZsrOTKH3WBxNXlLm7sR5QhzQYXtdbCCQ0cC69bKgWGNYck=
X-Gm-Gg: ASbGncssDgWxInIklTJP2qiWqTfCYI8x57QLQf87tmFCF+VWkuhwgmXMKAXgDn6+OKK
 g4o4rZvaHf4zgv675vKi9yqQlyzJhB+yZumGKcs+1KK/tjdAehKJcuH7d8AEl4TQCkH+2qLQzBa
 y5H7GCqV6gEXkBeuSkb+PZWnplkrLobbjB7q5SBUhjH8cL/DzJ+BBr/qKlUAbOC+ElCx0tD9GZ/
 ofEGA4szcTzeQogFJtGu+Gc0WCb82FwWR5ur3ycGm+W2MdCrruY2IBa91gauQ==
X-Received: by 2002:ac8:7f94:0:b0:466:a3d2:ae44 with SMTP id
 d75a77b69052e-467892e9f85mr64904811cf.2.1733934693641; 
 Wed, 11 Dec 2024 08:31:33 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 13/69] target/arm: Convert disas_add_sub_reg to decodetree
Date: Wed, 11 Dec 2024 10:29:40 -0600
Message-ID: <20241211163036.2297116-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
X-TUID: /RlEfFmSTF2X

This includes ADD, SUB, ADDS, SUBS (shifted register).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 64 ++++++++++------------------------
 target/arm/tcg/a64.decode      |  9 +++++
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8f777875fe..d570bbb696 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7912,47 +7912,22 @@ TRANS(SUB_ext, do_addsub_ext, a, true, false)
 TRANS(ADDS_ext, do_addsub_ext, a, false, true)
 TRANS(SUBS_ext, do_addsub_ext, a, true, true)
 
-/*
- * Add/subtract (shifted register)
- *
- *  31 30 29 28       24 23 22 21 20   16 15     10 9    5 4    0
- * +--+--+--+-----------+-----+--+-------+---------+------+------+
- * |sf|op| S| 0 1 0 1 1 |shift| 0|  Rm   |  imm6   |  Rn  |  Rd  |
- * +--+--+--+-----------+-----+--+-------+---------+------+------+
- *
- *    sf: 0 -> 32bit, 1 -> 64bit
- *    op: 0 -> add  , 1 -> sub
- *     S: 1 -> set flags
- * shift: 00 -> LSL, 01 -> LSR, 10 -> ASR, 11 -> RESERVED
- *  imm6: Shift amount to apply to Rm before the add/sub
- */
-static void disas_add_sub_reg(DisasContext *s, uint32_t insn)
+static bool do_addsub_reg(DisasContext *s, arg_addsub_shift *a,
+                          bool sub_op, bool setflags)
 {
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int imm6 = extract32(insn, 10, 6);
-    int rm = extract32(insn, 16, 5);
-    int shift_type = extract32(insn, 22, 2);
-    bool setflags = extract32(insn, 29, 1);
-    bool sub_op = extract32(insn, 30, 1);
-    bool sf = extract32(insn, 31, 1);
+    TCGv_i64 tcg_rd, tcg_rn, tcg_rm, tcg_result;
 
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_rn, tcg_rm;
-    TCGv_i64 tcg_result;
-
-    if ((shift_type == 3) || (!sf && (imm6 > 31))) {
-        unallocated_encoding(s);
-        return;
+    if (a->st == 3 || (!a->sf && (a->sa & 32))) {
+        return false;
     }
 
-    tcg_rn = read_cpu_reg(s, rn, sf);
-    tcg_rm = read_cpu_reg(s, rm, sf);
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_rn = read_cpu_reg(s, a->rn, a->sf);
+    tcg_rm = read_cpu_reg(s, a->rm, a->sf);
 
-    shift_reg_imm(tcg_rm, tcg_rm, sf, shift_type, imm6);
+    shift_reg_imm(tcg_rm, tcg_rm, a->sf, a->st, a->sa);
 
     tcg_result = tcg_temp_new_i64();
-
     if (!setflags) {
         if (sub_op) {
             tcg_gen_sub_i64(tcg_result, tcg_rn, tcg_rm);
@@ -7961,19 +7936,25 @@ static void disas_add_sub_reg(DisasContext *s, uint32_t insn)
         }
     } else {
         if (sub_op) {
-            gen_sub_CC(sf, tcg_result, tcg_rn, tcg_rm);
+            gen_sub_CC(a->sf, tcg_result, tcg_rn, tcg_rm);
         } else {
-            gen_add_CC(sf, tcg_result, tcg_rn, tcg_rm);
+            gen_add_CC(a->sf, tcg_result, tcg_rn, tcg_rm);
         }
     }
 
-    if (sf) {
+    if (a->sf) {
         tcg_gen_mov_i64(tcg_rd, tcg_result);
     } else {
         tcg_gen_ext32u_i64(tcg_rd, tcg_result);
     }
+    return true;
 }
 
+TRANS(ADD_r, do_addsub_reg, a, false, false)
+TRANS(SUB_r, do_addsub_reg, a, true, false)
+TRANS(ADDS_r, do_addsub_reg, a, false, true)
+TRANS(SUBS_r, do_addsub_reg, a, true, true)
+
 /* Data-processing (3 source)
  *
  *    31 30  29 28       24 23 21  20  16  15  14  10 9    5 4    0
@@ -8348,15 +8329,6 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     int op3 = extract32(insn, 10, 6);
 
     if (!op1) {
-        if (op2 & 8) {
-            if (op2 & 1) {
-                goto do_unallocated;
-            } else {
-                /* Add/sub (shifted register) */
-                disas_add_sub_reg(s, insn);
-            }
-            return;
-        }
         goto do_unallocated;
     }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0539694506..27a3101bc6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -726,6 +726,15 @@ EOR_r           . 10 01010 .. . ..... ...... ..... .....    @logic_shift
 ANDS_r          . 11 01010 .. . ..... ...... ..... .....    @logic_shift
 
 # Add/subtract (shifted reg)
+
+&addsub_shift    rd rn rm sf sa st
+@addsub_shift    sf:1 .. ..... st:2 . rm:5 sa:6 rn:5 rd:5   &addsub_shift
+
+ADD_r           . 00 01011 .. 0 ..... ...... ..... .....    @addsub_shift
+SUB_r           . 10 01011 .. 0 ..... ...... ..... .....    @addsub_shift
+ADDS_r          . 01 01011 .. 0 ..... ...... ..... .....    @addsub_shift
+SUBS_r          . 11 01011 .. 0 ..... ...... ..... .....    @addsub_shift
+
 # Add/subtract (extended reg)
 
 &addsub_ext     rd rn rm sf sa st
-- 
2.43.0

