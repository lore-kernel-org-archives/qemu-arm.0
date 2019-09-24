Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045328wrp;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGOsRY6DkcczA4mzCUcc3ydXysdxnxJ6v9me+VEHeuM1Bo7hGTRdL+/qCzXHqJtQsYtQW6
X-Received: by 2002:a37:5887:: with SMTP id m129mr2853908qkb.27.1569338615894;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338615; cv=none;
        d=google.com; s=arc-20160816;
        b=BKMRxqwDRZNqiLiq8RNojSxRHgGkSc4Xas7BYXo6zrGy37Ykg+L1+7As99hy8G7bte
         +Vac7pSPfIiU80QGF1UPsXDqx+z+5PRwnvWHWX8Zq5xPeJQrftfMcLTeFqSGP1nbNoQk
         Zm1XKYyHYT4G/Pk73otTfmsztxAuI1odYdm87S7EQMVpWF3LZxwxdx71E7Hgnvh+8C3F
         bJTYVGlqUPZJ/AV/8XTQzfQPZl5Qh7YWFBxBZFW/8jp9Rxs0S3y3xFMpuQvTx7F8GkOG
         rcKcUImdN/3DIlgeapvdSP6yqLNSnqkE4kcs5bahQaThu1cs3zZQqTMmj7JntSva9Wbm
         Xb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nrCATvZR9fYWArQxcvL56ZNpU0BE5XF9TPna6g+H55E=;
        b=07XA+A6gfMmpVzUWKCmsQn3a7uRNFjG13/9mazs4kQPj96ixGISU/qGvMxJLBkOHvK
         b4dDpyj/bSM2gALYdIfbDYUqBD3Sg1jbpSTuMnGRudSq134lRBtWfH0H4Nx7WqaH6KGm
         d94lDrOow5m++3ghpI8C1T+foYjdhgMkGVDcT58QCrLMHbrPsf9z4M9SYl8vNicPpbQs
         /jLwaRUNbtKmbd/FNjEB/K/XHiZQQF7APTVea66VizcaTsq07IzXvLPwUZqabfgeR4sR
         F4VMFBy0ORZxwypzcpieyTlU1EnwpaEO+iiUEsBHW31EAJxN0t0fvl0my+IAH8pN+1BS
         rB+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f11si1420387qvd.35.2019.09.24.08.23.35;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 83A094A6DB;
	Tue, 24 Sep 2019 11:23:35 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7cNfoJkixsN; Tue, 24 Sep 2019 11:23:34 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 140304A6BB;
	Tue, 24 Sep 2019 11:23:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B61A64A66F
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGblcjFs-51Z for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:31 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 6B1034A64A
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:30 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 652C98126B7940A2D8D7;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:18 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 07/12] arm/sdei: override qemu_irq handler when binding
 interrupt
Date: Tue, 24 Sep 2019 23:21:46 +0800
Message-ID: <1569338511-3572-8-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 Dave Martin <Dave.Martin@arm.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: waKFSTiPf+TB

Override qemu_irq handler to support trigger SDEI event transparently
after guest binds interrupt to SDEI event. We don't have good way to
get GIC device and to guarantee SDEI device is initialized after GIC,
so we search GIC in system bus when the first SDEI request happens or
in VMSTATE post_load().

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c     | 137 ++++++++++++++++++++++++++++++++++++++++++++++++--
 target/arm/sdei_int.h |   3 ++
 2 files changed, 137 insertions(+), 3 deletions(-)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 088ed76..9ceb131 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -85,6 +85,24 @@ static void qemu_sde_cpu_init(QemuSDEState *s)
     }
 }
 
+static int gic_int_to_irq(int num_irq, int intid, int cpu)
+{
+    if (intid >= GIC_INTERNAL) {
+        return intid - GIC_INTERNAL;
+    }
+    return num_irq - GIC_INTERNAL + cpu * GIC_INTERNAL + intid;
+}
+
+static int irq_to_gic_int(int num_irq, int irq, int *cpu)
+{
+    if (irq < num_irq - GIC_INTERNAL) {
+        return irq + GIC_INTERNAL;
+    }
+    irq -= num_irq - GIC_INTERNAL;
+    *cpu = irq / GIC_INTERNAL;
+    return irq % GIC_INTERNAL;
+}
+
 static inline QemuSDECpu *get_sde_cpu(QemuSDEState *s, CPUState *cs)
 {
     assert(cs->cpu_index < s->sdei_max_cpus);
@@ -381,6 +399,76 @@ static void dispatch_cpu(QemuSDEState *s, CPUState *cs, bool is_critical)
     }
 }
 
