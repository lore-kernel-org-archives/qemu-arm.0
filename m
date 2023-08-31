Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp261132ejc;
        Thu, 31 Aug 2023 16:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1c3LP+MxGplAfH3T8fIED04MW5eH7ysxhdvQt7qlM59svmMy0VonHImZPoBXSRS7vK/y
X-Received: by 2002:ac8:5c55:0:b0:412:130b:9f86 with SMTP id j21-20020ac85c55000000b00412130b9f86mr1249514qtj.33.1693524363519;
        Thu, 31 Aug 2023 16:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524363; cv=none;
        d=google.com; s=arc-20160816;
        b=fEM+ZGX/7HpHCG9/6oEuuomOYnO2rpzsx1OpbZx8mBaCaTbgALUyD2YxxFYO839Smc
         5UXTLVu2ITHMVngUB65HWY1RzgRXwae03NfY0kxvfM1u5NO6Rgpyzo46wYdyICf/uIEw
         GAaQvwvwz0GVwlOnSGHmppGOdekr0YQGwxY/GlEJ1oNCn1KiFRdCkR1iepe0Ys4Eql0G
         NrgSDLZFBY3evdCN3pARWKkI/W4bTMPYqE87IjHg4VLHqgFhirU1WqbHMDVTX8pfV9QN
         88cD2pdAKkDGHd0vi6c9kJ5nBW2LfRMXEFIa48W4p8xyRLHgigB0VASjNFjSWEmC0puJ
         WBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h+xlV3SGZMVXNVWkGKftcbyBWtbVebk+6sY7EU3bpYY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=kpyiGnxXL6WiLHabT8W1ZWqdtQfdTypgMwfrHxvyjcMZcqH11qS8bL1N6hwhh9TnCt
         OfQwhTI96qZXUcuYLtJBfw1kwkutAOq+dHE5gzlmlyanPftJ7xRi2D5uCuES/F6AJuLd
         VwLf2a2ohunCMbikjPPE17XGICMPUL+AxgP+RyIPLkgrRDGfb8cDdUcK9+Audsi+BuND
         t4i1OjkCtVa/l/T74lpeKup4cNPjiPvPTt9nVzUL9H/UdALk/OWYwUojI1Lwk3yHU9gF
         mgfA5AzCrn/orwMpPVSxg4wMzHpNmJUygxBUPgCrrQF5R55Zx0whekBlgJCfWGTxPqu9
         Wb/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNjaB68Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05622a178900b004120307705dsi1493670qtk.797.2023.08.31.16.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNjaB68Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr21-0006o8-20; Thu, 31 Aug 2023 19:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1z-0006nS-R9
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1q-0002HZ-J0
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:55 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdb7b0c8afso10588825ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524285; x=1694129085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+xlV3SGZMVXNVWkGKftcbyBWtbVebk+6sY7EU3bpYY=;
 b=UNjaB68YDDIRwEWVvxyeK2ZRUu3iLlAu4fYyaJvxIVO9U74IS8Yr69KSJeAno4ATa0
 AjapMPmMQe8ZTyvnb+bTfDaUVEQuJHg6Xs1w2IGaOVhF2foWt/M5oKb0WuE8kTxkizg8
 7e5AXGfMZFzSbDxt75QMDAKBSXFNOupLI7nKargJ61l2e3Of0rqhdi0FpFGj3rhTKvp3
 IFOq/s+I5XbzC6YKX0pfPQNYkmNqm9MdvXjHSLbRLqUlzKX7MqHJopnD3PrpVw9R8Gzy
 jKa+FiZBzgV0UF6UKfCT2zk19xU6pgIJbWxPKNTKKoHNwDf6QqjAHdVPIeAdO2aRi0g1
 DFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524285; x=1694129085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+xlV3SGZMVXNVWkGKftcbyBWtbVebk+6sY7EU3bpYY=;
 b=iwoumLPJ0twQ6maPrGLs7izz0xOgVksdgDcQ9WxwHnvtv4Lac98xhD7sop+F3ryAzZ
 XOme7LjzyqrU1N8opKaUI0VarHAkzAqfvywQ3DFlYS8mpso/cvmQoLzt8V7NQKEBmH/U
 2QoM3+vJfVOPhC5SY3gkSTf9byPHAvnFp5ALg2qrpNcYXe2SrdSRgJAXcG7Ina8xb3rv
 Geh9o7Eh9ZubHQFCVOKqHQrEs0yITmoUHIslDRx2Nzu7CQl/xf4zfPNzPCmZ7fWvRI5F
 7uUdH375ewxo38546Hl8B9oB6h9E7ZVfqmS9Z3KG1JSFsSlbQUFKCJiOIyT+3n4v5t7h
 k8Rg==
