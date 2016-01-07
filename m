Received: by 10.182.158.201 with SMTP id ww9csp659343obb;
        Thu, 7 Jan 2016 07:50:32 -0800 (PST)
X-Received: by 10.28.13.138 with SMTP id 132mr18523292wmn.62.1452181827961;
        Thu, 07 Jan 2016 07:50:27 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com. [2a00:1450:400c:c09::231])
        by mx.google.com with ESMTPS id l75si20614419wmd.47.2016.01.07.07.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) client-ip=2a00:1450:400c:c09::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x231.google.com with SMTP id u188so103747303wmu.1
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fyo/zUr7Z8b70EQnLIZRqeVkx1MHZR78WEB5QlMVEGk=;
        b=K2AzXUa1tyD3t66IQ/oORNnvUtnkHuTHI5K/aYzDB5PUqUPzyvSHreARa17PtjUYwl
         4QqFxluFQIAKQXG+pECdnb/c+yFrb/7A1KBElRiWqCdv5lkiRfmPjldhxHFHUNkEYsUB
         gvHZv0iCR9VcVsx8I3NsMcNtQW0WCb6gsIrCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fyo/zUr7Z8b70EQnLIZRqeVkx1MHZR78WEB5QlMVEGk=;
        b=B4jvfVBp08/i2mMNeclRSo+0k7kV7XU9F5+5JaTXF5yrwbt4YeDG9b6CFQJ0V2YUb2
         IvrMzu3+TijeRmoE+mryUoviZ67KKFcju6fCES9JQfWVjX949R6jkxCr621TponTF/ui
         qUIX/x9ibvWPmDd7Re8vBKNXNVHxMUwdPx+Y53bXhznayXZfB1WaFm7HUSq/u2thjJMg
         7BbtvSEiSHINM28Z9UKkWybLRODHEyXqfd//oFGyonjfixdjFxf4ud5Lohto8Y3avFf9
         pzjKBoQ91zMcoWpc6RFrAzV7DQ8xjgl84n1lJ8mNn1AzOpA91Q3fhghmBGXNVTkT7iV4
         rWew==
X-Gm-Message-State: ALoCoQlk85k1mux8W5GnHAFatYDjRgcNft35W9jxx3iNbdkJAO/BYA12Ybbj4/B9l2Py4zEL/JM3CtzmMKSMAAfovjkSL1ZYcA==
X-Received: by 10.28.24.85 with SMTP id 82mr18241707wmy.58.1452181827617;
        Thu, 07 Jan 2016 07:50:27 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:26 -0800 (PST)
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
Subject: [PATCH v3 2/8] device_tree: introduce load_device_tree_from_sysfs
Date: Thu,  7 Jan 2016 15:50:09 +0000
Message-Id: <1452181815-1948-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: kYbDFT5Zlst7

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
