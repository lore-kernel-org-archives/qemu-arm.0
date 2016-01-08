Received: by 10.25.134.130 with SMTP id i124csp325871lfd;
        Fri, 8 Jan 2016 01:32:20 -0800 (PST)
X-Received: by 10.28.217.83 with SMTP id q80mr20999919wmg.15.1452245540351;
        Fri, 08 Jan 2016 01:32:20 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id w192si26371012wme.65.2016.01.08.01.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x233.google.com with SMTP id b14so162051766wmb.1
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=d+9lXELyZKQ3Il4hbMW5UN+MLkkFaFg3HdE3matPBuQodOuaFTd6lHikbqkOT/ksdT
         c+8z0dcw7EjDivqujEXiQbfgBmnbU0uRsyrDp5MoM44pZNWyWmPmrpTVOHtPlo7FNloX
         q4OXkhqfHsBZbB2EsD3zR2Axio6wlbQACjmNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kV6N27qiuswlag2H1s2evzjNV+nHFfWWVrGZ4zJiJ3s=;
        b=dnk7iT3UNqNR5/VqGhS0yHzplszDDobYDzm1li4AE+XD6fMiQrKPQSVxoRV/gRdsBw
         15+oz7u/nC3yJab71f0qKH5PBBIpLOYh6DtAKlUI94JqH0uZ0laZSLri2+wQCyodpABW
         LFnbUlVCOPu1nqxVOQwYVmbkKXBX24UsjYJw7ydPtaPjUgj/QvFYqJks3zLhFCXvFQMo
         8BfUXksnV6O8JR7IVWdf52KYnNuY6gS8XRJyPZHv2VTXh/SmpoSpB1xtvuUwD3DLrnHC
         rQ+oUKq3pI/248X92u75UtbtEl3eTV4DEzdkTxMrhJ0JsDBiVNpaTXsPsI9RqI7KTOvW
         GDcg==
X-Gm-Message-State: ALoCoQk5VQMoZWK1gwvOXTT7eNejV1X7Aky4AVQzwWyIIG2qKqrdRsmZrW6BgGLrrHzlWw8U0vhPbbjaxtdr1zbIgLzD3sm7kw==
X-Received: by 10.28.17.8 with SMTP id 8mr20444699wmr.65.1452245540159;
        Fri, 08 Jan 2016 01:32:20 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:18 -0800 (PST)
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
Subject: [PATCH v4 3/8] device_tree: introduce qemu_fdt_node_path
Date: Fri,  8 Jan 2016 09:32:00 +0000
Message-Id: <1452245525-3886-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-TUID: rAM6wzQpl54K

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
