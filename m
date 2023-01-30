Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1150189ejb;
        Mon, 30 Jan 2023 10:27:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9O9eHwufShbT6ySxZYfx3SXnEFfFlRWzqZlLwQoqpvVVbdflnGD4T/wq3PkX8ZmenD6GRK
X-Received: by 2002:a05:6214:27c9:b0:53c:14c0:213d with SMTP id ge9-20020a05621427c900b0053c14c0213dmr8082488qvb.27.1675103242282;
        Mon, 30 Jan 2023 10:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103242; cv=none;
        d=google.com; s=arc-20160816;
        b=mKE8bL5s5NXfMzWMc4Vx5ombwo80NljgwOp6YoMfsJOgtEu7PQATs26tnm+f73wUAw
         KEPjzL1h3KuL7Ov2VA9Fii4FOQVQI9TfrzS2sDGuCYZ9hV02MuWOa/aD69+FH+lr5P0h
         avF0pInN3dHRrMNlYg8Nz22pLlJBJJ/0o0kb+hW915FUPa4hETbW/g8YFdmlpuDiKUW0
         xllcrgtCBObse2TLkHJFRvcXhD0MfiKygW73eR1gUICyVepiXKQfrjmKzVYMN2SImEV0
         VLISIkUe9cwliYB79Hjk+gRQJ+6eVfQGpzu1DdOz3NvL4kglVq1n8tBLKrnl90twqAEt
         5+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uBNTWQQLxGxHOy4+W6TEzUkaANrDoD5kHnZ+7qxh+v4=;
        b=HCwda1L8K0rBx7BnZDN8TtD2CgABZnnFUC2YgQA36GLi6QNuD/qZV/mwnY6hBEuGzX
         TxdyItFD3tCwBu8T3YHpCHUUrFrm8ivZJJ++zZjk9QqeJ/xKwMahS+wI7QXddtxwqd+i
         k859ugOJmIqbKeiN7KFHbkKC8hdQicCklWwp2ekhLZB6xEVYQTdSLiLy7MM+JaLwqG5p
         nOfDeDPYR6o6tb4Xsh3QG7HjDJPHXmjwffU41A5i5tWHqk9jVDZeKAxu2K6GudU6r0MA
         Hb0FiAGmSiiWwxt2zSTdG3N/jBWP80o1VtPrtNVMl5JZI2Gw8pfstcGScmhNQPRRRWiT
         8vEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exQuGf7Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h128-20020a376c86000000b0070665b358ebsi6970107qkc.139.2023.01.30.10.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exQuGf7Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqL-00018j-P8; Mon, 30 Jan 2023 13:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqH-00013H-8G
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqA-0008TQ-Sf
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so11976980wrv.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uBNTWQQLxGxHOy4+W6TEzUkaANrDoD5kHnZ+7qxh+v4=;
 b=exQuGf7YJfLzeq+F5yE6uSyYsWQ5xCjQiCYLX1olWVI7Mx9tFTUxH9NxSFk2tOUoBe
 kEZ/nteEooX03Bqam6wtHC7H9qmUC8Kn3zARGYCyFhWhrrGVw8cxDlTIJPvkutO3Msas
 /WVHscZEzCZA7hgPY4Rz+B889QGj0vi02zcK91Uvt58SySLXjABXzLM4axNdJCbDoS02
 v/9OosqkDEqzTVbgMrIrDUCYie5WVeMbsjlPe5adg7xiWXx8aj/EJKPidrtgcrNIDWYH
 0TT7yiSiQQORK+tJR3+5KXVYgaNhS1gk0tyVZitCtyZcrPGzarL+ZwG5X4i/SajCNmaL
 ZnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBNTWQQLxGxHOy4+W6TEzUkaANrDoD5kHnZ+7qxh+v4=;
 b=K9i/fdBlsv6anrWYMXmttWgXCUz/8fkSGJw0in0EHwmi82U/G7UBfgWJxJAE8D5ohg
 KM6ZM5IEkHck2dWKmzHAFOmaFkAiiOUPQ/i3UasnWA0yt+dl4q2HqrTr42Tse/eFV8cN
 X65fOZTd9KDLCbIOVvdP8rCmxK3EmgJMeQ+PSYPC33NfqnJDioKt6WZp3r7EqL+rCvGq
 JQuHCEGk70QpJ58wLmhuqRvqu8ck9YXdlfWbfc41iWoMr1krEo3fsPFtM9sa3Eeh3W3Q
 7EjhITULzaBfIzYcrdnC96lXHCuWVjIVTObR1YlUMiP1uDoqpcmPb8a8u1grVt7PlGvO
 d8NA==
