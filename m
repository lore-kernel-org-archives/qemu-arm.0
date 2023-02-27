Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5117511ejc;
        Mon, 27 Feb 2023 15:02:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+OndbsgApDOyF9/dotGDsV5gxyNUV41MEi2mC3dGeKqHpFYGzuxqrzJPeqdqD+bD6Z4uka
X-Received: by 2002:a05:6214:1249:b0:56e:bfda:a14f with SMTP id r9-20020a056214124900b0056ebfdaa14fmr2421841qvv.9.1677538922903;
        Mon, 27 Feb 2023 15:02:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538922; cv=none;
        d=google.com; s=arc-20160816;
        b=zPvduik1iv4HEqmt+4PYIerhFk4dMPyVGPVuSB/ULuK8/pdUfzcTh9ms3RZixqi+BV
         zXGz6SqVnVO3hkon7IN9cY6CLYMmMN4HmpkB46oG8Avvu+pC8/4A0W5cRFMNQIOX1nDF
         b378R5SAzQ0ugXmfeA1/NYxHefQ1+D8XgFR0nvVpyqQCAu7qv1BnZkZiH4mB3gMdx5mL
         r/fdiUwMRXVym/MaGxlYMxJa4gLcGppbPAGTg/dh/1/zybHQEFFziyf/n5dVg8rv7rv4
         MCq+6gKdbBgQXPnPo1VHguzbOymOM5wnJEBNi7LHOLQgKVu9WO65YjpnyfVDFv7K3hm4
         sLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KT8em+76sjO6uHZ8hE6K4GDRZnqGduR07fvDmbr06yk=;
        b=YIv/DbHkEdOnYKYKxxRU+PUK7rQ+sCHwF1pJB+6KqXmwuODLV+SZ37QUrPqpjGGA89
         HDuKszwjmpa+WbI/f7oTKdUZdnt1BJ4f3NfwGzhkn/A4y7VW3XWYm9Ndy1l9anVvFGyy
         9vADLZfqGjNai9IzfdxH/gGwnlebi/340FE2dHuSj/fCwCiwfKtmeTM9wpS2nwMzPVId
         GD3unK9E7v+p32kB5X4zWn+XIjjBA+JDHsk31wpCzoRJe3SXaVep4/A16YbFJmhZM3rG
         5GUucA7oht1EHUtHkyjzAu4H835DeZQOkcuvhpZvfHxv7mwW+q9shtyOUgDwN8eyr7HV
         yPrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l1kq7/qr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a0cf308000000b0056ea94f2162si7222431qvl.496.2023.02.27.15.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:02:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l1kq7/qr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmUy-0007eu-IT; Mon, 27 Feb 2023 18:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUw-0007US-PN
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:34 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUu-0000xi-RX
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:34 -0500
Received: by mail-pl1-x632.google.com with SMTP id h8so5194941plf.10
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KT8em+76sjO6uHZ8hE6K4GDRZnqGduR07fvDmbr06yk=;
 b=l1kq7/qrYmVSu7GA0PANGmr8RawNSLkaOdxhXYDz2/rGz3tIqv7JaX2y3iDBwNs5UI
 wu7anfIQFBVw1QYFPkos1v8lA3fDrSBpm1NdbX96n5Bhq1G7ual+ctwSxURZDgvJrKpP
 eytX+MHJnd3dn2FdY/hfCrQcSx5l9a3+WOYUT3cC9qGmLi3K3U9WNU9rMAjnJCZRunbj
 ZdxZVtETNrJVftYYCo4DFMhr7dXCfkPJV395wGUAGd5oaclonwdsIiL82nIHjFRNLj0x
 tZlYmK8QQrkNPwQ8TEhZz9ijKhi+bfo13oDW7XQfRYoq3871rFTaW9LOIlj6bexHciV9
 vE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KT8em+76sjO6uHZ8hE6K4GDRZnqGduR07fvDmbr06yk=;
 b=lBB1fScu5t+PZrzPVMXoiHnGdYoTjAblMRzLGy01xI5oH94XvMr2QE1vycZFBP1uKe
 Qun5U7HSkIFDGfvCCWimkMuLwyUID9ZSxh8A0WVrkdq8/IENviYNZBhsWXboa+ZaTGgd
 QQN7pxlGd/sDUFhotUoHnhUJZAkFYW+GghX2DJUjnWTPAPYgrleDgPgtp0neoILgTMJv
 nFsVYezG5Fo2b9jAR8CU0Vic8KK4nnCNOZjXgE4ljVr5KhqsloqoehppCRxdaQIgE0ff
 5CIooCc95bW+qqINazgo41fsIdB3TxF2gJSQ2F9uigDWWSYNw6MorDcsgDvdWVaQFdYj
 IfDw==
