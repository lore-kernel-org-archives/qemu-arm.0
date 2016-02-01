Received: by 10.25.159.19 with SMTP id i19csp69187lfe;
        Mon, 1 Feb 2016 05:52:21 -0800 (PST)
X-Received: by 10.28.35.14 with SMTP id j14mr12391841wmj.80.1454334741446;
        Mon, 01 Feb 2016 05:52:21 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id i7si15096762wmf.59.2016.02.01.05.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x233.google.com with SMTP id 128so72022857wmz.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XcDh3pGLgOXcdLT7gGg9rHtww+ZqF6PesCBzXvXBAFk=;
        b=Cl/XDfD8Pgq23tNXW5O4cLAM6Qkx0GbbuPgllPfZx2ZCyEWpTR8Rbm9kgUOkIBSn0P
         LfMguK41ug1p2lROZw90sZ5n66jc1sgW1NtqF124sOQ2u8Tn5NEwmEToS7JDIbcI7aXv
         IOIDK5YIjb58hVtnof6qJLlOPLsiKaggWqayg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XcDh3pGLgOXcdLT7gGg9rHtww+ZqF6PesCBzXvXBAFk=;
        b=Z/Tzm5PXtvUqMwzyesrZwfDBgx919WHGL/4QuLDeOltOJSU8N7KRhlu5VIKoKpbJZG
         q1ptdXSmvL6uWfZQVFBRdO0u1BcqCh73w3CJQSXZbf88Q+5PTiRFw2a5FjL0dC94Qxq8
         JAP7XzGXrnmq0B1PK7rEy3gKdKky+OBL+3KyR1ynetsY8ilXl1+YLbIQ8us4lxWPQSc0
         7zYPwkiiI3acLYCaStC/JSW3EAORrk77VDcakjpIrpPnqGiGdSKg4ln1rPDLgqMLpRGc
         qfg5JXy5Rd8GNZweSwd/cLndltio9gxc5/LuZqiF42djRbMKK0kFqRMr/CXkQlrrSKCe
         EfNQ==
X-Gm-Message-State: AG10YOTDEfFqKVk1NCGmIiBikLsp1XUlSek6qHU27tmb0ifBJcWIdbhrxOqz1rPC0UPrVPxHXMg=
X-Received: by 10.28.229.201 with SMTP id c192mr12185124wmh.103.1454334741235;
        Mon, 01 Feb 2016 05:52:21 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:19 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.williamson@redhat.com,
	david@gibson.dropbear.id.au
Cc: christoffer.dall@linaro.org,
	suravee.suthikulpanit@amd.com,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	thomas.lendacky@amd.com
Subject: [PATCH v6 6/8] hw/arm/sysbus-fdt: helpers for clock node generation
Date: Mon,  1 Feb 2016 13:51:50 +0000
Message-Id: <1454334712-12360-7-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: VReklMCN7WuA

Some passthrough'ed devices depend on clock nodes. Those need to be
generated in the guest device tree. This patch introduces some helpers
to build a clock node from information retrieved in the host device tree.

- copy_properties_from_host copies properties from a host device tree
  node to a guest device tree node
- fdt_build_clock_node builds a guest clock node and checks the host
  fellow clock is a fixed one.

fdt_build_clock_node will become static as soon as it gets used. A
dummy pre-declaration is needed for compilation of this patch.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v5 -> v6:
- replace self-asserts
- add Peter's R-b

v4 -> v5:
- renamed inherit_properties

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

Conflicts:
	hw/arm/sysbus-fdt.c
---
 hw/arm/sysbus-fdt.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 68a3de5..8575cfe 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <libfdt.h>
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -57,6 +58,125 @@ typedef struct NodeCreationPair {
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
+ * copy_properties_from_host
+ *
+ * copies properties listed in an array from host device tree to
+ * guest device tree. If a non optional property is not found, the
+ * function asserts. An optional property is ignored if not found
+ * in the host device tree.
+ * @props: array of HostProperty to copy
+ * @nb_props: number of properties in the array
+ * @host_dt: host device tree blob
+ * @guest_dt: guest device tree blob
+ * @node_path: host dt node path where the property is supposed to be
+              found
+ * @nodename: guest node name the properties should be added to
+ */
+static void copy_properties_from_host(HostProperty *props, int nb_props,
+                                      void *host_fdt, void *guest_fdt,
+                                      char *node_path, char *nodename)
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
+static HostProperty clock_copied_properties[] = {
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
+    copy_properties_from_host(clock_copied_properties,
+                              ARRAY_SIZE(clock_copied_properties),
+                              host_fdt, guest_fdt,
+                              node_path, nodename);
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
