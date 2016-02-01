Received: by 10.25.159.19 with SMTP id i19csp69160lfe;
        Mon, 1 Feb 2016 05:52:18 -0800 (PST)
X-Received: by 10.194.79.163 with SMTP id k3mr21494655wjx.117.1454334738126;
        Mon, 01 Feb 2016 05:52:18 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id a125si15107419wmf.3.2016.02.01.05.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x230.google.com with SMTP id l66so72226518wml.0
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FHQkJiHGLCkp5R/CxfNPe0OXSbsM5FLIdWMCDOFkSPE=;
        b=Mt1JFdL+T8NTlokw0xxp8D3A31P/PYoHhrKxCbomC9sO5Q9Bz1Z4jJOqofX3xTcDbc
         vMfyZ5AydxkHyHMNb7C+V/b3j0DOMOdFSHtAE2pRaEFegeg8DW+dzLO1hPuOJfTHVx01
         8IhkFUdMuleDyhm9+Hz52J+z/o1+/aaPNL6DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FHQkJiHGLCkp5R/CxfNPe0OXSbsM5FLIdWMCDOFkSPE=;
        b=RGyVgTuaJBChf7RQ7lHZPzNvsYxP2/lgjA5Me3nM5QW5dSw7vsqi8/aeg1zuj9u8qM
         0JAfSrJHtWiGaIKZrTTEmk29lRQRjFyLBT32XyRGgW2rVVkUoK1YAu5vC6jyf3/fd6nx
         XexXNWtE2aZ0x84uci8FDSd9mpc28nQyVkzz30tn6EdNZfHGjtyv7hg24dpRE8OJ+3F9
         LLNm2dDtl9USsL9xkhWZsmy6q5+rZ8je3hVe79KL7pOy3Fjr5iOABGfEHlfdWou5yK27
         2XR6eNUA44Jn5AEtCC41pmEeUFojk8Wc6i8BKeFLzShXgsGRxiWV5jnoqpJ/9giy6XOr
         XSNg==
X-Gm-Message-State: AG10YOSs+Yk0j2dyfb3rRT1yKJwFR8vMRkV6pyTzr2BrhkVcyqggldpmEabTgtmUee44M3su3Z8=
X-Received: by 10.28.127.150 with SMTP id a144mr6943733wmd.25.1454334737937;
        Mon, 01 Feb 2016 05:52:17 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:16 -0800 (PST)
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
Subject: [PATCH v6 5/8] device_tree: qemu_fdt_getprop_cell converted to use the error API
Date: Mon,  1 Feb 2016 13:51:49 +0000
Message-Id: <1454334712-12360-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: RXKsVJDxhttb

This patch aligns the prototype with qemu_fdt_getprop. The caller
can choose whether the function self-asserts on error (passing
&error_fatal as Error ** argument, corresponding to the legacy behavior),
or behaves differently such as simply output a message.

In this later case the caller can use the new lenp parameter to interpret
the error if any.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

---
v4 -> v5:
- Add Peter's R-b
- remove comment about error_fatal

v3 : creation
---
 device_tree.c                | 21 ++++++++++++++-------
 hw/arm/boot.c                |  6 ++++--
 hw/arm/vexpress.c            |  6 ++++--
 include/sysemu/device_tree.h | 14 +++++++++++++-
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 2c44a3d..c25a7b0 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -351,15 +351,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
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
index 7742dd3..65b2d9d 100644
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
index 3154aea..726c4e0 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -478,8 +478,10 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
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
index 48bf3b5..705650a 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -67,8 +67,20 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
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
