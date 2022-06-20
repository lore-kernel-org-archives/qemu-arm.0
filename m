Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp596863lft;
        Mon, 20 Jun 2022 10:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRphwv3lQCgB6TLKq2FUS76nqQpd3RjWTV7zkNNGPMY9eqysT/53xP096/tfkf+ts5Lhe5
X-Received: by 2002:a37:aa41:0:b0:6a6:9921:face with SMTP id t62-20020a37aa41000000b006a69921facemr16924201qke.612.1655747609715;
        Mon, 20 Jun 2022 10:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747609; cv=none;
        d=google.com; s=arc-20160816;
        b=LA94BIEbPdi+r3gNTf9mjjyedH3nXlPY5rj7YwBNxs20wWIyD4yrjf9AJlw6fbyfxc
         O/gYrMOrdSfYbjcmtJtr2S5YGx9vqF5xjsm5Kr6fPVCy6JEYeLeSim/XyHqtxYey3Ind
         lSrooXOXwykwMyYQ1Q4Mlb7NW4oA1nIsWsNlFso67K0v+VddxbBRidgOnoOOdL7wrD9c
         KpxYimt+U0SlNqMmzW4AWgLefoTn06WLFezocjIHkrmJQETrZEWkxYcZaAOLUyWS4onr
         25Jbi0tEAZ6RPpS8b0xffJOqqdh+Jaoz24iq+gf+Vs2WXaLREaBaY+3CrFIF0wJ0tLG8
         RvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OZpiX7LtYWl5urPMXRvMPogY6FpHDH7uieDT8X+wM0g=;
        b=lihWgduHQN6O50bC8IpDKCucj/DA5JGk03uO07bRHpLzCEZ+Yz5viuxryL8drUDn3k
         tIA09AMCm9a1LqMhlofUaonnx2kDq0DzdbTIRlyHPHa55stMBJpiu/nMEsXcDRzhto9e
         x0/9eT/UBp8Z2T05OK4tW/97CmR5EtRxAlHHNmTSQYI+3SDTenzuRVQ8IHBrp/YeDz4Q
         8uK/SY+sfmqasQwvQDLY7zWwoZtyqUVn03lpQUIjgBqr0K01Sd6gHYmIe+AOOKSIzzsH
         W/Jl+uZvQbzpVlRMExVDRlbNVJgqqT4h6IxnLTTH8UH8zeI4/r/Gta8U+gLmbirs8ozC
         mATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lyS9bEfs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a0cd6c2000000b004703d3ed546si3228260qvi.236.2022.06.20.10.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lyS9bEfs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Lab-0005ib-3W
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZs-0005Ve-Cq
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZq-0001KY-F9
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id i64so10863171pfc.8
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OZpiX7LtYWl5urPMXRvMPogY6FpHDH7uieDT8X+wM0g=;
 b=lyS9bEfs/KFTbXGWofRu6KoP7tqbOIpCvJ4ClsMshs78OyVyFKzilzf10KGhyfK2+b
 nl4iYxqEJaTJgEND6SZ9YLlDUQS1g72ePk6/BsesxM07aj8JHpG+DpvkBE451hW4q59c
 wL1DMTPGY+naQqi8F68KOG9u+HVckanQBaB1EoyLMlEC+gjQIxU0kj96wo2TzVdKl5gN
 4XDDIBvZx3CT/Xmuqtjg2Tt7P8i8XmYoGByh7y3IMNhn7DU0XwoBnACN7SGgnpkauP6k
 z7Tu3F6P77qkeHjSAQwuTgPdweZ3JglCZ703+1hpGU2nG5BtU4sWmsk+M2gWECoBklLl
 lXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OZpiX7LtYWl5urPMXRvMPogY6FpHDH7uieDT8X+wM0g=;
 b=M+0cPwRn0Rnjq9yUa6dMOoCpBaEA4V0n8ay+6qo/ejkLbh2GsTCvyajpJGu5kamDHb
 trZyogujIjFAG16PL7aAXAlm5NbX0fNmXOF6BrNVZ5TNATp/ADbYjlqTzCNOTirt00Du
 irwponGLyy2t6BtM8sjYNM9x8anlqSlgZ/jUJC5tpsdbJAlRLAPZC6ALIJR66rPMXfsS
 LdNBgvlxWJHgFBF1I6ch8ga3M3UN8EbvrO7TdHSpAKJGqZ4glA21JhD7qDi/Q/q/hbNC
 dH4vrblJjSQcBy/v5CBOcgkqJC6Q3H3L1ICuxVBTk+N2kEASCFRFIctRg90N/QZeR/TF
 LQEw==
X-Gm-Message-State: AJIora8vipgOdEHKclcM81wSs8u02kaNEfswjzTPns3NTgYjGw6q73J7
 MhVNJVugmAPxPuUC0DDc1HKWmJlP7RzdzQ==
X-Received: by 2002:a05:6a00:1496:b0:525:33c5:9c1e with SMTP id
 v22-20020a056a00149600b0052533c59c1emr650276pfu.31.1655747561689; 
 Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/51] target/arm: Add SMCR_ELx
Date: Mon, 20 Jun 2022 10:51:50 -0700
Message-Id: <20220620175235.60881-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fb19svlQxkzM

These cpregs control the streaming vector length and whether the
full a64 instruction set is allowed while in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  8 ++++++--
 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bb8cb959d1..dec52c6c3b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -669,8 +669,8 @@ typedef struct CPUArchState {
         float_status standard_fp_status;
         float_status standard_fp_status_f16;
 
-        /* ZCR_EL[1-3] */
-        uint64_t zcr_el[4];
+        uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
+        uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
     } vfp;
     uint64_t exclusive_addr;
     uint64_t exclusive_val;
@@ -1434,6 +1434,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 FIELD(SVCR, SM, 0, 1)
 FIELD(SVCR, ZA, 1, 1)
 
+/* Fields for SMCR_ELx. */
+FIELD(SMCR, LEN, 0, 4)
+FIELD(SMCR, FA64, 31, 1)
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3acc1dc378..2072f2a550 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5879,6 +5879,8 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
          */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
+        { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
+          "SMCR_EL1", "SMCR_EL2", "SMCR_EL12", isar_feature_aa64_sme },
 
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
@@ -6357,6 +6359,30 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->svcr = value;
 }
 
+static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    int cur_el = arm_current_el(env);
+    int old_len = sve_vqm1_for_el(env, cur_el);
+    int new_len;
+
+    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > R_SMCR_LEN_MASK + 1);
+    value &= R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
+    raw_write(env, ri, value);
+
+    /*
+     * Note that it is CONSTRAINED UNPREDICTABLE what happens to ZA storage
+     * when SVL is widened (old values kept, or zeros).  Choose to keep the
+     * current values for simplicity.  But for QEMU internals, we must still
+     * apply the narrower SVL to the Zregs and Pregs -- see the comment
+     * above aarch64_sve_narrow_vq.
+     */
+    new_len = sve_vqm1_for_el(env, cur_el);
+    if (new_len < old_len) {
+        aarch64_sve_narrow_vq(env, new_len + 1);
+    }
+}
+
 static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
@@ -6367,6 +6393,21 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL0_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, svcr),
       .writefn = svcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL1_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[1]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL2_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[2]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL3_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1

