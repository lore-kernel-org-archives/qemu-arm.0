Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp627424ejx;
        Wed, 16 Nov 2022 09:48:19 -0800 (PST)
X-Received: by 2002:a5d:630d:0:b0:236:57e8:c79a with SMTP id i13-20020a5d630d000000b0023657e8c79amr15258723wru.321.1668620899417;
        Wed, 16 Nov 2022 09:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668620899; cv=none;
        d=google.com; s=arc-20160816;
        b=uD8rUzfuWjY7CrxK2e/IkmD/MdrtP6rHIOMDHBPeDXoHJtLIdEprVAnwJUGVk7GK4+
         O1WTzHs0xWRNdnn2bf5SP4ZXQGZ0Nt2eCOtQD2ACphTt9CD9Ye+zFixXBGWcf2ykvjhz
         Twi20OzoGP2GDFTVJChL4DSNUHPq7oZZsPMR4Z8qV4rS6JvOO22A5VHFzIM8JON01FMa
         UPZW3pbuXJAM7mrZaMfvthU/gSKfFC7+BQAZkEq3QfQLplvdm/LNALoBm9qSVujdMJPE
         fGK6EjrO3DyxPCNAmT8HPDvo4LsSbzbfunUX+5iboTzQ8QHqoF1wIiiJmK/yyUrcVgoV
         YW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KrvwPOtZNfEKsXjuC0ZbgXfL4yPk3ZZbpxNJSMb/UOA=;
        b=FFciv9HPOeb53KsvkOHaqOEPz9SmBHgtHp5yrWDx+wMYd4ssKexq3r8xgWAJ74Ooxa
         2o13nXUXQUHv+VtnJ0rzNIU0YQQ68frKcEtyPEKhN0FfMwOxCtb92V17IVcGp5dwqmQX
         OSa42/6ePRm/SBoss5/3utordKvOB5sKSJZWP+QlHJBDsAaySNYkFFyDwoqOY/8Bn7vO
         aMVDvGNpuvli8Wg67CnSZruLhOVPyces17a3Eeo+8zYa9xftgGLCFWAq9Q9S0HncVkwI
         3ksLT6AJ6+lKJCk2rmMk7bkFxrfAvty9Qnht1r3UWTx+lWjhMtLty/XtnInqZKsCz2OY
         s2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="kv5/q0iz";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja5-20020a05600c556500b003cf4e05544dsor390220wmb.17.2022.11.16.09.48.19
        (Google Transport Security);
        Wed, 16 Nov 2022 09:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="kv5/q0iz";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrvwPOtZNfEKsXjuC0ZbgXfL4yPk3ZZbpxNJSMb/UOA=;
        b=kv5/q0izde86fUAHLrYnS/iqNpfCZR5yIllPFKLWllH/3jTLFYKnSVqvENoNgR+rgT
         PZowt2UvPJkFgTgr8hZMVAfVBCp0QhejBqscpDb5NiROzyhFdVkw4+I/N8ddB38VaZtl
         Yl3nFT8mxdorI5rCSQIJvZ0vsSpqKNqOL0R10WyDTHsNGEoKyuevGtDvfgs3DMFqSwoD
         ck59Qxyzcg3mmEdgQMyn3WDV0dekpu/ZpRhYBe01apNx19o07xC4S1RqkC64S1HZK1Ly
         D/ecKc8ZsrpH8q7plDDj+1/EyPk6cQD98oESeUWHUpFpXJwoJzoQQR0tj7SbKFtCSXgz
         dj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrvwPOtZNfEKsXjuC0ZbgXfL4yPk3ZZbpxNJSMb/UOA=;
        b=7l5KvWIzlB8pXiPcsdmzCha8bw4SEQ3xlaadMfm16uYCP0S3s5QjgrtcVFjY2S6WTZ
         T2/wNrZ5FiNuSCZYTBCX/crEpofIlaH2AUdAx/W9ONamwZOiZ4e/vekwDp45BGQEpGC7
         sNErQZQmP5J1nDB6e/oKvWGaZzmpJbLzjm85kJf0MPFdr+Znzp1V11jZZsL8dbxxJWrV
         lV8dCHUC4B3Gfiz5nOy5x11XCWFYN0rGp5EWFicfXC0PHJMpuFMDTa/tNwGhIzoKYjaT
         88qXlDrkbQlhzAFxNoTt05ty8ItKDqCLCzUIidqyaTi+VmTuCC9OVFTTZQMWjjBe+13v
         qiDQ==
