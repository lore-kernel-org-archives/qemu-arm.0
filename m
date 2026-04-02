Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A49D6AB16
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 22:01:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q21-0008Ds-7N; Thu, 02 Apr 2026 17:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q20-0008Di-QK
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q1z-00073c-5A
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:52 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b980b35534eso410843166b.1
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167010; x=1775771810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etfciyFx/DN7OMzbyp+X0A8fa1no60agscIjAwvrx08=;
 b=dxx55HgPvEnRDTqUZ5mKfQIKV72sExb/WL+0Vm+x9yAIAA3h7fUciYVESp/zt/rToc
 hifgj8fjU1DGfaPF7QdeD1PlbqZGFrQ/URuPEhqOdolGyLnXgzXLRM/vpMRhaLLOrtIW
 +3s1lNpe/ESRmqyzANZQacUl1CSQ1yayJaASMOiggSUScf5xIqi6fJBTnurQbOubaM5O
 y+WkMvQKdXNzo9R6KRwGWL1go+bxIqRetvFtds6iPdnKNNvfK0mjUwerYQ2KQUI4Q/pJ
 hcBIxENikIwNT3AuN6mNeP/Mui71fehX5ZybTewnE8a8pyJm2GGDY16nOqFX4Yw2cac9
 hiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167010; x=1775771810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=etfciyFx/DN7OMzbyp+X0A8fa1no60agscIjAwvrx08=;
 b=sHtS0Qv3TpZeSO+Ef0VJLfCp7I1NERHbfes2tG5YWe7s8tar1PZ/xzDtkOKwlHd5Hf
 zjdGlgVXgCQyZnyyVIpHCTih1+H0eibl3+QSaOrNddqba5u86xHM9CHuZHVtqT8KkQhP
 VVfJLUQyXRXTob0cWxG/0a/HWOXg4+IxeONmNNILl9fY90jOy8SgnOk6Vbo4T/ARx9+1
 F4Ky6AVWFQx0sPrjZec6nBv0qOPAXYgWGozVff0/rOK4OJEUrDGVyZEdY9Z1dzZePXCR
 bRbc3rxmd18jhppmaib8mf1ESr+QR+05FddktrSVT5xbf4+0HApuceinX9TrDvlXoiBO
 n4lA==
X-Gm-Message-State: AOJu0YyrQBLcnHo3uOCkKLbla2FGjYesV1D5kmFqDl0HMQ4eEt3+vsvG
 zCXoYyd3I4QcD4KQZ+DPsUc8n7inADPajeU6h84MQ9P7zTBmaXdf5aQV
X-Gm-Gg: AeBDievyI25HEQx0/2dLHgJkmvdU/S2lXyAq7mjc6y4l5jxm1uWwSJMzXKLbFH/Sn98
 Ma+ePGKWd9A3TyVb31nBZnS7re7Eaw7L+UGD3w/LSo7z4gACiJcu2P9e6lpdr4X6PCX4XSc79rD
 JqYe8yluZGGUIB/6Auo8HRUHxljdWg2LaBKo2O7k3Xgd50GufqDcU4S/ot1LhJTkOQTc7PhUwi+
 iiAVljx6QzGSFQAPwZKhBtMfpw6RRL9NC/bf6lExSgAf5sqV/Q5IgP0aVPvsHwOUbL6sFE1yL7Z
 K6zWoq+zwpkjchjlIosZrqCNr0C8nPaWQi5bnQXVwr0TcnBDzuHhAf8mGNFBeLpv+b5X/NGvPQb
 j6CG8Flghwj6URb05WYrKrJ68ldDRir0OLuphXZ5maXSVAhsi9Ig9wuczER+eeS24E8GbBJbKET
 ZUB1R1UNdB495Wh0FBLNvyx+9aKIsHnCLGlgrqcl8CrMH6xLvgp/vX5CoG45LcHdAt8BrikA==
X-Received: by 2002:a17:907:a0c9:b0:b97:b88c:386b with SMTP id
 a640c23a62f3a-b9c4713ebbcmr232362766b.29.1775167009646; 
 Thu, 02 Apr 2026 14:56:49 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:56:49 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 05/33] hw/core/fdt_generic: implement FDT machine creation
 helpers
Date: Thu,  2 Apr 2026 23:55:50 +0200
Message-ID: <20260402215629.745866-6-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x62e.google.com
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

The patch adds infrastructure to parse device tree
and associate fdt nodes and created objects.

This will be used during instantiating machine from the
devices tree.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic.c         | 71 +++++++++++++++++++++++++++++++++++
 include/hw/core/fdt_generic.h | 42 ++++++++++++++++++++-
 2 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/hw/core/fdt_generic.c b/hw/core/fdt_generic.c
index 65e3c1efa3..da60de7a26 100644
--- a/hw/core/fdt_generic.c
+++ b/hw/core/fdt_generic.c
@@ -29,7 +29,10 @@
 #include "qemu/osdep.h"
 #include "hw/core/fdt_generic.h"
 #include "hw/core/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qemu/coroutine.h"
 #include "qemu/log.h"
+#include "system/reset.h"
 
 
 #define FDT_GENERIC_MAX_PATTERN_LEN 1024
