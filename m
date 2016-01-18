Received: by 10.25.159.19 with SMTP id i19csp1973786lfe;
        Mon, 18 Jan 2016 07:17:03 -0800 (PST)
X-Received: by 10.194.23.70 with SMTP id k6mr24204320wjf.54.1453130221601;
        Mon, 18 Jan 2016 07:17:01 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id t201si25853377wme.101.2016.01.18.07.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2016 07:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id n5so68951695wmn.0
        for <alex.bennee@linaro.org>; Mon, 18 Jan 2016 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YAqqlMidsRkmnZCXlbdTmg3HBOK9b2UWt3IOtmrdF6c=;
        b=EeXfq/sa+kTZaJy8rf0C6RRLY31lWhvGtB2XCjDV/1wiF4ebOcoty1b3nWF5VqOyeq
         o2uEbhM6jxeJBAt1NqEYmmPWZ7KnQ9LkOxTEhjbCmM2FiGm1jSGRDafjwqzQ1DWexj4/
         b4yl5J2HBdWoG3HJAVYb9Nk5rhvOb+tRqxbpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YAqqlMidsRkmnZCXlbdTmg3HBOK9b2UWt3IOtmrdF6c=;
        b=O6L2Z38wa3g75Q37lJUtLwYFL5TPoUXQE/pH5GEva0cLWHVQHp0LrvvOesVdqj29eY
         O1X6/y+aqRmu/0ZKs6HaDmRi9jVnkUxXKOVwsYG7alTNngBlPQWCw2EnYk0oi9ui/Cwk
         glDwpRpFDJazqeDVUW/aCUXE7bnAH/Kg+oCDx7MrpXHV1wiskNr6544AKuDq7Oe+W3Rz
         u5yEMTYE2XCPJaDO0T4v4Yh+U04BXqLXmiRsWofdd8XK2cBdo9AyIAfBBBXxdHVl4Q1B
         ++oEmVIS2hQnl2ICmrABpt6q+YAn10OmjmuBvzkmQ8bjz6txxHRaoqG7/+OqqdeShJ28
         DRPw==
X-Gm-Message-State: ALoCoQnQy1mTEH2Pd++EV8I5DvkhifMjDDuxvSHp6oOz/rKRWxcotvMZMO+zCaoryxhufF4e7svmneh654t7hh6deHLakmARJA==
X-Received: by 10.194.90.243 with SMTP id bz19mr24849401wjb.128.1453130221384;
        Mon, 18 Jan 2016 07:17:01 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-9.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id o7sm24230067wjf.45.2016.01.18.07.16.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 07:16:59 -0800 (PST)
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
Subject: [PATCH v5 5/8] device_tree: qemu_fdt_getprop_cell converted to use the error API
Date: Mon, 18 Jan 2016 15:16:41 +0000
Message-Id: <1453130204-655-6-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
X-TUID: TGkh9c/CAwSD

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
index 45fd76d..5e56f8e 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -350,15 +350,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
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
index ea9a984..f6e28dc 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -477,8 +477,10 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
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
index 123beb5..7897e54 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -58,8 +58,20 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
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
