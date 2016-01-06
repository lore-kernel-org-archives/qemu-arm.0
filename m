Received: by 10.182.158.201 with SMTP id ww9csp9862obb;
        Wed, 6 Jan 2016 07:13:38 -0800 (PST)
X-Received: by 10.28.223.134 with SMTP id w128mr10245158wmg.69.1452093218621;
        Wed, 06 Jan 2016 07:13:38 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id uw9si160225562wjc.111.2016.01.06.07.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x235.google.com with SMTP id f206so79948854wmf.0
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G4wtzBGKt0sgkUY9t0zO/WgHhsN814VNsOaobTJyRRA=;
        b=UosQEXd+At5rZppMBQe2JnwZR7ltr+g070QOCWFu7YIgYkYYGNI9T0lYe2cjqoyTZU
         xqHZP3mDHvP0kpQMMRhMEBMgYFrN5JwhCSvhw1VQwhzJL36Sb8BTjDH3trW2CG2cKoNJ
         2+4eFXZzysLt9A3E04Mu5+XJhY6VQNRohbIEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G4wtzBGKt0sgkUY9t0zO/WgHhsN814VNsOaobTJyRRA=;
        b=b0xan5sRuGgWkv01spJjmNFkQfPct+5/WZh/IQZ/8GoEErnM8HkpQhs+KcmX4yJB5P
         0FlQhEw8jv6FM/dltLJBTnlDpXi3Y761lgk9ZAEda2r0Wh1teAaAQwLjiOXsGAoUQKdr
         O0dhjYFnxo05MXo2axtOd7eoE8ll8FaqhFhiTMG6fF2WpLuNtxYn9DRyDGILTnNcWjTz
         aHC6vy7exPBYuPsEZxHerTr++7i10HM/tmunyMRLgsCU8bUGsnYxax+1L7blVRdfbg2l
         9UVFOS3sOl5Ks1JhKHPOAYn27xq2mVsectQlrnBATFAjL2qQ8ZPibwD453/U3i7grzcb
         pSQA==
X-Gm-Message-State: ALoCoQnLaYQAWB/awPrP82+ZKKEVzI1kVE2ImaLpXs98FQR3IuwFTFIGUIlCysB2+yIAi8KZDdGXhQJ1K8zu6sHMti+/GmWu4w==
X-Received: by 10.28.90.67 with SMTP id o64mr10160327wmb.38.1452093218340;
        Wed, 06 Jan 2016 07:13:38 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:36 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v2 5/7] hw/arm/sysbus-fdt: helpers for clock node generation
Date: Wed,  6 Jan 2016 15:13:23 +0000
Message-Id: <1452093205-30167-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-TUID: yla2WQMGWdsj

Some passthrough'ed devices depend on clock nodes. Those need to be
generated in the guest device tree. This patch introduces some helpers
to build a clock node from information retrieved in the host device tree.

- inherit_properties copies properties from a host device tree node to
  a guest device tree node
- fdt_build_clock_node builds a guest clock node and checks the host
  fellow clock is a fixed one.

fdt_build_clock_node will become static as soon as it gets used. A
dummy pre-declaration is needed for compilation of this patch.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v1 -> v2:
- inherit properties now outputs an error message in case
  qemu_fdt_getprop fails for an existing optional property
- no hardcoded fixed buffer length
- fdt_build_clock_node becomes void and auto-asserts on error
- use boolean values when defining the clock properties

RFC -> v1:
- use the new proto of qemu_fdt_getprop
- remove newline in error_report
- fix some style issues
---
 hw/arm/sysbus-fdt.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 9d28797..a1cf57b 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <libfdt.h>
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -56,6 +57,125 @@ typedef struct NodeCreationPair {
     int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
 } NodeCreationPair;
 
+/* helpers */
+
+typedef struct HostProperty {
+    const char *name;
+    bool optional;
+} HostProperty;
+
+/**
+ * inherit_properties
+ *
+ * copies properties listed in an array from host device tree to
+ * guest device tree. If a non optional property is not found, the
+ * function self-asserts. An optional property is ignored if not found
+ * in the host device tree.
+ * @props: array of HostProperty to copy
+ * @nb_props: number of properties in the array
+ * @host_dt: host device tree blob
+ * @guest_dt: guest device tree blob
+ * @node_path: host dt node path where the property is supposed to be
+              found
+ * @nodename: guest node name the properties should be added to
+ */
+static void inherit_properties(HostProperty *props, int nb_props,
+                               void *host_fdt, void *guest_fdt,
+                               char *node_path, char *nodename)
+{
+    int i, prop_len;
+    const void *r;
+    Error *err = NULL;
+
+    for (i = 0; i < nb_props; i++) {
+        r = qemu_fdt_getprop(host_fdt, node_path,
+                             props[i].name,
+                             &prop_len,
+                             props[i].optional ? &err : &error_fatal);
+        if (r) {
+            qemu_fdt_setprop(guest_fdt, nodename,
+                             props[i].name, r, prop_len);
+        } else {
+            if (prop_len != -FDT_ERR_NOTFOUND) {
+                /* optional property not returned although property exists */
+                error_report_err(err);
+            } else {
+                error_free(err);
+            }
+        }
+    }
+}
+
+/* clock properties whose values are copied/pasted from host */
+static HostProperty clock_inherited_properties[] = {
+    {"compatible", false},
+    {"#clock-cells", false},
+    {"clock-frequency", true},
+    {"clock-output-names", true},
+};
+
+/**
+ * fdt_build_clock_node
+ *
+ * Build a guest clock node, used as a dependency from a passthrough'ed
+ * device. Most information are retrieved from the host clock node.
+ * Also check the host clock is a fixed one.
+ *
+ * @host_fdt: host device tree blob from which info are retrieved
+ * @guest_fdt: guest device tree blob where the clock node is added
+ * @host_phandle: phandle of the clock in host device tree
+ * @guest_phandle: phandle to assign to the guest node
+ */
+void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+                         uint32_t host_phandle,
+                         uint32_t guest_phandle);
+void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+                         uint32_t host_phandle,
+                         uint32_t guest_phandle)
+{
+    char *node_path = NULL;
+    char *nodename;
+    const void *r;
+    int ret, node_offset, prop_len, path_len = 16;
+
+    node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
+    if (node_offset <= 0) {
+        error_setg(&error_fatal,
+                   "not able to locate clock handle %d in host device tree",
+                   host_phandle);
+    }
+    node_path = g_malloc(path_len);
+    while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
+            == -FDT_ERR_NOSPACE) {
+        path_len += 16;
+        node_path = g_realloc(node_path, path_len);
+    }
+    if (ret < 0) {
+        error_setg(&error_fatal,
+                   "not able to retrieve node path for clock handle %d",
+                   host_phandle);
+    }
+
+    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
+                         &error_fatal);
+    if (strcmp(r, "fixed-clock")) {
+        error_setg(&error_fatal,
+                   "clock handle %d is not a fixed clock", host_phandle);
+    }
+
+    nodename = strrchr(node_path, '/');
+    qemu_fdt_add_subnode(guest_fdt, nodename);
+
+    inherit_properties(clock_inherited_properties,
+                       ARRAY_SIZE(clock_inherited_properties),
+                       host_fdt, guest_fdt,
+                       node_path, nodename);
+
+    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
+
+    g_free(node_path);
+}
+
 /* Device Specific Code */
 
 /**
-- 
1.9.1