@@ -108,3 +111,71 @@ int fdt_init_inst_bind(char *node_path, FDTMachineInfo *fdti,
 {
     return fdt_init_search_table(node_path, fdti, name, &inst_bind_list_head);
 }
+
+void fdt_init_yield(FDTMachineInfo *fdti)
+{
+    static int yield_index;
+    int this_yield = yield_index++;
+
+    qemu_log_mask(LOG_FDT, "Yield #%d\n", this_yield);
+    qemu_co_queue_wait(fdti->cq, NULL);
+    qemu_log_mask(LOG_FDT, "Unyield #%d\n", this_yield);
+}
+
+void fdt_init_set_opaque(FDTMachineInfo *fdti, const char *node_path,
+                         void *opaque)
+{
+    FDTDevOpaque *dp;
+    for (dp = fdti->dev_opaques;
+        dp->node_path && strcmp(dp->node_path, node_path);
+        dp++)
+        ;
+    if (!dp->node_path) {
+        dp->node_path = strdup(node_path);
+    }
+    dp->opaque = opaque;
+}
+
+int fdt_init_has_opaque(FDTMachineInfo *fdti, const char *node_path)
+{
+    FDTDevOpaque *dp;
+    for (dp = fdti->dev_opaques; dp->node_path; dp++) {
+        if (!strcmp(dp->node_path, node_path)) {
+            return 1;
+         }
+    }
+    return 0;
+}
+
+void *fdt_init_get_opaque(FDTMachineInfo *fdti, const char *node_path)
+{
+    FDTDevOpaque *dp;
+    for (dp = fdti->dev_opaques; dp->node_path; dp++) {
+        if (!strcmp(dp->node_path, node_path)) {
+            return dp->opaque;
+        }
+    }
+    return NULL;
+}
+
+FDTMachineInfo *fdt_init_new_fdti(void *fdt)
+{
+    FDTMachineInfo *fdti = g_malloc0(sizeof(*fdti));
+    fdti->fdt = fdt;
+    fdti->cq = g_malloc0(sizeof(*(fdti->cq)));
+    qemu_co_queue_init(fdti->cq);
+    fdti->dev_opaques = g_malloc0(sizeof(*(fdti->dev_opaques)) *
+        (devtree_get_num_nodes(fdt) + 1));
+    return fdti;
+}
+
+void fdt_init_destroy_fdti(FDTMachineInfo *fdti)
+{
+    FDTDevOpaque *dp;
+
+    for (dp = fdti->dev_opaques; dp->node_path; dp++) {
+        g_free(dp->node_path);
+    }
+    g_free(fdti->dev_opaques);
+    g_free(fdti);
+}
diff --git a/include/hw/core/fdt_generic.h b/include/hw/core/fdt_generic.h
index 3d8ec2f7ff..d204ceda43 100644
--- a/include/hw/core/fdt_generic.h
+++ b/include/hw/core/fdt_generic.h
@@ -9,9 +9,33 @@
 #define FDT_GENERIC_H
 
 #include "qemu/help-texts.h"
+#include "hw/core/irq.h"
 #include "system/device_tree.h"
+#include "qemu/coroutine.h"
+
+typedef struct FDTDevOpaque {
+    char *node_path;
+    void *opaque;
+} FDTDevOpaque;
+
+typedef struct FDTMachineInfo {
+    /* the fdt blob */
+    void *fdt;
+    /* irq descriptors for top level int controller */
+    qemu_irq *irq_base;
+    /* per-device specific opaques */
+    FDTDevOpaque *dev_opaques;
+    /* recheck coroutine queue */
+    CoQueue *cq;
+} FDTMachineInfo;
 
-typedef struct FDTMachineInfo FDTMachineInfo;
+/*
+ * create a new FDTMachineInfo. The client is responsible for setting irq_base.
+ * Client must call fdt_init_destroy_fdti to cleanup
+ */
+
+FDTMachineInfo *fdt_init_new_fdti(void *fdt);
+void fdt_init_destroy_fdti(FDTMachineInfo *fdti);
 
 typedef int (*FDTInitFn)(char *, FDTMachineInfo *, void *);
 
@@ -32,6 +56,22 @@ int fdt_init_compat(char *, FDTMachineInfo *, const char *);
 void add_to_inst_bind_table(FDTInitFn, const char *, void *);
 int fdt_init_inst_bind(char *, FDTMachineInfo *, const char *);
 
+/*
+ * Called from FDTInitFn's to inform the framework that a dependency is
+ * unresolved and the calling context needs to wait for another device to
+ * instantiate first. The calling thread will suspend until a change in state
+ * in the argument fdt machine is detected.
+ */
+
+void fdt_init_yield(FDTMachineInfo *);
+
+/* set, check and get per device opaques. Keyed by fdt node_paths */
+
+void fdt_init_set_opaque(FDTMachineInfo *fdti, const char *node_path,
+                         void *opaque);
+int fdt_init_has_opaque(FDTMachineInfo *fdti, const char *node_path);
+void *fdt_init_get_opaque(FDTMachineInfo *fdti, const char *node_path);
+
 /* statically register a FDTInitFn as being associate with a compatibility */
 
 #define fdt_register_compatibility_opaque(function, compat, n, opaque) \
-- 
2.43.0


