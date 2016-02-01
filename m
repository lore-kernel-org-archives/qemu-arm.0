Received: by 10.25.159.19 with SMTP id i19csp69122lfe;
        Mon, 1 Feb 2016 05:52:15 -0800 (PST)
X-Received: by 10.194.79.37 with SMTP id g5mr24199105wjx.89.1454334735113;
        Mon, 01 Feb 2016 05:52:15 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id f193si15133968wmd.24.2016.02.01.05.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id 128so72018348wmz.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yzix5gu6K9TUZ1c381gzQf1ARop8Lj6kip7NSZ+u9fI=;
        b=UA5DO/fI46cemqi4+qst/mBUSyCeXMkkPBEbOC27TIp7xR/526aUWlwYnusZnkv9Bd
         u0I9Sph+el8bibuYqGjGMnQr+G0/X3RRJc+M59aqZMzRduy+YrLkQe0s/NZ3tp8zBkfW
         DHMOPGgEDDyO6GV6E2WPe+oy0WlqS4FLbdrKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yzix5gu6K9TUZ1c381gzQf1ARop8Lj6kip7NSZ+u9fI=;
        b=XUdslq4ufPmyxmSpGlLPN8okenhsJwkwCspimFQCma/q/6k/2yCpyIHPMnIUm0yTF0
         LLgw4RHnTMWMDZGfz83a9j+KtngJkw3jxdFL7AtZnehUXPdpWF8jV+I9SC8jMmsh9nPn
         q2vSZvfuUVrqh/8eGJ0Wo+1+6F1++OrGLOpwYUbYQZgW1u0ynR/hDLb+QEzWwaPhkyzI
         Kv226HE4IzSKmPdRxpeF9yqtpv+aXefisb8ZTNK3dlv4DLFLGqB6QLM6tCUFPBa2K8S0
         AE9fWhWo/op9e/pHYdOKOnv0cMKGfnMXmt8Q97LQ8AtAxmAWQyf4/fC44Wa/2i9lqZJs
         ARvA==
X-Gm-Message-State: AG10YOQ2pEdVzqV6BrAaGnyLMD2Br0UtangwJ/Ymi0U8b0h4rM+PBY+oJXIeMTCeFA0t6yy1Zek=
X-Received: by 10.194.57.100 with SMTP id h4mr26876080wjq.21.1454334734915;
        Mon, 01 Feb 2016 05:52:14 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:13 -0800 (PST)
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
Subject: [PATCH v6 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Mon,  1 Feb 2016 13:51:48 +0000
Message-Id: <1454334712-12360-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: 2/SxmZBzYPG2

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
index a89b838..2c44a3d 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -334,18 +334,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
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
@@ -354,7 +354,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
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
index 552df21..48bf3b5 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -54,8 +54,19 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
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
