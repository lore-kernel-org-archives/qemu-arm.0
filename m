Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6408D19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:46:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd2-0001XP-0m; Mon, 26 Jan 2026 12:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcp-0001Pt-GQ
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcm-00007b-H1
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso3716921f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449419; x=1770054219; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8v1gA33hjaYhV55XhXrq0Gi+pAkxwSl9Pre/BV0Vh8U=;
 b=ePM+xd18oRM+DGALVxRekZwfc8qIWuzwXEDLyLP/SEclSPvNztKgwaiJPxmnpCsqp7
 Jp9ujVzgwIF2X4+ryuYoFGl3QSmM4au4ahGuVQ1cpyOUQCKvL87z8eB9Pb+upfeNzcm9
 6SAEzsc41eILZbd9LL0Yspzh9yDpOjonbMcQd7Z1x+b5J4IUGAolY/oKXAGsMfdTRbQt
 oIhkBE0UVNVOTPi77HZULsnN4q6ENf7sjuKpqztQPHPyHNzcOQAp9QkYKJOB6vGqx4pp
 eqrprh8sz6+8Vrd7G5zvMwEmPCeyXblB2umUeMn5pGEidqSeEs4xtXZMg6UqppRXHOCL
 KZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449419; x=1770054219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8v1gA33hjaYhV55XhXrq0Gi+pAkxwSl9Pre/BV0Vh8U=;
 b=V5qWNumNhcnoa2Xz7uHzx4Kh1ghYNjlycHm0dD8nORwYJtPxoqSbiAPSh0zMWKOAop
 b/e5OQRsC8VkbU9yhGdhkFwW3GoxWREV3fyWiWFo/KNbKVnFYegN7qKxMTT6YuqFZL9r
 hlFaYAyiEHo9WeXo8WIvjm/4Ma0wiSoWRo/mvoyPsRcQ1cxRHFc5fYfx6wEqZxQdNyqs
 eW4V0xgSYOzZmgQFwIds8o8eLb2N5UAObYPb3Bj61L39jj8E7BJTNyLfJQFplxXfo7km
 qfTm5FS4R0gwbwJkLb4xyDVadZEtlEeQ8ryQzOYnc9s4z53kkZikeR5SdDamSJW3Jb6p
 DEAQ==
X-Gm-Message-State: AOJu0Yyww4xeaqhNqMURWV0XvokgbBfjxZ7PzMMLwYhRZjqZQXar9cKt
 ULQAE5WMbtr/InIB1P5JGMIbt5AmBskl3biuANkSJTae2aZsgnfG9kZd
X-Gm-Gg: AZuq6aJ1SRLWmTySHu7eu9BFruV6+jhsNkjQj+mZ4IzJZ21Y+YCqNUlX7+hQG1yE/7w
 oaWyFHObmVB2Z1UrcN0gQcPwI8v+BDaiWMtjpvd7mBCw1e6ZgbPrSwWMce9dY78uiQvfhLHz+72
 0T41C1Y5QPiFU0VS4oqf33Gg9+dFaPNMgqtifLD98AzejGv9MPSceo7E0qh7nJTsEX3/vNAXHed
 NiDHx80Rp2zL1QOjMhKw9gKvCipKU+TMZuev4FXjFy5cjWIyNQgubOZwg8joWVFUclEPpAy9los
 ey6iJMCjgLgq2HQqsaGwQ7mlPi5Hhtnm74gmMKet42TMGY0nHlMN40c4qMG/ZJxvr6cguWNg7UF
 XSiQ+kCOZSBCdpyG+UoAfZxkcPVb0f79gwKsFsrpysis1PcjNbj2IYO7LVNnqjK+qa6Y+4ROsyr
 /gZiwbYxBBPC/CbdxNSw9cqSAQ7HgO7yhIQGFMQy6xYGDDq9/xN5EY9Q==
X-Received: by 2002:a05:6000:3110:b0:432:59d4:f54a with SMTP id
 ffacd0b85a97d-435c9d289c5mr10406397f8f.30.1769449418770; 
 Mon, 26 Jan 2026 09:43:38 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:38 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 15/27] hw/core/fdt_generic_util: Connect device irqs
