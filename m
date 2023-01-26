Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp465434ejc;
        Thu, 26 Jan 2023 06:12:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9rooMtWCvJSjShk06rYX1Z7AzWkUBzM6P+bBhLYqhTobJSa4vKRmjoAF4D4xiM0Zqz4ivJ
X-Received: by 2002:a05:622a:178e:b0:3b6:31e3:1a59 with SMTP id s14-20020a05622a178e00b003b631e31a59mr11732828qtk.40.1674742379455;
        Thu, 26 Jan 2023 06:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674742379; cv=none;
        d=google.com; s=arc-20160816;
        b=a3DG218aTK9h5rqC4yBMfloU8ef3er1NOovH8dT5WvWpzO9v4zkXO8V7147syY6Ord
         SWlhG6n1NnprFDgng3E1b8NKxCqNXtTxBs5OqJq98wbYjIzIgYUein6ZSlwpwes+gkNc
         KjVE9BZukdPTDa3/zJJU2DYgB5zoFbNQNJb9F6810rWd1ZPaqo9i/Svl8tauV5XA73lY
         gaHaEMgsg1yo1AYK8OQO2CkGEbodwvnq64SVFaKeA7MKSOwOtTJlzpEGP9P0woCCRaB6
         bQs0wsOtLzhjw9ygBYT2VLYHD4w8Lxr3ZKlKc1clmpaJ9Hui0VC6+uIcitBhqaFjjyXR
         EQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=dFQOLJmhPMsdG47znun90lDAcLGUZDZs8sYOwAUDric=;
        b=Qw3TElUuyZ0UfmvoNHaZfdeISGwbriC6FImbBn+FBoFE+xzV/jZwozzRRv2ZOQkOkt
         6Mm1+znLlQakuUa/pyjAEAR44WdcDpNWo7T92Z2Y1a3+Asbq4o2W90HkeDxNjmsTtBhB
         axljhR6xAWnkXxrE1EjQxrZo/D6YcCsavMcpumVRjlmkVSXfWh95PV8M43m0qWYhcA7m
         ImOSG09A/RiB7iSH/IvOw81I35QkK8TFFaIq8b1EBB9UtpvHGc3KMCZqGVXa5sxEo5Dq
         /L+/Sk3JpyrOf/xpvPEKMY34onS68QB1HlL5qThzV3ye9KqHkifN/bugJQLhxk9kFrje
         fD5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=njH9cykw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac85712000000b003b6941e09dbsi685341qtw.366.2023.01.26.06.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 06:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=njH9cykw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pL2zf-0004Hw-28; Thu, 26 Jan 2023 09:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WYrSYwgKCNwQKMQR8D8EMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--smostafa.bounces.google.com>)
 id 1pL2zd-0004HP-E8
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 09:12:45 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WYrSYwgKCNwQKMQR8D8EMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--smostafa.bounces.google.com>)
 id 1pL2zb-0005Qu-Jn
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 09:12:45 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso1089429wms.4
 for <qemu-arm@nongnu.org>; Thu, 26 Jan 2023 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dFQOLJmhPMsdG47znun90lDAcLGUZDZs8sYOwAUDric=;
 b=njH9cykw11rNu0jyUb++cYvCoHIl5m5PxbvAUZP38hhYaWFeeA2gc38Jo0aebsp9HW
 oTHErv2JmpkModzjboF8zThTnn7mqtUVSwNgIcIgjl5BHhG78FuJUfUUz3JOLYl7GBNR
 KsqEiYs0CWoq6sx1Xjrqd02yXw0zS/bdDXCupKtSKehG1WL7LaCQxuho0s4kj4OwpTCL
 OMdIEmlATWZcA9flPfxn6cS8ySV29CQoaVL84XDnJSaIsb5j5/EGSkH0+qBstHUZGAyn
 87tAMiNMygrgxhKj50/IOxbqiAZ8M24paU1GkSAn3YUVgpjM4Li4O7UGWlQqmdt8XYOI
 15Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dFQOLJmhPMsdG47znun90lDAcLGUZDZs8sYOwAUDric=;
 b=jOxUH0sfi3w8/Bu/shvuEXUkzX68O7xkTvrvPuXU5OmeRCjOWwzCaFlVn6UkZjOKhT
 0vQHgbUaXbHkBD/2NEv0FlwR6FIfFVwRg4Gdz6gDPScwdUyGiov9iNuCsYe0vMT7oFnx
 MlKBsWB5ahJh8EJ/frPqVr5HJiwIqfPtqUxoWAfwfIadB7XZYjRXXTg9jH/M9067iO3M
 OJ4v6UB1u4P4p1jcq515yZeYAEh5xWQAMfMpcEQHhSdPjqbYmm4OcPxjF0iUsxSxkYwa
 XtCozugtx2vBcfiCYtyHEUNzGBwBxUZhRELFQsw/NxwCL8m/3J7z0XFKe5vsa3MTm9cI
 kPpg==