X-Gm-Message-State: AO0yUKUYvEew75wYC3ZW5Dfj9GDNCILYgoPeK00ceMJTCULjezNxh2Ms
 7e9znTgkyD8+Xv+jH5KcfqpGoA==
X-Received: by 2002:a5d:5908:0:b0:2bf:f027:3c30 with SMTP id
 v8-20020a5d5908000000b002bff0273c30mr3160086wrd.56.1675103113510; 
 Mon, 30 Jan 2023 10:25:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/23] target/arm: Mark up sysregs for HFGRTR bits 24..35
Date: Mon, 30 Jan 2023 18:24:48 +0000
Message-Id: <20230130182459.3309057-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gorRqtHkw4MG

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 24..35.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-13-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 12 ++++++++++++
 target/arm/helper.c | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 67d87ae8bf5..1b219242d5d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -603,6 +603,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, LORID_EL1),
     DO_BIT(HFGRTR, LORN_EL1),
     DO_BIT(HFGRTR, LORSA_EL1),
+    DO_BIT(HFGRTR, MAIR_EL1),
+    DO_BIT(HFGRTR, MIDR_EL1),
+    DO_BIT(HFGRTR, MPIDR_EL1),
+    DO_BIT(HFGRTR, PAR_EL1),
+    DO_BIT(HFGRTR, REVIDR_EL1),
+    DO_BIT(HFGRTR, SCTLR_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL0),
+    DO_BIT(HFGRTR, TCR_EL1),
+    DO_BIT(HFGRTR, TPIDR_EL1),
+    DO_BIT(HFGRTR, TPIDRRO_EL0),
+    DO_BIT(HFGRTR, TPIDR_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c059935d0e6..9f6d9e2a3c9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2206,6 +2206,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "MAIR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_MAIR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.mair_el[1]),
       .resetvalue = 0 },
     { .name = "MAIR_EL3", .state = ARM_CP_STATE_AA64,
@@ -2349,25 +2350,30 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
     { .name = "TPIDR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 2, .crn = 13, .crm = 0,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[0]), .resetvalue = 0 },
     { .name = "TPIDRURW", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidrurw_s),
                              offsetoflow32(CPUARMState, cp15.tpidrurw_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 4, .crn = 13, .crm = 0,
       .access = PL1_RW,
+      .fgt = FGT_TPIDR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[1]), .resetvalue = 0 },
     { .name = "TPIDRPRW", .opc1 = 0, .cp = 15, .crn = 13, .crm = 0, .opc2 = 4,
       .access = PL1_RW,
@@ -4164,6 +4170,7 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TCR_EL1,
       .writefn = vmsa_tcr_el12_write,
       .raw_writefn = raw_write,
       .resetvalue = 0,
@@ -5399,6 +5406,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
       .access = PL1_RW, .resetvalue = 0,
+      .fgt = FGT_PAR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
       .writefn = par_write },
 #endif
@@ -7562,10 +7570,12 @@ static const ARMCPRegInfo scxtnum_reginfo[] = {
     { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL0_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL0,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
     { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL1_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL1,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
     { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
@@ -8604,6 +8614,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
+              .fgt = FGT_MIDR_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
             /* crn = 0 op1 = 0 crm = 0 op2 = 7 : AArch32 aliases of MIDR */
@@ -8614,6 +8625,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 6,
               .access = PL1_R,
               .accessfn = access_aa64_tid1,
+              .fgt = FGT_REVIDR_EL1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
         ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
@@ -8785,6 +8797,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mpidr_cp_reginfo[] = {
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
+              .fgt = FGT_MPIDR_EL1,
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
@@ -8884,6 +8897,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .name = "SCTLR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
             .access = PL1_RW, .accessfn = access_tvm_trvm,
+            .fgt = FGT_SCTLR_EL1,
             .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
                                    offsetof(CPUARMState, cp15.sctlr_ns) },
             .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,
-- 
2.34.1

