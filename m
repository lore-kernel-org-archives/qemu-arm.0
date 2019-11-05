Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp458288wri;
        Tue, 5 Nov 2019 01:17:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwAPJ43XSBHgq4cyeIiRO9RSQDzxo+H2Wl3B9QAQ0LGpyJwM6U3yG0ZQ+K4vdxqFz5vutj5
X-Received: by 2002:a50:ef16:: with SMTP id m22mr17065062eds.154.1572945445532;
        Tue, 05 Nov 2019 01:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945445; cv=none;
        d=google.com; s=arc-20160816;
        b=BHRFS77yb1U7EX1AakD10cjlQwMeYbwlvfvsZt4/XeLOie7pbDXYfTBxWcUPnhyUc+
         k/cTSNpDIVR7sDK8AtRl3vX06brRdwRqtZ60oBC0e2I39VfIq2vyxgS8rGvI1hDEO/+y
         qYTb4rXYyKgjnOiZW7Yyj5dfWNr/EKc6V5PaTo3peK1Iz/GxGrNLZPRl4nQHgOON7lGn
         2VGq6jHVmQR/xyvRNhxlIngKI4OzI4BeIqxa10irN6sjNe4UtzgBhXO0ETnjwLIKoG76
         nYQbytljv/35EEj/NWIMohodWq1QJwYaTXphjUWNq98ETdv5sx0/9rJdL4aOvU4TB3mf
         eAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=m83ydIVkXTuqODZkul2Ull8iN8M7KLYAE8nT87WFXVc=;
        b=Rh7DOl6oYW8TWdXeGg/126Qt3LTss+rX+PC9KLDZGegLXin9dhgQOucp3veBSKzbO9
         p+u3CW8bxry7uz91KGI5RNkEiZWA8s9cG0aL+9SIARgUIb8zCB0n4YYjJE32/rGWptHp
         xhzEeKly71swiZKyxzzb2zJQ1E5vwOK6/eIsGSiQt1SU65YQXieQvU+86H3Shq5431ny
         cDs8yMSJ4Q9MuP5PuULReUEhEgRupUO7s83DaEEZIuYkx+Xx+NKKJY8flVLP3Qav4N5/
         uEWcbvJaj6+OXhyJKObUY80GBKvLh6vyAhD2LPQ3w8scPED+zyWg0coAs6URuREe5Opy
         9o7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g90si9937095edd.329.2019.11.05.01.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRuxn-0002ba-Uo
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusy-00052h-31
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007lv-O0
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:52158 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007j7-4L; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3842331F2AAD5394DB38;
 Tue,  5 Nov 2019 17:12:18 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:07 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 09/14] arm/sdei: override qemu_irq handler when binding
 interrupt
Date: Tue, 5 Nov 2019 17:10:51 +0800
Message-ID: <20191105091056.9541-10-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLz9V7S1t/1J

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
 target/arm/sdei.c     | 130 +++++++++++++++++++++++++++++++++++++++++-
 target/arm/sdei_int.h |   3 +
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 713ac97775..529a06c1f6 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -88,6 +88,24 @@ static void qemu_sde_cpu_init(QemuSDEState *s)
     }
 }
