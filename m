Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3428681njb;
        Tue, 10 Dec 2024 08:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYiWSMs9jtOKIwJzrPGDfArlp5nkKNdGwJbUKHVnZjyyvrs28G7XrANh73cnPwJvZy9LoACk5WbXEc2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEMmvvSn4zZ5Ku+QYtVBiw/wISgH49z1qtvs7XHqmliKhKogl4y/Viw7UykvYupG1O1fDaP
X-Received: by 2002:ad4:4eaa:0:b0:6d8:9215:f462 with SMTP id 6a1803df08f44-6d91e396be1mr81825686d6.22.1733846893786;
        Tue, 10 Dec 2024 08:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733846893; cv=none;
        d=google.com; s=arc-20240605;
        b=be63viObYf2XS9i6V1sPJ/79PFgG4UVtDTfDWG/Cvsx2uT/YNBnDRsm3rQxXUumdGE
         GPbDmvRCFE51Vbom68O0TV5aHFT5otKgTqLMcFJ07pNc/8NgD27p+LhulGflYwhM5Ec+
         10+tKEtdQGDLYrOGUHqFMV+q+5OLhDfuDeCH8twg7nGC6iy9F4oXRW79pRdgWzyezedW
         FIPMwSzr3xCiapIA2+0MmPVGQFf+vrWsUp6UvWNiUZpK3Z4uZWp/gJAYVD1jiCmyo+dT
         lxwVu/kptry6KCzThkWbUXXlqu7BXwhOlfBRMIHjLplWQjNZPczbepCNp3KEP3zk3UAv
         ZMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LT6KhyB+vUkMBosuHLU40Z3OxzVZoUi/E1K2RrfIH3E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cUzXDjkbVjMIKc+wJd8gxE+6M7S8O+HD4GlmueymjXk8i9ca6765tjRZU5sAe2VM7c
         UmEjdrZn+xvj6nQlJ2i7qLdMlNO/3ii5I43yIUfYzetQ25VuQbL17bRB744zCEzHoQKC
         zaSZdMjD1smSaQgOHsuH9h0QgwJoMhcvQZhASOn2gympayy8ZEBCD+fqfVsnnVQku0lq
         2YHObj01RvJu4GkL7GUqfIV9GpV1201k0Cr6QDArboaaEbRwh1i2sASS4Bq1jP5rJ54E
         tCKx5PgV1ovWzE8PSi4b9S8Q3PuwE8YIm3T5PWMjqoLo9KzZHZNeb07uNexaeyy4cD64
         oweQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6jsCV+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afee1911a4si1260797137.388.2024.12.10.08.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:08:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6jsCV+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2kD-0001bO-HU; Tue, 10 Dec 2024 11:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2k1-0001KJ-KV
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2jz-0004dZ-Ot
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434e9716feaso20306405e9.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733846738; x=1734451538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LT6KhyB+vUkMBosuHLU40Z3OxzVZoUi/E1K2RrfIH3E=;
 b=e6jsCV+V9lto265T1/jHwQi+Eqara2nkWKnT8P8YBAV0uqKLo+2Walb7yl7jAHES7S
 uq8+lxLeQaLskCGaLHMm+rU6Hz/4WWtNxnRV+k1KoQTq5Ng6AeXfLFueYfY5u4Xy84tq
 aroR/EVC0L+IQJuWg9baA5ldyTZfhMJ6UhulnZcFUmfa7U6GlIIRCYATzXTXodT1IseA
 9pOn9W5phHQKjjKBGwS1CfFxWM1GuitJvwT6Mj6+tH3jv9/tsfzIBjSoVSucH3qI7Vn+
 l+rOHkYXIQcZCaO5AbDvYVFdWlKCr5YZJKSjZorRZlqhPLRK6ezAE2TLGpfAWYL6r6tZ
 ofWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733846738; x=1734451538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LT6KhyB+vUkMBosuHLU40Z3OxzVZoUi/E1K2RrfIH3E=;
 b=KIxGb73SCK5SiqSqBhJq75aH5h9fs0Zh3XtbJ4PtaK4BLkg8t17o5kG1Fti9gkt0xZ
 RES9cLfQD+t+VCrAJcEKhQFtF/WWX5LbcQt4DVllBCFJkNnoCUD1FZsGS+5cE7xUEeGu
 0iPJ06bsECCSFsFIHVyF5aP12mCPYx64zlqe2SkHyhLPXBv7X88CskARLe9Cfcwk1aiX
 KHSIHvblgTIt7xB0yjejkIHpEvCc0VeS0gKJJdWqoU0SKXRRNxyZfd5DJCFlV0pUpmMt
 2sKQ4Nsxy2m6d8XD8IwOT2zZXh9qGfZGKqho69qm9l9cTKp1TaO4uXkdYEJh3WTwnwJS
 wuDg==
