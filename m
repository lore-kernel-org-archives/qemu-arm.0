Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087638lfc;
        Thu, 12 Mar 2020 12:42:48 -0700 (PDT)
X-Received: by 2002:a63:5c18:: with SMTP id q24mr9583026pgb.322.1584042168692;
        Thu, 12 Mar 2020 12:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042168; cv=none;
        d=google.com; s=arc-20160816;
        b=iza3jTmtif5ujDI9UZ/5HwkB5VVe+1LpKSz92VcDthhOjkExVWVvPbYcdh2cZluGMK
         pr9UQvKiqQODpf6RSvCBS2hVLMr9pgqe/NtoWW4t80Czeo5XV4j6p3kN7u0x3Ki3QaLp
         hyLtUj+p9MLv9zwZg9N/i7TEKsUOVey8w9FixpTlQS732f3kgcLW/8LaxZ/+nzjwRFi+
         dSV/34t9qvHk+mAv1NTytrLQNpyhLwygtWFWk/dz7bh0W/nnEMaXbrCDTYnJYI+hMjr9
         ZUKiSETjyAd9kky13TySBNouwdF6RRFphFH5VfJdIMte73PsTdb3ApbRyoNrxbIN1OHg
         bapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YjtJPrBKwGIvW5n3TsllLnWEtrw5AerlDizUV5C1Mio=;
        b=qCp2X4oRv/1OpblkxrIBmSq0P9vNPEdJ5rcIkzA9Mf4lBotEd2TULmugLDtsxnjFGR
         bVUJU/paduSWUHzMgZMrHb7bnvxur/HziawcNUMQ1WO/zYbkTQzGi+ozevRswSMayVTT
         rJ4RcrE1NAQfvBpBn9u2Kb7UyfxYoq94UetOl78UEF8735SmWSQBeB1L68PCXz7uyXX3
         RUSQ7GUBHLppLn/Pi4GIwC/ws00P9Ih87pWizL8vj4FL5525AMq3ps0sJDVQfXZwo+QU
         hIwbuQoxx94ONLR0lg3EYA/11wZCTi03lg4pa8+aES/p1o+q+6PPx4v8DPaiuf18IcxC
         oECg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m4FT5zQa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a2sor1271772pjo.0.2020.03.12.12.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m4FT5zQa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YjtJPrBKwGIvW5n3TsllLnWEtrw5AerlDizUV5C1Mio=;
        b=m4FT5zQa3+2PDG4aTJr/jboc8d20BX16tFdynHRW64k3e+NcDanVhWydFLIHECq4r3
         6zL55z1NS+6MDbP0DC4Epz6NJn9poq8ZFF2JsKNq5PcVR3jimQPVtm+0tHGOlvHzEMYN
         gbGSJacz4VvS4f+9oXIIu5N4O/tjqyAf/Wh0ouYFhp43o28itwkUMJcWx6GhCe4A3iDe
         +0yZJ919GGm6N8WnrgYg5ubcM0osfsvG4AtXLLT5Z23xPoJwvUOuSxzfsiCZNmSPAQid
         eEjzq+ev9H5iZZZ49DHt+TbJDkqoYqXY3KmYm9vbRl+3Wsz6ZWbi5rVbttRPkJT8Lbjg
         lwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YjtJPrBKwGIvW5n3TsllLnWEtrw5AerlDizUV5C1Mio=;
        b=gD1vxLqyMeetuVm4aXXVoYMbGqLJWky5qGyQDJ5kIGmEJC7r1mz5frQlJnIpsXOTW9
         17toWJsUaxAgW+/QDfX00WYa6AGde669o2ktBMWvZK+tls3eGQIpdWRStAM2CETwHKAt
         5QFOAop5YamKvIs6XTqYFACpbT0y3KetxVh0uuU7daPVciVpdaDai4/NVkU9IkyLvNYE
         jwmhmnif1XOmn3U+K069YMvvQQQto2XqUkGfL9OEepMjxuPRIFMvs152kn44uqqfAhCR
         A+dHw4802ecEL/tRp+1eSWJGguGy9R7KPVGRJYGOtzOg6inM0rr/2BgoimLsEXbcM6E1
         o32g==
X-Gm-Message-State: ANhLgQ3DyxpBYHgfhDcKU18BIPlr3oZK1XXA+qp7c1jC4nQzLC5obwcg
	QehLiq3v3X6S1mqdbe4+uKqm+KrI
X-Google-Smtp-Source: ADFU+vvi+YFkyWTEp07dU9Wrw07CRP+KH+fQFpTxhNofPmPZMFVaipfPsihnsLBqHZlagtau/52AJQ==
X-Received: by 2002:a17:902:9a06:: with SMTP id v6mr9797215plp.304.1584042168194;
        Thu, 12 Mar 2020 12:42:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 20/42] target/arm: Implement the access tag cache flushes
Date: Thu, 12 Mar 2020 12:41:57 -0700
Message-Id: <20200312194219.24406-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r+HviCx/h3h+

Like the regular data cache flushes, these are nops within qemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Split out and handle el0 cache ops properly.
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01d2fcf2e3..f9daeec1f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6914,6 +6914,32 @@ static const ARMCPRegInfo mte_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_NO_RAW,
       .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    { .name = "DC_IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     REGINFO_SENTINEL
 };
 
@@ -6923,6 +6949,43 @@ static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
       .type = ARM_CP_CONST, .access = PL0_RW, },
     REGINFO_SENTINEL
 };
+
+static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
+    { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    REGINFO_SENTINEL
+};
+
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -8048,8 +8111,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (cpu_isar_feature(aa64_mte, cpu)) {
         define_arm_cp_regs(cpu, mte_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
 #endif
 
-- 
2.20.1
