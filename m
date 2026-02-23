Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F43DEC1111
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKk-0002Se-2J; Mon, 23 Feb 2026 12:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKh-0002Pv-K4
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:55 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKf-0000Gr-6r
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-480706554beso55475345e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866172; x=1772470972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GFX2oLIEOhrVQeH0JfIITp46cEANNmny594ZuEVDUzo=;
 b=EAW2xRRn/8MDYs1d+BmeePlqhzPA5jJm13tm4AKK3Uu/yY1LwQELJYOmrs8fZ0ic3c
 lZXYzVC1d+xPthhBySoUu+szKdKZuVFgwDz+Pb5Qp2Ybu0t1hJ7XEslqJbTmox8rC3Jv
 VC5M6BoFqm9WfWnpHF649Q2BwHVy9ZVM1i92mdl0vhaNJ498azyoqV4f/+vZUJ0S1Aks
 r/kl7S/ToUpBdrHkWw8Eu3OwZIfH7raMTZatAFOTaPpiBGgLqNvFYdpmzwfwanjUcOrQ
 itvlEtaxn5dsNlmrGSzGuHvtVEMDMYR6EbIFMZQ38y5YvR0wmeV6wkFUxStrrYWTRIQo
 Bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866172; x=1772470972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GFX2oLIEOhrVQeH0JfIITp46cEANNmny594ZuEVDUzo=;
 b=OqOWELXUGHKAlM/zJk3b3u2OyXQxMG98NOLq22amI1VRQmXPJcWRq3SVyHZ1EgwSoK
 tWl216dJI+xR+F69KHPGH//PqVD+H5SLlGxN+dhBetcLFuplZiAei0bH14qTVQZ3hfSO
 VJkV+JXRX+1RJN2SzZRT/k9hEPJZWuD4wj1SUFxC4/Nxk9JjEilTwyN86KEbVytsKA8U
 8oUrpLLmMN6oPJrKFVHYP5Pnjzmzk/e8D45xUC/Ra/LNqiLUwzvrmgECmKKqq5aaY/59
 OstnTYUBc1JRScPGyHJCbK7TbLpnmKjBftYZAAQXzT49PDONn3tu696lgh9joA+Es6rk
 xEew==
X-Gm-Message-State: AOJu0YxWLwxuGE5PPMjBWKA5yyFcETntc8ZLfsoVYo3XMsbFsrJp+ATv
 o7yi9YccdMV7W59abs1gn24Tf7rT2SeVOwn0uyniqQnnqqo424dQchXaSbaD/M7yMrwshELdfQN
 JjdCS
X-Gm-Gg: AZuq6aIJDo1hcHVFWZLmsEHSi+2CBppqzazNbW8NF3CpkqgH4iR1HGWYEO99bkKf3ke
 AzDBE7FHw/GlEmyKodVFEBdZJp3whQz0suQ3TGpogL9YCGkPF7fqpSLd2FYm69LCF2ZhXMJFLSJ
 ECP+viGNWklXI+MB++Jj5XR6jaGpUp987xVzVKpMKt3jFdrBB6p7NS+Dn0aKsT4ZyB3GZibywUV
 iiXzKa9+xK0Qsj1vGtNX51jzthrymzokvjYHarGQpUijZF8jbZAsoG7VLZSL3P0a1AOVT9LmGA0
 qIb58rLQCj7EWUE2HBYzGuWQwbJkKvF7dJXtCiaVRL0oqWqZxsWMpMBfPCyzpddGqJFV4Jx591a
 Op9M2reM4qC2AOdKUDIqnweWmpCmb7pyIgchMQeGcwvztspdMwPf2ZwK5eBdRlOGqeYxxucOwRQ
 zdwh0F/m7sx6Jq4vh0GB7vNbWlIAWRPP/hNxqh/d+mvSQIJS2oD7Zgl58r0g3oG6BJADYd4ZB9l
 2XQwtdk3mj5Irr9tUQkD9TTNCKrkbX3XXLAfY4FtA==
X-Received: by 2002:a05:600c:3516:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-483a963df3cmr193925005e9.35.1771866171550; 
 Mon, 23 Feb 2026 09:02:51 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/65] target/arm: GICv5 cpuif: Implement ICC_IAFFIDR_EL1
