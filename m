Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BF710ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CE-00072o-92; Fri, 27 Mar 2026 07:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C6-0006rj-9m
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C4-000881-Da
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso2108287f8f.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610255; x=1775215055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnrF8FhdNtpjJjbzEATZqeP00jwVSkGfClNmWr825JA=;
 b=A4in92nWcDOxy2BWz68UynPFwiaFQgA8xORFoJRvimQY+QHDJXfOMFcpUxfqUgBbNg
 xYV8n0sckj8a7P91ISFPniRklhqC53nfurnNSNLiFXum5dTloD/9bNxwwq1cXtHpR25A
 txh/O64kVJxj9keXj1mK9nCsK/BnYV7dqa92KsEZG0tTeira116isj3altEOBbywA1b3
 lMva/ZykR1xUAwig6j+YDhAwmLT47ITNTSblkdF4yl+9hgBQzrFruC9Dlw3C4Nruo8g9
 wd8lZvz83O2rRBkf9XQ1KgJKM/kqD76CDYljG461tCwppyOl+z23JUX6addv43DjGBeK
 fmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610255; x=1775215055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xnrF8FhdNtpjJjbzEATZqeP00jwVSkGfClNmWr825JA=;
 b=cWUq8Qve0LzSeEdfc8wqYt2R4XrJ7KtHd00O1LJ9GZaN+LJ7aZRS1WQNhzipuPQVsi
 qKODasrb42s4POQBesbZtZ/Hzb3jNOS7S275zyYUcAGP+BzU2bpUVCwsSs0rbk3R6hvw
 OZK++Z8zZMd09BeNh9YgbxlvP4sXjjn/wpZngARXIQs3frlixphWcBET4FYe86bulUjz
 Fghq+jOx9E0UAkW8KOJpDMtyzimf8HizGpOE+/YpxqWS2nJDHJGfNsDEvCMJf05Tt9R5
 NHE6MKSLHTUN36eEr2/yLmFQSZ495qWa7aL+AtehqjY4ogJpvaiOB+iVoGTxMxBoKwyj
 Oqdg==
X-Gm-Message-State: AOJu0YzecJzF+yfBNNpEPLcGZrTlj4os0u4FN7NnRDGx++7FX8rwQIny
 lUfK1sZZ+mFo3+T7bnaDjB5fe0mMGGzCsL5sjHkBT4EBzylEOu30PyrEH8Za5XqT1m90emm2tq4
 ETi+FRP4=
X-Gm-Gg: ATEYQzzh3qyTBDCzIR4yjKyKNkYejJgqozwtMRABUJDodbkj84rg+OETZ/WVTiNsZRY
 d0QngYSbokakRFzFdLKRVUWA33Rao7+bNVX0QNSldGAStZpuOdo361tgkEiOcHS1QpvXmz353Ek
 Aqcoe7JoWrK2+i0C4bU6pfuIBiYBzuH3w7YAMp84HuQ/xV35di8RiFsw5C+s9z41O5feoynbGxo
 JERvLloWsc4rWjGLZu0G0Ger1Aby/3O9hROBauM6Di4kKZZG4FZTNV5R4rBM744+paga5+CidnK
 vyXffvKUVdeMDE9N9sWzPfUhHu4VjCmZ5MLpoXV/vG69kdlEp5ZYuXZnIPyvLJS88c4sWMEqJcK
 Al1VtAVbj9CLQv/RHUQo2RYYCxk8qh7tVaZbRbQ3AHEoYSdGNpPn6cy7zlH6msIQK914Bu7LEQG
 HsQ/DuGb9d2JC7wNiIcgulVP3LvxLsRDCbyoZ2QL3yKsNsTvbIrS3Nuw4mFsgmLxXSz/0saiq/A
 +j9lY4w+zkktVgFXxpBELHNNzYvrQK4bRvq7uUn8A==
X-Received: by 2002:a05:6000:200c:b0:43b:8f4e:27f8 with SMTP id
 ffacd0b85a97d-43b9ea34a8cmr3174268f8f.12.1774610254831; 
 Fri, 27 Mar 2026 04:17:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 34/65] target/arm: GICv5 cpuif: Implement ICC_IAFFIDR_EL1
Date: Fri, 27 Mar 2026 11:16:29 +0000
Message-ID: <20260327111700.795099-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5_common.c         |  5 +++--
 include/hw/intc/arm_gicv5_stream.h |  3 ++-
 target/arm/cpu.c                   |  5 +++--
 target/arm/cpu.h                   |  2 ++
 target/arm/tcg/gicv5-cpuif.c       | 11 +++++++++++
 5 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 5510e6239a..0b5303f370 100644
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
index 670423fdad..136b6339ee 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -20,6 +20,7 @@ typedef struct GICv5Common GICv5Common;
  * gicv5_set_gicv5state
  * @cpu: CPU object to tell about its IRS
  * @cs: the GIC IRS it is connected to
+ * @iaffid: the IAFFID of this CPU
  *
  * Set the CPU object's GICv5 pointer to point to this GIC IRS.  The
  * IRS must call this when it is realized, for each CPU it is
@@ -28,7 +29,7 @@ typedef struct GICv5Common GICv5Common;
  * Returns true on success, false if the CPU doesn't implement the
  * GICv5 CPU interface.
  */
-bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs);
+bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs, uint32_t iaffid);
 
 /*
  * The architected Stream Protocol is asynchronous; commands can be
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4044bce5b6..ceb303a55a 100644
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
index 8cf09791c1..005e2fa8d2 100644
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