X-Gm-Message-State: ANoB5pl51nQvA1tOwpjylQw/akgwhLUUJ5EWau7obmTkULDzydHaGvGO
	Rro18lGQUyEbl4cvczdClY4=
X-Google-Smtp-Source: AA0mqf6wdc3n0wBAT6sQF53c/7LvqiuSfO5xEgRE5OdT/HVAIB6I/w/aMLJ+tDVBV0+683DzVBMb6Q==
X-Received: by 2002:a05:600c:3d1b:b0:3cf:670e:63cc with SMTP id bh27-20020a05600c3d1b00b003cf670e63ccmr2975784wmb.150.1668620899089;
        Wed, 16 Nov 2022 09:48:19 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from localhost.localdomain (229.19.205.77.rev.sfr.net. [77.205.19.229])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c465100b003cf483ee8e0sm2477490wmo.24.2022.11.16.09.48.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Nov 2022 09:48:18 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v2 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
Date: Wed, 16 Nov 2022 18:47:49 +0100
Message-Id: <20221116174749.65175-4-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116174749.65175-1-fcagnin@quarkslab.com>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 12RdLKzdeVLm

From: Francesco Cagnin <fcagnin@quarkslab.com>

This proved to be required when debugging the Linux kernel's initial
code, as the Hypervisor framework was triggering 'EC_SYSTEMREGISTERTRAP'
VM exits after enabling trap exceptions with
'hv_vcpu_set_trap_debug_exceptions()'.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hvf/hvf.c | 140 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 66fc82e9b9..c28c3dbdaa 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -95,6 +95,71 @@ static void hvf_arm_init_debug(CPUState *cpu)
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_MDSCR_EL1      SYSREG(2, 0, 0, 2, 2)
+#define SYSREG_DBGBVR0_EL1    SYSREG(2, 0, 0, 0, 4)
+#define SYSREG_DBGBCR0_EL1    SYSREG(2, 0, 0, 0, 5)
+#define SYSREG_DBGWVR0_EL1    SYSREG(2, 0, 0, 0, 6)
+#define SYSREG_DBGWCR0_EL1    SYSREG(2, 0, 0, 0, 7)
+#define SYSREG_DBGBVR1_EL1    SYSREG(2, 0, 0, 1, 4)
+#define SYSREG_DBGBCR1_EL1    SYSREG(2, 0, 0, 1, 5)
+#define SYSREG_DBGWVR1_EL1    SYSREG(2, 0, 0, 1, 6)
+#define SYSREG_DBGWCR1_EL1    SYSREG(2, 0, 0, 1, 7)
+#define SYSREG_DBGBVR2_EL1    SYSREG(2, 0, 0, 2, 4)
+#define SYSREG_DBGBCR2_EL1    SYSREG(2, 0, 0, 2, 5)
+#define SYSREG_DBGWVR2_EL1    SYSREG(2, 0, 0, 2, 6)
+#define SYSREG_DBGWCR2_EL1    SYSREG(2, 0, 0, 2, 7)
+#define SYSREG_DBGBVR3_EL1    SYSREG(2, 0, 0, 3, 4)
+#define SYSREG_DBGBCR3_EL1    SYSREG(2, 0, 0, 3, 5)
+#define SYSREG_DBGWVR3_EL1    SYSREG(2, 0, 0, 3, 6)
+#define SYSREG_DBGWCR3_EL1    SYSREG(2, 0, 0, 3, 7)
+#define SYSREG_DBGBVR4_EL1    SYSREG(2, 0, 0, 4, 4)
+#define SYSREG_DBGBCR4_EL1    SYSREG(2, 0, 0, 4, 5)
+#define SYSREG_DBGWVR4_EL1    SYSREG(2, 0, 0, 4, 6)
+#define SYSREG_DBGWCR4_EL1    SYSREG(2, 0, 0, 4, 7)
+#define SYSREG_DBGBVR5_EL1    SYSREG(2, 0, 0, 5, 4)
+#define SYSREG_DBGBCR5_EL1    SYSREG(2, 0, 0, 5, 5)
+#define SYSREG_DBGWVR5_EL1    SYSREG(2, 0, 0, 5, 6)
+#define SYSREG_DBGWCR5_EL1    SYSREG(2, 0, 0, 5, 7)
+#define SYSREG_DBGBVR6_EL1    SYSREG(2, 0, 0, 6, 4)
+#define SYSREG_DBGBCR6_EL1    SYSREG(2, 0, 0, 6, 5)
+#define SYSREG_DBGWVR6_EL1    SYSREG(2, 0, 0, 6, 6)
+#define SYSREG_DBGWCR6_EL1    SYSREG(2, 0, 0, 6, 7)
+#define SYSREG_DBGBVR7_EL1    SYSREG(2, 0, 0, 7, 4)
+#define SYSREG_DBGBCR7_EL1    SYSREG(2, 0, 0, 7, 5)
+#define SYSREG_DBGWVR7_EL1    SYSREG(2, 0, 0, 7, 6)
+#define SYSREG_DBGWCR7_EL1    SYSREG(2, 0, 0, 7, 7)
+#define SYSREG_DBGBVR8_EL1    SYSREG(2, 0, 0, 8, 4)
+#define SYSREG_DBGBCR8_EL1    SYSREG(2, 0, 0, 8, 5)
+#define SYSREG_DBGWVR8_EL1    SYSREG(2, 0, 0, 8, 6)
+#define SYSREG_DBGWCR8_EL1    SYSREG(2, 0, 0, 8, 7)
+#define SYSREG_DBGBVR9_EL1    SYSREG(2, 0, 0, 9, 4)
+#define SYSREG_DBGBCR9_EL1    SYSREG(2, 0, 0, 9, 5)
+#define SYSREG_DBGWVR9_EL1    SYSREG(2, 0, 0, 9, 6)
+#define SYSREG_DBGWCR9_EL1    SYSREG(2, 0, 0, 9, 7)
+#define SYSREG_DBGBVR10_EL1   SYSREG(2, 0, 0, 10, 4)
+#define SYSREG_DBGBCR10_EL1   SYSREG(2, 0, 0, 10, 5)
+#define SYSREG_DBGWVR10_EL1   SYSREG(2, 0, 0, 10, 6)
+#define SYSREG_DBGWCR10_EL1   SYSREG(2, 0, 0, 10, 7)
+#define SYSREG_DBGBVR11_EL1   SYSREG(2, 0, 0, 11, 4)
+#define SYSREG_DBGBCR11_EL1   SYSREG(2, 0, 0, 11, 5)
+#define SYSREG_DBGWVR11_EL1   SYSREG(2, 0, 0, 11, 6)
+#define SYSREG_DBGWCR11_EL1   SYSREG(2, 0, 0, 11, 7)
+#define SYSREG_DBGBVR12_EL1   SYSREG(2, 0, 0, 12, 4)
+#define SYSREG_DBGBCR12_EL1   SYSREG(2, 0, 0, 12, 5)
+#define SYSREG_DBGWVR12_EL1   SYSREG(2, 0, 0, 12, 6)
+#define SYSREG_DBGWCR12_EL1   SYSREG(2, 0, 0, 12, 7)
+#define SYSREG_DBGBVR13_EL1   SYSREG(2, 0, 0, 13, 4)
+#define SYSREG_DBGBCR13_EL1   SYSREG(2, 0, 0, 13, 5)
+#define SYSREG_DBGWVR13_EL1   SYSREG(2, 0, 0, 13, 6)
+#define SYSREG_DBGWCR13_EL1   SYSREG(2, 0, 0, 13, 7)
+#define SYSREG_DBGBVR14_EL1   SYSREG(2, 0, 0, 14, 4)
+#define SYSREG_DBGBCR14_EL1   SYSREG(2, 0, 0, 14, 5)
+#define SYSREG_DBGWVR14_EL1   SYSREG(2, 0, 0, 14, 6)
+#define SYSREG_DBGWCR14_EL1   SYSREG(2, 0, 0, 14, 7)
+#define SYSREG_DBGBVR15_EL1   SYSREG(2, 0, 0, 15, 4)
+#define SYSREG_DBGBCR15_EL1   SYSREG(2, 0, 0, 15, 5)
+#define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
+#define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -1039,6 +1104,81 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_MDSCR_EL1:
+        env->cp15.mdscr_el1 = val;
+        break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        env->cp15.dbgbvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        env->cp15.dbgbcr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        env->cp15.dbgwvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        env->cp15.dbgwcr[SYSREG_CRM(reg)] = val;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
-- 
2.38.1
