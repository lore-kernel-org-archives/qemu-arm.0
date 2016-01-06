Received: by 10.182.158.201 with SMTP id ww9csp9787obb;
        Wed, 6 Jan 2016 07:13:31 -0800 (PST)
X-Received: by 10.194.123.8 with SMTP id lw8mr107896045wjb.72.1452093211266;
        Wed, 06 Jan 2016 07:13:31 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com. [2a00:1450:400c:c09::231])
        by mx.google.com with ESMTPS id x203si13141014wmb.33.2016.01.06.07.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) client-ip=2a00:1450:400c:c09::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x231.google.com with SMTP id f206so79943750wmf.0
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fyo/zUr7Z8b70EQnLIZRqeVkx1MHZR78WEB5QlMVEGk=;
        b=W5EHQfFtklCzXNV765ytG4EsP51uVxBeexKGFyfIqYIHR0/iqq0JsZtHNu7vEu82Mz
         uyLXRT2rJM1zNPQSibe/ih+g85hZvGQ9susjgv2NcVI6Ru9ITl/NKo3NyHOAfzdv11ER
         kDWWf/41/ZDzs9mdeiQ+dPyqwXz/MV0BVhYvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fyo/zUr7Z8b70EQnLIZRqeVkx1MHZR78WEB5QlMVEGk=;
        b=V2wFFxYpxUt+O20Ac5HRiA5hnPwUo+he3UPb7ngDeN4JmydLZTk2eIjTFX++bWFJ6c
         gK4mf4KCiS+R3Y3RVF7PeRg61YxRmFY6Vg262VjXTv2zvjKis6TpIZMJ+qxaPWsTxNeN
         eTo/Jok1zmVAXJbHCX2ctHfO4p2+FlNZKWfhvwNT4wPKqL4R7ScPkcyhQAzwqO5notDk
         Unm4fFZ9VF97P/4PeJk2rbwEFqUMYFn+bfjSM8XeI0XZoFPD7OQzkqpPI+SUVUdnjOi3
         tyG7Dfl4SVhU0W/uoCBw1Nr71e4GCvktt21tgaa9P7uLObMZFCiDH5aE7heZQWc4Fi2r
         gMXg==
X-Gm-Message-State: ALoCoQn+c2U+unnBn99EcmH6MwWk5crNSFKrj1dbrAuVm4ra23HuADcX+za7EXUCEFQ9fd0Pk6+hAn/QCy3RIxUxx9b4/nD56Q==
X-Received: by 10.194.94.41 with SMTP id cz9mr96143837wjb.169.1452093210951;
        Wed, 06 Jan 2016 07:13:30 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:29 -0800 (PST)
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
Subject: [PATCH v2 2/7] device_tree: introduce load_device_tree_from_sysfs
Date: Wed,  6 Jan 2016 15:13:20 +0000
Message-Id: <1452093205-30167-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-TUID: XvzdBpzEa2Wt

This function returns the host device tree blob from sysfs
(/proc/device-tree). It uses a recursive function inspired
from dtc read_fstree.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---
v1 -> v2:
- do not implement/expose read_fstree and load_device_tree_from_sysfs
  if CONFIG_LINUX is not defined (lstat is not implemeted in mingw)
- correct indentation in read_fstree
- use /proc/device-tree symlink instead of /sys/firmware/devicetree/base
  path (kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw)
- use g_file_get_contents in read_fstree
- introduce SYSFS_DT_BASEDIR macro and use strlen
- exit on error in load_device_tree_from_sysfs
- user error_setg

RFC -> v1:
- remove runtime dependency on dtc binary and introduce read_fstree
---
 device_tree.c                | 100 +++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h |   3 ++
 2 files changed, 103 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index a9f5f8e..b262c2d 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -17,6 +17,9 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <stdlib.h>
+#ifdef CONFIG_LINUX
+#include <dirent.h>
+#endif
 
 #include "qemu-common.h"
 #include "qemu/error-report.h"
@@ -117,6 +120,103 @@ fail:
     return NULL;
 }
 
+#ifdef CONFIG_LINUX
+
+#define SYSFS_DT_BASEDIR "/proc/device-tree"
+
+/**
+ * read_fstree: this function is inspired from dtc read_fstree
+ * @fdt: preallocated fdt blob buffer, to be populated
+ * @dirname: directory to scan under SYSFS_DT_BASEDIR
+ * the search is recursive and the tree is searched down to the
+ * leafs (property files).
+ *
+ * the function self-asserts in case of error
+ */
+static void read_fstree(void *fdt, const char *dirname)
+{
+    DIR *d;
+    struct dirent *de;
+    struct stat st;
+    const char *root_dir = SYSFS_DT_BASEDIR;
+    char *parent_node;
+
+    if (strstr(dirname, root_dir) != dirname) {
+        error_report("%s: %s must be searched within %s",
+                     __func__, dirname, root_dir);
+        exit(1);
+    }
+    parent_node = (char *)&dirname[strlen(SYSFS_DT_BASEDIR)];
+
+    d = opendir(dirname);
+    if (!d) {
+        error_setg(&error_fatal, "%s cannot open %s", __func__, dirname);
+    }
+
+    while ((de = readdir(d)) != NULL) {
+        char *tmpnam;
+
+        if (!g_strcmp0(de->d_name, ".")
+            || !g_strcmp0(de->d_name, "..")) {
+            continue;
+        }
+
+        tmpnam = g_strjoin("/", dirname, de->d_name, NULL);
+
+        if (lstat(tmpnam, &st) < 0) {
+            error_setg(&error_fatal, "%s cannot lstat %s", __func__, tmpnam);
+        }
+
+        if (S_ISREG(st.st_mode)) {
+            gchar *val;
+            gsize len;
+
+            if (!g_file_get_contents(tmpnam, &val, &len, NULL)) {
+                error_setg(&error_fatal, "%s not able to extract info from %s",
+                           __func__, tmpnam);
+            }
+
+            if (strlen(parent_node) > 0) {
+                qemu_fdt_setprop(fdt, parent_node,
+                                 de->d_name, val, len);
+            } else {
+                qemu_fdt_setprop(fdt, "/", de->d_name, val, len);
+            }
+            g_free(val);
+        } else if (S_ISDIR(st.st_mode)) {
+            char *node_name;
+
+            node_name = g_strdup_printf("%s/%s",
+                                        parent_node, de->d_name);
+            qemu_fdt_add_subnode(fdt, node_name);
+            g_free(node_name);
+            read_fstree(fdt, tmpnam);
+        }
+
+        g_free(tmpnam);
+    }
+
+    closedir(d);
+}
+
+/* load_device_tree_from_sysfs: extract the dt blob from host sysfs */
+void *load_device_tree_from_sysfs(void)
+{
+    void *host_fdt;
+    int host_fdt_size;
+
+    host_fdt = create_device_tree(&host_fdt_size);
+    read_fstree(host_fdt, SYSFS_DT_BASEDIR);
+    if (fdt_check_header(host_fdt)) {
+        error_setg(&error_fatal,
+                   "%s host device tree extracted into memory is invalid",
+                   __func__);
+    }
+    return host_fdt;
+}
+
+#endif /* CONFIG_LINUX */
+
 static int findnode_nofail(void *fdt, const char *node_path)
 {
     int offset;
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 359e143..fdf25a4 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -16,6 +16,9 @@
 
 void *create_device_tree(int *sizep);
 void *load_device_tree(const char *filename_path, int *sizep);
+#ifdef CONFIG_LINUX
+void *load_device_tree_from_sysfs(void);
+#endif
 
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
-- 
1.9.1