X-Gm-Message-State: AOJu0YzU83nTUT+wlS07Kzu3pzN7HyY+oi57RxmjaVPydWPtOYIfILwA
 iSSNwZA1PtZLf7a0YK+3ezdW/04uMaYTIhERwSZhBVeMw7E5nMSyZLRONTdgEFoSoYQPOwdaOeZ
 P
X-Gm-Gg: ASbGncvYYfht7XFNOEs++jXkPLyzeXpd3uuUFXMm1NwwAHEJumqY/EUI792LzPaHL0D
 6kog20UKeQQTxq/LHqVvlZG3h4nnGzNrw+C9mb3VSCbJQEBtJsyib0MgTqHnPjL3b7bQ42DWnQH
 Lsj6UF1OlwITO2MxO4Ivs27bZZhva/OpAn7GDz8LvFCgwU4jEK693C+jHe40IBWZs5d46kULqBj
 v8aouNudEOupvrYGOYycY20uuNHxh48wHvh4Qx/brnEkMMjjrWdKDrWgfZF
X-Received: by 2002:a05:600c:5799:b0:434:a4b3:5ebe with SMTP id
 5b1f17b1804b1-434dded7708mr131954605e9.24.1733846737326; 
 Tue, 10 Dec 2024 08:05:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434e8ec8072sm124671605e9.18.2024.12.10.08.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:05:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/10] target/arm: Move RME TLB insns to tlb-insns.c
Date: Tue, 10 Dec 2024 16:04:51 +0000
Message-Id: <20241210160452.2427965-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210160452.2427965-1-peter.maydell@linaro.org>
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: VxQNYc/g7HOb

Move the FEAT_RME specific TLB insns across to tlb-insns.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c        | 38 --------------------------------
 target/arm/tcg/tlb-insns.c | 45 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd9f8650316..910ae62c476 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6525,14 +6525,6 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-static void tlbi_aa64_paall_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                  uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-
-    tlb_flush(cs);
-}
-
 static void gpccr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -6550,14 +6542,6 @@ static void gpccr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
                                      env_archcpu(env)->reset_l0gptsz);
 }
 
-static void tlbi_aa64_paallos_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                    uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-
-    tlb_flush_all_cpus_synced(cs);
-}
-
 static const ARMCPRegInfo rme_reginfo[] = {
     { .name = "GPCCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 6,
@@ -6569,28 +6553,6 @@ static const ARMCPRegInfo rme_reginfo[] = {
     { .name = "MFAR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 0, .opc2 = 5,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mfar_el3) },
-    { .name = "TLBI_PAALL", .state = ARM_CP_STATE_AA64,
-      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 4,
-      .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_paall_write },
-    { .name = "TLBI_PAALLOS", .state = ARM_CP_STATE_AA64,
-      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 4,
-      .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_paallos_write },
-    /*
-     * QEMU does not have a way to invalidate by physical address, thus
-     * invalidating a range of physical addresses is accomplished by
-     * flushing all tlb entries in the outer shareable domain,
-     * just like PAALLOS.
-     */
-    { .name = "TLBI_RPALOS", .state = ARM_CP_STATE_AA64,
-      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 7,
-      .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_paallos_write },
-    { .name = "TLBI_RPAOS", .state = ARM_CP_STATE_AA64,
-      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 3,
-      .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_paallos_write },
     { .name = "DC_CIPAPA", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NOP },
diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 51b4756e31e..d20d32624da 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -1181,6 +1181,48 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae3is_write },
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
+static void tlbi_aa64_paallos_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush_all_cpus_synced(cs);
+}
+
+static const ARMCPRegInfo tlbi_rme_reginfo[] = {
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
+     * flushing all tlb entries in the outer shareable domain,
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
+};
+
 #endif
 
 void define_tlb_insn_regs(ARMCPU *cpu)
@@ -1219,5 +1261,8 @@ void define_tlb_insn_regs(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbios, cpu)) {
         define_arm_cp_regs(cpu, tlbios_reginfo);
     }
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        define_arm_cp_regs(cpu, tlbi_rme_reginfo);
+    }
 #endif
 }
-- 
2.34.1

