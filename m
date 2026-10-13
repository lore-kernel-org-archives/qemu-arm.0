Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D2ACA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3d-0007aG-Ur; Tue, 13 Oct 2026 04:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3Q-00071p-0J
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3L-0007p3-HV
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:10 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso18549485e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880804; x=1792485604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=8uQRGGo33+t5uuGFTo4Z4S7EgGCw82RRO0sVfMQiO1g=;
 b=pI23lG78nJg3xQ4N/7hdnQNGXYZwk/4oXoWd9bUNxrxBWTpOF4+1nlLyrhLoeiC8OE
 LbBR47IOIuDEQKOFrS3clwJKD7pxLzIaQI4NS3y66MI9Bn3qbAuvCN4yksZuPMV5utTu
 3HYB6P89ZUsB2vmH433t2Xv1PbbRALYvGeVDuzAB+VyamSac9dVOvbvyH1HVQMq4Nl+E
 KjSOVOcY1IGxAIKuFGzyXbbJalwef77p6kSRO7lKt7bM+kD8Q9s1hjcexKEKeBE7y553
 7jpuJqzEW+XVCR+8zEZaCCH0FngcQrFKeYD6RWXfJ30B5iCN3ql5fitgbfVc8Q5U62kt
 wtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880804; x=1792485604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=8uQRGGo33+t5uuGFTo4Z4S7EgGCw82RRO0sVfMQiO1g=;
 b=L0b4QudGb/Y6xomEODXZ3yzVxS6isx1lo5EOgsGkvKPAJ2IXb30jw3gyMSatUP5dym
 vEGRhny5yY1U0Jhy1zgJJVLiXuQcGFMyizzfEiqR1240jljSGg95YTkLq6aMbcYh0ODE
 T7Ky+KUSz0ojhoP64HihYJm9er9YG5ND8ZLerULky6YIXoD+MzCf0ASO+yfj5g+YxI/U
 71GY6MBsH5Q3+sI8g4qbly5OO7qi5EwBw1j9WXjSNnzA/Hl9XRi4TUXX2vIFu5yOgqEX
 /lz/wqchfEjur8zffp9q9fWxGewPitPSrsvglVk/yxCJbchIrbVUWXAsU1/R8lCl8Ypz
 hS6w==
X-Gm-Message-State: AFq9FYIzEhQ+4E9CGnY1+/Ze0n5bnCU+4qPhNFtyoUdIer22pBQ6dJxD
 sVAqhWYci3txh+t5GvY8CS/8x1wTAli3fhNnJ8NhnEJ0xqCh/hLqSSHLb17lfASKFB951ZQdDOM
 Nv4yfDyQ=
X-Gm-Gg: AYBFou3E7Sibai/PF20pWXsqa9Fri/ndfRqv3rZfrKi7w/JaryCBO/VFN+uRrYC2FQf
 RabVHmFnl6TU70CvLAVU27HqBb2RNUPMUQSz8JXbOL1OxapV79DOY6zAqgRYeCAoeRXRxQ7eiBZ
 S5PZAqKiWiwcv+PZh7wgbIpwlUbszKvQlEjZKGGlBw61S7MuOvM2dfxPebjPznt49X9ANg5WkDw
 dxAeOwvz6BbfOl/dvoRp+pdXojnyHRD5WfsHjVU78KgDOxhRurFhY+PKGV7HhvGTWkt8/1xlwO5
 LuAqGqNwJDoHRWMR1liCsXHOgm2nRamQGRQikN0ccw1jJNAi9CUT+Qi3j9wvLh7qOlCiSd/XEv9
 Be3Ajy7Zbo3bq/Da+48oqsTn3f/otzt5JwxDm2yPJXrwFJrxjAtbguQF3wfijMXGVSUV+NtPngU
 zFMmI7VKFjza1dntCt0/tsxxk9ueHfdGGU7yH3F4hMNOOsZ8QLzNFW6W+pqfhP8mRlJp2AGH7FU
 6izNLPF4lX831Re8HTZpl76FkVcfPxNxcWyR7ac2oEWyASb31PxN7bM1rliMjMslUtmC/9L92II
 vLuJxGIe26CEcQ==
X-Received: by 2002:a05:600c:1d0e:b0:49f:ec98:f030 with SMTP id
 5b1f17b1804b1-4a18e4e9db3mr236851375e9.33.1791880803659; 
 Tue, 13 Oct 2026 01:40:03 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/86] target/arm: GICv5 cpuif: Implement ICC_SRE_ELx
Date: Tue, 13 Oct 2026 09:38:28 +0100
Message-ID: <20261013083933.1024405-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When FEAT_GCIE and FEAT_EL2 are implemented, the GICv5 specification
requires that the old GICv3 ICC_SRE_EL1 and ICC_SRE_EL2 registers are
present, with RAO/WI bits, even if FEAT_GCIE_LEGACY is not
implemented or enabled.  ICC_SRE_EL3 is not present, but the CPU
behaves as if its Enable and SRE bits are always set. (See R_SLVXV,
R_MCTMX, R_HQBBN.)

Implement the ICC_SRE_EL1 and ICC_SRE_EL2 registers.  For QEMU, this
"all bits RAO" is identical to how we implemented it for GICv3,
because we didn't implement the memory-map register interface, we
didn't support IRQ or FIQ bypass and we took advantage of the IMPDEF
option to make the ENABLE bit RAO so we didn't need to trap lower-EL
accesses to ICC_SRE_ELx.  The RAO behaviours correspond to "do
nothing" -- don't trap system register accesses, no IRQ/FIQ bypass
handling -- so we don't need any special handling in any part of the
CPU implementation, just as we didn't for GICv3.

Because ICC_SRE_EL1 is EL1-visible but only present when FEAT_EL2
is implemented, we need to put it in a cpreg array that we only
register when ARM_FEATURE_EL2 is set, rather than being able to
list it in the main gicv5_cpuif_reginfo array and relying on the
access field as we do for other FEAT_EL2 GICv5 registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index be34312d242..8cb790204f1 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -1017,6 +1017,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, cp15.fgt_read[FGTREG_ICH_HFGRTR]),
         .resetvalue = ICH_HFGRTR_EL2_RES1_MASK,
     },
+    {   .name = "ICC_SRE_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 5,
+        .access = PL2_RW, .type = ARM_CP_NO_RAW | ARM_CP_CONST,
+        .resetvalue = 0xf,
+    },
     {   .name = "ICH_HFGWTR_EL2", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 6,
         .access = PL2_RW, .type = ARM_CP_NO_RAW,
@@ -1116,6 +1121,14 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     },
 };
 
+static const ARMCPRegInfo gicv5_cpuif_el2_reginfo[] = {
+    {   .name = "ICC_SRE_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 5,
+        .access = PL1_RW, .type = ARM_CP_NO_RAW | ARM_CP_CONST,
+        .resetvalue = 0x7,
+    },
+};
+
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
 {
     if (cpu_isar_feature(aa64_gcie, cpu)) {
@@ -1153,5 +1166,9 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &ppi_prio);
         }
+
+        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+            define_arm_cp_regs(cpu, gicv5_cpuif_el2_reginfo);
+        }
     }
 }
-- 
2.43.0


