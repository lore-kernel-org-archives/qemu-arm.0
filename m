Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E86D6AB10
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:57:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q2L-0008LV-D1; Thu, 02 Apr 2026 17:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2C-0008KI-E0
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:04 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2A-00076p-Ha
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so216968366b.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167021; x=1775771821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvbFky2zZfy6uWbutZgX2420LHSIwSgmweRO7s9n4J0=;
 b=imBtiMBTvEe6pleliwXgPhkyV1IOv/ClelSRewE6e0Qy4szFUBpdES+KYN9gmeaNg6
 yY7YbulxREdkD4ObUSeDzP6ABZch50UqbknJmaEZgTSIesZA+Anlmgvv4YWHf1CCliw/
 m9Qg9uWjMgG5g5ZqJ1BV/sNTMcGFUvFtnasaesgS+YvLi0h8RE/WPVr0MtnSguqE+CMV
 yoOsKUOZPU8MAaEsP/4d9vwYXPcD/A8r6b3GcJ/GvfD9C2qdmVUVIyC1KIjiODSbzX3e
 /WJoShwGu1OdYeO9JKR4goe0xagFWJPmrki6cfJ+kbbSB5PXtrt29/nsvqhkxWNUq5PT
 vwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167021; x=1775771821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JvbFky2zZfy6uWbutZgX2420LHSIwSgmweRO7s9n4J0=;
 b=el/iOtjjR1hWwsqZ5MA8UpnpesGOIffnipaAcLjqTxHu6sOedvPkByrivRw7RBEXFt
 r8rW+13v62NvENqATZC8c0CWtfsQY/iy6T+IWjHFYKYktfQVMxwGpXvf5DgoGz4n0AP1
 YGeUwl7QdjoNzeQqKEPHK4lg8gkq94MoyAcVFqUl+rg1BABCym451yuCdAbpC+KQWSsl
 IR0vhoXgbISQESlYBXrwxUlJ4sKkzayrm63OzCODKiedo/sxx0NDyrtwbO2712H9YUHH
 cHfMyp4Swx6s6Vs+DGybsICbybzzHVEBDA+zYe16JExKCId3fLcu1kf5vU8mqeCOhgUu
 uyiA==
X-Gm-Message-State: AOJu0YzB5COarMZsIIlVginoXxpxV4O3l+2XzU3qjB7+BescWssQ2Ntk
 g7DSdWeS+BYBTQBmnJjFJuC0HZJ9Ssf1m5Bs7zByDMlePZdh5FKgMn5E
X-Gm-Gg: ATEYQzx7/1GdhcvBMkT/i/phhRCikJxdzFZaGQFV7wBI9GG5XZmDiDmGE9nJ1qPM0KY
 oUFlgiw1905gi2CuFmQmPeYOQyXlMJBrDaV4dKDH+MXkot0yeNEfL9IskJS9PfG9rxScbVHVovb
 HoLwiulOilrE76bLR91Yls5CX97St1YM4lBZEpLIWN7ZQ4X4DoVzCI2F4kiXHMof9fUgy7Y+FqD
 F9t+HWt7j9j+1t3CdeU3FyhMrpANk7mv+PXJ+v3k7XWDObMb7CgF5ebmEUnF56I+3Z5Xsz/Q9lC
 xOmII6cFue6pgqhjVk1o0kZ9gHFnBf7peI6N11uXGPnCOak3q34l8GJcgbn5YxhZm9KTw4PeSVB
 AA8b/E1x2JgkbemFEOZG7JQ4AX8nPgjd+wTUeP+yjlY94I/Gzv4/gv+kGCvL/2wxhaUbttItcm+
 4iACGudyEQAUDmMFaOlkhU3rxIKntPu1zRri15ayZJp2NLBxfQRJpocoqGFRU7QYvXLFjmeQ==
X-Received: by 2002:a17:907:894f:b0:b98:5648:e68a with SMTP id
 a640c23a62f3a-b9c679b35d8mr25738366b.36.1775167020939; 
 Thu, 02 Apr 2026 14:57:00 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:00 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 11/33] hw/core/fdt_generic_util: initilize qdev properties
 from fdt
Date: Thu,  2 Apr 2026 23:55:56 +0200
Message-ID: <20260402215629.745866-12-ruslichenko.r@gmail.com>
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

The patch adds possibility to read and parse device tree
node properties and set them to newly created object.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 236 +++++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 565f577238..6f0a1e1e4b 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -41,7 +41,9 @@
 #include "qemu/config-file.h"
 #include "hw/core/boards.h"
 #include "qemu/option.h"