X-Gm-Message-State: AOJu0Yy0bsERvBBUgx2kpTov/dHYplSCr7OpmWKN8rjRM/FwpYl4PG8w
 czn8YVOcyPSa+fAKrii/f1IZ7/MA03+2VZl20ac=
X-Received: by 2002:a17:902:ef8c:b0:1b6:af1a:7dd3 with SMTP id
 iz12-20020a170902ef8c00b001b6af1a7dd3mr1108532plb.23.1693524284892; 
 Thu, 31 Aug 2023 16:24:44 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 3/5] target/arm: Implement HCR_EL2.TIDCP
Date: Thu, 31 Aug 2023 16:24:39 -0700
Message-Id: <20230831232441.66020-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
References: <20230831232441.66020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xSBnF/4YOLSj

Perform the check for EL2 enabled in the security space and the
TIDCP bit in an out-of-line helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  1 +
 target/arm/tcg/op_helper.c     | 13 +++++++++++++
 target/arm/tcg/translate-a64.c | 16 ++++++++++++++--
 target/arm/tcg/translate.c     | 27 +++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 95e32a697a..cf5c55a12b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -81,6 +81,7 @@ DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
 DEF_HELPER_FLAGS_2(lookup_cp_reg, TCG_CALL_NO_RWG_SE, cptr, env, i32)
+DEF_HELPER_FLAGS_2(tidcp_el1, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, cptr)
 DEF_HELPER_3(set_cp_reg64, void, env, cptr, i64)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 3baf8004f6..9014c3ca46 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -764,6 +764,19 @@ const void *HELPER(lookup_cp_reg)(CPUARMState *env, uint32_t key)
     return ri;
 }
 
+/*
+ * Test for HCR_EL2.TIDCP at EL1.
+ * Since implementation defined registers are rare, and within QEMU
+ * most of them are no-op, do not waste HFLAGS space for this and
+ * always use a helper.
+ */
+void HELPER(tidcp_el1)(CPUARMState *env, uint32_t syndrome)
+{
+    if (arm_hcr_el2_eff(env) & HCR_TIDCP) {
+        raise_exception_ra(env, EXCP_UDEF, syndrome, 2, GETPC());
+    }
+}
+
 void HELPER(set_cp_reg)(CPUARMState *env, const void *rip, uint32_t value)
 {
     const ARMCPRegInfo *ri = rip;
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b77c92437..786a568d31 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2154,6 +2154,20 @@ static void handle_sys(DisasContext *s, bool isread,
     bool need_exit_tb = false;
     TCGv_ptr tcg_ri = NULL;
     TCGv_i64 tcg_rt;
+    uint32_t syndrome;
+
+    if (crn == 11 || crn == 15) {
+        /*
+         * Check for TIDCP trap, which must take precedence over
+         * the UNDEF for "no such register" etc.
+         */
+        syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
+        switch (s->current_el) {
+        case 1:
+            gen_helper_tidcp_el1(cpu_env, tcg_constant_i32(syndrome));
+            break;
+        }
+    }
 
     if (!ri) {
         /* Unknown register; this might be a guest error or a QEMU
@@ -2176,8 +2190,6 @@ static void handle_sys(DisasContext *s, bool isread,
         /* Emit code to perform further access permissions checks at
          * runtime; this may result in an exception.
          */
-        uint32_t syndrome;
-
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
         gen_a64_update_pc(s, 0);
         tcg_ri = tcg_temp_new_ptr();
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 38ad8dd4bd..47d3bc5fd5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4538,6 +4538,20 @@ void gen_gvec_uaba(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
+static bool aa32_cpreg_encoding_in_impdef_space(uint8_t crn, uint8_t crm)
+{
+    static const uint16_t mask[3] = {
+        0b0000000111100111,  /* crn ==  9, crm == {c0-c2, c5-c8}   */
+        0b0000000100010011,  /* crn == 10, crm == {c0, c1, c4, c8} */
+        0b1000000111111111,  /* crn == 11, crm == {c0-c8, c15}     */
+    };
+
+    if (crn >= 9 && crn <= 11) {
+        return (mask[crn - 9] >> crm) & 1;
+    }
+    return false;
+}
+
 static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                            int opc1, int crn, int crm, int opc2,
                            bool isread, int rt, int rt2)
@@ -4619,6 +4633,19 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         }
     }
 
+    if (cpnum == 15 && aa32_cpreg_encoding_in_impdef_space(crn, crm)) {
+        /*
+         * Check for TIDCP trap, which must take precedence over the UNDEF
+         * for "no such register" etc.  It shares precedence with HSTR,
+         * but raises the same exception, so order doesn't matter.
+         */
+        switch (s->current_el) {
+        case 1:
+            gen_helper_tidcp_el1(cpu_env, tcg_constant_i32(syndrome));
+            break;
+        }
+    }
+
     if (!ri) {
         /*
          * Unknown register; this might be a guest error or a QEMU
-- 
2.34.1

