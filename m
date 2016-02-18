Received: by 10.25.208.211 with SMTP id h202csp736901lfg;
        Thu, 18 Feb 2016 09:46:03 -0800 (PST)
X-Received: by 10.28.223.8 with SMTP id w8mr4908054wmg.54.1455817561543;
        Thu, 18 Feb 2016 09:46:01 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id ei4si11895261wjd.8.2016.02.18.09.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:46:01 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x230.google.com with SMTP id g62so36763451wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8b8I/Uc8leh21pgcMBNPFBSiQ6xNDzqEnIrUpNXAYFU=;
        b=bJFKuc3Suy70ha1SOUeHICDe6YvxBZowz7ovN2X4zda8n0mK021ZWzCUI6G43zLJ28
         YazRJH1Z8ZaEIDbj0CzHjpb+2Q2XXj/IwrdENPA1zU9yTmWixic7ZvO2h48qyY4VlpuU
         +D3ed7XvW321FXi9V6NVzVTKim1nor+IuXJzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8b8I/Uc8leh21pgcMBNPFBSiQ6xNDzqEnIrUpNXAYFU=;
        b=RghBpjZ+2dDzo36KEjKCPExuQ8rOY12tPadDZfK3aKpHLL982D9vTkCTEhKg7Ogg4a
         0r+/yZxxdcPtVih20HRL2+Kn3kEw9kJZJp4teHRSNCjcKPiIA2zkzpajWny02gJdpfrc
         o6/T8/CxbxburGA7Hlam7do7kSrnyALG/8tpQ84N2+HdB5Y1D8FNi0+zBejTDHFNp/Yo
         hPkKGNOb3bJZj6pf97xWDxwXIkqFV4Rg/Ndwbp2qS6vskxyrIYP1/POFzCAPd8aYaNGg
         VR9BQ5I7wYrMH4qWoGsWoT/ThQ94QMHrpS3rldTg0zRUnAHom9Cbp42RZRyOAq8Pocph
         qDIg==
X-Gm-Message-State: AG10YOQxQo4kk7uPMaaTIy/g6x3u4ckI2i+fe8naYCkYHWtBh6+Ih06cosRce//Ut0TOrw/qAu8=
X-Received: by 10.194.95.40 with SMTP id dh8mr9980251wjb.146.1455817561339;
        Thu, 18 Feb 2016 09:46:01 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.45.59
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:59 -0800 (PST)
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
Subject: [PATCH v7 3/8] device_tree: introduce qemu_fdt_node_path
Date: Thu, 18 Feb 2016 17:45:41 +0000
Message-Id: <1455817546-6564-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-TUID: wNStuAX1m/8H

This new helper routine returns a NULL terminated array of
node paths matching a node name and a compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

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
 device_tree.c                | 51 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 18 ++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index 9e77c69..2587257 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -226,6 +226,57 @@ static int findnode_nofail(void *fdt, const char *node_path)
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
+        g_slist_free_full(path_list, g_free);
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