+static void qemu_sdei_irq_handler(void *opaque, int irq, int level)
+{
+    int cpu = 0;
+    irq = irq_to_gic_int(sde_state->num_irq, irq, &cpu);
+    trigger_sdei_by_irq(cpu, irq);
+}
+
+static void override_qemu_irq(QemuSDEState *s, int32_t event, uint32_t intid)
+{
+    qemu_irq irq;
+    QemuSDE *sde;
+    CPUState *cs;
+    int cpu;
+
+    /* SPI */
+    if (intid >= GIC_INTERNAL) {
+        cs = arm_get_cpu_by_id(0);
+        irq = qdev_get_gpio_in(s->gic_dev,
+                               gic_int_to_irq(s->num_irq, intid, 0));
+        if (irq) {
+            qemu_irq_intercept_in(&irq, qemu_sdei_irq_handler, 1);
+        }
+        sde = get_sde_no_check(s, event, cs);
+        sde->irq = irq;
+        put_sde(sde, cs);
+        return;
+    }
+    /* PPI */
+    for (cpu = 0; cpu < s->sdei_max_cpus; cpu++) {
+        cs = arm_get_cpu_by_id(cpu);
+        irq = qdev_get_gpio_in(s->gic_dev,
+                               gic_int_to_irq(s->num_irq, intid, cpu));
+        if (irq) {
+            qemu_irq_intercept_in(&irq, qemu_sdei_irq_handler, 1);
+        }
+        sde = get_sde_no_check(s, event, cs);
+        sde->irq = irq;
+        put_sde(sde, cs);
+    }
+}
+
+static void restore_qemu_irq(QemuSDEState *s, int32_t event, uint32_t intid)
+{
+    QemuSDE *sde;
+    CPUState *cs;
+    int cpu;
+
+    /* SPI */
+    if (intid >= GIC_INTERNAL) {
+        cs = arm_get_cpu_by_id(0);
+        sde = get_sde_no_check(s, event, cs);
+        if (sde->irq) {
+            qemu_irq_remove_intercept(&sde->irq, 1);
+            sde->irq = NULL;
+        }
+        put_sde(sde, cs);
+        return;
+    }
+    /* PPI */
+    for (cpu = 0; cpu < s->sdei_max_cpus; cpu++) {
+        cs = arm_get_cpu_by_id(cpu);
+        sde = get_sde_no_check(s, event, cs);
+        if (sde->irq) {
+            qemu_irq_remove_intercept(&sde->irq, 1);
+            sde->irq = NULL;
+        }
+        put_sde(sde, cs);
+    }
+}
+
 static int32_t sdei_alloc_event_num(QemuSDEState *s, bool is_critical,
                                     bool is_shared, int intid)
 {
@@ -414,6 +502,7 @@ static int32_t sdei_alloc_event_num(QemuSDEState *s, bool is_critical,
             sde_props[index].interrupt = intid;
             sde_props[index].is_shared = is_shared;
             sde_props[index].is_critical = is_critical;
+            override_qemu_irq(s, event, intid);
             s->irq_map[intid] = event;
             qemu_mutex_unlock(&sde_props[index].lock);
             qemu_mutex_unlock(&s->sdei_interrupt_bind_lock);
@@ -433,6 +522,7 @@ static int32_t sdei_free_event_num_locked(QemuSDEState *s, QemuSDEProp *prop)
         goto unlock_return;
     }
 
+    restore_qemu_irq(s, prop->event_id, prop->interrupt);
     s->irq_map[prop->interrupt] = SDEI_INVALID_EVENT_ID;
     prop->event_id = SDEI_INVALID_EVENT_ID;
     prop->interrupt = SDEI_INVALID_INTERRUPT;
@@ -929,13 +1019,33 @@ static int64_t sdei_event_pe_unmask(QemuSDEState *s, CPUState *cs,
     return SDEI_SUCCESS;
 }
 
+static int dev_walkerfn(DeviceState *dev, void *opaque)
+{
+    QemuSDEState *s = opaque;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_GICV3_COMMON)) {
+        GICv3State *gic = ARM_GICV3_COMMON(dev);
+        s->num_irq = gic->num_irq;
+        s->gic_dev = dev;
+        return -1;
+    }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_GIC_COMMON)) {
+        GICState *gic = ARM_GIC_COMMON(dev);
+        s->num_irq = gic->num_irq;
+        s->gic_dev = dev;
+        return -1;
+    }
+    return 0;
+}
+
 static int64_t sdei_event_interrupt_bind(QemuSDEState *s, CPUState *cs,
                                          struct kvm_run *run)
 {
     uint64_t *args = (uint64_t *)(run->hypercall.args);
     uint32_t intid = args[1];
 
-    if (intid < GIC_NR_SGIS || intid >= GIC_MAXIRQ) {
+    if (intid < GIC_NR_SGIS || intid >= s->num_irq) {
         return SDEI_INVALID_PARAMETERS;
     }
     return sdei_alloc_event_num(s, false, intid >= 32, intid);
@@ -1042,6 +1152,17 @@ void sdei_handle_request(CPUState *cs, struct kvm_run *run)
         return;
     }
 
+    if (!sde_state->gic_dev) {
+        /* Search for ARM GIC device */
+        qbus_walk_children(sysbus_get_default(), dev_walkerfn,
+                           NULL, NULL, NULL, sde_state);
+        if (!sde_state->gic_dev) {
+            error_report("Cannot find ARM GIC device!");
+            run->hypercall.args[0] = SDEI_NOT_SUPPORTED;
+            return;
+        }
+    }
+
     if (func_id < SDEI_1_0_FN_BASE || func_id > SDEI_MAX_REQ) {
         error_report("Invalid SDEI function ID: 0x%x", func_id);
         run->hypercall.args[0] = SDEI_INVALID_PARAMETERS;
@@ -1198,9 +1319,19 @@ static int qemu_sdei_post_load(void *opaque, int version_id)
         }
     }
 
