Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D317CD6AB16
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q29-0008IW-DM; Thu, 02 Apr 2026 17:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q27-0008Hp-Hc
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:59 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q25-00075I-VI
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:59 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so231447666b.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167016; x=1775771816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY/Psqmc5gYs7mEXOklu9W6iJGvX3f2xns3E+/gt5OY=;
 b=tJWvlBfgwmrT/6bF9jRxdYwlDOGWKMehNzg7cdihLz0+5X++8cXHU3qKZJ39w0v7kT
 6euxrvug/z2vP2v+gD5HXd3CEAovlwlT5z7CwicY7AxjWNKzSLYFSK+qIbymO4/7lGEx
 HSuekU1ZfqamjAHirI7qgKlmQQTEMbR4zHlZgOWBbeScy0ztG4VvYYm19Nx1d2T6r9xt
 oqHdnKG86+TyVbkwkVHsfBt2i1w4wAxMPsiMn70N6oAkjYMCtxUqkXT8Kcz+xwQhYEKi
 4EVyT/GqX2QHCUYIuHik1SVIbX5wJU3tl08cYYLb/4iUNjtt7MHNFPYkgH10jPVh8DPe
 7ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167016; x=1775771816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IY/Psqmc5gYs7mEXOklu9W6iJGvX3f2xns3E+/gt5OY=;
 b=bMM1z7OIPUf7RnCIG34qbxEMmazM6Tcnb8d97yzxPNek4UYjNRJhCH1XPlefNdfgNe
 ak4+l3fKOt0cib+je/HbZnDnPAh9onhcK+oj5GPKT11kxhqDwWcK9df95UHlnfIGR/Ie
 U9wgXq8raUFlXoP6TnQKXEQF86wVcIczBaJwyFNpsD8D1GTWh18WC4fqkyw1i2FUIJdh
 DAMRrE4YkQvR8mRU19lE4tFANVJ4pAXiOEItqDv8zEYBHaCOFYoRzsi3pvpnikJamwzm
 uRYSp9idsZTHSP3RwHRouoMfFQ2JhQz+zf4zmRMO65U/6F7bpNVEn/5jw7VuA37E9pn+
 m0LA==
X-Gm-Message-State: AOJu0YyzD0mkd+A4AyG3LCl0nGq+rlKoRC5X6o55Ein7KoxxvtLE7iPS
 2EHor9yNW/yqy84rBlNLs2UkYvnbUcAot9HeXidsikiJU1REu97zArcQZOZxOF6c
X-Gm-Gg: ATEYQzzHlBYdKuryXiXDkweQqyGyhY+9i4WhZSNdmZyxB6PpaMTcgWPgC6RkeLRDV/E
 CN9TzO0EH1gRu3XOTfEk3g8XBfASWBaER8zYDJPlC2JevZhXZG5lRkuyREFfBWoL7R9uV0P8C1p
 do2KIdHqHzj6wHAzoAOSBtM4s+TG9+1rvp/M0/hMd/i8TkeUR7LJph0XQzONS4yAvUWTby9vT0s
 C/SIAOlR9kNWNbggdAmPQ3++1gjksA1Fv9dJemsHpxoPqOmqVtEmygQT06BJMa0+qNd0u1g7Z3K
 7dQhRYpLY3woz5AI4FlxG/gI7hceUJowYiLDoRUDXb1cbt25lHGuN6w8nT0duDJa1TtHsGqpKaz
 czY5fian2hQRTfjAta5f4bSHN+dwEcmllMH/5eGY30OQYVsoEvRBzmIloQ+vN7W+7cYWRs0nEf5
 NrFKOtjF0o3n9p5kmJMJYjQIq5Azpv5ncg4EAWDv5sqoBC/pas9l/h1/XP/ziYogS8CBN4rwBtE
 q16mQZi
X-Received: by 2002:a17:906:bf49:b0:b98:3b5d:e147 with SMTP id
 a640c23a62f3a-b9c67446620mr30557666b.3.1775167015877; 
 Thu, 02 Apr 2026 14:56:55 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:56:55 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 08/33] hw/core/fdt_generic_util: implement fdt_init_qdev
Date: Thu,  2 Apr 2026 23:55:53 +0200
Message-ID: <20260402215629.745866-9-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x633.google.com
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

Implement main routine to create device object from
compat.

The following steps implemented:

