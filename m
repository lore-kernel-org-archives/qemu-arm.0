Received: by 10.182.158.201 with SMTP id ww9csp9840obb;
        Wed, 6 Jan 2016 07:13:36 -0800 (PST)
X-Received: by 10.28.48.194 with SMTP id w185mr11282095wmw.73.1452093216221;
        Wed, 06 Jan 2016 07:13:36 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com. [2a00:1450:400c:c09::22e])
        by mx.google.com with ESMTPS id 132si13078336wmd.74.2016.01.06.07.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:36 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) client-ip=2a00:1450:400c:c09::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22e.google.com with SMTP id f206so63073976wmf.0
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=bwXybO8yvdCkD4foEY5i0Oa4Sg93ArrE21YY53KnL3J01LeEi34lg4j2jnLWHRZHof
         gqMVYUi9Y4spAz6dCzSR77qm9p4+CtcmdSGe2/5FpkD13yQXAQ2PlPoQj0HkrN7KaSnB
         4s27a9VQ+4bXecbvoXi7X37R/75g/DpFfJsaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=bBlFmUTT0C7iPKz1PHEKMs+PXboRpyfRKzATmEDoT6urOAdIL4UxX+82b1zLCXqB+D
         31KYXQNCxDY/p2o8Znscxaz/sQQwaSVrrj/eU6090x2QSNcmOpriYwoDYENf3EiNywY6
         P9dTofl6cE6P96MwbqD72khXmwqNXC0hEx/nnBtSGE0oxiuy3n0S7Z7XU/ZVevUq+eGB
         f1BfLj6Z+C8lvN5HExNluz6lL6uBdXIPrA5Db1vXvG9pfJrEXxp5+FaxbEdaBak2YDFe
         YEy/HyTgSrHRLGura4EY3mKmYxTIQEp7m6WAYZB4I8M7aZLiZmJ36FsTxOi+umcmC/7V
         zA+A==
X-Gm-Message-State: ALoCoQmfColxLzWxEB2bU4I59bXUyFwGFD4FX2ElrEaLGWLr44yDOOWV6ItJQkjDOwbIacrA5NS5IJJKpA+MN6uJ2UCKS1lhSg==
X-Received: by 10.194.87.39 with SMTP id u7mr108193147wjz.11.1452093215958;
        Wed, 06 Jan 2016 07:13:35 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:34 -0800 (PST)
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
Subject: [PATCH v2 4/7] device_tree: qemu_fdt_getprop converted to use the error API
Date: Wed,  6 Jan 2016 15:13:22 +0000
Message-Id: <1452093205-30167-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-TUID: ExhGqgMgO+V2

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
