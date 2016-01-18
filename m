Received: by 10.25.159.19 with SMTP id i19csp1973719lfe;
        Mon, 18 Jan 2016 07:16:57 -0800 (PST)
X-Received: by 10.194.175.104 with SMTP id bz8mr23495588wjc.8.1453130217007;
        Mon, 18 Jan 2016 07:16:57 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id r124si25849043wmd.119.2016.01.18.07.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2016 07:16:56 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x233.google.com with SMTP id 123so56405214wmz.0
        for <alex.bennee@linaro.org>; Mon, 18 Jan 2016 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6zp0hE3IsjZrSlBMjB+nIk2FRq6C63JD1DVcNPF4S4U=;
        b=WlxD4Ix/ef3mD3IuZJQOf5So1W0gQfn8gB2CtVS+Yvn2krb8q2DGFX9wyr4ho2kJxo
         OdbsZZ/0+1nmtrHKjjgeCVUzbJHmfaMoBj94GRhvp9PNudjXyFe3U0UDfv12ATNRlIRe
         jMLyYQpr0TWGFffboxoSnu5Q6llFfVfNW2vvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6zp0hE3IsjZrSlBMjB+nIk2FRq6C63JD1DVcNPF4S4U=;
        b=iT+163zQmHAm8sKOkxTZ7Gb4xxyrIqMveMNacOnWfO73o3qKmdVfFl4J3JGdJXKlmN
         +xAkPur9UBq9PjzleK/9VIsxUUSlQY8CM+cFhwZw4FupcFDhevp4s1CHC2HJ+y8qxqky
         v7JD5DVj1J45IGsSHPvZc7lM2dvf0Obu+O6wZLa+erj8sY2KTe6sNxCs+OBPCQ+k74CX
         gJ182HrS7YSiivyTgROcH8R3mXzRz5vw7i83M4gxoK5+mi8PdWXE4b1CnSKK6QYW1m2S
         cFKsVEMBhRyx6lRh7CVgR4z1iDUl+iQcBGzDy5NygGQ8rMIzInY5kbTwMPe1SQGGwq2O
         4G8A==
X-Gm-Message-State: ALoCoQkBD1IMvwVrBuPItxTHJnT5yJca9m/lRY42Z5WDmdX522VDRCzxW8gHOcwJJ2cQylOP23YSzXrY8MA+Bf1Havpu+ENXlQ==
X-Received: by 10.194.20.5 with SMTP id j5mr24767018wje.71.1453130216842;
        Mon, 18 Jan 2016 07:16:56 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-9.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id o7sm24230067wjf.45.2016.01.18.07.16.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 07:16:55 -0800 (PST)
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
Subject: [PATCH v5 3/8] device_tree: introduce qemu_fdt_node_path
Date: Mon, 18 Jan 2016 15:16:39 +0000
Message-Id: <1453130204-655-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
X-TUID: UnqjacjgW9wV

This new helper routine returns a NULL terminated array of
node paths matching a node name and a compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

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
 device_tree.c                | 49 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 14 +++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index b262c2d..3c88a37 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -231,6 +231,55 @@ static int findnode_nofail(void *fdt, const char *node_path)
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
index fdf25a4..436b5dd 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int *sizep);
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
+ * Use g_strfreev() to free it.
+ */
+char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                          Error **errp);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
1.9.1
