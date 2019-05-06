Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2682175wrh;
        Mon, 6 May 2019 10:48:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxB4ahH0WrkPEbVFBT2FAfCksv4dhVvfUylItnWYARTJ+F6QJcqQiLPc2LvX0JAgyDrFx3D
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr3452476wrp.320.1557164907463;
        Mon, 06 May 2019 10:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557164907; cv=none;
        d=google.com; s=arc-20160816;
        b=boMBSi3qybngu2KnGsgQYM7Xcxtf+B/BwUta9H7q9+UljqH5FkO2K2qebHC47dS9zS
         Wa8aATOQvAhtrUPl48XTBFw0/rn42EEMZzHDHWsU7n6N+/rZFS9u8F9Gk+SNVQLwJCEM
         OYwrz26zE7hC8yAslP4BJKjOUvzOxV55seSfxyTuOen9e5qYSV4DGeidI0ZUNj4LJLhV
         MttTK0swrF/KVd9+57VI78LVJIFSLLJsOmSONjCPrqdSLCEIIzOfcSuAHA84pwSC+gg3
         SA6FH/X4LL1yjIkvqcAyONiuHP7HNX5hPqm9FZH6OHq3n7+ZQIsLBvCJaFEgzILNvG4h
         CHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=C88Ei/VihHBAOteN7bDmsYhjQHUxDozERJjKlZZiWa8=;
        b=PBsy7VX+gM/R82227YKNv9VmXr+ZtMaIhMD1MjkxZ9vRWbjQQIFjbIsX0ViSh6VS5v
         W6T9uhS/7cGDxizJs/sXpNdBlYEOJpLPKsxIsmBxt4dFmxDAOlwKllvBUF9MUbR+0yqF
         AONQTKmrMM/zq8p4QycbxU3PRvrchefJCnPp1syXqRcdkp1ui0F9ql3Y5EReLUf2kM25
         jjbFoi8myjzm/sEdhIVwfQR/eg9GUe/1Khx/XmpEVa4YZmVKlOiTqain9WTdk2M/c8u2
         7U/jUFRO3jOR3uXs+d3GZbtcOqCaGfJ2MRwoKC92xAx7QYE19NKuZIAoX1/pKtvrziQa
         5Mqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sHvcnbl3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si3951774wme.163.2019.05.06.10.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 10:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sHvcnbl3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNhj0-00052L-Eb
	for alex.bennee@linaro.org; Mon, 06 May 2019 13:48:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVV-0001P3-4Z
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVS-0001bn-7o
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:29 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hNhVQ-0001Y1-C7
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:25 -0400
Received: by mail-pg1-x542.google.com with SMTP id h17so818712pgv.0
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C88Ei/VihHBAOteN7bDmsYhjQHUxDozERJjKlZZiWa8=;
	b=sHvcnbl3E2ZWklsiprgp0xlEK/K7eAg6GixcuLtR3Tp/kBdNtfHYZsgPBZ+R3hSlfs
	qwvWwpIMH3mzRoU4wVKCaeW5d4UO+pd1ZCa+Yzr4P+QeglKYAceTB4aM8UxCH9IrD/CB
	F3kPQ4pH/tFyBrktkhjjTsEgk3Vgguy2jSNYsXoEnlXz0P61tgiYg/1hEdV3HIROB1o+
	UxnOsnwGphporYoystRo4lJk3w7NU43OAsWM/G3zRT5VWlVeNopuovWCbQkUGat3l7WS
	o+ucNAT65YDsTxN+MzFbqRaPSGpUsC4AbtvYA5vxN3C/YKKgJmE8amaBMtCU5Zb3a+Rc
	U8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C88Ei/VihHBAOteN7bDmsYhjQHUxDozERJjKlZZiWa8=;
	b=UdQL6tJeRChz1APzVnFwVzYHdhlQeGPesXAri+VtKtYQJETg47ub9QWWW+mChB+3sE
	nHq50DvYojfarf8+K+teB4dvy9Z2tnoi60BBTgE7i9yO2CCh9yNx5Iem8GRb3YNnmn0J
	D8H3ptViplRie2+CB5xypt2S08wMzjCyzEBwDRbybMdgchvpRpirbjUx2Gzslbyoaamw
	xQ0lcOCLVfdrTci/ZSBraflz6EY9vnNo00Z/lxEkNH5Y8c5GwTaHZIvXICV9lshqEXUw
	U4UFAKZjRmVUqQzj7YaBFQAmckyHCKFZECHMcw4QdPU25VlHxgI25E82OFG/VMaSaq+K
	p5EQ==
X-Gm-Message-State: APjAAAUGCfzZMQkne8zFlIt15901YZ3ICs6zKY2xXWdBqefgW09ZT73y
	MSpF/vMw+WW1ufa3b7FQz8UxXRDBK3E=
X-Received: by 2002:a63:ed4f:: with SMTP id m15mr33935349pgk.387.1557164061922;
	Mon, 06 May 2019 10:34:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	k9sm2268839pfa.180.2019.05.06.10.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:34:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 10:33:51 -0700
Message-Id: <20190506173353.32206-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506173353.32206-1-richard.henderson@linaro.org>
References: <20190506173353.32206-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v4 22/24] target/arm: Implement ARMv8.5-RNG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8YHOOiVAtUL

Cc: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Log errors with -d unimp, for lack of a better flag.
---
 target/arm/cpu.h    |  5 +++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9448a76186..5c228fee8e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3510,6 +3510,11 @@ static inline bool isar_feature_aa64_condm_5(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) >= 2;
 }
 
+static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
+}
+
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 228906f267..835f73cceb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,6 +310,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 658a5a9822..3824778dab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -21,6 +21,8 @@
 #include "fpu/softfloat.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-target.h"
+#include "qapi/error.h"
+#include "qemu/guest-random.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -5722,6 +5724,45 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
     REGINFO_SENTINEL
 };
+
+static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    Error *err = NULL;
+    uint64_t ret;
+
+    /* Success sets NZCV = 0000.  */
+    env->NF = env->CF = env->VF = 0, env->ZF = 1;
+
+    if (qemu_guest_getrandom(&ret, sizeof(ret), &err) < 0) {
+        /*
+         * ??? Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return the
+         * timed-out indication to the guest.  There is no reason
+         * we know to expect this failure to be transitory, so the
+         * guest may well hang retrying the operation.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      ri->name, error_get_pretty(err));
+        error_free(err);
+
+        env->ZF = 0; /* NZCF = 0100 */
+        return 0;
+    }
+    return ret;
+}
+
+/* We do not support re-seeding, so the two registers operate the same.  */
+static const ARMCPRegInfo rndr_reginfo[] = {
+    { .name = "RNDR", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 0,
+      .access = PL0_R, .readfn = rndr_readfn },
+    { .name = "RNDRRS", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
+      .access = PL0_R, .readfn = rndr_readfn },
+    REGINFO_SENTINEL
+};
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6666,6 +6707,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_rndr, cpu)) {
+        define_arm_cp_regs(cpu, rndr_reginfo);
+    }
 #endif
 
     /*
-- 
2.17.1

