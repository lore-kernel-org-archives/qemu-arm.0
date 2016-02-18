Received: by 10.25.208.211 with SMTP id h202csp736969lfg;
        Thu, 18 Feb 2016 09:46:11 -0800 (PST)
X-Received: by 10.28.14.4 with SMTP id 4mr4891824wmo.100.1455817567489;
        Thu, 18 Feb 2016 09:46:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id s10si6733546wmf.41.2016.02.18.09.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x233.google.com with SMTP id g62so36767394wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a70R60EkPnVr1+21TsRMhQlP6OYJ87ifr2RJ0u45u2U=;
        b=WR2N1Arbyg59yYi+nvVjYB7srZsbp8erjAZnkPIrPogi4K71advjtQ7aTZSKmuvbBU
         TZzWzlbeyKs8oqqjli6H+6WVZtUesF87aNuJb+OHAzLuo6jM6vqPuPNtfZNRAGnpLl2J
         CDG8wWf0gcdNtq8zalPDm/nnm6CNZXsPAI/IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a70R60EkPnVr1+21TsRMhQlP6OYJ87ifr2RJ0u45u2U=;
        b=NP5H9SFa1N7NbMbEcIHE0tCEvJXux45PoAZr/fkckfDAgBWbjeJMTRlznlSUAov3+B
         KNhCtq1LAMUxm/IRDNJ7XOkFqgQ21gORyZpmhDC+8XkstIuB2KrX2TLHkmc7mkIk0U0R
         ibabivjt+IY7a/EFTHt9UmmQpGrazAJNgTTEvcOSpX1Ng+xbg7uWIR0erV+R90sV5No/
         KOZU4yS0zqFEpg1X284DAyVdoWyT4nJy36eggYMQd6fT227yM2rIVxo7+dwQb7iY7hyt
         DUGT8MzRSLliNTNfQs4VuuhDHwK5IRDgU2blFELnH1DnvDrzE8OvoUWsPQmBIoObicdL
         FvPg==
X-Gm-Message-State: AG10YOQ3I7FO9sotskgZRs8ED6zCZQVPSYFpzu+GJz72AQELVAXo63h4r6B70C1rmpecHJvRBhI=
X-Received: by 10.194.250.35 with SMTP id yz3mr9707778wjc.173.1455817567281;
        Thu, 18 Feb 2016 09:46:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.46.03
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:46:03 -0800 (PST)
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
Subject: [PATCH v7 5/8] device_tree: qemu_fdt_getprop_cell converted to use the error API
Date: Thu, 18 Feb 2016 17:45:43 +0000
Message-Id: <1455817546-6564-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-TUID: dl/72TDBWAzp

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
index c93a615..2a40711 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -347,15 +347,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
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
index cce8c7c..0a56d34c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -437,8 +437,10 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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
1.8.3.2