+#include "hw/core/qdev-properties.h"
 #include "hw/cpu/cluster.h"
+#include "qobject/qlist.h"
 
 #define fdt_debug(...) do { \
     qemu_log_mask(LOG_FDT, ": %s: ", __func__); \
@@ -250,6 +252,238 @@ static Object *fdt_create_from_compat(const char *compat)
     return ret;
 }
 
+/*FIXME: roll into device tree functionality */
+
+static inline uint64_t get_int_be(const void *p, int len)
+{
+    switch (len) {
+    case 1:
+        return *((uint8_t *)p);
+    case 2:
+        return be16_to_cpu(*((uint16_t *)p));
+    case 4:
+        return be32_to_cpu(*((uint32_t *)p));
+    case 8:
+        return be32_to_cpu(*((uint64_t *)p));
+    default:
+        fprintf(stderr, "unsupported integer length\n");
+        abort();
+    }
+}
+
+static void fdt_init_qdev_link_prop(Object *obj, ObjectProperty *p,
+                                    FDTMachineInfo *fdti,
+                                    const char *node_path,
+                                    const char *propname, const void* val,
+                                    int len)
+{
+    Object *linked_dev;
+    char target_node_path[DT_PATH_LENGTH];
+    Error *errp = NULL;
+
+    if (qemu_devtree_get_node_by_phandle(fdti->fdt, target_node_path,
+                                         get_int_be(val, len))) {
+        error_report("FDT: Invalid phandle in property '%s' of node '%s'",
+                     propname, node_path);
+        return;
+    }
+
+    while (!fdt_init_has_opaque(fdti, target_node_path)) {
+        fdt_init_yield(fdti);
+    }
+
+    linked_dev = fdt_init_get_opaque(fdti, target_node_path);
+
+    object_property_set_link(obj, propname, linked_dev, &errp);
+    if (!errp) {
+        fdt_debug_np("set link %s\n", propname);
+        return;
+    }
+
+    error_free(errp);
+    errp = NULL;
+
+    if (object_dynamic_cast(linked_dev, TYPE_DEVICE)) {
+        BusState *child_bus;
+
+        /* Check if target has a child bus that satisfies the link type */
+        QLIST_FOREACH(child_bus, &DEVICE(linked_dev)->child_bus, sibling) {
+            object_property_set_link(obj, propname, OBJECT(child_bus), &errp);
+            if (!errp) {
+                fdt_debug_np("found matching bus link %s\n",
+                                child_bus->name);
+                return;
+            }
+
+            error_free(errp);
+            errp = NULL;
+        }
+    }
+
+    fdt_debug_np("failed to set link %s\n", propname);
+}
+
+static void fdt_init_qdev_scalar_prop(Object *obj, ObjectProperty *p,
+                                      FDTMachineInfo *fdti,
+                                      const char *node_path,
+                                      const char *propname, const void* val,
+                                      int len)
+{
+
+    /* FIXME: handle generically using accessors and stuff */
+    if (!strncmp(p->type, "link", 4)) {
+        fdt_init_qdev_link_prop(obj, p, fdti, node_path, propname, val, len);
+        return;
+    }
+
+    if (!strcmp(p->type, "uint8") || !strcmp(p->type, "uint16") ||
+        !strcmp(p->type, "uint32") || !strcmp(p->type, "uint64") ||
+        !strcmp(p->type, "int8") || !strcmp(p->type, "int16") ||
+        !strcmp(p->type, "int32") || !strcmp(p->type, "int64")) {
+        object_property_set_int(obj, propname,
+                                get_int_be(val, len), &error_abort);
+        fdt_debug_np("set property %s to 0x%llx\n", propname,
+                    (unsigned long long)get_int_be(val, len));
+        return;
+    }
+
+    if (!strcmp(p->type, "boolean") || !strcmp(p->type, "bool")) {
+        object_property_set_bool(obj, propname,
+                                 !!get_int_be(val, len), &error_abort);
+        fdt_debug_np("set property %s to %s\n", propname,
+                    get_int_be(val, len) ? "true" : "false");
+        return;
+    }
+
+    if (!strcmp(p->type, "string") || !strcmp(p->type, "str")) {
+        object_property_set_str(obj, propname,
+                                (const char *)val, &error_abort);
+        fdt_debug_np("set property %s to %s\n", propname, (const char *)val);
+        return;
+    }
+
+    fdt_debug_np("WARNING: property is of unknown type\n");
+}
+
+static size_t fdt_array_elem_len(FDTMachineInfo *fdti,
+                                 const char *node_path,
+                                 const char *propname)
+{
+    g_autofree char *elem_cells_propname = NULL;
+    Error *err = NULL;
+    uint32_t elem_cells;
+
+    /*
+     * Default element size to 1 uint32_t cell, unless it is explicitly
+     * given in the same FDT node (not inherited).
+     */
+    elem_cells_propname = g_strconcat("#", propname, "-cells", NULL);
+    elem_cells = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                       elem_cells_propname, 0, &err);
+
+    return (err ? 1 : elem_cells) * 4;
+}
+
+static void fdt_init_qdev_array_prop(Object *obj,
+                                     FDTMachineInfo *fdti,
+                                     const char *node_path,
+                                     const char *propname,
+                                     const void *value,
+                                     int len)
+{
+    int nr = len;
+    uint32_t elem_len;
+    QList *qlist = qlist_new();
+    const char *prop_type;
+    const void *prop_value = value;
+
+    if (!value || !nr) {
+        return;
+    }
+
+    elem_len = fdt_array_elem_len(fdti, node_path, propname);
+    if (nr % elem_len) {
+        return;
+    }
+
+    nr /= elem_len;
+
+    prop_type = qdev_prop_get_array_elem_type(DEVICE(obj), propname);
+    if (!prop_type) {
+        fdt_debug_np("fail to get property array elem type\n");
+        return;
+    }
+
+    while (nr--) {
+        if (!strcmp(prop_type, "uint8") || !strcmp(prop_type, "uint16") ||
+            !strcmp(prop_type, "uint32") || !strcmp(prop_type, "uint64") ||
+            !strcmp(prop_type, "int8") || !strcmp(prop_type, "int16") ||
+            !strcmp(prop_type, "int32") || !strcmp(prop_type, "int64")) {
+                qlist_append_int(qlist, get_int_be(prop_value, elem_len));
+        } else if (!strcmp(prop_type, "boolean") ||
+                                            !strcmp(prop_type, "bool")) {
+            qlist_append_bool(qlist, !!get_int_be(prop_value, elem_len));
+        } else if (!strcmp(prop_type, "string") || !strcmp(prop_type, "str")) {
+            qlist_append_str(qlist, (const char *)prop_value);
+        }
+
+        prop_value += elem_len;
+
+        /* TBD: add link type support */
+    }
+
+    qdev_prop_set_array(DEVICE(obj), propname, qlist);
+    fdt_debug_np("set property %s propname to <list>\n", propname);
+}
+
+static void fdt_init_qdev_properties(char *node_path, FDTMachineInfo *fdti,
+                                     Object *dev)
+{
+    int node_offset, prop_offset;
+
+    node_offset = fdt_path_offset(fdti->fdt, node_path);
+    if (node_offset < 0) {
+        return;
+    }
+
+    fdt_for_each_property_offset(prop_offset, fdti->fdt, node_offset) {
+        const char *fdt_propname;
+        const void *value;
+        const char *propname;
+        int len;
+        ObjectProperty *p = NULL;
+
+        value = fdt_getprop_by_offset(fdti->fdt, prop_offset,
+                               &fdt_propname, &len);
+        if (!value) {
+            continue;
+        }
+
+        propname = trim_vendor(fdt_propname);
+
+        p = object_property_find(dev, propname);
+        if (p) {
+            fdt_debug_np("matched property: %s of type %s, len %d\n",
+                                            propname, p->type, len);
+        }
+        if (!p) {
+            continue;
+        }
+
+        if (!strcmp(p->type, "list")) {
+            fdt_init_qdev_array_prop(dev, fdti, node_path,
+                                     propname, value, len);
+        }
+
+        if (!strcmp(propname, "type")) {
+            continue;
+        }
+
+        fdt_init_qdev_scalar_prop(dev, p, fdti, node_path,
+                                  propname, value, len);
+    }
+}
+
 static void fdt_init_parent_node(Object *dev, Object *parent, char *node_path)
 {
     if (dev->parent) {
@@ -346,6 +580,8 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
 
     fdt_init_set_opaque(fdti, node_path, dev);
 
+    fdt_init_qdev_properties(node_path, fdti, dev);
+
     g_free(parent_node_path);
 
     return 0;
-- 
2.43.0


