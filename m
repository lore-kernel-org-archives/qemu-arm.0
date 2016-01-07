Received: by 10.182.158.201 with SMTP id ww9csp659367obb;
        Thu, 7 Jan 2016 07:50:34 -0800 (PST)
X-Received: by 10.194.9.42 with SMTP id w10mr75704039wja.159.1452181830328;
        Thu, 07 Jan 2016 07:50:30 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id n10si12820729wmd.64.2016.01.07.07.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id l65so102299987wmf.1
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=Mu5PdS9fFfDMireLgbSS1zrMoHov9253DoSIJHPMX/2VGocJau62h+Gb0+tPJM7Au0
         7IpHvg8Dg/PzsatfcvWTTAZ5Fv9KQwVgbngGoQ2/+TxMClGsiEcIzL+GDzpe3EF+vjQt
         u6guUUTtuP4eQfPxgyxAGVo9J8rjy3lvk+P1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=eRDmj0r8YrmXdgJG9BqhNXuP2ndXPf5nAKteT+OoUWs5ihp5pv3KLUWEPU06RtWbwa
         48b6Vozo6anXxJzZwV3yy8VPFiiDsXoSqXdDcuI76t/gMwWDf396tiVhKD3mkIXksNdD
         iqY9KjQMYObyRzwrkZRJEF7dlCUDDhpiYHVx8Sifc6gpUaA387sVH4Nt424muTzKLXt3
         uLq85gpyUysLpou6ZvIdsIl2dspzfAT6/edXdFvg2cQZWxuUsJNqBKp8MmsxE1Myx7aI
         OLBDc+o+Psx9QD6GbB1t8axw/4nPNl4q7mzOfLw206IX5zAeRFrzjzlwGmy4YCL2y96I
         ++FA==
X-Gm-Message-State: ALoCoQmSRIS3/X4iXedYVU5q29T15JuMglSIlTidmZK9oLwZI3brnjTXI/6MYkJv47By59buBiXqzCOuL4vy+TSH+upz6SEomQ==
X-Received: by 10.28.73.135 with SMTP id w129mr18628768wma.55.1452181830002;
        Thu, 07 Jan 2016 07:50:30 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:28 -0800 (PST)
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
Subject: [PATCH v3 3/8] device_tree: introduce qemu_fdt_node_path
Date: Thu,  7 Jan 2016 15:50:10 +0000
Message-Id: <1452181815-1948-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: XzWftV0p3GC+

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
