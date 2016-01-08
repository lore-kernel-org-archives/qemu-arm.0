Received: by 10.25.134.130 with SMTP id i124csp325885lfd;
        Fri, 8 Jan 2016 01:32:22 -0800 (PST)
X-Received: by 10.28.8.142 with SMTP id 136mr22951018wmi.54.1452245542578;
        Fri, 08 Jan 2016 01:32:22 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com. [2a00:1450:400c:c09::22f])
        by mx.google.com with ESMTPS id wk7si173258739wjb.244.2016.01.08.01.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:22 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) client-ip=2a00:1450:400c:c09::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22f.google.com with SMTP id b14so162053218wmb.1
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=D8waZx3A2liAr/4DPHFgUuiYRDBJI95/7dyGSGA0tyuEOi6VrdnSLCx+hR7XWdhB6R
         DCia7idJ6vsn+CuOfYPxumtyyHdRHA+7Pk/SgTq/1R9u523+lvLpl7CZIveKwW+E1TtH
         MAcOsAVH1aSEtTChQtopFEkbEln3MvugFvBww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=OrdyCefpILD1ziMLi/gIe3Iy0SRyGIJ947DJITS+QTDyJsk4Dy4HCzyf5rUNWdF26k
         q43c1YsguTUh2XZnXMAwIkH6Rf+3Wmer5fOYK5Ss57y63HYENk4qHAYk8NpmhRg01SJQ
         hSzo7SRG0XOf+2yGG+sP4FNteLidyjh+kIXE1ezKM4axPfx5zYvtQZ3WJQOezF86K1Zg
         TrovsdnDsBMuDpGVCS5Tm7LeIlVndABX1aYqnPX1Rde56Vxr+8u3tq0J24atq4PvLscW
         p++lhBhB8I7f/rLR4ZI4j5XtWVc7PVwUSA9dzAN8aHLTqhWRb8oDTl1V6E6r++HfRdtK
         KTiA==
X-Gm-Message-State: ALoCoQkT9YAB4/xbj3ecAswFUDmd0xR+jlMzCkI/0a6LrC08q74dwcqoGm/UAFhglIdV2HyI1g3ngrgwhonE/2EJ4tnaRMMijg==
X-Received: by 10.28.127.87 with SMTP id a84mr21037824wmd.83.1452245542388;
        Fri, 08 Jan 2016 01:32:22 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:20 -0800 (PST)
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
Subject: [PATCH v4 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Fri,  8 Jan 2016 09:32:01 +0000
Message-Id: <1452245525-3886-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-TUID: FGtMnVW7DUdl

Current qemu_fdt_getprop exits if the property is not found. It is
sometimes needed to read an optional property, in which case we do
not wish to exit but simply returns a null value.

This patch converts qemu_fdt_getprop to accept an Error **, and existing
users are converted to pass &error_fatal. This preserves the existing
behaviour. Then to use the API with your optional semantic a null
parameter can be conveyed.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v1 -> v2:
- add a doc comment in the header file

RFC -> v1:
- get rid of qemu_fdt_getprop_optional and implement Peter's suggestion
  that consists in using the error API

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 11 ++++++-----
 include/sysemu/device_tree.h | 15 ++++++++++++++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 8441e01..6ecc9da 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -321,18 +321,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 }
 
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
-                             const char *property, int *lenp)
+                             const char *property, int *lenp, Error **errp)
 {
     int len;
     const void *r;
+
     if (!lenp) {
         lenp = &len;
     }
     r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
     if (!r) {
-        error_report("%s: Couldn't get %s/%s: %s", __func__,
-                     node_path, property, fdt_strerror(*lenp));
-        exit(1);
+        error_setg(errp, "%s: Couldn't get %s/%s: %s", __func__,
+                  node_path, property, fdt_strerror(*lenp));
     }
     return r;
 }
@@ -341,7 +341,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property)
 {
     int len;
-    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len);
+    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
+                                         &error_fatal);
     if (len != 4) {
         error_report("%s: %s/%s not 4 bytes long (not a cell?)",
                      __func__, node_path, property);
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 269cb1c..4d7cbb9 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -45,8 +45,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
+/**
+ * qemu_fdt_getprop: retrieve the value of a given property
+ * @fdt: pointer to the device tree blob
+ * @node_path: node path
+ * @property: name of the property to find
+ * @lenp: fdt error if any or length of the property on success
+ * @errp: handle to an error object
+ *
+ * returns a pointer to the property on success and NULL on failure
+ * in case errp is set to &error_fatal, the function auto-asserts
+ * on error (legacy behavior)
+ */
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
-                             const char *property, int *lenp);
+                             const char *property, int *lenp,
+                             Error **errp);
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property);
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
-- 
1.9.1