Date: Mon, 26 Jan 2026 18:43:01 +0100
Message-ID: <20260126174313.1418150-16-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

The patch implements IRQ wiring logic for fdt created
devices.

The wiring performed in two stages. As devices are
created, their IRQs saved in the list.
After all devices processed, fdt_init_all_irqs() goes
through all IRQs and does actual wiring. For IRQs
which have multiple source, shared IRQ handler
allocated.

For interrupt controllers with auto_parent callback
implemented and their fdt node has 'interrupt and
'interrupts-extended' properties empty,
the auto_parent() will be called to connect them
to their interrupt-parent, for example to CPUs.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c    | 146 +++++++++++++++++++++++++++++++++-
 include/hw/core/fdt_generic.h |  12 +++
 2 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index af20ffd9db..2f49909a50 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -76,6 +76,88 @@ static void fdt_get_irq_info_from_intc(FDTMachineInfo *fdti, qemu_irq *ret,
                                        uint32_t *cells, uint32_t num_cells,
                                        uint32_t max, Error **errp);
 
+typedef struct QEMUIRQSharedState {
+    qemu_irq sink;
+    int num;
+    bool (*merge_fn)(bool *, int);
+/* FIXME: remove artificial limit */
+#define MAX_IRQ_SHARED_INPUTS 256
+    bool inputs[MAX_IRQ_SHARED_INPUTS];
+} QEMUIRQSharedState;
+
+static bool qemu_irq_shared_or_handler(bool *inputs, int n)
+{
+    int i;
+
+    assert(n < MAX_IRQ_SHARED_INPUTS);
+
+    for (i = 0; i < n; ++i) {
+        if (inputs[i]) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static void qemu_irq_shared_handler(void *opaque, int n, int level)
+{
+    QEMUIRQSharedState *s = opaque;
+
+    assert(n < MAX_IRQ_SHARED_INPUTS);
+    s->inputs[n] = level;
+    qemu_set_irq(s->sink, s->merge_fn(s->inputs, s->num));
+}
+
+static void fdt_init_all_irqs(FDTMachineInfo *fdti)
+{
+    while (fdti->irqs) {
+        FDTIRQConnection *first = fdti->irqs;
+        qemu_irq sink = first->irq;
+        bool (*merge_fn)(bool *, int) = first->merge_fn;
+        int num_sources = 0;
+        FDTIRQConnection *irq;
+
+        for (irq = first; irq; irq = irq->next) {
+            if (irq->irq == sink) { /* Same sink */
+                num_sources++;
+            }
+        }
+        if (num_sources > 1) {
+            QEMUIRQSharedState *s = g_malloc0(sizeof *s);
+            s->sink = sink;
+            s->merge_fn = merge_fn;
+            qemu_irq *sources = qemu_allocate_irqs(qemu_irq_shared_handler, s,
+                                                   num_sources);
+            for (irq = first; irq; irq = irq->next) {
+                if (irq->irq == sink) {
+                    char *shared_irq_name = g_strdup_printf("shared-irq-%p",
+                                                            *sources);
+
+                    if (irq->merge_fn != merge_fn) {
+                        fprintf(stderr, "ERROR: inconsistent IRQ merge fns\n");
+                        exit(1);
+                    }
+
+                    object_property_add_child(OBJECT(irq->dev), shared_irq_name,
+                                              OBJECT(*sources));
+                    g_free(shared_irq_name);
+                    irq->irq = *(sources++);
+                    s->num++;
+                }
+            }
+        }
+        DB_PRINT(0, "%s: connected to %s irq line %d (%s)\n",
+                 first->sink_info ? first->sink_info : "",
+                 object_get_canonical_path(OBJECT(first->dev)),
+                 first->i, first->name ? first->name : "");
+
+        qdev_connect_gpio_out_named(DEVICE(first->dev), first->name, first->i,
+                                    first->irq);
+        fdti->irqs = first->next;
+        g_free(first);
+    }
+}
+
 FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
 {
     char node_path[DT_PATH_LENGTH];
@@ -91,6 +173,7 @@ FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
         while (qemu_co_enter_next(fdti->cq, NULL)) {
             ;
         }
+        fdt_init_all_irqs(fdti);
         memory_region_transaction_commit();
     } else {
         fprintf(stderr, "FDT: ERROR: cannot get root node from device tree %s\n"
@@ -908,8 +991,9 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
 {
     Object *dev, *parent;
     char *dev_type = NULL;
+    int is_intc;
     Error *errp = NULL;
-    int i;
+    int i, j;
     QEMUDevtreeProp *prop, *props;
     char parent_node_path[DT_PATH_LENGTH];
 
@@ -1125,6 +1209,66 @@ exit_reg_parse:
         }
     }
 
+    if (object_dynamic_cast(dev, TYPE_SYS_BUS_DEVICE)) {
+        {
+            int len;
+            fdt_get_property(fdti->fdt, fdt_path_offset(fdti->fdt, node_path),
+                                    "interrupt-controller", &len);
+            is_intc = len >= 0;
+            DB_PRINT_NP(is_intc ? 0 : 1, "is interrupt controller: %c\n",
+                        is_intc ? 'y' : 'n');
+        }
+        /* connect irq */
+        j = 0;
+        for (i = 0;; i++) {
+            char irq_info[6 * 1024];
+            char *irq_info_p = irq_info;
+            bool map_mode;
+            int len = -1;
+            qemu_irq *irqs = fdt_get_irq_info(fdti, node_path, i, irq_info,
+                                              &map_mode);
+            /* INTCs inferr their top level, if no IRQ connection specified */
+            fdt_get_property(fdti->fdt, fdt_path_offset(fdti->fdt, node_path),
+                             "interrupts-extended", &len);
+            if (!irqs && is_intc && i == 0 && len <= 0) {
+                FDTGenericIntc *id = (FDTGenericIntc *)object_dynamic_cast(
+                                        dev, TYPE_FDT_GENERIC_INTC);
+                FDTGenericIntcClass *idc = FDT_GENERIC_INTC_GET_CLASS(id);
+                if (id && idc->auto_parent) {
+                    Error *err = NULL;
+                    idc->auto_parent(id, &err);
+                } else {
+                    irqs = fdti->irq_base;
+                }
+            }
+            if (!irqs) {
+                break;
+            }
+            while (*irqs) {
+                FDTIRQConnection *irq = g_new0(FDTIRQConnection, 1);
+                *irq = (FDTIRQConnection) {
+                    .dev = DEVICE(dev),
+                    .name = SYSBUS_DEVICE_GPIO_IRQ,
+                    .merge_fn = qemu_irq_shared_or_handler,
+                    .i = j,
+                    .irq = *irqs,
+                    .sink_info = g_strdup(irq_info_p),
+                    .next = fdti->irqs
+                };
+                if (!map_mode) {
+                    j++;
+                } else {
+                    irq_info_p += strlen(irq_info_p) + 1;
+                }
+                fdti->irqs = irq;
+                irqs++;
+            }
+            if (map_mode) {
+                j++;
+            }
+        }
+    }
+
     g_free(dev_type);
 
     return 0;
diff --git a/include/hw/core/fdt_generic.h b/include/hw/core/fdt_generic.h
index 46b7dc084b..ad9e249156 100644
--- a/include/hw/core/fdt_generic.h
+++ b/include/hw/core/fdt_generic.h
@@ -24,6 +24,16 @@ typedef struct FDTCPUCluster {
     bool user;
 } FDTCPUCluster;
 
+typedef struct FDTIRQConnection {
+    DeviceState *dev;
+    const char *name;
+    int i;
+    bool (*merge_fn)(bool *, int);
+    qemu_irq irq;
+    char *sink_info; /* Debug only */
+    void *next;
+} FDTIRQConnection;
+
 typedef struct FDTMachineInfo {
     /* the fdt blob */
     void *fdt;
@@ -33,6 +43,8 @@ typedef struct FDTMachineInfo {
     FDTDevOpaque *dev_opaques;
     /* recheck coroutine queue */
     CoQueue *cq;
+    /* list of all IRQ connections */
+    FDTIRQConnection *irqs;
     /* list of all CPU clusters */
     FDTCPUCluster *clusters;
 } FDTMachineInfo;
-- 
2.43.0


