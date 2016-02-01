Received: by 10.25.159.19 with SMTP id i19csp69055lfe;
        Mon, 1 Feb 2016 05:52:08 -0800 (PST)
X-Received: by 10.194.175.233 with SMTP id cd9mr23147348wjc.115.1454334728329;
        Mon, 01 Feb 2016 05:52:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id i142si11911829wmd.8.2016.02.01.05.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id 128so72013328wmz.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dpWR8FrYfJ7ho70USPISaY5ycJtgvTai147bAGyadPA=;
        b=dUmmcWVcSy6PDrjjBckw9PV5u/V2epeKf4DaTPWV5RnKkcc+rPTobnk/5+Qi/Uz6n+
         5CFbTepm97dP6UjWpb7B5A429lAZw+CTq6D8TB5V0R4iNyS08uQBCDosBqXLtepVOsp2
         r/Xr1uM+T6X2JRwDQ862SfaTfPW2AocU38ze8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dpWR8FrYfJ7ho70USPISaY5ycJtgvTai147bAGyadPA=;
        b=giKg0askJ1Qw9QYz0M8dXgYEGZ1/R6g1zFSFZREgd3OJzZN4XPdWPq0xCuUBnObpWP
         8OCohJDYcDMkaLgK0PQs5Oth0Jg079w3wusNIU4Jv6T7MBq5LI68I7sd6ol8rjgNtqxK
         W+nN2uxpO4XFzH7fFxxb41ScLkFBe0ThkUrq5wrgVMmct6F6jyTaPZhXL3+OJYjo/zt6
         rDuXpeBPWdIlxcGFEpaZaRG+MiRPzSjYOQt3FORKQqi8AKQk6nDP8ZFYzMhfeH+nX+Fo
         m9xOb5dzxhYqVqNF0GP7GBXuYax+DrtZCxPo1sOXcDLLNVPsqess5CPIwfxHSSvPx83M
         6FIg==
X-Gm-Message-State: AG10YOTJYlZAS3axjwZQAP3ZuuH0QMBmzrXdIAtYjKZHrPCOrnAujJ1zJ0iqHaQECOTUthRkd8Q=
X-Received: by 10.194.52.72 with SMTP id r8mr22436033wjo.148.1454334728140;
        Mon, 01 Feb 2016 05:52:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:06 -0800 (PST)
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
Subject: [PATCH v6 2/8] device_tree: introduce load_device_tree_from_sysfs
Date: Mon,  1 Feb 2016 13:51:46 +0000
Message-Id: <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: rGa+BLGERBF9

This function returns the host device tree blob from sysfs
(/proc/device-tree). It uses a recursive function inspired
from dtc read_fstree.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---
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
 device_tree.c                | 99 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h |  8 ++++
 2 files changed, 107 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index a9f5f8e..3797182 100644
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
@@ -117,6 +120,102 @@ fail:
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
1.9.1
