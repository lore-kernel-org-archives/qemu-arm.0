Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2199723lfp;
        Fri, 14 Feb 2020 09:52:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1xyjR9znV9qpmc0gVjKeUgu5ZtYv5bTI8OLsmFPGLLSSdUHtt16OHJSUZ/3ORpuLm9Vzw
X-Received: by 2002:a37:c49:: with SMTP id 70mr3827802qkm.12.1581702737685;
        Fri, 14 Feb 2020 09:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702737; cv=none;
        d=google.com; s=arc-20160816;
        b=pmMMiYvvdow2uNWb6eFTjzEjHENDTB/Id5gd20/A0fpb9LHUaoiJkruVC8/rl4BDd3
         S1vQd4Z6eINyNjh9b43SvW9fVL16jFjRvCUA7gRj53Us8zMWDpXeg6ZaTGjNl1ddfJxb
         p0PqukgfHKMIj6LgjHs6Z8ENVEK0PGiDP6cSjOhjR6JwHlF4vVyMZgLExFwlkUJch+ll
         5pMguWyNuzfr5GrX+W4nSL2CELMs3qnN+M4iLej7qe7VBlL0ADtuTEBMCkZgLzA37LOi
         WIynt8KPdOgsXgvw2GBikhR2vxrrCJ7dd73TVW/1Ah7YdRTWBpCns7NxkUN+gbfV68yc
         ACIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8vZsaT2+tk9YLi++unYB+Z+jW0b/JEinNqFa1FTVjNg=;
        b=PEZ+XXWglw+BPWokbiOgOq7j+nq0U+/d6z4prqPvHu4JBz3SA5kDv6+wFcbFQ5kKMC
         oLPtWgyaTWS8yWowxMDJ5/CzN/7LFp13cfhqJQqbCWi5niRuC2fLYfN6P/uaRY9hZGHu
         2Z5t1gUskuSCexfPFZeYMltH5af8yVSqSqEFWYV6dv+FonzwVL9MdNLq1+aV+9RSCcz/
         2kDYyVwSFx8JmTOHxHoyxlvLZbzgaD8XU1IiN6tUVgbP3G95i1co6/LQT7bb11Q92tXX
         PGb8DTrKrXrqzJSH705EFlcxwgQNJADAOOj/TgHlDAkghu+ntLYc+bakNiGmsAQpbbQ0
         7Kbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wsh2MgwV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si3275318qkl.381.2020.02.14.09.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:52:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wsh2MgwV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2f8T-00079l-36
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7n-0005w7-QA
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7l-0000nU-CK
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:35 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7l-0000m6-4M
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:33 -0500
Received: by mail-wr1-x442.google.com with SMTP id k11so11876042wrd.9
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vZsaT2+tk9YLi++unYB+Z+jW0b/JEinNqFa1FTVjNg=;
 b=Wsh2MgwVg3QN3APiAcgnIcN5PpHA4mrawspkWx3oP8RMnEH8yxw9cQzSkdWF1syp7W
 rr4lpoZYYXATfKVwwUv+2wPjF3IojpHixzeTjkSTziWHM/SdtC8Wrk30trA7IA2BJ+O3
 gXyvMsYTSrpt2XNGotUpqCpLVW2oZuWfzi/UHH2j+6OkFS+hODXJLJ0hEfDj0jf3qAja
 h5zDJBWuy1ULhGg18Td5phzH0jrHJZvr7V10QoEZL/DccAU7l6+/hUNirA9nxEzoBaHE
 u/TrJt/jXKC8miXkI68Vr3xIpgL3yQbGp4itS4bkbXqGDAsmXW/w4a57eFtLYM19Ngwf
 vtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vZsaT2+tk9YLi++unYB+Z+jW0b/JEinNqFa1FTVjNg=;
 b=FEFNhph6tX0UkU2CDt8jtJzvEzmWHU18XFF5tL+x99GB4aK+TmwyMVQXePuAu6DjTL
 m3vTETz1SxOWVtl3obp/bALfLiAPXc+yxhseCKU4ofiX9/gjwRuDvmRaW2uAPWG24v8N
 sCx1/cisWYt5LlSA0rPQphNfSpWK4EbVwrIb1e+N4yzj4El3hWnr6r5hTivh7kDCwYtl
 oGI2xS3vuJTJ8g1nR9EuD6Pst3pzHMSKMWbx+B+11RjbdnqbsrHLLw4gLKLyvKzURKy+
 WDVj2v6skyKwhGCgmCaD9gAAo6z8cuLXZnHh42nLXu/d3BDNHj0o8QUJy68xrO9vHJKf
 +qlg==
