Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1232321ejb;
        Fri, 2 Jun 2023 08:53:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ytht3HpykUml6TlhahHVc9eJG0PY31QYqKBJ8gOtHx1te1RrnDSutXVAY+FVvQQjl0b+2
X-Received: by 2002:a05:6214:da9:b0:626:7e5:ddc5 with SMTP id h9-20020a0562140da900b0062607e5ddc5mr7407169qvh.16.1685721228039;
        Fri, 02 Jun 2023 08:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685721228; cv=none;
        d=google.com; s=arc-20160816;
        b=bNHM6K2VtTBGGEJULh2ar2MNu6hmsafqMZmrV00rahQ+XpD3+4E16NEiLge0qyKSuF
         /sxZW30Ic4TNWYCcaG4Ee1ronr/gDQ+fPuh3yX1350MTcYJvLm9UJOzVb3HtStuG1LWN
         Qa0Sw4neKAVpycU/SqIG3XGnKUA1PobNOwyXSrNgl1YReRgHRyrQzAolMLtZE/De1Lmc
         Ade7nbUOupjSr08sjrdGe4RayzBXlLnBwcMK6W7eUg8318E6TqWIJyMKdm16LjDQcsOU
         2+huDzAx4DwNnKKzWDg+jSSSjns7bZqzQ5u2ph/WszrKXq2I+dvE6gj/78H1zocRYJ2f
         rN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e6odzKrf0EsTUJUThJ0AIB19OGhJGnKfmzZWI8IgT24=;
        b=xvK2bOb1l3IjMY7vpTLsVNl+j9w9YaHr/8YcCyD1Pa5rUG3cdTBwlsDfDPp1+fu8oe
         C5PYp6Ai7CJgO5SvxBLPYxYHvPJS+ibAVLO3e4nsBXURyCgM+hkO2U25daokikiRebuc
         L/iT3JO/l+V43ZDiHZU+/a/oRPeS0eCcRQzRF7ZQEYjTVOuIIh6DOCfMWKlG2PqsRXxr
         97X6ml7QntkpKoIg7/2mLBUlUNjcXyq7kqWOoaPxnrWnCKx8egpog8hiHW/vwZUELC+6
         Pdw/xXCUCyr49mX5csZUQNG7oUJx8ttBzp11cGnWHYQ7uRKETbuZvik9/rppDxVMulit
         ssAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8Wr9+Rb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt13-20020a05621427ed00b00621271647bdsi1021028qvb.372.2023.06.02.08.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 08:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8Wr9+Rb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q574w-0003E2-DR; Fri, 02 Jun 2023 11:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574u-0003C3-Q6
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574q-0003TI-Fs
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ae4ec1ac7so2002113f8f.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685721151; x=1688313151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e6odzKrf0EsTUJUThJ0AIB19OGhJGnKfmzZWI8IgT24=;
 b=r8Wr9+RbJhw20nf7ATclpIL0Gv4Wtgp49boYgMyLiytE6Dhk8vuDV+QOdEhTG+rpCu
 QgeoNRybCczJJMzZMHhXXCk3WQw0q9HEhyDChs6mMJ3OfQwMUxXohRqTWy/sBHzx10SE
 diF5iFUxTnzLL64WsqeEbCaeYXLzN/yH8tY3Frjs74iguXvhYc+CDxdtDg4rasYFRrjY
 P3QU2a3w9Oi3qoNrZmkPUEMG6Bl9t+AUHqxbeUgIm4QtNJDqc0mRPwoh6V5uVQFuaVOz
 2o4FCIaj+rnHWKbdhM7EFWB6uGzQvS8YYuhkdGHRDJFWUyV2pFDC/suc20Nel5f2V71a
 SRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685721151; x=1688313151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6odzKrf0EsTUJUThJ0AIB19OGhJGnKfmzZWI8IgT24=;
 b=aSxvqP5eEG8BQQEzek5+XqJDYcwbhPXsOh00t0GF/ny/h/8zciTry+eN3eied6cy3B
 qvFMbYwd3DrRqNhkLDND3ZIJsqCbnT6oBTN5/ZUzvQm7wDbdiSmW8MdoxzfOZmWmVlvw
 s4Tpomlz1w75WO93wKmwXTagZ2b7kY7WVOwXAyr//n9tF46nDXCzNtEjwwSr/t5hBIrM
 9R5zAWhbHwN0GjanKWoh3aDIDXD1CHdCll96+NY6512FuARVJjVxYoLdqklSksmueRC9
 S8rNY1N8nlkRB0mm/29L77JLFumPV6hvgZB64+JZCY3p5YNW5YAomiy2TuxXdls73lZ4
 lwaA==
X-Gm-Message-State: AC+VfDxrrDb1voVzS8e0yhXkGW3IuJZ2rsulV86Yxsjsa2kxIyPoviYj
 ilwN8dOOYvDyuubw48kPAQlt4jd79AI/CeWFKU0=
X-Received: by 2002:adf:e788:0:b0:30a:aeb0:910d with SMTP id
 n8-20020adfe788000000b0030aaeb0910dmr271530wrm.44.1685721151116; 
 Fri, 02 Jun 2023 08:52:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f72a15301csm594952wml.2.2023.06.02.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:52:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/20] target/arm: Convert load reg (literal) group to
 decodetree