Date: Mon, 23 Feb 2026 17:01:40 +0000
Message-ID: <20260223170212.441276-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The CPU system register ICC_IAFFIDR_EL1 is a read-only register that
tells the guest what the affinity ID of that CPU is.

Implement this register.  In real hardware using the stream protocol,
the IRS tells the CPU its IAFFID using a DownstreamControl command as
part of the handshake process when the IRS-CPU link is brought
online.  Our analogue of this is to pass the IAFFID as an extra
argument to gicv5_set_gicv5state().  (We could have the CPU call into
the GIC every time to ask for the value, but this would mean we had
to search the cpus[] array for the right CPU to return its IAFFID.)

Note that we don't put the IAFFID into the gicv5_cpuif sub-struct,
because that part of the CPU struct is zeroed on reset, and we must
keep the IAFFID across reset (we only set it up when the GIC device
is created).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5_common.c         |  5 +++--
 include/hw/intc/arm_gicv5_stream.h |  3 ++-
 target/arm/cpu.c                   |  5 +++--
 target/arm/cpu.h                   |  2 ++
 target/arm/tcg/gicv5-cpuif.c       | 11 +++++++++++
 5 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index bcbe88cde7..8feb492a43 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -175,9 +175,10 @@ static void gicv5_common_realize(DeviceState *dev, Error **errp)
     }
 
     for (int i = 0; i < cs->num_cpus; i++) {
-        if (!gicv5_set_gicv5state(cs->cpus[i], cs)) {
+        if (!gicv5_set_gicv5state(cs->cpus[i], cs, cs->cpu_iaffids[i])) {
             error_setg(errp,
-                       "CPU %d does not implement GICv5 CPU interface", i);
+                       "CPU %d (IAFFID 0x%x) does not implement GICv5 CPU interface",
+                       i, cs->cpu_iaffids[i]);
             return;
         }
     }
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 1f00e8ffff..7b5477c7f1 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -20,6 +20,7 @@ typedef struct GICv5Common GICv5Common;
  * gicv5_set_gicv5state
  * @cpu: CPU object to tell about its IRS
  * @cs: the GIC IRS it is connected to
+ * @iaffid: the IAFFID of this CPU
  *
  * Set the CPU object's GICv5 pointer to point to this GIC IRS.
  * The IRS must call this when it is realized, for each CPU it is
@@ -28,7 +29,7 @@ typedef struct GICv5Common GICv5Common;
  * Returns true on success, false if the CPU doesn't implement
  * the GICv5 CPU interface.
  */
-bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs);
+bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs, uint32_t iaffid);
 
 /*
  * The architected Stream Protocol is asynchronous; commands can be
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ef2afca6b9..551be14e22 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1087,16 +1087,17 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 #ifndef CONFIG_USER_ONLY
-bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs)
+bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs, uint32_t iaffid)
 {
     /*
      * Set this CPU's gicv5state pointer to point to the GIC that we are
-     * connected to.
+     * connected to, and record our IAFFID.
      */
     if (!cpu_isar_feature(aa64_gcie, cpu)) {
         return false;
     }
     cpu->env.gicv5state = cs;
+    cpu->env.gicv5_iaffid = iaffid;
     return true;
 }
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1fdfd91ba4..a32c5f3ab1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -819,6 +819,8 @@ typedef struct CPUArchState {
     void *gicv3state;
     /* Similarly, for a GICv5Common */
     void *gicv5state;
+    /* For GICv5, this CPU's IAFFID */
+    uint64_t gicv5_iaffid;
 #else /* CONFIG_USER_ONLY */
     /* For usermode syscall translation.  */
     bool eabi;
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 4420a44c71..c591e249b1 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -226,6 +226,17 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.icc_icsr_el1),
         .resetvalue = 0,
     },
+    {   .name = "ICC_IAFFIDR_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 5,
+        .access = PL1_R, .type = ARM_CP_NO_RAW,
+        /* ICC_IAFFIDR_EL1 holds the IAFFID only, in its low bits */
+        .fieldoffset = offsetof(CPUARMState, gicv5_iaffid),
+        /*
+         * The field is a constant value set in gicv5_set_gicv5state(),
+         * so don't allow it to be overwritten by reset.
+         */
+        .resetfn = arm_cp_reset_ignore,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