X-Gm-Message-State: APjAAAUAiJUPNlc4pgLOwKJr5JHnMVwtbvfbtcVz/cBwYi6pnT/UfRVY
 qBtg6t8ytYm2Xcym0pnCLMjZVZYLFWc=
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr5253518wrn.185.1581702691276; 
 Fri, 14 Feb 2020 09:51:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/21] target/arm: Define an aa32_pmu_8_1 isar feature test
 function
Date: Fri, 14 Feb 2020 17:51:03 +0000
Message-Id: <20200214175116.9164-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zesk4FG3F5Az

Instead of open-coding a check on the ID_DFR0 PerfMon ID register
field, create a standardly-named isar_feature for "does AArch32 have
a v8.1 PMUv3" and use it.

This entails moving the id_dfr0 field into the ARMISARegisters struct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  9 ++++++++-
 hw/intc/armv7m_nvic.c |  2 +-
 target/arm/cpu.c      | 28 ++++++++++++++--------------
 target/arm/cpu64.c    |  6 +++---
 target/arm/helper.c   |  5 ++---
 5 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 081955094dc..6c6088eb587 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -865,6 +865,7 @@ struct ARMCPU {
         uint32_t mvfr0;
         uint32_t mvfr1;
         uint32_t mvfr2;
+        uint32_t id_dfr0;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
         uint64_t id_aa64pfr0;
@@ -880,7 +881,6 @@ struct ARMCPU {
     uint32_t reset_sctlr;
     uint32_t id_pfr0;
     uint32_t id_pfr1;
-    uint32_t id_dfr0;
     uint64_t pmceid0;
     uint64_t pmceid1;
     uint32_t id_afr0;
@@ -3500,6 +3500,13 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
     return FIELD_EX64(id->mvfr0, ID_MMFR3, PAN) >= 2;
 }
 
+static inline bool isar_feature_aa32_pmu_8_1(const ARMISARegisters *id)
+{
+    /* 0xf means "non-standard IMPDEF PMU" */
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
+        FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index f9e0eeaace6..5a403fc9704 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1227,7 +1227,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     case 0xd44: /* PFR1.  */
         return cpu->id_pfr1;
     case 0xd48: /* DFR0.  */
-        return cpu->id_dfr0;
+        return cpu->isar.id_dfr0;
     case 0xd4c: /* AFR0.  */
         return cpu->id_afr0;
     case 0xd50: /* MMFR0.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1024f506c51..b85040d36bc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1719,7 +1719,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
     } else {
         cpu->id_aa64dfr0 = FIELD_DP64(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
-        cpu->id_dfr0 = FIELD_DP32(cpu->id_dfr0, ID_DFR0, PERFMON, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
     }
@@ -1957,7 +1957,7 @@ static void arm1136_r2_initfn(Object *obj)
     cpu->reset_sctlr = 0x00050078;
     cpu->id_pfr0 = 0x111;
     cpu->id_pfr1 = 0x1;
-    cpu->id_dfr0 = 0x2;
+    cpu->isar.id_dfr0 = 0x2;
     cpu->id_afr0 = 0x3;
     cpu->id_mmfr0 = 0x01130003;
     cpu->id_mmfr1 = 0x10030302;
@@ -1989,7 +1989,7 @@ static void arm1136_initfn(Object *obj)
     cpu->reset_sctlr = 0x00050078;
     cpu->id_pfr0 = 0x111;
     cpu->id_pfr1 = 0x1;
-    cpu->id_dfr0 = 0x2;
+    cpu->isar.id_dfr0 = 0x2;
     cpu->id_afr0 = 0x3;
     cpu->id_mmfr0 = 0x01130003;
     cpu->id_mmfr1 = 0x10030302;
@@ -2022,7 +2022,7 @@ static void arm1176_initfn(Object *obj)
     cpu->reset_sctlr = 0x00050078;
     cpu->id_pfr0 = 0x111;
     cpu->id_pfr1 = 0x11;
-    cpu->id_dfr0 = 0x33;
+    cpu->isar.id_dfr0 = 0x33;
     cpu->id_afr0 = 0;
     cpu->id_mmfr0 = 0x01130003;
     cpu->id_mmfr1 = 0x10030302;
@@ -2052,7 +2052,7 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->ctr = 0x1d192992; /* 32K icache 32K dcache */
     cpu->id_pfr0 = 0x111;
     cpu->id_pfr1 = 0x1;
-    cpu->id_dfr0 = 0;
+    cpu->isar.id_dfr0 = 0;
     cpu->id_afr0 = 0x2;
     cpu->id_mmfr0 = 0x01100103;
     cpu->id_mmfr1 = 0x10020302;
@@ -2084,7 +2084,7 @@ static void cortex_m3_initfn(Object *obj)
     cpu->pmsav7_dregion = 8;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000200;
-    cpu->id_dfr0 = 0x00100000;
+    cpu->isar.id_dfr0 = 0x00100000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x00000030;
     cpu->id_mmfr1 = 0x00000000;
@@ -2115,7 +2115,7 @@ static void cortex_m4_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000000;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000200;
-    cpu->id_dfr0 = 0x00100000;
+    cpu->isar.id_dfr0 = 0x00100000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x00000030;
     cpu->id_mmfr1 = 0x00000000;
@@ -2146,7 +2146,7 @@ static void cortex_m7_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000040;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000200;
-    cpu->id_dfr0 = 0x00100000;
+    cpu->isar.id_dfr0 = 0x00100000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x00100030;
     cpu->id_mmfr1 = 0x00000000;
@@ -2179,7 +2179,7 @@ static void cortex_m33_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000040;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000210;
-    cpu->id_dfr0 = 0x00200000;
+    cpu->isar.id_dfr0 = 0x00200000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x00101F40;
     cpu->id_mmfr1 = 0x00000000;
@@ -2231,7 +2231,7 @@ static void cortex_r5_initfn(Object *obj)
     cpu->midr = 0x411fc153; /* r1p3 */
     cpu->id_pfr0 = 0x0131;
     cpu->id_pfr1 = 0x001;
-    cpu->id_dfr0 = 0x010400;
+    cpu->isar.id_dfr0 = 0x010400;
     cpu->id_afr0 = 0x0;
     cpu->id_mmfr0 = 0x0210030;
     cpu->id_mmfr1 = 0x00000000;
@@ -2286,7 +2286,7 @@ static void cortex_a8_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50078;
     cpu->id_pfr0 = 0x1031;
     cpu->id_pfr1 = 0x11;
-    cpu->id_dfr0 = 0x400;
+    cpu->isar.id_dfr0 = 0x400;
     cpu->id_afr0 = 0;
     cpu->id_mmfr0 = 0x31100003;
     cpu->id_mmfr1 = 0x20000000;
@@ -2359,7 +2359,7 @@ static void cortex_a9_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50078;
     cpu->id_pfr0 = 0x1031;
     cpu->id_pfr1 = 0x11;
-    cpu->id_dfr0 = 0x000;
+    cpu->isar.id_dfr0 = 0x000;
     cpu->id_afr0 = 0;
     cpu->id_mmfr0 = 0x00100103;
     cpu->id_mmfr1 = 0x20000000;
@@ -2424,7 +2424,7 @@ static void cortex_a7_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50078;
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
-    cpu->id_dfr0 = 0x02010555;
+    cpu->isar.id_dfr0 = 0x02010555;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -2470,7 +2470,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50078;
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
-    cpu->id_dfr0 = 0x02010555;
+    cpu->isar.id_dfr0 = 0x02010555;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
     cpu->id_mmfr1 = 0x20000000;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0d98bc79d1..9e4387158f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -121,7 +121,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50838;
     cpu->id_pfr0 = 0x00000131;
     cpu->id_pfr1 = 0x00011011;
-    cpu->id_dfr0 = 0x03010066;
+    cpu->isar.id_dfr0 = 0x03010066;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -175,7 +175,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50838;
     cpu->id_pfr0 = 0x00000131;
     cpu->id_pfr1 = 0x00011011;
-    cpu->id_dfr0 = 0x03010066;
+    cpu->isar.id_dfr0 = 0x03010066;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -228,7 +228,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->reset_sctlr = 0x00c50838;
     cpu->id_pfr0 = 0x00000131;
     cpu->id_pfr1 = 0x00011011;
-    cpu->id_dfr0 = 0x03010066;
+    cpu->isar.id_dfr0 = 0x03010066;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
     cpu->id_mmfr1 = 0x40000000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 376c6412f91..048e541eda4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6381,8 +6381,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         g_free(pmevtyper_name);
         g_free(pmevtyper_el0_name);
     }
-    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
-            FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
+    if (cpu_isar_feature(aa32_pmu_8_1, cpu)) {
         ARMCPRegInfo v81_pmu_regs[] = {
             { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
@@ -6856,7 +6855,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->id_dfr0 },
+              .resetvalue = cpu->isar.id_dfr0 },
             { .name = "ID_AFR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.20.1

