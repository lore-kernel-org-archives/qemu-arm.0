Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3438242njb;
        Tue, 10 Dec 2024 08:19:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQO3Sr8GQFbXJZwNyfx9Mc7Fbms75NQ7TluHXLaevSGpS3L3gwVDINMb3Xnq7X6oSNeYpQsU6Zz6ugkg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCPdqTwgv9MtVTpyRWk722qGFNSy4odkkbRLwOXDImHIxQXvGoJw5WeIkPhwHMs9jpdSgb
X-Received: by 2002:a05:6214:1c46:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6d91e34b63dmr95778236d6.18.1733847570993;
        Tue, 10 Dec 2024 08:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847570; cv=none;
        d=google.com; s=arc-20240605;
        b=fo+voql89beEAfSE6p89ZwcdiKYqFAvCXMP42RFNeqQ6/D6bPX5SsYPPjUZlJLCEyo
         qyrhQk28u/v8FwI3kLDuJv3uIhtFGg6Vglc1ytfUXaLuDKxh0ZYb+nTdEGHD0h/dqzjb
         upMQODxXwcL9A27KWKvuQFIqDTApDxUzUMPJEs2z7Q4p9emCoQ5x2mz/CPDOWJE73t5K
         n2jvdX4nlVZ3LGvePLEySuQV7hlOyOLyFob/ck3TFs9QwlPsGOLQjm3pM1np3CzQDMbg
         MjyTzNxipyfSxuvsUvdyh7feWK3I7lbOlQ1KktHjkz9Hbko2DHStm75oDJzzk0tZovry
         oFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mv4+39/cFGoJE7L8lZWTi5JvZoPChXZESu684RPUKCc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=A8L6sE2bIKkOsuvDD0wOmI2bRrxZM1wNgADv7PDrYnQHHE4fp2IU+v5l+nPpbqGCkv
         X+3Ot1BxE3tReB4f0NJa2uWEPf6FE2WGB/w3cMD0gz93vRznehZQxtTodeGxGnIgIUNi
         PIW43ZLQCvyC1RMjijA5oyVRjhTosXLLXfTJ5PySdk0RbMDdLc1HmFlyVUwuo2zpgR/E
         allmtaVsI18UB8ANfYuxiL9JNxDp1fjpl5izjYqSKy8jLQuI2FwLgTxnT8OnyreN/SaT
         LXzWGLWbzliX2Y/k25vwlSSfxZKfzSmr/ganPN+YtvZ7x0qDGtobwWCRWF/PZfJOGqvJ
         VAkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUoz1ZdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac0b4acsi163396326d6.305.2024.12.10.08.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUoz1ZdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2wU-0002a6-Tv; Tue, 10 Dec 2024 11:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2wR-0002ZV-35
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:34 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2wP-0006MS-6A
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:30 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54024aa9febso1380528e87.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847507; x=1734452307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mv4+39/cFGoJE7L8lZWTi5JvZoPChXZESu684RPUKCc=;
 b=pUoz1ZdTUHlkqHZdZdj05CKelTswUJ0HpaGVwU2QBhOyTGj5h1G1lBVqr1O83Y5ZAr
 f9xFxXAbu5lTfMUs9HCDw2FPx81lh6qYMh5p3WzijxW9bHTruSM3kJqctvwTcspJo7st
 ELIe1DCmnKSObU7ndMvWkHCyRFUBVEViTNPM7KzHeWoBQJ7GAT+3VFbHHuK55CnWXEq5
 i84xfGFcCAPRXj7NXhX8Sv6v71pjmh3PgFA5ClRssftPzFgzxh8hdkU1r0Pr2BH2vZlQ
 kTLHLm1fQ8OyVa7GGI7T3gG/V2vdUUbsofNY32yFXmEE2KKshGYypYn+wMjIb9fui4mK
 JMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847507; x=1734452307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mv4+39/cFGoJE7L8lZWTi5JvZoPChXZESu684RPUKCc=;
 b=VchmvmlyNRzgSmmih8TvG1Cb5cE/8krtJfgkurscHrWVKY8xJtFmJE8wNUV1Ehr2j1
 bnALRkrjQIMYTq0BaBvjUXi0A3jen1u9p8r2QMJsEHimZYTSBCmYCW3cyT4t3fyzse4G
 LKrvM6opEwmY1rGUzfo0bd7a4pac6NWCW26z3ATEajcfGu9bsYKhCBOCb6F46MyXv94f
 3UfzpovZL3GypGeCi84Db/4N5typf5evzfPOcmkLDCB0RJYPPsz3Yg5VcdBVNoOdb3qm
 BGGTG7HL9yV6YZPF53qpF89SfceGYBqK7rOwIsWzTITgjD4m7PuFyQkfaN/7vC/X9PXW
 qdjw==
