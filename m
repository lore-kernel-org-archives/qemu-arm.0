Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp396205lfq;
        Fri, 8 Apr 2022 07:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGL0FTijizp5BIUhWnn8ZsTDPAr7MwLHAkhma8vLK+H3Lnsm+Si39DEDZdGIOvCgHq01Ld
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id c1-20020a25af41000000b00633905f9e9bmr14461405ybj.77.1649428406475;
        Fri, 08 Apr 2022 07:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428406; cv=none;
        d=google.com; s=arc-20160816;
        b=KvWbD8BWtjlbQetBtsumdeJlCprjpTqfJH8qBKXELNEG5xW0BMYZR8EPFLrC7sfVA3
         45vejYsOufS39vwbFj14Kmg2Ay5a9atPy4EqLvqC4QTwwJl/KHA+svB+TX4ZsQFNpeAY
         BiLOaCe5rbvGtgxETynVPrFYVk08PD34OaFh4CISlLKbvI82iUjLJXHlvz2pFaInioTV
         Er5M28nyGzTgqUyPPZo1NrdEDP2z/waKu/tTQTU3qOthv0wJWRZgxZbuBXncIdLzE9ud
         mXwSmQVhYx5apkE1EtHPpi3nRAO8p3dJCKzHYgqYVqNGDn/jAW9S5vXOYf5FQu5IDU4b
         CdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+91rGjHM43jV+u2RiWuTQSi49T2BNr1THBEc0q/ZCAY=;
        b=oLuaJv9caXTFaIguKMTkoZ7okYMZebMoJ5c138+kpjPtOGeRqM4/HPPwZTv5js6OFH
         uyvF3vWK9LcBAKP0q1tR+BVe19udBOITB4ZBG77dYZva4FanhXCnDsdMUK9QcqiTpe2X
         9x46Ern3QSkvadFz5kAy7BAy+cv8VzXfOuOCBNXQS3zA/ijdI/8NUK7H6u8M0HpNPuPQ
         5/sR+lrl2CA7NhFaM96wHWJNAbZlBafe0DpBQQqRIIWBHB0NJ5vOq8QpdYLuOsEXXRmZ
         6aReZ9tdi/7j2QeyIhkFPx9JX+vDWDkhTNSKEtIDbDAjMtAmcD2OLHBwb4l8JAYFfjMj
         Gh3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IVK5GFre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203-20020a252fd4000000b00641191cae62si222296ybv.452.2022.04.08.07.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IVK5GFre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpfx-0007gh-Pr
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPP-00071x-8I
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPN-0002MD-CI
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id q20so5588890wmq.1
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+91rGjHM43jV+u2RiWuTQSi49T2BNr1THBEc0q/ZCAY=;
 b=IVK5GFreUo74u0JZXNImYQ/M5H2tGL8g4nawcQEIzKG0wtA3LsN0J0LHMkWOYrkPlk
 7TxkFgrQGuuTj0Z4ikQZMuSbiyJvLUWpk1HQDOwuoFq+s0pxMR5dVpCn6lCm32BbTkph
 0I8JDRpowpXBWgVe9Ie44DztzsNADUxmB0KJ5Pov4+kbhOLjFBT414t69zz0GxtGRbLp
 HmqWmy2914ULUQXri2g+meD6MbZcTVybEepKVVHff4Pk73h3t/elyQ2UIQ4WLAcXsJxT
 pVKqpxb4MTgaVs/XL485AZuDaEJjMueZMYK1gpFcywzYy9hitaTJrC2wDfQPKEeF1peL
 2okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+91rGjHM43jV+u2RiWuTQSi49T2BNr1THBEc0q/ZCAY=;
 b=JDtwksSvDxvxM2z0byD0FS0dmy+P+1Wj7UsXuLE1wCjjN/Mr/eSTWVpm9tBCgoClXD
 zABmAY9iAmL4LtsfB0QPjG8F+w7dGz9h0whoOGzTwHnogJizWEOAZGAUz4OyQHAmtpKB
 Jz4ZPVJkxywPttrbN1ZOiLQKtV2H9GWQmUGLunxE+qwwwYQQCpWHpEi/mv6DGy5QveXX
 nEPfY6cT1lLk6aVUvcRMERJolnJ7zAhdCGooT+Wf9rf6bhiDee6EwGdYbJ7EtDL8V6IC
 1gKkv3SEuWjqguSwx6MSKrtPI4rGn4DFl2RyKZVzKW2nIlF7PxGQSDRzRcwlu8DWlr0E
 wzfA==
X-Gm-Message-State: AOAM533Kdq0iS2Avm9a+CPg+1W0GMnCpWjf3Xf4RYOZx5eJMbKxnWYkL
 ixU5v56xOeEA5USCJX/tu46MUdw2uX7+hQ==
X-Received: by 2002:a1c:6a02:0:b0:38b:3661:47f1 with SMTP id
 f2-20020a1c6a02000000b0038b366147f1mr17121608wmc.5.1649427375950; 
 Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/41] hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ" from
 gicv3_cpuif_virt_update()
Date: Fri,  8 Apr 2022 15:15:33 +0100
Message-Id: <20220408141550.1271295-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /N4Q+B6FhZKU

