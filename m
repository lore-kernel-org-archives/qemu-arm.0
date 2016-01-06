Received: by 10.182.158.201 with SMTP id ww9csp9813obb;
        Wed, 6 Jan 2016 07:13:33 -0800 (PST)
X-Received: by 10.28.65.85 with SMTP id o82mr11135177wma.23.1452093213700;
        Wed, 06 Jan 2016 07:13:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id y187si13152806wme.46.2016.01.06.07.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id f206so63340749wmf.0
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=aYK1z+GomKrm2mQW5BlGtrgEtuTvwcahyCxw6SwazbPCqnczYXciu83Zf9ZgfNJDZN
         yjbfRxTbDSDT+Dn/+ExabwueENMX3oTDQnZ086aHGB/TqBl5G7gHBmFSDEy2l5kZV1ho
         cJyMGm+EDENEmfI3i35Loj0daQWQNvDAC3pKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=g/leF3QdOzGQ/mIQyJ3didW3g38EpN+J+P4vGaU1u91k+rJhQoeVb/0v3yqZ4zGtYm
         Z+2XnE2RSPl1ejMcunuc/6bkgT5UYkikv2VM8DVUNmklh8cRp7aUU/0OL3/ZnItkpFND
         QpIjb5DUASC7WBYktvr+aLLTdf4GUfueI98NZPySHThpvzZzsr0vU8dv4Bd08t0E3S9d
         K3oaFSENnC6i3DJYv/0e+2w4mqc2kxk9kIDqfHNiVGLieWKctYd0C8ajrrgxviEBcA4q
         bWkLdQjymhTDmWoJAc3Yn7B96+uSOl2+glKLloDUvTSQTa3S4nsTsIjfNW61bvjhVnX0
         tOIA==
X-Gm-Message-State: ALoCoQlqRyMq9zgL7Mfl1x4JdJ565FA9D780Gy81BYaj3iR382VDL8+3mU7cCIaP+eMYrYHB81bhrGpb06x/+n0Z7zlQiXj6OA==
X-Received: by 10.28.210.143 with SMTP id j137mr10546921wmg.13.1452093213441;
        Wed, 06 Jan 2016 07:13:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:31 -0800 (PST)
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
Subject: [PATCH v2 3/7] device_tree: introduce qemu_fdt_node_path
Date: Wed,  6 Jan 2016 15:13:21 +0000
Message-Id: <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-TUID: nqZ9mG7r/m1m

This new helper routine returns the node path of a device
referred to by its node name and compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v1 -> v2:
- move doc comment in header file
- do not use a fixed size buffer
- break on errors in while loop
- use strcmp instead of strncmp

RFC -> v1:
- improve error handling according to Alex' comments
---
 device_tree.c                | 37 +++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 14 ++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index b262c2d..8441e01 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -231,6 +231,43 @@ static int findnode_nofail(void *fdt, const char *node_path)
     return offset;
 }
 
+int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                       char **node_path)
+{
+    int offset, len, ret;
+    const char *iter_name;
+    unsigned int path_len = 16;
+    char *path;
+
+    *node_path = NULL;
+    offset = fdt_node_offset_by_compatible(fdt, -1, compat);
+
+    while (offset >= 0) {
+        iter_name = fdt_get_name(fdt, offset, &len);
+        if (!iter_name) {
+            offset = len;
+            break;
+        }
+        if (!strcmp(iter_name, name)) {
+            goto found;
+        }
+        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
+    }
+    return offset;
+
+found:
+    path = g_malloc(path_len);
+    while ((ret = fdt_get_path(fdt, offset, path, path_len))
+            == -FDT_ERR_NOSPACE) {
+        path_len += 16;
+        path = g_realloc(path, path_len);
+    }
+    if (!ret) {
+        *node_path = path;
+    }
+    return ret;
+}
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index fdf25a4..269cb1c 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int *sizep);
 void *load_device_tree_from_sysfs(void);
 #endif
 
+/**
+ * qemu_fdt_node_path: return the node path of a device, given its
+ * node name and its compat string
+ * @fdt: pointer to the dt blob
+ * @name: device node name
+ * @compat: compatibility string of the device
+ * @node_path: returned node path
+ *
+ * upon success, the path is output at node_path address
+ * returns 0 on success, < 0 on failure
+ */
+int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                       char **node_path);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
1.9.1
