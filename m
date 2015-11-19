Received: by 10.182.158.201 with SMTP id ww9csp2023392obb;
        Thu, 19 Nov 2015 07:27:06 -0800 (PST)
X-Received: by 10.31.130.139 with SMTP id e133mr5283470vkd.52.1447946825971;
        Thu, 19 Nov 2015 07:27:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 199si4481164vki.197.2015.11.19.07.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2015 07:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR73-0002Yr-A1
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:27:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2U-0003Mf-Nt
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2T-0000jw-NY
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:22 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:36183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2T-0000jX-FH
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:21 -0500
Received: by wmww144 with SMTP id w144so242970826wmw.1
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ibG/X+FCqU88Fa17mVaPwzqjzFflb6oUWsB98AHMVVI=;
	b=gJ5cCmAQ4KHFQxHDPM/dJTBYKtj4oGcbRzHeFxsgZCJyS6+ckilR/e1HTOrNnBY/E9
	K7rDfG6tBSJ7j6243qqWfyITknTU8OtN4Af9sSEtJFxZPEFsW8DiTu2n8BjC3r5XHmP7
	Q2pcRsPCuaudTcxGXP/ObBjWddNUvtUqjKv0DyBimI7WDNnpf+8u4Fmu4iI1dFwHm9Kv
	NUV+jYxp++YcHD6on094vlLRlZuOk/JtnUZsN5jDKC5/rzNX7fg9ym+CTJJxuEwyB6NP
	nFhRKfiMuPbMHOKbr0LMyPnygn8ASUy1Qaxdpvssz4A/7QZ8IGIuHsnx8GNsl+MLZ5lv
	lXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ibG/X+FCqU88Fa17mVaPwzqjzFflb6oUWsB98AHMVVI=;
	b=HSz9+nP/xzFEKIXP348etuSvhj3WHM3MWmbeskcwFzjZ78dy1/N9m8HNpkirg2q1ZD
	DOPYFRGRIbp398moYFXpPRVxEOLvYMUfdjDz7remY8lgpTJzBDJLVqTPz9eE3eGHNVHJ
	+W2lek/fkpYlx+CwvQGiQrInAA+BwWkgGMSxoxDtUu3n79yj+uTpX0prNhlaV+5CVB9T
	nEFpyuhOnC5ZFDv+5PsNLq3lD8PtKu9hhB2h6zG/Rx/Q7s15MpKD87BMu2zTSOkKfD+M
	uN4O/SLQY7bQeUanXJFvkVVYHUArgllUstja9tWm2q3JcOM2QPAmvx6kWRCR41zPyHO0
	aKKw==
X-Gm-Message-State: ALoCoQlccAE8LFir83UaNPa/Kx49fA+cg9oZxBXyij1NhVEmRB/219AdtwYNTAV8Dd/QIPDpvd64
X-Received: by 10.194.243.227 with SMTP id xb3mr9665657wjc.96.1447946540880;
	Thu, 19 Nov 2015 07:22:20 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.19
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:20 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:07 +0000
Message-Id: <1447946528-1533-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22c
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for clock
	node generation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iTx+rvEU2zdV

Some passthrough'ed devices depend on clock nodes. Those need to be
generated in the guest device tree. This patch introduces some helpers
to build a clock node from information retrieved from host device tree.

- inherit_properties copies properties from a host device tree node to
  a guest device tree node
- fdt_build_clock_node builds a guest clock node and checks the host
  fellow clock is a fixed one.

fdt_build_clock_node will become static as soon as a they get used

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/arm/sysbus-fdt.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 9d28797..22e5801 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <libfdt.h>
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -56,6 +57,115 @@ typedef struct NodeCreationPair {
     int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
 } NodeCreationPair;
 
+/* helpers */
+
+struct HostProperty {
+    const char *name;
+    bool optional;
+};
+
+typedef struct HostProperty HostProperty;
+
+/**
+ * inherit_properties
+ *
+ * copies properties listed in an array from host device tree to
+ * guest device tree. If a non optional property is not found, the
+ * function exits. Not found optional ones are ignored.
+ * props: array of HostProperty to copy
+ * nb_props: number of properties in the array
+ * host_dt: host device tree blob
+ * guest_dt: guest device tree blob
+ * node_path: host dt node path where the property is supposed to be
+              found
+ * nodename: guest node name the properties should be added to
+ *
+ */
+static void inherit_properties(HostProperty *props, int nb_props,
+                               void *host_fdt, void *guest_fdt,
+                               char *node_path, char *nodename)
+{
+    int i, prop_len;
+    const void *r;
+
+    for (i = 0; i < nb_props; i++) {
+        r = qemu_fdt_getprop_optional(host_fdt, node_path,
+                             props[i].name,
+                             props[i].optional,
+                             &prop_len);
+        if (r) {
+            qemu_fdt_setprop(guest_fdt, nodename,
+                             props[i].name, r, prop_len);
+        }
+    }
+}
+
+/* clock properties whose values are copied/pasted from host */
+static HostProperty clock_inherited_properties[] = {
+    {"compatible", 0},
+    {"#clock-cells", 0},
+    {"clock-frequency", 1},
+    {"clock-output-names", 1},
+};
+
+/**
+ * fdt_build_clock_node
+ *
+ * Build a guest clock node, used as a dependency from a passthrough'ed
+ * device. Most information are retrieved from the host fellow node.
+ * Also check the host clock is a fixed one.
+ *
+ * host_fdt: host device tree blob from which info are retrieved
+ * guest_fdt: guest device tree blob where the clock node is added
+ * host_phandle: phandle of the clock in host device tree
+ * guest_phandle: phandle to assign to the guest node
+ */
+int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+                                uint32_t host_phandle,
+                                uint32_t guest_phandle);
+int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+                                uint32_t host_phandle,
+                                uint32_t guest_phandle)
+{
+    char node_path[256];
+    char *nodename;
+    const void *r;
+    int ret, prop_len;
+
+    ret = fdt_node_offset_by_phandle(host_fdt, host_phandle);
+    if (ret <= 0) {
+        error_report("not able to locate clock handle %d in host device tree\n",
+                     host_phandle);
+        goto out;
+    }
+    ret = fdt_get_path(host_fdt, ret, node_path, 256);
+    if (ret < 0) {
+        error_report("not able to retrieve node path for clock handle %d\n",
+                     host_phandle);
+        goto out;
+    }
+
+    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len);
+    if (strcmp(r, "fixed-clock")) {
+        error_report("clock handle %d is not a fixed clock\n", host_phandle);
+        ret = -1;
+        goto out;
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
+out:
+    return ret;
+}
+
 /* Device Specific Code */
 
 /**
-- 
1.8.3.2