Date: Fri,  2 Jun 2023 16:52:13 +0100
Message-Id: <20230602155223.2040685-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602155223.2040685-1-peter.maydell@linaro.org>
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: iY0JN0P3M/47

Convert the "Load register (literal)" instruction class to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 13 ++++++
 target/arm/tcg/translate-a64.c | 73 ++++++++++------------------------
 2 files changed, 33 insertions(+), 53 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 2b4827384b5..e24db340714 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -251,3 +251,16 @@ LDXP            1 . 001000 011 ..... . ..... ..... ..... @stxp # inc LDAXP
 CASP            0 . 001000 0 a:1 1 rs:5 lasr:1 11111 rn:5 rt:5 sz=%imm1_30_p2
 # CAS, CASA, CASAL, CASL
 CAS             sz:2 001000 1 a:1 1 rs:5 lasr:1 11111 rn:5 rt:5
+
+&ldlit          rt imm sz sign
+@ldlit          .. ... . .. ................... rt:5 &ldlit imm=%imm19
+
+LD_lit          00 011 0 00 ................... ..... @ldlit sz=2 sign=0
+LD_lit          01 011 0 00 ................... ..... @ldlit sz=3 sign=0
+LD_lit          10 011 0 00 ................... ..... @ldlit sz=2 sign=1
+LD_lit_v        00 011 1 00 ................... ..... @ldlit sz=2 sign=0
+LD_lit_v        01 011 1 00 ................... ..... @ldlit sz=3 sign=0
+LD_lit_v        10 011 1 00 ................... ..... @ldlit sz=4 sign=0
+
+# PRFM
+NOP             11 011 0 00 ------------------- -----
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ce4cf1a3878..07bcc700e0b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2711,60 +2711,30 @@ static bool trans_CAS(DisasContext *s, arg_CAS *a)
     return true;
 }
 
-/*
- * Load register (literal)
- *
- *  31 30 29   27  26 25 24 23                5 4     0
- * +-----+-------+---+-----+-------------------+-------+
- * | opc | 0 1 1 | V | 0 0 |     imm19         |  Rt   |
- * +-----+-------+---+-----+-------------------+-------+
- *
- * V: 1 -> vector (simd/fp)
- * opc (non-vector): 00 -> 32 bit, 01 -> 64 bit,
- *                   10-> 32 bit signed, 11 -> prefetch
- * opc (vector): 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit (11 unallocated)
- */
-static void disas_ld_lit(DisasContext *s, uint32_t insn)
+static bool trans_LD_lit(DisasContext *s, arg_ldlit *a)
 {
-    int rt = extract32(insn, 0, 5);
-    int64_t imm = sextract32(insn, 5, 19) << 2;
-    bool is_vector = extract32(insn, 26, 1);
-    int opc = extract32(insn, 30, 2);
-    bool is_signed = false;
-    int size = 2;
-    TCGv_i64 tcg_rt, clean_addr;
+    bool iss_sf = ldst_iss_sf(a->sz, a->sign, false);
+    TCGv_i64 tcg_rt = cpu_reg(s, a->rt);
+    TCGv_i64 clean_addr = tcg_temp_new_i64();
 
-    if (is_vector) {
-        if (opc == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        size = 2 + opc;
-        if (!fp_access_check(s)) {
-            return;
-        }
-    } else {
-        if (opc == 3) {
-            /* PRFM (literal) : prefetch */
-            return;
-        }
-        size = 2 + extract32(opc, 0, 1);
-        is_signed = extract32(opc, 1, 1);
+    gen_pc_plus_diff(s, clean_addr, a->imm);
+    do_gpr_ld(s, tcg_rt, clean_addr, a->sz + a->sign * MO_SIGN,
+              false, true, a->rt, iss_sf, false);
+    return true;
+}
+
+static bool trans_LD_lit_v(DisasContext *s, arg_ldlit *a)
+{
+    /* Load register (literal), vector version */
+    TCGv_i64 clean_addr;
+
+    if (!fp_access_check(s)) {
+        return true;
     }
-
-    tcg_rt = cpu_reg(s, rt);
-
     clean_addr = tcg_temp_new_i64();
-    gen_pc_plus_diff(s, clean_addr, imm);
-    if (is_vector) {
-        do_fp_ld(s, rt, clean_addr, size);
-    } else {
-        /* Only unsigned 32bit loads target 32bit registers.  */
-        bool iss_sf = opc != 0;
-
-        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
-                  false, true, rt, iss_sf, false);
-    }
+    gen_pc_plus_diff(s, clean_addr, a->imm);
+    do_fp_ld(s, a->rt, clean_addr, a->sz);
+    return true;
 }
 
 /*
@@ -4067,9 +4037,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 static void disas_ldst(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 24, 6)) {
-    case 0x18: case 0x1c: /* Load register (literal) */
-        disas_ld_lit(s, insn);
-        break;
     case 0x28: case 0x29:
     case 0x2c: case 0x2d: /* Load/store pair (all forms) */
         disas_ldst_pair(s, insn);
-- 
2.34.1

