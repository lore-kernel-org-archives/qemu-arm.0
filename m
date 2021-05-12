Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5273070lfg;
        Wed, 12 May 2021 11:39:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw4j0aJhM7Hgg3QjBNPeo71E8MiGMQLWyaa0haNBYKrs15iGi4fQAbWfj9i76ejHT6UcV7
X-Received: by 2002:a05:6638:304:: with SMTP id w4mr33339020jap.45.1620844746554;
        Wed, 12 May 2021 11:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620844746; cv=none;
        d=google.com; s=arc-20160816;
        b=vIMcagoQhTefP5jOKHo4UF5zvHSiSqREL5DExTdQ+BTfE9fSEnkaU5f5TMYF41ufjK
         4x+3EEVSxbkVP2SQkdU7cDi60xNqnT876s0xyWX7b35m8v9uL0zp1Vf9phwJKqrOoNK2
         Cfm+zL3EhiRG3biSbBIABRHOKY9NaM8neXpEI7UFcfhKyG9Kz1l6FNoD32IJ9ZzplhCe
         FnF/atk7TtIQ+HEGYCxCoqaVgrURPI8ZL2zG0ckGEupYVDBhCo1reC7utdCnC36Zos8g
         bufbNIkHVlOkDq+r02o1BSxkMjqMxfyRHNJph7sF2GWjNLFFwfTw1oL81qtVaAXhEvaX
         sN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E98zYgOb8svCo31J0cZx6NXuFYRvLAQi1ckb6DzE2jE=;
        b=brSDytHuuz7tUFU+hYNbtXyNhWao+GL6f0y3WH6XScrg4/qFBcDYcnciN/2v7FfDhJ
         f31cf//LlGIXFprzo6ppm5iZUdDUYrmyCQc9EntS5rM2FBrDHNQGYLLyzmTG22Rp5XEz
         WbhnRC/z5As9mGzhdknL7n6Nm/i0oPAt9WcaQYKeYQyQJvLBzK24wFgqxJh+DVhJ/qVX
         WoeI6OKflN9SjOY6T7oF+bDxg+jnQxh9Qh2XopVKSSJ6K2ec9s66vzbNnf34x9W61QjV
         UxX2v2fsWfV1xp64F4rPnLToGbjuy0QTGQUsU98bCgkcIJyuGQuh5LflFj39g8f6Vmsa
         32sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=d6yRBqVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si633215ios.101.2021.05.12.11.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 11:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=d6yRBqVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgtlB-0006qU-T2
	for alex.bennee@linaro.org; Wed, 12 May 2021 14:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWR-000624-J4
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:51 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWO-0005oY-Us
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:51 -0400
Received: by mail-il1-x129.google.com with SMTP id j12so20979109ils.4
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E98zYgOb8svCo31J0cZx6NXuFYRvLAQi1ckb6DzE2jE=;
 b=d6yRBqVmHDZpfjAwNSNtYCIRbKLIxar8oc4mtq32Q3Yr8Zpz6f2tZ4eXl1NUm4mhs+
 yoOkvhYWzLVHOy+UhbfRELjGvisLBo1OmDTBiTM3hninDSVwTWmRKKaLB/qqYGLF/14Q
 AF31oR/4G8/ptJjWGSMsfEwBkseyDA5+yBsrWx9q7jEX8mzA1aPVcezkAtHniZJcuxGK
 +aSQnkCy0gLqU3lBkIlShOR8CYQXcDrf4m2kAIDKg9CiybJG23U9pF78dZbgNLRNeeAw
 TZjXWCd0FU9DyO4UBdlQJ39bfNLGe3Sg7enV0BtZaKYlPDjMFzhe2lDfJfod7bIV+OUO
 6lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E98zYgOb8svCo31J0cZx6NXuFYRvLAQi1ckb6DzE2jE=;
 b=PNTi6q24jsG3EQfycmlPEwuwxUbvkPvjJpcNqixmQSBPuHcoOk4zr4lYXQTDiZQ1rn
 jCIqwqdbMvlu6GMsdqovCO6/DO6HhmH+6jIX33+ftefRFGqB+g+wOJuvF71U0MMLRWBd
 ClvYq94RJXOmxHgbd7WORBlsIgufcXQjxmAFxCCws671J8yi+NK9vW4laPjNf8SULFSw
 iKNo/aFbo0yEDgYZ9FPJmtVodi48JtuJ4gEZlzXar9jt0hzkR0zcmp85LRc2eVqaJZiY
 ykqRQ62+4S7YL0VLBVAkeFDSdWtI+EfebVmC2/K694JdVRy6zoMX7PjRqMfMoAau0OhZ
 07wg==
X-Gm-Message-State: AOAM533/0GnYcEafLvepERsDeT8zRdWlmGLdQUs2m+rFNTRgtV+QBfcZ
 G3xh4sddOplggBLPC4fgtiKjmA==
X-Received: by 2002:a92:c8d2:: with SMTP id c18mr32812839ilq.81.1620843827933; 
 Wed, 12 May 2021 11:23:47 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:47 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/3] target/arm: Add support for FEAT_TLBIOS
Date: Wed, 12 May 2021 12:23:36 -0600
Message-Id: <20210512182337.18563-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: deKgpiiLBMC3

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 43 ++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5802798c3069..7986a217acdd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4076,6 +4076,11 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4adb017f81a2..59e9847133a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7198,6 +7198,46 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbios_reginfo[] = {
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8570,6 +8610,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbios, cpu)) {
+        define_arm_cp_regs(cpu, tlbios_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2

