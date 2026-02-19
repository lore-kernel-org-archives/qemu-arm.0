Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E2E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MJ-00041e-Fs; Thu, 19 Feb 2026 09:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Ly-0003lv-3Y
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:15 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lt-00086Z-V3
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so849904f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512597; x=1772117397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqBa/7C3Zm8WB1y+B8Ti6v5cmf7dq6/wP6QhxHVtEQs=;
 b=Aob3jCOBXfSl+s+hgNsVm3YZ37VW4sAetnUXkzmJu513h4zDoQgIl0Ts14KitStEnI
 7OauYDDssrw+AxfnQiuPmHAmQzBDWQew8rnOlo9FuCsLKI6T/2nrRW+2sQaayevx+9AC
 nV4Osa8JNXoNJ04aO0lpZsPJlWQWBJzLrq3Ywi3xFrmX3cRERN53P6vOzSOietagfnaf
 1lHcDn6SSteS4dyjSkb+i5jq7TMqBdL9qdliVYigWRYcau1Jg4ADZxnYRHejQ+Trt1YO
 4kItzVTTaRCwFKl07eg2KxwU0/9lUv3CWciFVvlrvwMzqf+kUNSkiHi7XAe6/bIM9A1y
 yckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512597; x=1772117397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QqBa/7C3Zm8WB1y+B8Ti6v5cmf7dq6/wP6QhxHVtEQs=;
 b=sTnMWi6HyywmxxYIFTJmbpQpnGfrQCqnWaUP7hMIMotuY6kdjAnl29GGBie4bqIKr0
 pLUT9KFOja7+sRx7e61EncSsf0w/BGpGCJRmWkoDCcg3D1KzlJky0/mBdyELPpXYYLPA
 hbEZlZ2WAWfIp/g1fUFIBBqktxYw291oamaLkagw8nOvM/gaCgPDk1nEHHVFytmWBk2+
 Mw2LOJMD6oqSst4Q1pmIdKvCIgKb03v7KaXboZyXBKtvUXnPPn8Iwf9WwJHn80997YY8
 Cpp7eh4LBPFDyl3PPCeov4OCn4ykjXrDdi9WFUNx2CgXb+bXCEtMhqZS1IyJYpYMn+6X
 hpog==
X-Gm-Message-State: AOJu0YzA9wNw7b9DWZVGj2DHT9//DH6LMlsZufvzbdepCEmXp02SwJOE
 ajnn3P8dqpJWuvPl+9i5ISFSXS0f21g7pl1AeSjnM7rLZ9vINRoqI+kO
X-Gm-Gg: AZuq6aKrKTgtwj8AUxpGE2Bppfxd1RJ61GVSmgMh8LXLDZol9m6wBI4aHMDcAuM5a0e
 Wm9dndF16aVKZ1CtUKGMEDvWvew1yh47MRyvI6JtxEPFYkWr3x9jNmFl3oAYFkwYIwa2cOQqbvd
 w7QJFN+0Dj1yhY/s6VWpPJ/EYzYxqiE/Bd0BlKU0yZ5LEs2FBWXsahf5KAFzFvXnQ9Hwdfie/+m
 LZNIdAlfYHjCTCdVXZpzxcuLsyLkwbgBUfm/0fvBbP4mPHbH0aGRNle9X3FK73LlVOr+dPV08+H
 VpuEhpgF2/UeO+nLQDrM1I4zp9yv6XUMm78CiVpGu+a+h2rvKuesBxexfAKRj7FKWqsLCWpCRBF
 qNuhpMEDBu3xqoYCrO9dvMflLpr5nJzvgHrrEMKQtTY0I+ObVITmd79j1EwVSLFLSg+6XAu32ks
 oAQ9u6nyC1v+04u9aq8u6W9Mws30eeBgdaSQKgqlrwBr629IWiUKOP8T6BiteehVOjO743
X-Received: by 2002:a5d:4b09:0:b0:437:6bda:d979 with SMTP id
 ffacd0b85a97d-4396270852bmr2899449f8f.27.1771512597046; 
 Thu, 19 Feb 2026 06:49:57 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:56 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 31/33] hw/core/fdt_generic_util: Add blockdev binding
 support
Date: Thu, 19 Feb 2026 15:48:59 +0100
Message-ID: <20260219144901.3317747-13-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The path add possibility to bind to QEMU block backends
via the blockdev-node-name property.

