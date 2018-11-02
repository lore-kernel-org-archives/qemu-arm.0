Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2126882wro;
        Fri, 2 Nov 2018 06:42:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d5976OQ67RdDVmRjb91kGEEYB7h4q3zRgKoHGBPcGKEpV/JzEmRzGycxbxUma6ecZFKFQC
X-Received: by 2002:a0c:d002:: with SMTP id u2mr10759260qvg.92.1541166125817;
        Fri, 02 Nov 2018 06:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541166125; cv=none;
        d=google.com; s=arc-20160816;
        b=k3rNZWMKeS6eQSqdtlqdfoVBCQ/OgkHq9v6c3bdSzlhqP7tpoTpEXVnBcsIrGBEDh1
         TRzttX6oqNSUTOr5smsFNKoZZrEJT3Y0dqSFsPayvlQAS1KDqGVRm7VTn16Z8LeQOFN5
         KXxMcZP8LFce+lH+rjr3TDF22qC4J28HynZV2hBz8ZYS16KCSfQNN5GyHDuWvt1CwwqR
         yNdUAMd0NQO+nqK4QYNA5eMbmfQkdg/rMLycQfImBU52TYafTTz5LEY47VzKYhk3IwzO
         FayOu7CMLDK6F+oKYGtjAjibl2+Zty4NruufW3UAwQq5j9+qkR4yqc5p/U+TwyJw+afq
         kMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0ayiDrZA6aBx9vXHSLgIhm6gNKthLw1VR2qSOn73m80=;
        b=HH6ZFyZ3O1zFOTa8sVlmByzhQyO6a8DwAhQqjDk1oVqJoCJKOp/u9nF8UqLZOPVAK9
         LXT9fYjVWxdsXM42Z0WPfw4qNQviPFbV+OuyRWJsxGg9n77uwd99+iFbss23ixItnhCK
         w96/p5rAwb7tVEpxVlp/BEVUWqyH9HzDHfntGdHEpmQRDn9VVAxVvlQcKal5QqMEyVCE
         EcUGkWlGCu2/hpymLlbwiCahqoGk62FwKqwEKmdN2ZylIa2hgDSq3zKzYZ4L2eA77wgA
         Ub8YwgjB+cifsipuxnt85G6fmVc6cIhTHQ+ZkmhvbF3yM1tx6Q6Ms0w5ZwP7/x3OuUrk
         Aecw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sr4DFBbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u31-v6si698644qtu.230.2018.11.02.06.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sr4DFBbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZi9-0007HG-9T
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhq-0007Dl-RM
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhp-0007Qb-9K
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIZhn-0007Af-Bn
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:44 -0400
Received: by mail-wm1-x343.google.com with SMTP id q12-v6so1960553wmq.0
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ayiDrZA6aBx9vXHSLgIhm6gNKthLw1VR2qSOn73m80=;
	b=Sr4DFBboDyhfkgw/eWEOqIaRXSF7I6GXBbRxpCYTIRKz+GXe715CeKlmSJ11MjVscG
	vuSrCWMv+6KiJ2aICRfMPTXw1RcjlwxI8jHBJF9+h51wJYPGnLxaJQveapazqIe04ERB
	V3aVj7jQQA98ldur7YiZT041ETGACkZDeMqQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ayiDrZA6aBx9vXHSLgIhm6gNKthLw1VR2qSOn73m80=;
	b=JPA/P+AA5WFKf43GA7RWZdRetHrDTDgKdjTA1QIUeTcBFe1vR+SxlnT5KJtkoDMgg/
	nT++lccarkPU9a/ERQeLKRO8Mc03Shkogx6p6HTxtvF8xUQ2feytA4H9qFJcV4MVq6+0
	WTqNOhS5PqQXHPik950q9hZ1BnoR850upbmlfOYRT6R1dMKLeq+8PW+WIEX8ARPJKFk1
	ra1/ZI9vwTu6rDI51CFgdqA3S3FPWwhoRg4Va40wcIzGZE0Eao+ymUx6Wic8gLd3wMrM
	lgO5k03+aUF+BA9UPhYLz8G2bgLbgd7JLkw4dKU8R4PYV1Nu9jl9iDmNR/yzbXekeARi
	5Jcg==
