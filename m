Received: by 10.182.158.201 with SMTP id ww9csp659413obb;
        Thu, 7 Jan 2016 07:50:39 -0800 (PST)
X-Received: by 10.194.120.134 with SMTP id lc6mr132643052wjb.130.1452181834486;
        Thu, 07 Jan 2016 07:50:34 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id i8si20591644wma.50.2016.01.07.07.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:34 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x236.google.com with SMTP id f206so102501342wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zuxFGK3aUKVEn5tLKbVKoTI77h/rgqJdu5EQAgSvaFk=;
        b=hF3aobD9RvQw4Y6dcsX48ifTLceScqfB8Le1xxNANWlOkmXrAa5EqZ0CNS/x3bnDkf
         ZFHCtqQgSypqOQU57eLAvO2Mc73XTjuKeXcBhhD56l7ZJidCqGZFC/4hY5VHcM4NaVMM
         OTO1cd9ETzV5fQ+5vTU2TiQFTQAEUkjN8T+9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zuxFGK3aUKVEn5tLKbVKoTI77h/rgqJdu5EQAgSvaFk=;
        b=CZyaMInr83rOTNx5p30qCoJ3HuT3dmsy/C1qVO8NX7D+tTeZ6jRAV697QcWqSlJOkp
         YZTnbt2Q0IlDdO8yAHmYLIAnuYv1d6qlUVTbt6jLVaA5qw+C9H/AClk45keDhZNlPjUj
         9dB7YuWH8P3rRLzyiphWhsKHeiQXEt7EOC1jex67z6wTcw9pFjyvSvF14O9/0mvPa5LD
         aY5RJrhv6EFI76c50lgp3o/5O11/waGLkqIr4XrCn9d0lX15AYdfCmxx7G1qPqwOulrd
         H+/7bveMcMDebs5d2qQasHRYwrU0OvTiT8y/AxERMl3v1FSA/ZbGXzBXMzbGDEIoCwxV
         vt+Q==
X-Gm-Message-State: ALoCoQnru5PdhdxyK9t/GJsbwPUa4tgTLcGCIo1yGrxDZNt2rczdW08wuN039HFJEvcYg3HCmRHSLcWLdC0k7TAcOjsqKoFR3Q==
X-Received: by 10.28.3.131 with SMTP id 125mr10192923wmd.14.1452181834178;
        Thu, 07 Jan 2016 07:50:34 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:33 -0800 (PST)
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
Subject: [PATCH v3 5/8] device_tree: qemu_fdt_getprop_cell converted to use the error API
Date: Thu,  7 Jan 2016 15:50:12 +0000
Message-Id: <1452181815-1948-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: k6MRTi8B1HgT

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
