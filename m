Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5209661lfh;
        Thu, 2 Jun 2022 15:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy052iUedmVvUI/aoLJZ2qlGLQkeoAr3NM8AIORv62A+cZeIqYcZGLqp+Enljs9DTI3FBo
X-Received: by 2002:ae9:ef46:0:b0:6a3:5c24:2b4 with SMTP id d67-20020ae9ef46000000b006a35c2402b4mr4583398qkg.305.1654208202976;
        Thu, 02 Jun 2022 15:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208202; cv=none;
        d=google.com; s=arc-20160816;
        b=MGzBK+fvHuYoBxyrXMtnuDkwCaBppceSeDdKl4wsiZz7XWMmmvGR09GFF8e5FWBz5L
         Y84cCKztclh7XI3j6wpANMF6+FBz9bXwHxaW1UDUq2PUw/WyPNoLbiHXnNNplxxqHPYD
         6SfY81qJpjAMdAr/AQAAoxONO2E6FerOA2GFHmobgBfuSH6wmHIqK/8DTfgwEvTXL4CY
         pqNMKRomKvyDEGrxngNpAw5AsjNfv7UFQJI3idKAhZ8bqC4kvMzfQGQgPsSDVGcVuRya
         VJKs5JQAgR3mOBpTjjyD7XIaggV9nrBKseSjXyMFS83GW2lr1l61bUcIQR2X1feG5BwR
         /ddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IYMOwEB0ADTMl9SBwIXKgrIqkj0CMNexLOCc9Adz/Xk=;
        b=azcsxNwKp06ByNUqdGplXAC61Kg1iCG9HhOEAHw9sr+1VROUy7hcYEmkrTmJV8HeL7
         69nIoJc9hGquXF3w5MYdHa4M1N45aHrGPkDcBRqB41g/9CI+RIqVQu3ief8a4EVJ4gQl
         VFsT8OzPr8iDKxJJnzl1uuK8Rsg8E/Q5NevFT1b1YV8kg78oD+ucN5E9GSWnsk6IF7/Q
         8KhKm+hlsFFFQ4oCGPdsSG9NFyiY59UP2TveLmhAo9oraTffbMcYBhPgrCTSaiC2pFwq
         Td6qn4IHCN1vBWHJV1kbyqUL2b+5qTlw8Iv2kwoLHRtU3+Vpbtx4yymdOnhBWqeWfu6w
         vRtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eno09yC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020ac85f89000000b00304b9c49352si2576424qta.702.2022.06.02.15.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eno09yC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwt7S-0004q7-FL
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgu-0004n3-I7
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:16 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgs-000090-8a
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:16 -0400
Received: by mail-pg1-x532.google.com with SMTP id e66so5779886pgc.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYMOwEB0ADTMl9SBwIXKgrIqkj0CMNexLOCc9Adz/Xk=;
 b=Eno09yC5hYVl0bcdjW7hCxXYmgIN1VrtcVyyaJ3LsCktujR7DgXOiYEynlTC3V+G/I
 gHBL9KY1NWxC+7g4p+cJbEYtCV3mj8HvZnssga+pSTApy3dMo4cLMJiRGFxjjnH/Zp/9
 214vIkuxJLnnGxLpmTL77g/1TwhZebasBV1TilakGxaGrvFUIugaNiX3Gf8oVokG2voy
 BBnTS4QsPaVQGWCqHNZDKeoM0HNYH6jbTKJgW7p4kkOYG98f8bvZhdL1Po4CE51sY4Wr
 b4n/tHfh1ekXFQbow8Lgjaio2sWgmsEQGuRceTpKxRpcfkFoAk30Q5wN4ZV3kGhFwLlr
 tmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYMOwEB0ADTMl9SBwIXKgrIqkj0CMNexLOCc9Adz/Xk=;
 b=vSiQ4xaCUJZNa9lP5ti322cyqrQc8s+pl57jKxzJEQbw62yDnBUqD6fk2yx40ADuY4
 Izds9e74HD+0qJXCtaq0Czsz9qsPh9d2YL9/OWX95a+j0rvCMTa3vmLWkXxb8mCBTNWQ
 SsPsh4F4iA+zo3NQ/cM+siD7bVHPyD5nEaWJQ9louE0X/hDGCFcEvGwHIsph1L5zQ7J5
 Tg7lZCuyf8t+VSJItLd1oxuHWRrJeWsL23b5GrUSoC4UrqhQ79YeQZo5elPaxFEza0Mo
 FOePkWbLpSBQr7A8YLy5WaG5SuNkrj+vgI6K6t5qlYwoFkcCH7zux8hwKlCDlu6rQ560
 x+tw==
X-Gm-Message-State: AOAM532w4AdPmA2q6vWGATz2a7wwCCnqO8TjxjzwQCfncGMS9tanghFo
 8meEOb8pL5v9/Iq+kLW5Uu95VXuA5SPHQw==
X-Received: by 2002:a05:6a02:19b:b0:3fa:3e63:15fb with SMTP id
 bj27-20020a056a02019b00b003fa3e6315fbmr6117770pgb.129.1654206551981; 
 Thu, 02 Jun 2022 14:49:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/71] target/arm: Add ID_AA64SMFR0_EL1
Date: Thu,  2 Jun 2022 14:48:02 -0700
Message-Id: <20220602214853.496211-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1zMXHdDjBakV

This register is allocated from the existing block of id registers,
so it is already RES0 for cpus that do not implement SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 25 +++++++++++++++++++++++++
 target/arm/helper.c |  4 ++--
 target/arm/kvm64.c  |  9 +++++----
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f6d114aad7..24c5266f35 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -966,6 +966,7 @@ struct ArchCPU {
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
         uint64_t id_aa64zfr0;
+        uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
@@ -2190,6 +2191,15 @@ FIELD(ID_AA64ZFR0, I8MM, 44, 4)
 FIELD(ID_AA64ZFR0, F32MM, 52, 4)
 FIELD(ID_AA64ZFR0, F64MM, 56, 4)
 
+FIELD(ID_AA64SMFR0, F32F32, 32, 1)
+FIELD(ID_AA64SMFR0, B16F32, 34, 1)
+FIELD(ID_AA64SMFR0, F16F32, 35, 1)
+FIELD(ID_AA64SMFR0, I8I32, 36, 4)
+FIELD(ID_AA64SMFR0, F64F64, 48, 1)
+FIELD(ID_AA64SMFR0, I16I64, 52, 4)
+FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
+FIELD(ID_AA64SMFR0, FA64, 63, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4190,6 +4200,21 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
 }
 
+static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, F64F64);
+}
+
+static inline bool isar_feature_aa64_sme_i16i64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, I16I64) == 0xf;
+}
+
+static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cb44d528c0..48534db0bd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7732,11 +7732,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64zfr0 },
-            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64SMFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64smfr0 },
             { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index b3f635fc95..28001643c6 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -682,13 +682,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         ahcf->isar.id_aa64pfr0 = t;
 
         /*
-         * Before v5.1, KVM did not support SVE and did not expose
-         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
-         * not expose the register to "user" requests like this
-         * unless the host supports SVE.
+         * KVM began exposing the unallocated ID registers as RAZ in 4.15.
+         * Using SVE supported is an easy way to tell if these registers
+         * are exposed, since both of these depend on SVE anyway.
          */
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 4));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 5));
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.34.1