The function gicv3_cpuif_virt_update() currently sets all of vIRQ,
vFIQ and the maintenance interrupt.  This implies that it has to be
used quite carefully -- as the comment notes, setting the maintenance
interrupt will typically cause the GIC code to be re-entered
recursively.  For handling vLPIs, we need the redistributor to be
able to tell the cpuif to update the vIRQ and vFIQ lines when the
highest priority pending vLPI changes.  Since that change can't cause
the maintenance interrupt state to change, we can pull the "update
vIRQ/vFIQ" parts of gicv3_cpuif_virt_update() out into a separate
function, which the redistributor can then call without having to
worry about the reentrancy issue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h  | 11 +++++++
 hw/intc/arm_gicv3_cpuif.c | 64 ++++++++++++++++++++++++---------------
 hw/intc/trace-events      |  3 +-
 3 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 795bf57d2b3..f25ddeca579 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -707,6 +707,17 @@ void gicv3_init_cpuif(GICv3State *s);
  */
 void gicv3_cpuif_update(GICv3CPUState *cs);
 
+/*
+ * gicv3_cpuif_virt_irq_fiq_update:
+ * @cs: GICv3CPUState for the CPU to update
+ *
+ * Recalculate whether to assert the virtual IRQ or FIQ lines after
+ * a change to the current highest priority pending virtual interrupt.
+ * Note that this does not recalculate and change the maintenance
+ * interrupt status (for that, see gicv3_cpuif_virt_update()).
+ */
+void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs);
+
 static inline uint32_t gicv3_iidr(void)
 {
     /* Return the Implementer Identification Register value
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 1a3d440a54b..5fb64d4663c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -370,30 +370,20 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
     return value;
 }
 
-static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
+void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
 {
-    /* Tell the CPU about any pending virtual interrupts or
-     * maintenance interrupts, following a change to the state
-     * of the CPU interface relevant to virtual interrupts.
-     *
-     * CAUTION: this function will call qemu_set_irq() on the
-     * CPU maintenance IRQ line, which is typically wired up
-     * to the GIC as a per-CPU interrupt. This means that it
-     * will recursively call back into the GIC code via
-     * gicv3_redist_set_irq() and thus into the CPU interface code's
-     * gicv3_cpuif_update(). It is therefore important that this
-     * function is only called as the final action of a CPU interface
-     * register write implementation, after all the GIC state
-     * fields have been updated. gicv3_cpuif_update() also must
-     * not cause this function to be called, but that happens
-     * naturally as a result of there being no architectural
-     * linkage between the physical and virtual GIC logic.
+    /*
+     * Tell the CPU about any pending virtual interrupts.
+     * This should only be called for changes that affect the
+     * vIRQ and vFIQ status and do not change the maintenance
+     * interrupt status. This means that unlike gicv3_cpuif_virt_update()
+     * this function won't recursively call back into the GIC code.
+     * The main use of this is when the redistributor has changed the
+     * highest priority pending virtual LPI.
      */
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
-    int maintlevel = 0;
-    ARMCPU *cpu = ARM_CPU(cs->cpu);
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
@@ -410,16 +400,42 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
         }
     }
 
+    trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
+    qemu_set_irq(cs->parent_vfiq, fiqlevel);
+    qemu_set_irq(cs->parent_virq, irqlevel);
+}
+
+static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
+{
+    /*
+     * Tell the CPU about any pending virtual interrupts or
+     * maintenance interrupts, following a change to the state
+     * of the CPU interface relevant to virtual interrupts.
+     *
+     * CAUTION: this function will call qemu_set_irq() on the
+     * CPU maintenance IRQ line, which is typically wired up
+     * to the GIC as a per-CPU interrupt. This means that it
+     * will recursively call back into the GIC code via
+     * gicv3_redist_set_irq() and thus into the CPU interface code's
+     * gicv3_cpuif_update(). It is therefore important that this
+     * function is only called as the final action of a CPU interface
+     * register write implementation, after all the GIC state
+     * fields have been updated. gicv3_cpuif_update() also must
+     * not cause this function to be called, but that happens
+     * naturally as a result of there being no architectural
+     * linkage between the physical and virtual GIC logic.
+     */
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
+    int maintlevel = 0;
+
+    gicv3_cpuif_virt_irq_fiq_update(cs);
+
     if ((cs->ich_hcr_el2 & ICH_HCR_EL2_EN) &&
         maintenance_interrupt_state(cs) != 0) {
         maintlevel = 1;
     }
 
-    trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
-                                    irqlevel, maintlevel);
-
-    qemu_set_irq(cs->parent_vfiq, fiqlevel);
-    qemu_set_irq(cs->parent_virq, irqlevel);
+    trace_gicv3_cpuif_virt_set_maint_irq(gicv3_redist_affid(cs), maintlevel);
     qemu_set_irq(cpu->gicv3_maintenance_interrupt, maintlevel);
 }
 
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 004a1006fb8..36c3fe4da0b 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -152,7 +152,8 @@ gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x va
 gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
 gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
 gicv3_cpuif_virt_update(uint32_t cpuid, int idx) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d"
-gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d maintenance-irq %d"
+gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
+gicv3_cpuif_virt_set_maint_irq(uint32_t cpuid, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting maintenance-irq %d"
 
 # arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
-- 
2.25.1