X-Gm-Message-State: AOJu0YxEnMtMmyiew/NPCRmOTF7IdNJOlZPpMREOpi1/vuX993Wk+236
 mXG8cWdyEE3uPCFe71Xv5nmkQ+ltMSKGqAtBjSgvHUhqcjsJhKra5/IFP6w+GQM=
X-Gm-Gg: ASbGnctiCeFiqgarZnUN1/Q1G41eXmMV/VgBHIMEU1NECs3x9s3IscILHiZ8TS74P6Z
 7mEU6f/t9F+PK7BOY5kAz0e+75syHzc8hn+xoRS7dvsgo6XERt5vk6DxD3SeMSs9+s5k1yBt3Sf
 NAZAnWkFbPbYwdr0dkXeZmBpB+qRUUJN6pAn8Y0jqgjZSdSXsU7yazVcjX1zjHo0sLgS5szRsnH
 WHz1hIH7CId6/CdgCGLmal8/fxaBfkor8wC4NvUyjRE++HK17EitYjwU+Q=
X-Received: by 2002:a05:6512:1388:b0:53e:385c:e86b with SMTP id
 2adb3069b0e04-53e385ceb0amr5008427e87.27.1733847507347; 
 Tue, 10 Dec 2024 08:18:27 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:18:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/69] target/arm: Convert disas_logic_reg to decodetree
Date: Tue, 10 Dec 2024 10:16:35 -0600
Message-ID: <20241210161733.1830573-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: KFK5k3BmJ/zA

This includes AND, BIC, ORR, ORN, EOR, EON, ANDS, BICS (shifted reg).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 117 ++++++++++++---------------------
 target/arm/tcg/a64.decode      |   9 +++
 2 files changed, 51 insertions(+), 75 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d92fe68299..ecc8899dd8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7805,96 +7805,65 @@ static bool do_xpac(DisasContext *s, int rd, NeonGenOne64OpEnvFn *fn)
 TRANS_FEAT(XPACI, aa64_pauth, do_xpac, a->rd, gen_helper_xpaci)
 TRANS_FEAT(XPACD, aa64_pauth, do_xpac, a->rd, gen_helper_xpacd)
 
