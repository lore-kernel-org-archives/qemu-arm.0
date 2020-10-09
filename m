Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2386145lfq;
        Fri, 9 Oct 2020 08:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz9zmyUBJ/GoBYb+yystqCtO8yg1LqioT0+jgD1I+s4P2lSQ4e0+2UN+KTizdOQATVM0nC
X-Received: by 2002:a25:7d04:: with SMTP id y4mr19505057ybc.246.1602257961286;
        Fri, 09 Oct 2020 08:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602257961; cv=none;
        d=google.com; s=arc-20160816;
        b=IzrwzNiHAaNxYXcFcBS1KYdNgr0oYmzpgBY/RAPFcFOAOu5aHzL4hKccx/cJgqXXVT
         zd0lXFJcc4Jk6MbNA1INKOR1ZMRpKNDJbl4ciyqexRfY6tL2CYtnrmmVASWfbzWqLttG
         ff3/7++jHyIVjsLUzdNgVSURx0kD38cd5rpAgopjAxOkcfCNBKpgym0nuDgOnP89w5xU
         2yuPMVAtyUiQpute3nU2hII61CcEy5fWpIm26uVx1mfJeKm5OelUgDNx0scHzOZznrVb
         Bmhk2/kbAlDEfDx8WsZRyjQpN+lECWR/gJe9yr5wnMCvfoL5OWzC2aLw+lljKZ+LQhsQ
         946A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=m+57w4waUDsMvpjTdXukUzVLKUiAH7ggRqO2IkZWWK8=;
        b=qlhkyksisE0nV3tix8AyGRqwRyJwvbhK28thSnTXbGXXhB4xrKXpQqqFglZlqojHXn
         BZWO38d0VcAFGYysBg3AunojYstwoJB07xS59hhByyGjwzPa6otgZD9MzFxzxxyItnvh
         skR4i4BPvpc6s3kMYQQ87AZGD66mloZ2xx1fVvJiplUGzOO5wwa7F7FU7ut5moNvZFil
         VeiGsKf5WDF5QHKONmPmqyk8zxRV4IR2her8ZIPB5RQeKNZGFZ7PtKjiIowavOIpzMfA
         5RUWyJSZxr2wbcm5mA525Q0CTd6inKlZ52A/Yn/CzeNj46nAa4G0qLY21DocS1dF0neg
         +xPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfEPA0sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si5271305ybj.329.2020.10.09.08.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 08:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfEPA0sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQuUK-00046O-N9
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQuUB-00044r-Jw
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 11:39:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQuU8-00073x-Ob
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 11:39:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id e18so10756804wrw.9
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+57w4waUDsMvpjTdXukUzVLKUiAH7ggRqO2IkZWWK8=;
 b=zfEPA0sbIKc7BepKUD4ycqD72V2CdcgFW9Nw480YWGBnSAei9TCbuibGeZwVeUdlSa
 jBC7CkBhjL/iRfyVyYUVh17yW7Im8y8TtyEMpN17nbx9VhvHQ5coKwNnDLiP29d8a7tn
 H0J4H/vujHMu9AxWDVltkY4AO7ocMnbYctFzabS8/ucGkhIRsOikLq3ZHVVcxiidPb81
 V4bPPsQetOY2lXFKLajXyr09CcbJz4KchO+VdwCE4riLpJLjnH9RVryQWmhyZNxz/KJu
 mCwx5024Thk4ejD+LAMRaoPOQQDh+FRNozUnzs9ksUuf0JjJyLyK7RJga7eh8NqJJD5u
 U7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+57w4waUDsMvpjTdXukUzVLKUiAH7ggRqO2IkZWWK8=;
 b=qpX1Fy30DZEwVGxOKyqMthrR/AnmWjP0EzzmolpxFozl3UlV5nn0/FyFQcrD/tKNAX
 qKBZ2sNEqnrB5gbsnTsOp5mSDOQGPMpXcLENUJCO/kSgdqm09HDm5J5Jcw0ElU8EnSC7
 G2r9ha2v+UqZJUCXt8M+3kpjR7NmGwnoccs/d3Zt6R2XkHrKz9/dgsTREuTveey/JMOc
 qpZkqPR24RBaS+E6e9dfpVaY9a1eFNhyYnjAZI6sa8dreLHjQC2BvjFt5T8O8b5eFXBK
 jZqQ/QxaedwAY9NLQMDmV/Ub6ZdV/wuz0895OZtKJ1AH0uBdo+3SIT8wmtNW6rHGn6cN
 gjYA==
X-Gm-Message-State: AOAM532zgVmDSJwxaDXcj0XwHXLIPhnt62zkEHxz2Q5l0na1/HSnx/cd
 /K6jPtKWTBh0tUidw0IloQrs9uFrly3421GE
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr17209904wrq.157.1602257946742; 
 Fri, 09 Oct 2020 08:39:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h3sm13050598wrq.0.2020.10.09.08.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:39:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Make GIC maintenance interrupts work
Date: Fri,  9 Oct 2020 16:39:04 +0100
Message-Id: <20201009153904.28529-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Jose Martins <josemartins90@gmail.com>, Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uReNRyykogNL

In gicv3_init_cpuif() we copy the ARMCPU gicv3_maintenance_interrupt
into the GICv3CPUState struct's maintenance_irq field.  This will
only work if the board happens to have already wired up the CPU
maintenance IRQ before the GIC was realized.  Unfortunately this is
not the case for the 'virt' board, and so the value that gets copied
is NULL (since a qemu_irq is really a pointer to an IRQState struct
under the hood).  The effect is that the CPU interface code never
actually raises the maintenance interrupt line.

Instead, since the GICv3CPUState has a pointer to the CPUState, make
the dereference at the point where we want to raise the interrupt, to
avoid an implicit requirement on board code to wire things up in a
particular order.

Reported-by: Jose Martins <josemartins90@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---

QEMU's implementation here is a bit odd because we've put all the
logic into the "GIC" device where in real hardware it's split between
a GIC device and the CPU interface part in the CPU.  If we had
arranged it in that way then we wouldn't have this odd bit of code
where the GIC device needs to raise an IRQ line that belongs to the
CPU.

Not sure why we've never noticed this bug previously with KVM as a
guest, you'd think we'd have spotted "maintenance interrupts just
don't work"...
---
 include/hw/intc/arm_gicv3_common.h | 1 -
 hw/intc/arm_gicv3_cpuif.c          | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0331b0ffdb8..91491a2f664 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -153,7 +153,6 @@ struct GICv3CPUState {
     qemu_irq parent_fiq;
     qemu_irq parent_virq;
     qemu_irq parent_vfiq;
-    qemu_irq maintenance_irq;
 
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 08e000e33c6..43ef1d7a840 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -399,6 +399,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
     int irqlevel = 0;
     int fiqlevel = 0;
     int maintlevel = 0;
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
@@ -424,7 +425,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
-    qemu_set_irq(cs->maintenance_irq, maintlevel);
+    qemu_set_irq(cpu->gicv3_maintenance_interrupt, maintlevel);
 }
 
 static uint64_t icv_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2624,8 +2625,6 @@ void gicv3_init_cpuif(GICv3State *s)
             && cpu->gic_num_lrs) {
             int j;
 
-            cs->maintenance_irq = cpu->gicv3_maintenance_interrupt;
-
             cs->num_list_regs = cpu->gic_num_lrs;
             cs->vpribits = cpu->gic_vpribits;
             cs->vprebits = cpu->gic_vprebits;
-- 
2.20.1

