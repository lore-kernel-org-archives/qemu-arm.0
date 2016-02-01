Received: by 10.25.159.19 with SMTP id i19csp69085lfe;
        Mon, 1 Feb 2016 05:52:12 -0800 (PST)
X-Received: by 10.194.103.2 with SMTP id fs2mr27100831wjb.36.1454334732131;
        Mon, 01 Feb 2016 05:52:12 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id pj2si39976686wjb.135.2016.02.01.05.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:12 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x230.google.com with SMTP id p63so72136668wmp.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UQPb1Kac0FbFTWzlDtNlJFHDMFUghArSJfQHS5gRznY=;
        b=VO57Xwk7aAGtsPrdUnjIivsgm/rMRX6xg214NCPAk+R1Ask07FyhbzJ/5zWAk7hr3i
         hL3p/5q3Y10Qf0xtIe3kYxditMlLIWSu7bwLrGcWUzvFIDYhTj0XXBO6f00iHY5nbO5U
         k/fXhIn9e1FA2BjTkOHsV7uYI9qStcWB6173w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UQPb1Kac0FbFTWzlDtNlJFHDMFUghArSJfQHS5gRznY=;
        b=AGmKEbRno2OJVfiQTW43Y/OrJmcD9W2gGpyNUkZTxpdycVI172tuYLIW9/x44nNp0M
         SukUKcewP1CxZ1V7HZVv5ah55Tjrn0TPFpcWLUOgALqqkSZBIRxzKW7Z6nLGFpAn9ecb
         Ei2laYvmPKCXibU584Jy90096OBKRLutvvaaUYS+C40y3udynuYtf7HkNeRkP10a5W2H
         XFBRsMKX9f4UFcqgzmhQXum7SUO3Mt7bOfN7DQURp/Jg85tXl8AD95pZoO5taRSbj7LI
         FZ5DVbmDXli52GAX9btj6qrk7EPqyNgKbnm7p50oFzC9Er5jKZBX2Eb5mV3LI8Pw1FYo
         iCbg==
X-Gm-Message-State: AG10YOQHaiQRylMWSe7eTkUznzUQrLMYFGQ8GbCycftIO8fJIoBuydarDgHBa9ZutCvZEHZ49kw=
X-Received: by 10.194.114.164 with SMTP id jh4mr22483071wjb.153.1454334731961;
        Mon, 01 Feb 2016 05:52:11 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:09 -0800 (PST)
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
Subject: [PATCH v6 3/8] device_tree: introduce qemu_fdt_node_path
Date: Mon,  1 Feb 2016 13:51:47 +0000
Message-Id: <1454334712-12360-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: MmVEiC+F1sla

This new helper routine returns a NULL terminated array of
node paths matching a node name and a compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---
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
index 3797182..a89b838 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -230,6 +230,57 @@ static int findnode_nofail(void *fdt, const char *node_path)
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
1.9.1