=20
+static int gic_int_to_irq(int num_irq, int intid, int cpu)
+{
+    if (intid >=3D GIC_INTERNAL) {
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
+    irq -=3D num_irq - GIC_INTERNAL;
+    *cpu =3D irq / GIC_INTERNAL;
+    return irq % GIC_INTERNAL;
+}
+
 static inline QemuSDECpu *get_sde_cpu(QemuSDEState *s, CPUState *cs)
 {
     if (cs->cpu_index >=3D s->sdei_max_cpus) {
@@ -410,6 +428,74 @@ static void dispatch_cpu(QemuSDEState *s, CPUState *=
cs, bool is_critical)
     }
 }
=20
+static void qemu_sdei_irq_handler(void *opaque, int irq, int level)
+{
+    int cpu =3D 0;
+
+    irq =3D irq_to_gic_int(sde_state->num_irq, irq, &cpu);
+    trigger_sdei_by_irq(cpu, irq);
+}
+
+static void override_qemu_irq(QemuSDEState *s, int32_t event, uint32_t i=
ntid)
+{
+    qemu_irq irq;
+    QemuSDE *sde;
+    CPUState *cs;
+
+    /* SPI */
+    if (intid >=3D GIC_INTERNAL) {
+        cs =3D first_cpu;
+        irq =3D qdev_get_gpio_in(s->gic_dev,
+                               gic_int_to_irq(s->num_irq, intid, 0));
+        if (irq) {
+            qemu_irq_intercept_in(&irq, qemu_sdei_irq_handler, 1);
+        }
+        sde =3D get_sde_no_check(s, event, cs);
+        sde->irq =3D irq;
+        put_sde(sde, cs);
+        return;
+    }
+    /* PPI */
+    CPU_FOREACH(cs) {
+        irq =3D qdev_get_gpio_in(
+            s->gic_dev,
+            gic_int_to_irq(s->num_irq, intid, cs->cpu_index));
+        if (irq) {
+            qemu_irq_intercept_in(&irq, qemu_sdei_irq_handler, 1);
+        }
+        sde =3D get_sde_no_check(s, event, cs);
+        sde->irq =3D irq;
+        put_sde(sde, cs);
+    }
+}
+
+static void restore_qemu_irq(QemuSDEState *s, int32_t event, uint32_t in=
tid)
+{
+    QemuSDE *sde;
+    CPUState *cs;
+
+    /* SPI */
+    if (intid >=3D GIC_INTERNAL) {
+        cs =3D first_cpu;
+        sde =3D get_sde_no_check(s, event, cs);
+        if (sde->irq) {
+            qemu_irq_remove_intercept(&sde->irq, 1);
+            sde->irq =3D NULL;
+        }
+        put_sde(sde, cs);
+        return;
+    }
+    /* PPI */
+    CPU_FOREACH(cs) {
+        sde =3D get_sde_no_check(s, event, cs);
+        if (sde->irq) {
+            qemu_irq_remove_intercept(&sde->irq, 1);
+            sde->irq =3D NULL;
+        }
+        put_sde(sde, cs);
+    }
+}
+
 static int32_t sdei_alloc_event_num(QemuSDEState *s, bool is_critical,
                                     bool is_shared, int intid)
 {
@@ -443,6 +529,7 @@ static int32_t sdei_alloc_event_num(QemuSDEState *s, =
bool is_critical,
             sde_props[index].interrupt =3D intid;
             sde_props[index].is_shared =3D is_shared;
             sde_props[index].is_critical =3D is_critical;
+            override_qemu_irq(s, event, intid);
             s->irq_map[intid] =3D event;
             qemu_mutex_unlock(&sde_props[index].lock);
             qemu_mutex_unlock(&s->sdei_interrupt_bind_lock);
@@ -460,6 +547,7 @@ static int32_t sdei_free_event_num_locked(QemuSDEStat=
e *s, QemuSDEProp *prop)
         return SDEI_DENIED;
     }
=20
+    restore_qemu_irq(s, prop->event_id, prop->interrupt);
     s->irq_map[prop->interrupt] =3D SDEI_INVALID_EVENT_ID;
     prop->event_id =3D SDEI_INVALID_EVENT_ID;
     prop->interrupt =3D SDEI_INVALID_INTERRUPT;
@@ -992,13 +1080,33 @@ static int64_t sdei_event_pe_unmask(QemuSDEState *=
s, CPUState *cs,
     return SDEI_SUCCESS;
 }
=20
+static int dev_walkerfn(DeviceState *dev, void *opaque)
+{
+    QemuSDEState *s =3D opaque;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_GICV3_COMMON)) {
+        GICv3State *gic =3D ARM_GICV3_COMMON(dev);
+        s->num_irq =3D gic->num_irq;
+        s->gic_dev =3D dev;
+        return -1;
+    }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_GIC_COMMON)) {
+        GICState *gic =3D ARM_GIC_COMMON(dev);
+        s->num_irq =3D gic->num_irq;
+        s->gic_dev =3D dev;
+        return -1;
+    }
+    return 0;
+}
+
 static int64_t sdei_event_interrupt_bind(QemuSDEState *s, CPUState *cs,
                                          struct kvm_run *run)
 {
     uint64_t *args =3D (uint64_t *)(run->hypercall.args);
     uint32_t intid =3D args[1];
=20
-    if (intid < GIC_NR_SGIS || intid >=3D GIC_MAXIRQ) {
+    if (intid < GIC_NR_SGIS || intid >=3D s->num_irq) {
         return SDEI_INVALID_PARAMETERS;
     }
     return sdei_alloc_event_num(s, false, intid >=3D GIC_INTERNAL, intid=
);
@@ -1112,6 +1220,17 @@ void sdei_handle_request(CPUState *cs, struct kvm_=
run *run)
         return;
     }
=20
+    if (!sde_state->gic_dev) {
+        /* Search for ARM GIC device */
+        qbus_walk_children(sysbus_get_default(), dev_walkerfn,
+                           NULL, NULL, NULL, sde_state);
+        if (!sde_state->gic_dev) {
+            error_report("Cannot find ARM GIC device!");
+            run->hypercall.args[0] =3D SDEI_NOT_SUPPORTED;
+            return;
+        }
+    }
+
     if (func_id < SDEI_1_0_FN_BASE || func_id > SDEI_MAX_REQ) {
         error_report("Invalid SDEI function ID: 0x%x", func_id);
         run->hypercall.args[0] =3D SDEI_INVALID_PARAMETERS;
@@ -1259,11 +1378,20 @@ static int qemu_sdei_post_load(void *opaque, int =
version_id)
         }
     }
=20
+    /* Search for ARM GIC device */
+    qbus_walk_children(sysbus_get_default(), dev_walkerfn,
+                       NULL, NULL, NULL, s);
+    if (!s->gic_dev) {
+        error_report("Cannot find ARM GIC device!");
+        return 0;
+    }
+
     for (i =3D 0; i < PRIVATE_SLOT_COUNT + SHARED_SLOT_COUNT; i++) {
         int intid =3D sde_props[i].interrupt;
=20
         if (intid !=3D SDEI_INVALID_INTERRUPT) {
             s->irq_map[intid] =3D sde_props[i].event_id;
+            override_qemu_irq(s, sde_props[i].event_id, intid);
         }
     }
=20
diff --git a/target/arm/sdei_int.h b/target/arm/sdei_int.h
index d3fd7cbc10..a251b04ab5 100644
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
@@ -107,9 +108,11 @@ typedef struct QemuSDECpu {
=20
 typedef struct QemuSDEState {
     DeviceState     parent_obj;
+    DeviceState     *gic_dev;
     QemuSDEProp     sde_props_state[PRIVATE_SLOT_COUNT + SHARED_SLOT_COU=
NT];
     QemuSDECpu      *sde_cpus;
     int             sdei_max_cpus;
+    int             num_irq;
     QemuSDE         *shared_sde_array[SHARED_SLOT_COUNT];
     int32_t         irq_map[GIC_MAXIRQ];
     QemuMutex       sdei_interrupt_bind_lock;
--=20
2.19.1

