Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8EEEC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKV-0001uK-5y; Mon, 23 Feb 2026 12:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKU-0001rK-2B
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKQ-00009q-5Y
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4833115090dso43815995e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866156; x=1772470956; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CF4qyxmU9fhPcJpbwrYJ7dJ4Eedw5NYEVJqhMcT19uk=;
 b=TiQkNjWbZhFjVcJrH5+NBa+EInZ2SoS+Lja6Ex9AAA9i+DwTJZZzS8mm4LaibaV3Qk
 kUFIljSG1jfTzHkG5RIVX3qWbphj6ybyE3rVj5Dq14WqhtCCykLYGVtAacBItVqPZ7br
 kRtQJFamtX1i21PHB5S3eczYxEaZ0flSvvMt1lyiFnST4iAsmRHq/ZWxVZyjKELImlGr
 zowm7G5vquuU6tBvLIiG/kqz/zmK5tHfV7lYm65pClPX8+6iyw8IjIQ5mRB4dvSkzHbg
 H5GXlxodoYAX6idOhjuJApPyzNmPqJuP3OI0Sz+KBXFDc4nXQuO8gBCNYZ+RH/pOiMk3
 ecjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866156; x=1772470956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CF4qyxmU9fhPcJpbwrYJ7dJ4Eedw5NYEVJqhMcT19uk=;
 b=KVV6ivsQwlkv/H00GO0ykBtV5BSdbvkfRWtnYYVqyUKuUdlUnRnqkkJa95pCtzdo5b
 WZUC0+tXyaJC9tSW6gmay/8/2Zm9fCMXrWSfjX+bfYh5fGgXeG5NKQIqJ+eoUPWVGqU0
 eYFpMkO7pdRi8ExdQ5FKCko5dJcfu9cUeRxMUvrBaXPxr0T//5m53hRGROmljo+6cKlx
 5bXXh5o7u8YuN+Vh2OhcQiMxYKluSTkc+EOFY94TExwnm0z4IvQ87h2fuxBSOSsEpkVy
 0DyCL3KSXfrZTKvfHNuckcPWApsgjckwYu+D4Optml0CismCpTDnyC8ybzAJ/XyWo9rG
 mp2g==
X-Gm-Message-State: AOJu0YzdlZ/z1GrGlR5KJcLaGOd1b2nogIRpfQAm8V6u7CBCC9zS21k7
 j305J56HpiVcGVrClwiE8EzZeshf6ZEDrYYf8WgKIZslTEG2MOdW9MDYf0YRzLMZZGNMapsREZ3
 WCHmI
X-Gm-Gg: AZuq6aLOJC4MSEATOdBfWNQ3oJaWpIZIFqrbnHQJ2cgF9Sub4OJF07rqHSQtuwlL0hA
 orhfPIuErXPZ/qFrJW1/90LBn7KBKDrbUhgoFHYFKXZXW6rD0gLpkkX5oITPq7fyry+STzLDkaC
 xssFMIlvk1ednRZ4u59u+7etqOcxF3WyVblQIDBjYtre6Ztiahu6AnjZaG8KVb1+jMuptBURysn
 Kak+zbsCVYvnxbXNl3VwS4zkl5lkYRsthXt4Y0VTKbcP1O5AR4rtVSCQ5Xb64hvlXpgdKFwjU+u
 SKykxCxwV/PO2NKv4NrZZGMLKrdV0CcfFnsHBee2JPPh0bGgxwu/+KlZMkp9KNhrcRRyuyo1oEb
 07onZu5c062kpuuvMZjgbndnKOBu2cW9ZpGPKQMf0FUHFd/rh52w42oTLWw0+hCHGbHM6rPmGjv
 Gv0UiKQlyY/cIs/HCLb8GmRFZSbwXxhEKEMlBSnsoIBkOvMtJ7GuSNj8ltXEgYU4idw722kniYs
 S5a+0Imrw4+3G8Zi3o7bjrd3IUi4hA=
X-Received: by 2002:a05:600c:468d:b0:480:7162:fa48 with SMTP id
 5b1f17b1804b1-483a95c8f2dmr164281835e9.13.1771866156489; 
 Mon, 23 Feb 2026 09:02:36 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/65] target/arm: GICv5 cpuif: Implement the GIC CDPRI
 instruction
Date: Mon, 23 Feb 2026 17:01:25 +0000
Message-ID: <20260223170212.441276-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement the CPU interface GIC CDPRI instruction, which is a wrapper
around the SetPriority operation.

As with the barrier insns, we omit for the moment details which are
needed when the GICv5 supports virtualization:

 * traps when legacy GICv3 emulation is enabled
 * fine-grained-trap handling (which is done via
   registers that are new in GICv5)
 * sending the command for the virtual interrupt domain
   when inside a guest

The CD instructions operate on the Current Physical Interrupt Domain,
which is the one associated with the current security state and
exception level.  The spec also has the concept of a Logical
Interrupt Domain, which is the one associated with the security state
defined by SCR_EL3.{NS,NSE}.  Mostly the logical interrupt domain is
used by the LD instructions, which are EL3-only; but we will also
want the concept later for handling some banked registers, so we
define functions for both.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 76c2577c09..072b38e785 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -10,6 +10,59 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpregs.h"
+#include "hw/intc/arm_gicv5_stream.h"
+
+FIELD(GIC_CDPRI, ID, 0, 24)
+FIELD(GIC_CDPRI, TYPE, 29, 3)
+FIELD(GIC_CDPRI, PRIORITY, 35, 5)
+
+static GICv5Common *gicv5_get_gic(CPUARMState *env)
+{
+    return env->gicv5state;
+}
+
+static GICv5Domain gicv5_logical_domain(CPUARMState *env)
+{
+    /*
+     * Return the Logical Interrupt Domain, which is the one associated
+     * with the security state selected by the SCR_EL3.{NS,NSE} bits
+     */
+    switch (arm_security_space_below_el3(env)) {
+    case ARMSS_Secure:
+        return GICV5_ID_S;
+    case ARMSS_NonSecure:
+        return GICV5_ID_NS;
+    case ARMSS_Realm:
+        return GICV5_ID_REALM;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static GICv5Domain gicv5_current_phys_domain(CPUARMState *env)
+{
+    /*
+     * Return the Current Physical Interrupt Domain as
+     * defined by R_ZFCXM.
+     */
+    if (arm_current_el(env) == 3) {
+        return GICV5_ID_EL3;
+    }
+    return gicv5_logical_domain(env);
+}
+
+static void gic_cdpri_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    uint8_t priority = FIELD_EX64(value, GIC_CDPRI, PRIORITY);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDPRI, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDPRI, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_priority(gic, id, priority, domain, type, virtual);
+}
 
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
@@ -33,6 +86,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_NOP,
     },
+    {   .name = "GIC_CDPRI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 2,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdpri_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