- parse node compatible and device types
- try to create object from compat
- set correct parent based on device tree.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 120 +++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 2f7a3fc3dd..565f577238 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -41,6 +41,7 @@
 #include "qemu/config-file.h"
 #include "hw/core/boards.h"
 #include "qemu/option.h"
+#include "hw/cpu/cluster.h"
 
 #define fdt_debug(...) do { \
     qemu_log_mask(LOG_FDT, ": %s: ", __func__); \
@@ -226,8 +227,127 @@ static int simple_bus_fdt_init(const char *node_path, FDTMachineInfo *fdti)
     return 0;
 }
 
+static inline const char *trim_vendor(const char *s)
+{
+    /* FIXME: be more intelligent */
+    const char *ret = memchr(s, ',', strlen(s));
+    return ret ? ret + 1 : s;
+}
+
+static Object *fdt_create_from_compat(const char *compat)
+{
+    Object *ret = NULL;
+
+    /* Try to create the object */
+    ret = object_new(compat);
+    if (!ret) {
+        const char *no_vendor = trim_vendor(compat);
+
+        if (no_vendor != compat) {
+            return fdt_create_from_compat(no_vendor);
+        }
+    }
+    return ret;
+}
+
+static void fdt_init_parent_node(Object *dev, Object *parent, char *node_path)
+{
+    if (dev->parent) {
+        fdt_debug_np("Node already parented - skipping node\n");
+    } else if (parent) {
+        fdt_debug_np("parenting node\n");
+        object_property_add_child(OBJECT(parent),
+                              strdup(strrchr(node_path, '/') + 1),
+                              OBJECT(dev));
+        if (object_dynamic_cast(dev, TYPE_DEVICE)) {
+            Object *parent_bus = parent;
+            unsigned int depth = 0;
+
+            fdt_debug_np("bus parenting node\n");
+            /* Look for an FDT ancestor that is a Bus.  */
+            while (parent_bus && !object_dynamic_cast(parent_bus, TYPE_BUS)) {
+                /*
+                 * Assert against insanely deep hierarchies which are an
+                 * indication of loops.
+                 */
+                assert(depth < 4096);
+
+                parent_bus = parent_bus->parent;
+                depth++;
+            }
+
+            if (!parent_bus
+                && object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+                /*
+                 * Didn't find any bus. Use the default sysbus one.
+                 * This allows ad-hoc busses belonging to sysbus devices to be
+                 * visible to -device bus=x.
+                 */
+                parent_bus = OBJECT(sysbus_get_default());
+            }
+
+            if (parent_bus) {
+                qdev_set_parent_bus(DEVICE(dev), BUS(parent_bus),
+                                    &error_abort);
+            }
+        }
+    } else {
+        fdt_debug_np("orphaning node\n");
+        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+            qdev_set_parent_bus(DEVICE(dev), BUS(sysbus_get_default()),
+                                &error_abort);
+        }
+
+        /* FIXME: Make this go away (centrally) */
+        object_property_add_child(
+                              object_get_root(),
+                              strrchr(node_path, '/') + 1,
+                              OBJECT(dev));
+    }
+}
+
 static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
 {
+    Object *dev, *parent;
+    char *parent_node_path;
+
+    if (!compat) {
+        return 1;
+    }
+    dev = fdt_create_from_compat(compat);
+    if (!dev) {
+        fdt_debug_np("no match found for %s\n", compat);
+        return 1;
+    }
+    fdt_debug_np("matched compat %s\n", compat);
+
+    /* Do this super early so fdt_generic_num_cpus is correct ASAP */
+    if (object_dynamic_cast(dev, TYPE_CPU)) {
+        fdt_generic_num_cpus++;
+        fdt_debug_np("is a CPU - total so far %d\n", fdt_generic_num_cpus);
+    }
+
+    parent_node_path = qemu_devtree_getparent(fdti->fdt, node_path);
+    if (!parent_node_path) {
+        abort();
+    }
+    while (!fdt_init_has_opaque(fdti, parent_node_path) &&
+           !object_dynamic_cast(dev, TYPE_CPU)) {
+        fdt_init_yield(fdti);
+    }
+
+    parent = fdt_init_get_opaque(fdti, parent_node_path);
+
+    if (object_dynamic_cast(dev, TYPE_CPU)) {
+        parent = fdt_init_get_cpu_cluster(fdti, parent, compat);
+    }
+
+    fdt_init_parent_node(dev, parent, node_path);
+
+    fdt_init_set_opaque(fdti, node_path, dev);
+
+    g_free(parent_node_path);
+
     return 0;
 }
 
-- 
2.43.0


