Received: by 10.25.134.130 with SMTP id i124csp325925lfd;
        Fri, 8 Jan 2016 01:32:28 -0800 (PST)
X-Received: by 10.28.15.210 with SMTP id 201mr20596655wmp.79.1452245548227;
        Fri, 08 Jan 2016 01:32:28 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id t2si173361868wjx.60.2016.01.08.01.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id f206so127782765wmf.0
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G4wtzBGKt0sgkUY9t0zO/WgHhsN814VNsOaobTJyRRA=;
        b=BNpsIVNaTyFV/iehASYXeJdZAXysBOXxfn2xrLJwg7RJEyf9sGebfpVA/qX8wtbitf
         uE2lOpiiQOqWea8BtWnCwb6AxntJbTku5u4jCU+8K30aPFPwELuYzD7/Fio3mYGlIxad
         T1mebvU+f3VLU6EwH3z4W4jXB9NWWKSSfl4JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G4wtzBGKt0sgkUY9t0zO/WgHhsN814VNsOaobTJyRRA=;
        b=JYYI3sqKV449yTUjeLMPC5HFYxk8OBfzu9Ag0wypJ5fxRhm1Hq9ivHrxR5CG21XwB4
         Fh1heuRY1W2+VWeejgBa+vCveXNOBGAgX17SFBPJrAZUoLCwKi1MN5OhVkQ+b5fcM6PZ
         JgXiXpE7gRX92B6b0J87WC47Zr6igzVvRZze3w5i8Yvosb0FlZeDri1cIlBas2EZDQBX
         MeH8Ks83ZtlXkjmoUm4j9/6t4Pdnr1fH2cnAy+Yc85DM9rhKYDi8jVyXbOKuMpt41ORf
         AE5PqWGine7sUYONzre/hQzdB97gy2rS0vMqKCE2Ol0UKs5UvHCK6qsSgNY/RkHrMHWH
         ezxw==
X-Gm-Message-State: ALoCoQmRf1s2fvsvFFamkeZqFTwvzJwhgpzs9zp+JVURy2N2BcG76f2mZUuXhSBWRauE33bYW0IIph8S9AnpbAIDqzk9AkQzGg==
X-Received: by 10.28.218.81 with SMTP id r78mr8416996wmg.91.1452245547999;
        Fri, 08 Jan 2016 01:32:27 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:26 -0800 (PST)
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
Subject: [PATCH v4 6/8] hw/arm/sysbus-fdt: helpers for clock node generation
Date: Fri,  8 Jan 2016 09:32:03 +0000
Message-Id: <1452245525-3886-7-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-TUID: s9WB1jd5pZOf

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
