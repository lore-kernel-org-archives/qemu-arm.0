Received: by 10.25.208.211 with SMTP id h202csp1150219lfg;
        Fri, 19 Feb 2016 05:17:33 -0800 (PST)
X-Received: by 10.194.92.147 with SMTP id cm19mr15231878wjb.32.1455887848913;
        Fri, 19 Feb 2016 05:17:28 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id s5si17858076wjx.95.2016.02.19.05.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 05:17:28 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x229.google.com with SMTP id b205so67786848wmb.1
        for <alex.bennee@linaro.org>; Fri, 19 Feb 2016 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OqRjOkGPy8VzGbEhR+QnxHd1gMXzLZ3wvHFpJVpngRE=;
        b=AYVv86qTQ1kPq510rZJjdhONZpH7YJibLnHDaV9jagn+2eQVIiI2/8aN/eY59rPKcE
         pgy6W9awD+KRmHgILo19IJYRBGRmK9Rse5V/PH8KLeyHam9YbxT0LxCC2gnJ0yXo/VE/
         957kbm3XpqJxeAlWyefQkzwu5VKbtocmQj/WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OqRjOkGPy8VzGbEhR+QnxHd1gMXzLZ3wvHFpJVpngRE=;
        b=InHzPxasXAHzzSq1eSbPWV9ZFG5J4uapdQqWClu2i/IhloKanczn6o2ErqrjsrcOxg
         1A1x2Y6vcJYJvzqSyDGuyoxjWwe60dSl1/gruObqHgApKXzjGU0hjMHHe3pPxAWHW53T
         zgPRvWlWjsaZ3B3C1V0a8icszKOx6XkJek5ZYUsqovG2trIhgQ7C3BHz25RZwC5Xfm/L
         XUX7d26Qma6G/Q9VmDB3KjATVONKLFrfmJo4pRITCHcwypqV5qGUjdRcPYMd7VOOsph3
         HGTYwsEaqX9yZ2GmSw18QcNmnWRkSGRNMXODqdcqlh1XvjSW8euM7ppE/jL93oqI5z5R
         MbLw==
X-Gm-Message-State: AG10YOQMlhcsqdMHLb9jPXK62RuV5+kR5dKEOP1Tdg4NkNX+DnDz1n/bCWOdT52gwywYhN4nEfc=
X-Received: by 10.28.210.73 with SMTP id j70mr8848665wmg.8.1455887848703;
        Fri, 19 Feb 2016 05:17:28 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id bg1sm11229846wjc.27.2016.02.19.05.17.26
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:17:27 -0800 (PST)
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
Subject: [PATCH v8 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Fri, 19 Feb 2016 13:17:09 +0000
Message-Id: <1455887833-7306-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
References: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
X-TUID: SdkyK9MAY6H+

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
index b29a433..3d41c44 100644
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