X-Gm-Message-State: AO0yUKXrB55u8DOYQarNJVH2/EC72eeSg2oo6yfC8F2EGWru56BdjTqp
 brrEFEmikReATeABBP8FVnK+NL94GjDlTQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:2ca4:b0:3dc:2039:170d with SMTP
 id h4-20020a05600c2ca400b003dc2039170dmr365531wmc.132.1674742361680; Thu, 26
 Jan 2023 06:12:41 -0800 (PST)
Date: Thu, 26 Jan 2023 14:11:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126141120.448641-1-smostafa@google.com>
Subject: [PATCH v2] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3WYrSYwgKCNwQKMQR8D8EMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cpI092fYlpI4

GBPA register can be used to globally abort all
transactions.

It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
be zero(Do not abort incoming transactions).

Other fields have default values of Use Incoming.

If UPDATE is not set, the write is ignored. This is the only permitted
behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)

As this patch adds a new state to the SMMU (GBPA), it is added
in a new subsection for forward migration compatibility.

Property "migrate-gbpa" was added to support backward compatibility.
However, if the GBPA.ABORT is set from SW at time of migration, the
GBPA migration will be forced to avoid inconsistencies where a qemu
instance is aborting transactions and it is migrated to another
instance bypassing them.

Signed-off-by: Mostafa Saleh <smostafa@google.com>

Changes in v2:
- GBPA is effective only when SMMU is not enabled.
- Ignore GBPA write when UPDATE is not set.
- Default value for SHCFG is "Use Incoming".
- Support migration.
---
 hw/arm/smmuv3-internal.h |  5 +++
 hw/arm/smmuv3.c          | 71 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  2 ++
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..3ff704248d 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,11 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, SHCFG,        12, 2)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..509aa923cd 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "cpu.h"
@@ -285,6 +286,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    /* Use incoming as other fields. */
+    s->gbpa = FIELD_DP32(s->gbpa, GBPA, SHCFG, 1);
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -659,7 +662,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     qemu_mutex_lock(&s->mutex);
 
     if (!smmu_enabled(s)) {
-        status = SMMU_TRANS_DISABLE;
+        if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+            status = SMMU_TRANS_ABORT;
+        } else {
+            status = SMMU_TRANS_DISABLE;
+        }
         goto epilogue;
     }
 
@@ -1170,6 +1177,16 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     case A_GERROR_IRQ_CFG2:
         s->gerror_irq_cfg2 = data;
         return MEMTX_OK;
+    case A_GBPA:
+        /*
+         * If UPDATE is not set, the write is ignored. This is the only
+         * permitted behavior in SMMUv3.2 and later.
+         */
+        if (data & R_GBPA_UPDATE_MASK) {
+            /* Ignore update bit as write is synchronous. */
+            s->gbpa = data & ~R_GBPA_UPDATE_MASK;
+        }
+        return MEMTX_OK;
     case A_STRTAB_BASE: /* 64b */
         s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
         return MEMTX_OK;
@@ -1318,6 +1335,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1482,6 +1502,39 @@ static const VMStateDescription vmstate_smmuv3_queue = {
     },
 };
 
+static bool smmuv3_gbpa_needed(void *opaque)
+{
+    SMMUv3State *s = opaque;
+    bool is_abort = FIELD_EX32(s->gbpa, GBPA, ABORT);
+
+    /*
+     * We migrate GBPA if migrate_gbpa property is set.
+     * If it is not set, but the GBPA register is set to abort, we force to
+     * migrate it as this can lead to inconsistencies where a qemu instance
+     * is aborting transcations and it is migrated another instance bypassing
+     * them. So we force to send the GBPA in this case, if the other instance
+     * was older it would fail migration.
+     */
+    if (!s->migrate_gbpa && is_abort) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Forcing to migrate GBPA as it was set from SW.\n");
+        return true;
+    }
+
+    return s->migrate_gbpa;
+}
+
+static const VMStateDescription vmstate_gbpa = {
+    .name = "smmuv3/gbpa",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = smmuv3_gbpa_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(gbpa, SMMUv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_smmuv3 = {
     .name = "smmuv3",
     .version_id = 1,
@@ -1512,6 +1565,21 @@ static const VMStateDescription vmstate_smmuv3 = {
 
         VMSTATE_END_OF_LIST(),
     },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gbpa,
+        NULL
+    }
+};
+
+static Property smmuv3_properties[] = {
+    /*
+     * True to correctly migrate the GBPA register.
+     * False to get backward migration compatibility with older QEMU versions
+     * if possible.
+     */
+    DEFINE_PROP_BOOL("migrate-gbpa",
+                     SMMUv3State, migrate_gbpa, true),
+    DEFINE_PROP_END_OF_LIST()
 };
 
 static void smmuv3_instance_init(Object *obj)
@@ -1530,6 +1598,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..075f09618c 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -46,6 +46,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
@@ -57,6 +58,7 @@ struct SMMUv3State {
     uint64_t eventq_irq_cfg0;
     uint32_t eventq_irq_cfg1;
     uint32_t eventq_irq_cfg2;
+    bool migrate_gbpa;
 
     SMMUQueue eventq, cmdq;
 
-- 
2.39.1.456.gfc5497dd1b-goog