X-Gm-Message-State: AGRZ1gKKOppU9xDB3KMTSMog7INKj8eP1rvqzXYPydaQHDxxhuglrqIr
	WuzhS+3JsGUAtEq04wL6zmwSbQ==
X-Received: by 2002:a1c:174c:: with SMTP id 73-v6mr739556wmx.105.1541166078886;
	Fri, 02 Nov 2018 06:41:18 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1629686wrp.56.2018.11.02.06.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 06:41:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:41:09 +0000
Message-Id: <20181102134112.26370-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102134112.26370-1-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH for-4.0 1/4] target/arm: Move id_aa64mmfr* to
 ARMISARegisters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zi/6bXz3ID33

At the same time, define the fields for these registers,
and use those defines in arm_pamax().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 22 ++++++++++++++++++++--
 target/arm/internals.h |  3 ++-
 target/arm/cpu64.c     |  6 +++---
 target/arm/helper.c    |  4 ++--
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8e6779936e..2ce5e80dfc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -815,6 +815,8 @@ struct ARMCPU {
         uint64_t id_aa64isar1;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
+        uint64_t id_aa64mmfr0;
+        uint64_t id_aa64mmfr1;
     } isar;
     uint32_t midr;
     uint32_t revidr;
@@ -836,8 +838,6 @@ struct ARMCPU {
     uint64_t id_aa64dfr1;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint64_t id_aa64mmfr0;
-    uint64_t id_aa64mmfr1;
     uint32_t dbgdidr;
     uint32_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
@@ -1554,6 +1554,24 @@ FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
+FIELD(ID_AA64MMFR0, PARange, 0, 4)
+FIELD(ID_AA64MMFR0, ASIDBits, 4, 4)
+FIELD(ID_AA64MMFR0, BigEnd, 8, 4)
+FIELD(ID_AA64MMFR0, SNSMem, 12, 4)
+FIELD(ID_AA64MMFR0, BigEndEL0, 16, 4)
+FIELD(ID_AA64MMFR0, TGran16, 20, 4)
+FIELD(ID_AA64MMFR0, TGran64, 24, 4)
+FIELD(ID_AA64MMFR0, TGran4, 28, 4)
+
+FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
+FIELD(ID_AA64MMFR1, VMIDBits, 4, 4)
+FIELD(ID_AA64MMFR1, VH, 8, 4)
+FIELD(ID_AA64MMFR1, HPDS, 12, 4)
+FIELD(ID_AA64MMFR1, LO, 16, 4)
+FIELD(ID_AA64MMFR1, PAN, 20, 4)
+FIELD(ID_AA64MMFR1, SpecSEI, 24, 4)
+FIELD(ID_AA64MMFR1, XNX, 28, 4)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c2bb2deeb..bf844abc47 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -213,7 +213,8 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
         [4] = 44,
         [5] = 48,
     };
-    unsigned int parange = extract32(cpu->id_aa64mmfr0, 0, 4);
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARange);
 
     /* id_aa64mmfr0 is a read-only register so values outside of the
      * supported mappings can be considered an implementation error.  */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 873f059bf2..0babe483ac 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -141,7 +141,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->pmceid0 = 0x00000000;
     cpu->pmceid1 = 0x00000000;
     cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->id_aa64mmfr0 = 0x00001124;
+    cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
@@ -195,7 +195,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_aa64pfr0 = 0x00002222;
     cpu->id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
+    cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->dbgdidr = 0x3516d000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
@@ -249,7 +249,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->pmceid0 = 0x00000000;
     cpu->pmceid1 = 0x00000000;
     cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->id_aa64mmfr0 = 0x00001124;
+    cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ea95b0815..70376764cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5228,11 +5228,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64MMFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_aa64mmfr0 },
+              .resetvalue = cpu->isar.id_aa64mmfr0 },
             { .name = "ID_AA64MMFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_aa64mmfr1 },
+              .resetvalue = cpu->isar.id_aa64mmfr1 },
             { .name = "ID_AA64MMFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.17.2