-/* Logical (shifted register)
- *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
- * +----+-----+-----------+-------+---+------+--------+------+------+
- * | sf | opc | 0 1 0 1 0 | shift | N |  Rm  |  imm6  |  Rn  |  Rd  |
- * +----+-----+-----------+-------+---+------+--------+------+------+
- */
-static void disas_logic_reg(DisasContext *s, uint32_t insn)
+static bool do_logic_reg(DisasContext *s, arg_logic_shift *a,
+                         ArithTwoOp *fn, ArithTwoOp *inv_fn, bool setflags)
 {
     TCGv_i64 tcg_rd, tcg_rn, tcg_rm;
-    unsigned int sf, opc, shift_type, invert, rm, shift_amount, rn, rd;
 
-    sf = extract32(insn, 31, 1);
-    opc = extract32(insn, 29, 2);
-    shift_type = extract32(insn, 22, 2);
-    invert = extract32(insn, 21, 1);
-    rm = extract32(insn, 16, 5);
-    shift_amount = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    if (!sf && (shift_amount & (1 << 5))) {
-        unallocated_encoding(s);
-        return;
+    if (!a->sf && (a->sa & (1 << 5))) {
+        return false;
     }
 
-    tcg_rd = cpu_reg(s, rd);
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_rn = cpu_reg(s, a->rn);
 
-    if (opc == 1 && shift_amount == 0 && shift_type == 0 && rn == 31) {
-        /* Unshifted ORR and ORN with WZR/XZR is the standard encoding for
-         * register-register MOV and MVN, so it is worth special casing.
-         */
-        tcg_rm = cpu_reg(s, rm);
-        if (invert) {
+    tcg_rm = read_cpu_reg(s, a->rm, a->sf);
+    if (a->sa) {
+        shift_reg_imm(tcg_rm, tcg_rm, a->sf, a->st, a->sa);
+    }
+
+    (a->n ? inv_fn : fn)(tcg_rd, tcg_rn, tcg_rm);
+    if (!a->sf) {
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+    }
+    if (setflags) {
+        gen_logic_CC(a->sf, tcg_rd);
+    }
+    return true;
+}
+
+static bool trans_ORR_r(DisasContext *s, arg_logic_shift *a)
+{
+    /*
+     * Unshifted ORR and ORN with WZR/XZR is the standard encoding for
+     * register-register MOV and MVN, so it is worth special casing.
+     */
+    if (a->sa == 0 && a->st == 0 && a->rn == 31) {
+        TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+        TCGv_i64 tcg_rm = cpu_reg(s, a->rm);
+
+        if (a->n) {
             tcg_gen_not_i64(tcg_rd, tcg_rm);
-            if (!sf) {
+            if (!a->sf) {
                 tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
             }
         } else {
-            if (sf) {
+            if (a->sf) {
                 tcg_gen_mov_i64(tcg_rd, tcg_rm);
             } else {
                 tcg_gen_ext32u_i64(tcg_rd, tcg_rm);
             }
         }
-        return;
+        return true;
     }
 
-    tcg_rm = read_cpu_reg(s, rm, sf);
-
-    if (shift_amount) {
-        shift_reg_imm(tcg_rm, tcg_rm, sf, shift_type, shift_amount);
-    }
-
-    tcg_rn = cpu_reg(s, rn);
-
-    switch (opc | (invert << 2)) {
-    case 0: /* AND */
-    case 3: /* ANDS */
-        tcg_gen_and_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 1: /* ORR */
-        tcg_gen_or_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 2: /* EOR */
-        tcg_gen_xor_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 4: /* BIC */
-    case 7: /* BICS */
-        tcg_gen_andc_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 5: /* ORN */
-        tcg_gen_orc_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 6: /* EON */
-        tcg_gen_eqv_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    default:
-        assert(FALSE);
-        break;
-    }
-
-    if (!sf) {
-        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
-    }
-
-    if (opc == 3) {
-        gen_logic_CC(sf, tcg_rd);
-    }
+    return do_logic_reg(s, a, tcg_gen_or_i64, tcg_gen_orc_i64, false);
 }
 
+TRANS(AND_r, do_logic_reg, a, tcg_gen_and_i64, tcg_gen_andc_i64, false)
+TRANS(ANDS_r, do_logic_reg, a, tcg_gen_and_i64, tcg_gen_andc_i64, true)
+TRANS(EOR_r, do_logic_reg, a, tcg_gen_xor_i64, tcg_gen_eqv_i64, false)
+
 /*
  * Add/subtract (extended register)
  *
@@ -8411,11 +8380,9 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
                 /* Add/sub (shifted register) */
                 disas_add_sub_reg(s, insn);
             }
-        } else {
-            /* Logical (shifted register) */
-            disas_logic_reg(s, insn);
+            return;
         }
-        return;
+        goto do_unallocated;
     }
 
     switch (op2) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0e04ab6ce4..8e2949d236 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -716,6 +716,15 @@ XPACI           1 10 11010110 00001 010000 11111 rd:5
 XPACD           1 10 11010110 00001 010001 11111 rd:5
 
 # Logical (shifted reg)
+
+&logic_shift    rd rn rm sf sa st n
+@logic_shift    sf:1 .. ..... st:2 n:1 rm:5 sa:6 rn:5 rd:5  &logic_shift
+
+AND_r           . 00 01010 .. . ..... ...... ..... .....    @logic_shift
+ORR_r           . 01 01010 .. . ..... ...... ..... .....    @logic_shift
+EOR_r           . 10 01010 .. . ..... ...... ..... .....    @logic_shift
+ANDS_r          . 11 01010 .. . ..... ...... ..... .....    @logic_shift
+
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
 # Add/subtract (carry)
-- 
2.43.0

