Received: by 10.25.208.211 with SMTP id h202csp736923lfg;
        Thu, 18 Feb 2016 09:46:06 -0800 (PST)
X-Received: by 10.28.48.137 with SMTP id w131mr4892193wmw.73.1455817563496;
        Thu, 18 Feb 2016 09:46:03 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id fa10si11784833wjd.246.2016.02.18.09.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:46:03 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id c200so39874414wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vah/PzoAH/oWR65RGdWF+EHfVDO+cRlbVRzs7Az/ULc=;
        b=eSrgDQmbbMfSKP3XP/XJUfLxu5ZFih2xIJuvOQtwAJxP5vMsGUUTLNggYxRQ0IJCAe
         nMp4G/uLye6d+Cstyl14WIEGq73Jho/MGawt2xRzOfdlpZNBjQufUDFz2O6S17E4GwQK
         0VBcpwhVB9TgOcWIL5PC7k2MQZZDJKSPWIoyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vah/PzoAH/oWR65RGdWF+EHfVDO+cRlbVRzs7Az/ULc=;
        b=CI5+tfH1IuroC1EVmCf3C+2RkRxTTQx0uS3y9cOrbFuXLMOjq4i41QrAajF82XJQMc
         MO4axZeY5pMSypWd1BDS4WmFLtocCgKGOD2up6UQz0m/QJgkIlnUKiyyJaCe0hJ+nQsi
         wKOpPOce0xSfkJZdJpqnvx/Lg6T5Arnmle5cMTOpZBQ2CoSmkXYZZMMfwXz0+ZQ7zvYh
         OQNQkpq1XMrSynUoF6WtVldszjDMVcnN7LtzcMBop3OmhW8UaEOGz2rJOflLPBQStint
         2AjpW6H18J/bvoSm3f/WcX0fzDoqhnMMTEwmmO7PDwGwmul63f5OoT/+XquUGFSVVjMD
         r3IQ==
X-Gm-Message-State: AG10YOSm4nn8umboH4Xpz+hbJkvoNfEPirTx6PfMKYW7vINsI2PVPwLuHQHQ4bcHy5OE8aPlxTg=
X-Received: by 10.28.173.71 with SMTP id w68mr4947616wme.88.1455817563287;
        Thu, 18 Feb 2016 09:46:03 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.46.01
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:46:01 -0800 (PST)
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
Subject: [PATCH v7 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Thu, 18 Feb 2016 17:45:42 +0000
Message-Id: <1455817546-6564-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-TUID: wnrMZkgoN0R4

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
index 2587257..c93a615 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -330,18 +330,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
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
@@ -350,7 +350,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
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
1.8.3.2
