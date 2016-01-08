Received: by 10.25.134.130 with SMTP id i124csp325910lfd;
        Fri, 8 Jan 2016 01:32:25 -0800 (PST)
X-Received: by 10.194.161.166 with SMTP id xt6mr80388692wjb.98.1452245545696;
        Fri, 08 Jan 2016 01:32:25 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id e2si26387103wmi.26.2016.01.08.01.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id u188so129601977wmu.1
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zuxFGK3aUKVEn5tLKbVKoTI77h/rgqJdu5EQAgSvaFk=;
        b=O6q3Cudv0g4DG73NOIrm1MxltwEez64phDG76uxHdKMe3gTkJeReMglpdMnT0u+BuG
         iiv6T7s/jcZIlWkcKDalHyoHHKBI4lrcBA6kjrAEuYOfnTrCJQdAd79Uq6/zdXA4p01A
         XciDjnTTj8i/TDbyI5XCLJRtYVDlZp2Tcksio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zuxFGK3aUKVEn5tLKbVKoTI77h/rgqJdu5EQAgSvaFk=;
        b=Naa1g/dziRZlt6ImzjiiGsnxWbIRkkikNkq8xvze14qmx+TzM0JO8/parcwJKvh/Px
         ull2vDNK/fSLPXzwKwSaqQNSEguyy4iSItXhHa9XQ77NoIjshGhqWebSwuAL9N6eMpP+
         Mj3URF8WQRiIp3UhL5M2pWz462tM+3Q9wPRbSPSNWSkt4enxDJmX15RosWbuuJQxl0qc
         33JMFMZx/kG86Y4a8DSsgNWHnL86DkwMTdyy9VYOd75XwIZlrFSGKsS4Yuo/1Ff9KpyI
         KetYu/EkKA0o6b/H3YC4MOP8Mb9amk7YwtCmc5SzHgNqaD9MLh3V0SRBM6+ubOjQbh0m
         VAsA==
X-Gm-Message-State: ALoCoQn0LINFONsRVEWVvpKNsjAyNA1wXS0TiI4/1+vaIhYli+dEvfPTEFT6ephg5q3CMeLEEOMxmLjYKj0bFGw1euWhwrAqJQ==
X-Received: by 10.194.114.106 with SMTP id jf10mr127636668wjb.149.1452245545504;
        Fri, 08 Jan 2016 01:32:25 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:23 -0800 (PST)
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
Subject: [PATCH v4 5/8] device_tree: qemu_fdt_getprop_cell converted to use the error API
Date: Fri,  8 Jan 2016 09:32:02 +0000
Message-Id: <1452245525-3886-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-TUID: IrcxvX1gnRsf

This patch aligns the prototype with qemu_fdt_getprop. The caller
can choose whether the function self-asserts on error (passing
&error_fatal as Error ** argument, corresponding to the legacy behavior),
or behaves differently such as simply output a message.

In this later case the caller can use the new lenp parameter to interpret
the error if any.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v3 : creation
---
 device_tree.c                | 21 ++++++++++++++-------
 hw/arm/boot.c                |  6 ++++--
 hw/arm/vexpress.c            |  6 ++++--
 include/sysemu/device_tree.h | 16 +++++++++++++++-
 4 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 6ecc9da..0e837bf 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -338,15 +338,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
 }
 
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
-                               const char *property)
+                               const char *property, int *lenp, Error **errp)
 {
     int len;
-    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
-                                         &error_fatal);
-    if (len != 4) {
-        error_report("%s: %s/%s not 4 bytes long (not a cell?)",
-                     __func__, node_path, property);
-        exit(1);
+    const uint32_t *p;
+
+    if (!lenp) {
+        lenp = &len;
+    }
+    p = qemu_fdt_getprop(fdt, node_path, property, lenp, errp);
+    if (!p) {
+        return 0;
+    } else if (*lenp != 4) {
+        error_setg(errp, "%s: %s/%s not 4 bytes long (not a cell?)",
+                   __func__, node_path, property);
+        *lenp = -EINVAL;
+        return 0;
     }
     return be32_to_cpu(*p);
 }
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 75f69bf..541b74c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -386,8 +386,10 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         return 0;
     }
 
-    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
-    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
+    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                   NULL, &error_fatal);
+    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
+                                   NULL, &error_fatal);
     if (acells == 0 || scells == 0) {
         fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
         goto fail;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 058abbd..ffe42be 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -482,8 +482,10 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
     uint32_t acells, scells, intc;
     const VEDBoardInfo *daughterboard = (const VEDBoardInfo *)info;
 
-    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
-    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
+    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                   NULL, &error_fatal);
+    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
+                                   NULL, &error_fatal);
     intc = find_int_controller(fdt);
     if (!intc) {
         /* Not fatal, we just won't provide virtio. This will
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 4d7cbb9..5aa750b 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -60,8 +60,22 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
                              const char *property, int *lenp,
                              Error **errp);
+/**
+ * qemu_fdt_getprop_cell: retrieve the value of a given 4 byte property
+ * @fdt: pointer to the device tree blob
+ * @node_path: node path
+ * @property: name of the property to find
+ * @lenp: fdt error if any or -EINVAL if the property size is different from
+ *        4 bytes, or 4 (expected length of the property) upon success.
+ * @errp: handle to an error object
+ *
+ * returns the property value on success
+ * in case errp is set to &error_fatal, the function auto-asserts
+ * on error (legacy behavior)
+ */
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
-                               const char *property);
+                               const char *property, int *lenp,
+                               Error **errp);
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
-- 
1.9.1
