Received: by 10.25.208.211 with SMTP id h202csp1150194lfg;
        Fri, 19 Feb 2016 05:17:30 -0800 (PST)
X-Received: by 10.194.83.42 with SMTP id n10mr13603892wjy.20.1455887846921;
        Fri, 19 Feb 2016 05:17:26 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id t8si12712603wmd.71.2016.02.19.05.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 05:17:26 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22b.google.com with SMTP id b205so67785689wmb.1
        for <alex.bennee@linaro.org>; Fri, 19 Feb 2016 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nCGpWMO+RxaZWDcx6az1WPZV9jeCREeWD6RuFVE9+ug=;
        b=LERkxQm8TZvbtFxLbhX5FtoVf2pSTSKJHcyV94zZNLGJKShc4opsJvWyxnnZUvpMl4
         y0S8zIERwdU66P///BdKH/qN8UAmhDKbWLIk3HNNXauzpPysGptFKLZZALtdbiyBCS32
         67A8arTKskWUSQGwFuRCpYzGxxIUa+0MDN0Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nCGpWMO+RxaZWDcx6az1WPZV9jeCREeWD6RuFVE9+ug=;
        b=d5Zm0FSt4XtsXEerPjcaZpA6M7egWgInNb40UH8gq0fQuDPdt03RNMmT3L5M2Ch0UG
         KM4yZx0363YnHh/hNoJ6IuqnnfDLlElKaTfdGBA2XiTM+KvrkmG3RZ4OzEqOAlgto2Q7
         ocUNHeRLExLQF5pWWidcZSZK5t8RxKnVuIgn4cdxKEcorHymWYRC6G7AP0GgzdVPgJWt
         w+KQBxlUp1OQ1U0zD3+f3DZhiEHYzFZVoaIORLhrkvuqrRw//buyf4NfR/gnJlwlDG1B
         xsQkO3B4JvrAdCmw2pw0HbSOdXNRfklbPBLit7L21WbPc4wjTD+KsTyaiHbnAYH/wrjp
         Jrug==
X-Gm-Message-State: AG10YORmVCQVlPlx1Z2eA+Y3JGZ2QrAB3388YF9QS6PF9i4vyJithV5TT1oJw5R1jPhIewefyzU=
X-Received: by 10.28.45.71 with SMTP id t68mr9872630wmt.46.1455887846719;
        Fri, 19 Feb 2016 05:17:26 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id bg1sm11229846wjc.27.2016.02.19.05.17.24
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:17:25 -0800 (PST)
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
Subject: [PATCH v8 3/8] device_tree: introduce qemu_fdt_node_path
Date: Fri, 19 Feb 2016 13:17:08 +0000
Message-Id: <1455887833-7306-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
References: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
X-TUID: oT4UT9kfB7r8

This new helper routine returns a NULL terminated array of
node paths matching a node name and a compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v7 -> v8:
- don't use g_slist_free_full anymore (glib 2.28)

v6 -> v7:
- add Peter's R-b

v5 -> v6:
- in case of error, free the resources and return NULL
- update the doc comment

v4 -> v5:
- support the case where several nodes exist, ie.
  return an array of node paths. Also add Error **
  parameter

v1 -> v2:
- move doc comment in header file
- do not use a fixed size buffer
- break on errors in while loop
- use strcmp instead of strncmp

RFC -> v1:
- improve error handling according to Alex' comments
---
 device_tree.c                | 54 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 18 +++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index 9e77c69..b29a433 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -226,6 +226,60 @@ static int findnode_nofail(void *fdt, const char *node_path)
     return offset;
 }
 
+char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                          Error **errp)
+{
+    int offset, len, ret;
+    const char *iter_name;
+    unsigned int path_len = 16, n = 0;
+    GSList *path_list = NULL, *iter;
+    char **path_array;
+
+    offset = fdt_node_offset_by_compatible(fdt, -1, compat);
+
+    while (offset >= 0) {
+        iter_name = fdt_get_name(fdt, offset, &len);
+        if (!iter_name) {
+            offset = len;
+            break;
+        }
+        if (!strcmp(iter_name, name)) {
+            char *path;
+
+            path = g_malloc(path_len);
+            while ((ret = fdt_get_path(fdt, offset, path, path_len))
+                  == -FDT_ERR_NOSPACE) {
+                path_len += 16;
+                path = g_realloc(path, path_len);
+            }
+            path_list = g_slist_prepend(path_list, path);
+            n++;
+        }
+        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
+    }
+
+    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
+        error_setg(errp, "%s: abort parsing dt for %s/%s: %s",
+                   __func__, name, compat, fdt_strerror(offset));
+        for (iter = path_list; iter; iter = iter->next) {
+            g_free(iter->data);
+        }
+        g_slist_free(path_list);
+        return NULL;
+    }
+
+    path_array = g_new(char *, n + 1);
+    path_array[n--] = NULL;
+
+    for (iter = path_list; iter; iter = iter->next) {
+        path_array[n--] = iter->data;
+    }
+
+    g_slist_free(path_list);
+
+    return path_array;
+}
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 62093ba..552df21 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -25,6 +25,24 @@ void *load_device_tree(const char *filename_path, int *sizep);
 void *load_device_tree_from_sysfs(void);
 #endif
 
+/**
+ * qemu_fdt_node_path: return the paths of nodes matching a given
+ * name and compat string
+ * @fdt: pointer to the dt blob
+ * @name: node name
+ * @compat: compatibility string
+ * @errp: handle to an error object
+ *
+ * returns a newly allocated NULL-terminated array of node paths.
+ * Use g_strfreev() to free it. If one or more nodes were found, the
+ * array contains the path of each node and the last element equals to
+ * NULL. If there is no error but no matching node was found, the
+ * returned array contains a single element equal to NULL. If an error
+ * was encountered when parsing the blob, the function returns NULL
+ */
+char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                          Error **errp);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
1.8.3.2
