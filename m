Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F27E10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:27:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bt-0006Yl-KM; Fri, 27 Mar 2026 07:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Br-0006Wx-T6
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bp-0007vO-GB
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so1482037f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610240; x=1775215040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x13cV/o1Pi9D6t5vPv/J+WSzawf4SKPSgV3PxkKGE6o=;
 b=lpaPJ2uriPePz4a2UUxBagKMf4pthf9QUjn3bnncugnhq/ToIfiKIEpWFio7Orwe/1
 DYYwUXchb4BHGhwWodMdlelGp0vhVzNK9rDOM5xQ5c95xZHtFXg/JcfgjLaVq+bS+woP
 5uCmAoBhUPMXAj79HJUSDgBKbEwwQ+rQlibYaXHiksD7rlGp2L960cMkIeeNsaQgpack
 YK/X/rLsEdecR0qaKWCWCfJuzu4k0gcsWrJevXa6D/x1Z2ncG3bE/GYgcGMd9sYP2+cI
 JW6oEcRaQZ2vIBmRlLRZgvA5ak0RhwbOt3ZA2GCQ64/ccyPfe/vf6fpg/O0ItL8nP2pn
 3p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610240; x=1775215040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x13cV/o1Pi9D6t5vPv/J+WSzawf4SKPSgV3PxkKGE6o=;
 b=NCjYpwYOURPMsL6cPn0TOG3fxxRsAxzRRgFmZK3SXMaxkqH3bD0uJTQUqD5Z+QSaey
 VMC75otSirtMIFdqWn+ONRhIiZ8JK/9+3+MoqMt1J0+VPrUWWH/+fw09069/N49xHusP
 OHrinvcc+9kROuCXeUjN0FN8klBmZ7nVfgYNSnB7DMiR0ZgYILf0C9HUvvtIWqRjAQAH
 p3ZZKcj3C8fnB5h2UZkqXRSAuH7jlE3ml71Jyn9hUbwcZm/YQMyGFI79y+cr0iPdxgFm
 9K6HLQk4ZaHf9j1x7Wh6yrva6IMraGXykxFkXe8n0rmmjyGUoSxYvqY6WXhIW6cytSHm
 RRyA==
X-Gm-Message-State: AOJu0YzrkqOcVucbF1r3VCVtTe6TOxD4rREVFBqzT5NigH4FgV/RtYvr
 LUYjYm3amRbv8RSuqsexY7EZl3u8NVp0vGrADeDQQ4/UaMphrXubuIgiK7vCLzPb+8H732gFCc9
 Xfz0ljnU=
X-Gm-Gg: ATEYQzzmrwdr5Bx/rB/h7ZlXIjN7+s1gm5XJ0qBXTW+pQYI+ikLikJ9MnQIjnB0lk66
 oJcPOgREF+y35Y1s4+0+rcz5b3PEn/vHXAR99G339gcMMMqBMpO2Dbijsg/0vrEjXbxRYNfLzj6
 nmVI1IVgQSFI4xmDBjtFfmEfxbth4Ez+hCUE5LB85rx1uhrXp9rGltgD3r/3bFxWvNPd1KMfaay
 0QuAzEcK1XjpOD2/cyaYJsw6ZLLiyF7xMbqKoJ+zov/z7uEHUGC+jiOxoP4pjeFL00FW+SRTV5Q
 nSduYhi0KgYTqn2XgYqDdBQ9sWx+q2pOsG9o/JqCxny9nPumdY0FGzrawEjc8a8Z1iPLHQU1w3k
 qFbBq2Ec4RgRm1IleD4j+sPhxJy0hvWxMn9EAW0XZa7cIqMxYyfQH/HsCkJ5m7LadgK5TVSFU0d
 f1HuXlda+ZmUH9Y+eYMqF3nXoZJoTG9e8Dj8YKBJj5R5hmQ2keLXGXDFzLIyAl/5ouPZ+9iA4iv
 BeYB67STHShO+x0JVn1vXsUknLPu3Q=
X-Received: by 2002:a05:6000:40cd:b0:436:3707:2bf0 with SMTP id
 ffacd0b85a97d-43b9ea465e0mr3100215f8f.35.1774610239830; 
 Fri, 27 Mar 2026 04:17:19 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 19/65] target/arm: GICv5 cpuif: Implement the GIC CDPRI
 instruction
Date: Fri, 27 Mar 2026 11:16:14 +0000
Message-ID: <20260327111700.795099-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 7392a98c49..0c2bba5ce9 100644
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