This enables support for the modern -blockdev command line option.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 82 ++++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 4ed9602d47..68dfeee096 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -75,6 +75,8 @@ static void fdt_get_irq_info_from_intc(FDTMachineInfo *fdti, qemu_irq *ret,
                                        char *intc_node_path,
                                        uint32_t *cells, uint32_t num_cells,
                                        uint32_t max, Error **errp);
+static bool fdt_attach_blockdev(FDTMachineInfo *fdti,
+                                const char *node_path, Object *dev);
 
 typedef struct QEMUIRQSharedState {
     qemu_irq sink;
@@ -241,6 +243,8 @@ FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
     current_machine->smp.cpus = fdt_generic_num_cpus;
     current_machine->smp.max_cpus = fdt_generic_num_cpus;
 
+    bdrv_drain_all();
+
     DB_PRINT(0, "FDT: Device tree scan complete\n");
     return fdti;
 }
@@ -987,6 +991,52 @@ static void fdt_init_qdev_array_prop(Object *obj,
     DB_PRINT_NP(0, "set property %s propname to <list>\n", propname);
 }
 
+/*
+ * Try to attach by matching drive created by '-blockdev node-name=LABEL'
+ * iff the FDT node contains property 'blockdev-node-name=LABEL'.
+ *
+ * Return false unless the given node_path has the property.
+ *
+ * Presence of the property also disables the node from ever attached
+ * to any drive created by the legacy '-drive' QEMU option.
+ *
+ * For more on '-blockdev', see:
+ *   http://events17.linuxfoundation.org/sites/events/files/slides/talk_11.pdf
+ */
+static bool fdt_attach_blockdev(FDTMachineInfo *fdti,
+                                const char *node_path, Object *dev)
+{
+    static const char propname[] = "blockdev-node-name";
+    const char *label;
+
+    /* Inspect FDT node for blockdev-only binding */
+    label = qemu_fdt_getprop(fdti->fdt, node_path, propname,
+                             NULL, NULL);
+
+    /* Skip legacy node */
+    if (!label) {
+        return false;
+    }
+
+    /*
+     * Missing matching bdev is not an error: attachment is optional.
+     *
+     * error_setg() aborts, never returns: 'goto ret' is just sanity.
+     */
+    if (!label[0]) {
+        error_setg(&error_abort, "FDT-node '%s': property '%s' = <empty>",
+                   node_path, propname);
+        return false;
+    }
+
+    if (!bdrv_find_node(label)) {
+        return false;
+    }
+
+    object_property_set_str(OBJECT(dev), "drive", label, NULL);
+    return true;
+}
+
 static void fdt_parse_node_reg_prop(FDTMachineInfo *fdti, char *node_path,
                             Object *dev)
 {
@@ -1173,6 +1223,7 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
     char *dev_type = NULL;
     QEMUDevtreeProp *prop, *props;
     char parent_node_path[DT_PATH_LENGTH];
+    bool defer_realize = false;
 
     if (!compat) {
         return 1;
@@ -1289,6 +1340,11 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
             continue;
         }
 
+        if (!strcmp(propname, "drive")) {
+            defer_realize = true;
+            continue;
+        }
+
         fdt_init_qdev_scalar_prop(OBJECT(dev), p, fdti, node_path, prop);
     }
 
@@ -1307,18 +1363,30 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
              */
             fdt_init_register_user_cpu_cluster(fdti, OBJECT(dev));
         } else {
-            object_property_set_bool(OBJECT(dev), "realized", true,
-                                     &error_fatal);
-            if (dc->legacy_reset) {
-                qemu_register_reset((void (*)(void *))dc->legacy_reset,
-                                    dev);
+            if (defer_realize) {
+                FDTDeferredNode *dnode = g_new0(FDTDeferredNode, 1);
+                *dnode = (FDTDeferredNode) {
+                        .dev = DEVICE(dev),
+                        .node_path = g_strdup(node_path),
+                        .next = fdti->deferred
+                };
+                fdti->deferred = dnode;
+            } else {
+                object_property_set_bool(OBJECT(dev), "realized", true,
+                                        &error_fatal);
+                if (dc->legacy_reset) {
+                    qemu_register_reset((void (*)(void *))dc->legacy_reset,
+                                        dev);
+                }
             }
         }
     }
 
-    fdt_parse_node_reg_prop(fdti, node_path, dev);
+    if (!defer_realize) {
+        fdt_parse_node_reg_prop(fdti, node_path, dev);
 
-    fdt_parse_node_irq_prop(fdti, node_path, dev);
+        fdt_parse_node_irq_prop(fdti, node_path, dev);
+    }
 
     g_free(dev_type);
     g_free(props);
-- 
2.43.0