X-Gm-Message-State: AO0yUKXlrBmae/NEPsZq1lrwY9Opjh+RtKDH5r/xEA32jyuk0IhNW+9N
 a9NfLumTorZkaaa0H+FZf80jFw==
X-Received: by 2002:a05:6a20:4c28:b0:cc:fced:f700 with SMTP id
 fm40-20020a056a204c2800b000ccfcedf700mr977516pzb.30.1677538891976; 
 Mon, 27 Feb 2023 15:01:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 04/21] target/arm: Add RME cpregs
Date: Mon, 27 Feb 2023 13:01:05 -1000
Message-Id: <20230227230122.816702-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: b7GhMgeNiptg

This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL, PAALLOS,
RPALOS, RPAOS, and the cache flush insns CIPAPA and CIGDPAPA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 19 +++++++++++
 target/arm/helper.c | 83 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 230241cf93..8d18d98350 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -541,6 +541,11 @@ typedef struct CPUArchState {
         uint64_t fgt_read[2]; /* HFGRTR, HDFGRTR */
         uint64_t fgt_write[2]; /* HFGWTR, HDFGWTR */
         uint64_t fgt_exec[1]; /* HFGITR */
+
+        /* RME registers */
+        uint64_t gpccr_el3;
+        uint64_t gptbr_el3;
+        uint64_t mfar_el3;
     } cp15;
 
     struct {
@@ -1043,6 +1048,7 @@ struct ArchCPU {
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
+    uint8_t reset_l0gptsz;
 
     /*
      * Intermediate values used during property parsing.
@@ -2336,6 +2342,19 @@ FIELD(MVFR1, SIMDFMAC, 28, 4)
 FIELD(MVFR2, SIMDMISC, 0, 4)
 FIELD(MVFR2, FPMISC, 4, 4)
 
+FIELD(GPCCR, PPS, 0, 3)
+FIELD(GPCCR, IRGN, 8, 2)
+FIELD(GPCCR, ORGN, 10, 2)
+FIELD(GPCCR, SH, 12, 2)
+FIELD(GPCCR, PGS, 14, 2)
+FIELD(GPCCR, GPC, 16, 1)
+FIELD(GPCCR, GPCP, 17, 1)
+FIELD(GPCCR, L0GPTSZ, 20, 4)
+
+FIELD(MFAR, FPA, 12, 40)
+FIELD(MFAR, NSE, 62, 1)
+FIELD(MFAR, NS, 63, 1)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20e28d5e09..6e9dcb17c4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6911,6 +6911,83 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL2_RW, .accessfn = access_esm,
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
+
+static void tlbi_aa64_paall_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush(cs);
+}
+
+static void gpccr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    /* L0GPTSZ is RO; other bits not mentioned are RES0. */
+    uint64_t rw_mask = R_GPCCR_PPS_MASK | R_GPCCR_IRGN_MASK |
+        R_GPCCR_ORGN_MASK | R_GPCCR_SH_MASK | R_GPCCR_PGS_MASK |
+        R_GPCCR_GPC_MASK | R_GPCCR_GPCP_MASK;
+
+    env->cp15.gpccr_el3 = (value & rw_mask) | (env->cp15.gpccr_el3 & ~rw_mask);
+}
+
+static void gpccr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    env->cp15.gpccr_el3 = FIELD_DP64(0, GPCCR, L0GPTSZ,
+                                     env_archcpu(env)->reset_l0gptsz);
+}
+
+static void tlbi_aa64_paallos_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush_all_cpus_synced(cs);
+}
+
+static const ARMCPRegInfo rme_reginfo[] = {
+    { .name = "GPCCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 6,
+      .access = PL3_RW, .writefn = gpccr_write, .resetfn = gpccr_reset,
+      .fieldoffset = offsetof(CPUARMState, cp15.gpccr_el3) },
+    { .name = "GPTBR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 4,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.gptbr_el3) },
+    { .name = "MFAR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 0, .opc2 = 5,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mfar_el3) },
+    { .name = "TLBI_PAALL", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 4,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paall_write },
+    { .name = "TLBI_PAALLOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    /*
+     * QEMU does not have a way to invalidate by physical address, thus
+     * invalidating a range of physical addresses is accomplished by
+     * flushing all tlb entries in the outer sharable domain,
+     * just like PAALLOS.
+     */
+    { .name = "TLBI_RPALOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    { .name = "TLBI_RPAOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    { .name = "DC_CIPAPA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NOP },
+};
+
+static const ARMCPRegInfo rme_mte_reginfo[] = {
+    { .name = "DC_CIGDPAPA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NOP },
+};
 #endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
@@ -9102,6 +9179,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbios, cpu)) {
         define_arm_cp_regs(cpu, tlbios_reginfo);
     }
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        define_arm_cp_regs(cpu, rme_reginfo);
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            define_arm_cp_regs(cpu, rme_mte_reginfo);
+        }
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.34.1

