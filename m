Received: by 10.25.159.19 with SMTP id i19csp1973755lfe;
        Mon, 18 Jan 2016 07:17:00 -0800 (PST)
X-Received: by 10.194.158.135 with SMTP id wu7mr25176847wjb.142.1453130219322;
        Mon, 18 Jan 2016 07:16:59 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id 126si25831694wma.118.2016.01.18.07.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2016 07:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id r129so55376718wmr.0
        for <alex.bennee@linaro.org>; Mon, 18 Jan 2016 07:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q7OwAW9QxQc6J7yF0hoQRibJ3CCPh4GOSZraNe2Y6q0=;
        b=YPEVQKNIxw9AcdtRGTKUh2RRvB+uY0HpqvYZ6+bQ1CU2ov7D7KWjhIcmRCIViF+QFq
         PVUezZwCr/nRLUsxxz1fqvAbwd1WNoBDJHtSjvO5GsPySNrLbagjaoxnkoUJ3GbbDEWb
         /5YjvyPnTJbXdBBwGDXH+VBNIlSY4+Cygflq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q7OwAW9QxQc6J7yF0hoQRibJ3CCPh4GOSZraNe2Y6q0=;
        b=LPrszJPpvsI3z//wNHlAdGysDYHZ7MqbP/LlMEZwqgFiNDiA8s60N76qjewjuoblgi
         wQS9iZO35/PxvQAv5M1vth/Ngr4ay9qpExWXjClVni7X26LH7JCOTJtXEed17Yam2aas
         UIw+PK4ZiAC4uSvbZC0gkL+opw3lSywsruUjUxvNVkhLlC332R5ymEg6h32G6/jrgVop
         +PTF0NDqkxXrdoWxycagou/ahqdPNFfqEtImJttL+8hVlKzq0KUt2qq4ColFKQgrtXs9
         LJMfiZ1ha710k4b2b2le2U8iJKfwr1pJ+5IYWYiTV7C2vqS4dUHPgkt+rJN+ebnQifkw
         va7A==
X-Gm-Message-State: ALoCoQl6Wsh7PHNu7+aEc6YEnqh4ApCeg5LLNbQjcYYbjUOFfPaUMENP35mlVcJWqbePvQ9hKLMNiosx+78LCSOm953VJ+Nxmg==
X-Received: by 10.194.87.1 with SMTP id t1mr24383827wjz.170.1453130219153;
        Mon, 18 Jan 2016 07:16:59 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-9.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id o7sm24230067wjf.45.2016.01.18.07.16.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 07:16:57 -0800 (PST)
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
Subject: [PATCH v5 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Mon, 18 Jan 2016 15:16:40 +0000
Message-Id: <1453130204-655-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
X-TUID: fOWgsC0gu9YT

Current qemu_fdt_getprop exits if the property is not found. It is
sometimes needed to read an optional property, in which case we do
not wish to exit but simply returns a null value.

This patch converts qemu_fdt_getprop to accept an Error **, and existing
users are converted to pass &error_fatal. This preserves the existing
behaviour. Then to use the API with your optional semantic a null
parameter can be conveyed.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

---
v4 -> v5:
- add Peter's R-b
- remove comment about error_fatal

v1 -> v2:
- add a doc comment in the header file

RFC -> v1:
- get rid of qemu_fdt_getprop_optional and implement Peter's suggestion
  that consists in using the error API

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 11 ++++++-----
 include/sysemu/device_tree.h | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 3c88a37..45fd76d 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -333,18 +333,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
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
@@ -353,7 +353,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
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
index 436b5dd..123beb5 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -45,8 +45,19 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
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
