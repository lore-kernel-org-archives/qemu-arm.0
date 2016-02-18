Received: by 10.25.208.211 with SMTP id h202csp736886lfg;
        Thu, 18 Feb 2016 09:46:01 -0800 (PST)
X-Received: by 10.28.221.68 with SMTP id u65mr4842814wmg.95.1455817559470;
        Thu, 18 Feb 2016 09:45:59 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id 3si6734920wmk.45.2016.02.18.09.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x229.google.com with SMTP id g62so36156669wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9JcvusmsSYmq2iVVrVRlwyEMNqlP92VK7fOHUPeayJM=;
        b=SjLM9sPEcb4MGhyudKeA8i1ljhbCt75D2lGkMm7gMOjvpo3Uycu36AyeaQ55GhxeCW
         gWA3YpwXPGugQ0IHWHYTgpafB99a+aHMWt/wWIUAEtApGhEQ7a3DaXoMr7Z6wZsVtref
         HNVbHSinX91FOjjA536fyx5qhY6m8BXoisrrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9JcvusmsSYmq2iVVrVRlwyEMNqlP92VK7fOHUPeayJM=;
        b=R9Et4Ry8exy8m8K3h3a749W4Ezo+1aNyjG1ajqgCpOH8WsjepbP8BkFLqmc+vwb8qW
         otwG/cGzAu4eAn7uEyorPQp09Uf7fzAjDfnMq8SoycmcQMBGr5alyyGEgujKb9qIdx0l
         srJeNDNuqc79ZqVbTwP2qbSN4M/58KdfNiTPiFrwWyg2MGmoXvDGbiPE2hhoXWX+a0S7
         ZeDoJfMqZcQPT+ghX+1NQHm40K5X1R0ZX5t378xA8HVdQFGS/eSiJ8zOqdqj5ZqbKw6/
         1a/Rl127p/0P7DR9ZOW1gl+0rwMJHtvfXY8KOawcqMCBlBareWr2nit6psSYOVevjMys
         3qmA==
X-Gm-Message-State: AG10YORY8PUu5P6/jTk6AjJ8fdkrL6RBLUXjoAzj00JfIJQtuO2Ay+7OQK3/sJtjmJYXkSMaJy8=
X-Received: by 10.195.13.98 with SMTP id ex2mr8617418wjd.45.1455817559195;
        Thu, 18 Feb 2016 09:45:59 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.45.56
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:57 -0800 (PST)
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
Subject: [PATCH v7 2/8] device_tree: introduce load_device_tree_from_sysfs
Date: Thu, 18 Feb 2016 17:45:40 +0000
Message-Id: <1455817546-6564-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-TUID: ePZgG4/Iy4IR

This function returns the host device tree blob from sysfs
(/proc/device-tree). It uses a recursive function inspired
from dtc read_fstree.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v6 -> v7:
- rebase on d38ea87ac54af64ef611de434d07c12dc0399216:
  "all: Clean up includes"
- add Peter's R-b

v5 -> v6:
- fix some spelling mistakes
- error_report + exit replaced by error_setg
- const char *parent_node;
- use g_strdup_printf instead of g_strjoin
- add a doc comment for load_device_tree_from_sysfs
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
 include/sysemu/device_tree.h |   8 ++++
 2 files changed, 108 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index b1ad836..9e77c69 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -13,6 +13,10 @@
 
 #include "qemu/osdep.h"
 
+#ifdef CONFIG_LINUX
+#include <dirent.h>
+#endif
+
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -112,6 +116,102 @@ fail:
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
+ * leaves (property files).
+ *
+ * the function asserts in case of error
+ */
+static void read_fstree(void *fdt, const char *dirname)
+{
+    DIR *d;
+    struct dirent *de;
+    struct stat st;
+    const char *root_dir = SYSFS_DT_BASEDIR;
+    const char *parent_node;
+
+    if (strstr(dirname, root_dir) != dirname) {
+        error_setg(&error_fatal, "%s: %s must be searched within %s",
+                   __func__, dirname, root_dir);
+    }
+    parent_node = &dirname[strlen(SYSFS_DT_BASEDIR)];
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
+        tmpnam = g_strdup_printf("%s/%s", dirname, de->d_name);
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
index 359e143..62093ba 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -16,6 +16,14 @@
 
 void *create_device_tree(int *sizep);
 void *load_device_tree(const char *filename_path, int *sizep);
+#ifdef CONFIG_LINUX
+/**
+ * load_device_tree_from_sysfs: reads the device tree information in the
+ * /proc/device-tree directory and return the corresponding binary blob
+ * buffer pointer. Asserts in case of error.
+ */
+void *load_device_tree_from_sysfs(void);
+#endif
 
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
-- 
1.8.3.2