+    /* Search for ARM GIC device */
+    qbus_walk_children(sysbus_get_default(), dev_walkerfn,
+                       NULL, NULL, NULL, s);
+    if (!s->gic_dev) {
+        error_report("Cannot find ARM GIC device!");
+        return 0;
+    }
+
     for (i = 0; i < PRIVATE_SLOT_COUNT + SHARED_SLOT_COUNT; i++) {
-        if (sde_props[i].interrupt != SDEI_INVALID_INTERRUPT) {
-            s->irq_map[sde_props[i].interrupt] = sde_props[i].event_id;
+        int intid = sde_props[i].interrupt;
+        if (intid != SDEI_INVALID_INTERRUPT) {
+            s->irq_map[intid] = sde_props[i].event_id;
+            override_qemu_irq(s, sde_props[i].event_id, intid);
         }
     }
 
diff --git a/target/arm/sdei_int.h b/target/arm/sdei_int.h
index 7f69507..3930591 100644
--- a/target/arm/sdei_int.h
+++ b/target/arm/sdei_int.h
@@ -63,6 +63,7 @@ typedef struct QemuSDEProp {
 typedef struct QemuSDE {
     QemuSDEProp     *prop;
     CPUState        *target_cpu;
+    qemu_irq        irq;
     QemuMutex       lock;
     bool            enabled;
     bool            running;
@@ -95,9 +96,11 @@ typedef struct QemuSDECpu {
 
 typedef struct QemuSDEState {
     DeviceState     parent_obj;
+    DeviceState     *gic_dev;
     QemuSDEProp     sde_props_state[PRIVATE_SLOT_COUNT + SHARED_SLOT_COUNT];
     QemuSDECpu      *sde_cpus;
     int             sdei_max_cpus;
+    int             num_irq;
     QemuSDE         *shared_sde_array[SHARED_SLOT_COUNT];
     int32_t         irq_map[GIC_MAXIRQ];
     QemuMutex       sdei_interrupt_bind_lock;
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
